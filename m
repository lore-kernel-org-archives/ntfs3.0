Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 07C7463CB
	for <ntfs3@lists.linux.dev>; Mon, 25 Sep 2023 04:50:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id EE2B96046F03E;
	Mon, 25 Sep 2023 12:48:23 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: almaz.alexandrovich@paragon-software.com
Cc: Su Hui <suhui@nfschina.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] fs/ntfs3: Avoid possible memory leak
Date: Mon, 25 Sep 2023 12:48:07 +0800
Message-Id: <20230925044807.92037-2-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230925044807.92037-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smatch warn:
fs/ntfs3/fslog.c:2172 last_log_lsn() warn: possible memory leak of 'page_bufs'
Jump to label 'out' to free 'page_bufs' and is more consistent with
other code.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/ntfs3/fslog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 12f28cdf5c83..98ccb6650858 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2168,8 +2168,10 @@ static int last_log_lsn(struct ntfs_log *log)
 
 			if (!page) {
 				page = kmalloc(log->page_size, GFP_NOFS);
-				if (!page)
-					return -ENOMEM;
+				if (!page) {
+					err = -ENOMEM;
+					goto out;
+				}
 			}
 
 			/*
-- 
2.30.2

