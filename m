Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14C31AF14
	for <ntfs3@lists.linux.dev>; Fri, 16 Oct 2026 01:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115068; cv=none; b=PE1MbwVPOWZyvaWwDzEmoVyXxytQOwypJEYhNTXpsKTZEQGNkvXZswr1WIPiZJSFhaznb3PcAuKlSx/Chq6cXbpl8BYyT8dKkoqqaaHhyFUz7aqdFfM7X6qyi1V1ufbTMvaF7gIIbpZA/4Kj3nlfZurMWa+evg3o9skn/r0MBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115068; c=relaxed/simple;
	bh=T52N405yvi/KiAwa9HNn6EVFkI4PXsuRjuaPvn/ceeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBrhaGaHCcwhpjpEuZHrILDa01dlM9pX+RwY25hk0/Imwnvk8b1qpkiJLyQUhP05+QfbycJM+zjBhmYot+pA45lbt5xZ41Imm+l4cY+vUtGWEH1u59TSKlOzlLFfgYC1x2sVAP+i2EIjfSB7cd/qu4htN6YYxBKfWRqteHdaX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=FivXKxs4; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="FivXKxs4"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53391022dc0so66235531cf.2
        for <ntfs3@lists.linux.dev>; Thu, 15 Oct 2026 18:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792115065; x=1792719865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7du5FcQla5Wc6+gmnjVbAOsmIOTMVLfgIeT70bTejk=;
        b=FivXKxs4pJhB+n+wfH+2B9hxwEzMu5DbRdIa9AlUkL7xX5seM3FJNwi8qoqlE5Ndhx
         EFjDN34zRovd12M6SYwmY6eG4G++pysHQFb416k8EL0Nj8cWvmP4bYP6kKOuaYj8krB/
         gOa4/TgzLJ0CAUerKxsWC1lr4auXubsOb115SiwH+MJnteQWHZ6WNS4icZ5nBqrNpCVw
         tXd0XcXf1HTewaHOeuQH/6GZeapq142PLeZWYvPBDKVkzVV/aNVyDQCG5psH3zPuY5yY
         5HGpAPc3gzFjMiKsE2GwYFSjmdRiYOOv5xMLCztszMUM2hcc+Jm1xHJkaHUjU+EYa6PX
         e02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115065; x=1792719865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7du5FcQla5Wc6+gmnjVbAOsmIOTMVLfgIeT70bTejk=;
        b=AFarOvzzNWaRRm3+tOjJzbEXwsFFUOfGUA88avFBPTOydZqI1l/TGSafq8QNZGxhPX
         aVxd0CkotXDjkPv8g2MdZpYQPFOkD3im+/ER5XIWwK3du1BYUlF0qH+rJop3tSD4zVxQ
         L1THhBLgSa2tX0xcKLIteKfPNHmrZlhLbTuJTETZS2irxm+hDOUlz4OSgApUkKqGg0c6
         bDp6gfK8j8GDu4fv4wPyHf4PDzLvlQRU0osthrRB3Qx0gKgN3O4D4wGS5JHt2bEgHh0G
         EIzjcbVc3lCQh56Um1hQnPoY9OaeO5DdW3wEKVt2hY6K/zr9bPOHqp0wF7Pwc8E9+NQo
         JYaw==
X-Gm-Message-State: AFq9FYKRnxdyDL9Lvs8mNhQMIXgJOmQv3ZnkNayf60FGrK32iUbNVnw0
	PjujO8c1uVrFe7mtuOE/pPZnzsLuatA9N2OTd/9YNK3h34Q/KHQi7urLUP04FjcSqw==
X-Gm-Gg: AYBFou2zkSFhCBnFBLc2HY+eOdaCtb2YviDzx3l0k+RGfoCsLZpvyq0KaAi0JZHp85d
	hxA385fcVEWgINdk8u5OXfuT2w6KUGWSFg/kKQgePtvI4yE+dhTepfYHQNsQe0u0/Ij943verSG
	Pk3fmjfoHrlyvQgoYToAsntOXmoETCdBjvjoVlTvKIk5i9Zikj8FBbrU31zZXAoSNGDIq0xnFh1
	ELKPww6v+u2fe9KFeksu2ZiMwBq8TF03JVHfDAgtMNCORTe0GfPC1S3MJpMGnttRU6UTF21fKxi
	LcJooWWDhmW8cXCe4K8oqt+7DBb1Yyn9XiGWTCIGM79mt3mZGEdK+RFG6FksCPYhlFvZpdkZ02O
	b8oADgH6B1JhHDnWhigKmpKfwVBAOcrOJp45rJbGj8TO4Ju7J61uxZ6aR9/wr+Dr6JyLIrlkYQR
	fJyaXgQKSEmqQKx8HYeoGVXn+nEpqmyLbYgEKMLExYzBMAdMEaYdErY6hFMR8BoTGZFknYUTn2C
	1InMUBzafYbn+cVe7/4kA==
X-Received: by 2002:a05:622a:906:b0:530:b2e4:d598 with SMTP id d75a77b69052e-5359fdd8736mr351907691cf.51.1792115064669;
        Thu, 15 Oct 2026 18:44:24 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8e5831sm9074711cf.10.2026.10.15.18.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:44:24 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: do not leave the file extended after a short write
Date: Thu, 15 Oct 2026 21:44:23 -0400
Message-ID: <20261016014423.2236260-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_file_write_iter() sets the file size to the end of the request
with ntfs_set_size() before it copies the data.

However, when fewer bytes are written, the function returns without
putting the size back. As of now, a write() that runs out of space on a
sparse file, or that stops at an unreadable part of the buffer, leaves
the file as long as the whole request. The part that was not written
reads as zeros.

The issue can be reproduced on a volume mounted with the sparse option:

    truncate -s 16M img
    mkntfs -F -q img
    mount -t ntfs3 -o loop,sparse img /mnt
    dd if=/dev/zero of=/mnt/hole bs=512k count=1
    dd if=/dev/zero of=/mnt/fill bs=4k
    sync
    rm /mnt/hole
    sync
    dd if=/dev/zero of=/mnt/f bs=1M count=1
    ls -l /mnt/f

The last dd command fails with "No space left on device". Before this
patch, /mnt/f is then 1048576 bytes long, although only 524288 bytes
were written. After this patch, /mnt/f is 524288 bytes long.

For non-compressed files, trim back to the end of the written data without
shrinking below the old size, and restore the old size if no data was
written. Reuse ntfs_setattr()'s shrink sequence and i_size rollback,
recording cleanup errors for fsync while preserving the write result.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested in KVM guests with KASAN enabled:
- Short/failed writes and ENOSPC, including unmount/remount checks.
- 78 focused cases across default, sparse, delalloc and prealloc=0
  combinations, covering buffered/direct I/O, append and O_DSYNC.
- 15 model runs (21,600 operations), with readback after remount.
- 32 ENOMEM/EIO cases each with and without the new error handling,
  using a test-only injection annotation at ntfs_set_size() entry.
  Checked size rollback, data preservation and fsync/O_DSYNC errors.

Compressed files and alternate data streams were not tested.

 fs/ntfs3/file.c | 42 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 95dfe6878860..bf9b39d00458 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1236,6 +1236,33 @@ static int check_write_restriction(struct inode *inode)
 	return 0;
 }
 
+/*
+ * ntfs_write_trim - Cut the file back after a write that was not completed.
+ *
+ * ntfs_file_write_iter() sets the file size to the end of the request before
+ * the data is copied. Keep what was written, or the old size if nothing was.
+ */
+static void ntfs_write_trim(struct kiocb *iocb, loff_t pos, loff_t oldsize)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	loff_t isize = i_size_read(inode);
+	loff_t newsize = oldsize;
+	int err;
+
+	if (iocb->ki_pos > pos)
+		newsize = max(newsize, iocb->ki_pos);
+
+	if (newsize < isize) {
+		truncate_setsize(inode, newsize);
+		err = ntfs_set_size(inode, newsize);
+		if (err) {
+			i_size_write(inode, isize);
+			/* Preserve the write result; report the error on fsync. */
+			mapping_set_error(inode->i_mapping, err);
+		}
+	}
+}
+
 /*
  * ntfs_file_write_iter - file_operations::write_iter
  */
@@ -1244,7 +1271,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
 	struct ntfs_inode *ni = ntfs_i(inode);
-	loff_t vbo, endbyte;
+	loff_t vbo, endbyte, pos, oldsize;
 	ssize_t ret, err;
 
 	if (!inode_trylock(inode)) {
@@ -1281,6 +1308,8 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 	vbo = iocb->ki_pos;
 	endbyte = vbo + ret;
+	pos = vbo;
+	oldsize = inode->i_size;
 
 	if (endbyte > inode->i_size) {
 		/*
@@ -1300,7 +1329,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (vbo > ni->i_valid) {
 		ret = ntfs_extend_initialized_size(file, ni, vbo);
 		if (ret)
-			goto out;
+			goto trim;
 	}
 
 	/* Fallback to buffered I/O if the inode does not support direct I/O. */
@@ -1310,6 +1339,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 		ret = iomap_file_buffered_write(iocb, from, &ntfs_iomap_ops,
 						&ntfs_iomap_folio_ops, NULL);
+		ntfs_write_trim(iocb, pos, oldsize);
 		inode_unlock(inode);
 
 		if (likely(ret > 0))
@@ -1322,7 +1352,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		/* Direct I/O is not compatible with delalloc. */
 		ret = ni_allocate_da_blocks(ni);
 		if (ret)
-			goto out;
+			goto trim;
 	}
 
 	ret = iomap_dio_rw(iocb, from, &ntfs_iomap_ops, NULL,
@@ -1342,7 +1372,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 						&ntfs_iomap_folio_ops, NULL);
 		if (err < 0) {
 			ret = err;
-			goto out;
+			goto trim;
 		}
 
 		/*
@@ -1358,13 +1388,15 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 						   endbyte);
 		if (err) {
 			ret = err;
-			goto out;
+			goto trim;
 		}
 
 		invalidate_mapping_pages(inode->i_mapping, vbo >> PAGE_SHIFT,
 					 endbyte >> PAGE_SHIFT);
 	}
 
+trim:
+	ntfs_write_trim(iocb, pos, oldsize);
 out:
 	inode_unlock(inode);
 
-- 
2.53.0

