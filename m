Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52053F4DD0
	for <ntfs3@lists.linux.dev>; Wed,  5 Aug 2026 21:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965665; cv=none; b=F/F8ROTeTd6QG55JrbiWa0UcdrsAySdQlGI77Rmm5ZqSYBYTa4IuzxPytN0U0QqAWXBf8m+9Nstx7i6TKpvlwo7iMvm0r7V1ixQMNCNJ9/aGpmlvMoX935f1Sna5lurlq/rqGPXbaOd/POoulZE5KJ+GKS7yDeXD0aPCUJs2Bns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965665; c=relaxed/simple;
	bh=K9zMd4hk7uM/CFEnTD2X3nBbNPjZ1JaU7ol/O2TGlWk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=DtUIO4J47pCLhQhgNi6aYlO8lVWdzR+xtHoonSXsiSd1GZxJHqd0P4Lsok7ohwQv4rF2y/o7UXMdVlFBAfEjdqbUBPWS2Sx830cPkZ2J0kZosP3OiSPVxVp1wyd+U2s/yBAF5bzUq+cKQW6rd6/X/8xI/nWxm34UJdE8uk3NgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPX7U1vZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPX7U1vZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955158f26aso9389535e9.3
        for <ntfs3@lists.linux.dev>; Wed, 05 Aug 2026 14:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965658; x=1786570458; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9zMd4hk7uM/CFEnTD2X3nBbNPjZ1JaU7ol/O2TGlWk=;
        b=oPX7U1vZM7UWRcXYMMrwXKsW4mOWmt+awFs0BJvpLM7gl4CYJVJiTf+/6QYKrv16TM
         p+3/uaY2EFU8w/KLz28AqwsAWIujhCkLxygX/ezoacqiCMbki9z22caL9omTIShF6GTo
         vk+H2bsx1QM7U0SndThxbMHbUYNYftKUhQkp45gnKThHooc9U0FrdAnr+taIWdvWsvBM
         3AWHQ5EddGgHhnla114FCFm1q4xv9eopaYeWdV30B/3crlNGs5QKy6yc2qiDSfJy9fxk
         l75g/GN5zhTcT/HOiY7YHxPY+hgBLRTe3IlvDGMI5//k5goR+TSt/nsL6x7KfCsI7Kqt
         OeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965658; x=1786570458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9zMd4hk7uM/CFEnTD2X3nBbNPjZ1JaU7ol/O2TGlWk=;
        b=p+dFin1V82rCi87ZGb7+am0kAg3l1n8uqhiNK/hJ7UCJKAVs8My3oxTsiYas8kZCnz
         D2MQK0ZZXJAh2jWGpRyC8HTuMMlgqdrC/2VmxwQFk6OoHnq5oaVamNGv6VuXQXqR8wzB
         gFOwdoubzJdUNbq01UV9EK1JJ4kOssC2mbZ4i7myBLMkIn62LI/5jM1HIZUzTb2L7Agv
         3ZBXtMvXbeIC7AgLhcPAbljl/FNDWp5YJA3oaExB3mNjlaUbqMeU0FeGrc0RhjUkMscz
         A5WNYyNPdHJCyv22OD2zLFuv+RFrcExTSDJpDivNS94IadZJ2MoZEqyfzGNIjABEdCFE
         6bpg==
X-Forwarded-Encrypted: i=1; AHgh+RoLafnhdC4IaO3t2fC73hTIvwf/iB73rBmccgyiP5IOpbilh7+Rp6iPl7MqqzRHh5U8m5PHzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtiNW3y7XKab/ASLRq4kf4vbwCFLXPfEliRWFdIC0onpTUY1j2
	rBWDAZiEr3LIsdCZ84UXK5ZUR/YguqKCGpYkoWgw/AVN/TUbtz9Cl6KT
X-Gm-Gg: AR+sD13pWo9Ot/ZG5dCxhOH7HNxzBbPTko+tfkzCf8Geu0osf6jfCjGyMhlQNto0U2q
	GyjlmDTK0Ls6iEmmBmqr84O88WwpPi8Z+6TBrSRqacngLYTg0BB3Px59BUYrK9ZThpiZmFGgTSe
	JFr+CoOh25ZB+Xj+rojwTA+AFRtZzhxFTZIWsyBMz0B57qvsfS/OpT5Lp9W2sAWI/VhYIzJpUrA
	/oyiiHeeaUc8M1PugeboxTmAP+yQ5XmO56t8ReXlPdcyoBlC3soFI951jZAb4GLYAXy/XEqn4dx
	IunO9NEeIEcDlhawchunsFxzqutLNRp5aKdEPHDYEs75+sGYpIZrzhCbXXk5Ndn5x5dcLvIMDQo
	sMyLdZ/rsoM5oI1d8d4eDuXD/XX1g8tqssfVSKxcgvZfVzM49IdJvKpyBB3EeTw9qxxz0FTHuc2
	GW5pvLuI/MqLkjldQoiCT9bUD90QprF2WO1JhhvOnUXWYuBWrkXo78k5LhhutmLqPc/hFozqdHQ
	TUsE0MW/pk1w1TbLksASKLaTqD9xX0VmUVfIn7ICyU=
X-Received: by 2002:a05:600c:4f82:b0:495:4cb8:42b9 with SMTP id 5b1f17b1804b1-4994e7112a3mr116556125e9.4.1785965657638;
        Wed, 05 Aug 2026 14:34:17 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:a000:a300:fc5:1920:8bdd:a336? ([2a02:2f04:a000:a300:fc5:1920:8bdd:a336])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b26809sm430373f8f.25.2026.08.05.14.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 14:34:16 -0700 (PDT)
Message-ID: <6659036b-2f4d-44c0-bd1b-3d76b87a8476@gmail.com>
Date: Thu, 6 Aug 2026 00:34:14 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: contact@lukasldc.fr
Cc: linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev
References: <4_qSHDGTzev3i2hKqtp_9TpB7p5JWTBKwOucZ49wWdoLB9TphDDLl-QsnEjjPLerlfuk-xS9J_qL7TQefUZxd3qW9MttPZT-UgBWJW9B_eE=@lukasldc.fr>
Subject: Re: [BUG] ntfs3: IOMAP_INLINE mapping exceeds its page - BUG_ON in
 iomap
Content-Language: en-US
From: Mihai Brodschi <m.brodschi@gmail.com>
In-Reply-To: <4_qSHDGTzev3i2hKqtp_9TpB7p5JWTBKwOucZ49wWdoLB9TphDDLl-QsnEjjPLerlfuk-xS9J_qL7TQefUZxd3qW9MttPZT-UgBWJW9B_eE=@lukasldc.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Hi,
>
> Up front, so nobody wastes time on a wrong assumption: the analysis and
> the wording of this report were produced by an AI assistant (Assisted-by
> tag at the end). I work in software but not on kernels; I read it through
> and it holds together as far as I can judge, but I cannot independently
> verify the reasoning or the source reading behind it.
>
> What is mine is the data. The machine, the seven crashes, the traces and
> the probe runs are real and reproducible here. Please treat the measured
> output as evidence and the analysis as a hypothesis to check.
>
> Buffered writes to small (resident) files on an ntfs3 volume reliably
> trigger a kernel BUG in the iomap layer: 7 times in 11 days of normal
> desktop use, on both 7.0.0-28 and 7.0.0-29. It points at
> ntfs_iomap_begin() in fs/ntfs3/inode.c building an IOMAP_INLINE mapping
> whose length is not bounded by the page holding iomap->inline_data.

Hi Lukas,

This bug has been reported multiple times.
It was fixed in v7.2-rc1 and recently in stable v7.1.5 as well.
However, there are still other issues which cause fs corruption
with Steam.

Regards,
Mihai Brodschi

