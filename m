Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C53C8C7D
	for <ntfs3@lists.linux.dev>; Tue, 28 Jul 2026 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234632; cv=pass; b=W+B3surXuE3XI2qgEjYBsp3GHpDAFWiWOJuDgHowmcVj1SCv4KUcnHztOlOTj3ie9EYg5VUZLhQ+3zKCqLykKOmRmM8haGm8hRc+iJ7CT9uUBqUpMs5hA2PB63PnQRkS4AiDCP5tA2lvbcB/vB8E3f6N9nWSyDknCnuGY42AbBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234632; c=relaxed/simple;
	bh=5s+G1nZkZRAUd4M2imOXMt1AB/QYzg+ZZiRVg10Nvww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJts/YNq+41hlTsLEt7mliZDKTEp81SUIEr9eg2Jg1kaT6ghnLtVMn5wfsBtTILZHbLtuX+o6IHaRSFvEDeOddMljqJ8lG2VWoW68mfNiTRJxZKkLWrbrqlAhWPVVW4/YQgoAEF5MVE63JtohsS89d++t/NjUm1EwSBUrq1ZJ3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iz6nLMAj; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz6nLMAj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso5308583a12.0
        for <ntfs3@lists.linux.dev>; Tue, 28 Jul 2026 03:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785234629; cv=none;
        d=google.com; s=arc-20260327;
        b=ZzINZZ1HzPaHFrrZWANqduuPA+/qNXkraFn75PAYlsERGOvwvhkrNauiI3GhiJi2cq
         d5Hg7ZWmaEgVatJI8Ex5rvvPtXOknDTY6eH1T7ZI7dY4xvBtw4xarP2lhgqhuv5F8LgU
         AmWSSzbbAXzFFr1m74AZrYx0HeB/U7gy4aveSuHILs/DCYIupwvKfK69G03+3B4P0DzC
         Xj+lszWyvI5V/49dM5uYtWcnFTaMjsPIgdBpMV7hmqsheESBcpwV0R2NL/8gIWu4qxRK
         f7qLyigeRR1gVhNc6zljlaVsrBgT/WtiB+lwRZ07/qJLEkaGKHmrpugn7HkAit87Br2+
         Vmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uS+u7+h8g5rIJjpZWBmxPQ/8eUDEPVVagQjlIixQW20=;
        fh=rvunzd7vg9X6zQJhtfmq4ovUv1GOHSPth4FHqfpOg5M=;
        b=qcgJ/5ErYquN05cpRd65kdWiV5hAnf3R3+jBgNLNmx0AeFsPOBBCpqANw4QQNEQ0op
         f9l+oD4bcFyFjp8P8gSvNJKb0CI7qbRDgBPaawjNOusDaC9nNVVeXB8EwwNdaz91Han2
         k0Z2LJLYph0qGhRnsigatuiDy0JIrIVYifmyo0zUL3eCCO1MpNRQXSSii2jiWpesNd5O
         KefoAAjFpjhPhZUf7+I7oODa5OkZGcD5I06tKWAZUTkzTzrqpsqaphU48SiYUx38kYcD
         a4uBrwXfuQLsP4j9ds8HVHfpoO1IIsh9dnsxK60DtTJvzKmko4/prE6iicwW5PwZwq0u
         GXIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785234629; x=1785839429; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uS+u7+h8g5rIJjpZWBmxPQ/8eUDEPVVagQjlIixQW20=;
        b=Iz6nLMAjV23rZ0BGXrdzk5gWYII25lpEE2i5209kWz8zMJLgY7kAwPlEe0xHnxRu+z
         bSILZvzF6z/r2frC2cm03d/wIySp/BP8qR8mbmUukkKTO9qj2f7c4SsDfS8y4N5SjP51
         AYCySW+5di9OPnc2hEQP0lt8UpPCEwBqkQhRbX53d7PrSMcDAEVM6srCB+5mf+WPn+9e
         d8DnIczW5Uzgmc3D1LeSDvLOe8fK5YklGwdvfqEod48D5lfEDfLROw3dQcyu46b9Jnku
         n59EBsBqgeQRGRktHXsY5eQ813ZDP6/HyMEe/IzJyovFZBNM9BvHNXRb/yvJBDtYGgx2
         HJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234629; x=1785839429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS+u7+h8g5rIJjpZWBmxPQ/8eUDEPVVagQjlIixQW20=;
        b=LyL8M3YFbL404wbaT7JA9NXXg5KtDTc99EaEIN1PnDZjanz2/SHbIF3TAcAwUOcNS0
         mz7lEUAUoYhcdPTf0u8PKilz1pfAuyDBLQsyX41MQc58oBXDOQpVF3i2m2MIOOCy9mAa
         d4V+hvXGE1skF7QmeR9oFkrRQGmGGMHZWdL0fNyuUrEdFUHUSe4vTfnFbmUvdChulk2K
         fO+WgnUxKdNbLb8FBVAmfU0pBxm06TGz0m07kx2zZ5oygAcKY3c4hUcsFCzLE1/ivXCa
         +4bNqGMJuK6KRG6ZaMBC8mKeZ9j7nTuFjXU/0fb19wEXEZ8oYS+uIYh0NaCqyw4fq9J3
         WXLw==
X-Gm-Message-State: AOJu0YwoeWQmqvkyqqJKoHD43vPcLQlPKM9u0fxlzelFN0RHlS8pcSen
	yHaB6c5u3/5XTRF7mAO14QTBLq6ojffmNnXKtdcr8fcHjOtNXkc1OUQaVVXzqTFH5kt5OJKVkQy
	nJY2fqScc28TiXzWKvgmlYYlttk2bDBU=
X-Gm-Gg: AR+sD101bGULFZ9iSXC/UQqn7TWupFNrUvfPvoF3Gzg5dijMVch0XCVBjvnSuhyqEeh
	89F+PI1w+eOuqWcLwOo4XkpuTcELxJNB15qv6FMlBnM31VEDAcUng+dLjq60rf0xW9+Oo8EDYRw
	rHNwAtAwWAU5K6koun3/Lvq74xdgMyMG4S6p9ljlqpsB+F0IitmcAQNnDVsoHLxsEfFWVtkGUY/
	5N55e4jidpAs0sEea6eG2RfAgsDMaBiCauECrZBsKM4GW8yXVksqA2WzLMq8Ro4VZPYN/muqSlh
	tpwjN+Gl2mReJdxiTOEFp6fo4w==
X-Received: by 2002:a17:907:8b87:b0:c1f:304a:9a45 with SMTP id
 a640c23a62f3a-c1f72222977mr91471766b.38.1785234629067; Tue, 28 Jul 2026
 03:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623101434.1321291-2-bestswngs@gmail.com> <ab6feb90-2a8b-438e-b49b-cd30cf9ebecc@paragon-software.com>
In-Reply-To: <ab6feb90-2a8b-438e-b49b-cd30cf9ebecc@paragon-software.com>
From: Weiming Shi <bestswngs@gmail.com>
Date: Tue, 28 Jul 2026 18:29:52 +0800
X-Gm-Features: AUfX_mwKjJ4s_wbdD8qDyJbpOyjmmPaamfaewxPwAze3K5-6hNt_43S-JgywGT8
Message-ID: <CANgPUi0SOji931jMNnkA0Q4VqoyLb1dt+CMi6Myf0TUUCh-aBg@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: reject restart table growth beyond U16_MAX entries
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, Xiang Mei <xmei5@asu.edu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
=E4=BA=8E2026=E5=B9=B47=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 17:54=E5=86=
=99=E9=81=93=EF=BC=9A
>
> On 6/23/26 12:14, Weiming Shi wrote:
>
> > During $LogFile replay, log_replay() indexes the transaction table by t=
he
> > transact_id taken from the log record header.  check_log_rec() only
> > verifies that transact_id is non-zero and properly aligned, not its
> > magnitude, so a crafted image can request an arbitrarily large index.
> >
> > alloc_rsttbl_from_idx() grows the table to cover that index via
> > extend_rsttbl(), which passes the new entry count to init_rsttbl():
> >
> >          rt =3D init_rsttbl(esize, used + add);
> >
> > used + add is computed as u32 but init_rsttbl() takes a u16, and the
> > count is stored in struct RESTART_TABLE as a __le16.  When used + add
> > exceeds U16_MAX it is truncated, init_rsttbl() allocates a table far
> > smaller than the index requires, and alloc_rsttbl_from_idx() then
> > dereferences and writes at the original, untruncated offset -- an
> > out-of-bounds access past the allocation, reachable by mounting a
> > crafted NTFS image.
> >
> >   BUG: KASAN: use-after-free in alloc_rsttbl_from_idx (fs/ntfs3/fslog.c=
:950)
> >   Read of size 4 at addr ffff8880327ffff8 by task exploit
> >    alloc_rsttbl_from_idx (fs/ntfs3/fslog.c:950)
> >    log_replay (fs/ntfs3/fslog.c:4562)
> >    ntfs_loadlog_and_replay (fs/ntfs3/fsntfs.c:324)
> >    ntfs_fill_super (fs/ntfs3/super.c:1393)
> >    get_tree_bdev_flags
> >    vfs_get_tree
> >    path_mount
> >    __x64_sys_mount
> >
> > A restart table is limited to U16_MAX entries by its __le16 count, so a
> > larger growth request is invalid input.  Reject it in extend_rsttbl();
> > all callers already handle a NULL return.
> >
> > Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> > Reported-by: Xiang Mei <xmei5@asu.edu>
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> >   fs/ntfs3/fslog.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> > index f038c799e7ac..78f34442aaaa 100644
> > --- a/fs/ntfs3/fslog.c
> > +++ b/fs/ntfs3/fslog.c
> > @@ -853,6 +853,9 @@ static inline struct RESTART_TABLE *extend_rsttbl(s=
truct RESTART_TABLE *tbl,
> >          u32 used =3D le16_to_cpu(tbl->used);
> >          struct RESTART_TABLE *rt;
> >
> > +       if (used + add > U16_MAX)
> > +               return NULL;
> > +
> >          rt =3D init_rsttbl(esize, used + add);
> >          if (!rt)
> >                  return NULL;
> > --
> > 2.43.0
> >
> Hello,
>
> Sorry for the delay.
> Your patch was applied, thank you.
>
> Regards,
> Konstantin
>

Hi Konstantin,

Thank you for the update and for applying the patch.

Best regards,
Weiming Shi
