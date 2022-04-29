Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B51851
	for <ntfs3@lists.linux.dev>; Fri, 29 Apr 2022 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pk0Qy8fd9eEtcmT3jiI4Z1QGWEupJft65qWtvAfYt7E=; b=P7QUNxw4eQFb4RzJ+oTq/5FMUD
	RVcS+4Pi0BFvhkO/pY2dbIpIq7RWaYo7lljcaQJr2GV5GqvnQpNuzT9pRiCcWA2LE1BT4sFPabRhn
	rBzreFjQa47pkWckgQF4+vSsG5Kqmee9Z5WwHDhKFlwWXCFM8AxfZWBXx/DalIPNf7QlS7nXNa/gd
	bU5+E/+/7lRe9rmYQRBOjZtzXMKeqRMfXCj8m7+MZBQCGqFfFzJ2Mkc8on9/W4LYHBYOBD1c99RXd
	tV/4vzrUZFt8cJaLJbmNfMwq+JP4gAaqzwfsul50yYSCgQ5ZkvpfdNGJ3KnWKSEo+iAC13VwutZ0T
	58pd0SDA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkUbl-00CeT9-4V; Fri, 29 Apr 2022 17:40:45 +0000
Date: Fri, 29 Apr 2022 18:40:45 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-fsdevel@vger.kernel.org,
	syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kari Argillander <kari.argillander@stargateuniverse.net>,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [PATCH] fs/ntfs3: validate BOOT sectors_per_clusters
Message-ID: <YmwjHVngLrZq4vpD@casper.infradead.org>
References: <20220429172711.31894-1-rdunlap@infradead.org>
 <YmwixlgHg8n4NsOd@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmwixlgHg8n4NsOd@casper.infradead.org>

On Fri, Apr 29, 2022 at 06:39:18PM +0100, Matthew Wilcox wrote:
> This hurts my brain.  Can we do instead:
> 
> 	if (boot->sectors_per_clusters <= 0x80)
> 		return boot->sectors_per_clusters;
> 	if (boot->sectors_per_clusters < 0xA0)
> 		return 1U << (boot->sectors_per_clusters - 0x80);
> 	return -1;

Changed my mind; 0xffffffff is clearer than returning -1 from a
function which is typed to return an unsigned value.

> >  /*
> > @@ -713,7 +714,7 @@ static int ntfs_init_from_boot(struct su
> >  
> >  	/* cluster size: 512, 1K, 2K, 4K, ... 2M */
> >  	sct_per_clst = true_sectors_per_clst(boot);
> > -	if (!is_power_of_2(sct_per_clst))
> > +	if ((int)sct_per_clst < 0 || !is_power_of_2(sct_per_clst))
> >  		goto out;
> 
> Do we need this change?  Presumably -1 is not a power of 2 ...

And this question then answers itself.  0xffffffff is definitely
not a POT.
