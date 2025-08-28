Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8411287506
	for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756413442; cv=none; b=St+O9EnyDpj4ZyyUSrIuk51+SIubIMIQkEHRfvpn1DQElv9YVKpigsGpFmjkAuwuSLinouqDv+hl0WkvVSTbtQ31Lu0OYSsaJxFzob1qXAYoyF9psAbfAFf4MQV4FJxsAEVFa6enDWzYQo2Y3kk/Ddn5LUX04seOXnEfIGurbaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756413442; c=relaxed/simple;
	bh=4A+hHQVDvywK8T/Ae9Z8hdT8p+fMiZHJ8U+tYoMJ1ew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YptEiF9vxvlTpLWvRJSsWSFqNv5J9tlPb/ZMmVAsQqCtiPzGDlKsshMO+ekXu1wrj8Rwk32P6u5jQsxfRpWkBMamOodPPPwR/+LUOVhIXBZjF9BfuCk0bY6R7gARZWk4Y8h6TytW8qUoV4aI03QMKRp2CuVbXOLfMC5qDTrRaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=TX3t7IX6; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="TX3t7IX6"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e870689dedso94582085a.3
        for <ntfs3@lists.linux.dev>; Thu, 28 Aug 2025 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1756413439; x=1757018239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVnydNepin/bD+gaNKF2yJ3IfALHgiOLd/oO8fikfzw=;
        b=TX3t7IX6REL00F+oZbDu5jzI1rGrS3DPG4sFkBwIUeF3/X+2HWUDfFWd8XAViXCteT
         iyJinPsLx+NAZabME9xEECRLYZnZZuL8PRZVMDS8Qhe6qLvKvJhKnX12KvFUKujhYMZZ
         AbhD6n9/lHYA6e14tpjn7/v4sUTrjxWmMBWtIeL4gmUaJW+2GpEBYcPCfE1nRhTt1EJK
         cxd8vfQk5W4NgUpYfeY7S2aAQCu8pjhN7h4zBTpIKPQFswL7SH63UhmARVWF7uvfi/jQ
         9nXOgp054ljAXFRQraOlHHphicrk3c34uSkfWvX5e2deGRtuOHs1L0IMTBYgYxTP/MzV
         o/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413439; x=1757018239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVnydNepin/bD+gaNKF2yJ3IfALHgiOLd/oO8fikfzw=;
        b=w1CkLxE2qcj1scfxZd5THUps5TU9At1WSmd2JZEd6jCMANFwsuW5zeMvX2akH2abgR
         iqZc55jiqSp0sThZD+TQ/0qRE7m99Cpk8caah4z1uzMeCx8tgXWirqfvoHLucU0krg34
         Eb6ZuJC/K+Tmxy0LRNb8q/rHjzJqS4dXhTv9CKrczw+MrSPZE9Q6VtAdfOxU+juyA2fi
         UmXy42MhrK03jih1tPGxy2ohDGdmnXhlyi8zd9xnAl0rckMfjyIBuBStVxal5GH2Nywt
         r0nxNBu0Wo0MZSSTH4a4l//fbfVuZudpdCT0rNz+V3QIeHfiPIZuof2rHb2V2sxt3KoW
         hzGg==
X-Gm-Message-State: AOJu0Yx4RNBmTZKThggLFzZBjehLybiH45cX8XeZITPp7w7y4aeKFicY
	Cm4HfygFYIGBo22zN3kVO6bHaog5mfLA4q88LSu1pkLdWkku3/2bng9MXD62etaGQdE=
X-Gm-Gg: ASbGncueVwWDlyN1fL3YXTLYw5LQB5XzKEC5RYwAKfLkQ/dgcgPaUkgm9Tqpko4zn7l
	etTRPCEoaCT2n0a5jTG4Zs/EkhGG9PgPN/6RBWJ8vDRfwTtv9ZR8hC4DRhype3g3eaxWfcShodA
	RbFGElxQPoEJI1UK426IxgYtuuA7FMdc6Akqk7rIWnagyn7M01oOicrfzNDIpMP/JSiMQkNdh5k
	BIaidMUUeNueaQ7qTpXE490/M3Zp2xbmofdwS/hx6GD4ktIurzvd1uQquGb9NzUBr+to+PxSRSk
	7pjW5o5KFy5YiliK+HRtD/fS8dk5zanK/u3yLOPNxIRvh3/BNYXCf24oWPUqXpJEK6lW2wHyGO5
	NpXUSPOYFZXieSDwlQVBUXWjiOm1WaOMh8aBgwvAmkQPExKBA
X-Google-Smtp-Source: AGHT+IFWPGVp0EFtnuGP7IuzsNN7VqWYceEJm3OSNcdsLTKS89hG84EHpmzJ4FBRIi0atJXeDsDiIw==
X-Received: by 2002:a05:620a:1915:b0:7e8:6e2e:84b4 with SMTP id af79cd13be357-7ea11049992mr2638016385a.45.1756413439578;
        Thu, 28 Aug 2025 13:37:19 -0700 (PDT)
Received: from ethanf.zetier.com ([65.222.209.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc153de18asm45879585a.54.2025.08.28.13.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 13:37:19 -0700 (PDT)
From: Ethan Ferguson <ethan.ferguson@zetier.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Ferguson <ethan.ferguson@zetier.com>
Subject: [PATCH 0/3] ntfs3: Add support for FS_IOC_{GET,SET}FSLABEL ioctl
Date: Thu, 28 Aug 2025 16:37:13 -0400
Message-Id: <20250828203716.468564-1-ethan.ferguson@zetier.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Given the FS_IOC_{GET,SET}FSLABEL ioctls are now the de-facto standard
for reading and writing the FS label, implement these ioctls for the
ntfs3 driver.

Use the common FSLABEL_MAX constant instead of a magic number.

Thanks,
Ethan Ferguson

Ethan Ferguson (3):
  ntfs3: transition magic number to shared constant
  ntfs3: add FS_IOC_GETFSLABEL ioctl
  ntfs3: add FS_IOC_SETFSLABEL ioctl

 fs/ntfs3/file.c    | 28 ++++++++++++++++++++++++++++
 fs/ntfs3/ntfs_fs.h |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1

