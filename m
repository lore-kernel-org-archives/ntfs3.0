Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310906AA9
	for <ntfs3@lists.linux.dev>; Thu,  1 Sep 2022 15:59:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9D29C21D31;
	Thu,  1 Sep 2022 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1662047994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZK4oZT3eX4MCCX8IazaYP0RSu4rfgk2J8j6ZUW7BNNQ=;
	b=E3nk9ZCJ+K7uP41n+0vRUy8iAPK5M8OOMb+p9FTE2tblF2YL8Ta9YBFkODTy/xWP/MgtZ3
	fGAK+0LXUnxizhLGJl2OLP1xWcEQRoEXjaAKeE1bn11JYsUtLmTVpXmDJC3Sw3DxyzRbC3
	ongtssh+hysa68Ajd6I7nQU1v6OuWCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1662047994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZK4oZT3eX4MCCX8IazaYP0RSu4rfgk2J8j6ZUW7BNNQ=;
	b=YgVsMkTjvVYCKIhV6xfBz4gDRGLSOsQtRqfWaytR8J/zyWr/i8fWJx4b/q2uHHWjjSEmrZ
	bSuo9XE0F4M0evAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C1B213A89;
	Thu,  1 Sep 2022 15:59:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aSA1IvrWEGNDCAAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 01 Sep 2022 15:59:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 23A78A067C; Thu,  1 Sep 2022 17:59:54 +0200 (CEST)
Date: Thu, 1 Sep 2022 17:59:54 +0200
From: Jan Kara <jack@suse.cz>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu,
	akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk,
	rpeterso@redhat.com, agruenba@redhat.com,
	almaz.alexandrovich@paragon-software.com, mark@fasheh.com,
	dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com,
	yukuai3@huawei.com
Subject: Re: [PATCH v2 13/14] ext2: replace bh_submit_read() helper with
 bh_read_locked()
Message-ID: <20220901155954.4xwvu25bkhgz4uro@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-14-yi.zhang@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-14-yi.zhang@huawei.com>

On Thu 01-09-22 21:35:04, Zhang Yi wrote:
> bh_submit_read() and the uptodate check logic in bh_uptodate_or_lock()
> has been integrated in bh_read() helper, so switch to use it directly.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext2/balloc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
> index c17ccc19b938..5dc0a31f4a08 100644
> --- a/fs/ext2/balloc.c
> +++ b/fs/ext2/balloc.c
> @@ -126,6 +126,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
>  	struct ext2_group_desc * desc;
>  	struct buffer_head * bh = NULL;
>  	ext2_fsblk_t bitmap_blk;
> +	int ret;
>  
>  	desc = ext2_get_group_desc(sb, block_group, NULL);
>  	if (!desc)
> @@ -139,10 +140,10 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
>  			    block_group, le32_to_cpu(desc->bg_block_bitmap));
>  		return NULL;
>  	}
> -	if (likely(bh_uptodate_or_lock(bh)))
> +	ret = bh_read(bh, 0);
> +	if (ret > 0)
>  		return bh;
> -
> -	if (bh_submit_read(bh) < 0) {
> +	if (ret < 0) {
>  		brelse(bh);
>  		ext2_error(sb, __func__,
>  			    "Cannot read block bitmap - "
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
