Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A201946F
	for <ntfs3@lists.linux.dev>; Mon,  8 Jul 2024 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720421714; cv=none; b=aEVGMPIQa8qj5PSuvg7P+FTSa+CIJgnbzAMalHc9t3UWeeafaC5BzW41DS81g3q6mWTuvKbuFfl+Gs2LVuhJQwo8NmccqQmhxNr+SAQipeco/RQg5ykUFoYQIZ47cFK0iFDl2kPk9aWTNZmt6s+0VyQgmzLtiXMjvB2si8rXOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720421714; c=relaxed/simple;
	bh=gMa1AnG73phwoi1O9zSXqiYTQMB/Zb8kbkt5rz+/6DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hVCNv3fgN1kMFfdB03NWbr5ysgOgRo0u7Xs0O0ArskXE2ge5myleGAlv0SbBXp4XqW7Zzj44AOe6OTWGJGgGfKx8pXpsCUtSwgXryp9564TCKOj+7HluRQU2BGWVcks6a+1lw8lT/z5JOUki9tnavgv/CpRPQfLmScjVJ/21CFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UvAZ5vD0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UvAZ5vD0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42666b89057so27235e9.0
        for <ntfs3@lists.linux.dev>; Sun, 07 Jul 2024 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720421710; x=1721026510; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9dKihFJHBQH2LQzDK9e9Ag8pP7Kbhb37n4OfA5zMJnE=;
        b=UvAZ5vD0Q7eWBlKmaAnrKTvMCFtUjFeD2F/Unn/NIqFwVD0K3xZpizf3lGfmgMH5Zh
         gZF1Fq2QhPN4Y70akD/kPdeJZ6gymxg+mV2Lv0dXQFoWxnNAoRUZwgiy14kCmwrPxiLV
         KVGLxxwGbl09qF4DDQBEYQP9ku7NqQ3BFzpMqO+SgF0e6i/Z0vZZWsqbT9ICgwCoKpSc
         Y+sQNIJ126thCsR1eB9bG0BpnnOTofsfQWjG5hSDTJX1NT2dKwGjufX9VTSqk9kA46fN
         wHgjzZFEs5TorLtrg1PDCyvurVqg0d8JIZwlaU1dxLiPszvasl5UAMC+JDEnyNYaG/NW
         Db1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720421710; x=1721026510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dKihFJHBQH2LQzDK9e9Ag8pP7Kbhb37n4OfA5zMJnE=;
        b=AIGBIPUfoItpA3BuLDz5P5YsNOWwgbHghqyZ4aSED+6up23OpWcG7Iqogz8BER+cC6
         fkZAIIOdYwkJpCvn8D9EvXk9Ec/H2+JxcuFUoq3G3z1Ui9ksm2mE2USEiUXw847I0+f2
         Gm0/ztN/ZN0F5DJGPs0EDsHRLhoRzjR1Af06ewo0A/NZn1P/rIR59mTBreaeDLerqW5v
         bIGHrMTlywuDMa9JaShREIF4PH4OPfFaD3Pnzo8hZA2jlt4aW9Sm3fgaX0b+JUaT+n0S
         XjIT+ytuz0LeCR6b0RY7mULNTCfA1/aWaSzJn9QXGMUaneTIaCXOZh02nPwNowC1lYcQ
         X37w==
X-Forwarded-Encrypted: i=1; AJvYcCX4+o2Q4otH8ZyQ4/436iJVe8H+geGXYsWz4OM1H0CTx+wdjAZsK7KQ9melpDQBK8tXkpU0Z2oc5C7/BxZlEcHIaBFdues=
X-Gm-Message-State: AOJu0Yzv9PRyoqXsHuT2/blItOvyqc8AGXESK5xKsUMl2HdD5GvYk0st
	j2Y/Djtyv63/Deu1d2+yEg4tA1m5NvtpAHGiKek/uvKAPd4reUEyrxs4etBPwlL+LOlj0n5dckS
	SJd0VyxMjv+MD8gCN4RFdsdMl0F5eOadePBHB
X-Google-Smtp-Source: AGHT+IFzE0MPudZsChYf45D5gI2oMz4/GllXHmTshHhW8Z3byNHJpVQJhhEw9gGlaRpCEoWZQolwNdVRB2+kKaoORCs=
X-Received: by 2002:a05:600c:4687:b0:426:5d89:896d with SMTP id
 5b1f17b1804b1-4265d898b4amr2397475e9.1.1720421709782; Sun, 07 Jul 2024
 23:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACT4Y+ZWjUE6-q1YF=ZaPjKgGZBw4JLD1v2DphSgCAVf1RzE8g@mail.gmail.com>
 <20240705135250.3587041-1-lizhi.xu@windriver.com>
In-Reply-To: <20240705135250.3587041-1-lizhi.xu@windriver.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 8 Jul 2024 08:54:57 +0200
Message-ID: <CACT4Y+YrjD=3Tn6o4FJFefDYsOCbUFWahPUp87PXXcHQsr0xXg@mail.gmail.com>
Subject: Re: [syzbot] [ntfs3?] KASAN: slab-out-of-bounds Read in mi_enum_attr
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	syzbot+a426cde6dee8c2884b0b@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, Kees Cook <keescook@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jul 2024 at 15:52, Lizhi Xu <lizhi.xu@windriver.com> wrote:
>
> On Thu, 4 Jul 2024 15:44:02 +0200, Dmitry Vyukov wrote:
> > > index 53629b1f65e9..a435df98c2b1 100644
> > > --- a/fs/ntfs3/record.c
> > > +++ b/fs/ntfs3/record.c
> > > @@ -243,14 +243,14 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
> > >                 off += asize;
> > >         }
> > >
> > > -       asize = le32_to_cpu(attr->size);
> > > -
> > >         /* Can we use the first field (attr->type). */
> > >         if (off + 8 > used) {
> > >                 static_assert(ALIGN(sizeof(enum ATTR_TYPE), 8) == 8);
> > >                 return NULL;
> > >         }
> > >
> > > +       asize = le32_to_cpu(attr->size);
> > > +
> > >         if (attr->type == ATTR_END) {
> > >                 /* End of enumeration. */
> > >                 return NULL;
> >
> > Hi Lizhi,
> >
> > I don't see this fix mailed as a patch. Do you plan to submit it officially?
> Hi Dmitry Vyukov,
> Here: https://lore.kernel.org/all/20240202033334.1784409-1-lizhi.xu@windriver.com

I don't see this patch merged upstream.  Was it lost? Perhaps it needs
to be resent.
