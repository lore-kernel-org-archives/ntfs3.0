Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0335F196
	for <ntfs3@lists.linux.dev>; Fri, 24 Apr 2026 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025073; cv=pass; b=A/1KFRmxJwz4GiatyQDD1shoavgLcEZFo8uLSIwA62aI2LzDtBLscYNUhrm4gSto5H5DFkfJ0kC2b+/dZ7a27Yo+4baHg0bsB6LpzAciLxR0XHFG0dZK15RqXzAuedHLG46JD13x8z7WHuRg62Tko7sPGvtMg4/W2tKhWGL4ld4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025073; c=relaxed/simple;
	bh=5mkhBXp2/JLCmigiaPuJFecz+El79KE1Lh6YXo/ZcJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBAGWsaFSOcBLB0d7gKGD4fUX768MpJ2ftDI/nyJYJi2nrqPtrrLXL5+DZUkZQuF0FwJ9UFvnV0c3UW0zVBHgMl3uffuKyIfxwjO0J9WFZx3H0WkrZJDs2jMxBB50n9VfUdD5ORZrxoAHWH9iKkCsYFdxjXOxFEvqgcK+oAiDKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WF53q+o5; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WF53q+o5"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c6df0b9bbso3783179c88.1
        for <ntfs3@lists.linux.dev>; Fri, 24 Apr 2026 03:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777025072; cv=none;
        d=google.com; s=arc-20240605;
        b=UrL9mB+fYmrUKdy9bMl1eTt4ESQp3FJGnSFUvX8jHg0ZpseyFF517Wn/UACHviIOk9
         sLz8zpuLTiRAyduk088RP/btdQ1Q39hclsKf0M2gjLihKc2BOVvJqR6leAUHoChiuoL7
         vAkc21pE3uu3IfsYvrqMvDohOJgxOcggLUUVIvvBgZGNPmK6qY7Dr4E4HP1yYsVKItA4
         RSUJ/xkY9qO+/Wok2GU3VJ223kRFTwOfHOMD2cnP0pEayu5H0v2B/ksWoWVGQO6agPoh
         9Uyimz80KgMfHEzf3XILSbosiEN0CnCzgNar9Xw3AdqH6C3QxHrRG25lhs9U1LCk5lz5
         RrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kWUb3CEOUE31J0ttoLJRjo5JnvpDxDzQbT41EaqVfiI=;
        fh=VOyiCHcD3i8En4YomhRxoVEE4fpzZl1LJREJ09L1TNU=;
        b=K5h2BfPL2D3voONvuK+FhykGluE8Enywy09rT4BLK8Rt0XomJhG7X1C04OaSvMJaq3
         D2a6oOkYlGSNiCu9iyLiz3IJ8lODxxCmg4L5UrF3x8BGl4S0lVjs3rZrooDmJVWywoxq
         7V1AJRn0wR+3TKme2INlZ3tlg0Y3l2baWqTAt/pAMJeuotTVkcoIX83E1VQtOXWnQmh1
         BxgTjdAyeW3S7ylYpCVpN/DtpNtkX3VEkViBHGmPb1yosWt6ESNC3of8VPEOfpDvrRwJ
         znEON7SSwMQ4EA6rA9z8mVit1la4Vr9mlOOxxpaNTgX4x/paik3cIFTqKU8Q6VQ+Bmwd
         WpQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777025072; x=1777629872; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kWUb3CEOUE31J0ttoLJRjo5JnvpDxDzQbT41EaqVfiI=;
        b=WF53q+o5sBLhJ9sYgWVKorPXH0I6b7wKr1z3VASjFAs5en1Mg3vNsVuljmNa3Lmlp8
         4DuD4yBW/j7RWcsgN5vMADtefyBj3BxG1fc0M5JXb79FXy2giaTLN0D+Qkd1U4wPE8/O
         GVumhV+jAplM4qjblGLeADaWVs0MHXEJkDCo7KYyYDctEAf9P0EinYerYmQM39IX+Ldg
         z/vvmX8sxMZKZbxnZ8K6B/s5lRGkUqz3aP6hIQSgNBLaQpqO3R1SUyHMQXdbDUux7gQL
         ZU45uhbfkwKXIqYSfpioWIT7yWsox/xt1jLpZ5b/kzC9gSl5CTSULQoC/g/b2cWrbxSO
         Q6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777025072; x=1777629872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWUb3CEOUE31J0ttoLJRjo5JnvpDxDzQbT41EaqVfiI=;
        b=VTq6/drfLFOyhdHLCgBooQKVS6jjsBLpTl6Y5BVv7Ujc6DQxFLgYkz7d5RrgbUGQUb
         GY9V43zNTaN0h5iyxXJiGvuRpzDoIiFSN7t7TWGkCkpGRP2Po3pI/Bc/UePhUrZNtNLd
         CNX02vOYBIou7+uuYkNWiJkO9L3TVf73eij8R2X64TbSkejn6LhTaS/A1RO3G45zjk95
         3Ngj+we2zwKzGJDzlRoPhHFijBowqkbnLRCD8ICKtBGFx0jQwsTMl4x/eaoKzf9fRWnX
         ZTtSRUVExqWwv7aYYiuaBkqn5PHcCpDG1uCIms09wMB//W3/hkOWABTcPETp4diOcYw9
         TGKg==
X-Forwarded-Encrypted: i=1; AFNElJ+7Zj4fJ1Fdz/2OggBYy9ay4UosgkPmATAEiRTePkxb06GFWQBlCn1husfFjw59oqviiRYflw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyK77B2z9wSZMnocl0BxiCiE47nmNy+0Z45dY45BItDKNUVXJFJ
	lwNyb72wFuLjP0cBcX5+CLXkhZRGe++Bx2YsKI81RJz7E776uNB40cyp5LbQIwsF+TlFD/yJm4V
	7hCmRJMXo/eVkCMRACpZtKDsUeT4YEajwqEU3le/E
X-Gm-Gg: AeBDieu5Skb/UXab8sGek2Kwkd8bdB3UaQiAvjy7GcoLus9ceZ3W3ARHBxZDyN+Bvjp
	tP+AOuCr3W4IuazrkAPOgOzHxfclnYbRnSenBuT0GTLhRPTP4bggTy32nO1RlRYOzLxnLjUinD/
	cO/Q/CzK/wITn+KduCipGXy29HPxGiJ3cdtOvVoK8DBsUDGodHkdFy8saCFF4zc+zS3IQ0ljls1
	CjOnJo5E56YdVm56U8QM/I5qm76buFSROoZs4lxEtoLd2oeAy9OuVp3NziIrFEZ5meY48wAPxnN
	41+OKEStmvUCt3avKblvM0cQw3Psdk3I27cMUANjy5sn+ddj79FXIcJqZA4=
X-Received: by 2002:a05:7022:1282:b0:128:d4be:7428 with SMTP id
 a92af1059eb24-12c73f97463mr15685876c88.19.1777025070954; Fri, 24 Apr 2026
 03:04:30 -0700 (PDT)
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
 <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
 <f6e38fc0-7732-42f4-90a3-5cd495440d1c@app.fastmail.com> <CANpmjNPLozCUhARwskJgA48OCGBaSsHFhoRpgmfCmnOZcY+mNw@mail.gmail.com>
 <20260423091246.7ffa38c4@pumpkin> <CANpmjNOzsu8fqEr-qfE8LZbVUUUdoqjBojxoXjiOoR7Pzr+zyg@mail.gmail.com>
 <20260423140612.46df8b78@pumpkin>
In-Reply-To: <20260423140612.46df8b78@pumpkin>
From: Marco Elver <elver@google.com>
Date: Fri, 24 Apr 2026 12:03:54 +0200
X-Gm-Features: AQROBzATlA__njZCHcz7dRCOlVMNE0O9lx628-DfQ3xgcfI4oyKUqAYbQSTdd7Q
Message-ID: <CANpmjNMcpzujcetavChq+7QTQDy9iiP4khAyeQwT99VZ8mwtOw@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 15:06, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Thu, 23 Apr 2026 13:35:09 +0200
> Marco Elver <elver@google.com> wrote:
>
> > On Thu, 23 Apr 2026 at 10:12, David Laight <david.laight.linux@gmail.com> wrote:
> > > On Wed, 22 Apr 2026 23:50:22 +0200
> > > Marco Elver <elver@google.com> wrote:
> > >
> > > > Which means the simplest fix is probably the absolute_pointer() one.
> > >
> > > I'm not sure that using absolute_pointer() is right, it is normally used
> > > for special conversions in low level boot code.
> > >
> > > Here it might just be best to explicitly use (void *)(long)addr.
> >
> > That didn't work - tried, and warnings still there (GCC seems to see
> > through it).
>
> The only difference is the extra local - unless the '+ 0' matters.
>
> OPTIMIZE_HIDE_VAR() should work, but is annoying to use in a function call.
> You sort of need:
> #define OPTIMIZER_HIDE_VAL(x) {(        \
>         auto _x = x;                    \
>         asm ("", "+r" (_x));            \
>         _x;                             \
> )}
>
> (also useful for 'lying' to snprintf())

Isn't that effectively what RELOC_HIDE (and absolute_pointer) is
supposed to do? I don't see the need to add another similar macro, we
already have too many horrible macros like this. And in this case it's
not necessarily the optimizer we're trying to hide this wrong, but
from the semantic analyzer that gives us these false positive
diagnostics.
