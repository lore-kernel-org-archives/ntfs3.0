Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C1DDA2
	for <ntfs3@lists.linux.dev>; Fri, 20 Oct 2023 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2bm8jlf3"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-778a20df8c3so33580085a.3
        for <ntfs3@lists.linux.dev>; Fri, 20 Oct 2023 00:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697787710; x=1698392510; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBa0xa/eHNcCLSN4jU5w9L+UgbLX0/qpCkz9jorDITs=;
        b=2bm8jlf3XrI+GRHtWRZuzX67yiwY1NNl0R6CQO8zZ22ywi+fQT+R0KY63VunhwGvSm
         iJxPD09zn0WEsUp20LljcYHicPmxSAlijExrPcEZpAt6Bf526AbbUrA3ZGD3auvccclP
         3zL0p0/cOuIzujjGuJHZ54sO1zHe5cAAMBBUrNfEaz/1e8PdO63KO2knyKiqYczTZ9pL
         f0pb9RsreGTzZOkwWpW95yZwXS/V9F5QateeufjUnkP7KphZxcDPwXKmHhSOmTccbwqL
         KZVpWFu2pBsPTbCLJcm27DpCLfUfgKZ4V4v+hmxPQ56OwWEIUSOXDdAVeeL4flkTJvbK
         tWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697787710; x=1698392510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBa0xa/eHNcCLSN4jU5w9L+UgbLX0/qpCkz9jorDITs=;
        b=QY7TkkyGPulfzqXBjvmyvNPnHanvplmP2+m/qhhUCBbw5GRsnIGLSgNAjl4S3N8PId
         7T3N5D2WDNRRM0GolY4a3GY/8onnkhAx6v2kFh3YBHyDCuOF4RfrNFWe+xC2KQXDpKaN
         DhaVEx4ZqXifPtd79JAe/SughVdidNRcKR2z859HTLSCBuD2yLSP5kSDsja/nW+5bkzq
         jsjBNQkRJgKvykBkv2IWjgfUHmMBYkgrZoCbfsDRLji3Lr4/Yn2ZBEYypwLf+Z8fIioE
         Z/78g4dp9uU7WzhTEl+F0rdfuAEv0vjZj6HrUBnG8PFCTmvNmv1vuMCYJPgb/ydkRJpv
         J7EQ==
X-Gm-Message-State: AOJu0YyblkSB62zRxmh1Ld4ObYbkwcgUYNj8FFmR/zVQrQzJDWJ35Mrc
	k8Ck4tBKX/BSl1f2+NXmcPkfJ0OMlTviP76qwDjCoA==
X-Google-Smtp-Source: AGHT+IF4DP8EnmUuEgxb0AWEosQEB3fTMTya1XnxFLtaGR6STLfbHmgJkB9SCGKsieIg9mX9CbrMN19r3UImMJv5EAs=
X-Received: by 2002:ad4:596a:0:b0:66d:1230:9682 with SMTP id
 eq10-20020ad4596a000000b0066d12309682mr1436777qvb.62.1697787710110; Fri, 20
 Oct 2023 00:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016165247.14212-1-aleksander.lobakin@intel.com>
 <20231016165247.14212-12-aleksander.lobakin@intel.com> <20231018172747.305c65bd@kernel.org>
In-Reply-To: <20231018172747.305c65bd@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 20 Oct 2023 09:41:10 +0200
Message-ID: <CAG_fn=XP819PnkoR0G6_anRNq0t_r=drCFx4PT2VgRnrBaUjdA@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] ip_tunnel: convert __be16 tunnel flags to bitmaps
To: Jakub Kicinski <kuba@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Eric Dumazet <edumazet@google.com>, 
	David Ahern <dsahern@kernel.org>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com, ntfs3@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 2:27=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 16 Oct 2023 18:52:45 +0200 Alexander Lobakin wrote:
> >  40 files changed, 715 insertions(+), 415 deletions(-)
>
> This already has at least two conflicts with networking if I'm looking
> right. Please let the pre-req's go in via Yury's tree and then send
> this for net-next in the next release cycle.

Yury, Andy,

The MTE part of my series will need to be reworked, so it might take a whil=
e.
Shall I maybe send v8 of
https://lore.kernel.org/lkml/20231011172836.2579017-1-glider@google.com/
(plus the test) separately to unblock Alexander?

--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
