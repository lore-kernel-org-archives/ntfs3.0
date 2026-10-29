Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306130;
	b=jqIkYzQfRMo7Y++AOCcEciqm3Mw8UpyTnuT/30Re+8VteR88fr+n9L0fzOXd1jb3dEZ3
	 K5mx3n43LRjlqALFLYyeksJb3SF3rtUtuyoljHc3aogJA3ZnAo8h+jTeV53/JwskutDGx
	 1S0q9BJuKwKTgCRgT/2RsECsK6QjNepN2ONSMagvX/hjP7C/g6o7PJoWTxWbKvr1NSw7j
	 1LF8HGnOzjuB0TBMBOt+qUAc5wAygf4A7hwhkZoY3g2Yoec9LTJUoH6YoBXCobxeVbWRy
	 QpurJHJDLzschw0NFnHkV/vjbS/3RaS/dCFIJmM9B6kvRMKUHCCKbBt5/Hu0EFhftKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QcJgrIbiHATKK/40hSI/RITxVRqGHCvmwYIWBjFMRA4=;
	b=VlkaKZPSDApEV/hyScWyy7UK1J3RRh8Yx2NVy/EXwRSW81NcH2hz45CjQoV+XDAQkKzD
	 3cubS2zlHwDYQENXWNeHvHB7FeAu6SGuffCeu/dbsZENYRtjmYm9RRZaoxUMfJB9KjZxq
	 11Cl/1iO7kifF2Bp2/9TIcpkC/vat9DVRzGmfPz1LwURA7BSFTf3DxCIEdaKrEplHB+m1
	 tKXWDsCoOkGQe4O/kfMV60sV7tPlqr4D+ZpSJvi0RCkhBt4MLXa1LUKZz86aIJURPfAE9
	 44n8AeocrMDqF2kCdVlwpsDGVdjeVaJIBjwYm2FfKxvmPWjBKu7JPB23HRxGw6GeySA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rO9r3yhK;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34960A2615
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 20:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB34960A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rO9r3yhK
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so37014eec.0
        for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793306129; x=1793910929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QcJgrIbiHATKK/40hSI/RITxVRqGHCvmwYIWBjFMRA4=;
        b=rO9r3yhKvxXHfLKwWJslWyRdKgrfMbHR1xWOGe5FVLQNTQIjIkr++wah9ECfHsPQgr
         JuQURHyiw9KwoJaozXVQRykup2b451E+r50HInq7tn4GIq46p6HhPQ3NzWZHhf5FJKKw
         iFc0EkvApzXprQU+Cggf7SAH8MEQVEBGPQPwyTx5vRNcdzElHAPUh4L77lKJ84nGVaEP
         mhRVWCNUCiGEroTouQRtlmpMaNoQm01SognO1Xn1m1AafXmqWxQgZcoInK6gZoIMX8xL
         QrGTIPOoRyQlZcKT+JPyDEkLUkJY5LD1wq8cY1QwSgx/l21pJc05o+CxE9M+l6RK19kT
         As7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306129; x=1793910929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcJgrIbiHATKK/40hSI/RITxVRqGHCvmwYIWBjFMRA4=;
        b=rGygvs7GkCq5bH4TRlJX4oGCSD/FzV3QR4KIYfIkESye2hoQu4dg7UPx9UNV3M8Pav
         pwDVzSJjbjSnwBo/YJvJoSSzQ3OnpOEhiNg1Lb96v/3b+G3mNqMz3rTFJAS7tJ5vK0iq
         OUgDV677VOSElM9W8UL29UOKD60vgwqAg0mjLfBRcOsjIL/0UUy6BytSkqYTw98pzgeh
         He0dcb4Gj0cryt4t0p7RNSjHIlNwK+YX6IcTP0bzuYfh2u1fBhW4BMYsUbJJeJhyM3tP
         u6XstpgWHM8OJlbcJAa1T8w1F4vMgsq00eOijtnErcbjSue6Z7gxJfI3aTaEtP/aVnCb
         cTYw==
X-Gm-Message-State: AFq9FYKu1xoLiL5By4qx//+hsPW+MNfBuukgj15KUzPT3H8YEPRsCHGQ
	YG5j/0BS+yLQzr5W0A4APkwkrh2KnTNibkGbhf61s37lhBa5jlFdC6fr
X-Gm-Gg: AYBFou3DDAFrswl7tn6XSe61WYoDx931Bx8bYmjFWd6rm2ICj6+XxIg6/1SNuwYF/TQ
	0o9CtVlHK52MeVhcwFOk3kmvCTBZgoNzUjOGMwHPvVLiBxnwYBLlWplHxX37AP+o/bYOTatdvi7
	MvUa8p5MdF+sQlgfU3FGhYvycDOOwEGbb+UoypT2a3GrVo8D1kb0SWs17MVj0fQvKdHOHwgGweJ
	8UqY2vk7BgYEvnGvvS4mlx9oFL3lGKeoHi4XPTswP208TexUsapHHz7Ghxn8hvWzXms0rN1rBEj
	DM5kk+zz5oh8fJmJfpfribv3Rbbx/KPVGjuORiksHxJZWDf42MvLpf/sioxbhoLiUXMtYMV52m6
	Z5VBL2lFa4Jl54domI6i4rNY5fEJJ7zssEf9S1onZBKDIPAe4W/3XVdRlHen3qTXg8CGr7uw8Va
	gJyxgpnPs4pF4cQ2715FbM2Rcnjo/F3OKDnBBCkBPhJa9MYw5XE2yWMU9HBgXmkMQ5FP3xjPOD7
	NYTBXOMsLsh7gnv25+AAlEsH3qGPFGCglzGwA7I5SQvSzyA1WOg1HLVuEdD6gRfWLQJj84ao0Mz
	QTo6Vt2aaj+INfHA7CNQhtJBtGjcgotAvptedwdmaW7rC5En9S2eMw80kfw6FTMSlJy2Ohe/9O8
	LzQ==
X-Received: by 2002:a05:693c:41c9:20b0:36a:15ee:c20e with SMTP id 5a478bee46e88-36a42430362mr654438eec.33.1793306128640;
        Thu, 29 Oct 2026 13:35:28 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm982137eec.18.2026.10.29.13.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:35:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: preserve colons in symlink targets
Date: Thu, 29 Oct 2026 20:34:57 +0000
Message-ID: <20261029203457.59990-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_nls_to_utf16() parses colon-delimited ADS names when the ads mount
option is enabled. ntfs_create_reparse_buffer() also uses it to convert
the complete symlink target, so "ln -s foo:bar link" succeeds but stores
"foo" as the target. Following a link to a named data stream can then
access the unnamed stream instead.

Add a parse_ads argument and disable parsing when converting symlink
targets. Keep parsing enabled for the other callers to preserve their
existing behavior.

Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/dir.c     |  5 +++--
 fs/ntfs3/fsntfs.c  |  2 +-
 fs/ntfs3/inode.c   |  2 +-
 fs/ntfs3/namei.c   | 10 +++++-----
 fs/ntfs3/ntfs_fs.h |  2 +-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 14ca54e54578..be3c6a7fc57a 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -173,6 +173,7 @@ static int _utf8s_to_utf16s(const u8 *s, int inlen, enum utf16_endian endian,
  * @uni:	Destination memory.
  * @max_ulen:	Destination memory.
  * @endian:	Endian of target UTF-16 string.
+ * @parse_ads:	Whether to parse an ADS delimiter.
  *
  * This function is called:
  * - to create NTFS name
@@ -182,7 +183,7 @@ static int _utf8s_to_utf16s(const u8 *s, int inlen, enum utf16_endian endian,
  */
 int ntfs_nls_to_utf16(struct ntfs_sb_info *sbi, const u8 *name, u32 name_len,
 		      struct cpu_str *uni, u32 max_ulen,
-		      enum utf16_endian endian)
+		      enum utf16_endian endian, bool parse_ads)
 {
 	int ret, slen, i;
 	const u8 *end;
@@ -239,7 +240,7 @@ int ntfs_nls_to_utf16(struct ntfs_sb_info *sbi, const u8 *name, u32 name_len,
 
 	uni->len = ret;
 	uni->ads_len = 0;
-	if (ret > 0 && ads) {
+	if (ret > 0 && ads && parse_ads) {
 		uname = uni->name;
 		/* Find delimiter in range [1 : ret-2). */
 		for (i = 1; i + 1 < ret; i++) {
diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 97c04ab2763a..b06de8566a72 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2668,7 +2668,7 @@ int ntfs_set_label(struct ntfs_sb_info *sbi, u8 *label, int len)
 		return -ENOMEM;
 
 	err = ntfs_nls_to_utf16(sbi, label, len, uni, (PATH_MAX - 2) / 2,
-				UTF16_LITTLE_ENDIAN);
+				UTF16_LITTLE_ENDIAN, true);
 	if (err < 0)
 		goto out;
 
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 5a8d362155ac..d883c4b47e83 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1315,7 +1315,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	/* Convert link name to UTF-16. */
 	err = ntfs_nls_to_utf16(sbi, symname, size,
 				(struct cpu_str *)(rp_name - 1), 2 * size,
-				UTF16_LITTLE_ENDIAN);
+				UTF16_LITTLE_ENDIAN, false);
 	if (err < 0)
 		goto out;
 
diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index ae88cb66fb7e..ab9da0faa104 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -45,7 +45,7 @@ int fill_name_de(struct ntfs_sb_info *sbi, void *buf, const struct qstr *name,
 		/* Convert input string to unicode. */
 		err = ntfs_nls_to_utf16(sbi, name->name, name->len,
 					(struct cpu_str *)&fname->name_len,
-					NTFS_NAME_LEN, UTF16_LITTLE_ENDIAN);
+					NTFS_NAME_LEN, UTF16_LITTLE_ENDIAN, true);
 		if (err < 0)
 			return err;
 	}
@@ -82,7 +82,7 @@ static struct dentry *ntfs_lookup(struct inode *dir, struct dentry *dentry,
 
 	err = ntfs_nls_to_utf16(ni->mi.sbi, dentry->d_name.name,
 				dentry->d_name.len, uni, NTFS_NAME_LEN,
-				UTF16_HOST_ENDIAN);
+				UTF16_HOST_ENDIAN, true);
 
 	if (err < 0) {
 		kfree(uni);
@@ -437,7 +437,7 @@ static int ntfs_d_hash(const struct dentry *dentry, struct qstr *name)
 	sbi = dentry->d_sb->s_fs_info;
 
 	err = ntfs_nls_to_utf16(sbi, name->name, name->len, uni, NTFS_NAME_LEN,
-				UTF16_HOST_ENDIAN);
+				UTF16_HOST_ENDIAN, true);
 	if (err < 0)
 		goto out;
 
@@ -496,7 +496,7 @@ static int ntfs_d_compare(const struct dentry *dentry, unsigned int len1,
 		return -ENOMEM;
 
 	ret = ntfs_nls_to_utf16(sbi, str, len1, uni1, NTFS_NAME_LEN,
-				UTF16_HOST_ENDIAN);
+				UTF16_HOST_ENDIAN, true);
 	if (ret < 0)
 		goto out;
 
@@ -509,7 +509,7 @@ static int ntfs_d_compare(const struct dentry *dentry, unsigned int len1,
 
 	ret = ntfs_nls_to_utf16(sbi, name->name, name->len,
 				(struct cpu_str *)uni2, NTFS_NAME_LEN,
-				UTF16_LITTLE_ENDIAN);
+				UTF16_LITTLE_ENDIAN, true);
 	if (ret < 0)
 		goto out;
 
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 689151fcf993..5475eaeb49fe 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -540,7 +540,7 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
 		      u8 *buf, int buf_len);
 int ntfs_nls_to_utf16(struct ntfs_sb_info *sbi, const u8 *name, u32 name_len,
 		      struct cpu_str *uni, u32 max_ulen,
-		      enum utf16_endian endian);
+		      enum utf16_endian endian, bool parse_ads);
 struct inode *dir_search_flags(struct inode *dir, const struct cpu_str *uni,
 			       struct ntfs_fnd *fnd, u32 flags);
 static inline struct inode *dir_search(struct inode *dir,
-- 
2.43.0

