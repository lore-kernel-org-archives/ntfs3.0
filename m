Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566ED72
	for <ntfs3@lists.linux.dev>; Sat,  9 Oct 2021 15:55:58 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id i24so50736059lfj.13
        for <ntfs3@lists.linux.dev>; Sat, 09 Oct 2021 08:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j/DYc5RlEP9xD1mKY1rOuN9uAOFnxVcUhKzBUCb0KHA=;
        b=En3HqArde3AYFU8Z4EK7mbyPL46PD3IgVLmThH7v24uSEZ65qfN7+/OX/10vE2Odce
         eQqJeLAczkojv5Jz4nI1KHgoSYvp8/xAom0MoR5x7DeUBMqiew3x8bwq4op1rmI3YtMm
         pRhE6ZKCd3Ap2z0EroxC3gABsYs1a526I46fnFxkrSlCzjAUQ+n9DVBCzuRSUjuQ7sgB
         XSIShQcQLiV/lu1FaFw3KyEeweinOExrqdgWQH/pXM49AcrA+lgVF0YRHnPGEzPuWgtI
         6GwP/+c7OtcTY02ALZGH16ycfpye0goP9dymJg5MvBayaDaXLVTHnd7BoLte0mHiEMzL
         7+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j/DYc5RlEP9xD1mKY1rOuN9uAOFnxVcUhKzBUCb0KHA=;
        b=O9mFnBnAr90HbXQ7qFfWu4MuQ08lcT5VIFT5GP+eFjyLblFmfacH+1FLmc1HDqfaVJ
         B2qTLIWHza+cPWa9HNK2LwGzbgh/2WR/RVsTXUZFPqTEifRmHrC29FWln6i0CCNezFto
         0lFElUeAgS8po7+q7qYDFn08+zj0qWozX32gbKlfozPxiANO4fqg+H4Ug0K5maW8DGeN
         ZWn2GY09YXjzVUxuZNkDwKaX/vexkOZqdLlqNCvkbjOo4khHK0ozSISWaf5kN1JxymUa
         Fo7X9ufVqzxAQMrfhBKOsn4PgoyY3hreWC9iluh0v/KRqmdvgHp28Brp1jc0b5yuxEsw
         WkgQ==
X-Gm-Message-State: AOAM530Lzlcib3kj3YwzCW3yEtwcw218TDi+yndd5LndbKrffYderHmN
	E7C4DszWlBtGjLfAFKtln2A=
X-Google-Smtp-Source: ABdhPJxLNB2YyndYag8YdX9NyMD94LLlHOHGLbAnP1JUyquRzNpjKX0xYaBP2rm+fkSMfCGpXwlRhw==
X-Received: by 2002:a05:6512:3e21:: with SMTP id i33mr16830858lfv.535.1633794956390;
        Sat, 09 Oct 2021 08:55:56 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id w18sm132498ljj.134.2021.10.09.08.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 08:55:55 -0700 (PDT)
Date: Sat, 9 Oct 2021 18:55:53 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2] fs/ntfs3: Keep prealloc for all types of files
Message-ID: <20211009155553.ujyj5zilm327ksi2@kari-VirtualBox>
References: <bb2782a2-d6af-ef7e-2e35-3b1d87a11ff7@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb2782a2-d6af-ef7e-2e35-3b1d87a11ff7@paragon-software.com>

On Tue, Oct 05, 2021 at 06:55:44PM +0300, Konstantin Komarov wrote:
> Before we haven't kept prealloc for sparse files because we thought that
> it will speed up create / write operations.
> It lead to situation, when user reserved some space for sparse file,
> filled volume, and wasn't able to write in reserved file.
> With this commit we keep prealloc.
> Now xfstest generic/274 pass.

Is it possible that you make repo for xfstests which contain changes
what you have done for it. Testing example 274 will need modifications
to xfstests so testing this will take too much time for me.

Hopefully we will get ntfs3 support to upstream xfstest but I totally
understand if you do not have time for it. That is why I ask that just
make repo for github and just but your changes to there so that someone
can make upstream support.

  Argillander

> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
> v2:
>   Expanded commit message.
> 
>  fs/ntfs3/attrib.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index 8a00fa978f5f..e8c00dda42ad 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -447,11 +447,8 @@ int attr_set_size(struct ntfs_inode *ni, enum ATTR_TYPE type,
>  again_1:
>  	align = sbi->cluster_size;
>  
> -	if (is_ext) {
> +	if (is_ext)
>  		align <<= attr_b->nres.c_unit;
> -		if (is_attr_sparsed(attr_b))
> -			keep_prealloc = false;
> -	}
>  
>  	old_valid = le64_to_cpu(attr_b->nres.valid_size);
>  	old_size = le64_to_cpu(attr_b->nres.data_size);
> @@ -461,9 +458,6 @@ int attr_set_size(struct ntfs_inode *ni, enum ATTR_TYPE type,
>  	new_alloc = (new_size + align - 1) & ~(u64)(align - 1);
>  	new_alen = new_alloc >> cluster_bits;
>  
> -	if (keep_prealloc && is_ext)
> -		keep_prealloc = false;
> -
>  	if (keep_prealloc && new_size < old_size) {
>  		attr_b->nres.data_size = cpu_to_le64(new_size);
>  		mi_b->dirty = true;
> -- 
> 2.33.0
> 
