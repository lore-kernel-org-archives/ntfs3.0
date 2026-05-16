Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45832EB10
	for <ntfs3@lists.linux.dev>; Sat, 16 May 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925642; cv=pass; b=KwlAwbLe4hIRMnXEljE+vMKKA8J+wl82CBSnndd8SmUMAS4bmF44TGfZY99CZUoukJqxk+T7MyWtRDIhDhwAJpZbiMSCjmka1A3CSSh7SUoordqtNUg+p26LBpdzgcwIaDRKgVBRx1deovoay6zzbxopLQAZVSiLUm2mzd146+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925642; c=relaxed/simple;
	bh=ozFabX2+wpA1waNxoOg9swif06Ui7c36yrFFuSF2xp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ck0QuPjhkE3zDKuZV7y46Nv/m/XCM/R2eQeMPMPx43ENdC1etVTJy/Caqfk471aqiAbXRat66gIWxd9UeauCaMyBGz1GwW00X9s74fnx5hCCKwjJ2EFVrTFOLW53+ti2yDJMHjyOMcUxNhWDpFRxIFFcMMrLGUtnUJ8vHuMduKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLOy+424; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLOy+424"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6587cee8b57so1104680d50.2
        for <ntfs3@lists.linux.dev>; Sat, 16 May 2026 03:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778925641; cv=none;
        d=google.com; s=arc-20240605;
        b=SuFIPAQ84hBgCiwlDA8m+UcFU84i0ryE1l2UKH4gpNIwB9okW7YtokpdsUbkW+KclD
         /5AsBlR+spVRlRK/m9g5AYFwkIfEOxderRGprroPg6sR2N/n32bER5paV+GGw7ac28o7
         ocBq0f6guhQo4i/iGguSwSNo8A0NTmZJExjdPDvbjkUgQfH6JLVg6xpZHXeJHm40k6mJ
         vHoOIvO253BF5Mb+CLAJ58DYzsFExeJA6b4CwKGCzRhxpHmIJASTLa10pCJ5GHdraf1u
         jy0a1WyZTU/qOLLw0zmWmmk44mgyVlkFw+orsB0j8qiViL2XXnkoni0aaWQVmrCuYP5g
         tcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KfbpVW27G4iXABfVGKQoBu/iXDGvwHpAsamzbVWbpv8=;
        fh=HfJytNT3RFK7xLuXm0yzoH5iUgfvgT+MsjWfZYo52O0=;
        b=gyq66A05isZB567Gf3PR3veP01VkCrXjJGpfbkr2r4djMA86QEw0D/kc/7IxloJHNz
         MRKpqRzOhrhGD66Tt7y0gsqsCSu6juLoSJ0LC4iNo3r71RqGweimdrHTBa8FHDdeU+4r
         tfGkbNO2hs418/r5QYVlG9vgLUh3dJELYKeNgqBuHFNAymHxyDTb+OVYUeiq3cF8zwNF
         YvTBGmeMTV62FAcH1hmu12EY4jicJpw7oco2vdssXTzjhmkvGpCwrLHVHGDiev9ifZbB
         /USVKcYvP9ic0w3/d0IEFtVq3lgGfMO7huZ3bIrTbjZHKuRfnTXNF/m2dTMUHW7wAyIW
         wCoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778925641; x=1779530441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfbpVW27G4iXABfVGKQoBu/iXDGvwHpAsamzbVWbpv8=;
        b=iLOy+424/Ha2wJsQBRYP+Ea02qSIMbHy+cuTRHpoTeT2V7jaVY8d3RM68oE9GQxot7
         PS1EimF8HtrP8mH/P8ViBVJaz8B7rg5q2TP7BVZicyZMQ7Iq0/dr+ZvLd6YKy+JKGOeC
         89TZ2u8YOqdTu/bpVHBeN8zn8i+vMLB9djNXQpUxLviaBTwZ+d0e4D1q3mNO7YKzYpDD
         /1fydtm3cg/ovLp+nkV90NXUZq4Q1O1xzX9nXcJTGc6/Qc7o/eVm0/KWk5+uif5tdAlc
         YVk1Jacvv15I9RkEd4rB4/A6cwNxnPs12K0EaMshl72Hc5978rPzCFx4YyZky9Q8pSIm
         /HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778925641; x=1779530441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KfbpVW27G4iXABfVGKQoBu/iXDGvwHpAsamzbVWbpv8=;
        b=dMbWC7QmRbzXIiY5Gj1Xqew5doYiHzpHlW+Wt486LX8Wo78waTThVOj9seyTrXLWVO
         RvlWSCbGNeK1NUrC9UFf8z1KrKK/xWpvn5lKlnt6APvRlYhHuF6qzfnvM6h6tiqh0xAR
         ewD9Z2F7ZtoZIUXijIAJgK/tONKYu/XWJ1IWtC2LyinVQcpDOamQza3D94ob/jJWiWfn
         GDHYGi5YVOJjxtLBwzAKgJJKE+eMBmiZY6c7+Dw3DPAlY0TcTEj4uYYVHg5ThiLEDlVg
         4qOP37KMHE0XR6W0LEG/obyh9XXxC3jvvZyRkJcjmdaVs3syxUMt4z9oNuuTpbJm7dcb
         FH/A==
X-Forwarded-Encrypted: i=1; AFNElJ9omUk7/1xBhDv7c5aWEZUY+crBNWQd+9Hx7dv1UFVUu4GAIyGMPPWSado/5FQpJ+jtF2xCmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEENekAb4WorFL+7zKSiXTLYoPRzR0aY7RNHELKBRXWfGhDQgd
	r854prNbD15bkfOXQAFulbvi5/Ed1EIDRTysecJhD+YhIW+mbUeemMLubBPACM9CA+YpIPCqr1K
	QUWEkyc/eKXG89sdCCyL32y3SEuOm8GE=
X-Gm-Gg: Acq92OH9e6ntmU6mI4uCx/hthMONdhpM/rsMcbSFb5fJ2TFku/28ZJgIyW6bU0K9TUt
	8yZDeaheattDupR6adYhNFQIV2e+EWlZznxAO5zt4KN4dHXoQ+SMEOaZ93h8L/ix/PxEMp9EPX+
	YunC12umy0vxMCoOHIWuSec6/mVkVGIR7AAD9dKEbhF4D4sOwHqYF47EV7rx7EtRFpYHdD44KXe
	mmUuKGnEWSfiboj7uhRf2NeywQrxKDrW+dXeY/FbB49u8u2krbVLiYtxJGm9V9Ho9J/aAi2G2nT
	YarHiYykMWgtmvxGyVoUjqAmVNwBtnEd33HK
X-Received: by 2002:a05:690c:c18f:b0:7b6:f4f:f05e with SMTP id
 00721157ae682-7c95bd18f6fmr76712107b3.40.1778925640723; Sat, 16 May 2026
 03:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515163424.1575298-1-michael.bommarito@gmail.com> <CALFbBicg4oz-MoQue-_MCYaROeWJMkDUySaMP1_Te9z5wP_1Jg@mail.gmail.com>
In-Reply-To: <CALFbBicg4oz-MoQue-_MCYaROeWJMkDUySaMP1_Te9z5wP_1Jg@mail.gmail.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Sat, 16 May 2026 06:00:25 -0400
X-Gm-Features: AVHnY4IDawty-OaDG5f4M0NQEvxBkxuxcJ9qQTQ8GWtF7Xvy8dJzFgQgpGGEjBk
Message-ID: <CAJJ9bXwZcAzfm+U8Wm11FRGSjNVro-VoAxghFCp=fJLQmnhN0w@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: bound NTFS_DE view.data_off in UpdateRecordData{Root,Allocation}
To: Pavitra Jha <jhapavitra98@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 12:44=E2=80=AFAM Pavitra Jha <jhapavitra98@gmail.co=
m> wrote:
>
> Thanks for fixing this. Since you cited my original report as the
> basis, would you mind adding:
>
> Reported-by: Pavitra Jha <jhapavitra98@gmail.com>
>
> to the patch tags?

Yes, very sorry about that!  I switched from a 4/4 patch set to
separate patches and missed your attribution.  I'll let Konstantin and
others weigh in on the patch before sending v2, but definitely agree
with you that you should be tagged here.

Thanks,
Mike
