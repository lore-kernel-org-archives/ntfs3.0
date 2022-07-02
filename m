Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386651FA8
	for <ntfs3@lists.linux.dev>; Sat,  2 Jul 2022 20:57:57 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id h19so4583221qtp.6
        for <ntfs3@lists.linux.dev>; Sat, 02 Jul 2022 13:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tmTe/j9IQg6kfh2nkxJHNkkQGZhhodot4AonVc2ypEg=;
        b=dt0Mb1j+RUNY88l8mdu+r/GG+OJ8JKJmJB9+DtNX9yQ7uc9tX3rmsRR4sgGWKt9WTd
         BQsIB/aIAOqS6ijbCL2ZB2F+Fmvmu04QDEwZjzUNzJLwz48uT4311NB9+ayRhxHi8zIl
         h5i+sNZz6mZJpyNX+gaN2bsO7ej97HOVYIvWip/KgnpNXkKLOA37flCsgSGJ+m5mC4XG
         Ms/Nibmu7WInxWlsXDn7Ptq+B5GAMSTgfFxhJuhbVjautKgVok7YL4PHkvzC9sGZ2yj3
         Jmd5r4eUB1jKk+cbXQ0rK6q2QvpSVb3bAunO59wIItmUIqE0cpiyIhio1+vf0R8TPLuC
         TiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tmTe/j9IQg6kfh2nkxJHNkkQGZhhodot4AonVc2ypEg=;
        b=gMdNHoDqH3DJtmvZx9P+Hur/upZJN2zf2g3yP5xiNs1RAsFmGuE5RTWXQtoF+wOWjT
         ZkgyWNVM6nZD/3L6n3zlkBPcBTphgkuZrss75q7lo0rRoSv0ac1xS11r3AMbz1ZsqV8q
         ZBjyHuZRRBMuhuHloxXSalJCUnibtJwr2miH92HCuhXWhsk/8oezN74hd9B7PkcDVPHB
         eIr8KzsRpW/u2WjKD81N9v26t75IfjUcD+L+mxJw5URJKLOvDJkzdbhx/EsDy1uV1lOL
         rZeNhJP7bRpnwpgRt4QuxPNUfbJ8q3xGerwhjA32oqQASBZ7WyOONdSmAC7vuavQjPMm
         GAJw==
X-Gm-Message-State: AJIora917KD/e123vUkECkcWiTBA2TUD7shEQR18A8ErkAa9kZJSI1O4
	f+or4/wcMi6XkSUd/rdpxZaiUxS6N6A=
X-Google-Smtp-Source: AGRyM1vMHV2C70cJUaiTyxu/YwSJ8XyP2OTkuYOtM18QdLzUztKGlOFKlbFY1e8fLJy/XDzQVTFpKw==
X-Received: by 2002:ac8:57d1:0:b0:31d:3e00:dfdc with SMTP id w17-20020ac857d1000000b0031d3e00dfdcmr4112648qta.333.1656795475669;
        Sat, 02 Jul 2022 13:57:55 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:e838:b1c2:b125:986a])
        by smtp.gmail.com with ESMTPSA id n20-20020a05620a223400b006a6b564e9b8sm19311052qkh.4.2022.07.02.13.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 13:57:55 -0700 (PDT)
Date: Sat, 2 Jul 2022 13:57:54 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
	vneethv@linux.ibm.com, oberpar@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	almaz.alexandrovich@paragon-software.com,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	linux-s390@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/4] fs/ntfs3: Rename bitmap_size() as ntfs3_bitmap_size()
Message-ID: <YsCxUrTKd1N4aVoJ@yury-laptop>
References: <cover.1656785856.git.christophe.jaillet@wanadoo.fr>
 <56a3cb896ec446ca24e4756042d9f0829afc671a.1656785856.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56a3cb896ec446ca24e4756042d9f0829afc671a.1656785856.git.christophe.jaillet@wanadoo.fr>

On Sat, Jul 02, 2022 at 08:29:27PM +0200, Christophe JAILLET wrote:
> In order to introduce a bitmap_size() function in the bitmap API, we have
> to rename functions with a similar name.
> 
> Add a "ntfs3_" prefix and change bitmap_size() into ntfs3_bitmap_size().
> 
> No functional change.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  fs/ntfs3/bitmap.c  | 4 ++--
>  fs/ntfs3/fsntfs.c  | 2 +-
>  fs/ntfs3/index.c   | 6 +++---
>  fs/ntfs3/ntfs_fs.h | 2 +-
>  fs/ntfs3/super.c   | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
> index e3b5680fd516..f98327453d83 100644
> --- a/fs/ntfs3/bitmap.c
> +++ b/fs/ntfs3/bitmap.c
> @@ -661,7 +661,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
>  	wnd->total_zeroes = nbits;
>  	wnd->extent_max = MINUS_ONE_T;
>  	wnd->zone_bit = wnd->zone_end = 0;
> -	wnd->nwnd = bytes_to_block(sb, bitmap_size(nbits));
> +	wnd->nwnd = bytes_to_block(sb, ntfs3_bitmap_size(nbits));
>  	wnd->bits_last = nbits & (wbits - 1);
>  	if (!wnd->bits_last)
>  		wnd->bits_last = wbits;
> @@ -1323,7 +1323,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
>  		return -EINVAL;
>  
>  	/* Align to 8 byte boundary. */
> -	new_wnd = bytes_to_block(sb, bitmap_size(new_bits));
> +	new_wnd = bytes_to_block(sb, ntfs3_bitmap_size(new_bits));
>  	new_last = new_bits & (wbits - 1);
>  	if (!new_last)
>  		new_last = wbits;
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 3de5700a9b83..9c74d88ce0f0 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -493,7 +493,7 @@ static int ntfs_extend_mft(struct ntfs_sb_info *sbi)
>  	ni->mi.dirty = true;
>  
>  	/* Step 2: Resize $MFT::BITMAP. */
> -	new_bitmap_bytes = bitmap_size(new_mft_total);
> +	new_bitmap_bytes = ntfs3_bitmap_size(new_mft_total);
>  
>  	err = attr_set_size(ni, ATTR_BITMAP, NULL, 0, &sbi->mft.bitmap.run,
>  			    new_bitmap_bytes, &new_bitmap_bytes, true, NULL);
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 84ccc1409874..5c5ea05a5ef1 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1353,7 +1353,7 @@ static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>  
>  	alloc->nres.valid_size = alloc->nres.data_size = cpu_to_le64(data_size);
>  
> -	err = ni_insert_resident(ni, bitmap_size(1), ATTR_BITMAP, in->name,
> +	err = ni_insert_resident(ni, ntfs3_bitmap_size(1), ATTR_BITMAP, in->name,
>  				 in->name_len, &bitmap, NULL, NULL);
>  	if (err)
>  		goto out2;
> @@ -1415,7 +1415,7 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>  	if (bmp) {
>  		/* Increase bitmap. */
>  		err = attr_set_size(ni, ATTR_BITMAP, in->name, in->name_len,
> -				    &indx->bitmap_run, bitmap_size(bit + 1),
> +				    &indx->bitmap_run, ntfs3_bitmap_size(bit + 1),
>  				    NULL, true, NULL);
>  		if (err)
>  			goto out1;
> @@ -1973,7 +1973,7 @@ static int indx_shrink(struct ntfs_index *indx, struct ntfs_inode *ni,
>  	if (err)
>  		return err;
>  
> -	bpb = bitmap_size(bit);
> +	bpb = ntfs3_bitmap_size(bit);
>  	if (bpb * 8 == nbits)
>  		return 0;
>  
> diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
> index 55d686e3c4ec..85210e610a3a 100644
> --- a/fs/ntfs3/ntfs_fs.h
> +++ b/fs/ntfs3/ntfs_fs.h
> @@ -945,7 +945,7 @@ static inline bool run_is_empty(struct runs_tree *run)
>  }
>  
>  /* NTFS uses quad aligned bitmaps. */
> -static inline size_t bitmap_size(size_t bits)
> +static inline size_t ntfs3_bitmap_size(size_t bits)
>  {
>  	return ALIGN((bits + 7) >> 3, 8);
>  }

Here everything looks OK for me. NTFS3 has their own good reasons
to reserve 64-bit words for their bitmaps, and they need their own
functions for this. And the prefix looks OK because it underlines
that this is a local story.

Maybe we can turn it into BITS_TO_LLONGS() and put into 
include/linux/bitops.h... But unless we have another subsystem that
needs it, I'm OK with current approach.

Acked-by: Yury Norov <yury.norov@gmail.com>

> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index b41d7c824a50..7d48f886ac82 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1101,7 +1101,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  
>  	/* Check bitmap boundary. */
>  	tt = sbi->used.bitmap.nbits;
> -	if (inode->i_size < bitmap_size(tt)) {
> +	if (inode->i_size < ntfs3_bitmap_size(tt)) {
>  		err = -EINVAL;
>  		goto put_inode_out;
>  	}
> -- 
> 2.34.1
