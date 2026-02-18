Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD3628C87C
	for <ntfs3@lists.linux.dev>; Wed, 18 Feb 2026 21:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771450454; cv=none; b=M46kd3r2ObR3GWI2ABhiyES9W0IHs8JxuO9NJoZTDvIaWKN+8BVYbZIbIk4yguFII1x/un3Z9Ni8GGm30HoHefK0NE7jDWTm7Tb7Z31GEUL+HYs0QxhMSbAwH1PpWvzRCCWjFXGvg3yD8KUONFMjphPdmlpNuy7VDz8aVARobTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771450454; c=relaxed/simple;
	bh=T0LvtdehGbkNJTSiNQgmirD033nsR1VjUZyYykwDeYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BK2+n3X6Abv2cghjpfbtyeLsAU3BkjF8yKcLALdpfQlpXkUUEFkENoaCNRA/sqiB9UwC3Eynkb3hKeWklah/FH3zfmo5edAcl0jbMdkVf/kQTygRdTpYScTaVVF2cNBgAOhTm+M5RroKHtF4iX6K7K0nwn0BTgvRTaTJ0RcV28Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=KeuNmF5o; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="KeuNmF5o"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ILDTJ61788916
	for <ntfs3@lists.linux.dev>; Wed, 18 Feb 2026 16:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=uuJ79dh9olk4pYGV3v3Dl4Z5kR
	JT1ZZ5CX7FO3lNziY=; b=KeuNmF5oPATHpJ95S8DRfxBbTUWTy53j/ULgNAxQWU
	0ybJCdDUX8KamSqaD++34v507hflbquC/BwZaas9fSXXivIpGKw/MSm+qUZUB5By
	Zg47BJ93bNc1Msqqr18QqBYryLWctBDCM/7OfotBLr82TvVNoq6nw5xOFTPojuE6
	njW9YWrIVgH9yBajGp7dN5y+dpo8AST5XOhyH8M7rHqFE1Q4LU7Goaj18A3+4DnO
	cxsp6MVO19RCoKXTk43qGsZYKR4eaYV7RSul6t5XySvt1JTiLN4rLf+pFjT3XU8r
	lxRdk6Edk9tpF2NfOCzmYVt6vUvNEw8JTi5xsF+H9GdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4cdk3318gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ntfs3@lists.linux.dev>; Wed, 18 Feb 2026 16:13:29 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b3fb32a1so30609091cf.0
        for <ntfs3@lists.linux.dev>; Wed, 18 Feb 2026 13:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771449205; x=1772054005;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuJ79dh9olk4pYGV3v3Dl4Z5kRJT1ZZ5CX7FO3lNziY=;
        b=iNEf35NTjsqJ8sfCjn5h9kbEmQgody+3+h6Z9uU+0hF0IP8B48VLsFYwWZLPSkQght
         2VQeWjLFcTKsPXjb3FjDkVMI6ng7cWeB8hx3lSYvwV7oSqPyTopYwmWnFXtAjAVHx+nl
         NQNzdY36NnN/YCxcGe2HkBjmEmsrSJd7/MZEfFxW4Qw7Xj7Kaed0BURpaPugLV6Td9jd
         k9tLVVAPD+gmy1ERpy/XVQMShQQ5R0c3UIknmFA7UOCOnR5s+dVrgDhsRCrz1kStgCsR
         KbcaL6a625DBYVh6LiKvjvrtX5d3a42T4UalZa48pM9b9EGZujz5efD36MlHvgzJHUdv
         MVug==
X-Forwarded-Encrypted: i=1; AJvYcCVozBkKBtj7vIUnGNe1FLXKbyQu7nIjIqUsu8lIYJl2I/lIMGX+8hgsl2Eu2qxp8jeNQ/sd+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxANYK5l8Si5smAGta91rLtxMG6rABELnHTCHbxjTr+TXwyfI3w
	BBtDgKRaMjpLaXfeL2jVSw+SZuunI9pjQiztlqfG9SDtCtnI2NW0NjA5r32paQlaGyIG4RMJXur
	Pvy/Wk5LJUV1Ik93WWnmc2Sg661G42fAww4Xy8jAruejhFxA2pEV7xwz+rMyf
X-Gm-Gg: AZuq6aL1dYPKBwMDJQCUyAu4pWRKmeloQswtF2GgepsaxKM6oTNQvENl/AOHqVx6IhY
	0ttGW//0YduTVIN7P2B5IXirQ6yfx2TU/s4Rk5/ttUybCFSbWyPSLtRa+LRT2lBYGCLGBHq3eP1
	Rmu2SXQa8mU06UO3eFO8HJG9+haqfdVCXOF5cWP09zOnXz4JK7DaaZeWrSOA/xWReRJ7u/42jEA
	NE8Don0sWWTvqXwGuhYZYbuchOTbkNXdknHqrc7Ukglz+i+FvdP2w+xh1KGbCDpaJDbDvlglEa1
	rNh/U3U2jgkl1LOFqiYyNLlU6s5u4mOyBrGYcXcZJ+8eHaSH3PudqBawFHFi8892kxmk/ZYNt/E
	SNuMcOgHmABdcHx8UxSY3jrZ3I3MMiglo
X-Received: by 2002:ac8:5ac3:0:b0:501:13b1:14cd with SMTP id d75a77b69052e-506b3f7dc4amr210923871cf.3.1771449204958;
        Wed, 18 Feb 2026 13:13:24 -0800 (PST)
X-Received: by 2002:ac8:5ac3:0:b0:501:13b1:14cd with SMTP id d75a77b69052e-506b3f7dc4amr210923401cf.3.1771449204472;
        Wed, 18 Feb 2026 13:13:24 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8972a23c824sm180233646d6.34.2026.02.18.13.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 13:13:23 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 18 Feb 2026 16:13:17 -0500
Subject: [PATCH RFC] block: enable RWF_DONTCACHE for block devices
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-blk-dontcache-v1-1-fad6675ef71f@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAGwrlmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ML3aScbN2U/LyS5MTkjFRdY2MLQ2PjlBQDE9NUJaCegqLUtMwKsHn
 RSkFuzkqxtbUAJdTZe2QAAAA=
X-Change-ID: 20260218-blk-dontcache-338133dd045e
To: Jens Axboe <axboe@kernel.dk>,
        "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Namjae Jeon <linkinjeon@kernel.org>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Yuezhang Mo <yuezhang.mo@sony.com>, Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Viacheslav Dubeyko <slava@dubeyko.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Bob Copeland <me@bobcopeland.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
        ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771449202; l=9869;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=T0LvtdehGbkNJTSiNQgmirD033nsR1VjUZyYykwDeYI=;
 b=ncr9b3Og8wbWU8LbF6spEUvNolCpc/Omr1KB8euffU2v938xtBKSpJRbDWzlQXyoEaqvB7eBM
 EkxUdWlF2bvBic15lk0/0ypTHQFiFDCMJEjYAAgimrx91gq1j8YjEKy
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=Jqz8bc4C c=1 sm=1 tr=0 ts=69962b79 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Omgu3vtQbb9kFtOpCJYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE4MiBTYWx0ZWRfX3D/Pl3AYbuAe
 yx1E0N8yeC0+LL0MBwzebFihur5N815gSp3nfFrvlOv8QEeybX2x3gvRIaEJJPBFK8qSf9jHJjv
 lXMcejvkkxlGjjlO88PZDOXi0cKZVuaEeEt68PVtWoaCZ2l1G/VAm0i1i77mF3VLDxCwUtH1k63
 KuU2M7/UGqaTCTdsaiOu4M0teQtuyiGCuTAde/yEpQuDetlWwKM+zStZxEo3X5jJlGDNjtVDvw1
 ZiojFb/Xmzdf39Qm1XBljZQGQ5+GL6e3jK+e0VqOYftt219dHKf9Edpg9vQkJM/EsBzsGOzUq24
 bZgi/8Zlk0SbqbEW9rtLDauEUO+rf+sp8ALKItEi/PSy/M/yy8gNjomT+ywkByqmIMx4s+vl6e5
 09gm/mVUMh2aH4M1hjf7W51KFPU8Vcq1NJYM+V2dYcDLNyW3XBu3X9MhS+TYF5Si88diSvWgwRJ
 7Fa9WatCC2po2VV46Eg==
X-Proofpoint-GUID: itfyxwIsd_p0Mju9SzQl_xNiDVKZQiTt
X-Proofpoint-ORIG-GUID: itfyxwIsd_p0Mju9SzQl_xNiDVKZQiTt
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11705
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=10 spamscore=0
 impostorscore=10 lowpriorityscore=10 phishscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180182

Block device buffered reads and writes already pass through
filemap_read() and iomap_file_buffered_write() respectively, both of
which handle IOCB_DONTCACHE. Enable RWF_DONTCACHE for block device files
by setting FOP_DONTCACHE in def_blk_fops.

For CONFIG_BUFFER_HEAD paths, thread the kiocb through
block_write_begin() so that buffer_head-based I/O can use DONTCACHE
behavior as well. Callers without a kiocb context (e.g. nilfs2 recovery)
pass NULL, which preserves the existing behavior.

This support is useful for databases that operate on raw block devices,
among other userspace applications.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
This is based on v6.19. Please let me know if there's a different tree I
should base this on.

I wasn't sure if the block_write_begin() changes were necessary for
block device support if CONFIG_BUFFER_HEAD is set (hence the RFC tag). I
can remove those if they're not necessary.
---
 block/fops.c                |  4 ++--
 fs/bfs/file.c               |  2 +-
 fs/buffer.c                 | 12 ++++++++----
 fs/exfat/inode.c            |  2 +-
 fs/ext2/inode.c             |  2 +-
 fs/jfs/inode.c              |  2 +-
 fs/minix/inode.c            |  2 +-
 fs/nilfs2/inode.c           |  2 +-
 fs/nilfs2/recovery.c        |  2 +-
 fs/ntfs3/inode.c            |  2 +-
 fs/omfs/file.c              |  2 +-
 fs/udf/inode.c              |  2 +-
 fs/ufs/inode.c              |  2 +-
 include/linux/buffer_head.h |  5 +++--
 14 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 4d32785b31d9..6bc727f8b252 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -505,7 +505,7 @@ static int blkdev_write_begin(const struct kiocb *iocb,
 			      unsigned len, struct folio **foliop,
 			      void **fsdata)
 {
-	return block_write_begin(mapping, pos, len, foliop, blkdev_get_block);
+	return block_write_begin(iocb, mapping, pos, len, foliop, blkdev_get_block);
 }
 
 static int blkdev_write_end(const struct kiocb *iocb,
@@ -967,7 +967,7 @@ const struct file_operations def_blk_fops = {
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= blkdev_fallocate,
 	.uring_cmd	= blkdev_uring_cmd,
-	.fop_flags	= FOP_BUFFER_RASYNC,
+	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
 };
 
 static __init int blkdev_init(void)
diff --git a/fs/bfs/file.c b/fs/bfs/file.c
index d33d6bde992b..f2804e38b8a7 100644
--- a/fs/bfs/file.c
+++ b/fs/bfs/file.c
@@ -177,7 +177,7 @@ static int bfs_write_begin(const struct kiocb *iocb,
 {
 	int ret;
 
-	ret = block_write_begin(mapping, pos, len, foliop, bfs_get_block);
+	ret = block_write_begin(iocb, mapping, pos, len, foliop, bfs_get_block);
 	if (unlikely(ret))
 		bfs_write_failed(mapping, pos + len);
 
diff --git a/fs/buffer.c b/fs/buffer.c
index 838c0c571022..33c3580b85d8 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2241,14 +2241,18 @@ EXPORT_SYMBOL(block_commit_write);
  *
  * The filesystem needs to handle block truncation upon failure.
  */
-int block_write_begin(struct address_space *mapping, loff_t pos, unsigned len,
-		struct folio **foliop, get_block_t *get_block)
+int block_write_begin(const struct kiocb *iocb, struct address_space *mapping,
+		loff_t pos, unsigned len, struct folio **foliop, get_block_t *get_block)
 {
 	pgoff_t index = pos >> PAGE_SHIFT;
+	fgf_t fgp_flags = FGP_WRITEBEGIN;
 	struct folio *folio;
 	int status;
 
-	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
+		fgp_flags |= FGP_DONTCACHE;
+
+	folio = __filemap_get_folio(mapping, index, fgp_flags,
 			mapping_gfp_mask(mapping));
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
@@ -2591,7 +2595,7 @@ int cont_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 		(*bytes)++;
 	}
 
-	return block_write_begin(mapping, pos, len, foliop, get_block);
+	return block_write_begin(iocb, mapping, pos, len, foliop, get_block);
 }
 EXPORT_SYMBOL(cont_write_begin);
 
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index f9501c3a3666..39d36e8fdfd6 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -456,7 +456,7 @@ static int exfat_write_begin(const struct kiocb *iocb,
 	if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
 		return -EIO;
 
-	ret = block_write_begin(mapping, pos, len, foliop, exfat_get_block);
+	ret = block_write_begin(iocb, mapping, pos, len, foliop, exfat_get_block);
 
 	if (ret < 0)
 		exfat_write_failed(mapping, pos+len);
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index dbfe9098a124..11aab03de752 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -930,7 +930,7 @@ ext2_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 {
 	int ret;
 
-	ret = block_write_begin(mapping, pos, len, foliop, ext2_get_block);
+	ret = block_write_begin(iocb, mapping, pos, len, foliop, ext2_get_block);
 	if (ret < 0)
 		ext2_write_failed(mapping, pos + len);
 	return ret;
diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
index 4709762713ef..ae52db437771 100644
--- a/fs/jfs/inode.c
+++ b/fs/jfs/inode.c
@@ -303,7 +303,7 @@ static int jfs_write_begin(const struct kiocb *iocb,
 {
 	int ret;
 
-	ret = block_write_begin(mapping, pos, len, foliop, jfs_get_block);
+	ret = block_write_begin(iocb, mapping, pos, len, foliop, jfs_get_block);
 	if (unlikely(ret))
 		jfs_write_failed(mapping, pos + len);
 
diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index 51ea9bdc813f..9075c0ba2f20 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -465,7 +465,7 @@ static int minix_write_begin(const struct kiocb *iocb,
 {
 	int ret;
 
-	ret = block_write_begin(mapping, pos, len, foliop, minix_get_block);
+	ret = block_write_begin(iocb, mapping, pos, len, foliop, minix_get_block);
 	if (unlikely(ret))
 		minix_write_failed(mapping, pos + len);
 
diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 51bde45d5865..d9d57eeecc5d 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -230,7 +230,7 @@ static int nilfs_write_begin(const struct kiocb *iocb,
 	if (unlikely(err))
 		return err;
 
-	err = block_write_begin(mapping, pos, len, foliop, nilfs_get_block);
+	err = block_write_begin(iocb, mapping, pos, len, foliop, nilfs_get_block);
 	if (unlikely(err)) {
 		nilfs_write_failed(mapping, pos + len);
 		nilfs_transaction_abort(inode->i_sb);
diff --git a/fs/nilfs2/recovery.c b/fs/nilfs2/recovery.c
index a9c61d0492cb..2f5fe44bf736 100644
--- a/fs/nilfs2/recovery.c
+++ b/fs/nilfs2/recovery.c
@@ -541,7 +541,7 @@ static int nilfs_recover_dsync_blocks(struct the_nilfs *nilfs,
 		}
 
 		pos = rb->blkoff << inode->i_blkbits;
-		err = block_write_begin(inode->i_mapping, pos, blocksize,
+		err = block_write_begin(NULL, inode->i_mapping, pos, blocksize,
 					&folio, nilfs_get_block);
 		if (unlikely(err)) {
 			loff_t isize = inode->i_size;
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 0a9ac5efeb67..8c788feb319e 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -966,7 +966,7 @@ int ntfs_write_begin(const struct kiocb *iocb, struct address_space *mapping,
 			goto out;
 	}
 
-	err = block_write_begin(mapping, pos, len, foliop,
+	err = block_write_begin(iocb, mapping, pos, len, foliop,
 				ntfs_get_block_write_begin);
 
 out:
diff --git a/fs/omfs/file.c b/fs/omfs/file.c
index 49a1de5a827f..3bade632e36e 100644
--- a/fs/omfs/file.c
+++ b/fs/omfs/file.c
@@ -317,7 +317,7 @@ static int omfs_write_begin(const struct kiocb *iocb,
 {
 	int ret;
 
-	ret = block_write_begin(mapping, pos, len, foliop, omfs_get_block);
+	ret = block_write_begin(iocb, mapping, pos, len, foliop, omfs_get_block);
 	if (unlikely(ret))
 		omfs_write_failed(mapping, pos + len);
 
diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index 7fae8002344a..aec9cdc938be 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -259,7 +259,7 @@ static int udf_write_begin(const struct kiocb *iocb,
 	int ret;
 
 	if (iinfo->i_alloc_type != ICBTAG_FLAG_AD_IN_ICB) {
-		ret = block_write_begin(mapping, pos, len, foliop,
+		ret = block_write_begin(iocb, mapping, pos, len, foliop,
 					udf_get_block);
 		if (unlikely(ret))
 			udf_write_failed(mapping, pos + len);
diff --git a/fs/ufs/inode.c b/fs/ufs/inode.c
index e2b0a35de2a7..dfba985265a8 100644
--- a/fs/ufs/inode.c
+++ b/fs/ufs/inode.c
@@ -481,7 +481,7 @@ static int ufs_write_begin(const struct kiocb *iocb,
 {
 	int ret;
 
-	ret = block_write_begin(mapping, pos, len, foliop, ufs_getfrag_block);
+	ret = block_write_begin(iocb, mapping, pos, len, foliop, ufs_getfrag_block);
 	if (unlikely(ret))
 		ufs_write_failed(mapping, pos + len);
 
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index b16b88bfbc3e..4b07dec5f8eb 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -258,8 +258,9 @@ int __block_write_full_folio(struct inode *inode, struct folio *folio,
 		get_block_t *get_block, struct writeback_control *wbc);
 int block_read_full_folio(struct folio *, get_block_t *);
 bool block_is_partially_uptodate(struct folio *, size_t from, size_t count);
-int block_write_begin(struct address_space *mapping, loff_t pos, unsigned len,
-		struct folio **foliop, get_block_t *get_block);
+int block_write_begin(const struct kiocb *iocb, struct address_space *mapping,
+		loff_t pos, unsigned len, struct folio **foliop,
+		get_block_t *get_block);
 int __block_write_begin(struct folio *folio, loff_t pos, unsigned len,
 		get_block_t *get_block);
 int block_write_end(loff_t pos, unsigned len, unsigned copied, struct folio *);

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260218-blk-dontcache-338133dd045e

Best regards,
-- 
Tal Zussman <tz2294@columbia.edu>

