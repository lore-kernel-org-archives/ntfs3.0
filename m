Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E72C85
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3V9fbTJuZDj71a+9mtkBQXQRRqP9hAgnu+ZIhkaADhI=; b=zDXL/abHH8Hy7DpCzkgiW3Aiv1
	vdacyZ7SPKBEIXUCbyEsKC0gp64D671n5SCRSmVJigriIQMAA10dYY9IOAlC7vM1GfXcnLtwdsD3O
	ypu7eCKX1Owu87zR+xuv8SalJND4PppRsawt0gD2aew4jQMKNPsnqvr4GENtTgKm0dkfWS0Ry8Bt9
	GNrrcHN5Mql2SnbjOZ9yBDofBiARYHY8gUio35POxOUeg1jnPPUYIsTgg/6hrrCyoMGTWjkIExSb3
	Icg7BYK/HVmnjML6lPWBo2ViaJXsJ4mE7gIS4UnwvqqbKAdg/c4HqbuEOV4byXXt0MBzfo2aXWJOP
	+y/4a+bA==;
Received: from [2001:4bb8:199:73c5:ddfe:9587:819b:83b0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNEZ-007Ce6-3w; Fri, 15 Oct 2021 13:26:51 +0000
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
Subject: [PATCH 02/30] block: add a bdev_nr_bytes helper
Date: Fri, 15 Oct 2021 15:26:15 +0200
Message-Id: <20211015132643.1621913-3-hch@lst.de>
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

Add a helpe to query the size of a block device in bytes.  This
will be used to remove open coded access to ->bd_inode.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/genhd.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 082a3e5fd8fa1..f67db3c5a04b3 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -235,9 +235,14 @@ static inline sector_t get_start_sect(struct block_device *bdev)
 	return bdev->bd_start_sect;
 }
 
+static inline sector_t bdev_nr_bytes(struct block_device *bdev)
+{
+	return i_size_read(bdev->bd_inode);
+}
+
 static inline sector_t bdev_nr_sectors(struct block_device *bdev)
 {
-	return i_size_read(bdev->bd_inode) >> 9;
+	return bdev_nr_bytes(bdev) >> SECTOR_SHIFT;
 }
 
 static inline sector_t get_capacity(struct gendisk *disk)
-- 
2.30.2

