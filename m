Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C14217F40
	for <ntfs3@lists.linux.dev>; Wed,  7 May 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603294; cv=none; b=YY/SlEDJSZh0zBYU0mGmyAs5uXc3Q5P3FOnwKQD7LHWCRChLRC7nzbgsmlshn/jQlJEDB7PZUylWb0sONLRRZvrU2himli3WHFWYw1+mgRjtGBsglZ5f8tSjFVhHutsFmrmmhlQv0CJx0b6JhwJfu6lGcbLuY7BfVm+YPpmg62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603294; c=relaxed/simple;
	bh=cQgejbF8PEhNfbRS3kAyUSyUiPzm07pmp9ybhBOHbqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaI4QFK8rImO90q/p2DeRL/RXQh/RJPN/8Ek0KtAOESgTMWvnv8a1gUVaJIrZUUgu4iyyvZItn6jRRwoAzztrSPotfWJ0sLsP7mnDCKp6oUBJ6+NOkPTC7LjoiXGmkTBRC2y4CxZuwvj+Z56hmEQ2EvdNMhZTd0zaVrpteF4bsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROEpjvbD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROEpjvbD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so6636745b3a.1
        for <ntfs3@lists.linux.dev>; Wed, 07 May 2025 00:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746603292; x=1747208092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kw02EmuHt/Xtyfhqvd8QhiWbnmj4K2ykdTA4NHuMLfo=;
        b=ROEpjvbD5ZyVx6HXDCIMDpjpFmU98cYUNL42u5ZEye3qviTqzTX0GqO58xn5WkL5p0
         Hl0Ulr8v/KCK4WLBCv8jHSVi9dnRAMocqeDgSJe9lJwRd6YjWXIU7RzSdELJU8vfZAK1
         6btrkELUXIh3e4Vf6klrEZKJP5BVJxzAAcXKRaBrQFgB+ZBqY6HPVV0bD6rOG1jDQ5/K
         oA5v2+OFiA78CSsDULk2Zxyn26PAwKa5pb7Xid0Jeeb++1FNapWyebsk8bZPGxQqjV8q
         m8WGQ1gH8IEUeZFxekLAWGQ/BrpR2to0rWnYKbg6sNJYnjoSwuc8Bdq/PoBSYT2TCz4F
         OfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603292; x=1747208092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kw02EmuHt/Xtyfhqvd8QhiWbnmj4K2ykdTA4NHuMLfo=;
        b=kTjDmDOeMpGli9qX66eJVwqSTyJY5bho4Ud9cYEf4tuOD2MRQtJWgAJk/UIoK0L0md
         ymEGa9312fPrYCdsu+aVaZ4SfbvGRmvQsSEnvoFvapfDoJ9nedGH/yptmmJkjvLlAsan
         ujWGTokwY46o7bJ4iL+Wu3Pg0/LQnN2figVq6+Xups3eNd37kJpOQufBMW+wI/fE5jL6
         LB6CYV1gUbfRqn2yIV4VSfQf5zbZ1X57HinTkQySgmZVLBDc4nmBbd+a1xmxQkg3X7J0
         +wkOhhqLnl22Djd7RFhz3pFBddZ97WiOmDdrnqLJaL5Y8MfJ9+zHYU3tzR0IAXeGNH9a
         q2lA==
X-Gm-Message-State: AOJu0YzKI7GMrlD+OnhMZ2GJ5rf7XNP9VZsjf6Ab+N0RrJhfxc88oP0t
	B5UaWED1iP8OsQMiYziZkKJWCsZNEJtAwTEKw+0yIFXIUqTIeiOn
X-Gm-Gg: ASbGncvffPcq95pJEoybkpaI+10jezpCdD31jdLUniFhWFfjUS5EP5/53cia1tfaoH+
	nX9yKbeVmZGyTssoeVwo765dPZPpiGJiwHROwn1OtYYvRFXmYfmjXZEOdxAztRMZDRTmLv5gX3Z
	dQakPVj76mlQhTXVtXXMU+l4Pz5TqRl3hiPB5L7SJOor8HHA0u7aQE/Tq7V77bvtlLOoQkcVWd4
	HKFg7jS1BCVQiXl5/JyHSvzhqe0ZkNZLkYfTYUmrUiph3ijGctjSUL0HSbFVVrntywxhMDic7m7
	eHBi8w5+IRRWOpx9iRhZ1t1T2Xsr9jKJ+VQ+czgs
X-Google-Smtp-Source: AGHT+IFwWIA+Pj5nz8MtmtNjAo3TpuwLif7MvZwZN14Mcg6qmus1nb0j7vvMj6k/Afjg49MoXF68XQ==
X-Received: by 2002:a05:6a21:1807:b0:1f5:7df9:f13c with SMTP id adf61e73a8af0-2148d42d053mr3653663637.41.1746603292263;
        Wed, 07 May 2025 00:34:52 -0700 (PDT)
Received: from nillco.localdomain ([2600:3c01::f03c:93ff:fe96:ad75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm10461240b3a.78.2025.05.07.00.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:34:51 -0700 (PDT)
From: Rong Zhang <ulin0208@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rong Zhang <ulin0208@gmail.com>
Subject: [PATCH 1/2] ntfs3: fix symlinks cannot be handled correctly
Date: Wed,  7 May 2025 15:34:38 +0800
Message-ID: <20250507073438.11649-1-ulin0208@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The symlinks created in windows will be broken in linux by ntfs3,
the patch fixes it.

Signed-off-by: Rong Zhang <ulin0208@gmail.com>
---
 fs/ntfs3/dir.c     |  3 +--
 fs/ntfs3/frecord.c | 20 +++++++++++++++-----
 fs/ntfs3/inode.c   | 42 ++++++++++++++++++++++--------------------
 fs/ntfs3/ntfs.h    |  3 +--
 fs/ntfs3/ntfs_fs.h |  2 +-
 fs/ntfs3/xattr.c   |  6 +++---
 6 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index b6da80c69ca6..4aab4d54b171 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -329,8 +329,7 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
 	 * It does additional locks/reads just to get the type of name.
 	 * Should we use additional mount option to enable branch below?
 	 */
-	if (((fname->dup.fa & FILE_ATTRIBUTE_REPARSE_POINT) ||
-	     fname->dup.ea_size) &&
+	if (fname->dup.extend_data &&
 	    ino != ni->mi.rno) {
 		struct inode *inode = ntfs_iget5(sbi->sb, &e->ref, NULL);
 		if (!IS_ERR_OR_NULL(inode)) {
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 608634361a30..9a96a9b9987d 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3173,11 +3173,21 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
 		}
 	}
 
-	/* TODO: Fill reparse info. */
-	dup->reparse = 0;
-	dup->ea_size = 0;
+	dup->extend_data = 0;
 
-	if (ni->ni_flags & NI_FLAG_EA) {
+	if (dup->fa & FILE_ATTRIBUTE_REPARSE_POINT) {
+		attr = ni_find_attr(ni, NULL, NULL, ATTR_REPARSE, NULL, 0, NULL,
+				    NULL);
+
+		if (attr) {
+			const struct REPARSE_POINT *rp;
+
+			rp = resident_data_ex(attr, sizeof(struct REPARSE_POINT));
+			/* If ATTR_REPARSE exists 'rp' can't be NULL. */
+			if (rp)
+				dup->extend_data = rp->ReparseTag;
+		}
+	} else if (ni->ni_flags & NI_FLAG_EA) {
 		attr = ni_find_attr(ni, attr, &le, ATTR_EA_INFO, NULL, 0, NULL,
 				    NULL);
 		if (attr) {
@@ -3186,7 +3196,7 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
 			info = resident_data_ex(attr, sizeof(struct EA_INFO));
 			/* If ATTR_EA_INFO exists 'info' can't be NULL. */
 			if (info)
-				dup->ea_size = info->size_pack;
+				dup->extend_data = info->size;
 		}
 	}
 
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index a1e11228dafd..2641738d2934 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1386,7 +1386,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 		fname->dup.a_time = std5->cr_time;
 	fname->dup.alloc_size = fname->dup.data_size = 0;
 	fname->dup.fa = std5->fa;
-	fname->dup.ea_size = fname->dup.reparse = 0;
+	fname->dup.extend_data = S_ISLNK(mode) ? IO_REPARSE_TAG_SYMLINK : 0;
 
 	dsize = le16_to_cpu(new_de->key_size);
 	asize = ALIGN(SIZEOF_RESIDENT + dsize, 8);
@@ -1626,27 +1626,29 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 		inode->i_flags |= S_NOSEC;
 	}
 
-	/*
-	 * ntfs_init_acl and ntfs_save_wsl_perm update extended attribute.
-	 * The packed size of extended attribute is stored in direntry too.
-	 * 'fname' here points to inside new_de.
-	 */
-	err = ntfs_save_wsl_perm(inode, &fname->dup.ea_size);
-	if (err)
-		goto out6;
+	if (!S_ISLNK(mode)) {
+		/*
+		 * ntfs_init_acl and ntfs_save_wsl_perm update extended attribute.
+		 * The packed size of extended attribute is stored in direntry too.
+		 * 'fname' here points to inside new_de.
+		 */
+		err = ntfs_save_wsl_perm(inode, &fname->dup.extend_data);
+		if (err)
+			goto out6;
 
-	/*
-	 * update ea_size in file_name attribute too.
-	 * Use ni_find_attr cause layout of MFT record may be changed
-	 * in ntfs_init_acl and ntfs_save_wsl_perm.
-	 */
-	attr = ni_find_attr(ni, NULL, NULL, ATTR_NAME, NULL, 0, NULL, NULL);
-	if (attr) {
-		struct ATTR_FILE_NAME *fn;
+		/*
+		 * update ea_size in file_name attribute too.
+		 * Use ni_find_attr cause layout of MFT record may be changed
+		 * in ntfs_init_acl and ntfs_save_wsl_perm.
+		 */
+		attr = ni_find_attr(ni, NULL, NULL, ATTR_NAME, NULL, 0, NULL, NULL);
+		if (attr) {
+			struct ATTR_FILE_NAME *fn;
 
-		fn = resident_data_ex(attr, SIZEOF_ATTRIBUTE_FILENAME);
-		if (fn)
-			fn->dup.ea_size = fname->dup.ea_size;
+			fn = resident_data_ex(attr, SIZEOF_ATTRIBUTE_FILENAME);
+			if (fn)
+				fn->dup.extend_data = fname->dup.extend_data;
+		}
 	}
 
 	/* We do not need to update parent directory later */
diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 1ff13b6f9613..552b97905813 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -561,8 +561,7 @@ struct NTFS_DUP_INFO {
 	__le64 alloc_size;	// 0x20: Data attribute allocated size, multiple of cluster size.
 	__le64 data_size;	// 0x28: Data attribute size <= Dataalloc_size.
 	enum FILE_ATTRIBUTE fa;	// 0x30: Standard DOS attributes & more.
-	__le16 ea_size;		// 0x34: Packed EAs.
-	__le16 reparse;		// 0x36: Used by Reparse.
+	__le32 extend_data;	// 0x34: Extended data.
 
 }; // 0x38
 
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index cd8e8374bb5a..a8011093c47e 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -884,7 +884,7 @@ int ntfs_acl_chmod(struct mnt_idmap *idmap, struct dentry *dentry);
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
-int ntfs_save_wsl_perm(struct inode *inode, __le16 *ea_size);
+int ntfs_save_wsl_perm(struct inode *inode, __le32 *ea_size);
 void ntfs_get_wsl_perm(struct inode *inode);
 
 /* globals from lznt.c */
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index e0055dcf8fe3..4bf14cff2683 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -313,7 +313,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 static noinline int ntfs_set_ea(struct inode *inode, const char *name,
 				size_t name_len, const void *value,
 				size_t val_size, int flags, bool locked,
-				__le16 *ea_size)
+				__le32 *ea_size)
 {
 	struct ntfs_inode *ni = ntfs_i(inode);
 	struct ntfs_sb_info *sbi = ni->mi.sbi;
@@ -522,7 +522,7 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
 	if (ea_info.size_pack != size_pack)
 		ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
 	if (ea_size)
-		*ea_size = ea_info.size_pack;
+		*ea_size = ea_info.size;
 	mark_inode_dirty(&ni->vfs_inode);
 
 out:
@@ -950,7 +950,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
  *
  * save uid/gid/mode in xattr
  */
-int ntfs_save_wsl_perm(struct inode *inode, __le16 *ea_size)
+int ntfs_save_wsl_perm(struct inode *inode, __le32 *ea_size)
 {
 	int err;
 	__le32 value;
-- 
2.49.0

