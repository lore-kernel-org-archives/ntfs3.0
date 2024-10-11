Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF958209F47
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631558; cv=none; b=ZTyfgYntOvHMi19A88JlhDAv4izYRpgTyeV1Ju1VjzBDarEXmvnO+lc0A+sWX35XKfVrsvBlLZvcimJbirDOfXjDaf/i8mIeauHxA/Eiccm/ZO3hZiMJcQmsXEnrNpuMY6a6JPIxd9pUS0aGbnbnHGwZhu71L1axuq14gEkuDgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631558; c=relaxed/simple;
	bh=a8zhmBO+z5AG3cBUQAa2IMmuvSwmmTj2YJx9HBsg1as=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VjqTYPQOXIwzJG0BEIc3OEi5Q8Cd4Vzf932LGrKqzfXbHngfDYZSaLT2gaLyJoTHt0cV//NEclH5Uco9yc2yPZHayRKP37gJtcqjr1OFfecJXLepqfo/TnitMbXZhelshpBfQn0EELfJQEcJoeJ/U2lZH5Daro8wT0kHzHFEpsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XPyp76kNRz4f3m7D
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 9C7731A0A22
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:53 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
	by APP4 (Coremail) with SMTP id gCh0CgCn28f_0ghn744dDw--.8916S6;
	Fri, 11 Oct 2024 15:25:53 +0800 (CST)
From: Ye Bin <yebin@huaweicloud.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: yebin10@huawei.com,
	zhangxiaoxu5@huawei.com
Subject: [PATCH 2/3] fs/ntfs3: factor out ntfs_{create/remove}_proc_root()
Date: Fri, 11 Oct 2024 15:40:24 +0800
Message-Id: <20241011074025.3811053-3-yebin@huaweicloud.com>
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
X-CM-TRANSID:gCh0CgCn28f_0ghn744dDw--.8916S6
X-Coremail-Antispam: 1UD129KBjvJXoW7urWkXr15Cw1kGw48GrykZrb_yoW8CrW8pa
	4fZr4rGw48GFyxJa93trs7CryfWF1kW34UtrnrCw1xXw10y34xXFZYkay0yryvvFW8JF40
	vw48Xrs3C3y8u3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07URpBfUUUUU=
X-CM-SenderInfo: p1hex046kxt4xhlfz01xgou0bp/

From: Ye Bin <yebin10@huawei.com>

Introduce ntfs_create_proc_root()/ntfs_remove_proc_root() for
create/remove "/proc/fs/ntfs3".

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 fs/ntfs3/super.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 660f11c6259c..cf1fcced7304 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -581,9 +581,24 @@ static void ntfs_remove_procdir(struct super_block *sb)
 	remove_proc_entry(sb->s_id, proc_info_root);
 	sbi->procdir = NULL;
 }
+
+static void ntfs_create_proc_root(void)
+{
+	proc_info_root = proc_mkdir("fs/ntfs3", NULL);
+}
+
+static void ntfs_remove_proc_root(void)
+{
+	if (proc_info_root) {
+		remove_proc_entry("fs/ntfs3", NULL);
+		proc_info_root = NULL;
+	}
+}
 #else
 static void ntfs_create_procdir(struct super_block *sb) {}
 static void ntfs_remove_procdir(struct super_block *sb) {}
+static void ntfs_create_proc_root(void) {}
+static void ntfs_remove_proc_root(void) {}
 #endif
 
 static struct kmem_cache *ntfs_inode_cachep;
@@ -1861,10 +1876,7 @@ static int __init init_ntfs_fs(void)
 	if (IS_ENABLED(CONFIG_NTFS3_LZX_XPRESS))
 		pr_info("ntfs3: Read-only LZX/Xpress compression included\n");
 
-#ifdef CONFIG_PROC_FS
-	/* Create "/proc/fs/ntfs3" */
-	proc_info_root = proc_mkdir("fs/ntfs3", NULL);
-#endif
+	ntfs_create_proc_root();
 
 	err = ntfs3_init_bitmap();
 	if (err)
@@ -1898,11 +1910,7 @@ static void __exit exit_ntfs_fs(void)
 	unregister_filesystem(&ntfs_fs_type);
 	unregister_as_ntfs_legacy();
 	ntfs3_exit_bitmap();
-
-#ifdef CONFIG_PROC_FS
-	if (proc_info_root)
-		remove_proc_entry("fs/ntfs3", NULL);
-#endif
+	ntfs_remove_proc_root();
 }
 
 MODULE_LICENSE("GPL");
-- 
2.31.1

