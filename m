Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC093D6D
	for <ntfs3@lists.linux.dev>; Tue,  2 Jul 2024 02:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719886647; cv=none; b=P7VLQLRPRsGpgDOunLfw+faITQYz8N32namjnIAVxpi2TwaGoctTScva934ZLZ8xSRiA1XqOJ03Mu5Gwxh3ni1qpFUm2wfPGdg74S1tvw7l2JNoK0pCTxySeNbkDEkVUlZTghdq1rP0cjr33MvUpR5vAcc6ReLsAzIcPzGSs7lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719886647; c=relaxed/simple;
	bh=Wm5C7PbSQuO8VhEkMNkj3rJmPHjFxDzTuZ6+0W1/xbU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=h0Pe/Bm53y2tYywOV9h71Ho4EGeLNe2nRaLVEPKhzBlQB3S4Y09jqKv0YR9rjwKhxqziRPH3oRVdxrpZtIfw8pzngqSliAhjtkbfGKVeMStu7LeZLKEQEvolPmM2WYiNpDMPyRNF0yDwdjgpbgvbhnqzpmERByDn2bOx/4wrFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edpFh4DO; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edpFh4DO"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-700cd2cba7bso2647020a34.0
        for <ntfs3@lists.linux.dev>; Mon, 01 Jul 2024 19:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719886645; x=1720491445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPz+Gzf97w+72AJwgwVz2d81E81AlmMsl3v/aVo7sR0=;
        b=edpFh4DOGgQYzynDx7xz2ywdL3StSBKhyiHNDkEpSVxB4aLdLctP8sj8BeuSiDmkh2
         djr6aUn2K2KrLXHYvRjbW9YBW+oVNGkFNn4tAxKpgjFVzCx+rgi97z9YKHNidtf45VLi
         C0Dslji6K4bxc4IcTpWDetdbjKAuNsRq8pnmMJTsJM4qmPVRJ98eNgxo7uz/it/dzuRh
         QATbzLWHpp9kcxPmQ1VrNFf5aO7Gv1SsKuR4+CzAACEZr3c85Glwidos5vECsQ7Cz+lg
         CdnnAfu7hCbpQkmwmsNfyydsoxRYtIhAmHXyh7RhtztroQEzhleXle+1US+LBTGhd3vA
         j/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719886645; x=1720491445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPz+Gzf97w+72AJwgwVz2d81E81AlmMsl3v/aVo7sR0=;
        b=V8MCb6MWOehRyJaIVJ/6tv/VVBHzK+CsRAqAlF96a5UqQd2akz5t2bL0sZl1ib0dj4
         DrwV5+gfI9VYdwLfFwZ6Fw+r8XqV7NwMI0SsNqpZq6nJjeA7/xhXcdXieKEF4mnuN91g
         AwNedQP+JpSKb+IN4sI35C8G2nhyPNJ0T13bfYm/7AyY3dZkxKf0AMT5vR20othL5jB9
         U42dDW4q4IWoHhZuKdQ+faUzN0TRhomlvyLKnlx9EccQDkrub2SabGuATFfe/XEgZA/f
         aUQOSxoffu7QylEg/SjrBOBRv/cxq9ytP8oa/RJJiTcDT7AE5U1Lv2I8yHClXL/NbSue
         KgCA==
X-Forwarded-Encrypted: i=1; AJvYcCVOiWbkYPHv5ddXQM3EOTQ+5b8FPiGzdeb1CbwGOs6Z/xdxjvxjqZRQOPLgKptodLmc0Qt3pJiayLhOjgO4xg2X7Rw7h+Q=
X-Gm-Message-State: AOJu0Yy76TCd26aYsMqCfVRZgSnxcKV9GWXx/ItU8AJI5nIvfRcsAE8t
	4QKGbfCI8YQdtxR+QNrRamprFGr83oWkaJeGpljmpFgTq7ctD+Uy
X-Google-Smtp-Source: AGHT+IHw59Ps3qtETJtp4dJSPoGsbLUNePLwsrnv+f981GhEIe33uUBZslicno6rogZbQQFSSQZXVQ==
X-Received: by 2002:a9d:77d0:0:b0:701:f0ad:232e with SMTP id 46e09a7af769-7020768d1admr9793315a34.30.1719886645194;
        Mon, 01 Jul 2024 19:17:25 -0700 (PDT)
Received: from localhost.localdomain ([47.238.252.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804989f5asm7270282b3a.195.2024.07.01.19.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 19:17:24 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Subject: [PATCH] ntfs3: Add bounds checking to enum_rstbl()
Date: Tue,  2 Jul 2024 10:16:59 +0800
Message-Id: <20240702021659.6583-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added bounds checking to make sure rsize is not less than the entry
size and make sure the remaining bytes are large enough to hold an
entry before accessing in the caller.

Signed-off-by: lei lu <llfamsec@gmail.com>
---
 fs/ntfs3/fslog.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 855519713bf7..75d31bc11567 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -609,12 +609,15 @@ static inline void add_client(struct CLIENT_REC *ca, u16 index, __le16 *head)
 	*head = cpu_to_le16(index);
 }
 
-static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
+static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c, u16 esize)
 {
 	__le32 *e;
 	u32 bprt;
 	u16 rsize = t ? le16_to_cpu(t->size) : 0;
 
+	if (rsize < esize)
+		return NULL;
+
 	if (!c) {
 		if (!t || !t->total)
 			return NULL;
@@ -626,6 +629,8 @@ static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
 	/* Loop until we hit the first one allocated, or the end of the list. */
 	for (bprt = bytes_per_rt(t); PtrOffset(t, e) < bprt;
 	     e = Add2Ptr(e, rsize)) {
+		if (PtrOffset(t, Add2Ptr(e, esize)) > bprt)
+			return NULL;
 		if (*e == RESTART_ENTRY_ALLOCATED_LE)
 			return e;
 	}
@@ -641,7 +646,7 @@ static inline struct DIR_PAGE_ENTRY *find_dp(struct RESTART_TABLE *dptbl,
 	__le32 ta = cpu_to_le32(target_attr);
 	struct DIR_PAGE_ENTRY *dp = NULL;
 
-	while ((dp = enum_rstbl(dptbl, dp))) {
+	while ((dp = enum_rstbl(dptbl, dp, sizeof(*dp)))) {
 		u64 dp_vcn = le64_to_cpu(dp->vcn);
 
 		if (dp->target_attr == ta && vcn >= dp_vcn &&
@@ -2950,7 +2955,7 @@ static struct OpenAttr *find_loaded_attr(struct ntfs_log *log,
 {
 	struct OPEN_ATTR_ENRTY *oe = NULL;
 
-	while ((oe = enum_rstbl(log->open_attr_tbl, oe))) {
+	while ((oe = enum_rstbl(log->open_attr_tbl, oe, sizeof(*oe)))) {
 		struct OpenAttr *op_attr;
 
 		if (ino_get(&oe->ref) != rno)
@@ -4182,7 +4187,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		goto end_conv_1;
 
 	dp = NULL;
-	while ((dp = enum_rstbl(dptbl, dp))) {
+	while ((dp = enum_rstbl(dptbl, dp, sizeof(*dp)))) {
 		struct DIR_PAGE_ENTRY_32 *dp0 = (struct DIR_PAGE_ENTRY_32 *)dp;
 		// NOTE: Danger. Check for of boundary.
 		memmove(&dp->vcn, &dp0->vcn_low,
@@ -4202,10 +4207,10 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		goto trace_dp_table;
 
 	dp = NULL;
-	while ((dp = enum_rstbl(dptbl, dp))) {
+	while ((dp = enum_rstbl(dptbl, dp, sizeof(*dp)))) {
 		struct DIR_PAGE_ENTRY *next = dp;
 
-		while ((next = enum_rstbl(dptbl, next))) {
+		while ((next = enum_rstbl(dptbl, next, sizeof(*next)))) {
 			if (next->target_attr == dp->target_attr &&
 			    next->vcn == dp->vcn) {
 				if (le64_to_cpu(next->oldest_lsn) <
@@ -4290,7 +4295,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 
 	/* Clear all of the Attr pointers. */
 	oe = NULL;
-	while ((oe = enum_rstbl(oatbl, oe))) {
+	while ((oe = enum_rstbl(oatbl, oe, sizeof(*oe)))) {
 		if (!rst->major_ver) {
 			struct OPEN_ATTR_ENRTY_32 oe0;
 
@@ -4507,7 +4512,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 			u64 lcn_e = lcn0 + le64_to_cpu(r->len) - 1;
 
 			dp = NULL;
-			while ((dp = enum_rstbl(dptbl, dp))) {
+			while ((dp = enum_rstbl(dptbl, dp, sizeof(*dp)))) {
 				u32 j;
 
 				t32 = le32_to_cpu(dp->lcns_follow);
@@ -4640,14 +4645,14 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	 * the lowest lsn, and return it as the Redo lsn.
 	 */
 	dp = NULL;
-	while ((dp = enum_rstbl(dptbl, dp))) {
+	while ((dp = enum_rstbl(dptbl, dp, sizeof(*dp)))) {
 		t64 = le64_to_cpu(dp->oldest_lsn);
 		if (t64 && t64 < rlsn)
 			rlsn = t64;
 	}
 
 	tr = NULL;
-	while ((tr = enum_rstbl(trtbl, tr))) {
+	while ((tr = enum_rstbl(trtbl, tr, sizeof(*tr)))) {
 		t64 = le64_to_cpu(tr->first_lsn);
 		if (t64 && t64 < rlsn)
 			rlsn = t64;
@@ -4668,7 +4673,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	oe = NULL;
 next_open_attribute:
 
-	oe = enum_rstbl(oatbl, oe);
+	oe = enum_rstbl(oatbl, oe, sizeof(*oe));
 	if (!oe) {
 		err = 0;
 		dp = NULL;
@@ -4770,7 +4775,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	 * Mapping that we have, and insert it into the appropriate run.
 	 */
 next_dirty_page:
-	dp = enum_rstbl(dptbl, dp);
+	dp = enum_rstbl(dptbl, dp, sizeof(*dp));
 	if (!dp)
 		goto do_redo_1;
 
@@ -4968,7 +4973,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	/* Scan Transaction Table. */
 	tr = NULL;
 transaction_table_next:
-	tr = enum_rstbl(trtbl, tr);
+	tr = enum_rstbl(trtbl, tr, sizeof(*tr));
 	if (!tr)
 		goto undo_action_done;
 
@@ -5142,7 +5147,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	 * the open attributes.
 	 */
 	oe = NULL;
-	while ((oe = enum_rstbl(oatbl, oe))) {
+	while ((oe = enum_rstbl(oatbl, oe, sizeof(*oe)))) {
 		rno = ino_get(&oe->ref);
 
 		if (oe->is_attr_name == 1) {
-- 
2.34.1

