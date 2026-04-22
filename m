Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F03AA187
	for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846260; cv=pass; b=mZGSZLm6uy0Snlz6AVGEHFtCG7LIYzcA/PaLnFauad1HK2PMog5aEEqgp1JyA5ctAWMkJhVvE0hUrtFWCT9kg3RAUAbNIQa4Ru/Uf+hhqo3Ka5100n9ebeeRYsqpIttxEfvCWUU03IR1d97jNtiVzruiW6m6+V6KmAa1R09LOMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846260; c=relaxed/simple;
	bh=9gmNX4h+B9ZSKv7TRUPCmIcbU0aM+kAUvHB5mSjCLRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euMuFmzkAnRiOYrE+I5LF9q59+2Rj/tGHgU5054Jb4eVZf21vyM+BuhrgM1NYhYrkNF2cXnKkxy+T/7yjKHp+Ny9ptqD5Jex7utUcYtI0KW2mfmYsIUn74+yRHPq5UQe5tY6dzIgoPRpzPYm6dIpxp+goDyTnaPZT/AD4y61oGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NJ5+sTyF; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NJ5+sTyF"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12713e56abdso3538277c88.1
        for <ntfs3@lists.linux.dev>; Wed, 22 Apr 2026 01:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776846258; cv=none;
        d=google.com; s=arc-20240605;
        b=EbsrTFFzcDhtzEKQ25/PxYZebBBikUByCMZJnUJU6D42ir+eXQn/oqTKQU4KrBZoyV
         Hg+jzbuED9cbpL1jZiFumnhHLqMh9W3dOtjP719RMyzGR5R4GDsoaUzJdkSLTr+2Soeq
         Qm+P+PXOTGoxZgzCvpnqO9S4CxA8ReJ/kOScR+loHYpphDhxC1ON6f2Kcww0gB01X72J
         sYw0iGj1IlbDO3QEJ9YTcqMOIVwN0TAVLNsxQn9F9mRmas5BpGHGxQ/xccRHJ6vWAD7G
         xRc1rSApeJrO9wE3rO4RGLKw3P0Un8XOvoPbI7HBaRiOC2/NpUPn44kqWYwm8VUVTNS5
         3h2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9gmNX4h+B9ZSKv7TRUPCmIcbU0aM+kAUvHB5mSjCLRI=;
        fh=waqYO11+I1+OTp2/lQr7wfEg63uiTnL+fxvuUK/qXD0=;
        b=O22rrWEZ9djPBdDJ96sZHKhQ1SMDBHW2JtiI0Z1sJ+i4sYEwJSayeHGgwJHRmMJTjS
         AXb0jhPiLp0bSKMgRzZY7CIpACljXsfT99LRPLiRQwvHA+Z4xyUkDTUn2/hLg7ZBtFbM
         cyHq81+pJKPC5a2E4GMJYMiJWsCFkB3eLzPjHnjPACztQA+ayF4ZKXA4howIkfdb3MOL
         iEyJ9UkiRCj7c/0Q2P1cPaA7W4JTx1T6qUNQ0aLAERaA7qjTO438t4Z7RCtqFIrVv90G
         Ex6LRjbpIGCQGuzxwOK+XEkLq1DWxZuILaCSKiGSo+5RXTCqavMi7HP8MoRgVYnlPs3I
         SUCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776846258; x=1777451058; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9gmNX4h+B9ZSKv7TRUPCmIcbU0aM+kAUvHB5mSjCLRI=;
        b=NJ5+sTyFdNKP3B7VZH0NeyvBL+E2xiRjxZ7sTICaYBPE8QkuB5NacUZyMp1mUSv0Rq
         bfbnc1n1aLQ9AFSk1i5wPONb/7aV0VpTzOybcor8hBu9gdLuagkblRfFoz/bQVpZjhx/
         fZL/VYT17bhY3Ng0VTJe/wS8OKvIcB3zHjDWqS53U0gDtrsJp8jm9smnyG/LBdYp8h4r
         2Gw782iMeqEFOHzH5pX5LzspHDBFlrWztYorY1YIefv8JEhAuAmxJLZO/kLyFYrfKsKN
         df7n5sLSFOvU2SEbKKjq9OrS6lx4qPtXwmkSFD1ONe1FlISqst0oM4QmEZdS1pQdH3iO
         0R/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846258; x=1777451058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gmNX4h+B9ZSKv7TRUPCmIcbU0aM+kAUvHB5mSjCLRI=;
        b=emPmSQx+APttinVpWiKgc8ociqlru6VOySn9ViEQAHHQdNKezR0xdwxh0/wddHyqxw
         CJ1wfEXDRoqniqOmyLKpCye/tbOH3TJng4sPXstmVTsm0Ur7mEtcEOnlZkYksUiwFTwu
         ZxwirzN0Ihvmp+AyTGEBMyzFe4oCMY3VuYuzg1tHRTg0NAOaunOXFo4tmfijN0YZh8Vv
         nJyl79JXgOgA3ebf8PKWre5j/0p0p5L3s1zFFbmuj70BtvUmgOMrvI4yuXRsHyHaRVlt
         zpZHoA7gPcGpgTzUSmf54Od/cQBY2z2GL4J4Loa0RTNcLpWZvcZKyqm3Bmzgk+zhKjC9
         AckA==
X-Forwarded-Encrypted: i=1; AFNElJ8Xm3wsUOb7NSdZIxIWM8NxK5Q28P8vlENGo2QJS50F4cwf0FeCV5jUduapAzkixggoSLNpDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfMwZ5nRr+0gL+gw5l5HTD00LHmD8KCQAa6TlW/WNBCuv1rOqJ
	jpor4g/YYjOCXaevxt8zxc++Z3S6wRYmizozilZXb65ybe5viC5QB6ekPRhCM9++OxaL7UanJed
	pTgRVYsYVsX66q4qjCquRSo1j/OoO0D8ZDEy3ICb9
X-Gm-Gg: AeBDiesX3VkDEKADLsiW20lUMMOoEyy9UM55gFjpGQnCr4y3au+yfKBnjC0ZHOm44ie
	N0odLwZ9niv2AAwmOvnbiHjhlHTGudnYHXrz+dKW2lb865jO9Dg2wjg4Bpn/IxAbZSNqnO7AVMC
	7jZyOwFKXxkJitN3fpf2bKpoC564NFAzdEvWJGToLApWJypcVGbKmMt3yF6ULmVPc7gTr/i65ps
	CsPGuBt4+07hJB29hLAnlEV7R634Iw9PMfCsGsIgDcTrMrv63XimWGoG3eE52qmbJyupYJM26Mi
	4/lMU9UqnJjRzWNRpzH+dl3D8nO8C6SfLNMKQGRp2NK2JgzY/MZYFVKYAMbJRQpSGlWxp7g=
X-Received: by 2002:a05:7022:fa2:b0:12c:11d4:61dd with SMTP id
 a92af1059eb24-12c73b39a41mr9220220c88.18.1776846257744; Wed, 22 Apr 2026
 01:24:17 -0700 (PDT)
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
In-Reply-To: <4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 22 Apr 2026 10:23:40 +0200
X-Gm-Features: AQROBzDlaWUEBpTyox_lDWaNw-ln5et1eKiz_WG0YIQ6UODShVXjU-XD2wd_rUc
Message-ID: <CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
To: Arnd Bergmann <arnd@arndb.de>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Dmitry Vyukov <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 10:00, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Apr 21, 2026, at 21:12, Arnd Bergmann wrote:
> > On Tue, Apr 21, 2026, at 21:06, Marco Elver wrote:
> >> On Tue, 21 Apr 2026 at 17:26, Marco Elver <elver@google.com> wrote:
> >> [...]
> >>> > To me, 2 makes more sense. The attribute requires gcc-11 or higher,
> >>> > so you need to wrap that in a compiler version specific macro,
> >>> > but since I only saw the warning with gcc-12 and higher, that
> >>> > should be fine.
> >>
> >> Kindly test if you can:
> >> https://lore.kernel.org/all/20260421190351.1976329-1-elver@google.com/
> >
> > Applied to my randconfig tree and verified that this fixes the
> > known warning (only one out of about 200 random configs). I'll
> > let you know if something comes up by tomorrow.
>
> Unfortunately, there are new warnings after your patches using
> gcc-11. In 500 randconfig builds with that compiler, I saw 7
> configurations failing with one of these four messages:

Looks like a compiler bug to me; can you check gcc-12+ ? Maybe we need
to allow the __access attribute only for later GCC versions.
