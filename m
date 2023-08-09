Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A32452D
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hQKQ7iNKLOfj5a3qVIegk556ZInv0gN1XnkKlge+c4A=; b=48E6c2ZeK6SNLV5qI+DTQvKa8M
	8jQ1bvR8hz7+04YIm45Zx8VwwdMhZ/+eMxqyA5MjNzLWPjJnV9wT0s2kXaaB0qNxq84iqvaLiW5jY
	NSqBCgh6KCAFKKYtFPCTcBtWCcq9GeuM9+iWPp5oqUi821e6tzhyopXSIvzRudXtjM/wQkbPVAnz2
	36GrDVwCpkchkH7dMyOWHiaK/U46fnwReUxiuqBWXm7H9ThKzuU5l8ksYSoUd6zM3IZU+QCrRruwJ
	9WskQCPFFyCE+M9WnxYpXWxrPLo3tDeidtx/7+m4oNKEB8L+1+6Tx+BKcSv55NZnV0UQnKO86dO6N
	ULS3oNVQ==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrJL-005xo8-2A;
	Wed, 09 Aug 2023 22:05:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev,
	linux-xfs@vger.kernel.org
Subject: [PATCH 04/13] xfs: remove xfs_blkdev_put
Date: Wed,  9 Aug 2023 15:05:36 -0700
Message-Id: <20230809220545.1308228-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809220545.1308228-1-hch@lst.de>
References: <20230809220545.1308228-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

There isn't much use for this trivial wrapper, especially as the NULL
check is only needed in a single call site.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christian Brauner <brauner@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/xfs/xfs_super.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index d2f3ae6ba8938b..fc21e543357ef5 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -395,15 +395,6 @@ xfs_blkdev_get(
 	return error;
 }
 
-STATIC void
-xfs_blkdev_put(
-	struct xfs_mount	*mp,
-	struct block_device	*bdev)
-{
-	if (bdev)
-		blkdev_put(bdev, mp->m_super);
-}
-
 STATIC void
 xfs_close_devices(
 	struct xfs_mount	*mp)
@@ -412,13 +403,13 @@ xfs_close_devices(
 		struct block_device *logdev = mp->m_logdev_targp->bt_bdev;
 
 		xfs_free_buftarg(mp->m_logdev_targp);
-		xfs_blkdev_put(mp, logdev);
+		blkdev_put(logdev, mp->m_super);
 	}
 	if (mp->m_rtdev_targp) {
 		struct block_device *rtdev = mp->m_rtdev_targp->bt_bdev;
 
 		xfs_free_buftarg(mp->m_rtdev_targp);
-		xfs_blkdev_put(mp, rtdev);
+		blkdev_put(rtdev, mp->m_super);
 	}
 	xfs_free_buftarg(mp->m_ddev_targp);
 }
@@ -503,10 +494,11 @@ xfs_open_devices(
  out_free_ddev_targ:
 	xfs_free_buftarg(mp->m_ddev_targp);
  out_close_rtdev:
-	xfs_blkdev_put(mp, rtdev);
+	if (rtdev)
+		blkdev_put(rtdev, sb);
  out_close_logdev:
 	if (logdev && logdev != ddev)
-		xfs_blkdev_put(mp, logdev);
+		blkdev_put(logdev, sb);
 	goto out_relock;
 }
 
-- 
2.39.2

