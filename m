Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B393D88F6
	for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776785204; cv=pass; b=P11ViMoXZ70PZL8APexE/ubhDbHu/+jsu9ApAr52LzqgjzjMA0gqDzvClbok9LZ7G8PswP55HlO84/ht6ZBe+Tc0Wb4luTRAxbtm6wXHef6E/f3YsDMtDMtKjo8OMmaZf3URhgQstpNAqSLxqxZ2OltYIGKv9OzS/bHkZ2FPu1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776785204; c=relaxed/simple;
	bh=pUWfIGEuwplRu9UrB4hDE7Ixr3zxzECOnxWzYf6obhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZM++IZF+CNxu1UdenI4ARXPAAFKXv6jRh2tD58SPRwl8JONL6Ui7aLjXDGmlFvlfu4kCR5t6viQY6+XFOaTPqUdA51RjDIKAay23wi/olTzumQ05sgu3ZPOyxG7Jg/ZUA9Voph711eMc1ljFIRRZe2ip2JC7QGlDMmKhFcRKk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K9Y4lEfR; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K9Y4lEfR"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7a469383e0bso32810127b3.2
        for <ntfs3@lists.linux.dev>; Tue, 21 Apr 2026 08:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776785201; cv=none;
        d=google.com; s=arc-20240605;
        b=VBj33u87dGp9nJ7u27Illymjc1JZ1ozvxLaFgVkp2EWVKvCyIaeejiF7vZlbghcSwj
         Eg0Rahf2TiJOBlnqCB8hTzOSCAhXZ7cdklEMo0zWNC9GPqruCvAdev6v7cGf4UbZxOnh
         lN0tfaLW7bpTLmhi8V/yc8WXMSWRh8zX8nDRScDJ0Vt2wj5urQyV0OFFhORclq38UwYB
         u5ab40+7tMjQAgQtw2QUOXnIobVfLp2eb7w7f8hQn0dsnQRRcF3nk2XtznWg2smIjKjw
         RpinpKmvZzTbWxiNYWVUrb+W9gAm84CbUSZZVd3sF9c0R3+mUvdHdpvAdxQNJ30XGBRD
         7ugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eT4+94y+hWdKSvRO7YKTfWXSkfCnyzLH5VG+Edofdl4=;
        fh=XHz6hDlSQCu/wiMZTIf8ihCbDFRcs5hhRtqF1R4nKkQ=;
        b=EMhk4WxeirR4pozJ/GO46DiWSmBaFWE8YMr7YwT+XjvmI1orZP7gNyQwjAmiLnRwGs
         dSppAoANpDkhKcjw8JmMsxnczCPYKB/Lwq3Td9CvOcJmrjB6lPHPkfglh8bWP07bmAHK
         X7+oe286B29mfa5fL2/PuHgAqkdWCjJgxQwEhMi3ilnAc60+bhuCVXWDLGKkEHbtCDZ1
         R8JRoHtww1WlaQ6DBGXinncAvhrh1ZAmJ04F1SCF7rOvUa+LEWNnelqKW7GOPkAT6hvS
         E+ZwmA5cb2gaHBSrbeiR7/BY6qsE+8ylL+kn/+n/KdsoiAl7UVV3WbdP7FMJvf/JFDD6
         nBYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776785201; x=1777390001; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eT4+94y+hWdKSvRO7YKTfWXSkfCnyzLH5VG+Edofdl4=;
        b=K9Y4lEfRfpoAeU0nkQFk1gf2datAq6DDqUY8CezudgX3EfVoN6oQGioucQpwEtIGoJ
         zJWTpbOWgwZMHd1Q/adMuAniHt+t6gwwUPlwenTL++aJC6ZdB5fnTmH7Qx2l2LWA1r53
         gz3J8nCowmGVMyUyXEnilgn8T2oC+syt8w5WuSi4XEX0o50FLUXg6WUKuDoxYEWFh+FP
         mikdbI8uvYvwNzkVc8Q75J3JreYJ1yShEVq5jCJUVr9DCi+ttqRLFpd93F0pzX9PBu2N
         a+yHAVsh8+YHqF1XYsMAX4uoajvBpA94Y8+6/YU4c2NAxGZ3vEd4Tsbwu3V6qrdjk4CX
         J6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785201; x=1777390001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT4+94y+hWdKSvRO7YKTfWXSkfCnyzLH5VG+Edofdl4=;
        b=OlZu3PvwS64lnCGsPf8JwHCEoUy+2GECTKF45m31s7vrzITHUisg7zxAbeefNd1CW4
         rsjnkYxnc9laoQPCyk+5Fi80D/Rk/t7URXjIzzIQNEbsnJ/4sH22IB/UMPJ75Yf95/Qk
         zJBWhVLUWr/S7kUuRfxVK/OFZsFCkb/6d81q/ASGTJYcTaXY5mp9DgmEnTjbcGAyUPCY
         /uAkT9hRB7MIfxcD+E5VCPCFKY9202AwF7H7PUzs8MYyirG3mLZWvZ/Mp7R8SbC/0fpt
         kHlVgXqxEJLaO1GCmkSEyDzqEkNYM8gPtUUMhdkAsYiYGzXHIjbqEQPJTP8qBpcfB5Gk
         g/xQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VaWGpElt/X1RKz/olmWWoIVIpSfYodoZsjEKueMV27DI+zLourtLfQiKCS9cVNzwwIEihpA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8GJVs6UWsedg4lmIFYGWZIAVGg6XtdusgcTywfLbNaz4CsCYQ
	31V5xbY/VklUqrFX0qAPxMltzwIar1v7bz7kD2/Nif0zXi8GrmDpJMPE7/SCu2mO5QZm1MYSNts
	G1YSHFRBpitjM4v8kPD/17zmWI9+ORfXMBvCKSf01
X-Gm-Gg: AeBDiesCPKn5B4fzHFnoowuDXKBGxN30U4nOpNJ0KllVRerGdi0X3AQUJJKEIvRH5pM
	rFsAMx/bOZbKKm+AH7KInrHVrHdn1DtzHKY2YxhNtdNBmzJzRhtXbHcVc9JvOElDw4M2Hy/G1/6
	cgqt4MQOhGa6utF2o5z6jaXSc6pPGRJzWw5Z0+eCh/BODgjh6TWWiUZirk3M050jO3TO5CbhPKL
	Z0I7Qj6edQWz8kZdhNSBmvxSg3gZU/17+DqToZvHgRvpS3rEyQSQKT6ZikKoTVbdLqKuit7gqb3
	fgx7YswflBqmcuNGN/T5tyPjjFWOYm87+M612EqMFnz4SiGMro9hsKTY6Hpc
X-Received: by 2002:a05:690e:d4a:b0:650:1af1:6a20 with SMTP id
 956f58d0204a3-6531086268fmr14658376d50.20.1776785201075; Tue, 21 Apr 2026
 08:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
 <CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
 <28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com> <CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
 <0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com> <aed5LYnQvjgWm5Rc@elver.google.com>
 <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
In-Reply-To: <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 17:26:02 +0200
X-Gm-Features: AQROBzCq0o1hLTETrMo-nbrzx2n7PB7XpYM93NYuo1Prr5dRmWIwlCdcU2wa3gw
Message-ID: <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 16:11, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 21, 2026, at 15:18, Marco Elver wrote:
> > On Tue, Apr 21, 2026 at 02:28PM +0200, Arnd Bergmann wrote:
> >
> > There appear to be 2 options to fix, see patch below:
> >
> > 1. __kcsan_nodiag wrapper to disable warnings for the kcsan_check
> >    helpers. Tested and seems to work in this case.
> >
> > 2. __attribute__((access(none, 1))) per
> > https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html:
> >    "The access attribute enables the detection of invalid or unsafe
> >    accesses by functions or their callers, as well as write-only
> >    accesses to objects that are never read from. Such accesses may be
> >    diagnosed by warnings such as -Wstringop-overflow, -Wuninitialized,
> >    -Wunused, and others."
> >
> > Option #2 seems a lot simpler. While KCSAN does read the accessed
> > memory, for the purpose of diagnostics hiding this fact from the
> > compiler is perfectly fine as it's not part of "normal" kernel code.
> >
> > Preferences?
>
> To me, 2 makes more sense. The attribute requires gcc-11 or higher,
> so you need to wrap that in a compiler version specific macro,
> but since I only saw the warning with gcc-12 and higher, that
> should be fine.
>
> I assume that gcc would be allowed to reorder code like
>
>      int i = 1;
>      __kcsan_check_write(&i, sizeof(i));
>
> to defer the initialization until after the check with
> the attribute((access(none, 1))) annotation. Is that a
> problem for kcsan?

No - kcsan is just looking for races, and in this case there'd
trivially be no race if the stack var couldn't escape (the compiler
instrumentation eliminates such stack accesses).

> Looking through your change I also see
>
> > diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> > index b041639ab406..088412189f16 100644
> > --- a/fs/ntfs3/file.c
> > +++ b/fs/ntfs3/file.c
> > @@ -73,6 +73,7 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info
> > *sbi, unsigned long arg)
> >       if (!bdev_max_discard_sectors(dev))
> >               return -EOPNOTSUPP;
> >
> > +     kcsan_check_write(&range, sizeof(range));
> >       user_range = (struct fstrim_range __user *)arg;
>
> This was probably not meant to be there.

Yes, just for testing something else.

> > @@ -273,7 +283,7 @@ static inline void __kcsan_disable_current(void) { }
> >   * @ptr: address of access
> >   * @size: size of access
> >   */
> > -#define __kcsan_check_read(ptr, size) __kcsan_check_access(ptr, size,
> > 0)
> > +#define __kcsan_check_read(ptr, size)
> > __kcsan_nodiag(__kcsan_check_access(ptr, size, 0))
>
> I don't think we need to do anything about the read and read_write
> code paths: if the compiler can see that the data passed here
> is uninitialized, warning about this is better than not warning.
>
> The problem I see was specifically for __kcsan_check_write()
> with an uninitialized pointer
>
> > @@ -282,7 +292,7 @@ static inline void __kcsan_disable_current(void) { }
> >   * @size: size of access
> >   */
> >  #define __kcsan_check_write(ptr, size)
> >         \
> > -     __kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
> > +     __kcsan_nodiag(__kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE))
>
> So if we end up using __diag_ignore(), it should be sufficient to
> add it here directly, instead of another indirection.

I merged the 2 experiments, but you get the idea.

I think I'll drop the __kcsan_nodiag stuff and just add the access
attribute - but that would go on the __kcsan_check_access function, so
it'd apply to any kind of access (read or write). The GCC docs promise
that the 'access' attribute is only for diagnostics, and should not
affect codegen.
