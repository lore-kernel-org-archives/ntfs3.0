Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372740;
	b=MNlg+whuULAFaNvRUHqy43c2vErd6Flu3W9BdukSBa7k5OIy7En26luZeAiLxKuju/5t
	 ZUaxs7Lj9z6ybDYIiauS4sQXxA0Fel4QmBxQksear5qb9Le8fw9BAxJ9Z/BQYT4VZgmfR
	 1tiApLaI89Il/njeRX2HrAAn0R8fuvJ5UsAIzrqMTRdHQBuaIDONzezUFqFP48c3+Hin2
	 Kc5AxtW8gnJW47M4W0NMbqzN99MS8/RPN1DwthwUy1Ly0TL7RvFvbnBcPQmhu5BMsOTDM
	 Wy/F9RVDyqcY4NJj8cHb7tOglPzDH3zmq6w7+75QQRH2jlMSmqGKafprGAd3IOvFnOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372740;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=hwdIlGdI3MDaUnbfk28lpVH5xVCoICuoL7tUfNBOz9g=;
	b=tBKt1N2UTbuN6SPyUL/04RVoYiM20dvxrZQjayFV8xTTspKtJDSMXWV1LNxqS3Ho/4ZH
	 e39NOf3iWMD8e6aDIR8ApiZMy9vekI7FJhsY6lYXk8vkpVWPG3en+DzrqpQds/JgEaK6a
	 GlOI/XzSm4T1+s3/ejmKJ+xS3R/6qNCT98tghDVeAH64jqJaiUfovBM+NQT0athrA/B4E
	 6SSeTy+jgPPdioSpQ3S7cdAtrKIEf7qukH5sbtgjIUDIUoU2f1pfqphxQHVo9MU/Yc66+
	 jLL5enHsh6KVtL3Jz8Ch6JpXboq8QPDQqoMpeEWMtNKt4Mzm60/grfUmnxo8Zogsj8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4A4606A31C
	for <ntfs3@lists.linux.dev>; Wed, 11 Nov 2026 04:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=hwdIlGdI3M
	DaUnbfk28lpVH5xVCoICuoL7tUfNBOz9g=; b=L5+I3QsfgPJzGqqI6dKnhNpxw8
	9DtscHQ9FOgRjwnZp+MLO129fZuagWPKWx8gIAOYEC1sq10+SVYPJPVGqQv9IPbh
	rQTKt6F9cAsUcnlj4/EJEJGNESSBNWYazZ5RHvdmHNCEhlhqkfHN938pevuwJNeT
	q1ZWi12C8GhyefC/8=
Received: from LAPTOP-FRMFRHCN.localdomain (unknown [240e:457:1010:6360:5829:9b4f:7181:f594])
	by hzbj-edu-front-3.icoremail.net (Coremail) with UTF8SMTPA id BbQMCkB2fwJ19PNqQthyAQ--.44177S2;
	Wed, 11 Nov 2026 12:52:06 +0800 (CST)
From: Haoli Zhang <26031212468@stu.xidian.edu.cn>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+62769d828b0914efeb09@syzkaller.appspotmail.com,
	25031212117@stu.xidian.edu.cn,
	byu@xidian.edu.cn,
	Haoli Zhang <26031212468@stu.xidian.edu.cn>
Subject: [PATCH] ntfs3: snapshot root index entries before unlocking
Date: Wed, 11 Nov 2026 12:52:02 +0800
Message-Id: <20261111045202.14654-1-26031212468@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkB2fwJ19PNqQthyAQ--.44177S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF1UWr13CFWDury7WF18uFg_yoWxGF4rpF
	43Ca93Kw4xJr43uw1qkF1rZr1S934xKF4UKrWkZa1Sywn5tr10ya4jkFWUuFyfAr93Jwn0
	qFs8tFW8G348JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUIYLkUUUUU=
X-CM-SenderInfo: yswqjiasrskluy6v33wo0lvxldqovvfxof0/1tbiAQUOEWrzM1aXCAAAs4

The syzbot report shows a slab use-after-free while ntfs_readdir() emits
a directory entry. The root index header and entries are borrowed from an
MFT record. ntfs_readdir() drops ni_lock before walking them because
dir_emit() may fault while writing to userspace, but writeback can replace
and free the record under the same ni_lock.

The unlocked path also checks each entry's parent MFT reference with
mi_is_ref(), which reads the current MFT record sequence number. Snapshot
the directory MFT reference while holding ni_lock and pass that stable
value to both root and allocation-index traversal. Copy the used root
index header under the lock as well, then walk the copy after unlocking.
This keeps dir_emit() outside ni_lock while avoiding references to the
replaceable MFT record. Validate the copied range and use subtraction-based
bounds checks when walking index entries.

Fixes: 7a5aa6c45072 ("ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks")
Reported-by: syzbot+62769d828b0914efeb09@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=62769d828b0914efeb09
Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>

---
 fs/ntfs3/dir.c | 75 +++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -336,8 +336,9 @@
  * returns false if 'ctx' if full
  */
 static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
-				 struct ntfs_inode *ni, const struct NTFS_DE *e,
-				 u8 *name, struct dir_context *ctx)
+				 const struct MFT_REF *dir_ref,
+				 const struct NTFS_DE *e, u8 *name,
+				 struct dir_context *ctx)
 {
 	const struct ATTR_FILE_NAME *fname;
 	u64 ino;
@@ -349,7 +350,9 @@
 	if (fname->type == FILE_NAME_DOS)
 		return true;
 
-	if (!mi_is_ref(&ni->mi, &fname->home))
+	if (fname->home.low != dir_ref->low ||
+	    fname->home.high != dir_ref->high ||
+	    fname->home.seq != dir_ref->seq)
 		return true;
 
 	ino = ino_get(&e->ref);
@@ -392,7 +395,7 @@
 	 * It does additional locks/reads just to get the type of name.
 	 * Should we use additional mount option to enable branch below?
 	 */
-	if (fname->dup.extend_data && ino != ni->mi.rno) {
+	if (fname->dup.extend_data && ino != ino_get(dir_ref)) {
 		struct inode *inode = ntfs_iget5(sbi->sb, &e->ref, NULL);
 		if (!IS_ERR_OR_NULL(inode)) {
 			dt_type = fs_umode_to_dtype(inode->i_mode);
@@ -410,7 +413,8 @@
  * returns -EINVAL if directory is corrupted.
  * returns +1 if 'ctx' is full.
  */
-static int ntfs_read_hdr(struct ntfs_sb_info *sbi, struct ntfs_inode *ni,
+static int ntfs_read_hdr(struct ntfs_sb_info *sbi,
+			 const struct MFT_REF *dir_ref,
 			 const struct INDEX_HDR *hdr, u64 vbo, u64 pos,
 			 u8 *name, struct dir_context *ctx)
 {
@@ -420,12 +424,12 @@
 	u32 off = le32_to_cpu(hdr->de_off);
 
 	for (;; off += e_size) {
-		if (off + sizeof(struct NTFS_DE) > end)
+		if (off > end || end - off < sizeof(struct NTFS_DE))
 			return -EINVAL;
 
 		e = Add2Ptr(hdr, off);
 		e_size = le16_to_cpu(e->size);
-		if (e_size < sizeof(struct NTFS_DE) || off + e_size > end)
+		if (e_size < sizeof(struct NTFS_DE) || e_size > end - off)
 			return -EINVAL;
 
 		if (de_is_last(e))
@@ -441,7 +445,7 @@
 		ctx->pos = vbo + off;
 
 		/* Submit the name to the filldir callback. */
-		if (!ntfs_dir_emit(sbi, ni, e, name, ctx)) {
+		if (!ntfs_dir_emit(sbi, dir_ref, e, name, ctx)) {
 			/* ctx is full. */
 			return +1;
 		}
@@ -457,6 +461,9 @@
 static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	const struct INDEX_ROOT *root;
+	struct INDEX_HDR *root_hdr = NULL;
+	struct MFT_REF dir_ref;
+	struct mft_inode *root_mi;
 	size_t bit;
 	int err = 0;
 	struct inode *dir = file_inode(file);
@@ -530,12 +537,15 @@
 	name = kmalloc(PATH_MAX, GFP_KERNEL);
 	if (!name)
 		return -ENOMEM;
+	if (pos < sbi->record_size) {
+		root_hdr = kmalloc(sbi->record_size, GFP_KERNEL);
+		if (!root_hdr) {
+			kfree(name);
+			return -ENOMEM;
+		}
+	}
 
-	/*
-	 * Keep directory metadata stable for the whole walk. Loading subrecords
-	 * once is not enough if concurrent writeback can still compact ATTR_LIST
-	 * entries and free the record that ntfs_read_hdr() is currently walking.
-	 */
+	/* Serialize metadata lookup with writeback; snapshot root entries below. */
 	ni_lock(ni);
 
 	if (!ni->mi_loaded && ni->attr_list.size) {
@@ -550,7 +560,8 @@
 		ni->mi_loaded = true;
 	}
 
-	root = indx_get_root(&ni->dir, ni, NULL, NULL);
+	mi_get_ref(&ni->mi, &dir_ref);
+	root = indx_get_root(&ni->dir, ni, NULL, &root_mi);
 	if (!root) {
 		err = -EINVAL;
 		goto out;
@@ -559,20 +570,25 @@
 	if (pos >= sbi->record_size) {
 		bit = (pos - sbi->record_size) >> index_bits;
 	} else {
-		/*
-		 * Release ni_lock before dir_emit (which may fault into
-		 * user pages).  root->ihdr lives in the main MFT record
-		 * whose lifetime is bound to the inode, and i_rwsem shared
-		 * prevents concurrent directory modifications.
-		 */
-		ni_unlock(ni);
+		size_t root_off = (u8 *)&root->ihdr - (u8 *)root_mi->mrec;
+		size_t root_size = max_t(size_t, sizeof(*root_hdr),
+					  le32_to_cpu(root->ihdr.used));
+
+		/* Keep the root entries alive while dir_emit() may fault. */
+		if (root_off > sbi->record_size ||
+		    root_size > sbi->record_size - root_off) {
+			err = -EINVAL;
+			goto out;
+		}
 
-		/*
-		 * Add each name from root in 'ctx'.
-		 */
-		err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
+		memcpy(root_hdr, &root->ihdr, root_size);
+
+		ni_unlock(ni);
+		err = ntfs_read_hdr(sbi, &dir_ref, root_hdr, 0, pos, name, ctx);
+		kfree(root_hdr);
+		root_hdr = NULL;
 		if (err)
-			goto out;
+			goto out_free;
 
 		ni_lock(ni);
 		bit = 0;
@@ -612,18 +628,19 @@
 		/*
 		 * Add each name from index in 'ctx'.
 		 */
-		err = ntfs_read_hdr(sbi, ni, &node->index->ihdr,
+		err = ntfs_read_hdr(sbi, &dir_ref, &node->index->ihdr,
 				    ((u64)bit << index_bits) + sbi->record_size,
 				    pos, name, ctx);
 		if (err)
-			goto out;
+			goto out_free;
 
 		ni_lock(ni);
 	}
 
 out:
 	ni_unlock(ni);
-
+out_free:
+	kfree(root_hdr);
 	kfree(name);
 	put_indx_node(node);
 

