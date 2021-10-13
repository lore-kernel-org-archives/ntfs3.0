Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A992C81
	for <ntfs3@lists.linux.dev>; Wed, 13 Oct 2021 05:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DI57HM99JgBzfFnLmBUybQWNf682vnIdHw9T61SP0gQ=; b=vNbS7uqoz6/aNrya2ptXVceM+G
	Skcz/WgNdnkyrlwsdIEGVCi7e7QuKXvljYw9z9lYreb/M56Q3xCWJPS4TFHuwso/XAOq/0HS/IXaL
	ppl46l7/TyY3Q9sUEfW2RdBsCLctWocpR21vfbIiyhG6Q7sG24gAEK6ui0dSC8cH45NZt498z107H
	+m54zXQrXvLIUveBpSb09/sJLLhPgmEmV7GVD4LusuGHTFNdeYqaehK1OAo0cgyKsPhLYTBHGuabV
	oanuJI2d6DyBNBOEQS538E1Ld8Q99m/XmzMYCfe/qgfpraqlpkqpSPldbRTfV+9B7Y3nqBeOYAgRS
	3372D83Q==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63] helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWtU-0077im-2k; Wed, 13 Oct 2021 05:33:50 +0000
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
Subject: [PATCH 20/29] pstore/blk: use bdev_nr_sectors instead of open coding it
Date: Wed, 13 Oct 2021 07:10:33 +0200
Message-Id: <20211013051042.1065752-21-hch@lst.de>
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

Use the proper helper to read the block device size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/pstore/blk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 04ce58c939a0b..f43009cb2ec82 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -223,8 +223,8 @@ static int __register_pstore_blk(struct pstore_device_info *dev,
 		goto err_fput;
 	}
 
-	inode = I_BDEV(psblk_file->f_mapping->host)->bd_inode;
-	dev->zone.total_size = i_size_read(inode);
+	inode = psblk_file->f_mapping->host;
+	dev->zone.total_size = bdev_nr_sectors(I_BDEV(inode)) << SECTOR_SHIFT;
 
 	ret = __register_pstore_device(dev);
 	if (ret)
-- 
2.30.2

