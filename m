Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160796AA9
	for <ntfs3@lists.linux.dev>; Thu,  1 Sep 2022 15:59:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6F8A321B35;
	Thu,  1 Sep 2022 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1662047952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBfsBLjkBk+MOp0nQfi/nmYmADNsHmXsxHUoLjnY3bA=;
	b=eTkuxs55IxFpE7hDRb6Zude0PNe42Rg2iDMXK6ovgOmLJ8ol+1hu0xPXSwQoqG9TGCaDc3
	i42+WNdKtbB6Lfrn3L5KkY4OhWhqvQdspBys/xSEJGbnPDDd/Ub0fAQLxecq4hpNU8HyuG
	G6/KF4WT3KI1yrz/XlU9iNhXieN8XTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1662047952;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBfsBLjkBk+MOp0nQfi/nmYmADNsHmXsxHUoLjnY3bA=;
	b=Z4hcUx2ha2YSNK1fJxrz+uxnK+d2neX9kSNscLfnZg2OLnp020u8KVt2k2u2P+l6DPBLZE
	LGa6Pt9b/QN5juCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C72C13A89;
	Thu,  1 Sep 2022 15:59:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XmaNFtDWEGMSCAAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 01 Sep 2022 15:59:12 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id E1C2BA067C; Thu,  1 Sep 2022 17:59:11 +0200 (CEST)
Date: Thu, 1 Sep 2022 17:59:11 +0200
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
Subject: Re: [PATCH v2 11/14] ufs: replace ll_rw_block()
Message-ID: <20220901155911.fbdsdn26kaj7ehjb@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-12-yi.zhang@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-12-yi.zhang@huawei.com>

On Thu 01-09-22 21:35:02, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in ufs.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ufs/balloc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
> index bd810d8239f2..2436e3f82147 100644
> --- a/fs/ufs/balloc.c
> +++ b/fs/ufs/balloc.c
> @@ -295,14 +295,10 @@ static void ufs_change_blocknr(struct inode *inode, sector_t beg,
>  
>  			if (!buffer_mapped(bh))
>  					map_bh(bh, inode->i_sb, oldb + pos);
> -			if (!buffer_uptodate(bh)) {
> -				ll_rw_block(REQ_OP_READ, 1, &bh);
> -				wait_on_buffer(bh);
> -				if (!buffer_uptodate(bh)) {
> -					ufs_error(inode->i_sb, __func__,
> -						  "read of block failed\n");
> -					break;
> -				}
> +			if (bh_read(bh, 0) < 0) {
> +				ufs_error(inode->i_sb, __func__,
> +					  "read of block failed\n");
> +				break;
>  			}
>  
>  			UFSD(" change from %llu to %llu, pos %u\n",
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
