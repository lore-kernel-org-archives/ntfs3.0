Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3F22E7186
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319113; cv=none; b=ZpMRAB5z4fYKeMiIhXZu25ie2VeAr3w+Ddqoo5kZnHtkH9NYm+wKFztb2z6hCwjrFtPMeI0Vak6mcOr/+W03g+iTrnmHgoZL8Gv8zH/yD9lWMvuHyCt3+3CrI4NWTO8AZwDy5xzaqDP+8kz/+iEAUfCod13SnTy7A74ZrUmEDTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319113; c=relaxed/simple;
	bh=mG04EOy5shg0G6MHF6boM7DuHGiLByU6HW/XuA5FyN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLR+qxRQ0ksNth/Vr4vbLJRGTiDhTdIrgp27RqyKXn+xHWEeFep5YyPt+JkcafwLZOB5eQdKE9mwim0yEnMHNz/suU0uFsA+mdvE6zGMZzsAW+qLkZ+59twcRIAeljQ+T5LtFWYLo8qJ45XyumsIDF9F3ndgywVPJB1Ef4612FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDah3nTU; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDah3nTU"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee44df7750so13668351cf.3
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764319110; x=1764923910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++QMIe2Gzi7z7FeXSAmSiuqg8P1uQ1lVTlMI6i3m06g=;
        b=FDah3nTUaudXCsXdq2+lppZtuGiQxbXnt7zX5vbbHSWCw5YD9MMMjC2EvH15CpsL3u
         HIX509u6wcpH86rIO2sGZ3n4XIQ6JqRJi4XMZII79+c0TxEIcGMeZc9LBy7/WAkn9b74
         B5GlKb7P6v3ITddyjUjQsiIxHBt+V2mJr4xxIa6wrkaNEULj7+fkJpKA7lNlBBdXEX+O
         a4laU9RjvQPfMbPlQx7P/con3zScwdP/aqUAVsuKZMpwIM8QWXcjxWt0643j//Ux3Qyi
         gNv5vrD0aH47XWp+M/EcKoUp84MM2XdtrGNUgqKL9PxM63T8dtvtL7xRtLbwYoAxU39T
         HkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319110; x=1764923910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++QMIe2Gzi7z7FeXSAmSiuqg8P1uQ1lVTlMI6i3m06g=;
        b=f6Lc+BuaVGAG5q8lSkVoFiW6xB00FzpuBGhuPnJewXm7meojdAjRaKOlbJBaOElqFj
         EUQNvJRNYI0f2mfWGDh3J5UsfCbJ52ZwoIu4JI4v4fqtxnDZkIEXWvR9h1ip4z477dtr
         WMdUnHNnp9GWAqI9ekXNuJ1V+wL63WSMvCWL5tqfAFqWsa6y1QiN+JT3nSYnh4x/IQ2y
         1upBHeoZ3Z95RxYjnAj4ug349tJSERRkZpjCM6e7GgaWriFYVEgYOa06XN7sZzLSr6YR
         mVbvA43ogvMD8IFwvZf4UZIg3Bw12gQnvnQj4UahOFjGTT2BRrRVMF6NHbrXVCpjl0qL
         q4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFN/dQwEh7A+rkN27jzkC4xcSq1NGecZ8g09rHdGKWuXHJR0wMzsvVmFI0m3W8zIN0mi8qUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnLZoSLYtWQClBsvQ5vOLVjnMgicEXL3MPVs9i1SeIaw3vcosZ
	8nv0FMfsjaAd4MaW8iFHC8MD0XQCb8HgyKdg9F/hDclhPJcDQxZaPPpNX3dCuS5OwejZziVUfh8
	WIaiJtzfJe9h7MA14WCwoSpSIuf4NQIs=
X-Gm-Gg: ASbGncsmbaBY/VCWPWiGLux91SV2dIObHqifG3GTi3A2dtlcLBhXSHcckSyQ2r6xs2g
	VxyX/yCzvE1HhlJstklGpc7EgKyRf4MMbiQ1d6O3ymfIs7Rs4+ckUvXmgC2Wq3nH0U/Pc7+4S7g
	poI0FLAqul1D/JMkLo0xJgynx1s3j4CgIGQ7KSdiI7BpOJ7gKKYSQAh/FmOzH620hW6GCfOf28s
	xomeTJAJztDuFGdLqt1/FkUJF1p6pK4oN5XRZ3cMBfMvRQBLqv6t8bZYMHYVXBqX1lvL3g=
X-Google-Smtp-Source: AGHT+IEfh/pR5dVEp+MyGlS6Z0E5USpuJd+WqXIzQcqzstZI05ioUW/B3ey2i9/MpvyCwVsDk2BTTIWfhdBYNOpApmc=
X-Received: by 2002:ac8:5a4d:0:b0:4e7:1eb9:605d with SMTP id
 d75a77b69052e-4ee5883f99cmr321417371cf.11.1764319110284; Fri, 28 Nov 2025
 00:38:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn>
In-Reply-To: <20251128083219.2332407-1-zhangshida@kylinos.cn>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Fri, 28 Nov 2025 16:37:54 +0800
X-Gm-Features: AWmQ_bkmQmYK3DJQjInSuzOGjciJ8sGZNWSCY3EbybUAu4bZJ47LIxlxmcK_q9w
Message-ID: <CANubcdUgYpxBqPrsOnFpGJK8S9DM46DT6hriu4kDckPMVzc-Fw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Fix bio chain related issues
To: Johannes.Thumshirn@wdc.com, hch@infradead.org, gruenba@redhat.com, 
	ming.lei@redhat.com, Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-block@vger.kernel.org, linux-bcache@vger.kernel.org, 
	nvdimm@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-nvme@lists.infradead.org, gfs2@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhangshida@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

zhangshida <starzhangzsd@gmail.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=94 16:32=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Shida Zhang <zhangshida@kylinos.cn>
>
> Hi all,
>
> While investigating another problem [mentioned in v1], we identified
> some buggy code in the bio chain handling logic. This series addresses
> those issues and performs related code cleanup.
>
> Patches 1-4 fix incorrect usage of bio_chain_endio().
> Patches 5-12 clean up repetitive code patterns in bio chain handling.
>
> v2:
> - Added fix for bcache.
> - Added BUG_ON() in bio_chain_endio().
> - Enhanced commit messages for each patch
>
> v1:
> https://lore.kernel.org/all/20251121081748.1443507-1-zhangshida@kylinos.c=
n/
>
>
> Shida Zhang (12):
>   block: fix incorrect logic in bio_chain_endio
>   block: prevent race condition on bi_status in __bio_chain_endio
>   md: bcache: fix improper use of bi_end_io
>   block: prohibit calls to bio_chain_endio
>   block: export bio_chain_and_submit
>   gfs2: Replace the repetitive bio chaining code patterns
>   xfs: Replace the repetitive bio chaining code patterns
>   block: Replace the repetitive bio chaining code patterns
>   fs/ntfs3: Replace the repetitive bio chaining code patterns
>   zram: Replace the repetitive bio chaining code patterns
>   nvdimm: Replace the repetitive bio chaining code patterns
>   nvmet: use bio_chain_and_submit to simplify bio chaining
>
>  block/bio.c                       | 15 ++++++++++++---
>  drivers/block/zram/zram_drv.c     |  3 +--
>  drivers/md/bcache/request.c       |  6 +++---
>  drivers/nvdimm/nd_virtio.c        |  3 +--
>  drivers/nvme/target/io-cmd-bdev.c |  3 +--
>  fs/gfs2/lops.c                    |  3 +--
>  fs/ntfs3/fsntfs.c                 | 12 ++----------
>  fs/squashfs/block.c               |  3 +--
>  fs/xfs/xfs_bio_io.c               |  3 +--
>  fs/xfs/xfs_buf.c                  |  3 +--
>  fs/xfs/xfs_log.c                  |  3 +--
>  11 files changed, 25 insertions(+), 32 deletions(-)
>
> --
> 2.34.1
>

Apologies, I missed the 'h' in the email address when CC'ing
hsiangkao@linux.alibaba.com.

Thanks,
Shida
