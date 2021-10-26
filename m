Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027592CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 21:22:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bq11so1575177lfb.10
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ap5wivi5SyQcTCW7eQx851C1BSX1mQmm8q/w/t5wtyk=;
        b=Ywn0HP1HTYg2wsQpooXIArdfCkxxNTfZWD+otBlw8jgmqhbPVJI50tGqtxt/nuUfY6
         5s2lVJt92Nh56yZqETndz+E2BW0WYe2hnCGC5QGY7Zp/dOo2cDY4Ep5ehDDnXBfdAoTd
         l5r1NKqZwX6PKu5wqq5l2Wy6nwCJrew+oVUJRdUH94vtoGNCxL6vVniYoRbHZo9c/r69
         x01xiayWSEwACm40bsPYRtnjfbtDTsLE9QVhZanBk6McOnFWQYI17bCNoFC7MFB9vkDY
         ejE225/H/GPZaheo00kx9Y6i1QX4jU3Az4nj3Grn/AFgBLSgZgXvh4sKUVU3Bsb/E2pY
         2/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ap5wivi5SyQcTCW7eQx851C1BSX1mQmm8q/w/t5wtyk=;
        b=qXX3zQjFBgGdCyrqJZ71hIo7JVp0jZjTdW7Q/3UkoYT1I+mS8mL7YA+6tprd9R+Hei
         jdYGFto5VO8CgQtD7v2f7fhLDYrmOf2+UnOB7LbxUjZRMS/6V9GHF/Ezk75DcUv3pYy7
         mm6OOxZGaGS2658Ge09kqoLowfJeFsS9bCfufDe/b5sz3vOXpU5oZcqz2aQrdbT6ODA3
         X98iLCQd2V9JKSfls4Q8FSib00wVSk6+GCskDYfonJfOd4k6V2/VlLjoS9NdfB14EzjR
         fg/FMLoAPHAatnmKWSNZrCQMNfcpP7Hm/zHknzMWikdG9AMzW50QEaXr8XwoojPov3ck
         0EQg==
X-Gm-Message-State: AOAM531gbMM/EUUndtE33XhLQaWJ4lAhJ1elfd33sp3XXEwym1dLfDWh
	cwzYmIEuhYkFMT9EBCN3TdYn4fMkxRk=
X-Google-Smtp-Source: ABdhPJwJhWwWnI6Byvdp0XTwOB8YvlOHugracClbEbrCKUNCbvoDn70w39cM/2pEratz46dUkGEuGw==
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr7316301lfg.677.1635283356055;
        Tue, 26 Oct 2021 14:22:36 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id h32sm4360lfv.283.2021.10.26.14.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:22:35 -0700 (PDT)
Date: Wed, 27 Oct 2021 00:22:34 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/4] fs/ntfs3: Check new size for limits
Message-ID: <20211026212234.nfxb7fikbw2seksh@kari-VirtualBox>
References: <25b9a1b5-7738-7b36-7ead-c8faa7cacc87@paragon-software.com>
 <512a989d-c15f-d73f-09c1-74ba25eeec27@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <512a989d-c15f-d73f-09c1-74ba25eeec27@paragon-software.com>

On Mon, Oct 25, 2021 at 07:59:26PM +0300, Konstantin Komarov wrote:
> We must check size before trying to allocate.
> Size can be set for example by "ulimit -f".
> Fixes xfstest generic/228

generic/228		[21:20:39][   18.058334] run fstests generic/228 at 2021-10-26 21:20:39
 [21:20:41] 2s
Ran: generic/228
Passed all 1 tests

> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/file.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 5418e5ba64b3..efb3110e1790 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -661,7 +661,13 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
>  		/*
>  		 * Normal file: Allocate clusters, do not change 'valid' size.
>  		 */
> -		err = ntfs_set_size(inode, max(end, i_size));
> +		loff_t new_size = max(end, i_size);
> +
> +		err = inode_newsize_ok(inode, new_size);
> +		if (err)
> +			goto out;
> +
> +		err = ntfs_set_size(inode, new_size);
>  		if (err)
>  			goto out;
>  
> -- 
> 2.33.0
> 
> 
