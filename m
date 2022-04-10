Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC5780F
	for <ntfs3@lists.linux.dev>; Mon, 18 Apr 2022 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=A2qoH
	N7hzPLj4SIcPvTPwbr4snEnjiy4yHtNyH08AHA=; b=QRO/IbZGaT/nxzM195Oba
	9h57xm6cO77BtHCnIcO/hpAZqZPauvBqwBnaDnftaFs7gVGIs+WMFGyuNBEqUEoa
	MAyjDRv3o9YUsKfN79zenQz4x5eFTCPK4LrxSTMFAykEFjikesz17wI/RoBPyEEf
	w54AI+8D9Wj/j3kScI+ZoQ=
Received: from localhost.localdomain.localdomain (unknown [115.197.34.188])
	by smtp12 (Coremail) with SMTP id EMCowAAHfioGaF1iy4RMAQ--.2335S2;
	Mon, 18 Apr 2022 21:30:47 +0800 (CST)
From: chinayanlei2002@163.com
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	Yan Lei <yan_lei@dahuatech.com>
Subject: [PATCH] fs: ntfs3: fix Using uninitialized value n when calling indx_read
Date: Sun, 10 Apr 2022 14:09:29 +0800
Message-Id: <20220410060929.4027-1-chinayanlei2002@163.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:EMCowAAHfioGaF1iy4RMAQ--.2335S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUrhL0UUUUU
X-Originating-IP: [115.197.34.188]
X-CM-SenderInfo: xfkl0tx1dqzvblsqiji6rwjhhfrp/xtbBEAfmLFUMZ3e6wwAAst

From: Yan Lei <yan_lei@dahuatech.com>

Signed-off-by: Yan Lei <yan_lei@dahuatech.com>
---
 fs/ntfs3/index.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 6f81e3a49..76ebea253 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1994,7 +1994,7 @@ static int indx_free_children(struct ntfs_index *indx, struct ntfs_inode *ni,
 			      const struct NTFS_DE *e, bool trim)
 {
 	int err;
-	struct indx_node *n;
+	struct indx_node *n = NULL;
 	struct INDEX_HDR *hdr;
 	CLST vbn = de_get_vbn(e);
 	size_t i;
-- 
2.30.0

