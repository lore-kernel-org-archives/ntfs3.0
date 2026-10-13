Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCC24EB862
	for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895130; cv=none; b=TPyidoYz8/PCdUDD6HAzUV1nr9y86jiJlTR+H3yp8x1sR5ZoUK5X0wrFca4ZlAKo6CpZ/7fh2WLZ8ukomQxrss1kKZwITX5CsxX4nB+DIrhtr8f4qHwNl0xMGj8WrLNc1BAMS2zm4AYnyDdpqV4M9mmsd4IZh5lzOcydSYfElb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895130; c=relaxed/simple;
	bh=yK3BXt5odIAuw+y92WkRm4qEoTv7WyPBWcnH1zLvc0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLj4MdKR3n6cqcl68bfC4uQ+LA0IEt7WbC9LbB2NIjmI67nXNp4KARi1ob8ItjnzByy2HbycXgdiCmPeJw71gjsYm1X1dgx1oI0QWNRdJzYHN9ZqTKiSmP8iOK+qowHthfaGTAk6KvGoQetmRwwq9+f6rw/v1twbW0FPTzmUhmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVOshXbt; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVOshXbt"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so170574c88.0
        for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895127; x=1792499927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wEUTczWGQjblvkN8sYOGLSfksGZhzK2JwbCezGvYkA=;
        b=MVOshXbtoXR/FWZQP7kDsnhYRS+YVwMBgDrtZGa7H57U9afAPmUXFoHbqV+ArObXyM
         beAvh05jbB+oQ7wkHBETnNc6amLd7S5kdXevpt6A9MhTdTWOMOCSv19RdJmhw2RZDqG1
         1YbCAhNzLXE2/ty1S8FOBI6mMxhNUYx7850pXU2zuPxGpRY/DMTTcDDBV1OJ1QrmPNXB
         FxV38G3N9M6W5SddeBPAx/Y171sXXhUwLsz0vjfwqVpK+Ew7mEbnoPovhHn/SuwJUHGr
         ugGFhdGgW26BuatdM34I42qRwrQkDP/pcgSQgRF6bGR47/tExCxsOWB71328SUvu+Qte
         niTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895127; x=1792499927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wEUTczWGQjblvkN8sYOGLSfksGZhzK2JwbCezGvYkA=;
        b=Pi26VfzpYFKsv9sRMasPy9a1jxtfrl8XqFe3Dk+ayUJwCw/wbG546HHZA0HKqNbhUS
         QckmLKYmy3HlP9pDvX7wDwo8GG1P1f94sA7aG9Feo2oRomZjxVhg6hWE6AXD2q3qra51
         CSY7ljcyKidB8JHE3JE9Prntsq5JsdFzU8pU8ekqRVzpXmjIqokeCvyfVHrac70jFppE
         4vPYFKR3r2QZE8stgCP1dF0J6ccaf8Ygl2RPMpocCtdHFeIAjBUeP4dz82250LqDmWs3
         SWE9IQHUSDGywhjccjNVMfikdperHP/LPWv6t+gnYS2Cu3fKAIIdjFuddnC32MU4h33a
         ykGA==
X-Gm-Message-State: AFq9FYILkl7Nifs4JiaSDwke56FoIQGJbzGaw4J9RLMnxqRjDu8KT6UI
	JfqV7b9osJLTsfqP3Nqyr5JkCgA0ez/z72Axvqv3Gvuz4TmSULUxX3apcGrYmgAI
X-Gm-Gg: AYBFou3JriRUm+byO5Va6E1ggZY3224eQNFMFSFrhOSxD4kqwrPgjZJWggv+snHmFmy
	n8fCv5PamH0j1HORu+ErORIpT42BP1V4Pvop2PhwkubtVTJ+xDxTUIbC1ql1q9XFB+vg3ei6S/j
	uxM7mVQEaGymyLj2JfSb5w+8nIyPJOos9st4uPMV3wCexRVoCQpw4wGwTrJe9TwWUqDdQoxiOsm
	zko9SvoNKnj5B/u70klx/QSEucMM3XDBlOPvJPUQXNgN1A3Nh73+rBVEz3LtIyObA83+WWNy51+
	ArF8sf6Cuf7UaQIKKzhUqXi5N0Mlt/TEeM0zw2x+6Ji+SfIv2zAQhrp2miAHJXXD/n62t8L7zia
	LrGDvMbXMEIkM/mNvm2EN+8LfUTKQZadZaWNGxqz6dRZOmggyWIxjXt4drg8MAX75yyq8DqhP2a
	44ATAE4nd2YyHkXQG9oO/nvMKXI2Iw5pQ2I7OrT33sfQkz7LbU1somRaRMC86E0sqyvlb18Q==
X-Received: by 2002:a05:701b:4306:20b0:154:e9d2:d741 with SMTP id a92af1059eb24-16a6187e53bmr16594727c88.8.1791895126588;
        Tue, 13 Oct 2026 05:38:46 -0700 (PDT)
Received: from nillco.localdomain ([2600:3c01::f03c:93ff:fe96:ad75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1698de65af7sm42383843c88.0.2026.10.13.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:38:45 -0700 (PDT)
From: Rong Zhang <ulin0208@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rong Zhang <ulin0208@gmail.com>
Subject: [PATCH] ntfs3: replace the extend_data member with a union data structure
Date: Tue, 13 Oct 2026 20:38:10 +0800
Message-ID: <20261013123810.20020-1-ulin0208@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the extend_data member of struct NTFS_DUP_INFO with a union data
structure.

This patch makes the code more robust.

Fixes: 8df35e16a92c ("fs/ntfs3: fix symlinks cannot be handled correctly")
Signed-off-by: Rong Zhang <ulin0208@gmail.com>
---
 fs/ntfs3/dir.c     |  4 +++-
 fs/ntfs3/frecord.c |  6 +++---
 fs/ntfs3/inode.c   |  6 +++---
 fs/ntfs3/ntfs.h    | 10 +++++++++-
 fs/ntfs3/ntfs_fs.h |  2 +-
 fs/ntfs3/xattr.c   |  6 +++---
 6 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index eb9152e9fa22..42222a82ca0f 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -377,7 +377,9 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
 	 * It does additional locks/reads just to get the type of name.
 	 * Should we use additional mount option to enable branch below?
 	 */
-	if (fname->dup.extend_data && ino != ni->mi.rno) {
+	if (((fname->dup.fa & FILE_ATTRIBUTE_REPARSE_POINT) ||
+	     fname->dup.ea.ea_size) &&
+	     ino != ni->mi.rno) {
 		struct inode *inode = ntfs_iget5(sbi->sb, &e->ref, NULL);
 		if (!IS_ERR_OR_NULL(inode)) {
 			dt_type = fs_umode_to_dtype(inode->i_mode);
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a953f3..066fe6aefcc4 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3090,7 +3090,7 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
 		}
 	}
 
-	dup->extend_data = 0;
+	dup->rp.reparse = 0;
 
 	if (dup->fa & FILE_ATTRIBUTE_REPARSE_POINT) {
 		attr = ni_find_attr(ni, NULL, NULL, ATTR_REPARSE, NULL, 0, NULL,
@@ -3103,7 +3103,7 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
 					      sizeof(struct REPARSE_POINT));
 			/* If ATTR_REPARSE exists 'rp' can't be NULL. */
 			if (rp)
-				dup->extend_data = rp->ReparseTag;
+				dup->rp.reparse = rp->ReparseTag;
 		}
 	} else if (ni->ni_flags & NI_FLAG_EA) {
 		attr = ni_find_attr(ni, attr, &le, ATTR_EA_INFO, NULL, 0, NULL,
@@ -3114,7 +3114,7 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
 			info = resident_data_ex(attr, sizeof(struct EA_INFO));
 			/* If ATTR_EA_INFO exists 'info' can't be NULL. */
 			if (info)
-				dup->extend_data = info->size;
+				dup->ea.ea_size = info->size_pack;
 		}
 	}
 
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 4ac26c80bd34..329650c87593 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1594,7 +1594,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 		fname->dup.a_time = std5->cr_time;
 	fname->dup.alloc_size = fname->dup.data_size = 0;
 	fname->dup.fa = std5->fa;
-	fname->dup.extend_data = S_ISLNK(mode) ? IO_REPARSE_TAG_SYMLINK : 0;
+	fname->dup.rp.reparse =	S_ISLNK(mode) ? IO_REPARSE_TAG_SYMLINK : 0;
 
 	dsize = le16_to_cpu(new_de->key_size);
 	asize = ALIGN(SIZEOF_RESIDENT + dsize, 8);
@@ -1837,7 +1837,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 		 * The packed size of extended attribute is stored in direntry too.
 		 * 'fname' here points to inside new_de.
 		 */
-		err = ntfs_save_wsl_perm(inode, &fname->dup.extend_data);
+		err = ntfs_save_wsl_perm(inode, &fname->dup.ea.ea_size);
 		if (err)
 			goto out6;
 
@@ -1853,7 +1853,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 
 			fn = resident_data_ex(attr, SIZEOF_ATTRIBUTE_FILENAME);
 			if (fn)
-				fn->dup.extend_data = fname->dup.extend_data;
+				fn->dup.ea.ea_size = fname->dup.ea.ea_size;
 		}
 	}
 
diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 4589b16329c9..bcef7ae02065 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -566,7 +566,15 @@ struct NTFS_DUP_INFO {
 	__le64 alloc_size;	// 0x20: Data attribute allocated size, multiple of cluster size.
 	__le64 data_size;	// 0x28: Data attribute size <= Dataalloc_size.
 	enum FILE_ATTRIBUTE fa;	// 0x30: Standard DOS attributes & more.
-	__le32 extend_data;	// 0x34: Extended data.
+	union {
+		struct {
+			__le16 ea_size; // 0x34: Packed EAs.
+			__le16 reserved;
+		} ea;
+		struct {
+			__le32 reparse; // 0x34: Used by Reparse.
+		} rp;
+	};
 
 }; // 0x38
 
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5811d89d67b3..aa8be7b2379b 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -978,7 +978,7 @@ int ntfs_acl_chmod(struct mnt_idmap *idmap, struct dentry *dentry);
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size);
 extern const struct xattr_handler *const ntfs_xattr_handlers[];
 
-int ntfs_save_wsl_perm(struct inode *inode, __le32 *ea_size);
+int ntfs_save_wsl_perm(struct inode *inode, __le16 *ea_size);
 void ntfs_get_wsl_perm(struct inode *inode);
 
 /* globals from lznt.c */
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 594ef6860b93..46d83427f66c 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -316,7 +316,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
 static noinline int ntfs_set_ea(struct inode *inode, const char *name,
 				size_t name_len, const void *value,
 				size_t val_size, int flags, bool locked,
-				__le32 *ea_size)
+				__le16 *ea_size)
 {
 	struct ntfs_inode *ni = ntfs_i(inode);
 	struct ntfs_sb_info *sbi = ni->mi.sbi;
@@ -525,7 +525,7 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
 	if (ea_info.size_pack != size_pack)
 		ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
 	if (ea_size)
-		*ea_size = ea_info.size;
+		*ea_size = ea_info.size_pack;
 	mark_inode_dirty(&ni->vfs_inode);
 
 out:
@@ -987,7 +987,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
  *
  * save uid/gid/mode in xattr
  */
-int ntfs_save_wsl_perm(struct inode *inode, __le32 *ea_size)
+int ntfs_save_wsl_perm(struct inode *inode, __le16 *ea_size)
 {
 	int err;
 	__le32 value;
-- 
2.56.0

