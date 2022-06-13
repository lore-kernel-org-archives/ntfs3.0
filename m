Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E111103
	for <ntfs3@lists.linux.dev>; Mon, 13 Jun 2022 05:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+wB/nqOESlmBKGsPGGPvPk+1JR7GdqX/FHAB3WXgdkI=; b=GgvoeVQPdRkCIkuIXOuXZNK6Pp
	jjhDh27mjZPk6mpG4OIjrjTYa5AqdNMcp40vsyWIn6lLM0KiVi6X2sQ1fSH97/7IIip/x7WRQ5MYX
	sfCfnjRbPOvI/qfNj5p/o3dHUubDG+h234+ilkGjpXaERdO5cid9rc0VhO0zBrW+ut2Ku03JzleXg
	JK0IXWsEOutO5b5XanEZ+XC8S7cKwEAjxfEi6gAYc4kaO7Jaljg3rmyfGrg2RLWTHiPkEpJqM/txF
	vTBhmi0u5zTBa1BTxzvHR9kJBye6Xr/sQZj4MktxRXnxVczCdtvA3A81XIxZojmipgY5nhvX1bD5w
	5aNm4mpA==;
Received: from [2001:4bb8:180:36f6:f125:c38b:d3d6:ae6c] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0clS-001V4u-RK; Mon, 13 Jun 2022 05:37:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net,
	ntfs3@lists.linux.dev
Subject: [PATCH 3/6] jfs: stop using the nobh helper
Date: Mon, 13 Jun 2022 07:37:12 +0200
Message-Id: <20220613053715.2394147-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613053715.2394147-1-hch@lst.de>
References: <20220613053715.2394147-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

The nobh mode is an obscure feature to save lowlevel for large memory
32-bit configurations while trading for much slower performance and
has been long obsolete.  Switch to the regular buffer head based helpers
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/jfs/inode.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
index 259326556ada6..d1ec920aa030a 100644
--- a/fs/jfs/inode.c
+++ b/fs/jfs/inode.c
@@ -301,13 +301,25 @@ static int jfs_write_begin(struct file *file, struct address_space *mapping,
 {
 	int ret;
 
-	ret = nobh_write_begin(mapping, pos, len, pagep, fsdata, jfs_get_block);
+	ret = block_write_begin(mapping, pos, len, pagep, jfs_get_block);
 	if (unlikely(ret))
 		jfs_write_failed(mapping, pos + len);
 
 	return ret;
 }
 
+static int jfs_write_end(struct file *file, struct address_space *mapping,
+		loff_t pos, unsigned len, unsigned copied, struct page *page,
+		void *fsdata)
+{
+	int ret;
+
+	ret = generic_write_end(file, mapping, pos, len, copied, page, fsdata);
+	if (ret < len)
+		jfs_write_failed(mapping, pos + len);
+	return ret;
+}
+
 static sector_t jfs_bmap(struct address_space *mapping, sector_t block)
 {
 	return generic_block_bmap(mapping, block, jfs_get_block);
@@ -346,7 +358,7 @@ const struct address_space_operations jfs_aops = {
 	.writepage	= jfs_writepage,
 	.writepages	= jfs_writepages,
 	.write_begin	= jfs_write_begin,
-	.write_end	= nobh_write_end,
+	.write_end	= jfs_write_end,
 	.bmap		= jfs_bmap,
 	.direct_IO	= jfs_direct_IO,
 };
@@ -399,7 +411,7 @@ void jfs_truncate(struct inode *ip)
 {
 	jfs_info("jfs_truncate: size = 0x%lx", (ulong) ip->i_size);
 
-	nobh_truncate_page(ip->i_mapping, ip->i_size, jfs_get_block);
+	block_truncate_page(ip->i_mapping, ip->i_size, jfs_get_block);
 
 	IWRITE_LOCK(ip, RDWRLOCK_NORMAL);
 	jfs_truncate_nolock(ip, ip->i_size);
-- 
2.30.2

