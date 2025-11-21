Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE92D8DD4
	for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 17:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763745164; cv=none; b=Uc/uJuRIQ7lf6E5Aeey1Xbaj8Tf6Y9fbXJD5xTYTnMrf0FgPO98/lxLKjFq98Ue2K93HFKQPpqis+GDlyHMMlgHIBudgaV/M9qwYYTHABJMZFnbimmwQRQvZA7c+igNrMTgjpCkBsB6ipAnMCvFvW2z8t4QdM/JBN+OYPNXBBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763745164; c=relaxed/simple;
	bh=4knX7UdpV5PqcFPGudPF/uxcuJbYSUmyGMDEJIBJ6aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M47End10PyHYeZgOgCiScszUXOpe9rbxWnRQ6xNmGPIxa5fYvS5p5sj4PeEU2gE1+qczfFNsNClNf+5f/+FgoYLiX6LgpoNoqLhZbtJsyJTpdkTMkNPhVRpDuU7oBZwvVGHp0RRVKpWrQo4LDNgbc/jUYVStB/LT4jJ4Zow9JPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KtU+lgK2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KtU+lgK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763745161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRU2qLfbf/wNhvSHqqWH92nPqYewb6NVEbhZtNPwvUI=;
	b=KtU+lgK2JIHMhPTnrlcOFEvNZOemC2MZ+MBg6YGZ0FsIITfucxfh+HT6XJrrawsv1znYv8
	8cCPXHuEoLP3fR1+vNR92maYNl05b8qtORwInLRObCAalvA3ozGOosyIgHbQyPfYy//gIw
	2d7bJcupW+eFpa+PBI+Pq4nWOoPxKF0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-prAHXKEjN2eRE5Gjg0h6TQ-1; Fri, 21 Nov 2025 12:12:40 -0500
X-MC-Unique: prAHXKEjN2eRE5Gjg0h6TQ-1
X-Mimecast-MFC-AGG-ID: prAHXKEjN2eRE5Gjg0h6TQ_1763745160
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-787cf398a53so28017207b3.3
        for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 09:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763745160; x=1764349960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRU2qLfbf/wNhvSHqqWH92nPqYewb6NVEbhZtNPwvUI=;
        b=j4kAmXuq2A0GMLHK0wlvGRBHBjkSfszOaTSjah+Bi0l5poGZR5M/gAZQNt58jJsomd
         9PSHUJZaOQ2MOx9nK+xKLOflWwP1Im8u/l240BNVy8I/8405heQGIIVuRihF9vzkANdV
         TOO4pSONNg17q/YTUcaMthzreE6u6K29HhliaCJYJ0Tv1wjesw6uDjK3baK5SRtNwQDT
         J0FZpKYGkTHw7nmb5bCMV6hK0CjjEU8UZkcfskELykrkBxB+2Xwyv5yHooY+beBncuFZ
         E6XgNpZII1dJKUusDDt0YIqiqqqPAEVD5bATOxLHG5lp3Y6mRN116vXpgrUx9rB91vxG
         mCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcYSfnNmmxmsQTI0yx7uh7dMqhCBg+xLCatjMPXIGW1bziAcR4qnlvX3IxoZhGO4BtLvdj4g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+ydUdVodwba4Q87GJzZywFV5EXsOk2SEHd+l7E9w65yh+DPeY
	EVuulNivqt/HLriaQsSODBWRencaYW4zzdEjB8m8rRSMLYguA4Ky/zRW2jvfnc11cRAKsrzBwHq
	8sEWuEacul3fyAUCOxDoVbgnxbgYvIy6JJFrDWzYy3KTP7lUUv+yCI6ByHDS0I9Dn7BN1xM2SKA
	D/yem1OHD9VXlvJdj+URmFaKmEIv5Ypk0=
X-Gm-Gg: ASbGncvz3PSyJ0F4hBml9EcBhy/bNWmJb+aIrVZ4r7VuFdKJsS+zW7TYnQTmrsU9oUl
	hBqZO5XZOGjvHCurgOU5xAxRbRODSJWw9zdifyBL8Mu96rjVPwjXOmk9XL/XkQrFHu1Imob07xX
	w3SI5dIivNEBZvIBTZIllwRHzuXzQLq93ZJHqVbf7/lZ2DOm45fpJAaVJnvrfj7f3u
X-Received: by 2002:a05:690c:4c09:b0:787:bf16:d489 with SMTP id 00721157ae682-78a8b5681a0mr24167017b3.62.1763745160074;
        Fri, 21 Nov 2025 09:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJMtLvkeHiv5tBcVk8Zunn6fcLBfbMFj2OlEQ7sDWssH1e01yWoO2IMY4KicgI4AI0qMGjQLfshccde2mHq/o=
X-Received: by 2002:a05:690c:4c09:b0:787:bf16:d489 with SMTP id
 00721157ae682-78a8b5681a0mr24166847b3.62.1763745159764; Fri, 21 Nov 2025
 09:12:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121081748.1443507-1-zhangshida@kylinos.cn> <20251121081748.1443507-3-zhangshida@kylinos.cn>
In-Reply-To: <20251121081748.1443507-3-zhangshida@kylinos.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 21 Nov 2025 18:12:28 +0100
X-Gm-Features: AWmQ_bnhlFe4bz2evbPrSI0Jb0EHnrWDpAVAemzJqi8jgCPnPPGI5CuseKDcbLY
Message-ID: <CAHc6FU7eL6Xuoc5dYjm9pYLr=akDH6ETow_yNPR0JpLGcz8QWw@mail.gmail.com>
Subject: Re: [PATCH 2/9] block: export bio_chain_and_submit
To: zhangshida <starzhangzsd@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-nvme@lists.infradead.org, gfs2@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-xfs@vger.kernel.org, zhangshida@kylinos.cn
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zjb-UsbKPU6IFtU2oO_1xGhzTK1ftfDwcJohLhcsu_8_1763745160
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 9:27=E2=80=AFAM zhangshida <starzhangzsd@gmail.com>=
 wrote:
> From: Shida Zhang <zhangshida@kylinos.cn>
>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> ---
>  block/bio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/block/bio.c b/block/bio.c
> index 55c2c1a0020..a6912aa8d69 100644
> --- a/block/bio.c
> +++ b/block/bio.c
> @@ -363,6 +363,7 @@ struct bio *bio_chain_and_submit(struct bio *prev, st=
ruct bio *new)
>         }
>         return new;
>  }
> +EXPORT_SYMBOL_GPL(bio_chain_and_submit);
>
>  struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
>                 unsigned int nr_pages, blk_opf_t opf, gfp_t gfp)
> --
> 2.34.1

Can this and the following patches please go in a separate patch
queue? It's got nothing to do with the bug.

Thanks,
Andreas

