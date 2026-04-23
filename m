Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5F3EF0C0
	for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949578; cv=none; b=ZR1xbRdvRhkECt7eNRy7im2055/2ThzBavJwIDn+n9gHIDXYdQZQBb/KCzJ2GumUGLyfclVk1Pwq+XCUBnGsmj490OM4Y2G/43tEeAZIQy0+fnwP0Fj9ocGdl60sUuogbmSLZ2GnQ6/fvh6hTA4sNUN10gdtFbzj3IEbrIK+YOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949578; c=relaxed/simple;
	bh=a07u/h/DFxnIT8CA8KZAmxUm47K/feDZx0GWQAH24U0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiS8F1mj+4Ej40t8R7lAzQ+tFclXfXPpzUNRzPX/456sxrQij1U+pK1/osuLPEJXSgZ5Dg3pWsaXcGFJ86laCQsGJd4QCZ1cBXjVfDMoxGgUCnePCxV5WVBq24hyPgazFNmVHMu5XP5aTv6bATr9qvx9J3vCpy8fX7TKVdT8l2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gn19dfiq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gn19dfiq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so5393940f8f.1
        for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949575; x=1777554375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W6wCJvvd3w5bemRCbvVqU4AXXtyRVKRO3lOAIo4u64=;
        b=gn19dfiq3iQhVAu4KMLwRgHQxfh6GTZ7uFzjHvTITl2bXoHYsldeRK4tpU+C0wgkYj
         k5tYQHjim1x1xMP3mg1BcsSNEM92PTdCe7f5iWykLCarb4ba3l+6gMDz5TNQpGA62d6m
         JWrlgHc0ImfWV+K+m214yE4vNAA9YcqO5w61Quk8JuPyD0rmC08Ae48JvJQRugd/yzVy
         IjQuFZcwAvgLSMmQRqMIfilo7C4bACvnGQ4UDaPVrD/mPCkYOrvKX6Mvz59jQ3FRKBT0
         K7WOSCCsD/bFVpxAappijE8yWJlN5FSRTzVEPOpGXY2FAWfSosfsT2uRtwl0kFy0b7Qt
         ZRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949575; x=1777554375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7W6wCJvvd3w5bemRCbvVqU4AXXtyRVKRO3lOAIo4u64=;
        b=SqTKvI/R6n34qJlFNZUNiz+33YTgZalWONhbjU6UVoaXspmevXbHmDjFT4inOBisdG
         Q1qHiMjwSETpvn+gHDeJLGukNT896M+EAaDuJBdkBysZ0+yYDbI1HhWVquYy9B+eKcZB
         FXNX0Js7lgWNqGNbHpBiit8omwKzSv4uDt5hOExV0t+FC2Le3fGGgqOUtk8DfQYU3GTX
         ujT1SMHjFPaPANtkHEKED3knLAhZKxq+ACkDKeEfjRypoaRft69WdbshIzTnmydxs0ZK
         HLKyU1AUSjvFcOtc9KL1nW63ZLx6zODYD62Qw3KbxzLj1zE+Shc6tOhXyUsf0SLzi83H
         6cJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0Jv48mXDl3yhO80xlNQTTFjdCzJqmQikMGfcKzw7K2F9kEqbV50VE2WZN+Tk5sKE30P4v0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgqU7Kf3cgtKvwsyqdqUmIn+UxbtGOx2gBAasFBuaaFBkkzKIe
	Uuhd8XtUs6S5T5Lsgo3zlrNwOS0sn2ZzQcPEORwuBnXgsV/fwMWCqxE3
X-Gm-Gg: AeBDievpI8E72nH8YJQyQaoetCZdLjoXfdRs7yfUy8mallhr1+97SFhdfnnw6J+XutA
	Sh/SIReF30YSue41H5X7lLV8cfTjz6hj6BU9VM2zU+7lMlpNwRFWqOpYHBs9+qydyCmQ4NcrabS
	v4e8hNH0K+dawBT/g3P/g5N/22v9rqPjkpa6yy0Pbz/mcNsaEaNjNs8C0G+mom+Rm/eob/u3zMw
	xE+obgKLlteOAVPzyaOBAGN0oIDTswmdcuCpnjgA6T2PANAzO7LffPEpxEDjkFq9uBmjZzfSFGS
	8z1DuxsAbn8P0dIKzlbtKcaxmyqwJeAWmsxnrZHdUawbpElwNLflsRD9uelv2x37M90PBxSAoDk
	goQdR1EwX5q0FXUTV3oVH8W7VsgLSnE9lLZgbG7in1IN3ZZp2r1Ma2bB6BwT//cc7U+vuCRvBbq
	J727wiC1Viv1xHwG5TwMF1ZFDaLC77Z+WG3qZTUJl69DJ0Oa7+kbwVJjmt7aSULEg1nsi0n/HdZ
	tc=
X-Received: by 2002:a05:6000:2902:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-43fe3dc81a7mr42752149f8f.5.1776949575075;
        Thu, 23 Apr 2026 06:06:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm54479709f8f.3.2026.04.23.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:06:14 -0700 (PDT)
Date: Thu, 23 Apr 2026 14:06:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Dmitry Vyukov
 <dvyukov@google.com>, ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: Re: kcsan -Wmaybe-uninitialized warning in ntfs3
Message-ID: <20260423140612.46df8b78@pumpkin>
In-Reply-To: <CANpmjNOzsu8fqEr-qfE8LZbVUUUdoqjBojxoXjiOoR7Pzr+zyg@mail.gmail.com>
References: <5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com>
	<CANpmjNP8aUnZxO6e6ww7Q-8YiJLzww2YAy6Qi9dH5npHtfxSSQ@mail.gmail.com>
	<28064669-bb57-4dab-bac5-cc1027bafaa3@app.fastmail.com>
	<CANpmjNOY20G7w3AB=XfwSAQ0EVfM+sOqj1kTq6NnkPiB8Fx11Q@mail.gmail.com>
	<0df31031-23d4-49cf-8643-f605561bf7fb@app.fastmail.com>
	<aed5LYnQvjgWm5Rc@elver.google.com>
	<6eac698f-da35-4efc-b227-b54de5d1decb@app.fastmail.com>
	<CANpmjNMibzTir07m87gNEERP7jrGnO7jN-TbTP+d7KggP5vZZw@mail.gmail.com>
	<CANpmjNMM5+OEHZ9cvnTUithC-dvSq5Co=ZqsYnPMZD_RirDGoQ@mail.gmail.com>
	<49780769-461a-4a09-a7df-c34a2e839e45@app.fastmail.com>
	<4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com>
	<CANpmjNN8J=cFnsQpj+_VXuoswsc500jRV=mKDBSntZw0Xvib4w@mail.gmail.com>
	<f6e38fc0-7732-42f4-90a3-5cd495440d1c@app.fastmail.com>
	<CANpmjNPLozCUhARwskJgA48OCGBaSsHFhoRpgmfCmnOZcY+mNw@mail.gmail.com>
	<20260423091246.7ffa38c4@pumpkin>
	<CANpmjNOzsu8fqEr-qfE8LZbVUUUdoqjBojxoXjiOoR7Pzr+zyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Apr 2026 13:35:09 +0200
Marco Elver <elver@google.com> wrote:

> On Thu, 23 Apr 2026 at 10:12, David Laight <david.laight.linux@gmail.com> wrote:
> > On Wed, 22 Apr 2026 23:50:22 +0200
> > Marco Elver <elver@google.com> wrote:
> >  
> > > Which means the simplest fix is probably the absolute_pointer() one.  
> >
> > I'm not sure that using absolute_pointer() is right, it is normally used
> > for special conversions in low level boot code.
> >
> > Here it might just be best to explicitly use (void *)(long)addr.  
> 
> That didn't work - tried, and warnings still there (GCC seems to see
> through it).

The only difference is the extra local - unless the '+ 0' matters.

OPTIMIZE_HIDE_VAR() should work, but is annoying to use in a function call.
You sort of need:
#define OPTIMIZER_HIDE_VAL(x) {(	\
	auto _x = x;			\
	asm ("", "+r" (_x));		\
	_x;				\
)}

(also useful for 'lying' to snprintf())

	David

> 
> So that leaves:
> - absolute_pointer()
> - __diag_ignore_all wrapper (mentioned elsewhere in thread)
> 
> Preferences?
> 
> Thanks,
> -- Marco

