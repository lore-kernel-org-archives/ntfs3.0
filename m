Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025CE7F
	for <ntfs3@lists.linux.dev>; Sat, 24 Sep 2022 06:34:43 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MZJz34fgpzHtdP;
	Sat, 24 Sep 2022 14:29:51 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 14:34:35 +0800
From: Yuan Can <yuancan@huawei.com>
To: <almaz.alexandrovich@paragon-software.com>, <ntfs3@lists.linux.dev>
CC: <yuancan@huawei.com>
Subject: [PATCH v2] fs/ntfs3: use strcmp to determin attribute type
Date: Sat, 24 Sep 2022 06:32:04 +0000
Message-ID: <20220924063204.22530-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected

The way of determin attribute type is just matching
name with the predefined string, do this with strcmp
to simplify the code.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 fs/ntfs3/xattr.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 7de8718c68a9..7fa5304a969b 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -720,11 +720,9 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 {
 	int err;
 	struct ntfs_inode *ni = ntfs_i(inode);
-	size_t name_len = strlen(name);
 
 	/* Dispatch request. */
-	if (name_len == sizeof(SYSTEM_DOS_ATTRIB) - 1 &&
-	    !memcmp(name, SYSTEM_DOS_ATTRIB, sizeof(SYSTEM_DOS_ATTRIB))) {
+	if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
 		/* system.dos_attrib */
 		if (!buffer) {
 			err = sizeof(u8);
@@ -737,8 +735,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		goto out;
 	}
 
-	if (name_len == sizeof(SYSTEM_NTFS_ATTRIB) - 1 &&
-	    !memcmp(name, SYSTEM_NTFS_ATTRIB, sizeof(SYSTEM_NTFS_ATTRIB))) {
+	if (!strcmp(name, SYSTEM_NTFS_ATTRIB)) {
 		/* system.ntfs_attrib */
 		if (!buffer) {
 			err = sizeof(u32);
@@ -751,8 +748,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		goto out;
 	}
 
-	if (name_len == sizeof(SYSTEM_NTFS_SECURITY) - 1 &&
-	    !memcmp(name, SYSTEM_NTFS_SECURITY, sizeof(SYSTEM_NTFS_SECURITY))) {
+	if (!strcmp(name, SYSTEM_NTFS_SECURITY)) {
 		/* system.ntfs_security*/
 		struct SECURITY_DESCRIPTOR_RELATIVE *sd = NULL;
 		size_t sd_size = 0;
@@ -792,7 +788,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 	}
 
 	/* Deal with NTFS extended attribute. */
-	err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
+	err = ntfs_get_ea(inode, name, strlen(name), buffer, size, NULL);
 
 out:
 	return err;
@@ -809,20 +805,17 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 {
 	int err = -EINVAL;
 	struct ntfs_inode *ni = ntfs_i(inode);
-	size_t name_len = strlen(name);
 	enum FILE_ATTRIBUTE new_fa;
 
 	/* Dispatch request. */
-	if (name_len == sizeof(SYSTEM_DOS_ATTRIB) - 1 &&
-	    !memcmp(name, SYSTEM_DOS_ATTRIB, sizeof(SYSTEM_DOS_ATTRIB))) {
+	if (!strcmp(name, SYSTEM_DOS_ATTRIB)) {
 		if (sizeof(u8) != size)
 			goto out;
 		new_fa = cpu_to_le32(*(u8 *)value);
 		goto set_new_fa;
 	}
 
-	if (name_len == sizeof(SYSTEM_NTFS_ATTRIB) - 1 &&
-	    !memcmp(name, SYSTEM_NTFS_ATTRIB, sizeof(SYSTEM_NTFS_ATTRIB))) {
+	if (!strcmp(name, SYSTEM_NTFS_ATTRIB)) {
 		if (size != sizeof(u32))
 			goto out;
 		new_fa = cpu_to_le32(*(u32 *)value);
@@ -860,8 +853,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 		goto out;
 	}
 
-	if (name_len == sizeof(SYSTEM_NTFS_SECURITY) - 1 &&
-	    !memcmp(name, SYSTEM_NTFS_SECURITY, sizeof(SYSTEM_NTFS_SECURITY))) {
+	if (!strcmp(name, SYSTEM_NTFS_SECURITY)) {
 		/* system.ntfs_security*/
 		__le32 security_id;
 		bool inserted;
@@ -904,7 +896,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
 	}
 
 	/* Deal with NTFS extended attribute. */
-	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
+	err = ntfs_set_ea(inode, name, strlen(name), value, size, flags, 0);
 
 out:
 	inode->i_ctime = current_time(inode);
-- 
2.17.1

