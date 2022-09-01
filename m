Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF8F33D6
	for <ntfs3@lists.linux.dev>; Thu,  1 Sep 2022 13:29:09 +0000 (UTC)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJM8S3QJqzYd5S;
	Thu,  1 Sep 2022 21:19:36 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:24:00 +0800
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
Subject: [PATCH v2 04/14] gfs2: replace ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:55 +0800
Message-ID: <20220901133505.2510834-5-yi.zhang@huawei.com>
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

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that always submitting read IO if the buffer has been locked,
so stop using it. We also switch to new bh_readahead() helper for the
readahead path.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/gfs2/meta_io.c | 7 ++-----
 fs/gfs2/quota.c   | 8 ++------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 7e70e0ba5a6c..6ed728aae9a5 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -525,8 +525,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
 
 	if (buffer_uptodate(first_bh))
 		goto out;
-	if (!buffer_locked(first_bh))
-		ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &first_bh);
+	bh_read_nowait(first_bh, REQ_META | REQ_PRIO);
 
 	dblock++;
 	extlen--;
@@ -534,9 +533,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
 	while (extlen) {
 		bh = gfs2_getbuf(gl, dblock, CREATE);
 
-		if (!buffer_uptodate(bh) && !buffer_locked(bh))
-			ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
-				    REQ_PRIO, 1, &bh);
+		bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
 		brelse(bh);
 		dblock++;
 		extlen--;
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index f201eaf59d0d..1ed17226d9ed 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -745,12 +745,8 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
 		}
 		if (PageUptodate(page))
 			set_buffer_uptodate(bh);
-		if (!buffer_uptodate(bh)) {
-			ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
-			wait_on_buffer(bh);
-			if (!buffer_uptodate(bh))
-				goto unlock_out;
-		}
+		if (bh_read(bh, REQ_META | REQ_PRIO) < 0)
+			goto unlock_out;
 		if (gfs2_is_jdata(ip))
 			gfs2_trans_add_data(ip->i_gl, bh);
 		else
-- 
2.31.1

