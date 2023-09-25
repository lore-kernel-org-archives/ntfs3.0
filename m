Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7785C23D2
	for <ntfs3@lists.linux.dev>; Mon, 25 Sep 2023 04:50:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id E31A36047A8C6;
	Mon, 25 Sep 2023 12:48:19 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: almaz.alexandrovich@paragon-software.com
Cc: Su Hui <suhui@nfschina.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] fs/ntfs3: Avoid possible NULL dereference
Date: Mon, 25 Sep 2023 12:48:06 +0800
Message-Id: <20230925044807.92037-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smatch error:
fs/ntfs3/attrib.c:1826 attr_allocate_frame() error:
we previously assumed 'attr_b' could be null (see line 1739)

Return error code directly if 'attr_b' is NULL.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/ntfs3/attrib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index a9d82bbb4729..ebc934ac5cf5 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1737,8 +1737,7 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
 			attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
 					      0, NULL, &mi_b);
 			if (!attr_b) {
-				err = -ENOENT;
-				goto out;
+				return -ENOENT;
 			}
 
 			attr = attr_b;
-- 
2.30.2

