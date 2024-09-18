Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46361AD3F8
	for <ntfs3@lists.linux.dev>; Wed, 18 Sep 2024 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726679864; cv=none; b=ELNlCII4s5AkH3LrizAXsTE3wisXbcXleUA3x1n+49IfVZ79tuE2H0sBwb1qKSVQq0B/zKvjg5elaoonMoGWAYSkex5YMPuhkH67TzIcGOA19C/Pn/NBGu4+nh+xECHM77+aIOWnGE6tpfKaQM4QxuyJ+PEblgwyI+3KSMhKe2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726679864; c=relaxed/simple;
	bh=4e6R9wY2hW6X7O7T+qI/m2pY4ab1yzYVL/5jv/HyHRk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=smhXypgVyd/xQ03Ow3bOaCyRuUxdL3kU/rUaN6gIOvbl7W2YxzU8HTHeRw7ftCOto7gO6jdEpp2yBOoSJLaDhgn/0MKmYqvOtKEE1uHLJ64PMlNtzzwx95tW0zort3UDaJ38nwl6xBFPoRkuriAFMkFgBvxKlvLp3t+sFsOg6yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsktnnXs; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsktnnXs"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so5232333a12.3
        for <ntfs3@lists.linux.dev>; Wed, 18 Sep 2024 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726679862; x=1727284662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sxks8HvVUS3cawfHOPgFaShIwCThkulVA+f9kPxgXiI=;
        b=UsktnnXsCaoKqCKUmnAivVkBGEWT/A/aWmrDmfQDjrz2AQf/+Z0l8SnGW6kFf9J4D2
         3Y/5ZqxKbw3paNs/AqXLvtfym08i2+4PaCLQ0z13ogc3pAODaG/6lImpU6jj8QasQUpA
         a8xPKbiBSEcgX9uHaUtMkSDXQrsskNAGhLkLfN1sSCjVOFAYRSu/Eq6nK9eskwhY6bYb
         OF8DXB+7rpxxzGbse2qbbScwmdAZ3sFbKkzvn/ULDlcztf3rrUMKizHtSr4U/xIQEVqn
         MCo2svafp4PYpAA4ES9IZKvyn066/IPI7ZJ8S7SqD70kzl12stDr0dyaOnTF/vBbqvf2
         cCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726679862; x=1727284662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sxks8HvVUS3cawfHOPgFaShIwCThkulVA+f9kPxgXiI=;
        b=LDashzSofsWYSRsL6SJBMWIqxXvjWyBnGPkSO+j/b6YDEPQ9BGjhIGVdJ+bCj49tTj
         vGcemHzF0DGtHcUWO5aY3fnQbE+B0qxfFW7V/aenTaWHnenTekWsAoIV1sFPiPuyl29H
         8sGPQQ2a8KLWeuVptmy0sJYyasPFuIW7Z5IChHNYadwIB8nrCwmFMMnV4GH/T4mSPxbG
         f236UFrXZ2iu7Z8GMQw2sHDhmeuz5SYa+udIkG1MI0w1QJY6U/i5K43AjsWk8sb/f1rU
         lz9o7GPyDVkWnw/i3c0pzC9gfQ4AcDTHh8Qq9AtFfjmEXKoeCvZTpkNEShDcnIO4nfmR
         Fg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6CXmYWCIkb4IW2vnKeTsthmJnWLAPiC5GYJkdmlJXqBe3payXbJPFq73qujPV0fjaYYNqhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxvibWbDyiDvrqx0P890E8qeeepDhvyOgyOwqY+JskIWgW5NOz
	6MRUWggBLoJWOuqL/vnCJ9LNnZCfRhIbj4fIZ/NzBeG/MI8EIKfA
X-Google-Smtp-Source: AGHT+IFsBPdm7BLJoW/TZm9sWCHJAPvaz/5KEqlVpNgCpcczSIt5FIgfBZDMeuV62O+4UwlSaTwshw==
X-Received: by 2002:a05:6a21:3a84:b0:1cf:3d14:6921 with SMTP id adf61e73a8af0-1cf7624b3e0mr36904990637.35.1726679861755;
        Wed, 18 Sep 2024 10:17:41 -0700 (PDT)
Received: from localhost.localdomain ([47.76.200.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc2bd3sm6975744b3a.200.2024.09.18.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 10:17:41 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Subject: [PATCH v2] ntfs3: Add bounds checking to enum_rstbl()
Date: Thu, 19 Sep 2024 01:17:20 +0800
Message-Id: <20240918171720.555304-1-llfamsec@gmail.com>
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
 fs/ntfs3/fslog.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 855519713bf7..8a70af93e2ce 100644
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
+	while ((dp = enum_rstbl(dptbl, dp, sizeof(struct DIR_PAGE_ENTRY_32)))) {
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
@@ -4290,11 +4295,11 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 
 	/* Clear all of the Attr pointers. */
 	oe = NULL;
-	while ((oe = enum_rstbl(oatbl, oe))) {
-		if (!rst->major_ver) {
+	if (!rst->major_ver) {
+		while ((oe = enum_rstbl(oatbl, oe, sizeof(struct OPEN_ATTR_ENRTY_32)))) {
 			struct OPEN_ATTR_ENRTY_32 oe0;
 
-			/* Really 'oe' points to OPEN_ATTR_ENRTY_32. */
+			/* Really 'oe' points to OPEN_ATTR_ENTRY_32. */
 			memcpy(&oe0, oe, SIZEOF_OPENATTRIBUTEENTRY0);
 
 			oe->bytes_per_index = oe0.bytes_per_index;
@@ -4304,7 +4309,8 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 			oe->ref = oe0.ref;
 			oe->open_record_lsn = oe0.open_record_lsn;
 		}
-
+	}
+	while ((oe = enum_rstbl(oatbl, oe, sizeof(*oe)))) {
 		oe->is_attr_name = 0;
 		oe->ptr = NULL;
 	}
@@ -4507,7 +4513,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 			u64 lcn_e = lcn0 + le64_to_cpu(r->len) - 1;
 
 			dp = NULL;
-			while ((dp = enum_rstbl(dptbl, dp))) {
+			while ((dp = enum_rstbl(dptbl, dp, sizeof(*dp)))) {
 				u32 j;
 
 				t32 = le32_to_cpu(dp->lcns_follow);
@@ -4640,14 +4646,14 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
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
@@ -4668,7 +4674,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	oe = NULL;
 next_open_attribute:
 
-	oe = enum_rstbl(oatbl, oe);
+	oe = enum_rstbl(oatbl, oe, sizeof(*oe));
 	if (!oe) {
 		err = 0;
 		dp = NULL;
@@ -4770,7 +4776,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	 * Mapping that we have, and insert it into the appropriate run.
 	 */
 next_dirty_page:
-	dp = enum_rstbl(dptbl, dp);
+	dp = enum_rstbl(dptbl, dp, sizeof(*dp));
 	if (!dp)
 		goto do_redo_1;
 
@@ -4968,7 +4974,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	/* Scan Transaction Table. */
 	tr = NULL;
 transaction_table_next:
-	tr = enum_rstbl(trtbl, tr);
+	tr = enum_rstbl(trtbl, tr, sizeof(*tr));
 	if (!tr)
 		goto undo_action_done;
 
@@ -5142,7 +5148,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	 * the open attributes.
 	 */
 	oe = NULL;
-	while ((oe = enum_rstbl(oatbl, oe))) {
+	while ((oe = enum_rstbl(oatbl, oe, sizeof(*oe)))) {
 		rno = ino_get(&oe->ref);
 
 		if (oe->is_attr_name == 1) {
-- 
2.34.1

