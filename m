Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0331835838A
	for <ntfs3@lists.linux.dev>; Tue, 14 Jul 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047727; cv=pass; b=dzkU1Ta5cgj+OnwN8B59WP3B7Bkwdj+RMJTfLQ47jyE7gMSPPS3lH0J0y1WdpWZ2qPr14CPyylmDLQ3W9QmqXvCpAiCJBMYSMqG15fIYQrfHn/rnRK+YcB3HAW/bGKYxhyZ06KymTPSvcYEezAcbVjWs+FHhVcOMtzxrE9wOd/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047727; c=relaxed/simple;
	bh=BS4boYoiJjX3OX4CPOG5Phed58mFotGn87y51WO8XBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJF13GV+L/v8wfUzNQaF27Yn6Lx92n1QtFnlz+X5l7711Sdnzl1TekOs0Hboq5HD8L8DepsuilfPPzvJElRL3eRXgQ9edHkqF9N8R/uY0OeXbz+MLHl18xvI6yEI9eHQsEBXsPd5nDRF732CqRTlTPVcoy0sxNvrHV5N7H/vcqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AY7E0m+0; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AY7E0m+0"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15d47266baso153970866b.3
        for <ntfs3@lists.linux.dev>; Tue, 14 Jul 2026 09:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784047724; cv=none;
        d=google.com; s=arc-20260327;
        b=bIvtRF+O6Fz8kZZeNH3DEPl2KtTAyXLVoDG9qm0LfK9MEgTgQTqSGuQvlJtXSlECA+
         +i+JY53Uimg4JF90zG8zTBqWC6Y5RL6t3KwYb3Tu6ofrQ+nyhM9vpmlOs6l0kn+we6+l
         5xLXKNsVI6yUoiNrdRUKhtXCWItwQSd7Qi0jcA/7IuKiY4FYqJ4o3fjJ2HVvpq3sRZMq
         O9v8rnwMXYs2YBzCi4lZqSOgH74Pz32Py91flh0Bhx0rIeXCvFkIqyqk1pVRXZQjDTA7
         pKB+xPEX7ifI60NTOvrus8nLW6Cs78fSj9YgxYDVNbQqG5wZB6Iu22V8EtdhARh7r8Bz
         aoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vcMD+yaUtO11IDD0ibJv6TowSU+/X/sSHSBr5UyokQc=;
        fh=PjqF1eC7Vdxw3OOCce++/AKdG0mYrX1Dzew7yGpR8eM=;
        b=agOQ9Q4EU2obDnCuutSoA26k2DVQWLzzuaMI8k+l7x+fDpdIjifVHS7881WLtY11Ww
         VUpqSZrFZ0joDnZA4cbo1vu13VptTKEB3Fd2wcrZ4KO/NZBMaCOhwkZ+W9KCIS9vo81F
         I8MdQARLuA5voB5qf+5o+n5eXkuDgHSy4ruXxKHhmbUPA//F0fuUsXJ6yILN1BJldBWN
         G76moEXbdRZ1ywODKs6VR+D2xtvAcwSp3QN6MGraN1XZ4W5MawALAek9M5FNT6LgK6lt
         DVuIrXT2XnojB0kn3DbPCctBlnSht4MVMIg70xVZdlntekmoBIIT7hsgtYYwNdJbdAw/
         r9+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784047724; x=1784652524; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcMD+yaUtO11IDD0ibJv6TowSU+/X/sSHSBr5UyokQc=;
        b=AY7E0m+0daIZBD1mTqH2Xjicjys+1UL0WNtHYWgcVqyiHg+EiZNqWgMpbqEPFTpJ8l
         vvakq7TAd0vai8USMA+BhMknOqTieejpgB/CI+bbbD53IIaq6M0JLWxGeRbGhi3TRjnF
         xBVj5sXqa3KvCL46alHtBp/Zf1pkCcJRCBgOLqha3QKdBqqSH9Xrwi78oVCfFNeM46jB
         bgteRV/Ul7zogBvk6lVlZulsgaLz1pbsnLuaq1h1HHTeYTIkrjhZSg57brMC/NVJyRXP
         UDnWFChY/HiCBE4GC0Y1fhr85UdyWYTy1W2XQVSbDG5wz8qU24bsRoLqWqsLq0AJq0Or
         gUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047724; x=1784652524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcMD+yaUtO11IDD0ibJv6TowSU+/X/sSHSBr5UyokQc=;
        b=r+UOfGPUELOblDf7S8obcklsKPoJJ+yhdRRHaYMNJnCOmPZfZSH8Vdio05k0MgEyoM
         GcmZ9tw76DcXJ9ezPyjYDh6K+Kf927gdU1x4ZsPFc9+YroBmvfma81pCD7+CuzngZizw
         2tgWu+kZ2hnlej5gHN0kSaXcbt91tIwPcDMciaedvDrr8GaES/4F76db73g6W9/R0JEN
         VOeXGt3XP0vJqXkwLvax2Rt5aK10ruaMHrnQg9Xt2okWuv63xLTFm+I8VRhYCLIBcg3y
         yW4rt6ivCFzmKMbR8cd9Sny9O6bkAji9w0x1q59WnQ9i2a2fOwBDHxAwuPW35wNfWtNC
         aefw==
X-Gm-Message-State: AOJu0YylZrB58o2AXJfcTeRn72pGbQNnpWmXCeHhh/mnK1Z7UM4CilQa
	gmxATmavKWBBY3KCu6DglXEmTvOcF6z64wOckYHUVS7XBKS9loKRvtEFYV0vR+JLDiWJO9zmfvr
	h2/a1f7R3fDwWcTnThS3qXBTDnYwUDZc=
X-Gm-Gg: AfdE7cn68blkMHGv9bkm9C480V0gTvfCAlk6D2MJ1zFuryU90GNViOrB0smrGIZuT66
	Jg8sG/AfwfidyZLMfFW2ARCxOtPUVEoZBQGunaUxvFODnbLR3IBfRPX2zeC4PJNrSh9EB2IrFcE
	RtoLDsqTED3ikQzr21hw/wIiDfzFZJybte6Vg06lWuZXAu3RtR84ZCglu6D1ozj8NU+aDCI/4wE
	6Zreuv4SAiFKz0MUijooOTI6uAfkMUWnkRGzMYj+UR236bneC61SKNemRraXSP6R4wP1hL0oFtc
	ICcLqNV83dpHk5AofkDD89Vm4vQg
X-Received: by 2002:a17:907:7211:b0:c16:2e4f:a372 with SMTP id
 a640c23a62f3a-c162e4fb897mr583423366b.13.1784047724051; Tue, 14 Jul 2026
 09:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610115724.1813176-2-bestswngs@gmail.com> <f58b55f3-e8c1-4af0-901a-16ef6f05af48@paragon-software.com>
In-Reply-To: <f58b55f3-e8c1-4af0-901a-16ef6f05af48@paragon-software.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Wed, 15 Jul 2026 00:48:03 +0800
X-Gm-Features: AUfX_my-z2TWN-8K3HOskDW0igAgl_klWN7tXdwHhLTFf2o3r9MQK47o8BlorME
Message-ID: <CANgPUi2q9JyNDn5PLxEaQ+LKNM_wbtuwNONFw61rZiFEohHO7A@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in
 reparse/objid init
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Xiang Mei <xmei5@asu.edu>, Weiming Wu <weiming3@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
=E4=BA=8E2026=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 00:45=E5=86=
=99=E9=81=93=EF=BC=9A
>
> On 6/10/26 13:57, Weiming Shi wrote:
>
> > From: Weiming Wu <weiming3@asu.edu>
> >
> > ntfs_reparse_init() and ntfs_objid_init() parse the index root of the
> > $Extend/$Reparse and $Extend/$ObjId metafiles (the INDEX_ROOT attribute=
s
> > named $R and $O). They read its type and rule fields through
> > resident_data(), which does not check that the resident attribute is
> > large enough to hold them.
> >
> > mi_enum_attr() accepts a resident attribute with data_off =3D=3D asize =
and
> > data_size =3D=3D 0. For such an attribute placed last in its MFT record=
,
> > resident_data() returns a pointer to the end of the record_size buffer,
> > so reading root->type / root->rule reads past the allocation.
> >
> > Use resident_data_ex(attr, sizeof(struct INDEX_ROOT)) and bail out when
> > it returns NULL, as ntfs_security_init() already does for $SDH / $SII.
> >
> > The attribute is only parsed while mounting a crafted image, so this
> > needs CAP_SYS_ADMIN.
> >
> >   BUG: KASAN: slab-out-of-bounds in ntfs_reparse_init (fs/ntfs3/fsntfs.=
c:2306)
> >   Read of size 4 at addr ffff88801219dc00 by task mount
> >    ntfs_reparse_init (fs/ntfs3/fsntfs.c:2306)
> >    ntfs_fill_super (fs/ntfs3/super.c:1604)
> >    get_tree_bdev_flags (fs/super.c:1703)
> >    vfs_get_tree (fs/super.c:1758)
> >    path_mount (fs/namespace.c:4131)
> >    __x64_sys_mount (fs/namespace.c:4360)
> >
> > Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> > Reported-by: Xiang Mei <xmei5@asu.edu>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> >   fs/ntfs3/fsntfs.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> > index d0434756029b6..42493a2da24ef 100644
> > --- a/fs/ntfs3/fsntfs.c
> > +++ b/fs/ntfs3/fsntfs.c
> > @@ -2302,8 +2302,8 @@ int ntfs_reparse_init(struct ntfs_sb_info *sbi)
> >                  goto out;
> >          }
> >
> > -       root_r =3D resident_data(attr);
> > -       if (root_r->type !=3D ATTR_ZERO ||
> > +       root_r =3D resident_data_ex(attr, sizeof(struct INDEX_ROOT));
> > +       if (!root_r || root_r->type !=3D ATTR_ZERO ||
> >              root_r->rule !=3D NTFS_COLLATION_TYPE_UINTS) {
> >                  err =3D -EINVAL;
> >                  goto out;
> > @@ -2340,8 +2340,8 @@ int ntfs_objid_init(struct ntfs_sb_info *sbi)
> >                  goto out;
> >          }
> >
> > -       root =3D resident_data(attr);
> > -       if (root->type !=3D ATTR_ZERO ||
> > +       root =3D resident_data_ex(attr, sizeof(struct INDEX_ROOT));
> > +       if (!root || root->type !=3D ATTR_ZERO ||
> >              root->rule !=3D NTFS_COLLATION_TYPE_UINTS) {
> >                  err =3D -EINVAL;
> >                  goto out;
> > --
> > 2.43.0
> >
> Hello,
>
> Very sorry for the delay.
> Your patch was applied, thank you.
>
> Regards,
> Konstantin
>

Hi Konstantin,

Thank you for the update and for applying the patch.

Best regards,
Weiming Shi
