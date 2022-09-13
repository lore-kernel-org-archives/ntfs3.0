Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C67B
	for <ntfs3@lists.linux.dev>; Tue, 13 Sep 2022 06:49:45 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MRYtg1np4zHnVL;
	Tue, 13 Sep 2022 14:47:39 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 13 Sep
 2022 14:49:39 +0800
From: Yuan Can <yuancan@huawei.com>
To: <patchwork@huawei.com>, <almaz.alexandrovich@paragon-software.com>,
	<ntfs3@lists.linux.dev>
CC: <yuancan@huawei.com>
Subject: [PATCH] fs/ntfs3: use strcmp to determin attribute type
Date: Tue, 13 Sep 2022 06:47:28 +0000
Message-ID: <20220913064728.79092-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected

The way of determin attribute type is just matching
name with the predefined string, do this with strcmp
to simplify the code.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 fs/ntfs3/xattr.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 7de8718c68a9..1776f0e783ea 100644
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
-- 
2.17.1

