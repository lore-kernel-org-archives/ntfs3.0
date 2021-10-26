Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876B2CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 21:31:57 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id l2so1145607lji.6
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 14:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fR7CmyWv5j/v1IBM1zaUeENIEHE69zbCNQCCs0KINhw=;
        b=OLPbJWTQvzIytBcnxLg7hdFhZTtJ3vuvNqWj1H5Y30VuslQWa5cZ6Qv4FX/qZYHjCm
         RCniammk3sg3VZRydZKlxdlNAl5Nb0WJUjgfknoQZSMrcY9tSUtx+rvmHbsujipJ4HuH
         YiW6jB++ULQn+/QNLVh/ybCdvEwzeQty9B6bjshTenQrYpQfprI/uJn6e5QasczPXbz5
         n3Sw3g1wLgWyZYyncfx07nqhjtm+0g18RQ+DRcRQedlLZiMEX0ClMWA09ZFpb4GywWBs
         Haq2rv0ZLke7JrOC9oDGldTxdUixcTjdIJt72mXL0No33w7Bk9aOtI/L32KmNI7CYeYf
         m+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fR7CmyWv5j/v1IBM1zaUeENIEHE69zbCNQCCs0KINhw=;
        b=tFKgiXGW9T/3AYQfiajTihWWWH5Yf5w5PNb1d/yMzclHErqh/JE3xziA9aQJ32mweg
         6DpJAMjTdhWU13nJb8bugeI6A42G6V0wrWEqbkRy8UHK43E6mXyAiBkS3TGleoC3cNW4
         ef5vtmnqC/M3blSG9bp3t7qT8I0riIpEfsu/bh8ftFd9BBPQv+8nJSQb5HpKfNbX8rfF
         nw+MYFAHbAjCQwzY/vK4lQi7L4w7Zms0ZmYAdOGh67JDEDSNwoSie8RUsTSLW/kK8uD5
         U5hg2xNzdsmczwLeuIRjOBhz6HxYAQ6KJCTv1IXPZA5MJoYkCTWAIeelJol/BDt/On1b
         8TyQ==
X-Gm-Message-State: AOAM532+qnJ3WF7fPgkOxWFlyFgFicKSBhO5FMiERBlhVaXzJxCuv2KM
	r4QJle7atPaKjUFkMRPA5+s=
X-Google-Smtp-Source: ABdhPJxZ3ABgW93W0StdcJXHOsH4hoaYokn3owkLAFUmTXPn9NBwbdnKx4Y3uXuGjdVeCKFxsvlulQ==
X-Received: by 2002:a2e:8719:: with SMTP id m25mr30385496lji.90.1635283915886;
        Tue, 26 Oct 2021 14:31:55 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id s19sm2102009ljp.115.2021.10.26.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:31:55 -0700 (PDT)
Date: Wed, 27 Oct 2021 00:31:53 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/4] fs/ntfs3: Update valid size if -EIOCBQUEUED
Message-ID: <20211026213153.yvddqfglffaojbqm@kari-VirtualBox>
References: <25b9a1b5-7738-7b36-7ead-c8faa7cacc87@paragon-software.com>
 <600c92df-35e9-2686-52f3-5129ccf30e5e@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <600c92df-35e9-2686-52f3-5129ccf30e5e@paragon-software.com>

On Mon, Oct 25, 2021 at 07:59:56PM +0300, Konstantin Komarov wrote:
> Update valid size if write is still in I/O queue.
> Fixes xfstest generic/240

generic/240		[21:23:16][   17.933690] run fstests generic/240 at 2021-10-26 21:23:16
 [21:23:18] 2s
Ran: generic/240
Passed all 1 tests

> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/inode.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 859951d785cb..c211c64e6b17 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -757,6 +757,7 @@ static ssize_t ntfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>  	loff_t vbo = iocb->ki_pos;
>  	loff_t end;
>  	int wr = iov_iter_rw(iter) & WRITE;
> +	size_t iter_count = iov_iter_count(iter);
>  	loff_t valid;
>  	ssize_t ret;
>  
> @@ -770,10 +771,14 @@ static ssize_t ntfs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>  				 wr ? ntfs_get_block_direct_IO_W
>  				    : ntfs_get_block_direct_IO_R);
>  
> -	if (ret <= 0)
> +	if (ret > 0)
> +		end = vbo + ret;
> +	else if (wr && -EIOCBQUEUED == ret)

ret == -EIOCBQUEUED 

> +		end = vbo + iter_count;

Use iov_iter_count() instead of tmp var?

> +	else {

Take brackets off.

>  		goto out;
> +	}
>  
> -	end = vbo + ret;
>  	valid = ni->i_valid;
>  	if (wr) {
>  		if (end > valid && !S_ISBLK(inode->i_mode)) {
> -- 
> 2.33.0
> 
> 
> 
