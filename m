Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C81518B0A
	for <ntfs3@lists.linux.dev>; Mon, 24 Nov 2025 02:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949682; cv=none; b=EWYdltoSVWOK8Y6Q31chB4IOtm9Mt3FPVqdnGyYvQe4JmDN7p3rIWj6Cw2HswrhkGvpxpeZWv7D18yT4Yip2uRE4JfJPs9qV2AaJXdI6K3dY0xatVxXV6dGKZmXBP36kQcQRMqDfy/B9gYp20CZIJofD+MlqytmRYQRj4+v7dmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949682; c=relaxed/simple;
	bh=+3kr6H4DmPEksHjU6g1IKbfBmlyqFl0Wz9vrA013Ppo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOm1qzyDFC01ymITN3LxGL17QAUbXBQW2I8Oft5ThsPg7M+MewU//BnII3PS5UfTLTB3uXeyCks6aqXFVz1yRV3wSBLpefNHrS2kEg8j7GrPcnqn9r8eiHpr/iIZ13WVVQcoKAoyCmD0WIGHJjloTb10S+n3Zcu2FtfQY6RJq8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4gTmPPB; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4gTmPPB"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2a4b6876fso558747585a.3
        for <ntfs3@lists.linux.dev>; Sun, 23 Nov 2025 18:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763949679; x=1764554479; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rihsM/MbquITk52HblBTEqieTE9a8UregXTIhN3Xc4g=;
        b=M4gTmPPBwZEnPtqmaF3v+PXABiwWCW3NRcSNBLCe5bkDH76jy6UBKWmlTRmzSmD370
         WKTB6MwrQy4Ic9YI1EkcMRSJ1Pl7gxdHryTX7hasVCBP0sN21CkzuNS8nEPwiVSVk4sS
         Xz4ZMA3LJwAHy85NfK+r2mmqkBgWjSBfeGHBQOc+JkEqEbjzkhkeSoESO62np6zjHEB6
         g1g7zsWNBKi6JAJ4OVOoXxyD0rCJ2ZtGF5qafPDXNfzb7sT+6X/LcG6mZTRBKZR4si7f
         QuRQy1ZDGCBhcPpBPbV8+HCtX1OflG1P2QEqlUVWS7j37tm1zoSxE4jN7dPxmHbaL64w
         dbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763949679; x=1764554479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rihsM/MbquITk52HblBTEqieTE9a8UregXTIhN3Xc4g=;
        b=Cdez6g5bVbfJc/Cze/4NS/+9U9/G6KVEESWZ7mAxOoE7a2+0sBpR7EMmDxE9S5o3Tb
         YTBjhubsNNQm2LlUHOA0K2RtRQp4tP1LETxtciD4OAKJhBKGlBbs62lZ7BzxNWIa79kj
         mifUAbaByLYDVlmlwiAUDL9CBx8LDyxFAcpCDRVCh1Lxy8zurVAslWOdjS2dkZ9UV6Ir
         eHjPyRYUEZTvlJpufTvjpV2xO/pEJAtNZbcST1jJL5mI3PJuSgVjlMt68T84ztydLAyA
         uZad3TQuUwPE1/AiTwElBBHORjLRsHY1wrs+9rUXYYZehuZY/6Ba90BMpqJ0XEfMCpsj
         0+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtz5NSntvh8hkapzdwc52JTnn+R2y3fKWTslXzdgwEv4HvUARcqkEhIbjlSv4DzUcx3Uu4Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAjxSvJOqPbJrssT8/g0CJr3PmvK+u2E52EVJlAg/8d7HwHJlM
	J3pgx3f8s6JyWB+1jw4uv14uj64+fnePxGa9RgVQQFhbf8mNkvdtnGYXPtLcKpGIV/4eBdMmQe2
	rVK02K7V7Ec7SUsOfs5GmG6NNWjbagAq52fzH
X-Gm-Gg: ASbGncsoiF2kpuAlbt+L4BaYPOj/WhxPv0zTSWHWCX2JAy9/podHhWXNiglTXYWfYOC
	korwEkYc+LmDWH+jgeyDsCZnwPSziyFRxRKrS388Z013xtqlETQc1Q4Jb4zD8ZYQkhmgoqS/h55
	Odozau7JXRODOZP8OPrxGs+bP9y+aW0wJDxpkbW5TSKmVrlL3FG2HrOUond1IMKkcQxoJVus8Tr
	KOgBidM0cpafuZ1pwG1RJqUHgDDypkPyy8tKk82CjthqzltSv/tX86i5d1s3fJ6j/gKRNY=
X-Google-Smtp-Source: AGHT+IFK0j8LOMDrS9m/1v8ASo3ky7d0+WiDpTykg8BeSrWtC+6aSCAuT2UVyteglGE8TJ8JAm0pjMBxqVbt9nw2ETI=
X-Received: by 2002:a05:620a:4415:b0:85b:8a42:eff9 with SMTP id
 af79cd13be357-8b33d4a706fmr1352114785a.53.1763949678764; Sun, 23 Nov 2025
 18:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121081748.1443507-1-zhangshida@kylinos.cn>
 <aSEvg8z9qxSwJmZn@fedora> <CANubcdULTQo5jF7hGSWFqXw6v5DhEg=316iFNipMbsyz64aneg@mail.gmail.com>
 <aSGmBAP0BA_2D3Po@fedora> <CAHc6FU7+riVQBX7L2uk64A355rF+DfQ6xhP425ruQ76d_SDPGA@mail.gmail.com>
 <aSMQyCJrqbIromUd@fedora> <CANubcdX4oOFkwt8Z5OEJMm7L5pusVZW0OaRiN8JyYoPN_F0DpA@mail.gmail.com>
In-Reply-To: <CANubcdX4oOFkwt8Z5OEJMm7L5pusVZW0OaRiN8JyYoPN_F0DpA@mail.gmail.com>
From: Stephen Zhang <starzhangzsd@gmail.com>
Date: Mon, 24 Nov 2025 10:00:42 +0800
X-Gm-Features: AWmQ_blmSEmZQDursBh3YUhqjicM04mA6N_YKxn2rH4yPFBEnFOKPn_NEARJprU
Message-ID: <CANubcdUG_3VwagV-cSfhp4+95Dj_e-wkxegzCdmuNieWqrehug@mail.gmail.com>
Subject: Re: Fix potential data loss and corruption due to Incorrect BIO Chain Handling
To: Ming Lei <ming.lei@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nvdimm@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-nvme@lists.infradead.org, 
	gfs2@lists.linux.dev, ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org, 
	zhangshida@kylinos.cn, Coly Li <colyli@fnnas.com>, linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stephen Zhang <starzhangzsd@gmail.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=B8=80 09:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Ming Lei <ming.lei@redhat.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8823=E6=97=
=A5=E5=91=A8=E6=97=A5 21:49=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Sat, Nov 22, 2025 at 03:56:58PM +0100, Andreas Gruenbacher wrote:
> > > On Sat, Nov 22, 2025 at 1:07=E2=80=AFPM Ming Lei <ming.lei@redhat.com=
> wrote:
> > > > > static void bio_chain_endio(struct bio *bio)
> > > > > {
> > > > >         bio_endio(__bio_chain_endio(bio));
> > > > > }
> > > >
> > > > bio_chain_endio() never gets called really, which can be thought as=
 `flag`,
> > >
> > > That's probably where this stops being relevant for the problem
> > > reported by Stephen Zhang.
> > >
> > > > and it should have been defined as `WARN_ON_ONCE(1);` for not confu=
sing people.
> > >
> > > But shouldn't bio_chain_endio() still be fixed to do the right thing
> > > if called directly, or alternatively, just BUG()? Warning and still
> > > doing the wrong thing seems a bit bizarre.
> >
> > IMO calling ->bi_end_io() directly shouldn't be encouraged.
> >
> > The only in-tree direct call user could be bcache, so is this reported
> > issue triggered on bcache?
> >

I need to confirm the details later. However, let's assume our analysis pro=
vides
a theoretical model that explains all the observed phenomena without any
inconsistencies. Furthermore, we have a real-world problem that exhibits al=
l
these same phenomena exactly.

In such a scenario, the chances that our analysis is incorrect are very low=
.

Even if bcache is not part of the running configuration, our later invetiga=
tion
will revolve around that analysis.

Therefore, what I want to explore further is: does this analysis can
really hold up
and perfectly explain everything without inconsistencies, assuming we can
introduce as much complex runtime configuration as possible?

Thanks,
Shida

> > If bcache can't call bio_endio(), I think it is fine to fix
> > bio_chain_endio().
> >
> > >
> > > I also see direct bi_end_io calls in erofs_fileio_ki_complete(),
> > > erofs_fscache_bio_endio(), and erofs_fscache_submit_bio(), so those
> > > are at least confusing.
> >
> > All looks FS bio(non-chained), so bio_chain_endio() shouldn't be involv=
ed
> > in erofs code base.
> >
>
> Okay, will add that.
>
> Thanks,
> Shida
>
> >
> > Thanks,
> > Ming
> >
