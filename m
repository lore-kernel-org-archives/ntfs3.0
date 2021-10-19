Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828BB2C80
	for <ntfs3@lists.linux.dev>; Tue, 19 Oct 2021 01:04:21 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id t9so3692493lfd.1
        for <ntfs3@lists.linux.dev>; Mon, 18 Oct 2021 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HZB3VynRj4BSJ+DoffwFLiPJvzPYXkayF1wJVNoXqZo=;
        b=qa7Rg2/+uz+UIDCny84Tw5bep3SlaUI84n/FAaUaxIzAubmeoa1ydJFT64PdI4Dc2i
         AgPnjhE+kBzSH4MdsJeGrFG4f0xqH2HBhd6pbyQr8O8l98NNiVXw+7LLIlFbcV+xxCqf
         RA02zj7IDRlPmKt2XOaxe9T0CtUPo6hRSub6+1M9syuYXVu4HWpZ0mdRM4b+vfFK8OI9
         lTRtKN80UFv+SDfLWbeeA+TcDubhn33n9WeCF3bZ9pFOuoi5rOJVIPb1Sykzu+pmiRnV
         qHPYjU4GPUjtfi/yhGpy4ABO9h9df+GLOdeLNWFNTfyVWJ/R/s+xiv91lAtBOCzSytMJ
         pKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HZB3VynRj4BSJ+DoffwFLiPJvzPYXkayF1wJVNoXqZo=;
        b=pF448urpg9/V6av7ge5LzX5a0uy7AF+Wx7BeLx0amdkdEcYXOPQRQ2hfgM+/DvhcGV
         fiDOAhweYIjgILASLjvuF7Iy0WRiwipXMXMA1IsNGSXGqyF56ANh4DjK32aVVxHq+qrQ
         +obpMYZs+bjTPJDjvuha1rNeOa2MUOuFEYRjA6tOxmQ8hnv1stjwT5etGfPb+/SZcdiV
         DlfHX+Gx4RtVY1LlBqkauyp1xj2WSc8d2RmuQCCVNQQZUP77EOSSUrEXgYhLCgJLVMT6
         Rz0qFFDobNAm5n2hihnmZEjKyB8gSgD8IllWU1E5qlZkaTR/xSMCZ1JlsjqJqbDuiGBT
         ebgw==
X-Gm-Message-State: AOAM530WsBiOtoW5smYAjl77EwYxj0HH9zWBG0I5WDghzidKgH2NmZHr
	1KOf+uAFjKlhkSb9ruevzAI=
X-Google-Smtp-Source: ABdhPJzDOI1VPK7ec+9Wvn2TGhELLqlWyRvZ5Uhqz00hPtHEbJZTBFS39lW+J2SjR0uuodKRx0F6pg==
X-Received: by 2002:a05:6512:1284:: with SMTP id u4mr3097377lfs.614.1634605459500;
        Mon, 18 Oct 2021 18:04:19 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id f10sm1533239lfs.56.2021.10.18.18.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 18:04:18 -0700 (PDT)
Date: Tue, 19 Oct 2021 04:04:16 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Theodore Ts'o <tytso@mit.edu>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Kees Cook <keescook@chromium.org>,
	Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
	reiserfs-devel@vger.kernel.org
Subject: Re: don't use ->bd_inode to access the block device size v3
Message-ID: <20211019010416.vgecxu6wnvwi7fii@kari-VirtualBox>
References: <20211018101130.1838532-1-hch@lst.de>
 <4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
 <20211018171843.GA3338@lst.de>
 <2f5dcf79-8419-45ff-c27c-68d43242ccfe@kernel.dk>
 <20211018174901.GA3990@lst.de>
 <e0784f3e-46c8-c90c-870b-60cc2ed7a2da@kernel.dk>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0784f3e-46c8-c90c-870b-60cc2ed7a2da@kernel.dk>

On Mon, Oct 18, 2021 at 11:53:08AM -0600, Jens Axboe wrote:

snip..

> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 7b0326661a1e..a967b3fb3c71 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -236,14 +236,14 @@ static inline sector_t get_start_sect(struct block_device *bdev)
>  	return bdev->bd_start_sect;
>  }
>  
> -static inline loff_t bdev_nr_bytes(struct block_device *bdev)
> +static inline sector_t bdev_nr_sectors(struct block_device *bdev)
>  {
> -	return i_size_read(bdev->bd_inode);
> +	return bdev->bd_nr_sectors;
>  }
>  
> -static inline sector_t bdev_nr_sectors(struct block_device *bdev)
> +static inline loff_t bdev_nr_bytes(struct block_device *bdev)
>  {
> -	return bdev_nr_bytes(bdev) >> SECTOR_SHIFT;
> +	return bdev_nr_setors(bdev) << SECTOR_SHIFT;

setors -> sectors

>  }
>  
>  static inline sector_t get_capacity(struct gendisk *disk)
> 
> -- 
> Jens Axboe
> 
