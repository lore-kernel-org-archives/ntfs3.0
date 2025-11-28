Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5329030E84D
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764335495; cv=none; b=r+i1+CPIeML5yXifGvki92HjS/RJPybMfYQ4M9CBek1g0NK+6HN8OgPVKo8fU25UO0SZbyh4xVbfFaBYmVT7CcPpAOnUHAQppMaJxV48vciTuI32P/s9sMyYxN/e4g7l10zYPL6UQZZ/XFlEvICkBiR6CcVaWVg19nCdLqXi9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764335495; c=relaxed/simple;
	bh=cT5VambQLzg4yYEkETS1DAEPp4cL0vkJ6BivaulYb7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWrt8U/6vgGChEGm20T4gprTzXe6qS39bhJvIyymaTdUfwjZMulYr8DHiZJ0ZY8xWUkvENdHlEUegPLOUIgML5wnvX3nRbc0e3mES0NwkzbLlQ15+UrifRZ60oz+eqchhxpRImjzxRJ7tnh3nqqGANoI5nEar5jzwfgjcOgO2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NIygpMCj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NIygpMCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764335492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDb8wvl+/S3cs8WDouA4IaIUDYl/lhw5kT6xFlbeDqo=;
	b=NIygpMCjROe06ApYalrjCwRGN6G2Tx+linFraEADItEpQw2KNmtseValASb2gjO06Aw76q
	n1FD02DdItSdCyNLrX400ubJ06v/7QuXk03zt3yYqPeTo2DW/sTEKRYaCG2V9XX/LqKz6H
	ia/Dj+q5XlYYmWUNeQDjF/EmM7g2jfs=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-RrV-7t0WPxmAB0vERJ_k3g-1; Fri, 28 Nov 2025 08:11:31 -0500
X-MC-Unique: RrV-7t0WPxmAB0vERJ_k3g-1
X-Mimecast-MFC-AGG-ID: RrV-7t0WPxmAB0vERJ_k3g_1764335490
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-64203610e3fso2397987d50.1
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 05:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764335490; x=1764940290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDb8wvl+/S3cs8WDouA4IaIUDYl/lhw5kT6xFlbeDqo=;
        b=WXuk9C6WFJhzbMz/7ZccIaIcOkgRp5Ru9LywGRLtac4sPFlJ5WTjZevduMbvQNl/TX
         vpR3zZrGh8U9pYrCVnFujv/486WT008W5CvdjgJWZjO4UMRTiXGn+3hG+P7o3HE/EFXS
         BHPpdba5acqEjrsUHBo0945oC0yru2GTjbwRkmQx3gfWFIsVKg4sSBZ/QjLRSpcO6ZZb
         KkbsbajdLuYjlE/MfYWHvlCf24Duke+KyUxkprGmXHl9vaxOb4+Um8ZPtjtGBIPvJoez
         oW2Z5trnCe4mCHYcPrzahOc/gCVuml5pHQ5rn9O2oGqvYggdLIQZoU3DajWpEMqptk21
         gxPg==
X-Forwarded-Encrypted: i=1; AJvYcCUkvwjVl8SBZfP1bb6f8+T86yeNkLJPoHuQS+rkCEEZs0sBALlnxcB12PQCKurhb6efvwmAgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIRGyvhnLWOyeODPIWRbxnjY5L3MTOmFiGJ9SaS5JysSjEoDnB
	9SxoIlPJxh201EqRvrBBSP21ePdSgwBDJHUOSaN+ipfbOwO6c0hi1VzT0E6frsyx2fHX3mQL9Wr
	z/YGaHIZUpCyRIvpHnpADkeMcQQ7pLUuIZnFZkeTS9soFBHJeK6ORyYBfsY0erxg2QAJNd2E6qc
	hsYccwime7qRZa9nUky3iYkXrcD615i8g=
X-Gm-Gg: ASbGncvb+hmhliQBcxTeMw9QRt1OavrKtedq17d0+nZCRw2mGUcflkIJJUaE1Nwt8O9
	KJ+qU9rruwkwVC15oLAXt+8DiNzs4sgf1EluWz1qlv8Piod7S1HNkNgFp10KZa7YGI2f0d/dxXZ
	dSIT7MCy/Wh8zDZ96gxI0SlfiT9+M96PjtLNKQUJGB/lgxX2jvVmdldhzUsacGQ6w+
X-Received: by 2002:a05:690e:8d2:b0:63f:bd67:7c52 with SMTP id 956f58d0204a3-64302a48446mr15103919d50.29.1764335490421;
        Fri, 28 Nov 2025 05:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpYs6Bqkkw2QMj53nrShI4JIcUgw0aEZxMMPQ2h/FT8I7boFY7Ao7pNuY9j2sTWaBF/Hvop1CT06FKU/ZbYVo=
X-Received: by 2002:a05:690e:8d2:b0:63f:bd67:7c52 with SMTP id
 956f58d0204a3-64302a48446mr15103893d50.29.1764335490100; Fri, 28 Nov 2025
 05:11:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn> <20251128083219.2332407-3-zhangshida@kylinos.cn>
In-Reply-To: <20251128083219.2332407-3-zhangshida@kylinos.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 28 Nov 2025 14:11:19 +0100
X-Gm-Features: AWmQ_bmMbDxUx7xf6l9s72idOADcxGPBv_GTFewzDFs5Yo-0xMy2x8K16_Wfsjs
Message-ID: <CAHc6FU43FWMYm2y2b9EvrFzsJdOn55s2QOMxCfRiHKVMVRqQaQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] block: prevent race condition on bi_status in __bio_chain_endio
To: zhangshida <starzhangzsd@gmail.com>
Cc: Johannes.Thumshirn@wdc.com, hch@infradead.org, gruenba@redhat.com, 
	ming.lei@redhat.com, siangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org, 
	gfs2@lists.linux.dev, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zhangshida@kylinos.cn
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sM6tPEpYZHcEew1waHC8gIqSx5iG9MW99zsbi1ir050_1764335490
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 9:32=E2=80=AFAM zhangshida <starzhangzsd@gmail.com>=
 wrote:
> From: Shida Zhang <zhangshida@kylinos.cn>
>
> Andreas point out that multiple completions can race setting
> bi_status.
>
> The check (parent->bi_status) and the subsequent write are not an
> atomic operation. The value of parent->bi_status could have changed
> between the time you read it for the if check and the time you write
> to it. So we use cmpxchg to fix the race, as suggested by Christoph.
>
> Suggested-by: Andreas Gruenbacher <agruenba@redhat.com>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> ---
>  block/bio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/block/bio.c b/block/bio.c
> index 55c2c1a0020..aa43435c15f 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -313,9 +313,12 @@ EXPORT_SYMBOL(bio_reset);
>  static struct bio *__bio_chain_endio(struct bio *bio)
>  {
>         struct bio *parent =3D bio->bi_private;
> +       blk_status_t *status =3D &parent->bi_status;
> +       blk_status_t new_status =3D bio->bi_status;
> +
> +       if (new_status !=3D BLK_STS_OK)
> +               cmpxchg(status, BLK_STS_OK, new_status);

This isn't wrong, but bi_status is explicitly set to 0 and compared
with 0 all over the place, so putting in BLK_STS_OK here doesn't
really help IMHO.

>
> -       if (bio->bi_status && !parent->bi_status)
> -               parent->bi_status =3D bio->bi_status;
>         bio_put(bio);
>         return parent;
>  }
> --
> 2.34.1
>

Thanks,
Andreas

