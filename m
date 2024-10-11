Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB42209F49
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631559; cv=none; b=cq0Om+OVO45nrMHi6e6OsS+B/+Dqe8mtoyNlF+v5uf5gD1xcytX5Xh+DiALC6/cQzVylor85LLNvZKxxqEZtu5g1ih6A94ZRV4oJX5/pYxYvfhIKITaSiYChmiNnKckLP7wufXhmRuBwfhLZfxCVQ/SROSqWxNO2TZp4RbCoV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631559; c=relaxed/simple;
	bh=t8M2loINZwdIFJftxePgDHY3slIkf3BcoZuyuBpygks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NZFD2NJhLHrW4lrPrSdLAuUM1+gG9vFPfbwUWSxsTjQBNpKBe3kO+UBhAaa2/TlMCRXxkPCAbFRS0xbUuXIWtIwVEegMeks6nN552cq2zilAhisHgSeiVzP8jmT9j0pWiSbH626yVyDsXRGT1kzGVeX7/SjN7mCkj/4KVFGTX0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XPyp81Mc6z4f3mJ2
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D70431A0568
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:53 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
	by APP4 (Coremail) with SMTP id gCh0CgCn28f_0ghn744dDw--.8916S7;
	Fri, 11 Oct 2024 15:25:53 +0800 (CST)
From: Ye Bin <yebin@huaweicloud.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: yebin10@huawei.com,
	zhangxiaoxu5@huawei.com
Subject: [PATCH 3/3] fs/ntfs3: fix 'proc_info_root' leak when init ntfs failed
Date: Fri, 11 Oct 2024 15:40:25 +0800
Message-Id: <20241011074025.3811053-4-yebin@huaweicloud.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241011074025.3811053-1-yebin@huaweicloud.com>
References: <20241011074025.3811053-1-yebin@huaweicloud.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCn28f_0ghn744dDw--.8916S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4fWF4xWryxuw4rtrWUArb_yoW8XFy8pa
	9xuwsrJr4rJrW5Can7tFWY9FyxWFWkWw43trn7C347t3Wvqw1xJF4Fk34F9Fy09rWrA34F
	qF45Ww45W345ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jec_-UUUUU=
X-CM-SenderInfo: p1hex046kxt4xhlfz01xgou0bp/

From: Ye Bin <yebin10@huawei.com>

There's a issue as follows:
  proc_dir_entry 'fs/ntfs3' already registered
  WARNING: CPU: 3 PID: 9788 at fs/proc/generic.c:375 proc_register+0x418/0x590
  Modules linked in: ntfs3(E+)
  Call Trace:
   <TASK>
   _proc_mkdir+0x165/0x200
   init_ntfs_fs+0x36/0xf90 [ntfs3]
   do_one_initcall+0x115/0x6c0
   do_init_module+0x253/0x760
   load_module+0x55f2/0x6c80
   init_module_from_file+0xd2/0x130
   __x64_sys_finit_module+0xbf/0x130
   do_syscall_64+0x72/0x1c0

Above issue happens as missing destroy 'proc_info_root' when error
happens after create 'proc_info_root' in init_ntfs_fs().
So destroy 'proc_info_root' in error path in init_ntfs_fs().

Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label")
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 fs/ntfs3/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index cf1fcced7304..bc43603c22af 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1880,7 +1880,7 @@ static int __init init_ntfs_fs(void)
 
 	err = ntfs3_init_bitmap();
 	if (err)
-		return err;
+		goto out2;
 
 	ntfs_inode_cachep = kmem_cache_create(
 		"ntfs_inode_cache", sizeof(struct ntfs_inode), 0,
@@ -1900,6 +1900,8 @@ static int __init init_ntfs_fs(void)
 	kmem_cache_destroy(ntfs_inode_cachep);
 out1:
 	ntfs3_exit_bitmap();
+out2:
+	ntfs_remove_proc_root();
 	return err;
 }
 
-- 
2.31.1

