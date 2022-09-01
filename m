Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD25946A1
	for <ntfs3@lists.linux.dev>; Thu,  1 Sep 2022 13:29:11 +0000 (UTC)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJM9d6LJkzlWcl;
	Thu,  1 Sep 2022 21:20:37 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 1 Sep
 2022 21:24:03 +0800
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
Subject: [PATCH v2 07/14] ntfs3: replace ll_rw_block()
Date: Thu, 1 Sep 2022 21:34:58 +0800
Message-ID: <20220901133505.2510834-8-yi.zhang@huawei.com>
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
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in
ntfs_get_block_vbo().

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ntfs3/inode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 51363d4e8636..cadbfa111539 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -630,12 +630,9 @@ static noinline int ntfs_get_block_vbo(struct inode *inode, u64 vbo,
 			bh->b_size = block_size;
 			off = vbo & (PAGE_SIZE - 1);
 			set_bh_page(bh, page, off);
-			ll_rw_block(REQ_OP_READ, 1, &bh);
-			wait_on_buffer(bh);
-			if (!buffer_uptodate(bh)) {
-				err = -EIO;
+			err = bh_read(bh, 0);
+			if (err < 0)
 				goto out;
-			}
 			zero_user_segment(page, off + voff, off + block_size);
 		}
 	}
-- 
2.31.1

