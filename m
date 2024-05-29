Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFBE17E8F0
	for <ntfs3@lists.linux.dev>; Wed, 29 May 2024 02:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716950312; cv=none; b=Igbs89hTe+o2gm+ToAEf1cpk8rLD3APaJ3M8N+20EV92WMHbzqPiy6YRMPrOQvqJFagacQTqJD6QQZedZ/sA9XKg401wK3ykeKYu8pniHKFYKq/XaNQ3BrddjESR9h2K5c2lPzRpEtfwrSFox80Gf8TiyNAo5QMVHDjEf9oDCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716950312; c=relaxed/simple;
	bh=HgZHWmHi28ObpIcNHnel5WAA2Qk7HGizSk03NCbmczc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B/99cTVha1W8ZiI9e39taGfK7HjbOhMbGnv11WNRoqq/95V6aZCYwGWFkOgUDiH8ToJOnjQbOEuOVxEBTkZ8GWPP32hQer/P1FYVwMeRNU/Tfuuia9McM8QqX6J58nnjmoXVG6XmYXYZKM7VonR/AqofnMdWjpEkhDr2l4wISYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JE4VZ1Rh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JE4VZ1Rh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f47db642c2so12327075ad.2
        for <ntfs3@lists.linux.dev>; Tue, 28 May 2024 19:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716950311; x=1717555111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W65GPkoaDbF/jQ7Ryz6BNIbA5hrTH6BcX6KB+yBc00M=;
        b=JE4VZ1RhN+fS4qWuTnAhlxAmxqsx0UUWegfrMp1C+vJjq0qbERib+Ctx8vQR3D4CYR
         AP+oA+BU+SV9d1x+dpV/u2Am0EH7+/6+2RJSlCWHS0yLzl1R4h3Dusjnih69OAhU9QXT
         tcLkuGqOI0ggaImGKhs7KDD86Q0UwCDeng97GW7isLKLIKObEdD0M/yV9dzC9iDH6vgm
         O/O5eNYgTdrQa4NmcyPlUP2zKBkcoKUBZGQgrDQ/Zazot+LGA+DtQrX0bNGKiSoXCfGT
         0FU+3W1us8t4ucqVIDTJkRcK1no6ugBZIAotZmpgRKgK0HoIvMAuj+RV8Ym6jzdB5KFa
         TAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716950311; x=1717555111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W65GPkoaDbF/jQ7Ryz6BNIbA5hrTH6BcX6KB+yBc00M=;
        b=XdanHC0grqxNocBUQRTTHCYFYj9klqjdJ89YR404t3BcXoBEuFSDmJhVjFVoTNeHQO
         xwu0yE1PXJwhbJ5owaDos/ccuPYELMqHLmgi9+5HZo/8PmP0Mu6v70xN7A7ehHBO6JXH
         p7YOvqTh6SVlkBN5aNh4cH/YA4Z/DQbuaXrb2WjYWtB/M7lNVCuKLULw41DCzpA5FV2Q
         8zT85sNyeyCJn0uf9IVU1Jfgxcjauj77XSybOyb9A4o4k+7qe4W9YceMVO2NbLkrf9xP
         Sam40AJRsh2TA/FTJbGnDNHOiGrRJMEo1K9DHv6u8V/gYHv8KrbyDsDpX/xaDihFQY9C
         ldmA==
X-Forwarded-Encrypted: i=1; AJvYcCXvFnOlIrwH435iizLOriK8fRGE1yaUBCaicx24h9Wa2FTI5+zfLaqvefBy9margszd0NXrCaBOz/auWiupCQrmTmIXhG8=
X-Gm-Message-State: AOJu0YwZBprd2xvkarUF1vx1sGBYdEBXPXwgeAau3NkUolDC5khh+c03
	EtsItqt6aIVX4BseeXsRHkeHnR5HASHehz14PRfKPaj84t6UcyQq
X-Google-Smtp-Source: AGHT+IEu7DY9JEx97MGyPPBWKdnGmfbyfTJ2+2p12JywvQByMmCaIdmerwJT6RSKgeBlF3DDStpMPA==
X-Received: by 2002:a17:902:d2ce:b0:1f4:a3a1:a7e9 with SMTP id d9443c01a7336-1f4a3a1aad7mr78255925ad.24.1716950310650;
        Tue, 28 May 2024 19:38:30 -0700 (PDT)
Received: from localhost.localdomain ([47.238.252.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm87988025ad.220.2024.05.28.19.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 19:38:30 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: lei lu <llfamsec@gmail.com>
Subject: [PATCH v2] ntfs3: Add a check for attr_names and oatbl
Date: Wed, 29 May 2024 10:38:08 +0800
Message-Id: <20240529023808.18885-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes two issues. First, if ane->off is a large offset,
it will trigger out-of-bound write on oe. Second, if ane->name_bytes
is too large, it will trigger out-of-bound read on the next ane. We
also should add a check before visiting the fixed members of ane and oe.

Signed-off-by: lei lu <llfamsec@gmail.com>
---
 fs/ntfs3/fslog.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 855519713bf7..8b977ca5bdd5 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3740,6 +3740,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	u32 i, bytes_per_attr_entry;
 	u32 vbo, tail, off, dlen;
 	u32 saved_len, rec_len, transact_id;
+	u32 attr_names_len, oatbl_len;
 	bool use_second_page;
 	struct RESTART_AREA *ra2, *ra = NULL;
 	struct CLIENT_REC *ca, *cr;
@@ -4246,6 +4247,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		err = -ENOMEM;
 		goto out;
 	}
+	attr_names_len = rec_len;
 
 	lcb_put(lcb);
 	lcb = NULL;
@@ -4285,6 +4287,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		err = -ENOMEM;
 		goto out;
 	}
+	oatbl_len = t32;
 
 	log->open_attr_tbl = oatbl;
 
@@ -4315,15 +4318,30 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 check_attribute_names2:
 	if (rst->attr_names_len && oatbl) {
 		struct ATTR_NAME_ENTRY *ane = attr_names;
+		struct ATTR_NAME_ENTRY *attr_names_end =
+			(struct ATTR_NAME_ENTRY *)Add2Ptr(attr_names, attr_names_len);
+		struct OPEN_ATTR_ENRTY *oatbl_end =
+			(struct OPEN_ATTR_ENRTY *)Add2Ptr(oatbl, oatbl_len);
 		while (ane->off) {
 			/* TODO: Clear table on exit! */
 			oe = Add2Ptr(oatbl, le16_to_cpu(ane->off));
+			if (oe + 1 > oatbl_end) {
+				err = -EINVAL;
+				goto out;
+			}
+
 			t16 = le16_to_cpu(ane->name_bytes);
 			oe->name_len = t16 / sizeof(short);
 			oe->ptr = ane->name;
 			oe->is_attr_name = 2;
+
 			ane = Add2Ptr(ane,
 				      sizeof(struct ATTR_NAME_ENTRY) + t16);
+			if (ane > attr_names_end ||
+			    ane + 1 > attr_names_end) {
+				err = -EINVAL;
+				goto out;
+			}
 		}
 	}
 
-- 
2.34.1

