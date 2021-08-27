Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3FE72
	for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 10:14:59 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id i9so13277642lfg.10
        for <ntfs3@lists.linux.dev>; Fri, 27 Aug 2021 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z3ngnU6mQsa8AKptZHi1VtQo5GAyhkjpRS38k/DoWag=;
        b=LzlbqQOyonbSwhbqApdTTNaIXC+rcCo+F+hADxL87xJlt9Zrii+r7VBGCvwGIzKjh2
         IWuiRgTVifcEm6F4xEOfZm3V4QyN71gpIjiw/VyTnOLZcWDmOtjx/6L3U2tjQIPVObxs
         aItjYn23eH9+yTrwupKd899LAgY1frC5vCypsZEdvJUVlk/2ANzl4nwSHkq3HEjwMJCi
         cVR7iYxalDdZgMjijUo2NvE0o95DyAYF6nk8x/iGawzDmQZvWK+90sLW6/zJPTSkIiD7
         Lb4xaWFlqNxV8Vel4YK16S4FFneHJTdIvrRaifWNzoHFtxtXXEK0TaP69A4+Ci0al2tR
         NSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z3ngnU6mQsa8AKptZHi1VtQo5GAyhkjpRS38k/DoWag=;
        b=D0q4Mnm/5rc9wyKhkAKkCfOfAtYA3GcYeSUEwQGYPSgZlZhV0/9eW2Fy9Ol140By6o
         02VPxD/5ryylhQndoaB2dd+6uBY6qg4TGjPfOjWlkec92KVFUEOf5f1nB/fZxjVc1Tlx
         QD7csnNm4YgFtY0jzkX0RtZPJFhxsMDdTJsSqNCAQ+iR1Y3btrfmLRgTXKAa2g5GdmO/
         +Dg6ZTIMEp1bwOWTdgHlctuxo58Ci04JGUFcvGee4QDg79Baxog6IGMAALjnzQrd369W
         V4gWhlpnFuIZe3U+1TI4PS9e75jQF+VT9s1meqNqcjnFW5a7TmhiUDUnTQIM7Rh5QNwL
         UR5w==
X-Gm-Message-State: AOAM533od2f35QZIED+6ljG/2IEnkXClUdZ1hM+8XNqrPYqHBKFSJtaD
	EqSaDM94yJl+vUGRQu6Eb3Q=
X-Google-Smtp-Source: ABdhPJwIeQfFgY5fYY3LtjdbMpk3wtj6oP8xF0+NsJUzoCGQjeTgzrJaN7LWjVCuFRlDoA3ilv8ESg==
X-Received: by 2002:a05:6512:3494:: with SMTP id v20mr6264410lfr.637.1630059297258;
        Fri, 27 Aug 2021 03:14:57 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id n25sm639479ljj.42.2021.08.27.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 03:14:56 -0700 (PDT)
Date: Fri, 27 Aug 2021 13:14:55 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Delete dead code in ni_write_frame()
Message-ID: <20210827101455.6sdbvsdpzhmcvtiu@kari-VirtualBox>
References: <20210827100528.GC9449@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827100528.GC9449@kili>

On Fri, Aug 27, 2021 at 01:05:29PM +0300, Dan Carpenter wrote:
> This code sets "lznt" to NULL and then kfrees it.  Kfreeing a NULL is a
> no-op so delete the code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/frecord.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index c3121bf9c62f..c1a9f124f771 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2742,7 +2742,6 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
>  	}
>  
>  	mutex_lock(&sbi->compress.mtx_lznt);
> -	lznt = NULL;
>  	if (!sbi->compress.lznt) {
>  		/*
>  		 * lznt implements two levels of compression:
> @@ -2758,14 +2757,12 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
>  		}
>  
>  		sbi->compress.lznt = lznt;
> -		lznt = NULL;
>  	}
>  
>  	/* compress: frame_mem -> frame_ondisk */
>  	compr_size = compress_lznt(frame_mem, frame_size, frame_ondisk,
>  				   frame_size, sbi->compress.lznt);
>  	mutex_unlock(&sbi->compress.mtx_lznt);
> -	ntfs_free(lznt);
>  
>  	if (compr_size + sbi->cluster_size > frame_size) {
>  		/* frame is not compressed */
> -- 
> 2.20.1
> 
> 
