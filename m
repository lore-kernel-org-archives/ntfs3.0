Received: from out199-15.us.a.mail.aliyun.com (out199-15.us.a.mail.aliyun.com [47.90.199.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29623A0
	for <ntfs3@lists.linux.dev>; Thu, 21 Jul 2022 03:34:39 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VJzWb5G_1658373523;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VJzWb5G_1658373523)
          by smtp.aliyun-inc.com;
          Thu, 21 Jul 2022 11:18:52 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] fs/ntfs3: Remove unused function wnd_bits
Date: Thu, 21 Jul 2022 11:18:41 +0800
Message-Id: <20220721031841.24571-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the function wnd_bits is defined but not called in any file, it is
a useless function, and we delete it in view of the brevity of the code.

Remove some warnings found by running scripts/kernel-doc, which is
caused by using 'make W=1'.

fs/ntfs3/bitmap.c:54:19: warning: unused function 'wnd_bits' [-Wunused-function].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 fs/ntfs3/bitmap.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index e3b5680fd516..177c5bc53373 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -51,11 +51,6 @@ void ntfs3_exit_bitmap(void)
 	kmem_cache_destroy(ntfs_enode_cachep);
 }
 
-static inline u32 wnd_bits(const struct wnd_bitmap *wnd, size_t i)
-{
-	return i + 1 == wnd->nwnd ? wnd->bits_last : wnd->sb->s_blocksize * 8;
-}
-
 /*
  * wnd_scan
  *
-- 
2.20.1.7.g153144c

