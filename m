Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B3F17839A
	for <ntfs3@lists.linux.dev>; Tue, 28 May 2024 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716926966; cv=none; b=RK0kIdMQu8PhgGTEXxa66sDZ5rUNzm9xntwj32GguPXCbpV0lntJaEmnv278jSv/Q6uDgCShpT6o9yo3UqfMlzltZ299zJoYoQ9VUzUScBGGwN6WK6t/XJUdJnfvTRLRKZgyJS+sKbZcA7ulf9CF6p+TUQtWCjDsCcO9hKwLoBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716926966; c=relaxed/simple;
	bh=+0iSCsGWDwjVW5xYaGXHsfTyeKKJzAJn8H3yElJiDOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pGHeZH+OitzHlP5PcUyOSSYj5BnGP0Yq3lVbNC0g94aV87zDRlbUKGEXboR5oubY8aknZGAz/P6z02i1tUUjgDdsgDiHq2Z0QWGk/GJFSTtDDkEihd1MiunD8VrBn+q0Cqg+wGxPi0tWZGFchZeKw75DrAiNfTR+loPnf+Nn4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKWDkvNd; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKWDkvNd"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f8ecafd28cso979444b3a.3
        for <ntfs3@lists.linux.dev>; Tue, 28 May 2024 13:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716926964; x=1717531764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fu4BYMko9HMYPo5CaKEH7G68DueusLrWx7AtMbPFYUQ=;
        b=lKWDkvNdUWdq73mv79TRil4zxc+5XqXmxBlKcBfTNflOlDgGXNDHKWkgjW6k5ulmn+
         Ktr63rDNxyMCrRHbaJ7vtn2ExsmzyZGk6RkKV78jHV4PH1TRZnmw5Txsh+49084p0LdP
         NiIaj7tSGffRaI6estZMaP6RMrEqXkCtMANNg4k9vJp9ThbDaCeWSHKm9rdItJg5MryF
         3UGSNxq5olATkyCYTHwk3Gmzt2AhkdtFWwxxKhi7Y4WBy8jFu4nqJZVYFBxYzzW6vicb
         buMZi9Ky9p7HD2tDqrqjdj6GoeNf8VL62Sq0E0tySAwF+YUOz/oSHnYm1vDCEoiqouuO
         crEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716926964; x=1717531764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fu4BYMko9HMYPo5CaKEH7G68DueusLrWx7AtMbPFYUQ=;
        b=YeFka6fKzuXMZbwS1i49ZLeT9cjk3xpvnQ6ZchJ8B2oXiQaPISLKI9/c7XwMkGKVIs
         mzTQC5Y7XV5e773tZNqHp3kGltAWraOrUPkbtviudraFIqEmBQgpjp7NFooDe+QxMWq8
         mNgcKKy4CWnbLw6LsnBmM4BqDMt4DJULvXdT9CIOcma9oQc+W+K+6WfCsnmqpQpKsk+7
         TsJ6Fo6p21oKn3sWBKgTu3cbSbQvHBiJg1+Z8YPIeAFEb4/S01v8J+7DrcqIeRoIItW+
         nPvsbxajkZIViDtLoxVGika0pWIGZ8DqyQF5fiiC65oRrtyJt6z0ZhEkEvjQBQLCrY9a
         hiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs/DrrvWqL8g5ewcUwqphTkX7/qTPSzlPan02ujPU8xtg/ohhLLNtycEL6xFzgYT9AKNRskstog8dvTp0YIUYkGkRoBoM=
X-Gm-Message-State: AOJu0YwSlWvSHl8mqtNXkPOBQnMSMRUrfjBacOTsS0o35/KG0Mzl5wN6
	NjxFn9d8uP07XD1TUQitBLcofbs/Wv7oueZdKASfsUaDnY60XrW9Lul3f/KlhsA=
X-Google-Smtp-Source: AGHT+IGO/C6o8IsMLHwYelwu93dpi2/9VrVw5oFtEOTnuWuTFyVdCrr+1PxYQqgjdNjk8DfhwdOESQ==
X-Received: by 2002:a05:6a21:3284:b0:1af:f817:7c38 with SMTP id adf61e73a8af0-1b212dea252mr15129931637.25.1716926964083;
        Tue, 28 May 2024 13:09:24 -0700 (PDT)
Received: from localhost.localdomain ([47.238.252.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682226fb2e8sm7915495a12.40.2024.05.28.13.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:09:23 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: lei lu <llfamsec@gmail.com>
Subject: [PATCH] ntfs3: Add a check for attr_names and oatbl
Date: Wed, 29 May 2024 04:09:00 +0800
Message-Id: <20240528200900.17980-1-llfamsec@gmail.com>
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
index 855519713bf7..5f7c8bdbb69a 100644
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
+			(struct ATTR_NAME_ENTRY *)Add2Ptr(attr_names, attr_name_len);
+		struct OPEN_ATTR_ENTRY *oatbl_end =
+			(struct OPEN_ATTR_ENTRY *)Add2Ptr(oatbl, oatbl_len);
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

