Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB772
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 18:52:36 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y28so81261428lfb.0
        for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s39cDjSBaWlllB2Z8PSXWuKit3Q+ksAwHMo69k6Autc=;
        b=pveXqgUlG4WQuZIQwhP7FTq2a32cwrhpuOFQ1ybSULcJLZ8Jrc8yH+FKtU3A/OJhsU
         idO/eWMHggDffotYZB4umKl8UJEySBzgqesd/LVf2oTJPwepH/TM5LtZsGy5EtfEbyb5
         cr0PYqGyP0xqnvT2Jjqq/CRaNokIQRW+uv5OqkegJ24n1ZBJ9aWLW4sgjpREyv6b8bqf
         q9MBSbde9oQgRgpsZomJLeUDgljDRxjnroIc3Kbcs0/h3Ql328j0NhKQaVv0ZD/oSb4s
         f7ymJFSYjbrY29ZQqnTBuVq766gJbuEO3hhJ1VefuAMDln8PyBHULOmTB8tEIHtOPovc
         MAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s39cDjSBaWlllB2Z8PSXWuKit3Q+ksAwHMo69k6Autc=;
        b=bE2q5TlQStwCu9cpW07usoO5Vz9fLSSiRyxqMPQdLVUXAh/HVbr7UmKWFYfCv6ULbc
         ZDsdpcuOO6FuKVmcBfzziuOaqIs5TzMEivz4l54cclUnB3DJ8yyN/gPNei318Bld/NqZ
         b0SWHAbV1Z48pJ1EBaAv0do2Xmt/2LJrvPtfWjGZtabiV5MtEQFIQteRq0UYXTil7nlc
         stN53xATpOMEqC8u1Jd9+7l1hxfXnVreb/W49jtsEdrN/mVkqTztW7jbiaeflQAxBj+u
         xRNYbn8Q5sXNUvFjTJp+S9WDhm6l6pXfUToTk1vGoimXjMXscUj0HiZWJp2UTMfNgn5e
         kcNg==
X-Gm-Message-State: AOAM533Mm5FWfk1e8FtxoplllMwXbuPeamSiXQrI1xXdkMZRLuaxUDam
	bLeU6yroGzWvjomkCsI0YZOCOEQcNWs=
X-Google-Smtp-Source: ABdhPJz1J8r48Z40P6HelVkj/yBHbKWCrbSCxUQ3I0TXN+mttFXGG14tDgzPSO4Ti9GPtpOwgfIDSw==
X-Received: by 2002:ac2:5c46:: with SMTP id s6mr1232283lfp.634.1632768754195;
        Mon, 27 Sep 2021 11:52:34 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id v27sm1680177lfd.127.2021.09.27.11.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 11:52:33 -0700 (PDT)
Date: Mon, 27 Sep 2021 21:52:31 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/3] fs/ntfs3: Refactoring of ntfs_init_from_boot
Message-ID: <20210927185231.mbtzua6zgknktavu@kari-VirtualBox>
References: <16cbff75-f705-37cb-ad3f-43d433352f6b@paragon-software.com>
 <aa2b5ad6-dd9e-3feb-d3bd-248cb311d050@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa2b5ad6-dd9e-3feb-d3bd-248cb311d050@paragon-software.com>

On Mon, Sep 27, 2021 at 06:48:38PM +0300, Konstantin Komarov wrote:
> Remove ntfs_sb_info members sector_size and sector_bits.
> Print details why mount failed.
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Like the changes. Some thing below.

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/ntfs_fs.h |  2 --
>  fs/ntfs3/super.c   | 32 +++++++++++++++++++-------------
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
> index 6731b5d9e2d8..38b7c1a9dc52 100644
> --- a/fs/ntfs3/ntfs_fs.h
> +++ b/fs/ntfs3/ntfs_fs.h
> @@ -211,10 +211,8 @@ struct ntfs_sb_info {
>  	u32 blocks_per_cluster; // cluster_size / sb->s_blocksize
>  
>  	u32 record_size;
> -	u32 sector_size;
>  	u32 index_size;
>  
> -	u8 sector_bits;
>  	u8 cluster_bits;
>  	u8 record_bits;
>  
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 193f9a98f6ab..5fe9484c6781 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -682,7 +682,7 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>  	struct ntfs_sb_info *sbi = sb->s_fs_info;
>  	int err;
>  	u32 mb, gb, boot_sector_size, sct_per_clst, record_size;
> -	u64 sectors, clusters, fs_size, mlcn, mlcn2;
> +	u64 sectors, clusters, mlcn, mlcn2;
>  	struct NTFS_BOOT *boot;
>  	struct buffer_head *bh;
>  	struct MFT_REC *rec;
> @@ -740,20 +740,20 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>  		goto out;
>  	}
>  
> -	sbi->sector_size = boot_sector_size;
> -	sbi->sector_bits = blksize_bits(boot_sector_size);
> -	fs_size = (sectors + 1) << sbi->sector_bits;
> +	sbi->volume.size = sectors * boot_sector_size;
>  
> -	gb = format_size_gb(fs_size, &mb);
> +	gb = format_size_gb(sbi->volume.size + boot_sector_size, &mb);
>  
>  	/*
>  	 * - Volume formatted and mounted with the same sector size.
>  	 * - Volume formatted 4K and mounted as 512.
>  	 * - Volume formatted 512 and mounted as 4K.
>  	 */
> -	if (sbi->sector_size != sector_size) {
> -		ntfs_warn(sb,
> -			  "Different NTFS' sector size and media sector size");
> +	if (boot_sector_size != sector_size) {
> +		ntfs_warn(
> +			sb,
> +			"Different NTFS' sector size (%u) and media sector size (%u)",
> +			boot_sector_size, sector_size);

>  		dev_size += sector_size - 1;
>  	}
>  
> @@ -764,12 +764,19 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>  	sbi->mft.lbo2 = mlcn2 << sbi->cluster_bits;
>  
>  	/* Compare boot's cluster and sector. */
> -	if (sbi->cluster_size < sbi->sector_size)
> +	if (sbi->cluster_size < boot_sector_size)
>  		goto out;
>  
>  	/* Compare boot's cluster and media sector. */
> -	if (sbi->cluster_size < sector_size)
> -		goto out; /* No way to use ntfs_get_block in this case. */
> +	if (sbi->cluster_size < sector_size) {
> +		/* No way to use ntfs_get_block in this case. */
> +		ntfs_err(
> +			sb,
> +			"Failed to mount 'cause NTFS's cluster size (%u) is "
> +			"less than media sector size (%u)",

This is first time I see splitted string like this in ntfs3. No need to
split like this. Small nit for that this chunk should already could be
in patch 2/3.

> +			sbi->cluster_size, sector_size);
> +		goto out;
> +	}
>  
>  	sbi->cluster_mask = sbi->cluster_size - 1;
>  	sbi->cluster_mask_inv = ~(u64)sbi->cluster_mask;
> @@ -794,10 +801,9 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>  				  : (u32)boot->index_size << sbi->cluster_bits;
>  
>  	sbi->volume.ser_num = le64_to_cpu(boot->serial_num);
> -	sbi->volume.size = sectors << sbi->sector_bits;
>  
>  	/* Warning if RAW volume. */
> -	if (dev_size < fs_size) {
> +	if (dev_size < sbi->volume.size + boot_sector_size) {
>  		u32 mb0, gb0;
>  
>  		gb0 = format_size_gb(dev_size, &mb0);
> -- 
> 2.33.0
> 
> 
