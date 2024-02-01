Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8285D465
	for <ntfs3@lists.linux.dev>; Thu,  1 Feb 2024 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706795202; cv=none; b=NgrokXQrYbLXTd2uHs+XbfRk0DfPJ7LuABk/UTPLF8oOfA5d1Nkqbsgar1Uynsv4ok3HFq1XwMf95BdOWv+B88l2j8B9j64muylIkfamu0WIk+qr0gs1Swj+A6yEwMe2809Yt7S2+k4Ps4xo+eIkJd9aVTjapN+vTZdDMTlvHds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706795202; c=relaxed/simple;
	bh=suoI7qvddasF6ze11GbOGjsGkZl9FBFquOHwW330phg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGBS2ivCa9C1rBeZHJJQv/xZ7Nw3p5CbaLBgGCnyMJZm3h8HfDdU+rCxWKqRdZ15tbqyEpMVVEZ6sSLEj6WDFAvBDTglGUknkT8bW77mH5sABvNN1UcVnUOhOpJIdQ2SINivszmUunLO1VmHjpFJMdkWwAkS6kjzeJ2yY07juSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P7Jj2hlF; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P7Jj2hlF"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4bd80b41cbdso342451e0c.3
        for <ntfs3@lists.linux.dev>; Thu, 01 Feb 2024 05:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706795199; x=1707399999; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYWYexFtoJ2yHocou+INVoUtLbF8tOuPvQoRlZwm2yg=;
        b=P7Jj2hlFJ6wTwY6XXAZOmVGKpnOJjcKk0geIELKoO2wKLhvcTc4eyr1I2aAoB8aO3i
         WzjbKJlF2DgN0sR7PJ4QHtOtVjPYKc59PJh3N0MqhZZb7+T50xP5hC31CI2sHXmJTXlH
         cSstJo3V6zWdcTdyERIT+RKMXDVBqpHMkPV0/5M9C7BEYWBxQJs0YK2Hbdvt/Tvvsykn
         T52hrbSeg4tlvVl3nmkwl9OkrNLCZhJZG86Nq/b88WtLwQejosfavqIxmwSE72DbOU4+
         WKpgcXpOXMlp/6jSThId57Floi98IiAK0cSnQuiIbBEKvs7nGwJKyphOtsoctg3CDmD3
         ocXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706795199; x=1707399999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYWYexFtoJ2yHocou+INVoUtLbF8tOuPvQoRlZwm2yg=;
        b=tB3YhWHQY2qJ8GbrS7NX75VVH1ZZyjOzPPN6Qv8feiNVAQloFZkCCqjqJeb/zmvgFd
         2wdvU/lBHsV4IMusF6VWYTakmduAU33dlar5ziv/+CgY99ir0tieV1epfxoMcrJcEgAS
         cdY9k9Qm47R3LMZtozcGLZf1VXn+mykQpMSSzlourE/MC612LNv/5NkUKtYM6UwJ6R4N
         kjaWgKLmuRS7NbK9zm6JK2Ww5SfaonnRHL6qQ8BBcW0kfg5q99aEnYQvNrQ3Up1cfXLi
         zCUfmr145Y/ydTV09CuAe0bF977f2jofxHOOBu0IJSGTK8NStQVJvS+cXpF6O46881w9
         TcOw==
X-Gm-Message-State: AOJu0Yy4wPhL+52s12nF2GUQQ/Cj5WRsF89nEGrCp9FXcyZ4ogkE+Ram
	rX3yiBb57I3G7eYjZnjS67Bvle6OhRvFctmUmBuCsAy0faz7Mj5jjjh5q9p2iRrWhiAItEiJlKm
	E1jGGZ0EA9190QMAcsmJBoq/YeA/UihPvLgan
X-Google-Smtp-Source: AGHT+IG80kHJI3o0nh9nc37cFYAZfNgIoolcnGet/bLjzO8FQfWUZqIqvqwlp1tA8htBaza2xRqZOec13j3l2wPN17s=
X-Received: by 2002:a05:6122:2a0d:b0:4b6:be94:acc6 with SMTP id
 fw13-20020a0561222a0d00b004b6be94acc6mr5599008vkb.10.1706795199311; Thu, 01
 Feb 2024 05:46:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240201122216.2634007-1-aleksander.lobakin@intel.com>
 <20240201122216.2634007-2-aleksander.lobakin@intel.com> <3f6df876-4b25-4dc8-bbac-ce678c428d86@app.fastmail.com>
In-Reply-To: <3f6df876-4b25-4dc8-bbac-ce678c428d86@app.fastmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 1 Feb 2024 14:45:58 +0100
Message-ID: <CAG_fn=Wb81V+axD2eLLiE9SfdbJ8yncrkhuyw8b+6OBJJ_M9Sw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 01/21] lib/bitmap: add bitmap_{read,write}()
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, 
	Marcin Szycik <marcin.szycik@linux.intel.com>, Wojciech Drewek <wojciech.drewek@intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jiri Pirko <jiri@resnulli.us>, 
	Ido Schimmel <idosch@nvidia.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Simon Horman <horms@kernel.org>, linux-btrfs@vger.kernel.org, dm-devel@redhat.com, 
	ntfs3@lists.linux.dev, linux-s390@vger.kernel.org, 
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, Netdev <netdev@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, Syed Nayyar Waris <syednwaris@gmail.com>, 
	William Breathitt Gray <william.gray@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 2:23=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 1, 2024, at 13:21, Alexander Lobakin wrote:
> > From: Syed Nayyar Waris <syednwaris@gmail.com>
> >
> > The two new functions allow reading/writing values of length up to
> > BITS_PER_LONG bits at arbitrary position in the bitmap.
> >
> > The code was taken from "bitops: Introduce the for_each_set_clump macro=
"
> > by Syed Nayyar Waris with a number of changes and simplifications:
> >  - instead of using roundup(), which adds an unnecessary dependency
> >    on <linux/math.h>, we calculate space as BITS_PER_LONG-offset;
> >  - indentation is reduced by not using else-clauses (suggested by
> >    checkpatch for bitmap_get_value());
> >  - bitmap_get_value()/bitmap_set_value() are renamed to bitmap_read()
> >    and bitmap_write();
> >  - some redundant computations are omitted.
>
> These functions feel like they should not be inline but are
> better off in lib/bitmap.c given their length.
>
> As far as I can tell, the header ends up being included
> indirectly almost everywhere, so just parsing these functions
> likey adds not just dependencies but also compile time.
>
>      Arnd

Removing particular functions from a header to reduce compilation time
does not really scale.
Do we know this case has a noticeable impact on the compilation time?
If yes, maybe we need to tackle this problem in a different way (e.g.
reduce the number of dependencies on it)?
