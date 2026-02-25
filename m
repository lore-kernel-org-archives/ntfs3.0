Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41C73624C5
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 22:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059311; cv=none; b=iUX/KikTNH71USefJ27unTTZfANv02KsXg1hjm9wAwowua9iM7k5U3W+ThWztWINLhyi5advBzVodeMfk5gVK/5H+c6xafJTwWLpaDJg2XlMvLnVGOrxmZkhf6Eq/3YYFQ5sYiipnpLFw83J4+ERLI3wWOIslfX4U3vbPdZh/0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059311; c=relaxed/simple;
	bh=Ut4irJAP91Ja56kFfECaXVcCmgWiTiooWThaHJixb4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a91XcSYlPusSXEmC9dnYkPl0c3BL1HsiE3OneVQ0ezbedqtUORBTZddmk2Igtb5VDTziEGDijcZHiODOSScwYTm4tIVdoztQyPHWgNv4mn1HZYGhFS6P6/VWoTaKU+mYI6/JdHJN+FQcJoe1wgADvwzfLl8ku7JphCZilq3vwjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ZQwNYgHV; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ZQwNYgHV"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PMCvrN087190
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 17:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=UCad
	QArHxHi9ThZ1jAIvSvngqH0LQPrZ8HK0cEt3m1g=; b=ZQwNYgHVk1e7AonBp1GN
	AHhms9mVIbxtdg9djgycPaIK5SH2e7LZ9supw+fWQxOsuxDxLdWYTg29qYdOZWOY
	Yoxind27Lp1LnTlBB+iocGqkBeujZgdoOx0KTpb3+L2flDUaQvgq7QGL0FSOMsZb
	aePYzQ46aAH5yfuxGueCd2PW8+BtSYb/6riEK9KE4UlCVlV4OAKU7LPjPny0bZRa
	r/F5oQMKeYFunqtUXZRY4gcq/FG3n9onHe0PD5YjSbIvEHhHmA/12/mqQIcDCB0E
	/BIYyBF4K6XcVWBm+onb/+8xjo0VkdTKX9hjL7/Xe7D735HMn5X1aR3McboDQo3F
	fQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4chr4p76un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 17:41:41 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b4005ab7so29854751cf.2
        for <ntfs3@lists.linux.dev>; Wed, 25 Feb 2026 14:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772059300; x=1772664100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UCadQArHxHi9ThZ1jAIvSvngqH0LQPrZ8HK0cEt3m1g=;
        b=h6oPRZfWdD5OkiLVl+KuQP1SxXM42wSjbBb7cq5XgjLsM+7VRuUWH0E+f1wN8KCWH4
         fYkGustArfJWrdrIuSkH94jJbufrAYWkW0qLE3fVvWMTXtBTLTFOQwBi/fZGvVaMUfA5
         /b7fe7ESum+n3gCKM308KlVSdmnwA8QkZa4q8AWTj0fcIfvs3uXZo3z1RW38mVVIpRhc
         Ugun4u7Bz/czangnykT3G4jMA2TrOTgpMzdzhDBxqMuQKWKlK7/1Cffqhab2PMg/6Pu+
         7BOyhvAAIVvlCsYkGyEQnoVSXwskKRE8KPLxc/T2b6YX0xc5FinlaHmD2WvVkupoVxPX
         gjaA==
X-Forwarded-Encrypted: i=1; AJvYcCWWs6amjBZeyScF0znndxPtr+rSZpymtJjkA2diI1MVfbkSJbe/4Flwl+rV7BhdXWkKgqS7oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzwjqJeI79wclljEEGrVC4GCn8RqIe16+C8oUbXsvpxx133ptY
	IBR0TgpOj7qtcNsLOLdzBndXPHGa0JHzC6gSKDlUtoT/PqG2sVhVotwtcFmmPk8rTipFCMJw2dU
	zta8FMXjwq2q6QbYrTP9FogjC8+NvTpDTF12UR0LEugXQ372YYezE
X-Gm-Gg: ATEYQzzCsF9EafnR+5RnxigRq/yf3+BgMkBQ4ZUsS/eIJzQIaow5SXSk/9zD+OtNLA9
	FfHdzslyGC5fJ/kEMrkgrVXyYSwxugaLl8K9sBWxxnM2EVmpGSjwHaIIA2ICgETYifl1xNIR0vn
	ApO1c6257UeNhzlO5DonyyRWYSgd7MpLqDzuRotzutzfSE9aA9koxDdL0mwSiA8bxS8TMZTcpxG
	gsQ8Nilyn/aja0cflR75ChNT5y+UVPlkIuFpjYyL37Ty9BaIrxDv1OxBu5CyUcxsNgKyn39Is63
	Tz1CKE5p14P/gqRSXQWCOAgBRTDa8o2T5K41ha9Jipsap7+rVOsd/A5h/74uGtKJMNiWJHI/aAA
	IjH4S4tlX9vuToyPUyr8A2Yn9QZ7sfKNK
X-Received: by 2002:ac8:5850:0:b0:4ec:a568:7b1c with SMTP id d75a77b69052e-50745effd87mr1368621cf.21.1772059300014;
        Wed, 25 Feb 2026 14:41:40 -0800 (PST)
X-Received: by 2002:ac8:5850:0:b0:4ec:a568:7b1c with SMTP id d75a77b69052e-50745effd87mr1368101cf.21.1772059299490;
        Wed, 25 Feb 2026 14:41:39 -0800 (PST)
Received: from [127.0.1.1] ([216.158.158.246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449be47dsm4196231cf.15.2026.02.25.14.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:41:38 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 25 Feb 2026 17:40:57 -0500
Subject: [PATCH RFC v2 2/2] block: enable RWF_DONTCACHE for block devices
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-blk-dontcache-v2-2-70e7ac4f7108@columbia.edu>
References: <20260225-blk-dontcache-v2-0-70e7ac4f7108@columbia.edu>
In-Reply-To: <20260225-blk-dontcache-v2-0-70e7ac4f7108@columbia.edu>
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
        Bob Copeland <me@bobcopeland.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
        ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net,
        linux-mm@kvack.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772059296; l=9465;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Ut4irJAP91Ja56kFfECaXVcCmgWiTiooWThaHJixb4A=;
 b=Nv2Kk4KuLTpGQX84Y042xeZddog0F8f7rPDUzrUKUw+0BVDRxxIPtrNiY2iL73Q/t4raHOUQx
 MqYl+nhxhJlBePWXMDkS88wNw/JvTeg7ErN4IzVAeE9mMzN1BIIMHzs
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIxNiBTYWx0ZWRfX/cAxZqO9aBgr
 KmR6aQJyL8ysyBWueaXsQEZgKJQJISq2G0NgUwTQDlFhJAgG6vUc5BHK5nOTwjv/C6AKZ//OEE9
 AILqddTG4/9UrCAiCtQX51vs7bAYSzUHOWz0UmUas5j76xl7QAvCnK0Vg7kWW0lo3BXJmkmIUp/
 vKDq4GPtcMek7o8Erwtx+Ucnk64d0apG/W5xbeGEI3nboPWu2jlBAH+ZKAetVt0zxNn4MDAwTnH
 OTCxZDyPXIvVnSBfiL8RjSqX40n+BWaD3qm3gJRj52QRbH/RcikoiWTKrPeFKUe6r036NHWkpha
 7BG0zR0xmUZox07lw/r2BAKPWCo5nXeflDgMSds0QuOmTUH+xS34KyQCmegz6fcQrUgIEKiljsb
 ZDnj9cNThVuV6SRzMlTbgZ9B/aYu/1cWtCesG8era8Fc3ST+lCigL310WPCVcjWb7LOq47ZUzzW
 F2EcASdS2wKbTtmSvAQ==
X-Authority-Analysis: v=2.4 cv=IYGKmGqa c=1 sm=1 tr=0 ts=699f7aa5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=mD05b5UW6KhLIDvowZ5dSQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=x7bEGLp0ZPQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=Omgu3vtQbb9kFtOpCJYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zvUBIg9pQTkoBdvf_HzoLX-MXsYM0Uva
X-Proofpoint-GUID: zvUBIg9pQTkoBdvf_HzoLX-MXsYM0Uva
X-Proofpoint-Virus-Version: vendor=nai engine=6800 definitions=11712
 signatures=596818
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=10 bulkscore=10 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250216

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

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
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

-- 
2.39.5

