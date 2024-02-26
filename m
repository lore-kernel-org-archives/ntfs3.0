Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C012DDA8
	for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968814; cv=none; b=iA+g3bd0XQdsWGmlg2o8+9w65lhxPURmTlAhXJcb5W41NJtJcrHEn+3RFNXOIaGskeKkl4izF6Sn/OjwTmWCxrNLXvPtol4ERRC7TsLx/j/3ZPHnsJKJXCwn8B/R/oX4hmmA0AC76zH3tHvmErumE6LmzwWS7TiNHuRYcrL7Ixs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968814; c=relaxed/simple;
	bh=jGHNHxme5qjpR55RWTekjqcx02Y2QJMOPfL+qTuvjKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yd65v99Zqb7cQnKI/8gopK5j18PHaJEXm5lCYUgA3CeaQ2+5wY8n30D+T0bQEHxejM3w/SMDx68h1btundYB0gWBwMfcTI6EZZ8B4CI1AD2jT0mpb/j/leqxxlL1EUhLa+Cgwc6TIhVjHgW0nxmyMMCOum4y7Bf+xcz1PC/3Ai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FgCKpv69; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FgCKpv69"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so2783029a12.1
        for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1708968809; x=1709573609; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+DSV5t8g8pZijgxO3dOQk/2ugtI+XLO7xzncKpdXFs=;
        b=FgCKpv69ElGrJnPweLmpDe+6geuXCB9BE47nOzNAZnp67zgXwypMPApSCDSKm3rwVN
         GcCxNv/19eEDtYXme/qyyQ0uqSHZ9eO3fGk7H3vevnzjhc8YDUFiXwNioHkkivJ9b3P/
         xDGVQ+kg8gwu0xgmUDR+SaOmyA1AdQxoMdoO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968809; x=1709573609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+DSV5t8g8pZijgxO3dOQk/2ugtI+XLO7xzncKpdXFs=;
        b=JpUuKnmGTMDHYtWRc+lxr0P0ea9omFB3eWHd1yPzXjhhLUGr4VSgoNgsNGhgg0yp3P
         qDrSnzYkc8nH9hXcOhpeRkhSx1o1MdBk+IFBCsYZ8j/tEg1hTB5l+itJfnzso97QOMlK
         tpMqARBTGftHFd0wn3HTEKjjQQrURiogsCk0lF+BRZofDSBm84I7+XoxVkotDFfRtHNB
         pz8Y82E/GmeiYvpy0t6/gPlpvyBq9lPYU3Z4pGGJwXW86aBt55NuCysQ82jnln3jOz8t
         f4pEV2OD+dHyk3nAjejiJO+d9+ETXZXitc3eePv30N7KU0vplTa8KjwMXc54xUZp8B4j
         2gqw==
X-Forwarded-Encrypted: i=1; AJvYcCXFHjOwFTO1y6OUM6nK4xFn87l5oKzGVvCJPZYwaKd3dkwae95S/z1t8fp32rhY7jdyBvLJcdJ2AiCTlxW+sG8Aau+Av1Y=
X-Gm-Message-State: AOJu0YwPWdU/+CuftUtirLL1bj4SdCDrczkJgr5i92i1513fERxhAY34
	DvnzmVnjbn6CFIRt5pNwEQqCh6ie8hsA/5O2TAqgCAg4DYyHVBlLPcYrm2QtOwtzqIsYbU/XNoY
	I6Y5imQ==
X-Google-Smtp-Source: AGHT+IF1dDX4GjC7YHYDACDzaREPQcJm5b0nZoJdY/CIE44AiMiU4+7e/3XjZ3u5BZ+8Yqo6zFearw==
X-Received: by 2002:a17:907:9486:b0:a42:e819:e663 with SMTP id dm6-20020a170907948600b00a42e819e663mr6883423ejc.27.1708968809181;
        Mon, 26 Feb 2024 09:33:29 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id tj12-20020a170907c24c00b00a4396ea6628sm111557ejc.210.2024.02.26.09.33.28
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 09:33:28 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso539051066b.1
        for <ntfs3@lists.linux.dev>; Mon, 26 Feb 2024 09:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxwDmWE8C69Yb4dbq9yl+FSQ4k8AHtnrMqi6XdnJBMuMe7AVSbx/15VLZZQE23NqPdZ/4ovHE2YXrIXnfxqZjkVvEmNKo=
X-Received: by 2002:a17:906:3b0e:b0:a42:f194:9cd9 with SMTP id
 g14-20020a1709063b0e00b00a42f1949cd9mr5608776ejf.5.1708968807997; Mon, 26 Feb
 2024 09:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <170886726066.1516351.14377022830495300698@leemhuis.info> <5ffb73e0-4b00-4bbb-857a-30a48945758d@leemhuis.info>
In-Reply-To: <5ffb73e0-4b00-4bbb-857a-30a48945758d@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Feb 2024 09:33:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiHmYxCP36ngovZimX9sixWxMrGA_WZdYyE8JPqBQ6ysw@mail.gmail.com>
Message-ID: <CAHk-=wiHmYxCP36ngovZimX9sixWxMrGA_WZdYyE8JPqBQ6ysw@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2024-02-25]
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, ntfs3@lists.linux.dev, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 06:21, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Sorry, forgot something: there is a patch to fix a ntfs3 build problem
> that was posted 10+ days ago[1] that didn't get any reaction from the
> ntfs3 maintainer at all. Given the history of occasional slow responses
> for that subsystem I thought I'd let you know in case you want to pick
> the fix up directly; but if you do, consider using v2 of the patch[2].

Ack. Picked up directly.

               Linus
