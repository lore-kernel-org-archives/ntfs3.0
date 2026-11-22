Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795379109;
	b=gFjZqEYM+5crviuihtSn/V0QZ4wZKcCro1mHVEW+/wSRMAls9ORSp6GLoZCKfKDEzGjW
	 d/68EXiRhkB7x2PklYBAo/uomkUZ4FeQcOqeOSi5cBruwEWm7vPbXB6AFQw126d5i1OKZ
	 4AqPTgtpuwj92LDcB+HYd0VRzDmP1NVskTVvuomWWXLumXnR4246RpkBA6oL4hscHoXo8
	 OYfrt/HWrTGSwy603L6DKyMIMLlWWSYCXZJPRrvp7cQ8ysvuFfWxz4xJ+VBbL6QJmPxBP
	 ugfUWf8OKYu+CE0QuNeTdzOFTnHP6/7d+FtjcMexcrpYR8/Tr13Ce+sI51K1UW/QxZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
	b=BIYxyR736Z4CLg9Ef/sAg4kMbF/dXLiOJEELfOniTiosbm5Ela34xlt1LFVVMtJl6JbJ
	 KWCI/3Y2ho+XW5l4u8w6AfrK0/o3tbCkLWuHIzC67zQBT7in0rQfgvtNa5fgoBBj4elvD
	 PZAv5prn4xqCR+7CJ6WPGbklF8GzATo4x09s40hOD21UYlHk4qUxKrhJM1/HCh74eccVj
	 egT6Hu1j8rgWCgFkpkNl7l2upTnXF7nueQGLoGNTqdIdCSaaQ1l2dtbQwCfMyvOi+JOtk
	 qDC7uzYCJ3ZrXfVTPVHwN63u4RwMVyM9EBaECdc40w236U94ifjkjA/aMQU3WbJ5fNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bynar.io;
	spf=pass smtp.mailfrom=bynar.io;
	dkim=pass header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=hr1Uyptv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D344606A31E
	for <ntfs3@lists.linux.dev>; Sun, 22 Nov 2026 20:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D344606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=hr1Uyptv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3863db981d4so3391286eec.0
        for <ntfs3@lists.linux.dev>; Sun, 22 Nov 2026 12:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795379107; cv=none;
        d=google.com; s=arc-20260327;
        b=C13dUORPfZqozz4ydGUmweg7tUSt8XMlxJWQ6evYhinAXf6JZlRfuqoXFaE9lw6TkE
         rhlrkewmK9fGXFmaCJdGwbDq8PHT3VRpUp+k42vBzsT4cBPK3ILH8jvrQsKwzCixYcZU
         2mRPDCeumSHxJBVMtHw6keYapqGskUILiEiGdeFvwFjNBPkFMobzqjPLbSHg8epqOZfQ
         7jd9NCVl+UIA70P9vqRlVo28Pp8lS33Gxcbacr5YBSYrMeKenJLL4CUTT+xnpGz+sFtB
         fL7iNTXED+MOenqUMAbKPxGGgmNpRD5grVXxRHUX8NEwWnwCOHHYNzZXAnnD5y0SF3RB
         Z7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
        fh=6wLyDsiTW/G+FWeD7saJmDOa7maQ9uxaAvkRZF1BXHw=;
        b=EJOSekRp+8ZIYr+3+RTm7TwP+n2MT0EWOQg7tjlEYMk+ZFEtfJ4j0CCyS02OHkHLXh
         AruOtqtDRtIajLvxnD2QNor+bEMFkcj/+yS3pSid6gWK2BKhihxHY8jlP6K1TSwdlkow
         4xsWRl4SYKABuDNQJf+QiEMwoKKWTJNbBHLaWpW3Td0ef2W9N0pZubPcHzH54k0ezHOH
         iFiyGP5FzQYMj4kY0KdbsQaawpWSDPJVLjcYUDMOiKntYDmkI9cNo0F6ygoI9UTPpPdL
         tWIR5IDEi0l/qHPKrOWQ4OGE0eF4B/pfDCPlc7Q28p9mz0h/JLm7vnDAxTCDtxnACYxu
         3WFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1795379107; x=1795983907; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
        b=hr1Uyptv0SdZDZx4ImDNAG5YIoWwuorWjZ6trGdJP+hwb1YaZ2xzseHhI8wELNHy5S
         xL7ojcGMXFJHXyEZAWQoM5LDbA5+2nfnQCHmfRLYtWCUrvkKFUB3bYJ/kY0l4jhjijsY
         WIoKXJNXN50S/Yt6an52W6hEVu77efLbGFXh4s8Bmv8zvx+L41lg5STB1a7MKl9qF9ki
         aEgi0Cn8ubLHwAdjtASh5BKCjeKEf2aMcJc1nIx1I500MaTxJOT6iBSxSd8dkHUQdp7C
         Kryy1yV1VCVWa7jpLp+o0NBgwLT7NGD4E34RI5NEkMhMWpM0B6+vkCaJLYxUWjXzNooE
         QOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379107; x=1795983907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
        b=DyrUu24VOTy6RjfQZuqXu4qp/vrM2ahKJi+BnroPpJSunTlRZR2yiSWpViMBboM7GY
         AraIw38r3/LIJnqrNYylO4k/lPOJrALYViAONog/Vrq/YrkBIrQ7dlC/vNW3d3hDnkI6
         UTtYzN1mv/9KoAFaaRWbk6AuKiGaW++cDgg+OfuHuW2c0EyDHdtV/Jo02NXrPFf+4MRT
         1T/OrVyyRYfRhXkd0zN2Dn3+rooP1tvBxeuSEY57UZgyDkOYuGj4nugM6rkxImfRnUiw
         2uxAzv4AkBbHosjh8AWVJVQXPIPkSUSQ6iOR2Tshi4ZYWDc/47afLlkYIeetpscGKAP5
         ByaA==
X-Gm-Message-State: APuU4Z8obKYwMwfb6Y94OkHVh9yb9Pfu+7AUESCj0dAixcVt78DyEZjx
	2mJbi/fgVQxpJDiQiy/BaUv+UmVNvIxWwya7XWM5JPm0rOQRrF51ZWb1Go4akJxMuejwsKyzviI
	zMtvQn4XLxBxGqp0HKshyQJKnJMSk+4sroIfz59kpwRM=
X-Gm-Gg: AZFdTZcfr+l7+CoNH3FI5rJv5q/qQMV+gq9w5ZeKdNPcT/nmNn0O4ET4tPsVkN07x7H
	g9C4grSX0AfsB8cHtEMK2drca1H8Om6eZzjFaKg+xLIfUtTub9qtvCVGv6cLcGU0y95gdBxr5C1
	ino2x2rJmEZGbLEI1qhSkrOazQzzp0/zzweGhkcCdekS3SkfD0EtbKO8EEQAbM3kzEmkl2/SwE/
	ib1SB9fkJlRGYLo6xmTl+ExdZO30t6lmAZyctumBaRGlFCsiII9Z4jjiOFe2oK/0odbTvBigrI8
	z1FHR71dq1rOPP6INuFmyqCjFzs1CCwTlmkSqWKvZqRxO0e4tDa/mEoujAMHSIHdryqVMB/J9rT
	yLs9czNq+rkEWPXCaceaAWgGwytaA3odBjAeyCjWyozDZP3RtcaPZZ52v52N/fvt8OdDAKIE=
X-Received: by 2002:a05:7301:2222:b0:384:2662:a7fe with SMTP id
 5a478bee46e88-3856c9a1180mr8820556eec.1.1795379107164; Sun, 22 Nov 2026
 12:25:07 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260925111619.68345-1-giulia@bynar.io>
In-Reply-To: <20260925111619.68345-1-giulia@bynar.io>
From: Giulia Aloia <giulia@bynar.io>
Date: Sun, 22 Nov 2026 21:24:53 +0100
X-Gm-Features: Aa3M54pI_9GiJNz0gNOZak90hOtzbU6MMzqGmmgKBjqtp6rYz4B2p_FhKCa8a98
Message-ID: <CAJzojTiWdt+vbPSu0+pOTypgvyLbn6bvi1L1n=-D2Uv6_k7Wig@mail.gmail.com>
Subject: Re: [PATCH 0/2] fs/ntfs3: fix log replay payload overreads
To: almaz.alexandrovich@paragon-software.com, gregkh@linuxfoundation.org
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Just a ping on this series.
Would you have a chance to review these patches when you have some time?
Thanks, Giulia


On Fri, Sep 25, 2026 at 1:16=E2=80=AFPM Giulia Aloia <giulia@bynar.io> wrot=
e:
>
> This series fixes two journal replay paths that can read past crafted
> redo or undo payloads while mounting a dirty NTFS volume.
>
> Patch 1 validates that redo and undo payload ranges stay within the log
> record before replay uses them, while preserving the compensation-log
> record undo exception used by Windows. It also validates the fixed-size
> OpenNonresidentAttribute redo entry and optional undo name before the
> analysis pass copies them.
>
> Patch 2 validates the minimum payload length for SetNewAttributeSizes,
> which always reads alloc_size, valid_size and data_size but previously
> only checked whether the optional total_size field was present.
>
> The two checks are complementary. Patch 1 makes sure the selected
> payload range is inside the log record when that range is expected to be
> present. Patch 2 makes sure that the selected range is large enough for
> the SetNewAttributeSizes operation that interprets it.
>
> Both issues are reachable while mounting crafted images. Each patch
> contains the KASAN report observed before the fix. With these patches,
> the same images are rejected during mount without sanitizer reports.
>
> Giulia Aloia (2):
>   fs/ntfs3: fix out-of-bounds read of redo/undo data during log replay
>   fs/ntfs3: validate SetNewAttributeSizes payload length
>
>  fs/ntfs3/fslog.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> --
> 2.55.0
