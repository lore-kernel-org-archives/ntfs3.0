Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87D209F39
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631559; cv=none; b=EB75UupOql8brSYt6qGqLIXl7LEAWNb8YONSC9h95UDJy0XNBwNxzpqlIEVjq6gDbaK02mRsfpU1Yl49ZC8A+YWCgIQFryZrojoO/0z+sh8a5AiPMvP2eBaOojFl3fVjfUfMgw+6+hqtwqo8o62qROqQVljNCm+0x6wjDhxAgWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631559; c=relaxed/simple;
	bh=hNqwESdehCplGp2Ld177dgkLlGNZIl361zxVOsdkgM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sWIdddoR0qz0lW57Q1gKygtufTyoOzFOv8TQnZiKITBuxafPLor/MxTjsOXU4y8Bq5/ohPpzsKDZ/lARG6zzKCpEknl1kLCnVgTnGg1oiPl9zExfYp3uIQ2iqn+PnTPmbErm4SmNbDoXJU+3/aH3zqlXxuefxSM2NfscNTrD0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XPypF3xDfz4f3kkS
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 626D61A092F
	for <ntfs3@lists.linux.dev>; Fri, 11 Oct 2024 15:25:53 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
	by APP4 (Coremail) with SMTP id gCh0CgCn28f_0ghn744dDw--.8916S5;
	Fri, 11 Oct 2024 15:25:53 +0800 (CST)
From: Ye Bin <yebin@huaweicloud.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: yebin10@huawei.com,
	zhangxiaoxu5@huawei.com
Subject: [PATCH 1/3] fs/ntfs3: factor out ntfs_{create/remove}_procdir()
Date: Fri, 11 Oct 2024 15:40:23 +0800
Message-Id: <20241011074025.3811053-2-yebin@huaweicloud.com>
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
X-CM-TRANSID:gCh0CgCn28f_0ghn744dDw--.8916S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCF45Cr4xArWDWFy8CrW3Jrb_yoW5GFWrpa
	13Zw1fGw48GF43Xan3tws7Ar1Sgw4DG34Utr17Cw1xXw12y34rZFyrCFsYyrySvFy8tr4v
	qr4qqrn7ur18u3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07UAEfrUUUUU=
X-CM-SenderInfo: p1hex046kxt4xhlfz01xgou0bp/

From: Ye Bin <yebin10@huawei.com>

Introduce ntfs_create_procdir() and ntfs_remove_procdir() to
create/remove "/proc/fs/ntfs3/.."

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 fs/ntfs3/super.c | 59 +++++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 128d49512f5d..660f11c6259c 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -550,6 +550,40 @@ static const struct proc_ops ntfs3_label_fops = {
 	.proc_write = ntfs3_label_write,
 };
 
+static void ntfs_create_procdir(struct super_block *sb)
+{
+	struct proc_dir_entry *e;
+
+	if (!proc_info_root)
+		return;
+
+	e = proc_mkdir(sb->s_id, proc_info_root);
+	if (e) {
+		struct ntfs_sb_info *sbi = sb->s_fs_info;
+
+		proc_create_data("volinfo", 0444, e,
+				 &ntfs3_volinfo_fops, sb);
+		proc_create_data("label", 0644, e,
+				 &ntfs3_label_fops, sb);
+		sbi->procdir = e;
+	}
+}
+
+static void ntfs_remove_procdir(struct super_block *sb)
+{
+	struct ntfs_sb_info *sbi = sb->s_fs_info;
+
+	if (!sbi->procdir)
+		return;
+
+	remove_proc_entry("label", sbi->procdir);
+	remove_proc_entry("volinfo", sbi->procdir);
+	remove_proc_entry(sb->s_id, proc_info_root);
+	sbi->procdir = NULL;
+}
+#else
+static void ntfs_create_procdir(struct super_block *sb) {}
+static void ntfs_remove_procdir(struct super_block *sb) {}
 #endif
 
 static struct kmem_cache *ntfs_inode_cachep;
@@ -639,15 +673,7 @@ static void ntfs_put_super(struct super_block *sb)
 {
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 
-#ifdef CONFIG_PROC_FS
-	// Remove /proc/fs/ntfs3/..
-	if (sbi->procdir) {
-		remove_proc_entry("label", sbi->procdir);
-		remove_proc_entry("volinfo", sbi->procdir);
-		remove_proc_entry(sb->s_id, proc_info_root);
-		sbi->procdir = NULL;
-	}
-#endif
+	ntfs_remove_procdir(sb);
 
 	/* Mark rw ntfs as clear, if possible. */
 	ntfs_set_state(sbi, NTFS_DIRTY_CLEAR);
@@ -1585,20 +1611,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		kfree(boot2);
 	}
 
-#ifdef CONFIG_PROC_FS
-	/* Create /proc/fs/ntfs3/.. */
-	if (proc_info_root) {
-		struct proc_dir_entry *e = proc_mkdir(sb->s_id, proc_info_root);
-		static_assert((S_IRUGO | S_IWUSR) == 0644);
-		if (e) {
-			proc_create_data("volinfo", S_IRUGO, e,
-					 &ntfs3_volinfo_fops, sb);
-			proc_create_data("label", S_IRUGO | S_IWUSR, e,
-					 &ntfs3_label_fops, sb);
-			sbi->procdir = e;
-		}
-	}
-#endif
+	ntfs_create_procdir(sb);
 
 	if (is_legacy_ntfs(sb))
 		sb->s_flags |= SB_RDONLY;
-- 
2.31.1

