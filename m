Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE02C81
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 05:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NsQsVuWr8bWP70PtWOyIIt7IS6He0KNvqjFlC9dYhZ4=; b=Ew4D4bJU2khGePoaHa7o+E3zV6
	+YnBcRQumMxslqX1pbHbi2x3aZu0jSa1syVga+ovHnkiUvqmRfI0DSbvlIBIons91q/y7LwBC+rt7
	ljLUIJKylzikWb8/DDtXWEmbo3PVzdLaD5+UeBoEpdghnuFhnyZ+eFhNlSOqy1C3ILd1RRXjsk4SA
	TIYdV5+Xjmcbs8sMb8rd9XmMwXKKQ77nz+WFSnQ9FDRqElegNQrC/j0gD+AAXIN5BGiLeFOwPFtc5
	SSicnwV+Z7JCkg1j3Hfq7OPsge69ggSYDVUW1Y0Wb3vn4pbsJSaM7NthMqM5vfYTZbKzMF89lBaTw
	B4nut1Lw==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63] helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWfl-0076UD-PC; Wed, 13 Oct 2021 05:20:03 +0000
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
	linux-mtd@lists.infradead.org,
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
Subject: [PATCH 09/29] fs: simplify init_page_buffers
Date: Wed, 13 Oct 2021 07:10:22 +0200
Message-Id: <20211013051042.1065752-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013051042.1065752-1-hch@lst.de>
References: <20211013051042.1065752-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

No need to convert from bdev to inode and back.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 3fb9c5b457ab6..ef1fe4f77a952 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -897,7 +897,7 @@ init_page_buffers(struct page *page, struct block_device *bdev,
 	struct buffer_head *head = page_buffers(page);
 	struct buffer_head *bh = head;
 	int uptodate = PageUptodate(page);
-	sector_t end_block = blkdev_max_block(I_BDEV(bdev->bd_inode), size);
+	sector_t end_block = blkdev_max_block(bdev, size);
 
 	do {
 		if (!buffer_mapped(bh)) {
-- 
2.30.2

