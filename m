Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DF314B943
	for <ntfs3@lists.linux.dev>; Mon,  1 Jul 2024 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829804; cv=none; b=cuYItylROJz/HvzzPQ1y8oMx/q6h29aJYZwk4mmMzF9rCAKS+yAeKUU/WXhWhBPPfdvjo8rBE2Enq+dKjaV0VA//RAzylyg6Zro2FO9IBg2HqZcWwQJLS/cSUi3rFutCY8WNwN5yMDbpDcEupPWCht0VXaJYBOXJZy1bIPUw13k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829804; c=relaxed/simple;
	bh=OO+2/ON76sJVy9Pa0ZLw5+35ax+dpZuNtKqSg/g0HS8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=b76pe/9F/RzIIBqfZhZYTL2yLrVw/bReSorg7bLCBzc8v2gOJPmrwNf36FIZL5IwZ1IbX7G9IWbPvMPFg4LpP89VmnsGMqWlF0BnMeJFwgLHamUpnyvAX/kJXF0uPPSOlCe5Y5w1KghEoYuHPR6VQV5UQSg3sR//6bGwKuEl1kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga3KOtO8; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga3KOtO8"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7201cb6cae1so1268990a12.2
        for <ntfs3@lists.linux.dev>; Mon, 01 Jul 2024 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719829803; x=1720434603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnMzFvWipRo1kBxS6WdO09SxOkLo4LEwwGqcS/2jaJ8=;
        b=Ga3KOtO8apWagJficRgFJdGi3PNRWlOWyxUQ9gQekhTBwXN3zZIqOxDx6ttAkOGJ5s
         tl9l6x0COuKJkoj1nuZl+eRmMQzf3arWA7dpPqqVC9e1zNMefzRLf0iipw8aaP9JuppA
         N5NGlmYemVETSep9EqvuwtLsFGNYK1u7NgTAA2PepuhIVZMPiXOVfATDMfeRJlMdEEen
         V5xDyBuqiz95Y+ATURcQ8X4BFBm6QQpMqxTU8LIEZG44y7xPKqHTi86oZdp8kBqYRuSG
         lI+PQ3jzTIuE/TbgP/ROtJTKFsJC51qt2uGVbJ85FfUCkYDV+JT0Rx4BPmJ1LkkC4hsU
         61Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719829803; x=1720434603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnMzFvWipRo1kBxS6WdO09SxOkLo4LEwwGqcS/2jaJ8=;
        b=F2GOF05SuXHRDikB/gj8XVj/ze55DRXDh1iJR+odHYESFHUx2SMfC/IgtuWMELfiPY
         4B5FUIuHBrijtCKvXJ49eQ7IozI0IyQaAzgTJ/ZkhKYWbYDPmWJ3zIQP/hgwGVJ6fXmv
         z2aOfEnpLUytFx4DjMRl/dFzya9lYwkmZnXRUG/AmtXgw6TnCr2/dqy8U3qqahp59Qvm
         TJYyyd5am/DcUvocFs2JcV23wf/tno8/wv381i14EKHOSvMy0pLiwcPGgaaXi5NwkXCk
         FwqSGzLGZN7Cw/yuezzC8NiSsxqQ0FO7nY0DdQ9njneFLOIbZomdAnfa3Oa3mZHqv8Wo
         z+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQMTadbNEobW7+2A9Pxhbh8W7D8i3kjH1Lc18lFS9E6WhkYUCaorIER49QluoQv5gTO2aDj255HC6bg3+sqAGc8QJz+24=
X-Gm-Message-State: AOJu0YxCsSc9LxESZYFA6ML9Us5bgj3cvOVn9d6u+56fxtheQoZk+31q
	spCVgSRCtQ2MLJ3yGL0B1wRgbhwSxUHE8MpdqTk1XyNO+JH6+vFqkuz5t9hFspM=
X-Google-Smtp-Source: AGHT+IGgx7/seHz0s72m8pjh5NnHZCKgtUYnwQZWlfYQYEoNerIERbdIgYvb6otnGhVFISe/d7EUkg==
X-Received: by 2002:a05:6a21:339d:b0:1bd:a048:7fcf with SMTP id adf61e73a8af0-1bef610e5ecmr4745877637.13.1719829802423;
        Mon, 01 Jul 2024 03:30:02 -0700 (PDT)
Received: from localhost.localdomain ([47.238.252.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c8f81sm61289825ad.28.2024.07.01.03.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 03:30:02 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Subject: [PATCH] ntfs3: Add bounds checking for dp0
Date: Mon,  1 Jul 2024 18:29:35 +0800
Message-Id: <20240701102935.3018-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added out-of-bound checking for *dp0 (DIR_PAGE_ENTRY_32).

Signed-off-by: lei lu <llfamsec@gmail.com>
---
 fs/ntfs3/fslog.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 855519713bf7..af6f2ce9ea68 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4184,10 +4184,14 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	dp = NULL;
 	while ((dp = enum_rstbl(dptbl, dp))) {
 		struct DIR_PAGE_ENTRY_32 *dp0 = (struct DIR_PAGE_ENTRY_32 *)dp;
-		// NOTE: Danger. Check for of boundary.
-		memmove(&dp->vcn, &dp0->vcn_low,
-			2 * sizeof(u64) +
-				le32_to_cpu(dp->lcns_follow) * sizeof(u64));
+		// Check for of boundary.
+		u32 len = 2 * sizeof(u64) +
+			le32_to_cpu(dp->lcns_follow) * sizeof(u64);
+		if (PtrOffset(dptbl, &dp0->vcn_low) + len > t32) {
+			err = -EINVAL;
+			goto out;
+		}
+		memmove(&dp->vcn, &dp0->vcn_low, len);
 	}
 
 end_conv_1:
-- 
2.34.1

