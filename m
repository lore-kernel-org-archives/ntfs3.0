Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1728F5
	for <ntfs3@lists.linux.dev>; Fri, 25 Nov 2022 10:22:11 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJW5s3fKTzbnhT;
	Fri, 25 Nov 2022 18:18:09 +0800 (CST)
Received: from kwepemm600020.china.huawei.com (7.193.23.147) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 25 Nov 2022 18:22:06 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600020.china.huawei.com (7.193.23.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 25 Nov 2022 18:22:05 +0800
From: Peng Zhang <zhangpeng362@huawei.com>
To: <almaz.alexandrovich@paragon-software.com>, <kari.argillander@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>, ZhangPeng
	<zhangpeng362@huawei.com>,
	<syzbot+a8f26a403c169b7593fe@syzkaller.appspotmail.com>
Subject: [PATCH] fs/ntfs3: Fix null-ptr-deref on inode->i_op in ntfs_lookup()
Date: Fri, 25 Nov 2022 10:21:59 +0000
Message-ID: <20221125102159.91591-1-zhangpeng362@huawei.com>
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

Syzbot reported a null-ptr-deref bug:

ntfs3: loop0: Different NTFS' sector size (1024) and media sector size
(512)
ntfs3: loop0: Mark volume as dirty due to NTFS errors
general protection fault, probably for non-canonical address
0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
RIP: 0010:d_flags_for_inode fs/dcache.c:1980 [inline]
RIP: 0010:__d_add+0x5ce/0x800 fs/dcache.c:2796
Call Trace:
 <TASK>
 d_splice_alias+0x122/0x3b0 fs/dcache.c:3191
 lookup_open fs/namei.c:3391 [inline]
 open_last_lookups fs/namei.c:3481 [inline]
 path_openat+0x10e6/0x2df0 fs/namei.c:3688
 do_filp_open+0x264/0x4f0 fs/namei.c:3718
 do_sys_openat2+0x124/0x4e0 fs/open.c:1310
 do_sys_open fs/open.c:1326 [inline]
 __do_sys_open fs/open.c:1334 [inline]
 __se_sys_open fs/open.c:1330 [inline]
 __x64_sys_open+0x221/0x270 fs/open.c:1330
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

If the MFT record of ntfs inode is not a base record, inode->i_op can be
NULL. And a null-ptr-deref may happen:

ntfs_lookup()
    dir_search_u() # inode->i_op is set to NULL
    d_splice_alias()
        __d_add()
            d_flags_for_inode() # inode->i_op->get_link null-ptr-deref

Fix this by adding a Check on inode->i_op before calling the
d_splice_alias() function.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: syzbot+a8f26a403c169b7593fe@syzkaller.appspotmail.com
Signed-off-by: ZhangPeng <zhangpeng362@huawei.com>
---
 fs/ntfs3/namei.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index bc22cc321a74..7760aedc0672 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -86,6 +86,16 @@ static struct dentry *ntfs_lookup(struct inode *dir, struct dentry *dentry,
 		__putname(uni);
 	}
 
+	/*
+	 * Check for a null pointer
+	 * If the MFT record of ntfs inode is not a base record, inode->i_op can be NULL.
+	 * This causes null pointer dereference in d_splice_alias().
+	 */
+	if (!IS_ERR(inode) && inode->i_op == NULL) {
+		iput(inode);
+		inode = ERR_PTR(-EINVAL);
+	}
+
 	return d_splice_alias(inode, dentry);
 }
 
-- 
2.25.1

