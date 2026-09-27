Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893F93DD879
	for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 18:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532398; cv=none; b=UVfsYVhFLfSnfIHnbCFcJpjRF4yYQyWMA10Bw4/jxe834HZiErSn0SRdo3TVmkzYuaiADIuPbl76Yjg7gPvsYbmFVkKMy83ojQQxG7gTZ0At5JbsIJqB2BJb9wHviNAD909jIX9CY+zd39O/cDS6NN6HLZZ6D3rAv5PUumxzAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532398; c=relaxed/simple;
	bh=Xpcikl8sIKFn87EfW0CcMDwz7ssIH+kvLFmMk6RHr1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVTZqa3g0MPwTsd5nQRwMWwnmGu73iqwJaWZxASyN4SyaXXiYcLBWfKl5jRuWtnNO5w2uz9W4JaL8rFH3y24jvL+Y7UOW00Rlac72o45aNAX38TTu+VNU2CVffjKnNJRPkmvDVbXNFZdnlLg9uSEVQ3zVRF70I0tPTJbKIzGLxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUOBeTBU; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUOBeTBU"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1411043a91.0
        for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 11:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532397; x=1791137197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hrm+Ev4VQJgRD6C6jxGrjXc6kFhErDTiXeP9w+0nxiQ=;
        b=EUOBeTBUmqe2fEqopHfjsQkQa25LWzkTC+asHBn7nsJpXSM/BRBeGlcMAJLA94DW12
         Z/m36gZWly4pNEEkIBLpgrgn3imY/v0WKFEjmXpDFDU8FbvYA/DPklhV9ONOyrWsJyJK
         5dFBJz/U6Zr8PiFDpSjbhzTKeDXunnyUQor8cph14UGq/C3eH/eiFmMkgC4waNXjGXFk
         u9S0H5BN2pLUWlP3goC/Xy7ELjQsIkeL55YxdtK4gB7S3QMTCz3u2ODk3nIXpbt2KLO6
         xtbNs2MOLIxkIrYBw34yqABZd1fxlHpvCVMtNXAbR1yE5SVwzUQfIletIgPIFdIdZhSa
         9XCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532397; x=1791137197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hrm+Ev4VQJgRD6C6jxGrjXc6kFhErDTiXeP9w+0nxiQ=;
        b=b+8KUtWI8TyunQreNqzdKaSzRVGJsCudbzElPk6gxdh0UMCvhSu6bmbUfAHsA4k3j0
         Z+7w4uHiOGeUM8slkn9koyuCzX6Qf1l7YUiAmPPJI89aeyMnHAY8eaVA/q7GWtcL9Ma0
         k3Qazh2NCb68N8pxA+KwbxCCIiisz/0dOKvFvPL/HOb1u1/RHq8cfE4aQa+wDS1fp3RA
         b/fe5AbJbJOt37f+Yr4sPrsXCjhfgtuDj4lnHWIaOxcPZ3Jcz0+tn1lJJaKDI7SW8mfz
         eStYXnpPE5Uz5zV878bWcOghHYl1ahiJU7tPUbfeicqeCcn3LXxY1Bp/Oo1MvQraTQjE
         4zbA==
X-Forwarded-Encrypted: i=1; AKwUvBzcPkfhdSlKhNcaoqShZ7wCLS2HB1yf+XaPluzz2SUwiz0z83LbKl6ST0GQGXP4aZHeVURGhA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIXZidCtI0FTvlWDJPTHO6eYsps8fJj2ce9Lg1xfGOYHzcAWz+i
	XdZAJ9uRbI2mnireQtBMzipczQkh5WzdnkAvx72jzYMIBbJzKYYNRH8O
X-Gm-Gg: AYBFou0uML7dw5Gh2t43gyRa+DVHVMvgitSDie5P8EuCtxaM0HJ83Ja/rboXTlbRpxK
	El8UMs5SzzjHG80tUkL4rvDVEY6Bb9zTmFpdV5tARZygqjjVT+x64MBJYpPbV3riQ/1PcAVD97X
	NoQK3H7Qgls04eo05xW1+p41Wh2VeGu3Xm7yD/dYcYrwNmUIYUN38Wh6Bw+qGbdK2KC9udv10QE
	LMAbW2VFP899BMTTW000CAvDexbXU440AYRxvdaBuhxuuaPcAA1hSXLSEbgWPw+KhcmOP7plUy6
	d2bLMysaoNswQdkbL+TibN2Li5JDLeD+6gFKO56Sqp7/79kHCgNpqntWDSkVE9CO+Mj365WTWpP
	6ZCUWg3evESN/Gx+Rex+nILWzKH+M7y7uO6euRs2xGQi5Ju9iSaWiML/lhkh7fbBWxSte9DJvcI
	5HJ0/0InSodKgVA4npKFMWuZ3J2OBFKNBCi8o1WF/79AZacw==
X-Received: by 2002:a17:90b:2fc4:b0:39e:6c6a:4b64 with SMTP id 98e67ed59e1d1-3a098dfb087mr8670029a91.46.1790532396580;
        Sun, 27 Sep 2026 11:06:36 -0700 (PDT)
Received: from huawei-w510 ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm5225385a91.3.2026.09.27.11.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:06:36 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhenyan Wang <maximwang110@gmail.com>
Subject: [PATCH 0/2] fs/ntfs3: fixes for directory permission and symlink consistency
Date: Sun, 27 Sep 2026 18:03:57 +0000
Message-ID: <20260927180359.3867508-1-maximwang110@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes two instances of non-compliance with POSIX
specifications.

Patch 1 clears FILE_ATTRIBUTE_READONLY when the argument 'mode' of mkdir
contains write permission.

Patch 2 leaves the symlink target unchanged in PrintName, avoiding
conversion from '\' to '/' in readlink.

The patched code is compiled and tested in qemu. Everything works well.

Zhenyan Wang (2):
  fs/ntfs3: clear FILE_ATTRIBUTE_READONLY bit when argument 'mode'
    contains write permission
  fs/ntfs3: keep PrintName not changed when creating symlink

 fs/ntfs3/inode.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

-- 
2.53.0

