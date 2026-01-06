Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CC62FF143
	for <ntfs3@lists.linux.dev>; Tue,  6 Jan 2026 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767681287; cv=none; b=GUECMRHXAJAWdJN5Fhe1TFgRGk+Yk+diplHO0CTQB7BtjHt4XQWpmnM2CpM9fB9aRW6fnPV5M43JOTdKvrFkbXPHJDs3nqCQ6SlX0MKknTM/PNsQh7Y4sNA+U9ky0s1jN95am28lPkQ7Z/h3W9AzVyqbed9K2EE6jVtivq0mc90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767681287; c=relaxed/simple;
	bh=qAujgxuvz22xtId+T8badd5jE4qbkpwtHhq3zMRd1Bw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b7op9L0ZQ2/W0E8+Rza/AP3EYpRXTB9N6B4/pKwbz2V7nTcbuj8emws3HgC7voQGSP41b+/UKSm2iYBiw298vBcIA+O7w+SCVJ5+lGybfM/KxiWGVF6HGM2jZwgrJ9Pzg93QFDbADd8sdCu302mXxTSluQP9d326i4GAOBDB0kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aL8wi/vE; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aL8wi/vE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PT
	Vs61JKD90xPO+mqTN0EEm8SNKLyC2z3JaXMRzrLcU=; b=aL8wi/vET/ZRl2vueW
	/ZKNs+huvpYPywV/oFcBV8u4o/gig36NY/aNRlg5yFDBsC+WEaM6HWevUaj5DxGZ
	clstfKcp9QSwVHEKPuiGHfphXmQxwFcmFdJwcRHqjS2ygByslW6ngFfeFx9tmsfj
	KpoK49o/RqjSuRNzhkQJioE2s=
Received: from liubaolin-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBnRLnzrFxpdSTBEg--.5124S2;
	Tue, 06 Jan 2026 14:34:29 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1] ntfs3: Refactor duplicate kmemdup pattern in do_action()
Date: Tue,  6 Jan 2026 14:34:25 +0800
Message-Id: <20260106063425.155939-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnRLnzrFxpdSTBEg--.5124S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4kGF48AFWUZry7tFWDJwb_yoW5GryfpF
	s3C3Z7J347Xa17Xrs3Xan8u39a93WxtFyUGrW2yw4fAr1Yqwn7Kryrt348WrWkJrykCr4U
	XFn0vF43Wr4xur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDManUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhbZpGlcrPZozAAA3i

From: Baolin Liu <liubaolin@kylinos.cn>

Extract the repeated pattern of duplicating attribute and updating
OpenAttr into a helper function to reduce code duplication and improve
maintainability.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs3/fslog.c | 54 ++++++++++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 38934e6978ec..d9d24e0cb0e3 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3028,6 +3028,26 @@ static struct ATTRIB *attr_create_nonres_log(struct ntfs_sb_info *sbi,
 	return attr;
 }
 
+/*
+ * update_oa_attr - Synchronize OpenAttr's attribute pointer with modified attribute
+ * @oa2: OpenAttr structure in memory that needs to be updated
+ * @attr: Modified attribute from MFT record to duplicate
+ *
+ * Returns true on success, false on allocation failure.
+ */
+static bool update_oa_attr(struct OpenAttr *oa2, struct ATTRIB *attr)
+{
+	void *p2;
+
+	p2 = kmemdup(attr, le32_to_cpu(attr->size), GFP_NOFS);
+	if (p2) {
+		kfree(oa2->attr);
+		oa2->attr = p2;
+		return true;
+	}
+	return false;
+}
+
 /*
  * do_action - Common routine for the Redo and Undo Passes.
  * @rlsn: If it is NULL then undo.
@@ -3251,15 +3271,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			le16_add_cpu(&rec->hard_links, 1);
 
 		oa2 = find_loaded_attr(log, attr, rno_base);
-		if (oa2) {
-			void *p2 = kmemdup(attr, le32_to_cpu(attr->size),
-					   GFP_NOFS);
-			if (p2) {
-				// run_close(oa2->run1);
-				kfree(oa2->attr);
-				oa2->attr = p2;
-			}
-		}
+		if (oa2)
+			update_oa_attr(oa2, attr);
 
 		mi->dirty = true;
 		break;
@@ -3318,16 +3331,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			memmove(Add2Ptr(attr, aoff), data, dlen);
 
 		oa2 = find_loaded_attr(log, attr, rno_base);
-		if (oa2) {
-			void *p2 = kmemdup(attr, le32_to_cpu(attr->size),
-					   GFP_NOFS);
-			if (p2) {
-				// run_close(&oa2->run0);
-				oa2->run1 = &oa2->run0;
-				kfree(oa2->attr);
-				oa2->attr = p2;
-			}
-		}
+		if (oa2 && update_oa_attr(oa2, attr))
+			oa2->run1 = &oa2->run0;
 
 		mi->dirty = true;
 		break;
@@ -3377,14 +3382,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			attr->nres.total_size = new_sz->total_size;
 
 		oa2 = find_loaded_attr(log, attr, rno_base);
-		if (oa2) {
-			void *p2 = kmemdup(attr, le32_to_cpu(attr->size),
-					   GFP_NOFS);
-			if (p2) {
-				kfree(oa2->attr);
-				oa2->attr = p2;
-			}
-		}
+		if (oa2)
+			update_oa_attr(oa2, attr);
+
 		mi->dirty = true;
 		break;
 
-- 
2.39.2

