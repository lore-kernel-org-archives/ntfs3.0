Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6552D8DDF
	for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 21:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776894661; cv=pass; b=Iyp8lrDeP6x48MxdnNn/O2/nipbZrblUJ22RfcPtqgsd+e5mYtcyxJDvDzzQZULtbwA+c6waQZTcN3TzgkB4rhoa5vbbVbhIlYvSqbWOO/M0vVBIcOkO9yztWcMG7f3Fv7ew5q+PppRAsbSkTiv+5TJe1D7FkGkadRr/2Rv/c3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776894661; c=relaxed/simple;
	bh=SOo/zRHLVYuK8DVV7zjvopno+C/ln/L6TWOKE2q472U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVPUyFB7fVUftcmzY34L8V4gokJepydH0fTubhTIgF6qgxEZspx9xeRP3XScxxMkYXsOOC7DB8izzcJcgXWXWZY8XNOjqzZMglFM8IZhGDtAahFENoNZi/aNpto+5WkuFlHdUUKdnxBIbWhvhzbsmKyTcZWLVUPToA034Z5Krqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DzRucydf; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DzRucydf"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c726f46baso7391449c88.1
        for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 14:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776894659; cv=none;
        d=google.com; s=arc-20240605;
        b=Md8+LUlW+7v8A0ej7A7p4N317cj0uEyoRtG64u1wM33J6aADK7KB9dFLw0C/4XgUp9
         YIUgNawhBz9u+o0vukCeoFl8FUCCagpcMTyGslJclYRDUGwXXTplQLcqDARtKnKmCh4k
         gA2Cx9fR5qxHvVVdLsDNLbJ0cvpQLFIBv6XNiQnwuqCkECGxchiWYBdmz9iiD7Phn0SI
         T8OQ/VbiaMai84uLOp7jVNgYTi4McXLbDdoBJHOJbQAANGUjTiRK+KRxuxebYrNPAiav
         CFUeHjKE2iQ39Pm2ZM5+2ndiaX4tKT0m10i7A5j9XCTW7st34aSIj2nmgRUIphD7nv8i
         a5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SOo/zRHLVYuK8DVV7zjvopno+C/ln/L6TWOKE2q472U=;
        fh=b3HfyqZJZ1gTxZOjTD8jl8szJ4kWaUoEBGd6rnmwRdk=;
        b=Fhrhp//PZ4h40zxcJvdlm9Uab0p0Qf0ZmN5f+dWUPnDZKhP52cMFftEVBe48LJSV0J
         G5EumK4sT4OUvGArB5cNYCAKb8ZotZQgVe1YoqqB4pQkZa1LOOW3TgWHB2gg0KOHFl8M
         ADrzeUx96xSnTBVKw8yYDO17b9W3O0j4e6YTJMRMikuVStGntP0j83OfabkDQ42Cfuql
         /jIl2lvmFpvPbHQSET/3wvhzXx3PnAOT/NvuO8gA5E9uJjzo+/BuAn/vAoyMT2/OSpMV
         CetewvrJDPbLcxEAYk1UmU/z26U8H4SvXLtZhqwz9plK4U6EXHGhZDCYTmWemukuHOKG
         y6bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776894659; x=1777499459; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SOo/zRHLVYuK8DVV7zjvopno+C/ln/L6TWOKE2q472U=;
        b=DzRucydf+hIl8nw5J1uoh5IxaNdvPdt06U8zvgzfOgtPiNbjwnrB9oWlDr6uWI9XIX
         BdeRw7nXt9c+NrJg9ww8S3KbtahxK0Rc0y+sEkf2MYRRpyKl3HEdrhQZWidFXhFj1J6c
         CiXfdMbFnoAmnxteMs+ctiJ8ceEKvGYFwK9ImSUWLpIlKo9ssIScMe8JU4hc3uB0Mzjm
         h/EvLKP9gCRCZYCtr/3acwzc8FrWfr5S454lZwAvlziznqQ05XwFAVz/QkO8FtKXtxIa
         /conAkyzbmyAuq33zWgd4sFaVABqVZdXF/3BCjd7K5BhhHnTWfy77nv6Y3v1Ok7QeJVC
         7pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776894659; x=1777499459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOo/zRHLVYuK8DVV7zjvopno+C/ln/L6TWOKE2q472U=;
        b=VeU//QWNCpAQJQF1vbbYFFtPD+jPoYvw6R+DwE5IiUQy5QBnEYYJB3Zihp3VbgsfBh
         +0WdKQdig19z2jDRAQHyTdh2svHpxqW8mBi9HNTVjeVCpe5JpBEM+/VTKL0jDJrUyOzf
         bjE4D2ma2zwoHBcWGr18elQlePz2aE+AaG8SfzDL9RmLZpjQ51DgN+78RUfGWxP2GT8z
         mm5ONEPRwEIf8qQNZKxRwfHx/BdZQllI/6DDLpH4m3hTdOuh5lT5lFx8gpFW1BucBVj4
         pFdFHsI7BBLi/fxVJvJGFUi94Effyml/gxkHwakGlYnLU83HSdRU97nhj0/uwliye+GQ
         lSqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jZFa5dq7ZIIS49bEl31emopRL7ddhUPH1zG066353Ios/rbwQ+Em36ItFf9keRDmniqVcHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB8hgOKITBMUNeHfbEBUYT+ooNdZUjwaop5qRcVdD9fmTHd65H
	O8R96MIgY2K1imiOtIqt6AMBn/H0B89Tb45uv1BYJLpXEcBc7DscxWNx+jlr0ZI7B3aoY9x0VRC
	n24YOqjEoxMeVTW4uVzDYj/zOjsuCUUcEKaD1TmVA
X-Gm-Gg: AeBDiet+ISfjyFPxgZhBZk5YeNxatILOMJMBoe78gdQrA67E/KIijpEzP9kI/jkO5ng
	r8FTjOUry9e2RZz7ipFnF1mX16gZ04zt1ugRSHpLQb17yt/u76dlH5I+/AhMVK/iTvy3CTaD2M5
	JAKzo9+kneO4sI1yJlrWdLfyKWm9FcrcH1ci2Wo4EFYv5Q4U/IC8HSkpqIHYGu5eLsJ/8iHAA54
	ZKbRpidgjG+LfPpIfwnE36XTUgz8vJJXuAH8em77AZRVlxLyol/EukruCLVUT225tsUtUGslEol
	0iNL07IT+wAa15Zguj5BH9BDkwgqxG9hazgD7srJwnpBP3uwxuO3mcX6xcmmdqSipYpGnaE=
X-Received: by 2002:a05:7022:458d:b0:127:5c3d:bd95 with SMTP id
 a92af1059eb24-12c73fa2c95mr13335285c88.32.1776894658724; Wed, 22 Apr 2026
 14:50:58 -0700 (PDT)
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
 <6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com> <CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
 <CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
 <49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com> <4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
 <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com> <f6e38fc0-7732-42f4-90a3-5cd495440d1c@app.fastmail.com>
In-Reply-To: <f6e38fc0-7732-42f4-90a3-5cd495440d1c@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 22 Apr 2026 23:50:22 +0200
X-Gm-Features: AQROBzA_LrMXsYmQFMWvSTMmkAEc3u0Gvg47Y5uWu_vm9fEifVPXM-8NIpCNAp0
Message-ID: <CANpmjNPLozCUhARwskJgA48OCGBaSsHFhoRpgmfCmnOZcY+mNw@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 22:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Apr 22, 2026, at 10:23, Marco Elver wrote:
> > On Wed, 22 Apr 2026 at 10:00, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Tue, Apr 21, 2026, at 21:12, Arnd Bergmann wrote:
> >> > On Tue, Apr 21, 2026, at 21:06, Marco Elver wrote:
> >> >> On Tue, 21 Apr 2026 at 17:26, Marco Elver <elver@google.com> wrote:
> >> >> [...]
> >> >>> > To me, 2 makes more sense. The attribute requires gcc-11 or higher,
> >> >>> > so you need to wrap that in a compiler version specific macro,
> >> >>> > but since I only saw the warning with gcc-12 and higher, that
> >> >>> > should be fine.
> >> >>
> >> >> Kindly test if you can:
> >> >> https://lore.kernel.org/all/20260421190351.1976329-1-elver@google.com/
> >> >
> >> > Applied to my randconfig tree and verified that this fixes the
> >> > known warning (only one out of about 200 random configs). I'll
> >> > let you know if something comes up by tomorrow.
> >>
> >> Unfortunately, there are new warnings after your patches using
> >> gcc-11. In 500 randconfig builds with that compiler, I saw 7
> >> configurations failing with one of these four messages:
> >
> > Looks like a compiler bug to me; can you check gcc-12+ ? Maybe we need
> > to allow the __access attribute only for later GCC versions.
>
> All gcc versions I tried that support kcsan run into some of
> the warnings, but the exact set is not always the same.
>
> The stringop-overread warnings are (like -Wmaybe-uninitialized)
> a bit unpredictable and depend on the exact optimizations taken
> by the compiler, to see exactly which object is passed into
> a string operation and what its size is.
>
> I'm guessing that by annotating a function argument as being
> not accessed, gcc starts assuming that the object has zero
> valid bytes if it cannot deduce the actual length in any
> other way.

Thanks for confirming - this is rather unfortunate. I wish a suitable
attribute would exist to suppress this, but I guess that's not yet the
case.

Which means the simplest fix is probably the absolute_pointer() one.

Thanks,
-- Marco
