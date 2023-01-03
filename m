Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBBA138D
	for <ntfs3@lists.linux.dev>; Tue,  3 Jan 2023 08:13:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B41F60B03;
	Tue,  3 Jan 2023 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1672733585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rMHQUOAHmTg3wO8jl3EtVLVU5btU1+IUye1p3QH4BgY=;
	b=VZI6wB8m0hSplwKxNnwO4QnNP833alU3sEYqyVwgzpugy2N5daS5PT2JCwi4ydw3JOMC/L
	50aQGmjI7pAbvUm9gxjQEz9g4aTnp0RhR7L6tT5JJyM/h1tilicFecw1GWQbik+VQA3aeb
	BgmLpiqWvxnUhYUX/n78pz+U/oUz9fA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDE82139F1;
	Tue,  3 Jan 2023 08:13:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OGFQM5Djs2NwfgAAMHmgww
	(envelope-from <mhocko@suse.com>); Tue, 03 Jan 2023 08:13:04 +0000
Date: Tue, 3 Jan 2023 09:13:04 +0100
From: Michal Hocko <mhocko@suse.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com, linux-mm <linux-mm@kvack.org>
Subject: Re: [PATCH] fs/ntfs3: Use __GFP_NOWARN allocation at
 ntfs_load_attr_list()
Message-ID: <Y7PjkN+2lhlO8/kK@dhcp22.suse.cz>
References: <00000000000027524405f1452ea8@google.com>
 <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>
 <Y7M8bwYAzyuYbmP3@dhcp22.suse.cz>
 <38352801-b4ae-0cdc-17ba-06b363da3aa6@I-love.SAKURA.ne.jp>
 <Y7Pg3RtxjA8uTcfu@dhcp22.suse.cz>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7Pg3RtxjA8uTcfu@dhcp22.suse.cz>

On Tue 03-01-23 09:01:34, Michal Hocko wrote:
> On Tue 03-01-23 09:49:22, Tetsuo Handa wrote:
> > On 2023/01/03 5:19, Michal Hocko wrote:
> > >> @@ -52,7 +52,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
> > >>  
> > >>  	if (!attr->non_res) {
> > >>  		lsize = le32_to_cpu(attr->res.data_size);
> > >> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
> > >> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
> > > 
> > > This looks like a bad idea in general. The allocator merely says that
> > > something is wrong and you are silencing that. The calling code should
> > > check the size for reasonable range and if larger size. Moreover, if
> > > lsize can be really more than PAGE_SIZE this should be kvmalloc instead.
> > 
> > There are already similar commits.
> > 
> >   commit 0d0f659bf713 ("fs/ntfs3: Use __GFP_NOWARN allocation at wnd_init()")
> >   commit 59bfd7a483da ("fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()")
> 
> Bad examples to follow.
> 
> > Is KMALLOC_MAX_SIZE intended to be used by callers like
> > 
> >   https://linux.googlesource.com/linux/kernel/git/torvalds/linux/+/a5a1e1f249db4e0a35d3deca0b9916b11cc1f02b%5E!
> > 
> > ?
> 
> Nope, this doesn't look right either. This all is about inhibiting the
> warning much more than actually fixing the underlying problem which
> would be either check against a _specification_ based or _reasonable_
> expectation based range or using kvmalloc instead if the range is not
> well defined.

Let me clarify some more because there are two things happening here.

kvmalloc (or its variants) should be used whenever there is a risk the
allocation request size is large (>>PAGE_SIZE) sounds like reasonable
rule of thumb because those allocations shouldn't put an additional
pressure on a fragmented system.

Any user input, and that applies to potentially crafted fs images,
should be checked for runaway values. If there is specification in
place then this is no brainer. If the value is not well specified then
there should be reasonable defensive checking done. KMALLOC_MAX_SIZE
doesn't sound like a good fit for the check as that is an internal
implementation specific constant for a particular memory allocator.
vmalloc allows much larger allocations and sometime that is a reasonable
thing to allow. So those checks should be domain specific.

-- 
Michal Hocko
SUSE Labs
