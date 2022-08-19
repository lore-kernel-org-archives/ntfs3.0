Received: from mx5.cs.washington.edu (mx5.cs.washington.edu [128.208.2.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24597B
	for <ntfs3@lists.linux.dev>; Fri, 19 Aug 2022 06:05:07 +0000 (UTC)
Received: from mx5.cs.washington.edu (localhost [IPv6:0:0:0:0:0:0:0:1])
	by mx5.cs.washington.edu (8.17.1/8.17.1/1.26) with ESMTP id 27J5pRt8955317;
	Thu, 18 Aug 2022 22:51:27 -0700
Received: from attu6.cs.washington.edu (attu6.cs.washington.edu [IPv6:2607:4000:200:10:0:0:0:87])
	(authenticated bits=128)
	by mx5.cs.washington.edu (8.17.1/8.17.1/1.26) with ESMTPSA id 27J5pQdb955313
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 22:51:26 -0700
Received: from attu6.cs.washington.edu (localhost [127.0.0.1])
	by attu6.cs.washington.edu (8.15.2/8.15.2/1.23) with ESMTP id 27J5pQKj2408923;
	Thu, 18 Aug 2022 22:51:26 -0700
Received: (from klee33@localhost)
	by attu6.cs.washington.edu (8.15.2/8.15.2/Submit/1.2) id 27J5pPa12408922;
	Thu, 18 Aug 2022 22:51:25 -0700
From: Kenneth Lee <klee33@uw.edu>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, Kenneth Lee <klee33@uw.edu>
Subject: [PATCH] fs/ntfs3: Use kmalloc_array for allocating multiple elements
Date: Thu, 18 Aug 2022 22:51:17 -0700
Message-Id: <20220819055117.2408841-1-klee33@uw.edu>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prefer using kmalloc_array(a, b) over kmalloc(a * b) as this
improves semantics since kmalloc is intended for allocating an
array of memory.

Signed-off-by: Kenneth Lee <klee33@uw.edu>
---
 fs/ntfs3/bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 5d44ceac855b..1675c9a69788 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1324,7 +1324,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 		new_last = wbits;
 
 	if (new_wnd != wnd->nwnd) {
-		new_free = kmalloc(new_wnd * sizeof(u16), GFP_NOFS);
+		new_free = kmalloc_array(new_wnd, sizeof(u16), GFP_NOFS);
 		if (!new_free)
 			return -ENOMEM;
 
-- 
2.31.1

