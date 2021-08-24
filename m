Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBDB72
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 09:03:34 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id v19so18690693lfo.7
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tww6XVE62J265ghFTkVGXgkg5lbz4z++5Ad3DbvV2v0=;
        b=j5rQGC/VUVcFs01zA0bPZ+6T6p53CUNuDWeYLpl/I18ETzkRCMfJanVwuehBYAd/ST
         9pTFsE6vXjh6hb2Q/UpvLFiRaVlQ3FYXbaRPPWhi1jm4G2PvCgLxFKWjeA7+hwELZet2
         J6psJziUUYzpJq//CVVtEQwWBHGyHqYy3Ibcg+RxmmRkyOv+m1HRljpzEuR0N1bOvxlB
         RuQE2V5FpaVw30AeTdkHzcrg1BlTn6POuJ0vb1jTWcdbYgYixLupXbOyEsF4tJk+rHCO
         ZIXFgwfobIOrSDXyveYMI6cuRHdxIoLit91NnSU2lh1GJ1hjM+r0Wd0lqdzEV0cZ/bvZ
         V1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tww6XVE62J265ghFTkVGXgkg5lbz4z++5Ad3DbvV2v0=;
        b=ITUy+4mRQDWm7xyXj9XfAiLXRwIsIitsQVraFIGY1BMdr6RKNVUhb0kV5brxPgNXYN
         jiEwqer/krgECLCUSLW62bQ0jPMNUcHgcfN9Lc/IiWyYYb/AYIcYWqOEWJThALvY+hli
         6Xct15vpeG/DskGJdcirtNaWaeDZLwMw8hJpeV8o5vqmI8ExTDaFaKqZ0tIjx6HTeQ4d
         LNREHgcDTx/F8IXmptSNnITcVvvLXUjIABC1Pzn73OzYWNaWz/ROx08JH5GyMwwvO0Vy
         DXmg4l3AFLDgy+nbLbteWJAoKHGEGmJ/oXDNeB2o9+a/Eka0lUbSQMntBcUVSqpKrY4B
         LGFg==
X-Gm-Message-State: AOAM531nQ7mZZJX2psQN6/ESqZs/X9qKPgDquSXCLcdQ2kG0kJuWGQZ/
	eBiu0pa8+sLp9x8wmySB9yw=
X-Google-Smtp-Source: ABdhPJwykt2xAx+PCjTM/YKA46NLFqqW/T+1ErGDhcJCcfeJxT2tJwGzItdj5OLURNVHE8BFKccbAw==
X-Received: by 2002:ac2:4c45:: with SMTP id o5mr2392789lfk.177.1629795812382;
        Tue, 24 Aug 2021 02:03:32 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id p1sm733035lfs.10.2021.08.24.02.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 02:03:31 -0700 (PDT)
Date: Tue, 24 Aug 2021 12:03:30 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/3] fs/ntfs3: Fix error code in indx_add_allocate()
Message-ID: <20210824090330.fmuif7e4kku2nrli@kari-VirtualBox>
References: <20210824074932.GA13096@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824074932.GA13096@kili>

On Tue, Aug 24, 2021 at 10:49:32AM +0300, Dan Carpenter wrote:
> Return -EINVAL if ni_find_attr() fails.  Don't return success.
> 
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch. It seems it is like 50/50 if this should be -ENOENT. I
just check what we do else where where !ni_find_attr().

But either way:
Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/index.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 6aa9540ece47..07d6dee0a4ba 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1499,6 +1499,7 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>  	alloc = ni_find_attr(ni, NULL, NULL, ATTR_ALLOC, in->name, in->name_len,
>  			     NULL, &mi);
>  	if (!alloc) {
> +		err = -EINVAL;
>  		if (bmp)
>  			goto out2;
>  		goto out1;
> -- 
> 2.20.1
> 
> 
