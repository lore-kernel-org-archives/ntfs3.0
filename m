Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4219F139
	for <ntfs3@lists.linux.dev>; Mon,  2 Sep 2024 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725287192; cv=none; b=qoWVGU5tlLhJbVDuXqifsuIJQgqD+dKSV7kWWugNjFGBCyO0XFlD1E1mbgxwkDiz5eUgcCiLOCLnLiyUC8FZCCxEZ6rwpUqB83KDC3C4fEtThakk4B4e9gLgE1ibDXO6xcM9mzrxaRY/FoM5Sx18vyGzFffN2QdNfiPryfDJglY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725287192; c=relaxed/simple;
	bh=H7vyAyYos1Mwcq7X2jIEKoRVgsk9WdtvDuhSksp7HbQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WZmkmPQUIIEoGeVn51V9gsPjcw7nWWN7o7tEicwCU9/WwU1OgRreS7fXBNIMyXVuBnA3yk18h6b0Psrov4Uck7WTQgBNc7UqSTQA1muPzBaBBrDS8cTwUHIVdydz4sPe87hLkw+pFev7rsPdI3QPuhm54w+dGYt0pv9g1bDVlPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=mXNThLrI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="mXNThLrI"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5334a8708a9so768260e87.1
        for <ntfs3@lists.linux.dev>; Mon, 02 Sep 2024 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1725287188; x=1725891988; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjFOfcuO0ShvMdTp7/UhQI6FmPlsW1v0riJgONdlWOw=;
        b=mXNThLrIDKj3oRsCe49rNViAqJjpy7S9XyE3Jtlw9/Tc2yb+2D/wLWljFjfFsoHL4O
         zCoIlGfqT/hHJbWdg81ryBiZ1x/n1n22jnIuWuhP9PDm8ej4NInLTMhvvnaikMl4xsgt
         RZePupA7KVh6mAqFJSp2SRtOzSj4DmTcswyspp6db8OLd1FGnfB8m8g6DxzHpMfwK9NS
         YPjjefBOP4T5oj4VvwyRX1AXUFUejQ4eIZ72cJoFVej89aZ4qRPW7v6gPtKVOsURAEWq
         7v4ElYjjBe1nHncUE3uIOroYxy0BgMCXCeivucS0DD7enwgX2xOxzvoQMMR78ENpGhAH
         NtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725287188; x=1725891988;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjFOfcuO0ShvMdTp7/UhQI6FmPlsW1v0riJgONdlWOw=;
        b=wrGjpuViZGaMJjpBeXgaCXTx766o395asnD1oFZfiAobpYpQtE7MWjWGqAHPoNI2rY
         PBSKS1OkdLs+bxXBpSCOvO6su5HK70P2Tu58Pdn0C6xsmsECTZ+HTJU0zhezORITAW5j
         fMT7qUU2yK6P1fMk2WwSfjCFVTWswPBZCUcsntMEsLEwf86tG5wP3Nti5Yq9CX5jPxE5
         P9GQdtDqj4+VCDMGypsbln1B2whPtnPHcjS3IpPG13wUfPBSzOZtc+KTDu4glNzhvqGJ
         DfrWBy4EY7sFxT074WobtlpoVoYuHhWyBZwJ9D/f1mk2kw6Zk/o0BRrE3y7iK4D/knY/
         zm3Q==
X-Gm-Message-State: AOJu0YyqlJDfy8qjgorFB0bb9N5VdOFp/1zbNY5WOq3cm49dMoFfEWvY
	baNY4oTPrS4lyxyA47w2zZAmBFAcsyuYZXfhNvfejHZKavbP0qGxoPmpeUX3+U8=
X-Google-Smtp-Source: AGHT+IHeIw+q9i7onUbUCEx78myzhKZ0pIFDsy/43aHlqTGGuR/yF5s3RmikeRVD7XGZV/QWroy3Ng==
X-Received: by 2002:a05:6512:b1a:b0:532:f06d:b12a with SMTP id 2adb3069b0e04-53546afcdabmr4089916e87.3.1725287188014;
        Mon, 02 Sep 2024 07:26:28 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:1050:bb01:34e6:8781:24eb:6a6c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d7482sm561805966b.165.2024.09.02.07.26.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2024 07:26:27 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2] fs/ntfs3: Use swap() to improve code
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <20240826103939.63548-2-thorsten.blum@toblux.com>
Date: Mon, 2 Sep 2024 16:26:16 +0200
Cc: ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <041F9CBB-17E9-4D6F-B981-BC861E1048CB@toblux.com>
References: <20240826103939.63548-2-thorsten.blum@toblux.com>
To: almaz.alexandrovich@paragon-software.com
X-Mailer: Apple Mail (2.3776.700.51)

On 26. Aug 2024, at 12:39, Thorsten Blum <thorsten.blum@toblux.com> =
wrote:
>=20
> Use the swap() macro to simplify the code and improve its readability.
>=20
> Fixes the following Coccinelle/coccicheck warning reported by
> swap.cocci:
>=20
>  WARNING opportunity for swap()
>=20
> Compile-tested only.
>=20
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
> Changes in v2:
> - Address kernel test robot feedback and assign match_offset as before
> - Link to v1: =
https://lore.kernel.org/linux-kernel/20240731135403.80805-2-thorsten.blum@=
toblux.com/
> ---
> fs/ntfs3/lib/lzx_decompress.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/fs/ntfs3/lib/lzx_decompress.c =
b/fs/ntfs3/lib/lzx_decompress.c
> index 6b16f07073c1..4d5701024f83 100644
> --- a/fs/ntfs3/lib/lzx_decompress.c
> +++ b/fs/ntfs3/lib/lzx_decompress.c
> @@ -512,8 +512,7 @@ static int lzx_decompress_block(const struct =
lzx_decompressor *d,
> * the same code.  (For R0, the swap is a no-op.)
> */
> match_offset =3D recent_offsets[offset_slot];
> - recent_offsets[offset_slot] =3D recent_offsets[0];
> - recent_offsets[0] =3D match_offset;
> + swap(recent_offsets[offset_slot], recent_offsets[0]);
> } else {
> /* Explicit offset  */
>=20
> --=20
> 2.46.0
>=20

Hi Konstantin,

I just noticed that v1 of this patch is already in next (commit=20
7495ce846bbe4f38d7ea5e023e44ad864b6348ad), but v2 fixes a possible bug=20=

reported by kernel test robot (match_offset is still used later).

Could you take another look at it and apply v2 if possible?

Thanks,
Thorsten=
