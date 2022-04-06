Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221217E6
	for <ntfs3@lists.linux.dev>; Wed,  6 Apr 2022 06:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WTqESTvtfO4RX0qAqhs2oFd2Ik59q54vLqp/V/y7bnI=; b=FyJUmCuIohn+Rc7Inqu3BniYMO
	qIbi7WgRq0N7qblPyTDtikeMFm5V1dbLiaJQYES35HwVVDM5F002rNedhKojSjZSangf3g4TTB5H8
	ose/VQW92oLsoNNnrgmuQ76bdKKE4T6Y3dmmZVsUWsnsPjVGMnUiPjquePmKO+IeMAi+ZQQvMCCYS
	5PMGec+vFR133rAMQYM0lD1ltqCTBtpWog3Ko4h+ioJJRDUI+WLYZoytyDGy8Ig1GoZQ2cZVQBaiq
	VeAMRPUX1EVBht4ncdSOvQy0zHk56lci0PZ4ia4LUpztUXudJZTNfnXGvXSxvvSo+c89mmlg6GRYS
	FB4ItY+g==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbynb-003uwx-AJ; Wed, 06 Apr 2022 06:05:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org
Subject: [PATCH 07/27] btrfs: use bdev_max_active_zones instead of open coding it
Date: Wed,  6 Apr 2022 08:04:56 +0200
Message-Id: <20220406060516.409838-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/zoned.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index b7b5fac1c7790..5b85004d85d6c 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -350,7 +350,6 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_cache)
 	struct btrfs_fs_info *fs_info = device->fs_info;
 	struct btrfs_zoned_device_info *zone_info = NULL;
 	struct block_device *bdev = device->bdev;
-	struct request_queue *queue = bdev_get_queue(bdev);
 	unsigned int max_active_zones;
 	unsigned int nactive;
 	sector_t nr_sectors;
@@ -410,7 +409,7 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device, bool populate_cache)
 	if (!IS_ALIGNED(nr_sectors, zone_sectors))
 		zone_info->nr_zones++;
 
-	max_active_zones = queue_max_active_zones(queue);
+	max_active_zones = bdev_max_active_zones(bdev);
 	if (max_active_zones && max_active_zones < BTRFS_MIN_ACTIVE_ZONES) {
 		btrfs_err_in_rcu(fs_info,
 "zoned: %s: max active zones %u is too small, need at least %u active zones",
-- 
2.30.2

