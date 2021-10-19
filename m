Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8E2C88
	for <ntfs3@lists.linux.dev>; Tue, 19 Oct 2021 06:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=DDi853FEag9qzxEvbV2OqURCgYlh/7S1dK8LyuS7zbQ=; b=omDhi7pjmT2o70QnIOulNXChKy
	4vvsfBwPdds39Wa0alTtHRCJEagmexQT86Y/350PSM/qo+0Wi7CiU5NJrLAw0XEZe6oz3SZWf0UpT
	E2gJwoqVG9RAYdb8CtGvg24knqSyGDKGe1lOkpHVUvEcA4vZIKwJJSVfpwl3AU/ZleBs6ynP9aW4N
	H3iuwKADkUKdZfqLuwPA/HFPWY/VjYvkTzOKA+b6VbKrCDup2CQ1vuFuZ2+YGM+R8ZDeqSa49os8/
	y0gb8ezk2N4vPZImbbUBLufOBzmo4VSYE86ZmJmHn5I/ja6v02SrFfrJNgIPZMj321LJdyljHmgQ/
	ehi1DZyw==;
Received: from 089144192247.atnat0001.highway.a1.net ([89.144.192.247] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mciZO-000HcH-TJ; Tue, 19 Oct 2021 06:25:55 +0000
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
Subject: [PATCH 6/7] ntfs3: use sync_blockdev_nowait
Date: Tue, 19 Oct 2021 08:25:29 +0200
Message-Id: <20211019062530.2174626-7-hch@lst.de>
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

Use sync_blockdev_nowait instead of opencoding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ntfs3/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 859951d785cb2..a87ab3ad3cd38 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1046,7 +1046,7 @@ int ntfs_flush_inodes(struct super_block *sb, struct inode *i1,
 	if (!ret && i2)
 		ret = writeback_inode(i2);
 	if (!ret)
-		ret = filemap_flush(sb->s_bdev->bd_inode->i_mapping);
+		ret = sync_blockdev_nowait(sb->s_bdev);
 	return ret;
 }
 
-- 
2.30.2

