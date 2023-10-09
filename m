Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A215AD7
	for <ntfs3@lists.linux.dev>; Mon,  9 Oct 2023 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wso8OsqV"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59f7f2b1036so57884307b3.3
        for <ntfs3@lists.linux.dev>; Mon, 09 Oct 2023 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696870217; x=1697475017; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yhm7YrqXofK0AegCXETsHz1KMPta2LD8FhGIuFko2pY=;
        b=Wso8OsqVHYNi7fT60j78s7c91HabCHBcypxbbIatFloEDbgii4MjTsU20fz7ZqXP4b
         JOhQVBJVfdZHpMohp05JS+/mxxrhilBQz5JDPjsZYseuOmM5shX+a8AsRlWOebZMOtDW
         tN8jo+W5UbhGuxJnp2fbXRHG1wmZE7EcTZ9FSsIGm58DSr+7yFeK2mzJrHAok1T4CDWJ
         S3EgA3/vjb9ryhTT6HEH9JB0HWLVpGdf3X0Oj+LJDBafgDVE44Nhlxj+oupFyHAjx1wq
         BW7TfeEryoS0q5yvyC14JQd+xI6N3zw+dl5AYwbv2QPRa1FISM2x8CKZeC1hcgzgnrO0
         vIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870217; x=1697475017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhm7YrqXofK0AegCXETsHz1KMPta2LD8FhGIuFko2pY=;
        b=SQsgH0shf9P9wrOHpmG6ZW31+zxiumE0Wy6/4Nzc0HI4mXNVBHLRVhWqKzAQLolW/J
         yJVu51LsrP3QC2uqCJ9Wxp8BYDUwIJjVW5r1J2NOnq0tO+JlYQHRwYoLH06hemQuso5t
         j7SHvSMarr2333owMDMJu9QkpDb9l52VTJjk9GMCiNn+wzh0KGnQ2VoSbbNIb1PxBJAo
         guwKt3vcEXygvrnNycMppKH4YnznLgvXyQSRbLbF7rD2ksGL4fw3REZRTNrKUaTghgOB
         jxuaGoN0eHV2NgoBGh1g1fegFDT0oVY7HvorSz2hhw9bUGFiIoCGeF92AFClFmBKyv8m
         sEmQ==
X-Gm-Message-State: AOJu0Yx8am4/lwkykzVl2FzEvxxJjygcG/Mbks5lqFI1+zBRzH7aIbNL
	0eOwIfaRxA5E/tjq15pmQko=
X-Google-Smtp-Source: AGHT+IGDGieAvy8YgNDMEl5ERI+L5dnLHTLO6C63fhmPXvU26M+Gw4A6t2G+i0jttc7QnLS2senhew==
X-Received: by 2002:a0d:c207:0:b0:59a:f131:50fa with SMTP id e7-20020a0dc207000000b0059af13150famr16404483ywd.47.1696870217228;
        Mon, 09 Oct 2023 09:50:17 -0700 (PDT)
Received: from localhost ([2607:fb90:be22:da0:a050:8c3a:c782:514b])
        by smtp.gmail.com with ESMTPSA id p6-20020a0dff06000000b0059c8387f673sm3823742ywf.51.2023.10.09.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:50:16 -0700 (PDT)
Date: Mon, 9 Oct 2023 09:50:15 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexander Potapenko <glider@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	David Ahern <dsahern@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org,
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com,
	ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] fs/ntfs3: rename bitmap_size() ->
 ntfs3_bitmap_size()
Message-ID: <ZSQvR+bQ8PS9/CEa@yury-ThinkPad>
References: <20231009151026.66145-1-aleksander.lobakin@intel.com>
 <20231009151026.66145-7-aleksander.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009151026.66145-7-aleksander.lobakin@intel.com>

On Mon, Oct 09, 2023 at 05:10:18PM +0200, Alexander Lobakin wrote:
> bitmap_size() is a pretty generic name and one may want to use it for
> a generic bitmap API function. At the same time, its logic is
> NTFS-specific, as it aligns to the sizeof(u64), not the sizeof(long)
> (although it uses ideologically right ALIGN() instead of division).
> Add the prefix 'ntfs3_' used for that FS (not just 'ntfs_' to not mix
> it with the legacy module).
> 
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> ---
>  fs/ntfs3/bitmap.c  |  4 ++--
>  fs/ntfs3/fsntfs.c  |  2 +-
>  fs/ntfs3/index.c   | 11 ++++++-----
>  fs/ntfs3/ntfs_fs.h |  2 +-
>  fs/ntfs3/super.c   |  2 +-
>  5 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index 107e808e06ea..a2e18f13e93a 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -653,7 +653,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
>  	wnd->total_zeroes = nbits;
>  	wnd->extent_max = MINUS_ONE_T;
>  	wnd->zone_bit = wnd->zone_end = 0;
> -	wnd->nwnd = bytes_to_block(sb, bitmap_size(nbits));
> +	wnd->nwnd = bytes_to_block(sb, ntfs3_bitmap_size(nbits));
>  	wnd->bits_last = nbits & (wbits - 1);
>  	if (!wnd->bits_last)
>  		wnd->bits_last = wbits;
> @@ -1345,7 +1345,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
>  		return -EINVAL;
>  
>  	/* Align to 8 byte boundary. */
> -	new_wnd = bytes_to_block(sb, bitmap_size(new_bits));
> +	new_wnd = bytes_to_block(sb, ntfs3_bitmap_size(new_bits));
>  	new_last = new_bits & (wbits - 1);
>  	if (!new_last)
>  		new_last = wbits;
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 33afee0f5559..7a14d2347f27 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -522,7 +522,7 @@ static int ntfs_extend_mft(struct ntfs_sb_info *sbi)
>  	ni->mi.dirty = true;
>  
>  	/* Step 2: Resize $MFT::BITMAP. */
> -	new_bitmap_bytes = bitmap_size(new_mft_total);
> +	new_bitmap_bytes = ntfs3_bitmap_size(new_mft_total);
>  
>  	err = attr_set_size(ni, ATTR_BITMAP, NULL, 0, &sbi->mft.bitmap.run,
>  			    new_bitmap_bytes, &new_bitmap_bytes, true, NULL);
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 124c6e822623..ab53a4b6ddf8 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1453,8 +1453,8 @@ static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>  
>  	alloc->nres.valid_size = alloc->nres.data_size = cpu_to_le64(data_size);
>  
> -	err = ni_insert_resident(ni, bitmap_size(1), ATTR_BITMAP, in->name,
> -				 in->name_len, &bitmap, NULL, NULL);
> +	err = ni_insert_resident(ni, ntfs3_bitmap_size(1), ATTR_BITMAP,
> +				 in->name, in->name_len, &bitmap, NULL, NULL);
>  	if (err)
>  		goto out2;
>  
> @@ -1515,8 +1515,9 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>  	if (bmp) {
>  		/* Increase bitmap. */
>  		err = attr_set_size(ni, ATTR_BITMAP, in->name, in->name_len,
> -				    &indx->bitmap_run, bitmap_size(bit + 1),
> -				    NULL, true, NULL);
> +				    &indx->bitmap_run,
> +				    ntfs3_bitmap_size(bit + 1), NULL, true,
> +				    NULL);
>  		if (err)
>  			goto out1;
>  	}
> @@ -2089,7 +2090,7 @@ static int indx_shrink(struct ntfs_index *indx, struct ntfs_inode *ni,
>  	if (in->name == I30_NAME)
>  		ni->vfs_inode.i_size = new_data;
>  
> -	bpb = bitmap_size(bit);
> +	bpb = ntfs3_bitmap_size(bit);
>  	if (bpb * 8 == nbits)
>  		return 0;
>  
> diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
> index 629403ede6e5..93333156aac6 100644
> --- a/fs/ntfs3/ntfs_fs.h
> +++ b/fs/ntfs3/ntfs_fs.h
> @@ -961,7 +961,7 @@ static inline bool run_is_empty(struct runs_tree *run)
>  }
>  
>  /* NTFS uses quad aligned bitmaps. */
> -static inline size_t bitmap_size(size_t bits)
> +static inline size_t ntfs3_bitmap_size(size_t bits)
>  {
>  	return ALIGN((bits + 7) >> 3, 8);
>  }

This looks like duplicating BITS_TO_U64(). If so, why not just switch
to using the macro while you're here?

> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index cfec5e0c7f66..b1fb6efe7084 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1285,7 +1285,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	/* Check bitmap boundary. */
>  	tt = sbi->used.bitmap.nbits;
> -	if (inode->i_size < bitmap_size(tt)) {
> +	if (inode->i_size < ntfs3_bitmap_size(tt)) {
>  		ntfs_err(sb, "$Bitmap is corrupted.");
>  		err = -EINVAL;
>  		goto put_inode_out;
> -- 
> 2.41.0
