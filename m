Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618F30C60F
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235810; cv=pass; b=RAHvGvdXikRwcrGTdS7QZcVxxzxCRqQS74aHyAQPfNl+cm4thZI4gOZJTbvggPT70XK8mH+KhB1lXsSzDYsldnG6Swk5YlCMRpO1Fyf4D64QY2qG1fMTw273s9tWWnA5lh1yF5Rlf/uDeO2Hys+wkAU1cZd+6lmHj9wPls6cboA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235810; c=relaxed/simple;
	bh=1XpXzTFHWJsw8C2JyfoXebC5Ni6jg74rJbCKW4Yfwc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBua06NS6EKsOkMbJxHUJiMrxstYnEBJ+Vczcn4sSKVYzP1KJkjtTiH10af+ji2OCEhpOjJwibau96Egm1D3uX3hE45R1al1Dis/Iag6fiLVeAyiMndiFalyAamW0MnjRbICKVwXHQTa5vWf+EAcD25reX/TpipY/baArmFe3s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Spi1dBK/; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Spi1dBK/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso82438f8f.0
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 10:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782235807; cv=none;
        d=google.com; s=arc-20240605;
        b=TJ3DQzMe4+jL5GbZIgg8Ixm8C48u71J4WHizXxYPmBGB3OBukPRz600hM/XCQCxvNl
         3rpNiqmB5eGVVV3/566q4EOwajtvAXOggLlqwp/CfWo02eFx3gqY//M0x3tYyHRYsamq
         eJZ4kGaKeGtSqYqkaQasWJuBL/l6iZyvdbiJLce+f6kfqfm7kUTppSuiMDt0foDgcblK
         0Y7xfPuMLwRe4p0O5WKcEKQPT2Y43Y/Wdb0X7/zlcGi5MAmannFzbETc7K/OeSs8Yjk3
         CKRQjIDMAQidPxjyWDdiCc9+tGXwiiLYbL19sgM/ygZZI9+B0fmCqXFpalS6o4aYQcvl
         vqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RzrzEGZb0ltwNCVmNPEJth41Ktgi1EiQYCAOhqDS73Y=;
        fh=OrT0+44pb65OGitkZVyuP5zeJ0l+5z5d3C/AY1miAQo=;
        b=YquH6+yrzrrucbOeMo/QQ9StasmVEhe+vscTMQcEADeQrULOpzWs8VA9XEOh2Gj9US
         gKif55eievLgMysfoy0DYB2wr5wyXHllp0kMjY9ZHCc6nh6SlaHhfoQay943soQMl64L
         2WAFPXOM4faEiLksCIhKFmgpUo3WZl7MYV4ZbZ6GX8LrqbN6UUdTmesqo2hc+THKvOq4
         WtfAOVjL8WGHCUNIaUHFGhMPV37zohsU4k2PId3fgeJEfSqaUtNBcBDrdSG7xkehaTkc
         cupAgtTbhC7dLN6Kjw5Tig6AFWbNpRPGwXSFsmdyeifltV7Lj/OMsmW7zvHW/JWdINEk
         Sb1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782235807; x=1782840607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzrzEGZb0ltwNCVmNPEJth41Ktgi1EiQYCAOhqDS73Y=;
        b=Spi1dBK/V5mVgZ63YgmZ+zZsM/274Vpk5nOUHEpByNpTKtklSW3/gDtwNkXoIfAT+v
         CxJopNJbb/dPFKn2qzyX2MhqaYvxzWMW5Z/imZEVtGIMHIpCsKpeV1Q9ezF5J/eWfMgh
         a9vthVHUhcL9AROJDM046L/MT2WEpD6+CL/9l91IJq7/kS7yBIVv0xPEQ8D+/Vyg8c9o
         Gpm/HOE/JisPVhuQPtknfBxv8VPSbrE0anr8j+pfmoqNO28a6aSe328/h1Rh3QNCaxXp
         /tEmTxO/TNEV2/9bws2ReDDU1Nt+5KXryPM1EelXeJ/eHdGcazAfQf+pJCeHluXGhGKO
         nK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235807; x=1782840607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzrzEGZb0ltwNCVmNPEJth41Ktgi1EiQYCAOhqDS73Y=;
        b=PNjnmHEUj/zspShvgSsqEdRA4lliDw4E0Hk9OlrRi8z4uIG3PXfdSx8dbUuXr7c1ow
         vhSm+z6qkyTOxJ1yNOmJhxoMYfKFSM8hv4p60zcTJTB2zeuv74izOXwWt2vZywWbGtzl
         h0i3m1T1yInL0WqlGZ6t9LbfOCJ5aijAQPFwgXR+ggDghj4RWynSKQn5rsSIcgkvl3yY
         j4dd83DCHFA85b6tmP/KB9Q8OGyd82eXtO2ymGaxujcK7/qTQ0EVYmSdi4/AL9YP3zfl
         GLxGEiYcOo/LWk0OpmZkWfZwSKNxE9J2jY3OqhXYHP16nnMrN41mxxxZMahjZ5WZ7EQW
         xduw==
X-Forwarded-Encrypted: i=1; AHgh+RpINAw5uZLY9Qmg3d/trKajVa9+Z1GAMopmBRX2JVS0NUTBIElVMC0pHpbee327tktb7n4HRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQZulCTdi9bvl10Dms2KEreZb0ZYAAYAnwC3FyUmSqRgKiEbCV
	jYoe1IkXSNpLaTYwtZh+z8FvdhV39veMPAo5eDqH9aXKVWYD/JYE2bmEtME53rMYyV+8XCjPm+x
	Hd439GTNvFWzU9Gq7kVcsTtcfaos5ts4=
X-Gm-Gg: AfdE7ckQrAPsXaoWM+Dzu+yL4owemu86m1cKBpFzi4xcemkIBQJz6iJq90Ge9DwboaR
	/MQy0HxIllAfVARLcH4P4SBsAqL5T7E3RAravxCFFcOz1Z/PW5ohsgI369haaAMo7oQQfi6ltL+
	w+OztugJnMZl3z9oGwHfQmkPeCUIyttW0i/1uZCGzIx6q1k0ERRIbqxYHKOYukdMD6CrgDJ++xJ
	xl7QKSReQDH3GwIUGoa8jFZgyaRsFvdmzEIzkkSxIVAUgpmydfKMF4jHcyFTxXF5irmnf3ynyV2
	02f9Lf9HFFF2QCYJ4SqudL9fdnEfD53OCoIWdF+VWYOfze9x9XHo
X-Received: by 2002:a05:6000:22c6:b0:460:3233:beed with SMTP id
 ffacd0b85a97d-4666348bb1dmr24453136f8f.41.1782235807180; Tue, 23 Jun 2026
 10:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623135208.1812933-1-hch@lst.de> <20260623135208.1812933-3-hch@lst.de>
In-Reply-To: <20260623135208.1812933-3-hch@lst.de>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 23 Jun 2026 10:29:54 -0700
X-Gm-Features: AVVi8Ccm_eFaYYj-vQlgAXEMOrnUjeoeLhiRjoMn01eUhrTiB_xWHROB6LeYb7s
Message-ID: <CAJnrk1agx-qUizNzCnzvZ6Marf7u-K4EtKOak4c2MQN1sJfgNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iomap: submit read bio after each extent
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Kelu Ye <yekelu1@huawei.com>, 
	Yifan Zhao <zhaoyifan28@huawei.com>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 6:52=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Currently the iomap buffered read path tries to build up read context
> (i.e. bios for the typical block based case) over multiple iomaps as
> long as the sector matches.  This does not take into account files
> that can map to multiple different devices.  While this could be fixed
> by a bdev check in iomap_bio_read_folio_range, the building up of I/O
> over iomaps actually was a problem for the not yet merged ext2 iomap
> port, as that does want to send out I/O at the end of an indirect
> block mapped range.
>
> So instead of adding more checks move over to a model where a bio only
> spans a single iomap.  Change ->submit_read to be called after each
> iteration, and pass a force argument to indicate that the bio must
> be submitted set on the last iteration.  Switch the bio based users
> to always submit, while keeping the single submit for fuse.
>
> Fixes: dfeab2e95a75 ("erofs: add multiple device support")
> Reported-by: Kelu Ye <yekelu1@huawei.com>
> Reported-by: Yifan Zhao <zhaoyifan28@huawei.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/exfat/iomap.c       |  4 ++--
>  fs/fuse/file.c         |  6 +++++-
>  fs/iomap/bio.c         | 11 +++++++----
>  fs/iomap/buffered-io.c | 23 +++++++++++++++--------
>  fs/ntfs/aops.c         |  4 ++--
>  fs/ntfs3/inode.c       |  4 ++--
>  fs/xfs/xfs_aops.c      |  5 +++--
>  include/linux/iomap.h  |  5 +++--
>  8 files changed, 39 insertions(+), 23 deletions(-)
>
> diff --git a/fs/iomap/bio.c b/fs/iomap/bio.c
> index 0f31e35567b4..f71aaaf60301 100644
> --- a/fs/iomap/bio.c
> +++ b/fs/iomap/bio.c
> @@ -79,7 +79,8 @@ u32 iomap_finish_ioend_buffered_read(struct iomap_ioend=
 *ioend)
>  }
>
>  void iomap_bio_submit_read_endio(const struct iomap_iter *iter,
> -               struct iomap_read_folio_ctx *ctx, bio_end_io_t end_io)
> +               struct iomap_read_folio_ctx *ctx, bool force,

nit: might simplify things to drop the unused force arg

> +               bio_end_io_t end_io)
>  {
>         struct bio *bio =3D ctx->read_ctx;
>
> @@ -87,13 +88,15 @@ void iomap_bio_submit_read_endio(const struct iomap_i=
ter *iter,
>         if (iter->iomap.flags & IOMAP_F_INTEGRITY)
>                 fs_bio_integrity_alloc(bio);
>         submit_bio(bio);
> +
> +       ctx->read_ctx =3D NULL;
>  }
>  EXPORT_SYMBOL_GPL(iomap_bio_submit_read_endio);
>
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 8d4806dc46d4..06a216d37548 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
>
> @@ -642,12 +649,12 @@ void iomap_read_folio(const struct iomap_ops *ops,
>                 fsverity_readahead(ctx->vi, folio->index,
>                                    folio_nr_pages(folio));
>
> -       while ((ret =3D iomap_iter(&iter, ops)) > 0)
> +       while ((ret =3D iomap_iter(&iter, ops)) > 0) {
> +               iomap_submit_read(&iter, ctx, false);
>                 iter.status =3D iomap_read_folio_iter(&iter, ctx,
>                                 &bytes_submitted);

should the submit_read happen after the iomap_read_folio_iter() /
iomap_readahead_iter() instaed of before? From what I see, it looks
like iomap_submit_read() would hold the iter state of the next
mapping. It seems like in iomap_bio_submit_read_endio(), the
iter->iomap.flags would be the next extent's flags instead of the one
that needs to be submitted?

Thanks,
Joanne
