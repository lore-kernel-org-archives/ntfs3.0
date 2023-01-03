Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C8625
	for <ntfs3@lists.linux.dev>; Tue,  3 Jan 2023 08:01:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E6FAF60A93;
	Tue,  3 Jan 2023 08:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1672732893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9oyWaRXlIzBFaCON804thbmLR23DiivRnrdBiLJeOLM=;
	b=cAINTZ+5eHmaWfCgedo/S6rBGsaY2VUMQlnvDXlxLROEjEJgpsKRXNDnH6aLCggXD9PJTk
	oCuJYv8BjwdztUpFS8oLydI9dJgLTWK19roM3TtZzMnRyIUpoAi8hCaV1Iaktsmwg5Hzdo
	KvHqeVXcg7BaAUIico6T3/XYDADXt8w=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA553139F1;
	Tue,  3 Jan 2023 08:01:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dm9xLt3gs2OMeAAAMHmgww
	(envelope-from <mhocko@suse.com>); Tue, 03 Jan 2023 08:01:33 +0000
Date: Tue, 3 Jan 2023 09:01:33 +0100
From: Michal Hocko <mhocko@suse.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com, linux-mm <linux-mm@kvack.org>
Subject: Re: [PATCH] fs/ntfs3: Use __GFP_NOWARN allocation at
 ntfs_load_attr_list()
Message-ID: <Y7Pg3RtxjA8uTcfu@dhcp22.suse.cz>
References: <00000000000027524405f1452ea8@google.com>
 <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>
 <Y7M8bwYAzyuYbmP3@dhcp22.suse.cz>
 <38352801-b4ae-0cdc-17ba-06b363da3aa6@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38352801-b4ae-0cdc-17ba-06b363da3aa6@I-love.SAKURA.ne.jp>

On Tue 03-01-23 09:49:22, Tetsuo Handa wrote:
> On 2023/01/03 5:19, Michal Hocko wrote:
> >> @@ -52,7 +52,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
> >>  
> >>  	if (!attr->non_res) {
> >>  		lsize = le32_to_cpu(attr->res.data_size);
> >> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
> >> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
> > 
> > This looks like a bad idea in general. The allocator merely says that
> > something is wrong and you are silencing that. The calling code should
> > check the size for reasonable range and if larger size. Moreover, if
> > lsize can be really more than PAGE_SIZE this should be kvmalloc instead.
> 
> There are already similar commits.
> 
>   commit 0d0f659bf713 ("fs/ntfs3: Use __GFP_NOWARN allocation at wnd_init()")
>   commit 59bfd7a483da ("fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_fill_super()")

Bad examples to follow.

> Is KMALLOC_MAX_SIZE intended to be used by callers like
> 
>   https://linux.googlesource.com/linux/kernel/git/torvalds/linux/+/a5a1e1f249db4e0a35d3deca0b9916b11cc1f02b%5E!
> 
> ?

Nope, this doesn't look right either. This all is about inhibiting the
warning much more than actually fixing the underlying problem which
would be either check against a _specification_ based or _reasonable_
expectation based range or using kvmalloc instead if the range is not
well defined.

> I think that, unless there is a known upper limit defined by specification,
> checking for overflow and silence like
> 
>   https://lkml.kernel.org/r/6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp
> 
> is fine. These input are random values which do not need to succeed by using kvmalloc().

How can you tell the value is just a random noise or a relevant value
that people would actually want to succeede? Answer to that question
gives you a hint on how to address the issue.

-- 
Michal Hocko
SUSE Labs
