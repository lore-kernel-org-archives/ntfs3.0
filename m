Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C50568A
	for <ntfs3@lists.linux.dev>; Mon,  2 Jan 2023 20:20:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCFB05CC9A;
	Mon,  2 Jan 2023 20:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1672690800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R4FqZ1Q4Ru2AyNRV8iY0v3yjwFpv2y8dFmszlgUtDZ4=;
	b=bEdZ3GhLyjQqwC18tIto8NcLYK9M55+iOCmPUJDD3VSHdDZUZhlD1v8z0I8EOtK+Ml/ghy
	tNRiEWWXSvW+USZNrRnkYgxyu0RaWeqdGPPWSL19HuBCC7yJ82nCBnWvJvwm3wELCr/LuK
	h9OibmJFiAoHuzBeCpGpuGbYZRSiwC4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B829C13427;
	Mon,  2 Jan 2023 20:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id G2OkKnA8s2PbawAAMHmgww
	(envelope-from <mhocko@suse.com>); Mon, 02 Jan 2023 20:20:00 +0000
Date: Mon, 2 Jan 2023 21:19:59 +0100
From: Michal Hocko <mhocko@suse.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fs/ntfs3: Use __GFP_NOWARN allocation at
 ntfs_load_attr_list()
Message-ID: <Y7M8bwYAzyuYbmP3@dhcp22.suse.cz>
References: <00000000000027524405f1452ea8@google.com>
 <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b10c1aa-0b3a-da0d-ea0e-b135cffc3491@I-love.SAKURA.ne.jp>

[this has just hit my filters, I am not really familiar with the code
 itself]

On Mon 02-01-23 23:53:40, Tetsuo Handa wrote:
> syzbot is reporting too large allocation at ntfs_load_attr_list() [1], for
> a crafted filesystem can have huge data_size.
> 
> Link: https://syzkaller.appspot.com/bug?extid=89dbb3a789a5b9711793 [1]
> Reported-by: syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>  fs/ntfs3/attrlist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
> index c0c6bcbc8c05..81c22df27c72 100644
> --- a/fs/ntfs3/attrlist.c
> +++ b/fs/ntfs3/attrlist.c
> @@ -52,7 +52,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
>  
>  	if (!attr->non_res) {
>  		lsize = le32_to_cpu(attr->res.data_size);
> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);

This looks like a bad idea in general. The allocator merely says that
something is wrong and you are silencing that. The calling code should
check the size for reasonable range and if larger size. Moreover, if
lsize can be really more than PAGE_SIZE this should be kvmalloc instead.
Ditto for the the other case.

>  		if (!le) {
>  			err = -ENOMEM;
>  			goto out;
> @@ -80,7 +80,7 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
>  		if (err < 0)
>  			goto out;
>  
> -		le = kmalloc(al_aligned(lsize), GFP_NOFS);
> +		le = kmalloc(al_aligned(lsize), GFP_NOFS | __GFP_NOWARN);
>  		if (!le) {
>  			err = -ENOMEM;
>  			goto out;
> -- 
> 2.34.1
> 

-- 
Michal Hocko
SUSE Labs
