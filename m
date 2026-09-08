Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F8634F24C
	for <ntfs3@lists.linux.dev>; Tue,  8 Sep 2026 05:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788844163; cv=pass; b=UaSnVGaqmCFqZW9CMs0Ee7oRwvOIBpSnVTzVlQ1obbKBpwOhLd723J2TnBJzLhgdBi9zhHX70a+07f5kwoTAhBcxNtax9efdJjGhjfVrKEqtqhgIN5ws+zXVd3CUHKrVpnx3pSdN1A7JsRysXa/YR3DSjX+qjjoj69nY6lLEmxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788844163; c=relaxed/simple;
	bh=vk08/TQ5Emf5sWq6Ld161egmYeby6hZszTZdM/m/mXc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KKu7NdIjawwabrl1YH4t2ueE7tzCaz0YprFAKBYzBLctN3d8PVh6QeD3zMXHVaHEdF6Lp7YZURQU2m1xVZg/tGSXi8ZjUP009RsiXbvy44J1tB9w1VgbpHhZz2E6VI4MQorByUXH9e1OLWQmN5ISbkBYscKIkKzYrUhoEb0cpjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaEDqsTs; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaEDqsTs"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so5194089a12.0
        for <ntfs3@lists.linux.dev>; Mon, 07 Sep 2026 22:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788844159; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/Lag7fE42r1Mo3yNQv4DI2eMhUcd0GYUTZUb/ehgdWypuqLmIsMSITaNR7hBSmpgO
         1EzGlTXf0NQsXrXtDwugmiNYEqNcXXtVbGWVWmK2jAogcdGa7rLu4XURWFBQj52LCzzb
         RO/detEmYQEm5MIl19sGrFce93t/+Dxi0BQexWCwqyX+ErivMAvHbP6/GbzR3Rpb2isD
         Mmm6550KcIYa4EAcdcme+2XLqqeth47eI4OxNdR348GSV65Vf1yc2R0Ys3wXHha2LMwf
         IVsI96Qk9gXOifC4KpYPw4fOXEakUg3wzW75O/u2y0j3Sn1Y1cO6nVDH6jDaUJP/zFhW
         CtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vk08/TQ5Emf5sWq6Ld161egmYeby6hZszTZdM/m/mXc=;
        fh=0bRT8HPoic60sr2LTjGC2O4LbhSFGfL/vKZQ7OtnWYc=;
        b=BcFqWir9gq/k4rnRBzLy5C75a9haEtoS747M2+MBQAApMuRUVOv9YBauK9hJf46jR2
         duNpNzKolBXzsvey9rto1qNRogb6EZ7Y4FmXPw93L+tCiwcdRG2xALSjyeW8TrClUEQW
         fnANieihOd/bqCTNPDGDjHXYPy/N0uuty4b1XsAE5n8KV5xlOo3DRGpnYTmmr9AEUOi9
         1lIu+tCsMTDF0gwCm9qaMp2JsWz3bG1v6EfBn8ujzReFZqSBSKsWS74iXIN/SRGIMi2u
         oZtNGyTbRE3vHN8qLIn9CwTXmF9bl2uG3xOG923/w5r4OrNLcVR84TM7WgwlSW6N4vvo
         EJ1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788844159; x=1789448959; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vk08/TQ5Emf5sWq6Ld161egmYeby6hZszTZdM/m/mXc=;
        b=NaEDqsTsh9hyMbQ5u00ZYPulKfF6wM4OUDIQ0HCJ6aXzyKMPLxbkVe+yDNYYpSCS/k
         MoMM+ghxLvEqP6RnLV+K/J3STJb2btIvEBHJQxsZJOmorl+3+4rVSWVIF7mZfIRtMV1p
         TTGPbFFbT1ADTlxVfPl5AFrlaKDVlZKGe8BAEf4hioHbYhqfpUEIPgvl80pkRt8Ficj7
         YEpD48/2Y3YQ9cGgkucL52WNalfROI5Bf3HPQOM8+xfOKYPpDVV5Tr8LZC3kFUrltVjv
         b4fa85aIao7qGZWhvdEq1FVc4ApNq4TLCbjDfiIG5P+uiQpEcWrfCKOipR4wFQ1nAuIQ
         TL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788844159; x=1789448959;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vk08/TQ5Emf5sWq6Ld161egmYeby6hZszTZdM/m/mXc=;
        b=HODU5N6I8sj48uvBUn8s92/KqyBqoK2Q7UrbwR9hDvQHZ89kN6f8MxvKUlXukAahqu
         t6Ua5Ereyf+Y6x+vKiM11l3MBOdyyc7dg8s2H0GXsAxWg5V/2FoEcyupN2oMU2BdyjFn
         ebreJYMytadOpMrYYVAO1hKuuaDQ0kLRZYFnqBDpEk0a47zmjuvPQ65HiXIlCospFzbL
         RxGexx7vwJi8kcVkbn8vNACxjenpLtp/j0zlItZQApXBqWX+mM3ZnDC7+9wrw4kov0+z
         /PuBac2i6wlQUT1PNpTt1LEWjgB2APmOg3B7CuXDJ826eWUiMFMjm6uoloptLHkJosbG
         Ju5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxBEnxgKUS2/q1Z1oVjqUKv9sMwHB7SCZmnKqkGbTKMnFh02w4aoaPj3Yj0+5tY884lroBMGA==@lists.linux.dev
X-Gm-Message-State: AFuF++lEhkJRp6Ga+35hPIGcSI/OyilVYrziTlJH9kjC52mSFRvSfpGh
	ZZqaGrkgpx22/L2XBAZvBctUP07H4V4N01M7Q6b0vpqQccHio6ZU99SQS+4eaU8T4M/aecwFEHc
	QQ6MHsVnDGTmjFaf4CsR8PX+e5v8ILmg=
X-Gm-Gg: AYBFou1ILpP1dv7XKzw92euN8FJWc/BYnsbOT0Xy//cnGR8py/EsPoSe5/aqIRuQlQL
	Dwvt7dbX1UOZv/2dPMJ9bNXS5Bv8F9sLvol6ZVh9Ep5H8b9J2f2123Qhvy2Hj/upRPH/8pxMZbW
	I6Zcsxfj11VcjBA3u6Gu4yUMlIgkoC+82aiFhwaUhSh8Gsbxmi8XVF1HIQchMCTum1yoO4X9jlv
	hRsoiUrssYVHRvvMnMK/9oD26ZqABl421wKc4oC7VCxRUe9Qeph/m7+WRILuHjBrU8miiaSDhpV
	q7Fj86n1hWTLUrZW5rpNrmCyCmc2DYOvdD/f3gJGSf//y7WNPeXkHA5D5m7G0mBECsurdzeQpUT
	FKQ==
X-Received: by 2002:a05:6402:4544:b0:6a1:c4f:3153 with SMTP id
 4fb4d7f45d1cf-6a7e8d37360mr14074028a12.2.1788844159005; Mon, 07 Sep 2026
 22:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Akiyoshi Kurita <akito5623@gmail.com>
Date: Tue, 8 Sep 2026 14:09:03 +0900
X-Gm-Features: AcwNN1XnCpyMZopb-kqDztzY7G18b3mbs0ElXQp_21v9sLllCT1OG_y8kZdVA7U
Message-ID: <CALytvNseAEDuMt+7Yv8kTcaOV2xJtSJdAZKwTMsiG4ksfb50tQ@mail.gmail.com>
Subject: [SECURITY] NTFS3: potential SUID injection via pre-crafted $LX*
 on-disk metadata
To: almaz.alexandrovich@paragon-software.com
Cc: security@kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report a potential local privilege escalation issue in
the Linux kernel NTFS3 filesystem implementation involving pre-crafted
on-disk $LX* metadata.

This issue has already been publicly discussed on the NTFS3 mailing
list and a working PoC has been publicly disclosed.

Public references:

NTFS3 mailing list:
https://lore.kernel.org/ntfs3/?q=InjectionBunny

Thread:
"Fwd: InjectionBunny: NTFS3 SUID injection leading to local privilege
escalation"

Phoronix:
https://www.phoronix.com/news/NTFS3-Vulnerability-For-Root

This is related to, but may not be fully addressed by,
CVE-2026-63833.

CVE-2026-63833 prevents unprivileged users from directly writing the
reserved $LXUID, $LXGID, $LXMOD and $LXDEV attributes via setxattr().

However, the potentially remaining attack vector involves a
pre-crafted NTFS filesystem where these attributes are already present
in the on-disk MFT metadata before the filesystem is mounted.

ntfs_get_wsl_perm() loads this metadata and assigns $LXMOD to the
inode mode:

inode->i_mode = le32_to_cpu(value[2]);

Therefore, a crafted filesystem containing metadata equivalent to:

$LXUID=0
$LXGID=0
$LXMOD=0104755

may expose an attacker-controlled executable as setuid-root when the
filesystem is mounted without nosuid.

This does not require setxattr() to be called on the target system,
because the malicious $LX* metadata is already present in the
filesystem image.

The proposed hardening discussed publicly is effectively:

- inode->i_mode = le32_to_cpu(value[2]);
+ inode->i_mode = le32_to_cpu(value[2]) & ~(S_ISUID | S_ISGID);

I would like to confirm whether the existing CVE-2026-63833 fix is
considered sufficient for this pre-crafted filesystem attack vector,
or whether additional validation/hardening is required when loading
$LXMOD from disk.

The issue is also currently being investigated by Red Hat Product
Security under:

PSIRTSUPT-22323
"Potential NTFS3 SUID injection / LPE via crafted on-disk $LX* metadata"

I have not identified an upstream fix specifically addressing the
pre-crafted on-disk metadata vector at this time.

Please let me know if additional testing or version-specific
verification is required.

Best regards,
Akiyoshi Kurita
