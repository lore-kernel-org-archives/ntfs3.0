Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF62C9D
	for <ntfs3@lists.linux.dev>; Fri, 17 Dec 2021 08:46:10 +0000 (UTC)
X-UUID: 9ebb265394f644a28082d8fa0cf33104-20211217
X-CPASD-INFO: ab51b6a6359040eda70f8bc932f74613@qrJvUY9oj2ZfVXt8g3OwnoFoYJZpjoO
	IdWyGZ2JmXVOVhH5xTWJsXVKBfG5QZWNdYVN_eGpQY19gZFB5i3-XblBgXoZgUZB3sKRvUZJkkQ==
X-CPASD-FEATURE: 0.0
X-CLOUD-ID: ab51b6a6359040eda70f8bc932f74613
X-CPASD-SUMMARY: SIP:-1,APTIP:-2.0,KEY:0.0,FROMBLOCK:1,EXT:0.0,OB:0.0,URL:-5,T
	VAL:184.0,ESV:0.0,ECOM:-5.0,ML:0.0,FD:1.0,CUTS:246.0,IP:-2.0,MAL:0.0,ATTNUM:0
	.0,PHF:-5.0,PHC:-5.0,SPF:4.0,EDMS:-3,IPLABEL:4488.0,FROMTO:0,AD:0,FFOB:0.0,CF
	OB:0.0,SPC:0.0,SIG:-5,AUF:98,DUF:27000,ACD:135,DCD:238,SL:0,AG:0,CFC:0.347,CF
	SR:0.061,UAT:0,RAF:0,VERSION:2.3.4
X-CPASD-ID: 9ebb265394f644a28082d8fa0cf33104-20211217
X-CPASD-BLOCK: 1001
X-CPASD-STAGE: 1, 1
X-UUID: 9ebb265394f644a28082d8fa0cf33104-20211217
X-User: yinxiujiang@kylinos.cn
Received: from localhost.localdomain [(118.26.139.139)] by nksmu.kylinos.cn
	(envelope-from <yinxiujiang@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1550983070; Fri, 17 Dec 2021 16:48:58 +0800
From: Yin Xiujiang <yinxiujiang@kylinos.cn>
To: thomas.kuehnel@avm.de,
	almaz.alexandrovich@paragon-software.com
Cc: kbuild-all@lists.01.org,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	n.schier@avm.de
Subject: [PATCH] Fix slab-out-of-bounds in r_page
Date: Fri, 17 Dec 2021 16:40:45 +0800
Message-Id: <20211217084045.363818-1-yinxiujiang@kylinos.cn>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When PAGE_SIZE is 64K, if read_log_page is called by log_read_rst for
the first time, the size of *buffer would be equal to
DefaultLogPageSize(4K).But for *buffer operations like memcpy,
if the memory area size(n) which being assigned to buffer is larger
than 4K (log->page_size(64K) or bytes(64K-page_off)), it will cause
an out of boundary error.
 Call trace:
  [...]
  kasan_report+0x44/0x130
  check_memory_region+0xf8/0x1a0
  memcpy+0xc8/0x100
  ntfs_read_run_nb+0x20c/0x460
  read_log_page+0xd0/0x1f4
  log_read_rst+0x110/0x75c
  log_replay+0x1e8/0x4aa0
  ntfs_loadlog_and_replay+0x290/0x2d0
  ntfs_fill_super+0x508/0xec0
  get_tree_bdev+0x1fc/0x34c
  [...]

Fix this by setting variable r_page to NULL in log_read_rst.

Signed-off-by: Yin Xiujiang <yinxiujiang@kylinos.cn>
---
 fs/ntfs3/fslog.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 06492f088d60..4fdb5bdfc2ee 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -1180,10 +1180,7 @@ static int log_read_rst(struct ntfs_log *log, u32 l_size, bool first,
 			struct restart_info *info)
 {
 	u32 skip, vbo;
-	struct RESTART_HDR *r_page = kmalloc(DefaultLogPageSize, GFP_NOFS);
-
-	if (!r_page)
-		return -ENOMEM;
+	struct RESTART_HDR *r_page = NULL;
 
 	memset(info, 0, sizeof(struct restart_info));
 
@@ -1199,7 +1196,6 @@ static int log_read_rst(struct ntfs_log *log, u32 l_size, bool first,
 	/* Loop continuously until we succeed. */
 	for (; vbo < l_size; vbo = 2 * vbo + skip, skip = 0) {
 		bool usa_error;
-		u32 sys_page_size;
 		bool brst, bchk;
 		struct RESTART_AREA *ra;
 
@@ -1253,24 +1249,6 @@ static int log_read_rst(struct ntfs_log *log, u32 l_size, bool first,
 			goto check_result;
 		}
 
-		/* Read the entire restart area. */
-		sys_page_size = le32_to_cpu(r_page->sys_page_size);
-		if (DefaultLogPageSize != sys_page_size) {
-			kfree(r_page);
-			r_page = kzalloc(sys_page_size, GFP_NOFS);
-			if (!r_page)
-				return -ENOMEM;
-
-			if (read_log_page(log, vbo,
-					  (struct RECORD_PAGE_HDR **)&r_page,
-					  &usa_error)) {
-				/* Ignore any errors. */
-				kfree(r_page);
-				r_page = NULL;
-				continue;
-			}
-		}
-
 		if (is_client_area_valid(r_page, usa_error)) {
 			info->valid_page = true;
 			ra = Add2Ptr(r_page, le16_to_cpu(r_page->ra_off));
-- 
2.30.0

