Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC43FC3
	for <ntfs3@lists.linux.dev>; Fri, 10 Sep 2021 10:50:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id m28so3165487lfj.6
        for <ntfs3@lists.linux.dev>; Fri, 10 Sep 2021 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eKzR9oqZtxb76e9ajCaeipteTFurfCH3JAineo6pIuM=;
        b=VJ6fhld+oMLvdqeJZJ4x+KXrdwelIlyHC6Y1HU9DXoN9zQagksco0D3jSyu7brffEL
         qqGLIVxK139LXLhvwHlPB1YD+Nbq498Z2BKU/0H/bRQhy9FTzxSgmzy2peIstkWmnzgC
         rwUJKpqiJGsXEFobGoqVT4BaCMggfJ2klvjAtlPINHqus8eM55kWkJWem7udMndHxh8b
         eryJxzjyTnrndyQlik14jaD6xoaWMAEfNfmZWTzNb2VMC095MfY8Aln8//ex/25LWd6x
         z8I9rVdeX7kpehWcLRys9/Z4c33/G3zs0TvBAfpvIgDbpsY6KWE9mYd4ogVLIUaXhX+D
         896Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eKzR9oqZtxb76e9ajCaeipteTFurfCH3JAineo6pIuM=;
        b=VJnVLMpBNVQ68xFcPxqkSotpmnIv3uoWt1btMbSN0Tz7/IhIW+CYB9MH3AZqNk7luX
         sfsS7T2axXC9CIVObMCg3CCB/bCSD2ufVqeZsjG0vhLaOAD/KX3Dzcpcv6aktO2q1AT/
         1gS3e46FkdxEuM6V/FU4Ojb3clcHLmbREz0JEx4RTib5DjYgCxq25YJdliOfYltbDT/d
         FGqJXswsD/0vZB5xashGKF2Hsh1R9EwVNt6EegHcrP6+gETwhhPU/VZmDKfzQehiLU2/
         ajCZeLQwuPQWwq/CtMSYlrodr/NwPaPbWHeCYMm0MgojYrehB3oMfNRrFk97it8zNsoL
         JWkw==
X-Gm-Message-State: AOAM533Av4YmR1OXyN0HvnQBdgHfjZfWDVU/5cIIdT5kuZDi6RaMJenF
	Y8OuQDbkKZKzGPp0TH4ZjGk=
X-Google-Smtp-Source: ABdhPJx4g/HVf1ebfdBtL/JfNxGhY6W+Q0U4hjhZol5YQdSf8f3MtKVIR+0Kn3ZWjKrx/qFlC/tkjg==
X-Received: by 2002:a05:6512:2202:: with SMTP id h2mr3411408lfu.494.1631271020592;
        Fri, 10 Sep 2021 03:50:20 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id z16sm535665lfu.110.2021.09.10.03.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 03:50:20 -0700 (PDT)
Date: Fri, 10 Sep 2021 13:50:18 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Colin King <colin.king@canonical.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] fs/ntfs3: Fix a memory leak on object opts
Message-ID: <20210910105018.asvmzihjdqeqm25v@kari-VirtualBox>
References: <20210910100202.29254-1-colin.king@canonical.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910100202.29254-1-colin.king@canonical.com>

On Fri, Sep 10, 2021 at 11:02:02AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a failed allocation on sbi->upcase will cause an exit via
> the label free_sbi causing a memory leak on object opts. Fix this by
> re-ordering the exit paths free_opts and free_sbi so that kfree's occur
> in the reverse allocation order.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 27fac77707a1 ("fs/ntfs3: Init spi more in init_fs_context than fill_super")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks Colin.

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

>  fs/ntfs3/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 3cba0b5e7ac7..69f23db0d727 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1450,10 +1450,10 @@ static int ntfs_init_fs_context(struct fs_context *fc)
>  	fc->ops = &ntfs_context_ops;
>  
>  	return 0;
> -free_opts:
> -	kfree(opts);
>  free_sbi:
>  	kfree(sbi);
> +free_opts:
> +	kfree(opts);
>  	return -ENOMEM;
>  }
>  
> -- 
> 2.32.0
> 
