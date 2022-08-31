Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF12D65B
	for <ntfs3@lists.linux.dev>; Wed, 31 Aug 2022 07:10:12 +0000 (UTC)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MHZxk6Dx8znTvT;
	Wed, 31 Aug 2022 15:07:38 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:04 +0800
From: Zhang Yi <yi.zhang@huawei.com>
To: <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
	<ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
	<reiserfs-devel@vger.kernel.org>
CC: <jack@suse.cz>, <tytso@mit.edu>, <akpm@linux-foundation.org>,
	<axboe@kernel.dk>, <viro@zeniv.linux.org.uk>, <rpeterso@redhat.com>,
	<agruenba@redhat.com>, <almaz.alexandrovich@paragon-software.com>,
	<mark@fasheh.com>, <dushistov@mail.ru>, <hch@infradead.org>,
	<yi.zhang@huawei.com>, <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 04/14] gfs2: replace ll_rw_block()
Date: Wed, 31 Aug 2022 15:21:01 +0800
Message-ID: <20220831072111.3569680-5-yi.zhang@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220831072111.3569680-1-yi.zhang@huawei.com>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
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
 fs/gfs2/meta_io.c | 6 ++----
 fs/gfs2/quota.c   | 4 +---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 7e70e0ba5a6c..07e882aa7ebd 100644
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
@@ -535,8 +534,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
 		bh = gfs2_getbuf(gl, dblock, CREATE);
 
 		if (!buffer_uptodate(bh) && !buffer_locked(bh))
-			ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
-				    REQ_PRIO, 1, &bh);
+			bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
 		brelse(bh);
 		dblock++;
 		extlen--;
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index f201eaf59d0d..0c2ef4226aba 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -746,9 +746,7 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
 		if (PageUptodate(page))
 			set_buffer_uptodate(bh);
 		if (!buffer_uptodate(bh)) {
-			ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
-			wait_on_buffer(bh);
-			if (!buffer_uptodate(bh))
+			if (bh_read(bh, REQ_META | REQ_PRIO))
 				goto unlock_out;
 		}
 		if (gfs2_is_jdata(ip))
-- 
2.31.1

