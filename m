Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725A8168
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 23:36:09 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id x7so29880974ljn.10
        for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 16:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fCbJk159OmyFs2BOwXv6EYcMlLEdtAwxcbo1kGetDyw=;
        b=ENGDL9TqFwLlJjW/yvg6xIwEOusjlLEWOJzXoHvkGjBJ8cTf6WeCdRqpxvVtiRs8Lb
         Vf0mAZdR5TaVVSdGKdl9EvmfhLH5iS5zxK02Qio2axrHbOgTQsNBOi4OF5oM14lky2RD
         62iQQZiT0sUY8T4Qmn2lEoidUL25wJ877S2xuf+TL1T60GrW/hT9IltRKhF0pw/ZYXAy
         /okbFF3kFtfxG4SMeiv9rogFBlOVSez9GbLitbUUeDeARfe6U+vWOyUCfrDf9Mxfd8ep
         bgCVhpzbgRMVCtdJJrM/er46IPhL/3w5MuvB56g2ML91cXD3CZJ5nw+P7hxAHxuJ0xgt
         XHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fCbJk159OmyFs2BOwXv6EYcMlLEdtAwxcbo1kGetDyw=;
        b=TrEAevIyEKrAZctsg3wBA8B3L/h6QY90GGUdMj9d3PEmn3c7tit6cAsvSuWlbeI0ed
         8S+UIhR7xKyVp+o5q1Y9Apau72hmJJLsz5sikLK04E4KQlTB3vfgVVyhmUta2IUHgMoq
         +oo+fko4Ql2xF2YLyEAK/kc0q3RUHiYLf3BU3ef1f1DmgunwzSjViBSTntWKdQeJLAu1
         qY4JN/O9lRYBZy0JbkHwboIOTpR6FP3V1aUfvaOkgwhqWWe+EJefL3DNMveO3gT2/Dzu
         LODyPq0B1+f5kGOuzAMOCritqHxt1HAU3llP5akDj3yirZQGad+DvgxCfG1sWj1D3fih
         C4zg==
X-Gm-Message-State: AOAM530No9D/ARca3XbKDk5+FfKtBR7okLw5e5ND6I70/vplzIVQVl3c
	YwQyaLMv/bOJjMkofca2JJ4=
X-Google-Smtp-Source: ABdhPJwnA+J9ycFEUTKXpKebD5V9s+E1ACP7bzJvPBoupDD5fjaXYaPOf5ZuV8gwQnmSiXoPpGyLWg==
X-Received: by 2002:a05:651c:3d9:: with SMTP id f25mr562965ljp.334.1629156967491;
        Mon, 16 Aug 2021 16:36:07 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id e7sm45939ljq.9.2021.08.16.16.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:36:07 -0700 (PDT)
Date: Tue, 17 Aug 2021 02:36:05 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Nick Desaulniers <ndesaulniers@google.com>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] fs/ntfs3: Remove unused variable cnt in
 ntfs_security_init()
Message-ID: <20210816233605.w2csfyhmebicw6k7@kari-VirtualBox>
References: <20210816193041.1164125-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816193041.1164125-1-nathan@kernel.org>

On Mon, Aug 16, 2021 at 12:30:41PM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> fs/ntfs3/fsntfs.c:1874:9: warning: variable 'cnt' set but not used
> [-Wunused-but-set-variable]
>         size_t cnt, off;
>                ^
> 1 warning generated.
> 
> It is indeed unused so remove it.
> 
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Looks like it was used for debugging or way before index_find_raw()
needed hint or something. So this should be ok.

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/fsntfs.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 92140050fb6c..c6599c514acf 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -1871,7 +1871,7 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>  	struct ATTRIB *attr;
>  	struct ATTR_LIST_ENTRY *le;
>  	u64 sds_size;
> -	size_t cnt, off;
> +	size_t off;
>  	struct NTFS_DE *ne;
>  	struct NTFS_DE_SII *sii_e;
>  	struct ntfs_fnd *fnd_sii = NULL;
> @@ -1946,7 +1946,6 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>  	sbi->security.next_off =
>  		Quad2Align(sds_size - SecurityDescriptorsBlockSize);
>  
> -	cnt = 0;
>  	off = 0;
>  	ne = NULL;
>  
> @@ -1964,8 +1963,6 @@ int ntfs_security_init(struct ntfs_sb_info *sbi)
>  		next_id = le32_to_cpu(sii_e->sec_id) + 1;
>  		if (next_id >= sbi->security.next_id)
>  			sbi->security.next_id = next_id;
> -
> -		cnt += 1;
>  	}
>  
>  	sbi->security.ni = ni;
> 
> base-commit: 96b18047a7172037ff4206720f4e889670030b41
> -- 
> 2.33.0.rc2
> 
> 
