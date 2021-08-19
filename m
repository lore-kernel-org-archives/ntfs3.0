Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437342FAE
	for <ntfs3@lists.linux.dev>; Thu, 19 Aug 2021 08:29:53 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Uk-AU5A_1629361442;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Uk-AU5A_1629361442)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 19 Aug 2021 16:24:05 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: almaz.alexandrovich@paragon-software.com
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] fs/ntfs3: Remove unused including <linux/version.h>
Date: Thu, 19 Aug 2021 16:23:37 +0800
Message-Id: <1629361417-94657-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>

Eliminate the follow versioncheck warning:

./fs/ntfs3/inode.c: 16 linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 fs/ntfs3/inode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index bf51e29..bb01f1b 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -13,7 +13,6 @@
 #include <linux/namei.h>
 #include <linux/nls.h>
 #include <linux/uio.h>
-#include <linux/version.h>
 #include <linux/writeback.h>
 
 #include "debug.h"
-- 
1.8.3.1

