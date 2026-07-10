Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD0423A7C
	for <ntfs3@lists.linux.dev>; Fri, 10 Jul 2026 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683643; cv=none; b=MGtGFG39pjEG8hdE5xOFuqtSKLzHD3dqbxVTBRj9Y7FKROMyf474RJTOd/Aj9JJqX2tTMslgxMxhrDpyHR8tCqMuTuSPio4nVx1VNAovTpdwnOCP21Xx4QeX/gF8G8/v7Wv4oIn7QshJazlVryZ22wN17RzwYaTpna/pdfk5/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683643; c=relaxed/simple;
	bh=miOil+xxJFCIgjRTftVKJ15xaMaf8REijFU6jkaMko4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NR/oiGBKU2IGscWXmbeD4MN5oe3lJ8HlQrs7uCZjg/GDrzClJYCdcu7Ycb8uSSzMDgwhom0+Eg0/uX81tdGkqx1DBB63942eGt+bjU7zFn7Vp2GBVwGxUWCX9t9tuWhT54XkDSgNvXbvj1ln6YzAIggKgq+97VtkrYnDlxS6ax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6u06UMf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6u06UMf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-475881b9a4bso814178f8f.3
        for <ntfs3@lists.linux.dev>; Fri, 10 Jul 2026 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783683620; x=1784288420; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miOil+xxJFCIgjRTftVKJ15xaMaf8REijFU6jkaMko4=;
        b=o6u06UMfy9PqJi22lRtFQ3/pjtZIPWKoTsqyPTVHr76549Bj/vfJP0HA3iG854L3W+
         L3YvRNJy0kssQGkmfoGyh3aD2ZQDg4EHK/k8oVAYxaoAYaMZ6Yd4WU2BUcSdNZVUs0g8
         CcFtU7mAzNOOnH/lvT2ZiwetrHIQ7SzwKrBoeMBMz/z2q+bApCPK3J11KKl0N9U6vTqM
         ujNQl2uyMEiD8F5qTjYeOGj6jZVocB6Fs5XJXIQ3GJz+9QO5ezgG2a40A8yiAoiVulsQ
         pjYwTFgUs7YuYR/Mgyr6drCg7X33yaNn0yihquMlHRFcrY9IJZP9UrRdMhq7rDJerJjI
         K1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683620; x=1784288420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miOil+xxJFCIgjRTftVKJ15xaMaf8REijFU6jkaMko4=;
        b=WIqJcXG5Cm7JzDdZFBCkYX6iB4EvHMwn4lSU09YyTKdbT8YDFMs3PqjNrBLRPi+1q2
         MS/liwqc95Izl3pXGpfS82LKVdWBkfCwzCbwAlavgpjZI8w2Xs2eJ8e31uGM5a4Nn1o4
         8Z6YQb74/g+8h3NfThpOG73aG65i9mry4U90+A80LXByzPZb55I3ILDXRi+yDvBoP9iN
         7RyWRZrIV6hInZj4CxF8q3zcwL24tPAOSnrBA1sKhP4CkGKu1pdmcguEXzRoH/1NMDwr
         ho764b7egVFCVrEYBuu5libnX+Nl5Spre2MNbcHcZeGzaQlAiVcg6XTuf2mY+IauqYHh
         UMYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqj8TSv86u45mTqWLGcAzr+lmy4vRu4AWBb6AIY5lL0Ho5BmoIdQRmfjQtYxJTwNHKXHNctmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNWVdV99kgTPNQ0ZtT+UFk8Eyppd+WY74PGGvP8yRVK7ZPGFrk
	EpXNZKWp3MnbLPh7p4Qi5lKkOonfnLjqe3DaP29gmxqzkTE3xMed97QE
X-Gm-Gg: AfdE7cnoaxedKisOLuR6ttbOXBd3fsf+Jv1dHjmZwmC+Vw6nKyf5Ld7C18T/mVU6zGh
	W02VxlJ9umuZ+UBXQD4rMz7tq7Giv6uRO+NZIeUAsfPmocrptnHm31enfgbaxfnaazKPA45AJ6S
	61DtoQhvAee6DXNuqyrEezcyOyrAp62+XBexRd9d6xqRrp2f/tK+SObr7JehmwGmLwur0PgVk8A
	AhhqaWTOJ0fQEjUCxHN6AL0MPPbeQuepRGtv1ev3fOX68TY/vUPtkSbnd9lXnkOSRtCIg4ORz/s
	a8+amOBePD91cuGLbOLRiFNBCCheTCRngY+G+PmrlhLVIFNkm2Cp34jr2OlLUCZ1j95kFwXHTV6
	wL4EmO252pr8362M/mBn52OKSPoikNHtHw8OC7vfD4umvMH3X8+6xoDV7GMvrB5277po5iYriWh
	XB+gVmrlzG/z2kuLpDD6MBqXJiCJVXfEZmcg==
X-Received: by 2002:a05:6000:2382:b0:473:1706:7efe with SMTP id ffacd0b85a97d-47df073076amr11663574f8f.24.1783683619755;
        Fri, 10 Jul 2026 04:40:19 -0700 (PDT)
Received: from [192.168.15.197] ([84.239.26.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm13988073f8f.16.2026.07.10.04.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:40:18 -0700 (PDT)
Message-ID: <b077f226-8bff-489c-a260-32cbba9ae7c8@gmail.com>
Date: Fri, 10 Jul 2026 14:40:16 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: reject an oversized resident attribute on the
 inline iomap path
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710023055.3746252-1-michael.bommarito@gmail.com>
Content-Language: en-US
From: Mihai Brodschi <m.brodschi@gmail.com>
In-Reply-To: <20260710023055.3746252-1-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Michael,

Agree on the code change.
However, the iomap_inline_data_valid() bug check was removed in 7.2-rc1.
Maybe the comment should be reworded.

Best Regards,
Mihai Brodschi

