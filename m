Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F528643C
	for <ntfs3@lists.linux.dev>; Sat,  2 May 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777734651; cv=none; b=sHzEbffMiyjG6T++ja4m3PJ+66q/num97KSgxV/an0eiqn9oNr0OQrYnNzjcxxw1yiL5xgPlYHVBoZxynf7He42I8LUMpBA39YdrI+9lz7xU5pUfViUWCoGgQ4Ieg7AHhOVO+C79aXRhSqs4hGuRS+Xfw3nfnXKpHv6EAJJc7HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777734651; c=relaxed/simple;
	bh=wrDoLB/gWauB8bVtkBsq+XmQYX2cFMmPQnW7FhVbJqQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=XgNfI1aULpLnlASqA2RxS0sk+2jjyUYGE2BsxJSg/vdsqIT52E+a7EOdLSCrI6r6KgUf9KM3WcEyRKzcgDFfDo89SOfTkr/lElbdTZaROgqoKNtjuYd85NA00Ub9M1ylQJ8tGUHERb9/p8FMeRRqb653vkU22qsN7WtkLcKQr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIVoezzS; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIVoezzS"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-824c9da9928so1229191b3a.3
        for <ntfs3@lists.linux.dev>; Sat, 02 May 2026 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777734649; x=1778339449; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrDoLB/gWauB8bVtkBsq+XmQYX2cFMmPQnW7FhVbJqQ=;
        b=qIVoezzS1YmLwWIJZxG4J7PaZwuJeCX+J2k2g96AkKRT5wjd7arFl5R6MJa1jk7gLN
         8u0KlT1KwBdPVUHaiYUmHC/ziczsoYQjBeM4t7jHJyJ9fC+sN2Fo8J8dGqDJis3LBTD4
         B++dPF4WgurVBdrvpWpOIbQrKL6Q4Ogt9dAkyxKBTnHiAVldMADUGPo9bLluLpdMREgE
         Dbi/uL2sK1a7lhQia7B3/n0vHtycKMAogiIeXQXVq/wqJMGOu1g/WTzu+ox3Vl99bQ17
         4XhjyqIh5gjvqk6SOvs769bmjaP1A96CDhUWjaOGlQbOuYDOhMYSTbBwpIkE7t/u94q5
         VX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777734649; x=1778339449;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrDoLB/gWauB8bVtkBsq+XmQYX2cFMmPQnW7FhVbJqQ=;
        b=Vk7qbH50vJBJalO3MbjoM2u5OVUbS2PlmkzumxuniFdVMheveT+IbHD/gksY9DJU19
         uO6hrn5ZvkXfG4mkEAE0l6G9HqAbXItvIprTgbkQQgMi4YL+Ziv8bRbb3pWgHT4lQlQK
         neHb6bEkRDNdv8p8AqK77HD1fXLT3mS+o9AZl04uN9ZHDexgwc/+EbArNSx3mhfyfByz
         TyYPUi+YcGUlWt1k8QcQefwzit97znXkS8ARin8H4z6lQvsH/96xlvW7NEwzIPOEm1Ld
         DTtw9KW0Sy25eoLt9xi2/By3tRS092IL8IJL1Vua4XSs0SWQkdd2ojYrTQ3zr13/bXAC
         LoEA==
X-Gm-Message-State: AOJu0Yz4T4w6i2eCS4lZQUxfDCkpToLoWwcOYVXMhaI9J/gavjjhQbhN
	ML/BhBKtVtaaDBznqI6yc25p4ae8gbEaILeTvXrUCFxvKAeHnK95zUvF/Vgv6owNTAM=
X-Gm-Gg: AeBDievJW66VZTiAdH0GiAO3SNtq5sM+pGw3UwoFvSJGeiN+Fm28yuZ0MIgW6whezi8
	USBqUeyxtH5w2F023feqx3jflDiUMlXCUPB5/jD+oYUATuc4aQHZnaoTOjfMqFKuRr3Nj9hBfo8
	yAMca5zLbrFiVhX6h3K5Epv+6ELhJMwmkGA5pVqFidS74wZcLPWkaWSBTjiXhmpxeb7mtcC6pFX
	BVLl1LJQAgr+CwOuny/kENUFT9TVoBaHpDROL65oyKVTuyc3QpDCOtbY3K9xERbo9A5XZR1as8U
	pWEs8Y03Hgy9Uj+0ZbPzKPGPZnrTkwHfQQa3Sht1MI+4oh3SBpOScrRJGhnD6g61JykTH5YJfEl
	ZYrCUqQ2G+MixPoO7TcCHQF/u5XVxDUNnWAqpAC42wOLWpKN9OWJ+nN5xLg4v+RlKiat5AC+6ys
	2jnP6NlnYvfDq6tX54pTZz86zDmVl4gYnmeqBXvtxJNSjnhvG5rcNMBS3zHqeZskDWBtZlCIPcr
	lB5ie+osj4We44/XctzygY//ZdRej1wJf8sEuDx9mSq8XWxad5VzwhOqt9AmrhJRpenjYvnxq96
	GR60p/Bh7A==
X-Received: by 2002:a05:6a00:2d92:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-8352d24524cmr3297332b3a.33.1777734649326;
        Sat, 02 May 2026 08:10:49 -0700 (PDT)
Received: from ?IPV6:2001:b011:a400:bdfe:e2d5:5eff:fea6:463f? (2001-b011-a400-bdfe-e2d5-5eff-fea6-463f.dynamic-ip6.hinet.net. [2001:b011:a400:bdfe:e2d5:5eff:fea6:463f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515833ee3sm6082895b3a.11.2026.05.02.08.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 08:10:49 -0700 (PDT)
Message-ID: <76bc95e8-c758-4934-a68f-bb11e20b0d84@gmail.com>
Date: Sat, 2 May 2026 23:10:46 +0800
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: palapapa <palapapa93@gmail.com>
Subject: [bug report] fs/ntfs3: mounting an ntfs filesystem accelerated by
 intel optane memory causes data corruption
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Konstantin Komarov,

If an NTFS filesystem is set to be accelerated using Intel Optane Memory on
Windows using the Intel Optane Memory and Storage Management app, mounting that
filesystem on Linux will cause some files to be unreadable, presumably because
the data for those files are stored on the Intel Optane SSD. This may be proven
by the fact that cloning the NTFS drive in question to another drive causes
Windows' chkdsk to report that drive as corrupted, while the original drive is
perfectly readable. Writing the the NTFS drive in this state may cause data
corruption.

Listing the directories that contain unreadable files gives errors like "invalid
argument" or "no such file or directory", and dmesg gives errors like "ntfs3:
...: MFT: r=..., expect seq=... instead of ...!".

Would it be possible to detect this case and prevent mounting the drive in this
inconsistent state?

This is my first time reporting a kernel issue. Sorry if I have made a mistake.

Kernel version: 6.18.25
Distro: Gentoo
