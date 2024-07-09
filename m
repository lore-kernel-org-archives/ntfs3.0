Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC744A0C
	for <ntfs3@lists.linux.dev>; Tue,  9 Jul 2024 03:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720496928; cv=none; b=uaOTt8PcUkNz/GIdJkwZaOd6kS+RD3t8+NtAJ9aYzWBrl/gIMamCr2HoKqkUlacSmQH/4ebFdGGHVH7k2vlWSfG2AbiuTOC8BgM9mDZRHi6tuaxjV8kq0T7zfJKn/W4eLh9d/JgdczMiLYFYojG7J623Y7A6cb2FZsH38+DtJCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720496928; c=relaxed/simple;
	bh=cWt6mbyeKyb77mm5oo0KqoZqJPnC+zGtCP5fU0FJmLI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=mU2iZ7Ygk+LwOgvqRfTM6S2Qqf8HeQ4ZCAKBJassaDPw9jxGW2Wlpl2N5GQKE2XVmIP5Dy9BgiDDA4fljchHsrzScgKECw1ViW2fGyfM5MgrOeJ6PgEC1MVF509uHYuFJdtnBwvvBOqguVjJQwV+ntap1uFhfIdXlLyuxvyyXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cusGNPwm; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cusGNPwm"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70b0e7f6f6fso2926382b3a.2
        for <ntfs3@lists.linux.dev>; Mon, 08 Jul 2024 20:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720496926; x=1721101726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4nuhw0dzIY+RGcpPm4Tcq/GARokJZxpEvw3YbUQkqg=;
        b=cusGNPwmo1EPDMJnYHcx6QlkwFlwvwO5o3wtc13wh3q2lxVyvegy1jCeDVT50+sXja
         VLz7ww51ouykMEcGfdcaffl+h4hre/6qkh2zBVkEKvzPsIqY3hzVcvwddLc5z/MKqv3R
         aft5hhjifFB0errdLmb1uZ/S4FXEuHSSyyrwmco+089yiVHccCyGazvROulPDmSi1Fc7
         DcqmA8LF/vW6kzS0iXiMnyHJMadywD6/cuLIaSM0Fg57ZbEkmnh7ADq5sfQp/eepgaXg
         3uMwq2UXcLUTms0fRVGLSC9KGF9gk0/hEptf2DnVpcKJp1ZNPGt7jIP4gFv9c7+wv1dE
         FfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720496926; x=1721101726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4nuhw0dzIY+RGcpPm4Tcq/GARokJZxpEvw3YbUQkqg=;
        b=cvFf08sX1lEGUmUqBjF7rg9XqWo/9DhhMIEo01tVLXjDmsJeekbfYk2BI6qz8QBeL0
         RZ+o1fpgK0pWtIQp63K7HGt11VVVnAz+w1/yP+1vjoraiGTJMEUbB98WopWkF/oVNLCn
         s6CC9YsNtFxibmd/+LUdxbmXC05JRs/uanqeXfAjYUDER4HgkKsnXdr2j4d8SP+xKEeP
         udAD62leRRq4YCzNMZtXV8NKoP9rXRJZ3zehfsKLT4RpxA6fdWp4aZhlysu8vkw8JTie
         glmFKbVHEbAbc872oc75/Peh/8no2/kvjl+dq6bvkUyeeIsde+sMD4GgZoWoSQJFn6lj
         hDlg==
X-Forwarded-Encrypted: i=1; AJvYcCVBk2GC8iGTxICHMvQISqXNSgZkdXsUf2kKrKaqe0dwoMPaRfs0rOVMhFKlW9eeDEAaH29GYstpiGVrEQvctGhbxjXD7oU=
X-Gm-Message-State: AOJu0YwdRrVqfb8Q25/+i0vnPB7ZY1MyuxaFcI97WZJOTfwj9zEEyOP7
	Q3byNXB8UtctnaH1OlIN3iUr5q24ZLn0xduUN3Vi+GnQeW0XasPgKQ3Gs9FDddA=
X-Google-Smtp-Source: AGHT+IF9IKzYpRLdtdc0Ofid/VoG1sQf72mFPjtHzX4SHiV2lNManO3O3uFJVvusFY3RAr580L64Yw==
X-Received: by 2002:a05:6a00:4fc6:b0:704:2563:5079 with SMTP id d2e1a72fcca58-70b435e978amr1898825b3a.27.1720496926237;
        Mon, 08 Jul 2024 20:48:46 -0700 (PDT)
Received: from localhost.localdomain ([47.238.252.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439ab788sm671950b3a.167.2024.07.08.20.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 20:48:45 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Subject: [PATCH v2] ntfs3: Add bounds checking to enum_rstbl()
Date: Tue,  9 Jul 2024 11:48:23 +0800
Message-Id: <20240709034823.176357-1-llfamsec@gmail.com>
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
index 855519713bf7..5bdb31ffab3a 100644
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

