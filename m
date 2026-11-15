Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765854;
	b=gxTGSe+nVMQuGl+cTK/84crIJdh1vPVSVqefSOOoBpX3PD5BUmuUaPI8bsFyGKR1tPlR
	 yTPZplBLcfwG9KH2wC+1uLduVMfayptjX7Y0Mw72Ra64DmienzOJdcO0r666P3qgk6OXA
	 TCqk3QbJri09CFqI1vTDCTXDVUW5l2R7Pfiu9kEAxDdgRbM6vRTszknlGBqwvtciceCt0
	 F6I33Cf1TrJdAPyvFhrrz48GGbiVgP69M739sP1bJ0pXZ+y+0PIBM0sTi8ZiclGpAC6kz
	 Y17qrVFq58m2iy0tc9pSRNXCh5yWg/rC8rg3w7qeS6tarQr7Bhj+JpWwG0P3EXxZ4rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dt00QcB/UAbcoWfb+Nc1N3msJVe+tAMzrHb6Fo7W5/Y=;
	b=hEoGsByFdF4j2V51PqfqI4dDbZCtJzNMwTNCLl4KAAy1V1sH3uT0kFJOOLw+P+gssixs
	 gNfDU1Y7dO3vMFBKDzaBeVTM1+1LRMlbXS5xIdMUfRowCCMeFsX8PHHJGJE2PFHU4MPqD
	 b3Ff3ZruNce5LVtGCuIZOE2dI/NrgzNuKbbijYuRnvmYMZqsYl719ExnnRVBa4Ja6jR9f
	 pzmzw3znbmShmFBA90eIfSFBl3kfJuPtJeLiXeElmTVUlOFjC8c2BBpAtGcP6+7hUb1py
	 7bHj7fjaiCC+qmKDmKbG8qrHqcReXpjGN6Caxs2j1v/CFS99R5EKF4K03eMFaf+UB4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnWKGNfv;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1E60A5BCA
	for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 18:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A1E60A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnWKGNfv
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1769571f8f.2
        for <ntfs3@lists.linux.dev>; Sun, 15 Nov 2026 10:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765852; x=1795370652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dt00QcB/UAbcoWfb+Nc1N3msJVe+tAMzrHb6Fo7W5/Y=;
        b=fnWKGNfvu1NLmZJ+NtYa7PY5XM6BavYk3zvZ1ZOKtrRk59Sfa5KCnc9rjVH5+N/JSm
         Z2omgy8HpSzdHl83O6F2DEFZK7XPtuZGA04M6v+IMoBOuA3RO0rp8oRkToihwUqRsxEh
         2hwmYKkgCYlRt1G+LvYYeIHjQ0BC5IhwNk8t7fYL6G9YwsGRtq9m2u8PLAxgYJLQ56/Y
         WxWXvOHbFmbIP5w0cSYkEufc5xgvXeQygrdMQUJqfIt90/9e7a4T1XfNz1BIAvMYW3gW
         9MPpLC5NGYdNHK+BfeyL3hP23ikFqan3PDnMPLtgtqeKO+FkfduNfEGigBt7CVZXJ21F
         H8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765852; x=1795370652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dt00QcB/UAbcoWfb+Nc1N3msJVe+tAMzrHb6Fo7W5/Y=;
        b=Z34+6x+tpHYkn5dsYi6x3kWEyqhEvCX5/HvUCAA0NrGu/NICJaXBFcV9cwqf7+S5jg
         NBILA+cAB930FlvKT8ZHPErFgWjj5UdjuVvI1GlXIeB3BuysxwLaNHv7ADCZbsO4ZWmE
         n0fUT64pecgmQ299q/0+E+znKErb9tqtUNoalIMhIfWXnITJF+XUvcnh7P+2x+3BMVJ8
         kWtp8Wbr6NNx+gITdLcCyUGN6Sj8J6PyBsoADMBs7faBSif/Y4sA7bDHNdR1SJDNeh9O
         6iPJG6I7cjRYMnjnWLlqrZlMWM3fahGIBd1LVtBkjExjvpD8BRxVTUjLlApHw1d3O6kL
         DfJQ==
X-Forwarded-Encrypted: i=1; AL+hErGYFKnoLs2RWHh81brbCLwlr3pFCwJcfIarVGn54UyBi4VzR65PLeYIK6CTFESZ9PVYRrpK6w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9s+33jSuF6IMg8rXwp9WlBhlV8U83D8hubWSunoGqh6EREVkbt
	z4iUVLJMYSnIBcm/Uw93RVAoUZw/16aqVivlT5LJeF4UFwJ6lbflW/pT
X-Gm-Gg: AYBFou2wu2AVT16sMJ/ogTSxmyd9zE3OOIxoPxDMNSB5QAN/+25BFRLxJvfYfNEMYQK
	KnyNWeC45vlMi5XdCzyUNhBQ6JGWQKjXSXr7dva4wdVPUqmV/7H74yljiNomixgQGOy6EWLsJIH
	65FD7hE3zqT30lUUL82D4sVT3Q8jiqzre6A/nqgvntJ1d4Fm7UUkawH0pwfbx0e6AVneSwHeKaK
	Y5EqxG+x4ZEGTlHq21+FuclbcM9f77c9pOT/UaWnRs9/LuY+WTYnXzQN8NqJSbK4hIMrwTggSAu
	htDFBCFb2x8RoGGovQMgpxQ57A86roCmRNxUfyaumjUP9VURta1f54jXIkgxxTE93ufU0qgSUwr
	Ivgr+YVx3V3fJzUUpkGvzR5feMsl5TiXy1FTC0Hj5NnaIFXiZY8V2Ll18Pl5aCjSP1MfAWCeb1U
	Xk5DVOwt+4pcaGqWeoZD0PJwZQGndS6UVsh9+XNPkGe2qYIyHtGlquIc3lecB89lhEORbco0ey1
	wxVhUjkQftDf8lJGgLVjtAt8BmeFWgs93aZXLMG9znsp1HnxBOvoSe4PJgDjH/mCnU+hXrlk27k
	pa+LvFK0iyMugjI/LDH/v/5G
X-Received: by 2002:a05:6000:4022:b0:49e:1601:2fb1 with SMTP id ffacd0b85a97d-49e1601310bmr10387323f8f.24.1794765852233;
        Sun, 15 Nov 2026 10:04:12 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:11 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 06/10] vfs: add __vfs_fileattr_set_locked() for inode_lock()'d callers
Date: Sun, 15 Nov 2026 19:03:39 +0100
Message-ID: <20261115180343.576773-7-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115180343.576773-1-koray.fra@gmail.com>
References: <20261115180343.576773-1-koray.fra@gmail.com>
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

Currently there is no way for a caller to invoke vfs_fileattr_set()
while holding an inode lock without having the kernel go into deadlock.

Fix this by moving the vfs_fileattr_set() logic into
__vfs_fileattr_set_locked() and making vfs_fileattr_set() a simple
wrapper that only handles the inode lock.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c           | 139 +++++++++++++++++++++++----------------
 include/linux/fileattr.h |   2 +
 2 files changed, 86 insertions(+), 55 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 12610fb6a751..063c81fbfa6a 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -288,6 +288,89 @@ static int fileattr_set_prepare(struct inode *inode,
 	return 0;
 }
 
+/**
+ * __vfs_fileattr_set_locked - change miscellaneous file attributes while
+ * holding the inode lock
+ *
+ * @idmap:	idmap of the mount
+ * @dentry:	the object to change
+ * @fa:		fileattr pointer
+ *
+ * Same as vfs_fileattr_set(), but caller must hold the inode lock.
+ *
+ * Return: 0 on success, or a negative error on failure.
+ */
+int __vfs_fileattr_set_locked(const struct mnt_idmap *idmap, struct dentry *dentry,
+			      struct file_kattr *fa)
+{
+	struct inode *inode = d_inode(dentry);
+	struct file_kattr old_ma = {};
+	int err;
+
+	if (!inode->i_op->fileattr_set)
+		return -ENOIOCTLCMD;
+
+	if (!inode_owner_or_capable(idmap, inode))
+		return -EPERM;
+
+	err = vfs_fileattr_get(dentry, &old_ma);
+	if (err)
+		return err;
+
+	/* initialize missing bits from old_ma */
+	if (fa->flags_valid) {
+		/* FS_IOC_SETFLAGS */
+		fa->fsx_xflags |= (old_ma.fsx_xflags & FS_XFLAGS_MASK) &
+				  ~FS_XFLAG_COMMON;
+		fa->fsx_extsize = old_ma.fsx_extsize;
+		fa->fsx_nextents = old_ma.fsx_nextents;
+		fa->fsx_projid = old_ma.fsx_projid;
+		fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+		fa->fsx_ptime = old_ma.fsx_ptime;
+	} else {
+		/*
+		 * Preserve unmasked xflags when running file_setattr()
+		 * with a mask, which doesn't need a read-modify-write
+		 * so these attributes would be set to 0.
+		 *
+		 * With FS_IOC_FSSETXATTR or mask == 0 (legacy mode)
+		 * this is not needed as userspace does
+		 * read-modify-write already.
+		 */
+		if (fa->fsx_xflags_mask) {
+			fa->fsx_xflags |= old_ma.fsx_xflags &
+					  ~fa->fsx_xflags_mask;
+			fileattr_fill_xflags(fa, fa->fsx_xflags &
+					     ~FS_XFLAG_RDONLY_MASK);
+			if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTSIZE))
+				fa->fsx_extsize = old_ma.fsx_extsize;
+			if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJID))
+				fa->fsx_projid = old_ma.fsx_projid;
+			if (!(fa->fsx_xflags_mask & FS_XFLAG_COWEXTSIZE))
+				fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+		}
+		fa->flags |= old_ma.flags & ~FS_COMMON_FL;
+
+		/* xflags not present in fsxattr */
+		if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
+			fa->fsx_ptime = old_ma.fsx_ptime;
+	}
+
+	err = fileattr_set_prepare(inode, &old_ma, fa);
+	if (err)
+		return err;
+	err = security_inode_file_setattr(dentry, fa);
+	if (err)
+		return err;
+	err = inode->i_op->fileattr_set(idmap, dentry, fa);
+	if (err)
+		return err;
+	fsnotify_xattr(dentry);
+
+	return 0;
+}
+EXPORT_SYMBOL(__vfs_fileattr_set_locked);
+
 /**
  * vfs_fileattr_set - change miscellaneous file attributes
  * @idmap:	idmap of the mount
@@ -308,7 +391,6 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 		     struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
-	struct file_kattr old_ma = {};
 	int err;
 
 	if (!inode->i_op->fileattr_set)
@@ -318,60 +400,7 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	inode_lock(inode);
-	err = vfs_fileattr_get(dentry, &old_ma);
-	if (!err) {
-		/* initialize missing bits from old_ma */
-		if (fa->flags_valid) {
-			/* FS_IOC_SETFLAGS */
-			fa->fsx_xflags |= (old_ma.fsx_xflags & FS_XFLAGS_MASK) &
-					  ~FS_XFLAG_COMMON;
-			fa->fsx_extsize = old_ma.fsx_extsize;
-			fa->fsx_nextents = old_ma.fsx_nextents;
-			fa->fsx_projid = old_ma.fsx_projid;
-			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-			fa->fsx_ptime = old_ma.fsx_ptime;
-		} else {
-			/*
-			 * Preserve unmasked xflags when running file_setattr()
-			 * with a mask, which doesn't need a read-modify-write
-			 * so these attributes would be set to 0.
-			 *
-			 * With FS_IOC_FSSETXATTR or mask == 0 (legacy mode)
-			 * this is not needed as userspace does
-			 * read-modify-write already.
-			 */
-			if (fa->fsx_xflags_mask) {
-				fa->fsx_xflags |= old_ma.fsx_xflags &
-						  ~fa->fsx_xflags_mask;
-				fileattr_fill_xflags(fa, fa->fsx_xflags &
-						     ~FS_XFLAG_RDONLY_MASK);
-				if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTSIZE))
-					fa->fsx_extsize = old_ma.fsx_extsize;
-				if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJID))
-					fa->fsx_projid = old_ma.fsx_projid;
-				if (!(fa->fsx_xflags_mask & FS_XFLAG_COWEXTSIZE))
-					fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-			}
-			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
-
-			/* xflags not present in fsxattr */
-			if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
-				fa->fsx_ptime = old_ma.fsx_ptime;
-		}
-
-		err = fileattr_set_prepare(inode, &old_ma, fa);
-		if (err)
-			goto out;
-		err = security_inode_file_setattr(dentry, fa);
-		if (err)
-			goto out;
-		err = inode->i_op->fileattr_set(idmap, dentry, fa);
-		if (err)
-			goto out;
-		fsnotify_xattr(dentry);
-	}
-
-out:
+	err = __vfs_fileattr_set_locked(idmap, dentry, fa);
 	inode_unlock(inode);
 	return err;
 }
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index ba7ed3b387d8..7ff62ee27e58 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -97,6 +97,8 @@ static inline bool fileattr_has_fsx(const struct file_kattr *fa)
 int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
 int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 		     struct file_kattr *fa);
+int __vfs_fileattr_set_locked(const struct mnt_idmap *idmap, struct dentry *dentry,
+			      struct file_kattr *fa);
 int ioctl_getflags(struct file *file, unsigned int __user *argp);
 int ioctl_setflags(struct file *file, unsigned int __user *argp);
 int ioctl_fsgetxattr(struct file *file, void __user *argp);
-- 
2.56.0

