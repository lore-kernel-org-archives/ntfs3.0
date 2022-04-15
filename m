Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0A87A
	for <ntfs3@lists.linux.dev>; Fri, 15 Apr 2022 04:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=V+N3WPhcjqbqmVRPAoIxuBjo6dgh1f5KuPVQDpaEGEs=; b=nvLDGsPTiAetPju9xhjyf64KX7
	7ozMCWWCzv+ARhNAuWIGIewpeBs3t3aim/vmyIsXxJJQ8D6e6M3a/IJbXoQcPtzLYF8SFlKXBpOqM
	ETxPrnhTBR4f07V6gtDeEqdGfb51nKXQBTRpYPNUhpzcsR3DXwU2yZKBDkC9971ryVgupM8yHNByX
	XVPHLYl9bzyBrPwqQLBM+QwlQjI8z/UzTo262uc5gVNBSBEUT1iHLOtxrGXvyRuwX4DfSfPrfgzSz
	mZOGRfCY5mWiQtABTIuaX0+Vh6+ub+qekGvIjW8PCF25qEYReZ47iYhf1WPmN6PzqNTyFHnP9LWNJ
	HQK2650A==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfDxy-008PKU-DT; Fri, 15 Apr 2022 04:53:54 +0000
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
	linux-mm@kvack.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Subject: [PATCH 16/27] block: use bdev_alignment_offset in part_alignment_offset_show
Date: Fri, 15 Apr 2022 06:52:47 +0200
Message-Id: <20220415045258.199825-17-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Replace the open coded offset calculation with the proper helper.
This is an ABI change in that the -1 for a misaligned partition is
properly propagated, which can be considered a bug fix and matches
what is done on the whole device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/partitions/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block/partitions/core.c b/block/partitions/core.c
index 2ef8dfa1e5c85..240b3fff521e4 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -200,11 +200,7 @@ static ssize_t part_ro_show(struct device *dev,
 static ssize_t part_alignment_offset_show(struct device *dev,
 					  struct device_attribute *attr, char *buf)
 {
-	struct block_device *bdev = dev_to_bdev(dev);
-
-	return sprintf(buf, "%u\n",
-		queue_limit_alignment_offset(&bdev_get_queue(bdev)->limits,
-				bdev->bd_start_sect));
+	return sprintf(buf, "%u\n", bdev_alignment_offset(dev_to_bdev(dev)));
 }
 
 static ssize_t part_discard_alignment_show(struct device *dev,
-- 
2.30.2

