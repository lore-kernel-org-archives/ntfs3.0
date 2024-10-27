Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2F1D545
	for <ntfs3@lists.linux.dev>; Sun, 27 Oct 2024 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730036781; cv=none; b=Cdx5JZCL86KsFyafdKcUZerTEzNxJiqijnodDbx3FK+gTztwzKvUR+j/Bh2fggPa5OtDQr/fOvBXcnymDD6cq9JGol68RYeqWLOZOuVV/nY/MT4i8kCeYX5iH5lYMmENY6/l9swn1YUx2fD6D4/gRMyuSV3h4KYeO6wEm0UvYQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730036781; c=relaxed/simple;
	bh=1wAsLqM/9YxIYVWDGTUmZxhjUhZh3V6gZDRoFAyHJe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Px9QEDftinXIF8dJWpdmQMaGMsWf3mDKXf3uYi+72AtjGsdgGunu6u5SUyAzt874zLqnKwmn/uPlILmMLh/9h5E6HomxtN1n1Y5jRVbbNJqMhyPadjcYygP29jcnaMFi0QhJjMUcllS47MJ6f/XdxppEpYOPWmDjniqGCsZ/9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLLyb3sJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLLyb3sJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43169902057so33969785e9.0
        for <ntfs3@lists.linux.dev>; Sun, 27 Oct 2024 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730036778; x=1730641578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FBF2xCVjDBXY36r9f8qZDqWQaqa6k7kywBRKHfiq8Cg=;
        b=KLLyb3sJBXOD2MIOgilzvtDOO6VgYFtTOJ5egkSKQbmLX2Zd3Sstxh+WNH88tcKDfq
         L28ROWg0DaVFizmcJblFMKthnZSQvDwj/O5hv78BFhEnRLYDhAt2Sx57vWcywc4FaNYv
         EtfvYKglMpRMWAJIZeNfOXWEXQGC09RL70o/83X4WZuVPLd/IAsmGg8hg40SdL774jIJ
         I5Hg3tEJV5hBR0QpLH5YeABS5qwjPVdRJSSdRznUMl3BAJyVkW1R04FyQB7GC7DA/hsn
         RYWV6s5ksod5BjGeaKrEZFD9bGxzet4+3rquxv2yP5kOoSzWIMres8tAJVEPX86cQeDc
         1odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730036778; x=1730641578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBF2xCVjDBXY36r9f8qZDqWQaqa6k7kywBRKHfiq8Cg=;
        b=cbfBUVqnaSBnr7dpZsU4ULksK9ZXpkSBsAmTLCePMrbDQ6NZQD9nY2f4cmjpKENSrn
         V0NczIGak1munvPH4UwMyAzIAJX3OcawvhpgPgYawJ00zQwtjja5hdM1qVLt/Tim++1K
         dnxhST+zTPUkezW4KZO6U+yk4CFiaB/MHheIU3nDiCxz6cT1pmQnpRyGQNIW0seK3Q1l
         /c/5MHdAPJau1re3jYs41XJOGQL93qxDGHOlDmX2YXjcH0WmebI7hd0V9W5X4JAQMhb8
         ZKOt30X85udwlPeOqd+ZLFDDnS207vCRe9fpZ0EB+S2IbSj4YB/RX+4ThFHWaw5SefbJ
         Eykw==
X-Gm-Message-State: AOJu0YzjEjJL95HcVzQHRBsR5d9bgz02x7By1ithVY5hoijCDmPVPQsw
	jF8f3+kyZy6sxHc04e3nHDjWKS2VHYwps2fTCZ8FMugxs899KNqz
X-Google-Smtp-Source: AGHT+IEMlm41NAVGO68RrktYRtrNXvoOnHit95Vmz7cUlneN2UZAJxzmsEtHxE25ytVoHyo3sCHmvg==
X-Received: by 2002:a05:600c:3b14:b0:431:60ec:7a91 with SMTP id 5b1f17b1804b1-4319ac6f895mr48516405e9.2.1730036778049;
        Sun, 27 Oct 2024 06:46:18 -0700 (PDT)
Received: from void.void ([141.226.10.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f7789sm76393165e9.36.2024.10.27.06.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 06:46:17 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] fs/ntfs3: Fix a typo
Date: Sun, 27 Oct 2024 15:45:30 +0200
Message-ID: <20241027134613.23188-1-algonell@gmail.com>
X-Mailer: git-send-email 2.47.0.149.g3e3ac46130
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo: recommened -> recommended.

Via codespell.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 6a0f6b0a3ab2..3d7693a55321 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1252,7 +1252,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->volume.ni = ni;
 	if (info->flags & VOLUME_FLAG_DIRTY) {
 		sbi->volume.real_dirty = true;
-		ntfs_info(sb, "It is recommened to use chkdsk.");
+		ntfs_info(sb, "It is recommended to use chkdsk.");
 	}
 
 	/* Load $MFTMirr to estimate recs_mirr. */
-- 
2.47.0.149.g3e3ac46130

