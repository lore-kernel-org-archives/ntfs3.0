Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECE510F1
	for <ntfs3@lists.linux.dev>; Mon, 13 Jun 2022 05:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=DDsG9TIypX9i4Jub9ds/rZf5G8m0UHXd5E1QbdoBBD0=; b=N9TsM8iT7ekZbDQfUGaiTFwUXU
	JcI0aBGvdUEZlGHwm/7Gg19OovVj+VIwh/QosgXQTjie0wQ5v6DSgzZEOGJHsJQ4BQPEuuEkHddhv
	/Mb8t3PZkjApccMEshQeDjGPr4ZIL01urVDOiZJMlV7XetbwzGTWR1jOLSNkHdWkbQm0UsSPYaCRf
	V9LU0XmI/FR72D18BfloytbAj/xb6rWUIRKfCAGGPZCyzLf2QjZJWUIiDEgZkl+0OUSB4Tu9Yojo9
	x2Ka0CGp1GvnzyMkLcGbhDM+ML2XWh0ReJ2ijpIE4h0Jery3bob4pKQtwxcC3N82tUVGyhUAsurVo
	nBM/rNQA==;
Received: from [2001:4bb8:180:36f6:f125:c38b:d3d6:ae6c] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0clN-001V4A-It; Mon, 13 Jun 2022 05:37:22 +0000
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
Subject: [PATCH 1/6] ntfs3: refactor ntfs_writepages
Date: Mon, 13 Jun 2022 07:37:10 +0200
Message-Id: <20220613053715.2394147-2-hch@lst.de>
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

Handle the resident case with an explicit generic_writepages call instead
of using the obscure overload that makes mpage_writepages with a NULL
get_block do the same thing.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ntfs3/inode.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index be4ebdd8048b0..28c09c25b823d 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -851,12 +851,10 @@ static int ntfs_writepage(struct page *page, struct writeback_control *wbc)
 static int ntfs_writepages(struct address_space *mapping,
 			   struct writeback_control *wbc)
 {
-	struct inode *inode = mapping->host;
-	struct ntfs_inode *ni = ntfs_i(inode);
 	/* Redirect call to 'ntfs_writepage' for resident files. */
-	get_block_t *get_block = is_resident(ni) ? NULL : &ntfs_get_block;
-
-	return mpage_writepages(mapping, wbc, get_block);
+	if (is_resident(ntfs_i(mapping->host)))
+		return generic_writepages(mapping, wbc);
+	return mpage_writepages(mapping, wbc, ntfs_get_block);
 }
 
 static int ntfs_get_block_write_begin(struct inode *inode, sector_t vbn,
-- 
2.30.2

