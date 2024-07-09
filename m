Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036683214
	for <ntfs3@lists.linux.dev>; Tue,  9 Jul 2024 03:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720494998; cv=none; b=tVge+ojJBB1C9leCObhix7CR91N75W9r6oWYFKA1v4Lpoa0wJRn7zG3Pt9wji+Te1uflE0a/7+Rrm0cWUqG9MkZIpDK8DNa/nXp9pVEcFJc56S78BbzSOCivOKxmed9DqqQF3bDS8zSkGXZjAsYDSPpch+ZOiIONH/UWjKxYnKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720494998; c=relaxed/simple;
	bh=RpxRDUA7DKqUSQryxfk95sPSXSgQP4tsW237vcR4CYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2+/VBPOftKylzPMvmS/I9XCIgFCM1TyfMHksR3iUIkGbci3yqNtBRloOa8hBIruMZETyPYHrV3NwtYiZb1PmqKBJjJmwdzSU4jmd1qxn+a27xUFmnvICJmjTSvOmTU88I5LEWF66pwpbOosfovo7buRDaG5gfZp5DNIyOviXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG5MZtUY; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG5MZtUY"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e03a6196223so5106176276.3
        for <ntfs3@lists.linux.dev>; Mon, 08 Jul 2024 20:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720494996; x=1721099796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb9jDkxB+1Ok48p1KLvjg+IJH44zN5XXqpFac1kCwTM=;
        b=iG5MZtUYbsxLka9Y9oGAljdZLYgrucqBm7Qub9Dp0NJilduy/3qhp4gPOFJU8J4p3R
         k5xzLfZUN8uVwBLghANx8asU7eDHwk1tWeJ80o+MFgjrkFCDTQmk0HbUXahjMzKvbsdv
         O1ECH6PtjiGvIEUHC/3NH4CCKDLLItDY3F35PeZA4L6aL9paLA0jcbpyG44HqhZfvgUI
         3WjsiZIXbYmzx3OA0vaKPewU6hc08YdUWr1HshLkoIPrwRGZY6i6coHVyFALRSSbHTIJ
         aJMzfNKkH1f5aCMMhOzNSvSVoVvz0/j11ruxBKfxMom7JoQSNU88cvxDl4KOOn11nR2u
         iQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720494996; x=1721099796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eb9jDkxB+1Ok48p1KLvjg+IJH44zN5XXqpFac1kCwTM=;
        b=A2SmxL4iendRoDmYCu8HA4QzES1/jjj8zswp8PQpoDlmHqZaI5Hg9gyGlgt1yec3uR
         w+A/5Uh7AmBp5W2nKM+0sQLd0pKW9piASOslhgOL9dAKwHRv6/2ZadkvX1kV61b4KrUB
         iwbU569rhht8UnRz5IER/710qzlfveIg3ifOOWoBYoh5gjPft6x1lxhFxUJK36KAiCxf
         qK9P4B6oAhf+5SHpsCknF2IS98RQkX80pY3sRVLLUh+pcG4RXT7sboKRI3I7Xy0bO9U2
         OxU6N73zL+PiU9QBwIkAIF5LklPxawImJpCxIOfDZ4678S/8qLcjMAPNisWG7t4iLT1+
         uXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBnqw6eKfcZrgeJaiS6vkJdDqUp0juVJG9/wT49cR8hXeN8F1/5C0qv48jYDnwUvsupOmaxmULPD9LLVCfRzeHqBTnC2E=
X-Gm-Message-State: AOJu0YyKzJWSD57OXJW43eachbw1mzFTCmGlGIjuQ8LM9/Y4yTMVxOie
	19aBDhx+egIEJ0riLlaqekPGJKetBA0yygqq5oKyEfrA34E+8AxZper4TziVWZ1Ei2WfEoaeS8+
	ttKtuvD0tNG1rT31iIZstNTr4pX0=
X-Google-Smtp-Source: AGHT+IH2xRrBUSjSf6yNwLyseFNWSLHUGu8XeLX3EGSYwDJHz1OCikWX0oNiAMAqjoZ6cANBmTJlfyhk+/jD0UMmrXk=
X-Received: by 2002:a25:d352:0:b0:e02:a14d:18f9 with SMTP id
 3f1490d57ef6-e041b07a0c4mr1661506276.32.1720494995704; Mon, 08 Jul 2024
 20:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701102935.3018-1-llfamsec@gmail.com> <202407081244.99EB198E@keescook>
In-Reply-To: <202407081244.99EB198E@keescook>
From: lei lu <llfamsec@gmail.com>
Date: Tue, 9 Jul 2024 11:16:24 +0800
Message-ID: <CAEBF3_ZGYFb94Gqpvb9RpWbccFG=c1b8LtoNiBWAsR5usxD=2Q@mail.gmail.com>
Subject: Re: [PATCH] ntfs3: Add bounds checking for dp0
To: Kees Cook <kees@kernel.org>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 3:52=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Jul 01, 2024 at 06:29:35PM +0800, lei lu wrote:
> > Added out-of-bound checking for *dp0 (DIR_PAGE_ENTRY_32).
> >
> > Signed-off-by: lei lu <llfamsec@gmail.com>
> > ---
> >  fs/ntfs3/fslog.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> > index 855519713bf7..af6f2ce9ea68 100644
> > --- a/fs/ntfs3/fslog.c
> > +++ b/fs/ntfs3/fslog.c
> > @@ -4184,10 +4184,14 @@ int log_replay(struct ntfs_inode *ni, bool *ini=
tialized)
> >       dp =3D NULL;
> >       while ((dp =3D enum_rstbl(dptbl, dp))) {
> >               struct DIR_PAGE_ENTRY_32 *dp0 =3D (struct DIR_PAGE_ENTRY_=
32 *)dp;
> > -             // NOTE: Danger. Check for of boundary.
> > -             memmove(&dp->vcn, &dp0->vcn_low,
> > -                     2 * sizeof(u64) +
> > -                             le32_to_cpu(dp->lcns_follow) * sizeof(u64=
));
> > +             // Check for of boundary.
> > +             u32 len =3D 2 * sizeof(u64) +
> > +                     le32_to_cpu(dp->lcns_follow) * sizeof(u64);
>
> Can't this calculation still overflow?

Thanks for your time.

I'm a bit confused about this. Do you mean that the value of
lcns_follow is too large=EF=BC=9F

As you said below, I will split up the memcpy into two steps:
        1) fixed members:
            dp->vcn =3D ((u64)dp0->vcn_high << 32U | dp0->vcn_low);
            dp->oldest_lsn =3D ((u64)dp0->oldest_lsn_high << 32U |
dp0->oldest_lsn_low);
        2) variable members:
            memmove(dp->page_lcns, dp0->page_lcns_low, lcns_size);

So the check will be changed to the following code:
u32 lcns_size =3D le32_to_cpu(dp->lcns_follow) * sizeof(u64);
if (PtrOffset(dptbl, &dp0->page_lcns_low) + lcns_size > t32) {
        err =3D -EINVAL;
        goto out;
}

The check makes sure that variable members don't stray beyond valid
memory region.
And the enum_rstbl is responsible for checking the boundary of fixed
members. (Refer
to another patch: Add bounds checking to enum_rstbl().)

Thanks,
LL

>
> > +             if (PtrOffset(dptbl, &dp0->vcn_low) + len > t32) {
> > +                     err =3D -EINVAL;
> > +                     goto out;
> > +             }
> > +             memmove(&dp->vcn, &dp0->vcn_low, len);
> >       }
>
> Hmm, I think this code has not been exercised under CONFIG_FORTIFY_SOURCE=
.
> This would immediately WARN at run-time: dp->vcn is a u64. This is
> writing beyond the member. Likely this needs to be split up:
>
> struct DIR_PAGE_ENTRY {
>         __le32 next;         // 0x00: RESTART_ENTRY_ALLOCATED if allocate=
d
>         __le32 target_attr;  // 0x04: Index into the Open attribute Table
>         __le32 transfer_len; // 0x08:
>         __le32 lcns_follow;  // 0x0C:
>         __le64 vcn;          // 0x10: Vcn of dirty page
>         __le64 oldest_lsn;   // 0x18:
>         __le64 page_lcns[];  // 0x20:
> };
>
> struct DIR_PAGE_ENTRY_32 {
>         __le32 next;            // 0x00: RESTART_ENTRY_ALLOCATED if alloc=
ated
>         __le32 target_attr;     // 0x04: Index into the Open attribute Ta=
ble
>         __le32 transfer_len;    // 0x08:
>         __le32 lcns_follow;     // 0x0C:
>         __le32 reserved;        // 0x10:
>         __le32 vcn_low;         // 0x14: Vcn of dirty page
>         __le32 vcn_hi;          // 0x18: Vcn of dirty page
>         __le32 oldest_lsn_low;  // 0x1C:
>         __le32 oldest_lsn_hi;   // 0x1C:
>         __le32 page_lcns_low;   // 0x24:
>         __le32 page_lcns_hi;    // 0x24:
> };
>
> dp->vcn =3D ((u64)dp0->vcn_high << 32U | dp0->vcn_low);
> dp->oldest_lsn =3D ((u64)dp0->oldest_lsn_high << 32U | dp0->oldest_lsn_lo=
w);
>
> memmove(dp->page_lcns, dp0->...?, ...)
>
>
> --
> Kees Cook
