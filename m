Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C615E626
	for <ntfs3@lists.linux.dev>; Thu, 10 Nov 2022 07:51:03 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 38E341E80D74;
	Thu, 10 Nov 2022 15:45:01 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfhxvQpyzoss; Thu, 10 Nov 2022 15:44:58 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	(Authenticated sender: yuzhe@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 36B6D1E80D6D;
	Thu, 10 Nov 2022 15:44:58 +0800 (CST)
From: Yu Zhe <yuzhe@nfschina.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	liqiong@nfschina.com,
	Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] fs/ntfs3: fix spelling mistake "attibute" -> "attribute"
Date: Thu, 10 Nov 2022 15:46:40 +0800
Message-Id: <20221110074640.16792-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

There is a spelling mistake in comment. Fix it.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 fs/ntfs3/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 7de8718c68a9..1ce8c0957621 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -376,7 +376,7 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
 
 	/*
 	 * 1. Check ea_info.size_pack for overflow.
-	 * 2. New attibute size must fit value from $AttrDef
+	 * 2. New attribute size must fit value from $AttrDef
 	 */
 	if (new_pack > 0xffff || size > sbi->ea_max_size) {
 		ntfs_inode_warn(
-- 
2.11.0

