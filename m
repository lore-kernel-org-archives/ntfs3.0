Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBD717D2
	for <ntfs3@lists.linux.dev>; Tue,  3 May 2022 05:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B16C385B4
	for <ntfs3@lists.linux.dev>; Tue,  3 May 2022 05:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651557178;
	bh=ITa2NwqXe5zLXa48uJhMNSWPpRvUDo2drvTp2+JtsD4=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=rCdJPjUWySfQ1jZvtIdn8tJ+fRt9qrPwTmotfPk28AvGQreF50malXmLIK1d1GtPq
	 HTYzjxl9fG/W05NWTqP2BVDmQVk33Lq7hrbDMJMETgy3FRxWjaDiCsAepOqY7fReob
	 pTNox8NZvwQFispufe1caFXhVS8lEvRZdakRs3wgT/1V9QbteyXP2VaL0RXhUEqFj0
	 TjBvprjVII0TvHHmB+iL2QviOBh+44RiCzeIr/1tBdiO+4+WxOEi3THU5GU6+GBZIT
	 ehR3r9VakwvKXRA8bbH69b+Ge5EnCesO5v1xIRwwkMgvXIzNx4wcbUtkKHbUn2CU9C
	 HEr3whKOktULA==
Received: by mail-wm1-f46.google.com with SMTP id k126so5877666wme.2
        for <ntfs3@lists.linux.dev>; Mon, 02 May 2022 22:52:58 -0700 (PDT)
X-Gm-Message-State: AOAM533vAiAB2xxlnn0sFeQMkR77aLW0hPv2pBSQIqKnhEAvM+Q68mdo
	Pnjub/9bfC8GEIVw/uylx6g7HWwo4IWxpva4Ccs=
X-Google-Smtp-Source: ABdhPJyNNCIH65z+ugyOzWOp33nsssQlkEfrnNFd/8Kk2TgNO4FM3ihi6IvSwEhKnj15TITSvj9jhrH9UEyu66infmg=
X-Received: by 2002:a05:600c:3503:b0:38f:fbd7:1f0d with SMTP id
 h3-20020a05600c350300b0038ffbd71f0dmr1817436wmq.170.1651557176740; Mon, 02
 May 2022 22:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a5d:4571:0:0:0:0:0 with HTTP; Mon, 2 May 2022 22:52:56 -0700 (PDT)
In-Reply-To: <20220502175342.20296-1-rdunlap@infradead.org>
References: <20220502175342.20296-1-rdunlap@infradead.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 3 May 2022 14:52:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8wWbe+xtd5jWSxmb9NF1YFYDo-2DQAJVLhZCHQaEnRSg@mail.gmail.com>
Message-ID: <CAKYAXd8wWbe+xtd5jWSxmb9NF1YFYDo-2DQAJVLhZCHQaEnRSg@mail.gmail.com>
Subject: Re: [PATCH v3] fs/ntfs3: validate BOOT sectors_per_clusters
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, 
	syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kari Argillander <kari.argillander@stargateuniverse.net>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

2022-05-03 2:53 GMT+09:00, Randy Dunlap <rdunlap@infradead.org>:
> When the NTFS BOOT sectors_per_clusters field is > 0x80,
> it represents a shift value. Make sure that the shift value is
> not too large before using it (NTFS max cluster size is 2MB).
> Return -EVINVAL if it too large.
>
> This prevents negative shift values and shift values that are
> larger than the field size.
>
> Prevents this UBSAN error:
>
>  UBSAN: shift-out-of-bounds in ../fs/ntfs3/super.c:673:16
>  shift exponent -192 is negative
>
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: syzbot+1631f09646bc214d2e76@syzkaller.appspotmail.com
> Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Cc: ntfs3@lists.linux.dev
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kari Argillander <kari.argillander@stargateuniverse.net>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
Looks good to me:)

Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks.
> ---
> v2: use Willy's suggestions
> v3: use Namjae's suggestions -- but now Konstantin can decide.
>     drop Willy's Rev-by: tag due to changes
>
>  fs/ntfs3/super.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> --- linux-next-20220428.orig/fs/ntfs3/super.c
> +++ linux-next-20220428/fs/ntfs3/super.c
> @@ -668,9 +668,11 @@ static u32 format_size_gb(const u64 byte
>
>  static u32 true_sectors_per_clst(const struct NTFS_BOOT *boot)
>  {
> -	return boot->sectors_per_clusters <= 0x80
> -		       ? boot->sectors_per_clusters
> -		       : (1u << (0 - boot->sectors_per_clusters));
> +	if (boot->sectors_per_clusters <= 0x80)
> +		return boot->sectors_per_clusters;
> +	if (boot->sectors_per_clusters >= 0xf4) /* limit shift to 2MB max */
> +		return 1U << (0 - boot->sectors_per_clusters);
> +	return -EINVAL;
>  }
>
>  /*
> @@ -713,6 +715,8 @@ static int ntfs_init_from_boot(struct su
>
>  	/* cluster size: 512, 1K, 2K, 4K, ... 2M */
>  	sct_per_clst = true_sectors_per_clst(boot);
> +	if ((int)sct_per_clst < 0)
> +		goto out;
>  	if (!is_power_of_2(sct_per_clst))
>  		goto out;
>
>
>
