Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686028;
	b=MZU4FKrjXN0yDv5Aihoj2ZR5GATLmtYcXTzUlAkxYjKxnPhGkzkG+p0/nR/u3/CC/fKq
	 QR/cLURmtOmcPvSM3X0eVO9vh/giJLs+T0pm1GEfAikjc14ewtyjnYe9kdrnwe6EZ15Lm
	 M+Q4UwSfC96sOHcFub+dNqKL6znjmgPZjuT8V+0FPCxoWbIIBMTllWP/eY2DRhwN/2vu/
	 QwDcb65Ir7HpsEFFLfkMkmZTvL1xwED5HHdwYfG7vq18spsCoeFOXRYk+dTbkli1qS4W6
	 +p+6DXBew/VIz04L+u6nZLl6EbFezu6xFzxLlDdBsx4v4ItPlEQlhhPrHHWMT/ASkfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=P83f4IprDp7e5obGVb5Vbzr+nVTtl7vkcsibamZws88=;
	b=dp+nPtg/iDPZYZAnH4Ar1nTNz1sv1XYmtI7UvzpxGkBdTetHoKc00hEegzHORQl1Btjo
	 rwugArlBYd3zdXXXhqki/Ic/l4SUkRkRyqiTan8FT0D2nOqFZEz7hrcuZ9x6Rxpu8oQtZ
	 HIjcUE4z9Xz3nQMficWEcvlkvJU83H2AXAE3/n5N+ohJgEHhaCIjpbUA7LVx1EOREL6Uz
	 njISXlgqUASZODk+ytHEOHBAcja2EKdtwFtN+XgV5E5k/4yKUCfT1CWYYodMlnM9g/4na
	 XXsi3D4rXoG8vwuj/SPZBHm3igh6GQCm/5KMX+oQFOlXmvwZ8TJrT/uowmCWc1aNfBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=UAIHax9v;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E6606A319
	for <ntfs3@lists.linux.dev>; Thu, 22 Oct 2026 16:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060E6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=UAIHax9v
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5365f9a04c5so29285891cf.1
        for <ntfs3@lists.linux.dev>; Thu, 22 Oct 2026 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792686026; x=1793290826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P83f4IprDp7e5obGVb5Vbzr+nVTtl7vkcsibamZws88=;
        b=UAIHax9v+/rclwuToQZzdGs6guvTXv/Em56cb+lTd0fa4LJRNJrsLya7NjFFrqKEj9
         KZYKdrWgXjAuk8e5Y93LEwVwOyT6x52632dsJWg//Yl+eR0ZWN6ffnES6vAx8+Bf6EHm
         cX3+aq4dcjLFDnpR1EUnnpabhVvevE+r5WsVYa+zkHO85cystrYiHx3hj2pmOze/0kbe
         ELlC3/TKNN7SwgJoxUaOd0i2HBCBn1+YBKU0+5yLPucW7JMrHeYt4G8S9WUioMk4O+Nf
         olMhkb02FS4n5hIXRN3bkEleVuU8Z3Ti779RTxg7RLIyhk6Mm9uyFSjJ+GCggutV4+o5
         u51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686026; x=1793290826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P83f4IprDp7e5obGVb5Vbzr+nVTtl7vkcsibamZws88=;
        b=EmxJk/ZYDUWfauLd7WYVjzPoWovBPlnsXHq7g+JvX927XF3ObQwf375BsNv7VnzwgP
         nXNBvi4xroF6w90+SsUuYOF1OHEnFT2qo1GneF1tHb1el12LepjHmbZpumifmqg/SFEo
         Xp4z4+z3d2QCKeciaAg9rivyg0fiaeIaEls0FkhNW0g5gb7DoDqt1781dGkwl7WSZucx
         X0cxw3+by0yr2nd0WpixcED1AvxB3beFKa5MWBr1OF6Tgn3ZkH+6RuhGeGnVg0h2tDFU
         t27g+Iku3aXGdbxHqyAixKhSw8Rb2LaDzRn98NGCIoyQ07J0irvVBlAb3XblYl3mY2TB
         47gA==
X-Gm-Message-State: AFq9FYIKPMSCwBHnhuF+BRkDjVbGmrdzbZbItzPi/5yUltviJTYD0qjj
	+N5Z84ycOhH7E1FhbjDuQM06f97ElVSgX+MCxHH0MIP3VpIzfIWpgRDiNmc56GrFPw==
X-Gm-Gg: AYBFou3HO3Z1PR4AUOYtIXuVFUhqMMsJFrLLdV8O9bzybdwBDKKrFRdUelpHYtaf17a
	W69vTIIL/pzP+qwfhfpjQ6lgqkD5n/h1aqLncjKk7uZme+Vx5u5VxjLvdrHiLImiboGt6qInKkq
	KlfIji5zc7A7chJQggZDwfzEQNht1quFg1iQxISIKgQSD+FN6y7cfR78mX2HfYEZWcokmIDYRXQ
	wEif9fvU/hFLkj+jA1G+8gWvmqDbw7LSEU1PYz05nzjAKCr/u2gjU1DJtL8T1WZ0x02lruhO1eU
	xxsCOrVvppv4SIIj0g4jXqRPq0xrJeTyuAMYFsbbkokPbzAa+AEFap6T3AIDk4rBfPhyS0vqmlT
	FCEDOy6Vlu59CtQnvfaon2fGlTszyejSEZCsKpMYT2mrzILF/zYTiTFLeBpDA3IUpwe+PN9tIyt
	XWvB9ScFCDdOSWxzmnD66fAMDXDWaZC/L8MsVTJ6xE4F9UR5Sr6xlsRYaoj5yj1inswTKTYYxFe
	pZ4KQ9zinMB6OPvhtlyzIgHfRXlYbH/RPaMs6upC3eocp4cwwhKdYhDSQO5YfYCQro7IoBSfgRG
	hQ==
X-Received: by 2002:a05:622a:1f8e:b0:536:6c4e:13ff with SMTP id d75a77b69052e-5369b861036mr90429941cf.56.1792686025878;
        Thu, 22 Oct 2026 09:20:25 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab792935sm30803631cf.25.2026.10.22.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:20:25 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: free clusters on truncate again when prealloc is off
Date: Thu, 22 Oct 2026 12:20:03 -0400
Message-ID: <20261022162003.1688315-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit ecbb433f9a8e ("fs/ntfs3: fold file size handling into
ntfs_set_size()") made truncate go through ntfs_set_size(), which
always keeps the clusters preallocated past the new size.

However, those clusters are only freed when the last writer closes the
file, and only if the prealloc mount option is set. As of now, with
prealloc=0, a file that is made smaller keeps all its clusters until
it is deleted, also across umount and mount.

The issue can be reproduced on a freshly formatted 32 MiB volume with:

    mount -t ntfs3 -o loop,prealloc=0 ntfs.img /mnt
    dd if=/dev/zero of=/mnt/f bs=1M count=8 conv=fsync
    truncate -s 0 /mnt/f
    df -k /mnt

Before that commit, df shows the 8 MiB as free again. After it, they
stay in use until /mnt/f is removed.

This patch makes ntfs_set_size() keep preallocated clusters only with
the prealloc mount option, as ntfs_truncate() did before. fallocate()
with FALLOC_FL_KEEP_SIZE still keeps the clusters it allocates past
i_size.

Fixes: ecbb433f9a8e ("fs/ntfs3: fold file size handling into ntfs_set_size()")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested in KVM with KASAN on ntfs3 master da4391c496fe, without and
with this patch, on a fresh 32 MiB mkntfs image:
- The commands above: with prealloc=0, the used space after truncate
  is 11816K without the patch, also after remount, and 3624K with it.
- fallocate() with FALLOC_FL_KEEP_SIZE of 8 MiB on a 1-byte file,
  with prealloc=0 and with the default options: same results with and
  without the patch.
- truncate(2) by path on the default mount: same results.
- 11 runs of a random write/ftruncate model test (15,900 operations,
  buffered and direct I/O, default, prealloc=0 and sparse mounts, and
  a nearly full volume): same results with and without the patch.

 fs/ntfs3/file.c    |  3 ++-
 fs/ntfs3/inode.c   | 12 +++++++++---
 fs/ntfs3/ntfs_fs.h |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index c11da747270f..2afc2fe8f009 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -680,7 +680,8 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
 		}
 
 		if (mode & FALLOC_FL_KEEP_SIZE) {
-			err = ntfs_set_size(inode, i_size);
+			/* Keep the clusters just allocated past i_size. */
+			err = ntfs_set_size_ex(inode, i_size, true);
 			if (err)
 				goto out;
 		}
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 8adbdf1a7d11..72ecd802a8cf 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -887,7 +887,7 @@ static void ntfs_readahead(struct readahead_control *rac)
 	iomap_readahead(&ntfs_iomap_ops, &ctx, NULL);
 }
 
-int ntfs_set_size(struct inode *inode, u64 new_size)
+int ntfs_set_size_ex(struct inode *inode, u64 new_size, bool keep_prealloc)
 {
 	struct super_block *sb = inode->i_sb;
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
@@ -911,9 +911,8 @@ int ntfs_set_size(struct inode *inode, u64 new_size)
 	if (new_size < ni->i_valid)
 		ni->i_valid = new_size;
 
-	/* last 'true' means keep preallocated. */
 	err = attr_set_size(ni, ATTR_DATA, ni->file.ads.name, ni->file.ads.len,
-			    &ni->file.run, new_size, &ni->i_valid, true);
+			    &ni->file.run, new_size, &ni->i_valid, keep_prealloc);
 
 	up_write(&ni->file.run_lock);
 	ni_unlock(ni);
@@ -921,6 +920,13 @@ int ntfs_set_size(struct inode *inode, u64 new_size)
 	return err;
 }
 
+/* Keep clusters preallocated past the new size only with "prealloc". */
+int ntfs_set_size(struct inode *inode, u64 new_size)
+{
+	return ntfs_set_size_ex(inode, new_size,
+				ntfs_sb(inode->i_sb)->options->prealloc);
+}
+
 /*
  * Special value to detect ntfs_writeback_range call
  */
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 90ccfde951dc..0dd9efa2c88c 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -801,6 +801,7 @@ static inline struct inode *ntfs_iget5(struct super_block *sb,
 	return ntfs_iget5_flags(sb, ref, name, 0);
 }
 int ntfs_set_size(struct inode *inode, u64 new_size);
+int ntfs_set_size_ex(struct inode *inode, u64 new_size, bool keep_prealloc);
 int ntfs3_write_inode(struct inode *inode, struct writeback_control *wbc);
 int ntfs_sync_inode(struct inode *inode);
 int inode_read_data(struct inode *inode, void *data, size_t bytes);

base-commit: da4391c496fedc1ca78a99907712f2256ce8fb80
-- 
2.53.0

