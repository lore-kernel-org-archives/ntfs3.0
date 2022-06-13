Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB41376
	for <ntfs3@lists.linux.dev>; Mon, 13 Jun 2022 12:43:49 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LMB6F1gG9zjXYh;
	Mon, 13 Jun 2022 20:42:13 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 20:43:41 +0800
Received: from huawei.com (10.174.178.102) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 13 Jun
 2022 20:43:40 +0800
From: linshengwang <linshengwang1@huawei.com>
To: <almaz.alexandrovich@paragon-software.com>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linshengwang1@huawei.com>
Subject: [PATCH -next] fs/ntfs3: Remove unused function 'attr_must_be_resident'
Date: Mon, 13 Jun 2022 20:43:39 +0800
Message-ID: <20220613124339.552-1-linshengwang1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.102]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected

From: Lin Shengwang <linshengwang1@huawei.com>

It is introduced by commit be71b5cba2e6 ("fs/ntfs3:
Add attrib operations"), but never used, so remove it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Lin Shengwang <linshengwang1@huawei.com>
---
 fs/ntfs3/attrib.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index fc0623b029e6..3df0c3f5ec72 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -54,33 +54,6 @@ static inline u64 get_pre_allocated(u64 size)
 	return ret;
 }

-/*
- * attr_must_be_resident
- *
- * Return: True if attribute must be resident.
- */
-static inline bool attr_must_be_resident(struct ntfs_sb_info *sbi,
-					 enum ATTR_TYPE type)
-{
-	const struct ATTR_DEF_ENTRY *de;
-
-	switch (type) {
-	case ATTR_STD:
-	case ATTR_NAME:
-	case ATTR_ID:
-	case ATTR_LABEL:
-	case ATTR_VOL_INFO:
-	case ATTR_ROOT:
-	case ATTR_EA_INFO:
-		return true;
-	default:
-		de = ntfs_query_def(sbi, type);
-		if (de && (de->flags & NTFS_ATTR_MUST_BE_RESIDENT))
-			return true;
-		return false;
-	}
-}
-
 /*
  * attr_load_runs - Load all runs stored in @attr.
  */
--
2.17.1


