Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE33381B1D
	for <ntfs3@lists.linux.dev>; Sat,  2 May 2026 15:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777736607; cv=none; b=YjixcHgPrBx34IlBcbLWM4L1aVDjZoErfjNUjiW3nDjVS8NSERPloNxzrSnNjipFHF+HMSQpJQFWRmitWs1oaZhz1p/iTlkUBNYZx2PVBzJhAXvHiubrPOVnjRoELKIIoKI9Z3DAhfmrKbH20K8Y/4IQwplySpjPuBbcc3gi2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777736607; c=relaxed/simple;
	bh=Qcqo8Bkv1OmcFLp2M409Xk+TJ506bXJtcrDPRa0OEk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpH4EkzIqBgyj5kpx/E9mk1tQWVLFr7ESL1y6FR/86Nn6MY3+V3JV4VgxA0RG03IfwwDlaAX5VgZHYSc6fHGneImRKuW0b1imUOnZsOJ62ZCnQY4M26I4A80P+deWSjYo46vZTquMCYAsampwwBCI1UHn1m3BU+ggjAWCaTuNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiDkPON5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiDkPON5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-364d13df3ccso397669a91.3
        for <ntfs3@lists.linux.dev>; Sat, 02 May 2026 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777736606; x=1778341406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPLhh/sYehPY6xGFGWFMg/n/yf/ziOgLoWmXDVIRRZ4=;
        b=GiDkPON5xkzcylDv2PbK3v33WbObc49nRAfQy7LkUprrJ7CEFgfSThoRIPKNZNQW2Q
         EyTVovirTChDyaknMaYOY1LR/1A9O695UVeC5+m1GXt4pauD2lp0oW8npm6FlEzg4NJg
         cBtgUfSkoW9dvUYkVqeSsbOW/dygC2vD2Qxx0AOwkixzKPmSHnN1InajGhnMxpnUSF7Y
         PJ4BdpQwyp0kRCYqjIERhxvc5yotvRzSwcqR5SAp9PS5h4gxaq8IBPyv/WnqBpJfAWGO
         CCV7n1va3YitFaHSxPNOgE8O/TqhdjlWFLvpXnbMj80sPRU9VGXc81rQH9SK/vOObnH8
         4lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777736606; x=1778341406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPLhh/sYehPY6xGFGWFMg/n/yf/ziOgLoWmXDVIRRZ4=;
        b=ViSpKcGeprrgYD09Wf920h/wVC/2/3ZCkxVzL+XLDqWP6iGLQ/k+q0QfSR8HhO96Qh
         jsNGeuhsTY3+QqptccVP+NrHBJ2M0sSktubN/CFnwDSjlKJ5LqzWVxexVjpSJ33KSpWi
         sT1sNxgjhOuDE3qMq2P9QGl54C/BPeLhYv61Ua5BxHak/7YGD1i2v+ExAdDA+xVXb9ty
         CCwwBT4U1O0+LSj2VpFSK+CpVCsq5eN+hx5m6yRsxC9K7qW2IKBjjp2sZQYHtGGtsR57
         yUd4UI+4mhCKBUJeROeXUOSeNy2lBWAEP3HHsCkb83iS6OKKarZ3Hkt+1Fdvh5oJEPcP
         PmuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/U35U03/wJGziKbLKd49qIVJiN+bfUOZi24rXUAQ602yQS/Wp1Bu/sZFFTBRFpEAkQQFEFpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YweNZOvp1qATEHxq/V2IshPd05nJ5bBAdAOzbiLe8EswoBYLxDj
	b/mOB0a6xWM1iB5M5goyrJCSOb/ZgX5yfsjtvuv7EkZjIerDbp0IQaQv
X-Gm-Gg: AeBDieuXdBVSNHWJ6qIinkMD09EL5EVdMM+ef+/qwvndKOwsSYllg8jrzMGrd00aS3f
	CmuexAUdrH3Gihwav4gIW/ctxwQzInqH1dL33RG3NdNTsyT6encsiWQ8JJAOtcrdeUdXe3KIrvZ
	6QyL/sSkPy2Z6dzqUzPDM+jSbetgq/i4/t/w9lX0am5MQ4UiodaORm8YbQUg9ro7lqupKqtxcMD
	Xqm4aoatfERgFNjt9LsjwrsqrnTa7bldzwK8vqt3mlTFhRGjXaRTfatigY55klrCEkhzr/u/pmU
	iYDhMlOWqN9IFW5tjC0D03SKXRVnRZp1ph+pLBzo/LQqDvvyBGXBVZLR/KTzcJJKL5ut+ukzoZ9
	BaVriihEkExksn//sVqNUCAw4HZXfsjkEBGeWAPNseKx1sILcTwchkzUjf7qq+1BBqmdYv7HDw9
	F5y/fthTjfXpYUsKclB7iP/ppSq5Kd
X-Received: by 2002:a17:90a:d407:b0:362:be3b:c8d4 with SMTP id 98e67ed59e1d1-3650ce10197mr1847644a91.3.1777736605937;
        Sat, 02 May 2026 08:43:25 -0700 (PDT)
Received: from kali ([103.195.202.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaae29dsm52915385ad.19.2026.05.02.08.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 08:43:25 -0700 (PDT)
From: Pavitra Jha <jhapavitra98@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	stable@vger.kernel.org,
	Pavitra Jha <jhapavitra98@gmail.com>
Subject: [PATCH] fs/ntfs3: validate lcns_follow in log_replay conversion
Date: Sat,  2 May 2026 11:42:51 -0400
Message-ID: <20260502154252.164586-1-jhapavitra98@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

log_replay() converts DIR_PAGE_ENTRY_32 records into DIR_PAGE_ENTRY
records when replaying version 0 restart tables.

During this conversion, the memmove() length is derived directly from
the on-disk lcns_follow field:

	memmove(&dp->vcn, &dp0->vcn_low,
		2 * sizeof(u64) +
				le32_to_cpu(dp->lcns_follow) * sizeof(u64));

check_rstbl() validates restart table structure, but does not constrain
per-entry lcns_follow values relative to the entry size. A malformed
filesystem image can provide an oversized lcns_follow value, causing
the conversion memmove() to access memory beyond the bounds of the
allocated restart table buffer.

The same field is later used to bound iteration over page_lcns[],
so validating lcns_follow during conversion also prevents downstream
out-of-bounds access from the same malformed metadata.

Compute the maximum valid lcns_follow from the already-validated
restart table entry size and reject entries that exceed this bound.
Reuse the existing t16/t32 scratch variables already declared in
log_replay() to avoid introducing new declarations.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Pavitra Jha <jhapavitra98@gmail.com>
---
 fs/ntfs3/fslog.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index c0237f7d0..91dc2d503 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4215,13 +4215,22 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	if (rst->major_ver)
 		goto end_conv_1; /* reduce tab pressure. */
 
+	t16 = le16_to_cpu(dptbl->size);
+	if (t16 < sizeof(struct DIR_PAGE_ENTRY))
+		goto dirty_vol;
+
+	t32 = (t16 - sizeof(struct DIR_PAGE_ENTRY)) / sizeof(u64);
+
 	dp = NULL;
 	while ((dp = enum_rstbl(dptbl, dp))) {
 		struct DIR_PAGE_ENTRY_32 *dp0 = (struct DIR_PAGE_ENTRY_32 *)dp;
-		// NOTE: Danger. Check for of boundary.
+		u32 lcns = le32_to_cpu(dp->lcns_follow);
+
+		if (lcns > t32)
+			goto dirty_vol;
+
 		memmove(&dp->vcn, &dp0->vcn_low,
-			2 * sizeof(u64) +
-				le32_to_cpu(dp->lcns_follow) * sizeof(u64));
+			2 * sizeof(u64) + lcns * sizeof(u64));
 	}
 
 end_conv_1:
-- 
2.53.0

