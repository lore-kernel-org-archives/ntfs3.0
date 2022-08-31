Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43565D
	for <ntfs3@lists.linux.dev>; Wed, 31 Aug 2022 07:10:14 +0000 (UTC)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHZvc3L8HzYcnn;
	Wed, 31 Aug 2022 15:05:48 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:11 +0800
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
Subject: [PATCH 11/14] ufs: replace ll_rw_block()
Date: Wed, 31 Aug 2022 15:21:08 +0800
Message-ID: <20220831072111.3569680-12-yi.zhang@huawei.com>
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
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in ufs.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ufs/balloc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
index bd810d8239f2..bbc2159eece4 100644
--- a/fs/ufs/balloc.c
+++ b/fs/ufs/balloc.c
@@ -296,9 +296,7 @@ static void ufs_change_blocknr(struct inode *inode, sector_t beg,
 			if (!buffer_mapped(bh))
 					map_bh(bh, inode->i_sb, oldb + pos);
 			if (!buffer_uptodate(bh)) {
-				ll_rw_block(REQ_OP_READ, 1, &bh);
-				wait_on_buffer(bh);
-				if (!buffer_uptodate(bh)) {
+				if (bh_read(bh, 0)) {
 					ufs_error(inode->i_sb, __func__,
 						  "read of block failed\n");
 					break;
-- 
2.31.1

