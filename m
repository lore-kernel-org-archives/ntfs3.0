Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50DA3A75B6
	for <ntfs3@lists.linux.dev>; Mon,  6 Jul 2026 04:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783312820; cv=pass; b=XuNGoxPGcaOJUJRl3lZvLODCUU8BwJ1fGKZtu1HYaVpF90GAXzS0kT04gzoKAOSvgO0qeJ6SeeQx8GKhjXSRKvx5btxBX8/bIPics1Kywm13WMOQdhE6bN2pVZjW8qzsiX1Vu+X+SuXgGiF3UuK7bQP3mbaTXE+awdOlWDIFpzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783312820; c=relaxed/simple;
	bh=D8AkvWV8LRM0dC6Ir9apda1Q/tm0zhoQFQDn1KfjrmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV5QVoXl3OcBC24wh4UtSZxOFV5vqWsdNP5dewgRz4O9CzyBJIttg/RxUlyvMLA3okptEkVxFXL6qE9wLly5bquYqDouDCfKwpZRgYYPoApCOmy54aIbS+z/zhP9PafKvkkdHzQS3Z9fPM1pXxtBOO79YWc6V6SJJmbSlAD+HwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4MPZXO7; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4MPZXO7"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8114a4542b2so38745747b3.1
        for <ntfs3@lists.linux.dev>; Sun, 05 Jul 2026 21:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783312818; cv=none;
        d=google.com; s=arc-20260327;
        b=MD4nQ//qgpY8Ef59X/knas9b7WsZW5d2LQdaYMcoIO0FauYjm/FHcWVh6soUOpbGWx
         OcFLmDGeP+5IGImNqJj216uhFjnzanZtf5xn1yIINRbiZtS3lMr/rcZqOro9PlknP+Z3
         vDBnSxuyBqQYnEeV8IgSZb4wlmqobHWCcsWqvJB6l8IYSvgmg61+V8J0xExJuQyqmck2
         MJ1Rbru+voE8PMnV4o6voh21IOqYDTC9w/z+d9eERK0hjlRWJNx8iUjF0c7BGO/I7llB
         Ie23O/xlvODqBrdNEuctRY8EfIjEBypaRXjxJr7VMtB9oivTf2n5BFpStvGKZIag8udx
         Gmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zOnXzH4IyieCY63L0SRNfR4gFdrJzI9y1M82tOjINV4=;
        fh=6Nl+VAwrqvY93pqCKWTJKguKO10G9y+vHTbHq3sAjw8=;
        b=euzphSGVoS3u5ZYYmTDRZ6m2htyfaJQrM58zkAJJO9k6cgJqv5DnGbFqU8Y3x8lblq
         P/Cq/L3Erm7m1HM0GT4JT3wk3MGkFv/KiKKPGJ1BlRrxxCnSzsG+DwZ+udSSrooaxf99
         QN6/kjK3Y6Xl/osMBwz2n223MmfiQOwuj25zn1XIXhMJ0G8k/bFpZIqv6Y7VuTjxjzEe
         WHZwwhrEdDHcq3G/6el3Px17pny0xlIFh6/xYf7hh9yzwAljCYyIVg0QuXtd72aoEl4b
         OHcKtDCnV4j8hBoUA5rCJLdYKfKUW+yNRT/cyX4GHXoR1e5g1QX0QNGlkEE/Nsg6Ta7g
         scpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783312818; x=1783917618; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOnXzH4IyieCY63L0SRNfR4gFdrJzI9y1M82tOjINV4=;
        b=g4MPZXO7385q9l6iNq2oAY8gc307tkag85AjZ0j/VORwF3/KktkRmDC2FYUrk10TtZ
         EppODsfbceyxug2dfUIgaom8azHZ/iZwKJWPYn/iEeC3JdJY/xf6BEMC2IdrMQ5yCFQw
         9H1Cl4YuTszUSgHvH8nkZjKCVGEMW+4N59bguxH4vygf7+KZe+/Uto5oC9GHDmVG6TGo
         c77PB/5pYiLErdaymd1AkA/Rs9SS2yxS1skmn+NceXZdqfqcq/x/xoQPvxol6QFLRv3/
         dLLWudvqAaJKX/QO+W2kS4aN2NSe1Q4P3O1wcjeqEcWtFFOFEt2u/rbw0dnsXf7/+P4x
         mIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783312818; x=1783917618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOnXzH4IyieCY63L0SRNfR4gFdrJzI9y1M82tOjINV4=;
        b=HyqPlmm2mQ6jAmBSQ2EcDudj4lxorvl/HFxkwMYAGkK9YmMbyMLDQY7dnRwOWIFvMM
         UWrUL9SyNMQ/iYFgqXJBXMA2zysqh08EC91prKJKQYZ1xhMzAXvMg9w5IB1lEk2dAN+E
         QduQ5XXl98xBEsPLYSi6wKlMZisdepXtgXxccjOLTov1I8DstGwTB2kx8jB3NXsf49fc
         stEK1Lwa5CBkleIWm8ik/TT4can6wiI3DknaEL12RLFbrEBglieapzTZBxD5uClJiasP
         gaXSDm0ON4nzDFPrzVxe0kJRV43zt+/mbMvtQxEHYao2CsHPl6qsP4cIi1lgotLglnLg
         bm6A==
X-Gm-Message-State: AOJu0Yz4LK1lWfDlMWg+tyjJaOypPEQg/QXMArh1S+Gjp8NMPwAPgWjg
	j4O006LVBdFKNNg9xGirhpcURFh9AAm3thFx5/2ow0xAVHvH4hjyjraQLXlFRc1qBpBEsvAJ35p
	/iYekQcMnUCv+HdabSU4l3Vd4HVlsDq4=
X-Gm-Gg: AfdE7cnXDHAUUWV80KOl9GJoLBBdn3mG2eJN35hKy9FFigjW6w/AmAmj7qToTaws/ls
	m00EDsWacD6T+0TVC0sVpnCMKkLB5V9WgtisP/BvYNpjhGiXPCGDuGXB6EHMLhl3Pz0nMr4dr4U
	oZvSwUVY1HPtzUYygoGHPMkus4Yhe2ArSbei2RDtWhoqkaa8C7IX97ICqhenRfUDSEGxQvYzOek
	UJYvvvRPweI4UT4JU3yu/puIhE4ghJ/gHHvpCaPXEuyOvEVECjIBdieVGBZtyH+G/wdDPYpleJS
	Lq/xx+MOLCEgZ2Q=
X-Received: by 2002:a05:690c:730a:b0:80f:9998:e614 with SMTP id
 00721157ae682-8173861628amr91069697b3.28.1783312817771; Sun, 05 Jul 2026
 21:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625031932.9412-1-skyexpoc@gmail.com>
In-Reply-To: <20260625031932.9412-1-skyexpoc@gmail.com>
From: =?UTF-8?B?SEUgV0VJ77yI44Ku44Kr44Kv77yJ?= <skyexpoc@gmail.com>
Date: Mon, 6 Jul 2026 13:40:06 +0900
X-Gm-Features: AVVi8Ce43FfU1cKW-FBAZHSrlCukoxXFF6_BDnfgxzzWAyZckTsskWpZDHXvtdQ
Message-ID: <CAOC0qyLj55itFPEurfNddWpzzcPJ4j3bvDxfWBRev_GzPLL+mw@mail.gmail.com>
Subject: Re: [PATCH v2] fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

Gentle ping on this v2. It's an attacker-controlled on-disk image heap
out-of-bounds write in ni_create_attr_list(),
reachable via setxattr on a crafted, loop-mounted NTFS image (KASAN
trace is in the commit message), which is why it's Cc'd to stable.

For the record, the fix was first posted as v1 on 2026-06-10:
https://lore.kernel.org/ntfs3/20260610002929.51765-1-skyexpoc@gmail.com/
This v2 (2026-06-25) only adds Cc: stable and widens review to
linux-fsdevel; the fix itself is unchanged from v1.

Could you let me know if you'd like any changes, or whether it can be
queued for a future bugfix pull? I'm happy to rebase or adjust as
needed.

Thanks,
HE WEI (=E3=82=AE=E3=82=AB=E3=82=AF)

hewei-gikaku <skyexpoc@gmail.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=8825=E6=97=
=A5=E5=91=A8=E5=9B=9B 12:19=E5=86=99=E9=81=93=EF=BC=9A
>
> From: HE WEI (=E3=82=AE=E3=82=AB=E3=82=AF) <skyexpoc@gmail.com>
>
> ni_create_attr_list() allocates a fixed buffer of al_aligned(record_size)
> (=3D=3D record_size) bytes and then walks every attribute of the primary =
MFT
> record, writing one ATTR_LIST_ENTRY per attribute and advancing the curso=
r
> by le_size(name_len), with no check against the end of the buffer; the
> total size is only computed after the loop.
>
> A minimum-size resident attribute occupies SIZEOF_RESIDENT (0x18 =3D 24)
> bytes on disk, but an unnamed attribute expands to le_size(0) (0x20 =3D 3=
2)
> bytes in the list.  Because the number of attributes in a record is not
> bounded (mi_enum_attr() accepts arbitrarily many equal-type, nameless
> minimum-size attributes), a crafted record packed with such attributes
> produces a list larger than record_size and overflows the heap buffer.
>
> This is reachable from a crafted, loop-mounted NTFS image: opening the fi=
le
> and adding an attribute (e.g. via setxattr) drives ntfs_set_ea() ->
> ni_insert_resident() -> ni_insert_attr() -> ni_ins_attr_ext() ->
> ni_create_attr_list().
>
>   BUG: KASAN: slab-out-of-bounds in ni_create_attr_list+0xc48/0x1058
>   Write of size 4 at addr ffff000008984c00 by task setfattr/345
>    ni_create_attr_list+0xc48/0x1058
>    ni_ins_attr_ext+0x510/0x7c0
>    ni_insert_attr+0x3f8/0x70c
>    ni_insert_resident+0xc8/0x3b0
>    ntfs_set_ea+0x66c/0xd28
>    ntfs_setxattr+0x4d8/0x5b0
>    __arm64_sys_setxattr+0xa4/0x124
>   Allocated by task 345:
>    ni_create_attr_list+0x188/0x1058
>   The buggy address belongs to the cache kmalloc-1k of size 1024
>   (the write lands at object+1024).
>
> Size the buffer from the actual attributes instead of assuming a single
> record_size is always enough.
>
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: HE WEI (=E3=82=AE=E3=82=AB=E3=82=AF) <skyexpoc@gmail.com>
> ---
> v2:
>  - Add Cc: stable@vger.kernel.org: this is an attacker-controlled on-disk
>    image heap out-of-bounds write and should be backported.
>  - No functional change from v1; widening Cc (linux-fsdevel, VFS) for
>    review, as the v1 posting received no response.
>  - Drop a redundant self Reported-by.
>
> v1: https://lore.kernel.org/all/20260610002929.51765-1-skyexpoc@gmail.com=
/
> ---
>  fs/ntfs3/frecord.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 2e901d073fe9..6488d7a415c0 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -768,10 +768,23 @@ int ni_create_attr_list(struct ntfs_inode *ni)
>         rs =3D sbi->record_size;
>
>         /*
> -        * Skip estimating exact memory requirement.
> -        * Looks like one record_size is always enough.
> +        * Compute the exact size of the attribute list.  Each attribute =
in the
> +        * record yields one ATTR_LIST_ENTRY of le_size(name_len) bytes. =
 The
> +        * minimum on-disk attribute is SIZEOF_RESIDENT (0x18) bytes, but=
 an
> +        * unnamed one expands to le_size(0) (0x20) here, so a record cra=
fted
> +        * with many such attributes needs more than a single record_size=
; the
> +        * previous fixed kzalloc(record_size) could therefore be overflo=
wed by
> +        * an attacker-controlled record.
>          */
> -       le =3D kzalloc(al_aligned(rs), GFP_NOFS);
> +       lsize =3D 0;
> +       attr =3D NULL;
> +       while ((attr =3D mi_enum_attr(ni, &ni->mi, attr)))
> +               lsize +=3D le_size(attr->name_len);
> +
> +       if (!lsize)
> +               return -EINVAL;
> +
> +       le =3D kzalloc(al_aligned(lsize), GFP_NOFS);
>         if (!le)
>                 return -ENOMEM;
>
> @@ -781,7 +794,6 @@ int ni_create_attr_list(struct ntfs_inode *ni)
>         attr =3D NULL;
>         nb =3D 0;
>         free_b =3D 0;
> -       attr =3D NULL;
>
>         for (; (attr =3D mi_enum_attr(ni, &ni->mi, attr)); le =3D Add2Ptr=
(le, sz)) {
>                 sz =3D le_size(attr->name_len);
> --
> 2.43.0
