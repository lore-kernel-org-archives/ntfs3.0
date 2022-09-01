Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7A33D9
	for <ntfs3@lists.linux.dev>; Thu,  1 Sep 2022 13:24:13 +0000 (UTC)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJM9T646DzkWrK;
	Thu,  1 Sep 2022 21:20:29 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:24:09 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
	<ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
	<reiserfs-devel@vger.kernel.org>, <jack@suse.cz>
CC: <tytso@mit.edu>, <akpm@linux-foundation.org>, <axboe@kernel.dk>,
	<viro@zeniv.linux.org.uk>, <rpeterso@redhat.com>, <agruenba@redhat.com>,
	<almaz.alexandrovich@paragon-software.com>, <mark@fasheh.com>,
	<dushistov@mail.ru>, <hch@infradead.org>, <yi.zhang@huawei.com>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 14/14] fs/buffer: remove bh_submit_read() helper
Date: Thu, 1 Sep 2022 21:35:05 +0800
Message-ID: <20220901133505.2510834-15-yi.zhang@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220901133505.2510834-1-yi.zhang@huawei.com>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected

bh_submit_read() has no user anymore, just remove it.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/buffer.c                 | 25 -------------------------
 include/linux/buffer_head.h |  1 -
 2 files changed, 26 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 2cccc7586b99..b4c9fff3ab6c 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3025,31 +3025,6 @@ void __bh_read_batch(int nr, struct buffer_head *bhs[],
 }
 EXPORT_SYMBOL(__bh_read_batch);
 
-/**
- * bh_submit_read - Submit a locked buffer for reading
- * @bh: struct buffer_head
- *
- * Returns zero on success and -EIO on error.
- */
-int bh_submit_read(struct buffer_head *bh)
-{
-	BUG_ON(!buffer_locked(bh));
-
-	if (buffer_uptodate(bh)) {
-		unlock_buffer(bh);
-		return 0;
-	}
-
-	get_bh(bh);
-	bh->b_end_io = end_buffer_read_sync;
-	submit_bh(REQ_OP_READ, bh);
-	wait_on_buffer(bh);
-	if (buffer_uptodate(bh))
-		return 0;
-	return -EIO;
-}
-EXPORT_SYMBOL(bh_submit_read);
-
 void __init buffer_init(void)
 {
 	unsigned long nrpages;
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index b415d8bc2a09..9b6556d3f110 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -230,7 +230,6 @@ int submit_bh(blk_opf_t, struct buffer_head *);
 void write_boundary_block(struct block_device *bdev,
 			sector_t bblock, unsigned blocksize);
 int bh_uptodate_or_lock(struct buffer_head *bh);
-int bh_submit_read(struct buffer_head *bh);
 int __bh_read(struct buffer_head *bh, blk_opf_t op_flags, bool wait);
 void __bh_read_batch(int nr, struct buffer_head *bhs[],
 		     blk_opf_t op_flags, bool force_lock);
-- 
2.31.1

