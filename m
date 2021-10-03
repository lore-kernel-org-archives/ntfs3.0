Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7233FDE
	for <ntfs3@lists.linux.dev>; Sun,  3 Oct 2021 18:33:58 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id y23so22770585lfb.0
        for <ntfs3@lists.linux.dev>; Sun, 03 Oct 2021 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6ld3v+0ySEBMVkEPVI+FUdLyKyTOtGpdAbK3HoW8fmY=;
        b=o0/sEgwPEJTjKwcRN4G7/YBpKzV5C1k2JVbKag7CsUXgFHkm+tGu80j/+sdEiihDiJ
         McZIGTZLtx082Vy9+vyhPoJwUSP+xQqlD9IvBIe4faebTuSCiwNvZFPIKlSB5PWoOa3L
         4mVtefvCMySZC0ESDrR9nwma7TSHR0mkrN5lfqiEoAjLo2iQeAzuheEkhJFPEZsNwmUo
         XHu5/m39MBDLClNt5YXi7GH4VqyMqszsiR2LmLo8SyNPpibt44lrZI1Lq6JOxUwP1C4N
         IpcwbOHUuUEOqQIUeTREmme88wQbTqZRkTDGPYJuk9wIJe5pQ8/I5uc3TWjRyRXeKtgJ
         uggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6ld3v+0ySEBMVkEPVI+FUdLyKyTOtGpdAbK3HoW8fmY=;
        b=YEegsMEVPXtmktQSv2jj42lF5maenSyhiynSlev+Gt/prrW1OxYnbMuEJLTrxgHsH0
         TJj1rn2iYYuminwGBkVKzfwLX8asaNXmtlMNXnlzyyG7SCoutUoLI/3ZYh4dcrFMxjrB
         cz9Eo2LdO5BI8uN7F/mtVQuzL1nFJVM3kFCVJvCvUNZDXLRXQqaRqyFy8RmyA6Ty8+AT
         tcj3zFYsT6kjx6WVMSMZQswkTQXh0SMdGlBu9AdtiPS//sj/UQw5yiKf4SWpNyM7L2t9
         dlHQVsVuckQFP1kQlMH85njqFICwYWMxzF2Ca3/Ln/90S9bstTi4HUn0MscXyJEwlwYI
         3zFg==
X-Gm-Message-State: AOAM533om2sjskHYHdozzmhrbbcVX7xvcJ5nCM5KbSGUQIzDui+6Se8x
	9msm1l6TaWucrZSu+GZ6JF4=
X-Google-Smtp-Source: ABdhPJyrwIHI+FgfZsnJBvZ9J1VtFdog5Zq1pnPXJlDlKclv5VEPT11Ek+8W7ElUkkDWSmEaEhzYWw==
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr10045935lfu.294.1633286036603;
        Sun, 03 Oct 2021 11:33:56 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id p23sm1353199ljm.127.2021.10.03.11.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 11:33:56 -0700 (PDT)
Date: Sun, 3 Oct 2021 21:33:54 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Keep prealloc for all types of files
Message-ID: <20211003183354.sperk5m7ertakdfz@kari-VirtualBox>
References: <ed3dc0b6-2fd4-5be0-2815-9f2504d8e1b5@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3dc0b6-2fd4-5be0-2815-9f2504d8e1b5@paragon-software.com>

On Fri, Oct 01, 2021 at 06:58:03PM +0300, Konstantin Komarov wrote:
> Fixes: xfstest generic/274

I would always hope at least couple sentence to commit message. It would
be easier if you do this in first place and I do not need to ask it
everytime. Again I'm straight away thinking why this was done this way
in a first place. There has to be reason. Was that reason totally wrong
in a first place? Does this patch has some drawbacks? Quick look it
looks it might have, but please write about it so reviewer job is little
easier and we get more meaningfull history.

This also again needs fixes tag with prober commit id as
this seems like a bug if this fix xfstests case.

> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
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
