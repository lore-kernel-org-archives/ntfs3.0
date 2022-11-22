Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7DC10FC
	for <ntfs3@lists.linux.dev>; Tue, 22 Nov 2022 09:28:26 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NGf3K2pZLzqSQ0;
	Tue, 22 Nov 2022 17:24:29 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 17:28:23 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 17:28:23 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <chenzhongjin@huawei.com>, <kari.argillander@gmail.com>,
	<almaz.alexandrovich@paragon-software.com>
Subject: [PATCH] fs/ntfs3: Fix leaked mount_options if fill_super failed
Date: Tue, 22 Nov 2022 17:25:18 +0800
Message-ID: <20221122092518.231347-1-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected

'9b75450d6c58 ("fs/ntfs3: Fix memory leak if fill_super failed")'
Previous patch fixed leaked sbi when fill_super failed but forgot to put
mount_options and left it leaked as kmemleak reported:

unreferenced object 0xffff888107c353c0 (size 32):
  backtrace:
    [<00000000cf2c8c32>] kmalloc_trace+0x27/0x110
    [<000000000184a864>] ntfs_init_fs_context+0x4c/0x540 [ntfs3]
    [<000000008ded85aa>] alloc_fs_context+0x50e/0x940
    [<00000000c225e601>] path_mount+0x747/0x1930
    [<000000007bf15a5f>] do_mount+0xf3/0x110
    ...
unreferenced object 0xffff888101fdc2d0 (size 8):
  backtrace:
    [<00000000d0cba437>] __kmalloc_node_track_caller+0x4c/0x1c0
    [<00000000923513f8>] kmemdup_nul+0x37/0xb0
    [<000000007a9b98ed>] vfs_parse_fs_string+0xc5/0x150
    [<00000000afbd0594>] generic_parse_monolithic+0x140/0x1c0
    [<00000000e97e814e>] path_mount+0xf09/0x1930
    [<000000007bf15a5f>] do_mount+0xf3/0x110
    ...

Fixes: 610f8f5a7baf ("fs/ntfs3: Use new api for mounting")
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 fs/ntfs3/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 47012c9bf505..c0e45f170701 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1281,6 +1281,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	 * Free resources here.
 	 * ntfs_fs_free will be called with fc->s_fs_info = NULL
 	 */
+	put_mount_options(sbi->options);
 	put_ntfs(sbi);
 	sb->s_fs_info = NULL;
 
-- 
2.17.1

