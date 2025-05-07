Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E720FAA4
	for <ntfs3@lists.linux.dev>; Wed,  7 May 2025 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603348; cv=none; b=oSpRZLJPgTbUD6/10xqTgjdSGXJ34ZcRQN7YWiHSMuMCkuSjZlgmb4lZnN/2mRe1IB+yDe4g1te5jcOYGHILEGfMvg1TH4GLAogsRuF5pbZv+2067FwMuijAz/rGmxe5Qzyx1a/f3JXWwaiQ3RVin7yRMVbwUPT8VZVfV3zyhyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603348; c=relaxed/simple;
	bh=HNIvix4xStzYLoL0TuIkRiiOxHy1GEOQQFZRwLv6y4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TsbSEtThOhhrcDIKxTTHXJH6xk8yWGMq+rKre2GEsRz1Vlo/SSriJV8Q2nRpegLitKulkAoNozEtFoSl6zqikn+7dP49dRQkEdNJmOkxWm1REkYcOmEf+n1n92HMI9pTLZ0gQwbP1ABK/+iDKfqXRTDXHF2PDzf4pD8o9spt3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lut7GdDN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lut7GdDN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30aa79ee726so915031a91.2
        for <ntfs3@lists.linux.dev>; Wed, 07 May 2025 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746603345; x=1747208145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqt8m2kJroPbVma9aagVvCiuJwN64U08TVLGSry535w=;
        b=Lut7GdDNziHEs5H9vAAf6+Cv4rcnV/p8HMTZGPZfiLEhmuRKVeW6Nn0y0z2KR8+uKN
         KMS1xEZ/DMo27V7bOJl/nfxIUUzYgd2xoaQcJk+JKanWPIKxJIHYiTIwPxxhcTYVeX8R
         2QTxHA3qqTA9MltA5MZcYzyzOgVLCTfo984Y7q8dL4ecSJk0csRrZbMCqBSJY7Tyq9iZ
         C5KT6H4V1WJ5TQfS9SDC99jltzkVF6lIusYZg0H+5Kap/qtPoR4xGQiST8P79SGg3qzH
         fJB7M9YARnQ2WW6EsiOT1A3G1rj4zrxxVEjmSVLutyBUCKQZ5VKa55gk0JC2Ewdj2+tS
         Je+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603345; x=1747208145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mqt8m2kJroPbVma9aagVvCiuJwN64U08TVLGSry535w=;
        b=A99DMPjiMhd+wyJFiw4GtupgRu4Y1gTQj29qk/43buqWyyIAK7rmhT1SOp0WDUpP+B
         eKpg/Jw9D+eoru9CM6OdbYiIwIRmPamKDZUjG+hPEpLgFrVie8pV+vQ9g4QRFp8GRyHG
         9ova31kbyuCBYaypSYTwD+Y9Rt9gx8QOmFLWhI+J4ra7NXYtCjHI4J8+q8nsUCs0E1wk
         ZS6qYm8v1k7jQT3dEpvjrYFTnQe8KLyHnKFbyJucyDtaAYhN5N55NLSwf4Qsv3GUPdNC
         YDPx5ghtqf5hV/P/dbX70C71GDbgpVlqtitbrGcaFCVb9cnuFKBun12rqNuf5Pk+eQBh
         Aj5g==
X-Gm-Message-State: AOJu0YzicStXE8nuNXxe5F7Ej42gTGXFQhApyOqPFAAutBQRhzLT2vjO
	SoaPB0VG00hV8sbPwP3WZw0yfVEyue+soBXewBIESMGBJNBRbrHu
X-Gm-Gg: ASbGncvwzN5xUO9mPlcgJGXzQ37PMmCZZiHHNvquqqcBkm6hL5ieZngLeN/dgLqosj0
	6O8ZRgtSFSE0MWTGOaYwPLha9Z9i8ye1/c9mIJaNB/3ySq4doeatRpkzGcTBM3s2BE5/zsEB1Bl
	KpdVJC1+qnQhC/ZLyNFzsjvveNk0oso+fkjIgZoZbxusvYFSYVPgfcJDDl/dbd4+8v9TtqrzKzB
	Jwon4tsxtOwp0iFTZ6WQn6bgpB1MoXUA+DQUTJtAvuhWhb1CTawLyJzLtdwPFwe6H+9aK0cjVCx
	PM/Db4v9R53s+lWvCgCF+iRnoU6amJzm0KpIbryp
X-Google-Smtp-Source: AGHT+IF5SkuwNh5Pvq8XoV5uRbjMgFpuwRPDs5T7c0MrKjfmo0LcxyKCRt7K+S6IUfprDMNp8Z28wg==
X-Received: by 2002:a17:90b:5105:b0:309:f67c:aa8a with SMTP id 98e67ed59e1d1-30aac15328dmr3191770a91.5.1746603344906;
        Wed, 07 May 2025 00:35:44 -0700 (PDT)
Received: from nillco.localdomain ([2600:3c01::f03c:93ff:fe96:ad75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fe34sm87270135ad.155.2025.05.07.00.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:35:44 -0700 (PDT)
From: Rong Zhang <ulin0208@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rong Zhang <ulin0208@gmail.com>
Subject: [PATCH 2/2] ntfs3: correctly create symlink for relative path
Date: Wed,  7 May 2025 15:35:34 +0800
Message-ID: <20250507073534.11693-1-ulin0208@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After applying this patch, could correctly create symlink:

ln -s "relative/path/to/file" symlink

Signed-off-by: Rong Zhang <ulin0208@gmail.com>
---
 fs/ntfs3/inode.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 2641738d2934..7c79c2c7eff6 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1098,10 +1098,10 @@ int inode_read_data(struct inode *inode, void *data, size_t bytes)
  * Number of bytes for REPARSE_DATA_BUFFER(IO_REPARSE_TAG_SYMLINK)
  * for unicode string of @uni_len length.
  */
-static inline u32 ntfs_reparse_bytes(u32 uni_len)
+static inline u32 ntfs_reparse_bytes(u32 uni_len, bool is_absolute)
 {
 	/* Header + unicode string + decorated unicode string. */
-	return sizeof(short) * (2 * uni_len + 4) +
+	return sizeof(short) * (2 * uni_len + (is_absolute ? 4 : 0)) +
 	       offsetof(struct REPARSE_DATA_BUFFER,
 			SymbolicLinkReparseBuffer.PathBuffer);
 }
@@ -1114,8 +1114,11 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	struct REPARSE_DATA_BUFFER *rp;
 	__le16 *rp_name;
 	typeof(rp->SymbolicLinkReparseBuffer) *rs;
+	bool is_absolute;
 
-	rp = kzalloc(ntfs_reparse_bytes(2 * size + 2), GFP_NOFS);
+	is_absolute = (strlen(symname) > 1 && symname[1] == ':');
+
+	rp = kzalloc(ntfs_reparse_bytes(2 * size + 2, is_absolute), GFP_NOFS);
 	if (!rp)
 		return ERR_PTR(-ENOMEM);
 
@@ -1130,7 +1133,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 		goto out;
 
 	/* err = the length of unicode name of symlink. */
-	*nsize = ntfs_reparse_bytes(err);
+	*nsize = ntfs_reparse_bytes(err, is_absolute);
 
 	if (*nsize > sbi->reparse.max_size) {
 		err = -EFBIG;
@@ -1150,7 +1153,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 
 	/* PrintName + SubstituteName. */
 	rs->SubstituteNameOffset = cpu_to_le16(sizeof(short) * err);
-	rs->SubstituteNameLength = cpu_to_le16(sizeof(short) * err + 8);
+	rs->SubstituteNameLength = cpu_to_le16(sizeof(short) * err + (is_absolute ? 8 : 0));
 	rs->PrintNameLength = rs->SubstituteNameOffset;
 
 	/*
@@ -1158,16 +1161,18 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	 * parse this path.
 	 * 0-absolute path 1- relative path (SYMLINK_FLAG_RELATIVE).
 	 */
-	rs->Flags = 0;
+	rs->Flags = is_absolute ? 0 : SYMLINK_FLAG_RELATIVE;
 
-	memmove(rp_name + err + 4, rp_name, sizeof(short) * err);
+	memmove(rp_name + err + (is_absolute ? 4 : 0), rp_name, sizeof(short) * err);
 
-	/* Decorate SubstituteName. */
-	rp_name += err;
-	rp_name[0] = cpu_to_le16('\\');
-	rp_name[1] = cpu_to_le16('?');
-	rp_name[2] = cpu_to_le16('?');
-	rp_name[3] = cpu_to_le16('\\');
+	if (is_absolute) {
+		/* Decorate SubstituteName. */
+		rp_name += err;
+		rp_name[0] = cpu_to_le16('\\');
+		rp_name[1] = cpu_to_le16('?');
+		rp_name[2] = cpu_to_le16('?');
+		rp_name[3] = cpu_to_le16('\\');
+	}
 
 	return rp;
 out:
-- 
2.49.0

