Received: from exchange.fintech.ru (e10edge.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4EA8478
	for <ntfs3@lists.linux.dev>; Sun, 27 Aug 2023 16:51:11 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sun, 27 Aug
 2023 19:49:54 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sun, 27 Aug
 2023 19:49:54 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>,
	<syzbot+9d014e6e0df70d97c103@syzkaller.appspotmail.com>
Subject: [PATCH] fs: ntfs3: fix possible NULL-ptr-deref in ni_readpage_cmpr()
Date: Sun, 27 Aug 2023 09:49:44 -0700
Message-ID: <20230827164944.52560-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Syzkaller identified a possible issue with calling unlock_page() for
pages that have not been correctly allocated by
find_or_create_page(), leading to possible NULL pointer dereferences
among other issues.

Specifically, in case of an error with aforementioned
find_or_create_page() function due to memory issues,
ni_readpage_cmpr() attempts to erroneously unlock and release all
elements of 'pages'.

This patch ensures that we only deal with the pages successfully
allocated with calls to find_or_create_page().

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: syzbot+9d014e6e0df70d97c103@syzkaller.appspotmail.com
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 fs/ntfs3/frecord.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 16bd9faa2d28..9789b2ac7e2d 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2095,7 +2095,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct page *page)
 	struct page **pages = NULL; /* Array of at most 16 pages. stack? */
 	u8 frame_bits;
 	CLST frame;
-	u32 i, idx, frame_size, pages_per_frame;
+	u32 i, idx, frame_size, pages_per_frame, pages_created = 0;
 	gfp_t gfp_mask;
 	struct page *pg;
 
@@ -2138,6 +2138,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct page *page)
 			goto out1;
 		}
 		pages[i] = pg;
+		pages_created++;
 	}
 
 	err = ni_read_frame(ni, frame_vbo, pages, pages_per_frame);
@@ -2146,7 +2147,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct page *page)
 	if (err)
 		SetPageError(page);
 
-	for (i = 0; i < pages_per_frame; i++) {
+	for (i = 0; i < pages_created; i++) {
 		pg = pages[i];
 		if (i == idx)
 			continue;
-- 
2.25.1

