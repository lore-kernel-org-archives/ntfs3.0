Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC564C
	for <ntfs3@lists.linux.dev>; Wed, 31 Aug 2022 07:10:16 +0000 (UTC)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MHZwn4n54zlWct;
	Wed, 31 Aug 2022 15:06:49 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:13 +0800
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
Subject: [PATCH 13/14] ext2: replace bh_submit_read() helper with bh_read_locked()
Date: Wed, 31 Aug 2022 15:21:10 +0800
Message-ID: <20220831072111.3569680-14-yi.zhang@huawei.com>
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

bh_submit_read() is almost the same as bh_read_locked(), switch to use
bh_read_locked() in read_block_bitmap(), prepare remove the old one.

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ext2/balloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
index c17ccc19b938..548a1d607f5a 100644
--- a/fs/ext2/balloc.c
+++ b/fs/ext2/balloc.c
@@ -142,7 +142,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
 	if (likely(bh_uptodate_or_lock(bh)))
 		return bh;
 
-	if (bh_submit_read(bh) < 0) {
+	if (bh_read_locked(bh, 0) < 0) {
 		brelse(bh);
 		ext2_error(sb, __func__,
 			    "Cannot read block bitmap - "
-- 
2.31.1

