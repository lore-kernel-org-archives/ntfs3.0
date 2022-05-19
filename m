Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B711FAA
	for <ntfs3@lists.linux.dev>; Thu, 19 May 2022 00:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7927C385A9
	for <ntfs3@lists.linux.dev>; Thu, 19 May 2022 00:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652921747;
	bh=+w7bxSwboW1VzAC18RChvyM/QQVFk/VXGDrhCmYTkKM=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=sj33+a6eM/yrurgd05V1SCh9AA7YADFweeVAmx8tNxRPqzYEtQwcpd08oK+zQiX9H
	 cVvMKMf1JnETwr8FhftPgWe38RNC/q4Da18MJNZzOxbevDGjx45BuX1OQgWyeLPLOj
	 s4qBg1QdmS0vHtXE8UlmTYzt/7pRYyX6ogsN+pvkJ2xeg6h9qQUifiaPm8P4+Soo8o
	 bHaHZjtcz/600JCQFnMpmSCCRU9iM/ImuEjn6/+vd4WCN7EC6ZU2H5s76M8jAoilYd
	 XbdwGhI0+HktrUnM+Gz/AJ6LOb/pRwemUVp50kWkeyL/bbQHr6laC0z8wT/musQMu9
	 y0UltHu10rmBA==
Received: by mail-wr1-f52.google.com with SMTP id k30so4961706wrd.5
        for <ntfs3@lists.linux.dev>; Wed, 18 May 2022 17:55:47 -0700 (PDT)
X-Gm-Message-State: AOAM533VI8Mm8dgrKaS1HQ43z9fyezWQUlnFmDFh3PbSqAu3igOIKFjy
	au/AgfukpjK5msSs+HRzb1K+jHHEZYdjINdRO4A=
X-Google-Smtp-Source: ABdhPJzUNgRO6DvQuX8+CsnYTnp5W7tYne/MYsgi00ftQrYYON5+oXvWIDFqia9QsujGG30+jmTKALuqGOP6lqY+cHg=
X-Received: by 2002:a5d:584a:0:b0:20c:5bad:11c1 with SMTP id
 i10-20020a5d584a000000b0020c5bad11c1mr1831044wrf.62.1652921746214; Wed, 18
 May 2022 17:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:adf:f344:0:0:0:0:0 with HTTP; Wed, 18 May 2022 17:55:45
 -0700 (PDT)
In-Reply-To: <YnjY58EpRzaZP+YC@kili>
References: <YnjY58EpRzaZP+YC@kili>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 19 May 2022 09:55:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8qxUTJLnah1Yu46j-esGKCaOb6aM-CUPNf-bvFn_e5uQ@mail.gmail.com>
Message-ID: <CAKYAXd8qxUTJLnah1Yu46j-esGKCaOb6aM-CUPNf-bvFn_e5uQ@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: Don't clear upper bits accidentally in log_replay()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Kari Argillander <kari.argillander@stargateuniverse.net>, 
	Kari Argillander <kari.argillander@gmail.com>
Content-Type: text/plain; charset="UTF-8"

2022-05-09 18:03 GMT+09:00, Dan Carpenter <dan.carpenter@oracle.com>:
> The "vcn" variable is a 64 bit.  The "log->clst_per_page" variable is a
> u32.  This means that the mask accidentally clears out the high 32 bits
> when it was only supposed to clear some low bits.  Fix this by adding a
> cast to u64.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

> ---
> Why am I getting new Smatch warnings in old ntfs3 code?  It is a mystery.
>
>  fs/ntfs3/fslog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 915f42cf07bc..0da339fda2f4 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -5057,7 +5057,7 @@ int log_replay(struct ntfs_inode *ni, bool
> *initialized)
>  		goto add_allocated_vcns;
>
>  	vcn = le64_to_cpu(lrh->target_vcn);
> -	vcn &= ~(log->clst_per_page - 1);
> +	vcn &= ~(u64)(log->clst_per_page - 1);
>
>  add_allocated_vcns:
>  	for (i = 0, vcn = le64_to_cpu(lrh->target_vcn),
> --
> 2.35.1
>
>
>
