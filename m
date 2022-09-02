Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7831EA0
	for <ntfs3@lists.linux.dev>; Fri,  2 Sep 2022 01:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AHoA94Hk0V1+0HXqlkIbJPhRwQPwm6frNDZtWCI6wa4=; b=dmkbGZng4M+5yesbaSJIyzSR+G
	SgZbfUxTIzQOoqEgJOgYQyTbTpEmNrepfK0p5bbL7T3+4dyC50bL7mdWHuenxQfkVNiuGPWVVgzD2
	XiZGRxWe+23+Lxq5+KmtXd4dgeBuM1yxgWyq6E9DpGv9YZUQ/MHtTjgPPa3VGECxozbv0Yh9vGvdi
	nFlmbUF1s73SuRIdGPhXlm208Z9Cj5Dyr72/rJaSqPIpigLDmmLr4BLYqMUs9z0zuEkaMgGDWdpCU
	SSgWvJy5sf2CjXO7IboSmtjpMkxEVrW04qP5174UeR94zvkXLDnpEdQRk/8wjIVAcrnQFbHS2l8/B
	Y3uRWgqg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
	id 1oTvpr-00BBC1-SY;
	Fri, 02 Sep 2022 01:51:07 +0000
Date: Fri, 2 Sep 2022 02:51:07 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu,
	akpm@linux-foundation.org, axboe@kernel.dk, rpeterso@redhat.com,
	agruenba@redhat.com, almaz.alexandrovich@paragon-software.com,
	mark@fasheh.com, dushistov@mail.ru, hch@infradead.org,
	chengzhihao1@huawei.com, yukuai3@huawei.com
Subject: Re: [PATCH v2 13/14] ext2: replace bh_submit_read() helper with
 bh_read_locked()
Message-ID: <YxFhi1iJ2cFfKi04@ZenIV>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-14-yi.zhang@huawei.com>
 <YxFOqimAyJNxuPM9@ZenIV>
 <3fdab5fd-1efa-9668-da5c-889e9bfa1524@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fdab5fd-1efa-9668-da5c-889e9bfa1524@huawei.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Sep 02, 2022 at 09:32:53AM +0800, Zhang Yi wrote:
> On 2022/9/2 8:30, Al Viro wrote:
> > On Thu, Sep 01, 2022 at 09:35:04PM +0800, Zhang Yi wrote:
> >> bh_submit_read() and the uptodate check logic in bh_uptodate_or_lock()
> >> has been integrated in bh_read() helper, so switch to use it directly.
> > 
> > s/bh_read_locked/bh_read/ in the summary?
> > 
> 
> Sorry, I don't get your question, I have already replace bh_read_locked()
> with bh_read() in the commit message, there is no bh_read_locked in the whole
> patch. Am I missing something?

Take a look at the subject ;-)
