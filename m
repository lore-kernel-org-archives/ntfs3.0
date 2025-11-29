Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FE916EB42
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 02:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764383597; cv=none; b=L2s2ue7aZqeU10mzH6rIbxx1hfvBBM7ssvdfZOIllpuoZEovr2gE3W6M+3WAZCZ7fgdOrIBEJxeYsttG0zJlGuIg+FPHQTMRtozIx3UhZ213T4GCH5uTNgw8i1d2k5vMcR47IdqyUoWN58MSo8uFXE5g/5jv15EWhiJo9XWD/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764383597; c=relaxed/simple;
	bh=gNmObkaIZK3VlWDhqKE4t58k5wTLOfMWXzJHLja63YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLlGyYYh7G6JmXnjlK+xPHC+YfTyRC2AAnwd1D1zxfDdi64cxceDFO2mHaQiD4/0vA7kJqCVRhwpfi5pzAja9CEMGMRj4HX2eqIHpSb23xGpqy5CFfEfeDJbBwBX86ELReOVZ6akKZDvoFXWqUZKs4m3DRVFHAPWjzQZH9lV3uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSdNYi41; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSdNYi41"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4edb6e678ddso31371271cf.2
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 18:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764383594; x=1764988394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Salk+Bq7Bto6CaKtKUn0rvQi1HOfk6akFnXhArcYZw=;
        b=QSdNYi41aZdzF3EONDdmk+K4PENuej3fUFLGFgW0SdI3pMEJYlM4nUB4KvPOUH4X9A
         rgzo2sNBnoOH2gRrrqGpxAPE+94J0aj3S7ZmenfYTD4RTcJFsP2JmH9lp6DfOXNrKXTy
         zg/sQuv2B3a5nO+KxTI+zvljC2jU8YIXB4rL/sft8vGN6u7wqT0wJXuEQ2gmVZPIOMaj
         iArZsc6gzMSUb36xgXCleQso+MBecXRSdiZsC73fEH8ssblv39yTQdYYbqeLCtbxxcZV
         w3FRcvBvfEk8X/vxwQ+unfOSJ0N5HnagTjvzgI25ixmHI3Pt24ApNp9yYVf2kChvlVuN
         WVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764383594; x=1764988394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Salk+Bq7Bto6CaKtKUn0rvQi1HOfk6akFnXhArcYZw=;
        b=VECHfdakMQ+RTPqIVDyCGQA5WdVv5xUOpwn9qOgNb2tUCFKf9eTAKJabZFG9AR9IAI
         7JQdmDXp29UVIv52vHWcCUvZkAl8m99GwFHUgHA3j1cQc9xOUZlhdKwzptHldCdqvyiJ
         iS4ElovbSxdtTMc2o5Dpw8snVdz2KFPOW7FfGGsCmGfuy7Ih8Ck7JIV+ag5HlbgRBZTU
         J4JR63Qxo2HU1K+bkPFj8bUJpXQPejaUNtOhlUV0t0SeDJKsIMYihO/DIKegPb5Xr544
         46/h85YQYWP6tGadWjHYaY+KgAuE2eOtCc42eoIRZhIel2oeU/cM0ZClM1UeJho38CWm
         5ZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiDWsCRGSbzO/9lcf3F6iyJu+ZoG5ldwPSa/ILFP5jRTzYvq5SLF37ldzbPZQ+KEtyghoJZg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl8K+Mv20LxWKzIIWrkO2cunGL4KHZ6gR11JrNOYIxFC3QWQ7+
	HIf/qDhBkwxoK5xNxDZHNpwqaz9rH3JJcWkFb4JBmyqBY0wi5x3zUF7fNYScpZfZfkNR1KYmYLv
	Jlm2ea8ximHJ+IinjY4+HVbLiWixwQw0=
X-Gm-Gg: ASbGncuktYyMI/xqckTW4XM73W0ce/ZuddLTEtlHee3WMJM8yq66PtBgionhmyyS0tu
	wr3PEkHWP5hml79/B5N+Kw2q09KyowbUnu6wbqYtsymhDgysnc3YcLIKVPb/6J8FJXWdBJRGKKx
	DBYKRAgtHCtx7t8vDNN+b2pGJVdnRLiMBu2S3fT0MMWwQvcdQGFxWQOHQm/gDB03l7mu+cR9IUy
	Qyy+MdEvYUEr9qIGSJrnce2jsVKtMAj6Taq0uUNd2/dUltZVaxpR9UrQEOGWsjfrJ3aig==
X-Google-Smtp-Source: AGHT+IFPyQ3Ox8QMkCC+AFAT7oHRFHqyjDP2jn77IYnsfuFY8QOZCQOTUo4k7dkGxBUwkR6gi0usD4185jOYTHNWGHI=
X-Received: by 2002:ac8:7f47:0:b0:4ee:14c3:4e6e with SMTP id
 d75a77b69052e-4ee58a44b9cmr406211541cf.2.1764383594116; Fri, 28 Nov 2025
 18:33:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251128083219.2332407-1-zhangshida@kylinos.cn>
 <20251128083219.2332407-3-zhangshida@kylinos.cn> <CADUfDZqBYdygou9BSgpC+Mg+6+vaE2q-K=i1WJB1+KAeBkS1dg@mail.gmail.com>
 <CANubcdUmUJKeabgagPTWhBd42vzOqx9oxG23FefFJVCcVa_t5A@mail.gmail.com>
In-Reply-To: <CANubcdUmUJKeabgagPTWhBd42vzOqx9oxG23FefFJVCcVa_t5A@mail.gmail.com>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Sat, 29 Nov 2025 10:32:38 +0800
X-Gm-Features: AWmQ_bkv6yGPO014px4Ar0BXIBRCkLv-alSslcloxzSsXTYX1dEXbtGPSH-grNc
Message-ID: <CANubcdU2f1+fCL9sYsrwXz-W0dzEsm_+Bds1m3W8=o_sQX30Hw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] block: prevent race condition on bi_status in __bio_chain_endio
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Johannes.Thumshirn@wdc.com, hch@infradead.org, gruenba@redhat.com, 
	ming.lei@redhat.com, linux-block@vger.kernel.org, 
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org, 
	gfs2@lists.linux.dev, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zhangshida@kylinos.cn, 
	Andreas Gruenbacher <agruenba@redhat.com>, Gao Xiang <hsiangkao@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stephen Zhang <starzhangzsd@gmail.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8829=
=E6=97=A5=E5=91=A8=E5=85=AD 09:47=E5=86=99=E9=81=93=EF=BC=9A
>
> Caleb Sander Mateos <csander@purestorage.com> =E4=BA=8E2025=E5=B9=B411=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=85=AD 03:44=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Nov 28, 2025 at 12:34=E2=80=AFAM zhangshida <starzhangzsd@gmail=
.com> wrote:
> > >
> > > From: Shida Zhang <zhangshida@kylinos.cn>
> > >
> > > Andreas point out that multiple completions can race setting
> > > bi_status.
> > >
> > > The check (parent->bi_status) and the subsequent write are not an
> > > atomic operation. The value of parent->bi_status could have changed
> > > between the time you read it for the if check and the time you write
> > > to it. So we use cmpxchg to fix the race, as suggested by Christoph.
> > >
> > > Suggested-by: Andreas Gruenbacher <agruenba@redhat.com>
> > > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > > Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> > > ---
> > >  block/bio.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/block/bio.c b/block/bio.c
> > > index 55c2c1a0020..aa43435c15f 100644
> > > --- a/block/bio.c
> > > +++ b/block/bio.c
> > > @@ -313,9 +313,12 @@ EXPORT_SYMBOL(bio_reset);
> > >  static struct bio *__bio_chain_endio(struct bio *bio)
> > >  {
> > >         struct bio *parent =3D bio->bi_private;
> > > +       blk_status_t *status =3D &parent->bi_status;
> >
> > nit: this variable seems unnecessary, just use &parent->bi_status
> > directly in the one place it's needed?
> >
>
> Thanks, Caleb and Andreas. I will integrate your suggestions to:
>
>       if (!bio->bi_status)
>                cmpxchg(&parent->bi_status, 0, bio->bi_status);
>

Sorry, it should be:
      if (bio->bi_status)
              cmpxchg(&parent->bi_status, 0, bio->bi_status);

Thanks,
Shida

> Thanks,
> Shida
>
> > Best,
> > Caleb
> >
> > > +       blk_status_t new_status =3D bio->bi_status;
> > > +
> > > +       if (new_status !=3D BLK_STS_OK)
> > > +               cmpxchg(status, BLK_STS_OK, new_status);
> > >
> > > -       if (bio->bi_status && !parent->bi_status)
> > > -               parent->bi_status =3D bio->bi_status;
> > >         bio_put(bio);
> > >         return parent;
> > >  }
> > > --
> > > 2.34.1
> > >
> > >
