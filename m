Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2971A2C80
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=GrMAkYzXypftu2Q93j+7zCry2NCsZMMZP71gZdhVD6M=; b=u0Jh/pk//vKTObitfYlxlIGC4J
	NliEBUrfu8nRvsuQqfa0JdudddIgT4cUPUUQhhD1H73tpwx2VJ3xZKmlBURkgE0Wlwlj5sC9k38A4
	Jlulwzv9b+pm5R7pWDiKTLnasKDPcPonGfj+WoDLUsvjVXgS6O9ZPJPNY80acEExcRozq9ODkVYoU
	cBI8mRHR3nwjqo8o+yLJAkhg4oxrz4AanNeNGgBQGOEB96Mhoi/robn53SwHYX1l6Ozdhd6Bf1imN
	l3cTw2JImqG5tWyrDjeMpk9nDeFErssO0HV37CTbED9wzNn+MLmDMzWTsxQB0LjQmWxrn+3mG/Bgf
	rD4cqhcg==;
Received: from [2001:4bb8:199:73c5:ddfe:9587:819b:83b0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNEW-007CcF-HX; Fri, 15 Oct 2021 13:26:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Kees Cook <keescook@chromium.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	dm-devel@redhat.com,
	drbd-dev@lists.linbit.com,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net,
	ntfs3@lists.linux.dev,
	reiserfs-devel@vger.kernel.org
Subject: [PATCH 01/30] block: move the SECTOR_SIZE related definitions to blk_types.h
Date: Fri, 15 Oct 2021 15:26:14 +0200
Message-Id: <20211015132643.1621913-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015132643.1621913-1-hch@lst.de>
References: <20211015132643.1621913-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Ensure these are always available for inlines in the various block layer
headers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/blk_types.h | 17 +++++++++++++++++
 include/linux/blkdev.h    | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 3b967053e9f5a..dc8da0c7fa09b 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -20,6 +20,23 @@ struct cgroup_subsys_state;
 typedef void (bio_end_io_t) (struct bio *);
 struct bio_crypt_ctx;
 
+/*
+ * The basic unit of block I/O is a sector. It is used in a number of contexts
+ * in Linux (blk, bio, genhd). The size of one sector is 512 = 2**9
+ * bytes. Variables of type sector_t represent an offset or size that is a
+ * multiple of 512 bytes. Hence these two constants.
+ */
+#ifndef SECTOR_SHIFT
+#define SECTOR_SHIFT 9
+#endif
+#ifndef SECTOR_SIZE
+#define SECTOR_SIZE (1 << SECTOR_SHIFT)
+#endif
+
+#define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
+#define PAGE_SECTORS		(1 << PAGE_SECTORS_SHIFT)
+#define SECTOR_MASK		(PAGE_SECTORS - 1)
+
 struct block_device {
 	sector_t		bd_start_sect;
 	struct disk_stats __percpu *bd_stats;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 17705c970d7e1..161496d1aced0 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -571,23 +571,6 @@ static inline struct request_queue *bdev_get_queue(struct block_device *bdev)
 	return bdev->bd_disk->queue;	/* this is never NULL */
 }
 
-/*
- * The basic unit of block I/O is a sector. It is used in a number of contexts
- * in Linux (blk, bio, genhd). The size of one sector is 512 = 2**9
- * bytes. Variables of type sector_t represent an offset or size that is a
- * multiple of 512 bytes. Hence these two constants.
- */
-#ifndef SECTOR_SHIFT
-#define SECTOR_SHIFT 9
-#endif
-#ifndef SECTOR_SIZE
-#define SECTOR_SIZE (1 << SECTOR_SHIFT)
-#endif
-
-#define PAGE_SECTORS_SHIFT	(PAGE_SHIFT - SECTOR_SHIFT)
-#define PAGE_SECTORS		(1 << PAGE_SECTORS_SHIFT)
-#define SECTOR_MASK		(PAGE_SECTORS - 1)
-
 #ifdef CONFIG_BLK_DEV_ZONED
 
 /* Helper to convert BLK_ZONE_ZONE_XXX to its string format XXX */
-- 
2.30.2

