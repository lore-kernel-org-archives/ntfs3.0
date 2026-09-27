Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614142B74B
	for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532402; cv=none; b=lRrlSfdtD4TYx2aMa9zcFhAAuSme58qma7wXIkmYQtZGIyGOtuD5q/n248w0A7bXAtKQzSzlG4gmTd7Tx1mO7674S8jbE5ghDlNCFVzakpxcXGVk/bAr3p54CzQMuZ7kp2cgBgKSsYLKmupwQ3GKVSfAwkG7pdV7p5/EDwGEyAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532402; c=relaxed/simple;
	bh=x5EJoQUjhuKVRv6H7TnddzJ1gRrd5VxGkLSN6Y2akPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CcCkqra+v72SXj0KR3KrWMhjIMB2nnwNosSXXp7h5UBihFlbiemhdcjvSOR2jiFqT0RRn5Qv6B3zY4w76NTB477NXJfKHCRImOldud+v3dEhUlV5PXr8tPGKCrTiU90AO2R0qZ4uWdEC8n7nUlyO4qhF5a6S/uc/3tRnLqWkirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcBzDhAp; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcBzDhAp"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-398da2bdcb9so798060a91.0
        for <ntfs3@lists.linux.dev>; Sun, 27 Sep 2026 11:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790532400; x=1791137200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8TG0yAO5zlCMJEzn/u58IOvQE9mGTzeJPFMCVyrSII=;
        b=hcBzDhApvc21q+NRTD856sXpXa8LDoAyFB/X4J/ocZXgIujy67ucDxHrF7Yx8VNvut
         8GxcG83Bk08s6mwZ4VJPiM+SJMRBwh3IN9lgpHuYlIver4oBWkVt9pLrU92eAjhAiPQW
         qJZL4EObKhtnDqZp6kdb4sXZxfR4pDmi29GMQ7RWQkmFIEp6xfaxOXEmulhlsEjs4dIA
         WCZDtsB2zuUcXTL+cAsp6I1Vw7IRe84z1n0im35qBlmO5nphw/AF+bnVX2Zv5NDIitaG
         YvXtT37NWh8JlPFCYcem5KHwVe1AAPmFwz3p3UlWBmZ2gkSCb7pZSqfSwLMqvks0JJDP
         J9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790532400; x=1791137200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8TG0yAO5zlCMJEzn/u58IOvQE9mGTzeJPFMCVyrSII=;
        b=dYNaWWgruX6d4+n1pyKeSLJaYP5l2A3mj83hLFbZT8Et+5ufApHsqH6JUajIXcvvNC
         2gU9VHgaEWoveVGh+aXwmXONuiTO5qF2er/IP3PEhKLjHfsx3RkQBND0MNlbGC2EX45A
         pZ2+ZTdQQLP8AAohj5WGpDOMsU1HlQB7ovAvRqJqRVFcvS3hcvTaeXQHl7293MLn6Ywe
         EQk90hoAwvYZUkiw5zfb3kLX1o3x+tQ0gO98pey9sqqTvJ/oFXhhojRc2W4y1XIsVggu
         UMgKFLBsIUt8+cv1k5UjYDBT2btSLeV2n8UaB10UkCQ3ojxfzBaD2Elho6fJ09P9dUXg
         txSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWIt3o++gHfmClPESEVsTplsto35Ga4Wf7dyY3XBPLmgZtTGxGI4tKu0pJHc0QcRdOtKJWyw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI5u88nOXHuQkrbbMG0q4xdAJ/IO1Q1x/M/WgL1u7qkp8zEpRrP
	zwYzwfBzXCm3OMftNVK+bE/W6TNxEyVBIaSwtREIH77/tyBz/XtGemxH
X-Gm-Gg: AYBFou1UnKkxQ/9RX+k6qOvTszjj+/3ARRX0MkTNCsXgcxoviUFZwgGFwR9oCpw4ct0
	UB38E6nXNYEw6YhIQ8Rnwy6bO9/NMGm5/nAmkIK4c4Bx6fGytOXgv5UivSd9e+cs4MxhFgAySeF
	WLsU5HMoUSbC5mFjFFkiK5ywu6ioV4axxVfxGh8PGQPde3D4Y1/ruTTT/KGzFU7bMI6NrtHOf4p
	svPD/6Go4qXNj8nSv9qJOSEsU4KWIGeshvVO+BTeogynIUQDkKwddfE/zo1cHFqhSfgC4rxyKbo
	VFaSLGmF6eWLqNgq2l/RxCqPnR/XxFEhQ6fsZc9Cy7LvS4nQSG5uqa6L6k6IyxgVRi2WU8DW6rk
	tjtZtk/qvY4Rcmwnt06YRK1eo+p+/LxHxpevYFurcanABj8U6MCOXH9NvWCKLi6wLIUjIYEPWho
	J/CONGPWkNGpwjav21MGSvShO6NwiInEh71xoYDZlakRYZ4g==
X-Received: by 2002:a17:90b:3b4e:b0:3a1:ef0b:5a0a with SMTP id 98e67ed59e1d1-3a1ef0b5e90mr1835104a91.23.1790532400174;
        Sun, 27 Sep 2026 11:06:40 -0700 (PDT)
Received: from huawei-w510 ([2401:1fe0:5::3b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm5225385a91.3.2026.09.27.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:06:39 -0700 (PDT)
From: Zhenyan Wang <maximwang110@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christian Brauner <brauner@kernel.org>,
	ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhenyan Wang <maximwang110@gmail.com>
Subject: [PATCH 1/2] fs/ntfs3: clear FILE_ATTRIBUTE_READONLY bit when argument 'mode' contains write permission
Date: Sun, 27 Sep 2026 18:03:58 +0000
Message-ID: <20260927180359.3867508-2-maximwang110@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927180359.3867508-1-maximwang110@gmail.com>
References: <20260927180359.3867508-1-maximwang110@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating a subdirectory, ntfs3 inherits the parent's
FILE_ATTRIBUTE_READONLY bit unconditionally, which means if the parent
is readonly, the child is readonly by default.

When argument 'mode' does not contain write permission, ntfs3 sets this
bit to 1. However, when mode contains write permission, it does not clear
this bit.

Fix this by clearing FILE_ATTRIBUTE_READONLY when mode contains write
permission.

Signed-off-by: Zhenyan Wang <maximwang110@gmail.com>
---
 fs/ntfs3/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 0c9bd66..6717563 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1273,6 +1273,8 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 
 	if (!(mode & 0222))
 		fa |= FILE_ATTRIBUTE_READONLY;
+	else
+		fa &= ~FILE_ATTRIBUTE_READONLY;
 
 	new_de = kzalloc(PATH_MAX, GFP_KERNEL);
 	if (!new_de) {
-- 
2.53.0

