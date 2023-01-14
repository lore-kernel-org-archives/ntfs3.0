Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084062A
	for <ntfs3@lists.linux.dev>; Sat, 14 Jan 2023 02:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=74KRn/WgSdvJmqYfjiwNGGkvvAj0uPAMBNYbHuPHbjs=; b=huNOkAyxhYJo4GwXzpW8tPmPC5
	6GX7BL2QzeT0nl++2ulk/dLs8DRdkaQ77WbJcnnsZ5KnlrNsBVsQr1vwyro+wd50qEUl+gwwjtkCB
	E9OoXImHRD2gOS6dbnX3rao6/6qAzqVu9H79Zjvl8U8T46dmOm8jl9AM+V3IKldKKvQgdIhoVQR1g
	oquR1PI4gfLxAuAe1jGiurFoMdzceRJzDyw3YqAOg2QG2uEhmZdQq6H3v9cUl923P7W9SFJUGUosm
	WVy3+vvMvvlncxot/Tx9hhW3AwOlxAQDTF9mXixUI2DOnBbFsTpmWicBi6frNAobkh25HTAll3v7T
	y9NR0dCw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pGW3Q-001lrE-22;
	Sat, 14 Jan 2023 02:13:56 +0000
Date: Sat, 14 Jan 2023 02:13:56 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, edward.lo@ambergroup.io,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	TOTE Robot <oslab@tsinghua.edu.cn>
Subject: Re: [PATCH resend] fs: ntfs3: Add check for mft_ni in mi_read()
Message-ID: <Y8IP5JJW/wPy/Wb4@ZenIV>
References: <20230114015441.777119-1-baijiaju1990@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230114015441.777119-1-baijiaju1990@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Jan 14, 2023 at 09:54:41AM +0800, Jia-Ju Bai wrote:
> In a previous commit 2681631c2973, the parameter ni of
> attr_load_runs_vcn() can be NULL, and thus a NULL check is added.
> 
> However, in the same call stack, this variable is also dereferenced in
> mi_read():
> 
> mi_read()
>   ni_lock(mft_ni);
>     attr_load_runs_vcn(mft_ni)
>       if (ni) -> Add a check by previous commit (ni is mft_ni)
>   ni_unlock(mft_ni);
> 
> Thus, to avoid possible null-pointer dereferences, mft_ni should be
> also checked in mi_read().
> 
> These results are reported by a static tool designed by myself

No, it should not.  ni_lock(mft_ni) is called only if rw_lock
is not NULL.  The only assignment of non-NULL to that variable is
here:

        if (is_mounted(sbi)) {
                if (!is_mft) {
                        rw_lock = &mft_ni->file.run_lock;
                        down_read(rw_lock);
                }
        }

Note that it would have already oopsed had mft_ni been NULL.

The logics might or might not be wrong there, but could we please
stop obfuscating it by checks piled higher and deeper just in case?

Incidentally, I hope the pattern that triggered here is not

	f() checks for its argument being NULL, one of the callers of f() passes it a pointer
	therefore that pointer might be NULL

for obvious reasons...
