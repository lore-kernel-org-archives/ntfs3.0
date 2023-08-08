Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984B13AFC
	for <ntfs3@lists.linux.dev>; Tue,  8 Aug 2023 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5i9GXV7tySDWUQHcbaIxRb87yMVl9hJSLmmjh+9RA7g=; b=V1C6gWoApAMsLhagGEpF52BvA8
	3txPA4gZUkV48uI00JazTqbOroaeSVEGUHldKdHU57YvrHAwT0YCobTCOylAv3Duq3X9/3Hh1OtXD
	ZFwbDahE+2pxiRKOuPZrgXqc3khRxj+1dgzOQbDFN1EYP302+ejlgb5djBquuCD4cikFeSu7lGI16
	wEGV4UMPOaEXSJpk+bvQ1peJu2hEzGmMU3gXmDrmK6ialBC8NioBBQ/rImBAMyGkbRxoLQRXvYyr0
	3q17Vv+8KHhtW8LHUraPKSaQ8xmS1sYTFEwXKWkeSbhtEOuR0o/UNEnqLWTVLaqRgjpMSaqinGnMa
	nNY+pLug==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPNK-002vdD-2D;
	Tue, 08 Aug 2023 16:16:02 +0000
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
Date: Tue,  8 Aug 2023 09:15:51 -0700
Message-Id: <20230808161600.1099516-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808161600.1099516-1-hch@lst.de>
References: <20230808161600.1099516-1-hch@lst.de>
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
---
 fs/xfs/xfs_super.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index d2f3ae6ba8938b..f00d1162815d19 100644
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
+ 	if (rtdev)
+		blkdev_put(rtdev, sb);
  out_close_logdev:
 	if (logdev && logdev != ddev)
-		xfs_blkdev_put(mp, logdev);
+		blkdev_put(logdev, sb);
 	goto out_relock;
 }
 
-- 
2.39.2

