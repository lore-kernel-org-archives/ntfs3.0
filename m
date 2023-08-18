Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F3D17FE9
	for <ntfs3@lists.linux.dev>; Fri, 18 Aug 2023 09:17:46 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=mengferry@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Vq1y0ap_1692350254;
Received: from j66c13357.sqa.eu95.tbsite.net(mailfrom:mengferry@linux.alibaba.com fp:SMTPD_---0Vq1y0ap_1692350254)
          by smtp.aliyun-inc.com;
          Fri, 18 Aug 2023 17:17:37 +0800
From: Ferry Meng <mengferry@linux.alibaba.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>,
	Ferry Meng <mengferry@linux.alibaba.com>
Subject: [PATCH] ntfs: fix potential uninitialized symbol err
Date: Fri, 18 Aug 2023 17:17:15 +0800
Message-Id: <20230818091715.104037-1-mengferry@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix smatch warning:

fs/ntfs3/attrib.c:1503 attr_wof_frame_info() error: uninitialized symbol
'err'.

Signed-off-by: Ferry Meng <mengferry@linux.alibaba.com>

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index a9d82bbb4729..f027c35c7f5f 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1372,7 +1372,7 @@ int attr_wof_frame_info(struct ntfs_inode *ni, struct ATTRIB *attr,
 	u8 bytes_per_off;
 	char *addr;
 	struct page *page;
-	int i, err;
+	int i, err = 0;
 	__le32 *off32;
 	__le64 *off64;
 
-- 
2.19.1.6.gb485710b

