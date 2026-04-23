Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B23D348E
	for <ntfs3@lists.linux.dev>; Thu, 23 Apr 2026 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927733; cv=none; b=No7rNrgv0gr+5+ajkGwgJV1sr+DK9H7NE/50j+SNx5a1MXY2L9wZHD8PHxl3fgyyfI8ziDvGTt/JVcUBPa6/MjMqGM2J3tinDiWRn2EcJySV9fUat80EA86txWd/npjfxZQDVSId2HIGQnnVT8ovCEogU9kvC4HpHgsenBDp3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927733; c=relaxed/simple;
	bh=NKyRsoHy8+u6GlWkxqR0tmoYRU16SzCWFRaiDfvxP/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j2GIu9BozL4ToY/faQbq5lBjDnSVX1pN8wNNlmFULbEcVip0SZjlk2ElkmQkqAULYnCgSUGMbuI8S7uWEqTSDZPxHV1ce6lQ7AiqX4uwFMOxBUBouQL/Con5hxD/cZ1suYPmu0aPLkkSculvXSS10f+knWcAcP0rUix1Jvn7eZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pkJ6PgbO; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pkJ6PgbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UP
	ZREBmoHaCiqhO8OolVXNN5y0f1XjeBuqwVCXDbkrg=; b=pkJ6PgbOdCCsONPAJ8
	GeV6i5qPQCvaasIQ1nvrMUBTsioxsYQCUc6ztilZgVDZgp4kL+hdHM0NWBqu+inc
	n8PYKPZf2E29smLs+Hts6WxaGv9DEbKdh76pVwb8+uEJVJD5LYtVWPvwlaIyAf60
	FI3JVexxZ6HulxWF9OvRhlZ2E=
Received: from pek-lpg-core5.wrs.com (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnlSbnw+lpIysTBQ--.5955S2;
	Thu, 23 Apr 2026 15:01:59 +0800 (CST)
From: Robert Garcia <rob_garcia@163.com>
To: stable@vger.kernel.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	Robert Garcia <rob_garcia@163.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.15.y] fs/ntfs3: Add more attributes checks in mi_enum_attr()
Date: Thu, 23 Apr 2026 15:01:59 +0800
Message-Id: <20260423070159.3246415-1-rob_garcia@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnlSbnw+lpIysTBQ--.5955S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr17KFWUtFW8JF48tFWUurg_yoWrJw1kpF
	4Yy3y3A3yY9FnFkrsrKF4rZayft34fKFyUGFy2vrnIkF1aqr17Wr98trW0vryfuw4DGFZY
	krs0ka1fAwnrJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMg4S9UUUUU=
X-CM-SenderInfo: 5uresw5dufxti6rwjhhfrp/xtbC5ggAa2npw+gqLAAA3o

From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

[ Upstream commit 013ff63b649475f0ee134e2c8d0c8e65284ede50 ]

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
[ Overflow check deleted to keep context consistent. ]
Signed-off-by: Robert Garcia <rob_garcia@163.com>
---
 fs/ntfs3/record.c | 63 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index cef53583f9a1..7965bea0b2c8 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -193,8 +193,9 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 {
 	const struct MFT_REC *rec = mi->mrec;
 	u32 used = le32_to_cpu(rec->used);
-	u32 t32, off, asize;
+	u32 t32, off, asize, prev_type;
 	u16 t16;
+	u64 data_size, alloc_size, tot_size;
 
 	if (!attr) {
 		u32 total = le32_to_cpu(rec->total);
@@ -213,6 +214,7 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 		if (!is_rec_inuse(rec))
 			return NULL;
 
+		prev_type = 0;
 		attr = Add2Ptr(rec, off);
 	} else {
 		/* Check if input attr inside record. */
@@ -226,6 +228,7 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 			return NULL;
 		}
 
+		prev_type = le32_to_cpu(attr->type);
 		attr = Add2Ptr(attr, asize);
 		off += asize;
 	}
@@ -245,7 +248,11 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 
 	/* 0x100 is last known attribute for now. */
 	t32 = le32_to_cpu(attr->type);
-	if ((t32 & 0xf) || (t32 > 0x100))
+	if (!t32 || (t32 & 0xf) || (t32 > 0x100))
+		return NULL;
+
+	/* attributes in record must be ordered by type */
+	if (t32 < prev_type)
 		return NULL;
 
 	/* Check overflow and boundary. */
@@ -254,16 +261,15 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 
 	/* Check size of attribute. */
 	if (!attr->non_res) {
+		/* Check resident fields. */
 		if (asize < SIZEOF_RESIDENT)
 			return NULL;
 
 		t16 = le16_to_cpu(attr->res.data_off);
-
 		if (t16 > asize)
 			return NULL;
 
-		t32 = le32_to_cpu(attr->res.data_size);
-		if (t16 + t32 > asize)
+		if (t16 + le32_to_cpu(attr->res.data_size) > asize)
 			return NULL;
 
 		if (attr->name_len &&
@@ -274,21 +280,52 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 		return attr;
 	}
 
-	/* Check some nonresident fields. */
-	if (attr->name_len &&
-	    le16_to_cpu(attr->name_off) + sizeof(short) * attr->name_len >
-		    le16_to_cpu(attr->nres.run_off)) {
+	/* Check nonresident fields. */
+	if (attr->non_res != 1)
+		return NULL;
+
+	t16 = le16_to_cpu(attr->nres.run_off);
+	if (t16 > asize)
+		return NULL;
+
+	t32 = sizeof(short) * attr->name_len;
+	if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
+		return NULL;
+
+	/* Check start/end vcn. */
+	if (le64_to_cpu(attr->nres.svcn) > le64_to_cpu(attr->nres.evcn) + 1)
+		return NULL;
+
+	data_size = le64_to_cpu(attr->nres.data_size);
+	if (le64_to_cpu(attr->nres.valid_size) > data_size)
 		return NULL;
-	}
 
-	if (attr->nres.svcn || !is_attr_ext(attr)) {
+	alloc_size = le64_to_cpu(attr->nres.alloc_size);
+	if (data_size > alloc_size)
+		return NULL;
+
+	t32 = mi->sbi->cluster_mask;
+	if (alloc_size & t32)
+		return NULL;
+
+	if (!attr->nres.svcn && is_attr_ext(attr)) {
+		/* First segment of sparse/compressed attribute */
+		if (asize + 8 < SIZEOF_NONRESIDENT_EX)
+			return NULL;
+
+		tot_size = le64_to_cpu(attr->nres.total_size);
+		if (tot_size & t32)
+			return NULL;
+
+		if (tot_size > alloc_size)
+			return NULL;
+	} else {
 		if (asize + 8 < SIZEOF_NONRESIDENT)
 			return NULL;
 
 		if (attr->nres.c_unit)
 			return NULL;
-	} else if (asize + 8 < SIZEOF_NONRESIDENT_EX)
-		return NULL;
+	}
 
 	return attr;
 }
-- 
2.34.1

