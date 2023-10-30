Received: from mail.cock.li (mail.cock.li [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87C137E
	for <ntfs3@lists.linux.dev>; Mon, 30 Oct 2023 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=firemail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firemail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firemail.cc header.i=@firemail.cc header.b="TPiqoAQS"
From: Nekun <nekokun@firemail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firemail.cc; s=mail;
	t=1698654926; bh=9F0X72WQD86pcQqVrP777i1r+P1BKzSW4cR28mYVUZc=;
	h=From:To:Cc:Subject:Date:From;
	b=TPiqoAQSpxpDOjXkFz3LqVnUmEm9K/o2w5MThdiXmdRIlfCpXLN0XbcifCRF2TxuC
	 vZChG7PbxodTbR/XYAECutxy4O2U6+ji4xUBfJR+Xgt+WopuTL1KQOlwe1cUrmKqGY
	 Qo7QEoL47xtdpZNfO/fulrT4xeHgfXaKpxHJi7zzKkFfVybzR/xBA4JkgQVzSQXjQv
	 M2mxWdJvF8YBoF5JuMjcoAV6GqD9yaQvPd9pWyv44nLFsh8FJDMTj/DKp0txGXkNss
	 +tRkjG3mNSHhGk1y2iWzkj3icYAJ/PPBMTmrbwQ4CaWiv6Vb006zIf291u6bkLejRB
	 nsskM0TeYyCMA==
To: linux-kernel@vger.kernel.org
Cc: Nekun <nekokun@firemail.cc>,
	ntfs3@lists.linux.dev,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH] fs/ntfs3: Add ioctl operation for directories (FITRIM)
Date: Mon, 30 Oct 2023 08:33:54 +0000
Message-Id: <20231030083354.7824-1-nekokun@firemail.cc>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While ntfs3 supports discards, FITRIM ioctl() command has defined
only for regular files. This may confuse users trying to invoke
`fstrim` utility with the directory argument (for example, call
`fstrim <mountpoint>` which is the common practice). In this case,
ioctl() returns -ENOTTY without any error messages in kernel ring
buffer, this may be easily interpreted as no support for discards
in ntfs3 driver.

Currently only FITRIM command implemented in ntfs_ioctl() and
passed inode used only for dereferencing NTFS superblock, so
no need for separate ioctl() handler for directories, just add
existing ntfs_ioctl() handler to ntfs_dir_operations.

Signed-off-by: Nekun <nekokun@firemail.cc>
---
 fs/ntfs3/dir.c     | 4 ++++
 fs/ntfs3/file.c    | 4 ++--
 fs/ntfs3/ntfs_fs.h | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index ec0566b322d5..f3cf71b28274 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -593,5 +593,9 @@ const struct file_operations ntfs_dir_operations = {
 	.iterate_shared	= ntfs_readdir,
 	.fsync		= generic_file_fsync,
 	.open		= ntfs_file_open,
+	.unlocked_ioctl = ntfs_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl   = ntfs_compat_ioctl,
+#endif
 };
 // clang-format on
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1f7a194983c5..5a613409f15e 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -48,7 +48,7 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 	return 0;
 }
 
-static long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg)
+long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct ntfs_sb_info *sbi = inode->i_sb->s_fs_info;
@@ -61,7 +61,7 @@ static long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg)
 }
 
 #ifdef CONFIG_COMPAT
-static long ntfs_compat_ioctl(struct file *filp, u32 cmd, unsigned long arg)
+long ntfs_compat_ioctl(struct file *filp, u32 cmd, unsigned long arg)
 
 {
 	return ntfs_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 0e6a2777870c..5b367c87ca3f 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -500,6 +500,8 @@ int ntfs3_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 int ntfs_file_open(struct inode *inode, struct file *file);
 int ntfs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		__u64 start, __u64 len);
+long ntfs_ioctl(struct file *filp, u32 cmd, unsigned long arg);
+long ntfs_compat_ioctl(struct file *filp, u32 cmd, unsigned long arg);
 extern const struct inode_operations ntfs_special_inode_operations;
 extern const struct inode_operations ntfs_file_inode_operations;
 extern const struct file_operations ntfs_file_operations;
-- 
2.26.3

