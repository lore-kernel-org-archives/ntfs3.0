Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.202
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943778;
	b=V5q/ixzjdYtpCYWq6InwJWSV8kJBI6Qk4Z6kZkOXWvIDngwndoBZd+M6em2Waby4Q5qu
	 JkhiRI9MSINr8lsNvKjCilpCVc2oZnxtqn+shgd7/RS5l3U08svuO/kAA4EGWk6M+V+qs
	 xcAOzfE7zWxdkta9js6cTBlMqlLwLc0zsyDHyrsukZGKLE92Bg/8uxCRcnhRUqmsmlZmz
	 x/FuPyvnHq1bkaqgGRM+2k2BQlWV6N0/diXBLFD9NCOS+0Lpm9Xj0mXr1B8bP/TWVm/ip
	 t1o0/+PKbT5eeL5J/+H64yjSMEk5hAkDqpPTuaEBYJKGbaMCwcm8qxCFgpAlqc166ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
	b=gTl8Mh8z4nrNATktp7DmPL3ZXwm+YotBfSzX5baS2m3RSYfokWlzHIaiN4Uw+fngE3Z+
	 +ZfRq5TVSa1np5RHZuHYiUq2fAvUy3gOtu6g2xU8HrcaM9TniTa01LxqxDl/FH907sLV0
	 tw2bX8XdtjKNL5D5Lq5+iDKBW7yQWfexlgOCjVKwDAjczb+n7HhWfrtAGx3ZuxCgfvCuM
	 lnirElblSRMLkJ0PBlmRCn/TL0BKqjlhavvlFBcZtzVH+cYRF87fDGOfi6gvD9wKU+uss
	 Rt6oUBlflFpOlkL84UtXdi6dwB/fST3CBApyrmYTiT8/dRxFc3gZgZS+F0EsrnYU6zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raxo7Xvy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.202
Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E0606A31C
	for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 19:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 387E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raxo7Xvy
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4b94bb43008so10406b6e.0
        for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 11:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794943777; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9/Z1jIRxGQnrqk2LsvSChxfutbTGfZGUPHWJ6s2jCYNY0RO38pl0Bvk2umbnJgmiz
         6FfRwLaJ2VBY8vOr22xgqzYrz2H2W0cGZEHOfdrYZxxDzmS3KODit5EV6dEZ2KGkdWN3
         j/VKmooGkgj6/zkO6f8Ot65mcO7RG2F0lQWSGF/aPfWv18lAlFWQu8nhZJ8kQ+aQ2MuP
         43qgceb7C6BXc5RHqfP3G+JjLVZ5WH8ypKcvUp1Z6ttPsnWte4GjJmR/isMZTLECYKEw
         jNI6xEXlzB+oLJCvJD9YVGt8uV4XvGTRXEBD5/hDFOwRmVFAQylSfsfhLpSurI5KeAzF
         m0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        fh=S8GjBnXSCXBDjPXMsSP3ssS1Eb0CmqmF2KkqBlqPfSw=;
        b=brEVAm3JUDwCBTpOq+UlETP6mQPzDezIIdwHEVvWBL2ZZc7v5ljud9Gl6iMTIhQn3v
         82G98Imvy9lYBU4cC6fqiPHzyqJlrsQ8LZ8A1nkbKohvJlgpf3VYaf9ognQn2t/QQM4m
         LNUf2+XRWY5Os3h8wkSgj1sKxE/FCvdQpjEXEknYj+8p6LUCkZEL8f5h6cf1799m2Zsu
         f3TynTyMrU8lrzPvKscWr51iYloiqjEGEujxWNlxSjEmZzhbTSvdOOzr8LGJWKbalVL7
         00aZuPTNR6DVSt1LvrX5bTIETVPH5NzdXousiURbHHmwsqik35/AjzEk5JymkaRRbsj+
         si4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943777; x=1795548577; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        b=raxo7XvyjWnwks15PNm1DmPs+Du/nTIp90HQt6YwrHztXk5QpU36zdlx+CzMX+txlb
         9380y81QOgQ4IQhryCVVsNn0x/ZBqsBCkQha+Np7Qxrvs2J92RTInZ7Cpcrsq9E6ex0x
         S+7uyiwoMZ324ZOmKKv6VWMnuRfEkUA/316mwJSulU8Xu7dboNdY/8c0wt6bd6Cys/9p
         vQaO3e2lb/N5J5iW+6RAHygqY1aiVrYKIQ2iSWJ4+DUiED/pcrMSaSkRT2j9UAmhY/UI
         KQNnnJjOnr0ghBoCMIUD3F8UmO81eLzWaUIvS9Y+gQHzfp96TvkS9V6WsGbLpi+FsHOV
         BwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943777; x=1795548577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        b=RnjKYH/UriqniVoHZbxsiL6xFigFvs0DuJ2ngJRoK4QzBCghUUeejdndfCvsxO+Fdw
         zp4n1vvjngHkR+iZmrRDrPrKtS7T4wI3qcnhLD5c97ZqdE8e+kgR3uvCa9eU59p0GxtN
         J04VbPwD39d1LtiCjNpI+fOUwi9Q8oM9r+U0HeqAWCisqr731W+PpZ8ErQZTLsIe05xz
         eOnTo2OwpsUHw36RbPXjO2s1idKZAK4YGbXmOo6Jntrl6wIdwWCID6OEK+IS1rUY9T4v
         X0UOZ74C0JsDFdHOgrtBZ0m4CvdhotH6TSYJb1NJAcnSEG+zSiJgw2nSs+Wps7wQdCk3
         HbZg==
X-Forwarded-Encrypted: i=1; AL+hErEpnt9THKwqJ43Wmeo5M4oz2+KC5V2d5Er/pbzzcrHpQl7Lv5YvFwNKn53/uEAlAH6JVEJkdA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8td691ZCKQR0VS+kwbtxnFe5u/kX1dwDVRuNyWAO2CLUfQL9GD
	7HhVJhrz4XKiBsLQvP5iHq6bHcN78Pm70DFw9pBpAIhtiPL2dpKlyq0wtxnmmCWetTvZJMH0fh3
	a9570ZQ+0xA4MafqUPymsWGr5yPdxMns=
X-Gm-Gg: AYBFou3N7xPOMp0hxoVlY6YCPdq52pn2cpCBFgEKTuEmPvf+fKCmckXYJaJy6+YOj13
	h90oNi/Ap61xuHRRsrNxfZO9Yf0UGjnAtLBnsTTmTu1IfhTclL5mXvGcE8bhR9NxDqrpr9PsA4S
	dN+bNLn6Ed5QMBsFKY25JNnWv99L++ancvPulxkan7TkL6l4Zb8779xJczFHsfWrmFReJ0pUVGS
	M6vqjLsqVcQZGDr/UhmPgOhE/+Lu6cY8MCWvD830ARMaMoeZ/NZ4SO+hatWoOwLY4AJgxion8OK
	UqzGgyLzYoM1T6uWvqVaH71HafqWW0e6QiBpWneNSGJJHstwP//0pH3RpN33bQQxyOY+uaWWl4n
	rSwf4pQ/Cb5IPocQQEMgrZ0EgyHFxZJ6Li17iSb/Ox/l8v6mRylk+zS9cR6HTiA69qvlxqPit8f
	7qN7/hBGllVM+mTVhBrhEsnbUNdPHRtY0JSSHlyg7tBk28Nst7RaPk
X-Received: by 2002:a05:6808:30a9:b0:53a:e153:e8e7 with SMTP id
 5614622812f47-57741d17630mr920531b6e.44.1794943777052; Tue, 17 Nov 2026
 11:29:37 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
 <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info> <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
In-Reply-To: <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 17 Nov 2026 11:29:25 -0800
X-Gm-Features: AclHuK-EvuFT3sTbDUuzVCeVohToLo20JL-jPaY9zCV6KfEdKeWy3NzN4uK5qVs
Message-ID: <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:43 AM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com=
> wrote:
>
> I'm happy to test patches.

Hi Cl=C3=A9ment,

I sent a fix that makes 'ads' opt-in again:
https://lore.kernel.org/all/20261115103845.56074-1-dennylin0707@gmail.com/

Could you reply with your Tested-by if it works for you?

Thanks,
Hungyu
