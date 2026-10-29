Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793251036;
	b=wdHLKtVnMW5ooRtCUgjnasl9wPcLS0ZNxdPTnEGhMVZTn0nMI4C1sAHuSc9FrympM91T
	 pqkdINzAMZiEDeeuQqFez7sVXSy9w4q2+Lmq1s1q967isxK06dAPh1BGQ/aqmiz9Uv53Z
	 ir7Ql3Av0WgFABoQn6CExNmRxa6NCMHEhqiOgKTi9oy7Ds7q+W+BrwF43f0W8Dw2VNaBw
	 50s8aiYh7EMUTO8yYMNKHFKaCHlbDVIMzPSpOEIUol7546BjAUWDA/NIOxh3Ab5cTnb1e
	 tC18WdqXgLu1Mw+qQnuJ8iNwFJsI5pVg0mvGaRo5vgNwLvPInRgmJyeKiRpkX6sKhCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
	b=Z2rTiwPkx4EOJku6ehmFY464eKAC4iCI1lTLJX4UEMvwfZ4bD7SoJqMB+2+fc1276Gzz
	 rR2HUCrYA681e9sVq4FeWSPie2Cnx36M5Z7e1hMFUtv4uQtsi+Gp3isNE5mmEB3jzGHYy
	 HFVwJsdyA5pIWP0nyhhCekExGl+Bk+o6OgURr9ABxH06My09nkpdlPI43iyZI/tpiEBDp
	 0WOJOgz7NJetWXTseuEomhxx35RSS7LOM5khR07eTTOY+KMwRtXQN317GUIzUsVzSalbJ
	 2YsNckUP3J3j3lQUEYcEEVgQGz9CI++biVXEleq9Nml/sIZWWUkiyT3EUa6poDxFTrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2VzbZGF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6C606A31A
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 05:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C6C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2VzbZGF
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4395d31228so265982866b.1
        for <ntfs3@lists.linux.dev>; Wed, 28 Oct 2026 22:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793251034; cv=none;
        d=google.com; s=arc-20260327;
        b=phfMX8ImEZSqMfWwgc1Aym5ZwUX60DJbah0/8HZ1zT/0EAyuDLKXjsyf0og5jJLMzM
         kZD36wBdjb3D0apvAPKzQsmuo/RM88mXYr01hvMZfkg6H62PDeIizAOcPaskVyVdMxhk
         UbKrbnykibXxDD+h5NuoO2jY8eQ7seAtXbOkSI/Q9LWmRy2c9TQZEEHWtfZI+0XOve9o
         s/f0VEF0k5KVT71jxyinhB+3jrTC221F63GWho4+r5K1ilLa3wHV1XWQCjqPjUlAPhp+
         pW/kS9s8yXEc5PGoFTP+2tRAoL2EQKGw4puJKUBfY3AO9HHiOfyQGaBnDppqn4M2SX+s
         PVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
        fh=SkpKK4H3iflpnHJQtbAK01LV+306D6uShZUJbhXOusQ=;
        b=gH0a+HxL7yqC6MG1Ab7Uwo0e3h88I7GX/Kp8GZECJCQajscrVt7vgqMJCC7HnNJ+mD
         IA4y9AWbozHQK0Al0ToBzsXpz5PZGxfHXH0TTT4BDFwJCCPbbVKJEiUDrij6+JH+i/im
         tvksbYTUNhiBdauNB7TAvGpm6SEbV3+dV5LiEK99aUFmlj1AYXcpRl+MyV/hSJUYbGGn
         +YQOvqbMCXaKXDFm41JxN+ktH13juqZFIjMWpW0XnqQXOTty8pAdoYFrBGiMj/0qfrrB
         D/LJJcT2c5sns/osR2egj0Mc7nTb3g/nUPHUuklyWnffdJRJ1P0cYWzYF2HhLv23MFPH
         ZwHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793251034; x=1793855834; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
        b=c2VzbZGFbWVahDU6In3m0hLgrfjD7/oDDZdOoJMOQJ0vTOx7C15O1ce5fRwf6Z3B2E
         B/oomUYbmoLWjr+lwDcxLHAsrWnpX8wHvudSUui11mOJShOyFZ+C5Vi8JRxz9y/TkGc3
         1WLD7GtEjw5xinGH+3XS19HjxTt2WpSlQ4ntOWsmD4JwpAnsYIMYekOVEqFCW6xj/udh
         kqYB79vBefJUfndVRX5G5AywJ3s+E2NfqRPlEKMRnB/HI2oSAcOm/8jai8qoGcBlPg5H
         +duE6ZgpLG0jV55+9RPiMttf835Z+uE3bAsgAd9w81/g3wUnbFYYPEsKi1ijxcm4Mq5B
         oiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793251034; x=1793855834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zS6jG1ivlI4v7YRYbvRdu0UguaFFk8Sw22mlkI7ZM6w=;
        b=qCs4Cy10P3CoAb/d9PjVIAd1s2l45W65QfYAALncMHxzMAQ9u2tppfIzGeAE6NCkyo
         Og9WygZ+4fm+i0Gw9wIG00Jxmuxg7zHHtNr4ovuas3TMplzKOCkX9qvLfp4hGvu4/GwA
         JtJBGsrY5u3ozdZ6K89F4oUxwsFQrHmyqZbAjMKmJpjE/PTbpDacIoGivmDVnSk/BWFj
         uKDLbscKONT1KBIfb9vTgCOvP5yPUABkVDRRUf0onCHYtywJCBoHUvOXLRBqwotFqDpW
         fSeu3y75b73g8RobBwTTpsSs2Bj2yHi4QsF8s+EUVzIO4SUSlnByaxkNh7tqCyStnTKY
         /YSQ==
X-Forwarded-Encrypted: i=1; AKwUvBybqa6FDiHgLqoufjzEFql2Tbkm2PjtzYdLJkq9TprmnQrNJTzffuKI/Zcj6HleTd9iD4IEOQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK5MNLA6b8z8OVAzfXZUMN42VbaLysucBEUbP6HOUEK0WskkkYT
	/h44jBhY3+WEksdTwdq1afFdD8BYylqDqjw/nwsBAMDvcf38wG1bpCD5gkD2jHasD1atgQoH2oB
	FGOpOxnbl0upW0hOFgV4XeVqeP3SccCc=
X-Gm-Gg: AYBFou0p+NHEQzNISF/5vR9GWA3V40t9JYHFauC4reYDASzUMf73cE/oU/NOrzDQB5W
	qxDkdDA7Cx7lwAdqo94rgA8VSHX0kFf/FbXBsKmFNwYSNywAeJYUm5iABJvNj4sCkiFh8HqW4lM
	NjC2ZaDqoU20eYXHxAPD6oItTPdBUPI6qlYnD8U7RRw8jSo2JgrjS2jc6yntgbAH3JKqvM5nADg
	oYWRMLHYXRqlql6HFHnTMpYeM9VOdOgwKA4ojSuQwTdpdntnT55RvtNyGw1MZmVptDck4sTgAg/
	wlbSYDkC5MsQIfIzWIPQqgM5E9OgLSvhY/OZ4RgaW8MzCo0O8hin1m1evEoeOOGXPfKlZwm3D2o
	ff6FyxEiscNxTIEyuzU3OJEG5IDVdJsD9UH9wl4ST3JP0u+/AEckbc7oiodKKZPfHtNFStoNozF
	5oQ09Mk3K05747ewg=
X-Received: by 2002:a17:907:9c05:b0:c29:63f2:99bb with SMTP id
 a640c23a62f3a-c49be064d35mr374194066b.47.1793251034232; Wed, 28 Oct 2026
 22:17:14 -0700 (PDT)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023223533.686085-1-christian.aurichzm@gmail.com> <eeaabd5c-7df2-41fa-8f43-69c8d4853e7c@windriver.com>
In-Reply-To: <eeaabd5c-7df2-41fa-8f43-69c8d4853e7c@windriver.com>
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Date: Thu, 29 Oct 2026 02:17:02 -0300
X-Gm-Features: AclHuK_JpQDUONBjla1Ai0oyorNTPqTGvEsrW1NB8qXMSIX3h6B5CLZay4px1WQ
Message-ID: <CAPDkpGqDt+ibYUfnkXzsOWB-KSnMctZkEFyVWGXmwO=UTwh=9g@mail.gmail.com>
Subject: Re: [PATCH] fs/ntfs3: fix double ni_unlock() in ntfs_readdir()
To: "Zhou, Yun" <yun.zhou@windriver.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	syzbot+5c0ed4f2974a8b100ed4@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On 10/29/26 11:25, Zhou, Yun wrote:
> The issue is caused by a conflict between two patches from different
> time periods.

Thanks, you're right. I'll send a v2 with the commit message fixed.

I'll keep the Fixes tag on your commit (7a5aa6c45072 after the rebase),
since that's where the bug first shows up in the tree.
