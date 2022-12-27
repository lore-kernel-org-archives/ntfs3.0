Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BCE8495
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C60C433F1;
	Tue, 27 Dec 2022 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173197;
	bh=qeWTeD/XppDAMiiK9eXDs2xY/co0C3oVOYqMqTPGd3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=foDesreOFqyA5p332JWYiij0tb72THHUzmK3Ff8UNZmKvsoi7+J5qU2VBLclO+RD/
	 QS24DhjDt1vYLOYexh7e2wg8GLMbxhIGH7bl5ugxTtIwgsMszw+9texB0R2YKSmj5g
	 A9YmoXmgVwLqb/IRUIwTS4JGZdUdR/mRL2mDfkCnETlCu4lLVkA6HWqcCsIErylNkW
	 zbwoqgsHFKTIGNym+rEFP3i81fUhOyGmN9V1gWEzGUpdZ6H2dWbscNYrsqRoF3mRMV
	 GMcNXdOu8g1Q+liSk06uCxJ0ZXWhiq8wnAmFT6GQ7exLFTqlO1pzsa1727S0aNzwNO
	 ibSpvabWJxMYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yin Xiujiang <yinxiujiang@kylinos.cn>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Sasha Levin <sashal@kernel.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 18/28] fs/ntfs3: Fix slab-out-of-bounds in r_page
Date: Tue, 27 Dec 2022 15:32:39 -0500
Message-Id: <20221227203249.1213526-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203249.1213526-1-sashal@kernel.org>
References: <20221227203249.1213526-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Yin Xiujiang <yinxiujiang@kylinos.cn>

[ Upstream commit ecfbd57cf9c5ca225184ae266ce44ae473792132 ]

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
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ntfs3/fslog.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index a85f5411aa74..c662d2a51907 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -1132,7 +1132,7 @@ static int read_log_page(struct ntfs_log *log, u32 vbo,
 		return -EINVAL;
 
 	if (!*buffer) {
-		to_free = kmalloc(bytes, GFP_NOFS);
+		to_free = kmalloc(log->page_size, GFP_NOFS);
 		if (!to_free)
 			return -ENOMEM;
 		*buffer = to_free;
@@ -1180,10 +1180,7 @@ static int log_read_rst(struct ntfs_log *log, u32 l_size, bool first,
 			struct restart_info *info)
 {
 	u32 skip, vbo;
-	struct RESTART_HDR *r_page = kmalloc(DefaultLogPageSize, GFP_NOFS);
-
-	if (!r_page)
-		return -ENOMEM;
+	struct RESTART_HDR *r_page = NULL;
 
 	/* Determine which restart area we are looking for. */
 	if (first) {
@@ -1197,7 +1194,6 @@ static int log_read_rst(struct ntfs_log *log, u32 l_size, bool first,
 	/* Loop continuously until we succeed. */
 	for (; vbo < l_size; vbo = 2 * vbo + skip, skip = 0) {
 		bool usa_error;
-		u32 sys_page_size;
 		bool brst, bchk;
 		struct RESTART_AREA *ra;
 
@@ -1251,24 +1247,6 @@ static int log_read_rst(struct ntfs_log *log, u32 l_size, bool first,
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
2.35.1

