Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F9138C
	for <ntfs3@lists.linux.dev>; Wed,  7 Dec 2022 09:46:35 +0000 (UTC)
Received: from kwepemm600020.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NRskx00gYzqSdy;
	Wed,  7 Dec 2022 17:42:16 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600020.china.huawei.com (7.193.23.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Dec 2022 17:46:26 +0800
From: Peng Zhang <zhangpeng362@huawei.com>
To: <almaz.alexandrovich@paragon-software.com>, <kari.argillander@gmail.com>,
	<paskripkin@gmail.com>, <jack@suse.cz>, <yi.zhang@huawei.com>, <hch@lst.de>,
	<akpm@linux-foundation.org>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>, ZhangPeng
	<zhangpeng362@huawei.com>,
	<syzbot+d882d57193079e379309@syzkaller.appspotmail.com>
Subject: [PATCH] fs/ntfs3: Fix OOB read in indx_insert_into_buffer
Date: Wed, 7 Dec 2022 09:46:10 +0000
Message-ID: <20221207094610.998485-1-zhangpeng362@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600020.china.huawei.com (7.193.23.147)
X-CFilter-Loop: Reflected

From: ZhangPeng <zhangpeng362@huawei.com>

Syzbot reported a OOB read bug:

BUG: KASAN: slab-out-of-bounds in indx_insert_into_buffer+0xaa3/0x13b0
fs/ntfs3/index.c:1755
Read of size 17168 at addr ffff8880255e06c0 by task syz-executor308/3630

Call Trace:
 <TASK>
 memmove+0x25/0x60 mm/kasan/shadow.c:54
 indx_insert_into_buffer+0xaa3/0x13b0 fs/ntfs3/index.c:1755
 indx_insert_entry+0x446/0x6b0 fs/ntfs3/index.c:1863
 ntfs_create_inode+0x1d3f/0x35c0 fs/ntfs3/inode.c:1548
 ntfs_create+0x3e/0x60 fs/ntfs3/namei.c:100
 lookup_open fs/namei.c:3413 [inline]

If the member struct INDEX_BUFFER *index of struct indx_node is
incorrect, that is, the value of __le32 used is greater than the value
of __le32 total in struct INDEX_HDR. Therefore, OOB read occurs when
memmove is called in indx_insert_into_buffer().
Fix this by adding a check in hdr_find_e().

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-by: syzbot+d882d57193079e379309@syzkaller.appspotmail.com
Signed-off-by: ZhangPeng <zhangpeng362@huawei.com>
---
 fs/ntfs3/index.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 440328147e7e..28af0a5afbf2 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -679,9 +679,13 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	u32 e_size, e_key_len;
 	u32 end = le32_to_cpu(hdr->used);
 	u32 off = le32_to_cpu(hdr->de_off);
+	u32 total = le32_to_cpu(hdr->total);
 	u16 offs[128];
 
 fill_table:
+	if (end > total)
+		return NULL;
+
 	if (off + sizeof(struct NTFS_DE) > end)
 		return NULL;
 
-- 
2.25.1

