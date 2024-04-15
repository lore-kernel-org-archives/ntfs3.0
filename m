Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81BB29414
	for <ntfs3@lists.linux.dev>; Mon, 15 Apr 2024 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713196294; cv=none; b=mzJJKbuUSyoBQtn54EqWwdUwOoBS5OeR9fJL9g40kxcs7bDDMXSOodqKZ+nDmW5ylo73fpwcJ7ZL+fv63B/E7YEvrQ9kmJZPgV4PF4rql3dMxhs5WOSG3UEYrGMj/ZJDJIckYkBKdaHMrzF3vBHIR19b3s/wJL7MnV6A2QgKfHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713196294; c=relaxed/simple;
	bh=09xE/LFlf8yGYO0Vt3dT8wJS2zUG1ebrtZmNDTnLH1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzyfR45+OVUPhCyuGj4AZpY6dg4pP0HkO7UheZdfI2Yfo9m0v3tQQRBnljk2HIl9f3rxekQdEmngc6MOaD8jpet79xLR1r0RF5e4TmkyISCDYi0P2VtdOBfgkcpAF4iJEzdhMp0qpPjkqMYStiiw03kpqbMRmmKVNxRCjHPylYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FPIj9rSZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FPIj9rSZ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso3311006e87.2
        for <ntfs3@lists.linux.dev>; Mon, 15 Apr 2024 08:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1713196291; x=1713801091; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SUbBz+0Pa/+6Pdxji7ckXlL4204e0k2uOmCa11XX1Xk=;
        b=FPIj9rSZgK0UlhFL89VDqpFwOPKa7Yjp0JQS5Bh0jcrefexF+K7zoMUM5JEV8VCyGf
         yHpeESuIOBpTfm9FYF9IqcfbFR4H+EFpvdZOlZSV+1CTjUhRbUOBAMCuzmYgQ7p3lcm0
         7o/GLHU7fhvzF8luAEVHtw0abwzu5sbs8z86Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713196291; x=1713801091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUbBz+0Pa/+6Pdxji7ckXlL4204e0k2uOmCa11XX1Xk=;
        b=PGvLLiZVfQx3zkWoO20gTS281RAY05zxLY9PKdgwVfE4keLHtDJrDVfC0gVvM1jPEe
         AyFg1hV/mSqUvOX6B41z6WVwVvDPR3qIwlAZ1CkGEG9C9JBgyJyBxwCWPXz8/HwqY/0G
         DZ2tXxpmrE0j1SZrgvX3h85C5w81uiAEaY1R6RwNDLVwn4tAHGhC4VH0k9MVjtTRUqzH
         yKC1lRijlzFAyBMWsCe+s1dLsu1fpYx1g1gOe26wzKT6+QIThhpiQumspeDFhR/9Uw0Z
         J538kzY8wrDwN1WlvrNOt2VAXvspCOJ66+TJ70eRez+kgv38W8Ymb+Tf7HcByUHaxYIC
         3q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrnDYlqPJodrRITwVYUmAzLP5qmT+jE3mkW7mZYOcazyc9XkopcUBGnfkfWIZ3FqlGsbKpd0YOcQ2wB+Yh3gSv+uY9A20=
X-Gm-Message-State: AOJu0Yzdb0xFYHaX17LbEPkq0Ju75ppScdHZPUxoC94TaB/4IPRLElMA
	WsiAiIwprqkHqBthmHDcKd7wlytbWjIqBoDPaEXuNd9/mSuOXHOTPiFm3D44ra5yBXRq88V4XVP
	EBSwXXQ==
X-Google-Smtp-Source: AGHT+IGgWP5Pet2RnASR96GXiU9rEt0BNoLN2Lvi/cXuVQZQcweTSpHVtBn7v1/MkdEmcbpnbN76yQ==
X-Received: by 2002:a05:6512:2211:b0:518:dc4c:20fa with SMTP id h17-20020a056512221100b00518dc4c20famr4423005lfu.15.1713196290678;
        Mon, 15 Apr 2024 08:51:30 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id u24-20020ac25198000000b0051593cfb556sm1290894lfi.239.2024.04.15.08.51.30
        for <ntfs3@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 08:51:30 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso3620206e87.3
        for <ntfs3@lists.linux.dev>; Mon, 15 Apr 2024 08:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXu1WnsHOtEBBbuorvUwH/n0SswxQSra3OVzFRMu525dYV3j/gDfoUiNbJOhc54MQWEKc0ETHANHeENgvLI3RnwypS9V8U=
X-Received: by 2002:a05:6512:110d:b0:518:b409:ba09 with SMTP id
 l13-20020a056512110d00b00518b409ba09mr5784322lfg.19.1713196289845; Mon, 15
 Apr 2024 08:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZgFN8LMYPZzp6vLy@hovoldconsulting.com> <20240325-shrimps-ballverlust-dc44fa157138@brauner>
 <a417b52b-d1c0-4b7d-9d8f-f1b2cd5145f6@leemhuis.info> <b0fa3c40-443b-4b89-99e9-678cbb89a67e@paragon-software.com>
 <Zhz5S3TA-Nd_8LY8@hovoldconsulting.com> <Zhz_axTjkJ6Aqeys@hovoldconsulting.com>
 <8FE8DF1E-C216-4A56-A16E-450D2AED7F5E@tuxera.com> <Zh0SicjFHCkMaOc0@hovoldconsulting.com>
 <20240415-warzen-rundgang-ce78bedb5f19@brauner> <CAHk-=whPTEYv3F9tgvJf-OakOxyGw2jzRVD0BMkXmC5ANPj0YA@mail.gmail.com>
 <Zh1MCw7Q0VIKrrMi@hovoldconsulting.com>
In-Reply-To: <Zh1MCw7Q0VIKrrMi@hovoldconsulting.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Apr 2024 08:51:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whN3V4Jzy+Mv8UZGTJ5VEk_ihCS8tu3VskW-HCfBg6r=g@mail.gmail.com>
Message-ID: <CAHk-=whN3V4Jzy+Mv8UZGTJ5VEk_ihCS8tu3VskW-HCfBg6r=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ntfs3: remove warning
To: Johan Hovold <johan@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Anton Altaparmakov <anton@tuxera.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>, 
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, 
	"linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 08:47, Johan Hovold <johan@kernel.org> wrote:
>
> I think the "ntfs" alias must always be mounted read-only because you
> can currently have an fstab entry which does not specify "ro" and this
> mount would suddenly become writeable when updating to 6.9 (possibly by
> a non-privileged user, etc).

Well, it would be fairly easy to do particularly if we just do it for
the old legacy case.

Of course, even the legacy case had that CONFIG_NTFS_RW option, so
people who depended on _that_ would want to be able to remount...

               Linus
