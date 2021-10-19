Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C232C88
	for <ntfs3@lists.linux.dev>; Tue, 19 Oct 2021 06:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=2oPjr/CmcgLY9x84ULlH3Ff6Xbo0qFK9LD8/6togFZA=; b=NmleJeKN1g8pEYKNinAzcH1jFW
	YVzZPzhzgKyPmp7TB1Ltmv00TeeI/hto2YW37T69//rbf+Nm4+mj9nydcHUW9DrmtRpdHx8Fi/Fzo
	1NKGKe7HuNLCG/KCOJfbOkFEsBcUQW7is1N0PUDRsGRU4DXtFlkDsK/l979/BPtac6T+tGfM9xbD3
	lpv4i1Yp/wTNXV/aC+5TgkvwywJ9iElv2wuSnP/vGd3+TpVcWT4Tscb7sXljwDFbVg3Y0SAJMMs+6
	BzKCsHP8M2Yf6xLFlnmib88C7gbfz+Y0BlNlE5lfDEjfMICHGNJNMYzubZ7YdN9HwDct/4CCIEPFd
	ma7YqgQg==;
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mciZI-000HaB-1X; Tue, 19 Oct 2021 06:25:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: [PATCH 4/7] btrfs: use sync_blockdev
Date: Tue, 19 Oct 2021 08:25:27 +0200
Message-Id: <20211019062530.2174626-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019062530.2174626-1-hch@lst.de>
References: <20211019062530.2174626-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Use sync_blockdev instead of opencoding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/volumes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 2ec3b8ac8fa35..b51e4b464103e 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -508,7 +508,7 @@ btrfs_get_bdev_and_sb(const char *device_path, fmode_t flags, void *holder,
 	}
 
 	if (flush)
-		filemap_write_and_wait((*bdev)->bd_inode->i_mapping);
+		sync_blockdev(*bdev);
 	ret = set_blocksize(*bdev, BTRFS_BDEV_BLOCKSIZE);
 	if (ret) {
 		blkdev_put(*bdev, flags);
-- 
2.30.2

