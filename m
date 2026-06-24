Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5FD2D7817
	for <ntfs3@lists.linux.dev>; Wed, 24 Jun 2026 05:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782279039; cv=none; b=cCeIPavigdn2B/jNPpGj/oU++MALR+SQVOwX1lLQEK3ENOvoVH2dA8c6TrmfaD536ktk5jEo7tKwV8SNzBrxVZSXzi7f3aCqnFshiitR+MJQg6ljD0Cd351/rBthJbW/acTQu1njS2nYGZ48uI1pN3M7w+5sqacImhd2Dad2RXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782279039; c=relaxed/simple;
	bh=dk0XxkrLjtALzoDNsREW/qOkeILIQNPDtoRmyL9xg3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VF5m0ilgnmbzUqu7QaSDmtYwqU/ZINPmvoFwQvoO9IFBttN3d93jWiag3Nl9biI3CgocDTI5z5DUKOCBu5ogcDacaKUW0o6TkUMHIo0IQ38dsjD6Pra6W2ZtxWGI176LrE5MT/D9wdMkVmvfMxaWz5R3eVRtcFQyzHxgUPrZQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkgHmcui; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkgHmcui"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so1460151eec.0
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 22:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782279037; x=1782883837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TjkcLXg0rwtGN17+u2KHe583WR1FN3pVx+3GcfqmU+c=;
        b=kkgHmcuiZdqOTUL9BBtb0WFy1mhtLGIPgBGnVOof0Enq6e60gwopsNfgUO0fBnmDuC
         stLC1eE+NLjvVjyLTny0l8K+lekWnjoFGoHWZg/cRfshfWTowTw50Ln9FuBXYivT5KLt
         E5e4ZoRVmssaAGrmbzIK1gFxtIcLalK6/tqLE5WiIh06/SwYbx6VRjUUjWTYdHd+aDAq
         bfv4HBgrqFGkYaXtHhWrwYWUO4tFRNyssnWC5H0DUSg54WKLigSTbO+OwCpvwnCvxRLd
         AFgrzCo+wPxmPFqps8l4Ph2+G5ugIHlZ6IyXR8M2oh/bAMRt6YoPX6nU5u9SOXZ3+c7l
         3qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782279037; x=1782883837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjkcLXg0rwtGN17+u2KHe583WR1FN3pVx+3GcfqmU+c=;
        b=QOpezBzYc37odqkl05bs6S4JYkSsG9gtIXBgiCiXrDgwnGniXof3mEac1Ls9d7zot8
         TBV5mzR2eHWgsTD0QlLQPIHYGdYkhLlgv3WHjPA7KKLvsdSSpbNYPHQgCEeUhgDFJmvc
         /7PAlM8FsCjuo8pEJ9ca5RWgTXlkOc0xSatE4hKgtPPmGBUiI+NFWo6QRe4ckakqhAbJ
         PGjVk0BjT9v9cSv33E4+vNUu2iRNpUvVdDmH/eo/m7n8Fx8nk2E9zgcDFlwgTt0aPpTM
         Y1SueuFixckPQ5MaxM5AKeanPdc3uepLEH9M6N+8G0grvQ1YUVldnH4saGVhesgcxeiC
         +LFA==
X-Gm-Message-State: AOJu0YylkRsmw3izdQwXFz5NpHuTeKGOviaUXG5MeyOPPOzxRR0fd7h1
	oOs0OFeVGNQXdEOIaGm8cPWMlqmskK4Rs6yiwJ8bn0esj9za6JNfffL1c+/lTKvJ
X-Gm-Gg: AfdE7clZkzIyEWMOjGZVEc9eRnWDhWYQjxJNaZPoIvDae0olOIQW5gylQrlufK8Wfxe
	3U6cdElgV/ARwxx6/X38p4zTeOMfS6bguUBiCiC8vnlzBNnCoGzrC9NXF3EDN2SG2aXroIF8LH5
	4StOwFGnS6R+/G0tjZNQMCv51XX3tAddIcPcFQ1GG0XUsw4RnmCznEfGCZeUvAC8vN7GPKTd1iY
	finPKMnkEBVZgP3w085nKY73k++stvKsUgMrO0q88u+3DcV0DzZ4GTuYxHBrOLi3diysUznaDBR
	SJYlmWy96CNtz7MQiqWoA6stnjUG5/u0T3fBVoNerBkXkKIIJSfBqif9iQYZ0sIj4PvSjnK+YIN
	7N5fd3/KyneQiEIjpgUi6cdfIkyf79gQNzIUU1CmCH+vDaIHzvhJSyKSfD0ilAhjCacKHho6ZKY
	W53LYK0t2lPqILI1ww2oaY9y7p1Lg6pr+QwycdkR2QUGeabfr5ww==
X-Received: by 2002:a05:7300:80c9:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30c589f4162mr6212284eec.4.1782279037437;
        Tue, 23 Jun 2026 22:30:37 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d6edsm20944120eec.14.2026.06.23.22.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:30:36 -0700 (PDT)
From: Xiang Mei <bestswngs@gmail.com>
X-Google-Original-From: Xiang Mei <xmei5@asu.edu>
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] fs/ntfs3: fix out-of-bounds write in ni_create_attr_list()
Date: Tue, 23 Jun 2026 22:30:09 -0700
Message-ID: <20260624053008.4885-2-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weiming Shi <bestswngs@gmail.com>

ni_create_attr_list() allocates the attribute-list buffer with a fixed
size of al_aligned(record_size) and then fills it in a loop with one
ATTR_LIST_ENTRY per attribute in the base record, without checking the
buffer bound:

	le = kzalloc(al_aligned(rs), GFP_NOFS);
	...
	for (; (attr = mi_enum_attr(ni, &ni->mi, attr)); le = Add2Ptr(le, sz)) {
		sz = le_size(attr->name_len);
		le->type = attr->type;		/* OOB write */

A minimal resident attribute is SIZEOF_RESIDENT (0x18) bytes in the
record but le_size(0) is 0x20 bytes in the list, so every attribute
costs 8 more bytes in the list than in the record. A base record from a
crafted volume, packed with many small attributes, makes the list
outgrow the buffer and the loop writes past it.

Bail out with -EINVAL before writing an entry that would cross the
buffer end.

  BUG: KASAN: slab-out-of-bounds in ni_create_attr_list (fs/ntfs3/frecord.c:788)
  Write of size 4 at addr ffff88802b333c00 by task exploit/5015
   ni_create_attr_list (fs/ntfs3/frecord.c:788)
   ni_ins_attr_ext (fs/ntfs3/frecord.c:928)
   ni_insert_attr (fs/ntfs3/frecord.c:1095)
   ni_insert_resident (fs/ntfs3/frecord.c:1479)
   ntfs_set_ea (fs/ntfs3/xattr.c:449)
   ntfs_setxattr (fs/ntfs3/xattr.c:973)
   vfs_setxattr (fs/xattr.c:339)
   __x64_sys_setxattr
   do_syscall_64
  The buggy address is located 0 bytes to the right of
   allocated 1024-byte region in cache kmalloc-1k.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/frecord.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 2b49bc077558..f77b729c24d0 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -755,7 +755,7 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	u32 lsize;
 	struct ATTRIB *attr;
 	struct ATTRIB *arr_move[7];
-	struct ATTR_LIST_ENTRY *le, *le_b[7];
+	struct ATTR_LIST_ENTRY *le, *le_b[7], *le_end;
 	struct MFT_REC *rec;
 	bool is_mft;
 	CLST rno = 0;
@@ -775,6 +775,8 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	if (!le)
 		return -ENOMEM;
 
+	le_end = Add2Ptr(le, al_aligned(rs));
+
 	mi_get_ref(&ni->mi, &le->ref);
 	ni->attr_list.le = le;
 
@@ -785,6 +787,13 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 
 	for (; (attr = mi_enum_attr(ni, &ni->mi, attr)); le = Add2Ptr(le, sz)) {
 		sz = le_size(attr->name_len);
+
+		/* A corrupted record can pack more attributes than fit. */
+		if (Add2Ptr(le, sz) > (void *)le_end) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		le->type = attr->type;
 		le->size = cpu_to_le16(sz);
 		le->name_len = attr->name_len;
-- 
2.43.0

