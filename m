Received: from mail-ed2-f2.google.com (mail-ed2-f2.google.com [74.125.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E148A2AF
	for <ntfs3@lists.linux.dev>; Wed,  1 Jul 2026 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908738; cv=pass; b=evmmI/MGGPhhyaiHeaN0QIiLQbw/cs9s1h5U+sq29DskEbquNx67Y8Q1pD8a0zdgML7mLA037u0eGNJQ2kl1GFmDxtfXgrmDZl02uaGFaDtatdEPNJ+wcAtPhohr+jXJNG53DKf4vOlY/sRa1SrI3eXgIM8Pkrpt2S1B7wt+9vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908738; c=relaxed/simple;
	bh=gKEugolkMnTPV+ZSXAHUz/DmmfW/0pCogkat6PL2lfE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FMTISkxX1LQ2Ws6GdOldz6E6j5Fv5ymkvbycYyf8rdWx+//DO6cMmiC0i5N++5dQq2XJ2D8xLyuToh80C4T8OQgmB5L3VYwuw3tfYGAiIszhSasm9pWtQY/tSA2CoqzbZer1ZK0nsj5HOjrEbploDow71/IJXpCw5pugcqJVld4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ap0oroaP; arc=pass smtp.client-ip=74.125.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ap0oroaP"
Received: by mail-ed2-f2.google.com with SMTP id 4fb4d7f45d1cf-698736e9dadso259616a12.1
        for <ntfs3@lists.linux.dev>; Wed, 01 Jul 2026 05:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782908735; cv=none;
        d=google.com; s=arc-20260327;
        b=QwC62Mc5lehjDfI9SkfdcCTS5Hbe62p+p+Z21pLDtMURYVIskgb2KCxwK1Hh9i5S1V
         afo473sMbT+vQ/0umrqRf/1EUyt+RJSuY46t44SIlogGjOnISIwI8OwObnG0ZhPcP/IQ
         lFWTF05ko/ZIRhug5cpx3XRzIxzRmqiZK0SERVhhre3zWpaNdodoZ3hsojbm7gsa6+qE
         vlnkPYFAJ+zrINbTx2yYVBO6IjgKcsa2jNn4GnRyeN9eUpEJGaJivJcF7OrLQiRBGtaK
         5eMxob31pc8sb6xJ5pEdN20eEvefsIOMNa0vPpzONxbmY0lmeFl192XfFyOryckQDfzu
         A/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gKEugolkMnTPV+ZSXAHUz/DmmfW/0pCogkat6PL2lfE=;
        fh=Ay0fIimQmWlyJmDyAAsLaFCsFv5MDSVjAUZ0oAHksSw=;
        b=gFRItGdN+7iwyw8S+ISNfxR2mPaKqlFWJcMCtGJHaiL1A0mTgRCOn8Lrnc86Gp/CY6
         PiNHdVewX39PnTWW5+Bfc9DXeR4l/embqM6VvNYjyaPGSWS33FvZER6tPqlxMYO6hT19
         NcqpdLxYaXv4+pnNiyAvesbNrsV+GXryUz63CZytJAg6jJeAzf0z/gNG2h0f5cRBARLL
         qjc2FXxyrdiCW+Yfy5PmF12sDjVEtcHqDD1NiAWQp4yDF/TYSY6GHSQOxx7CD4OLAZtl
         AWYtCBaSaSHasOtBQNTRXBajJEwQljKRIkETHei9Dng9+qyo3cjE9zslaqZGlZjV96Gv
         vqIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782908735; x=1783513535; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gKEugolkMnTPV+ZSXAHUz/DmmfW/0pCogkat6PL2lfE=;
        b=ap0oroaPZheKPW4ampWYfUljGfCmdDmNAYotpYnMJ+FKmnzUBUx1aLAP2HStIt5BO9
         FumkWD4OD8GlYV/DlSihJbaBo479XRiSXZrjjvIHllz/VMOUHmpAYpG3+pxCf6KLVr1h
         q+vXBKg3xufc7jE3xDe76X6VS4B921CtfqakQ5bRuKrhrQB/niu4FD3dUHTwshdYyuvd
         U74+aUNh2DuzezXEIZxfSGrWBMshqjF4tu+rYv//dSzvii1nfvbGQ3Tyjz/oHULhNSVX
         eb8FjkBog8Uk98CSjoLEmeyE/I4vQqzZWiWKYPP/sgbJrLHX9tdcbO21TApqlgS3VMFs
         fDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908735; x=1783513535;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKEugolkMnTPV+ZSXAHUz/DmmfW/0pCogkat6PL2lfE=;
        b=o7rNBkGnUalos+2/9YSiiyvX2SgPDrmJJVqqumBlf0CmuwY9kftcRgq3XKZZw76MQT
         KYoigQ0a9H9ev3CNVx1QlP8/zMYLK1g05Qa/bLsqzX3ukRwI/ljs/LM64wzkNFY7LBt1
         9wDjz/aN8u4UpkRHT0DXKwdgrxwAfIB/98b6bP2LfBWEyVZk4dsLjqDbvvQa3Ut6DXhu
         VkQcGiJL4rmBqqNNTsIpmx847BmBOeukpPhdpqKmIZ0fO/ghUSAOdy79c7xFt+TECaia
         PUPTV5cC1Rxb+sSu0hT3gmXI2MfaiuWXcdJbVD8FDVYMcNadDxqhcM9A27LS/yWACJIP
         v2Sg==
X-Gm-Message-State: AOJu0YziXaGG3WrWqF6dzywBoPd1dX5zj1ehIYPt3RNNjoGCcp4ycV04
	6dXjdbx+c71kXokPNTKnwXUSwZFGjKAhOSDPYwOr8DvRFM+R+X2IC1HbCN/0VMasvyVpWIxcLP0
	nFrUhBFKEFmSLibPcUUsYsWv0WRgvOTrKf527930k7w==
X-Gm-Gg: AfdE7cnGxVkBehJHBcAIdrGGLVZpQYiIZl9CfLLXmDYswNn8rPQSraU05RW/Eg/vX9l
	rLmG1AjUh7uodu70+grjeHq1jZwmdY89I/sxZtMYUj6e4XhglB/qVqk5LKGot9Qfhrc+CLJhqJd
	IGhcIL1mHHzUkTiJtKSpNbI6YR/21KhdzkiBknC766AVscZNDBeX989BukSi5bEfdWTgERS+PrP
	efyWZP+0eBPFswneK72leifejuQgj6oLLb2JnWuF1sKNnoQGGAwbmA4Ys4uySqPjTQU4fb03DOy
	WLE+2UI0
X-Received: by 2002:a17:907:3d02:b0:c12:764e:326 with SMTP id
 a640c23a62f3a-c12a9da169amr65688866b.27.1782908735156; Wed, 01 Jul 2026
 05:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: sdj asj <sdjasjbuaa@gmail.com>
Date: Wed, 1 Jul 2026 20:27:36 +0800
X-Gm-Features: AVVi8Cdqf7juqn_CbSlS62fGyCkuNpOQ4kTHWhZbn8nJt1Q8Y0TWcyUL1baHDaU
Message-ID: <CAFTRC0=hdHvug9=JyiZ=XYowdpqp9TAgXbq0YpDOEnzmQUWxzQ@mail.gmail.com>
Subject: [stable] Please backport ntfs3: reject direct userspace writes to
 reserved $LX* xattrs
To: stable@vger.kernel.org
Cc: ntfs3@lists.linux.dev, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"

Hello stable team,

Please consider picking up the following upstream commit for supported
stable trees where it applies:

5b08dccecf825cbf905f348bc6ccb497507e28e2
ntfs3: reject direct userspace writes to reserved $LX* xattrs

Reason for stable:

This fixes a user-visible security issue in ntfs3. Before this change,
the empty-prefix xattr handler allowed an unprivileged file owner on a
writable ntfs3 mount to set the reserved $LXUID, $LXGID and $LXMOD
extended attributes directly. These attributes are later trusted by
ntfs_get_wsl_perm() during inode reload and used to populate i_uid,
i_gid and i_mode.

As a result, an unprivileged user can create a file that becomes
root-owned and SUID after inode reload. The issue is reproducible
using normal syscalls only and does not require a malformed filesystem
image.

The upstream fix prevents non-privileged users from directly writing
these reserved $LX* attributes, while keeping internal ntfs3 metadata
updates working.

The original issue no longer reproduces with the upstream fix applied.

Please apply this to supported stable branches that contain the
vulnerable ntfs3 code.

Thanks,
Zhen
