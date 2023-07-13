Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF13A52
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 03:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JVMDLCJl/ahr8KIqhVfeFDOeM/wgOLTi12cImSKMuZE=; b=Y1f/pCg03zeVz2SDpGIeEbHPg2
	59lT4PRUm9yNtQwqsolrKPZ5OQR2LEA/0PnNwdt9pYSJUKh8w3RkcI1/H+BDlHjgGW+PMtysN+/np
	HyzzTc4eyhO137g8RrlJXGDKxIqg+2ssOYtiLLkvjwY//NKSYzcS28klzgb8aONWjunn5VBwd74+a
	G6ZOtv5+iD+tZU/jK8q6vNzQ7erA6DfjOrwrWeSf6iM12PdPwoeiII8JVyMlM8wWz4/1QK8bEZ+0K
	darR+0VjipCVODKe32gLL+cdbLNzUTK51Sfhutza7+wgYgmTvZEcOAxuviRNB2pSEkcS9C+5FJwY4
	OwWM2/sQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJnQA-00HMrm-Jc; Thu, 13 Jul 2023 03:55:14 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Sterba <dsterba@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	"Theodore Tso" <tytso@mit.edu>,
	Jan Kara <jack@suse.com>,
	linux-ext4@vger.kernel.org
Subject: [PATCH 5/7] ntfs3: Convert ntfs_get_block_vbo() to use a folio
Date: Thu, 13 Jul 2023 04:55:10 +0100
Message-Id: <20230713035512.4139457-6-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230713035512.4139457-1-willy@infradead.org>
References: <20230713035512.4139457-1-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a user of set_bh_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ntfs3/inode.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index dc7e7ab701c6..8ae572aacc69 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -554,7 +554,7 @@ static noinline int ntfs_get_block_vbo(struct inode *inode, u64 vbo,
 	struct super_block *sb = inode->i_sb;
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 	struct ntfs_inode *ni = ntfs_i(inode);
-	struct page *page = bh->b_page;
+	struct folio *folio = bh->b_folio;
 	u8 cluster_bits = sbi->cluster_bits;
 	u32 block_size = sb->s_blocksize;
 	u64 bytes, lbo, valid;
@@ -569,7 +569,7 @@ static noinline int ntfs_get_block_vbo(struct inode *inode, u64 vbo,
 
 	if (is_resident(ni)) {
 		ni_lock(ni);
-		err = attr_data_read_resident(ni, page);
+		err = attr_data_read_resident(ni, &folio->page);
 		ni_unlock(ni);
 
 		if (!err)
@@ -642,17 +642,17 @@ static noinline int ntfs_get_block_vbo(struct inode *inode, u64 vbo,
 		 */
 		bytes = block_size;
 
-		if (page) {
+		if (folio) {
 			u32 voff = valid - vbo;
 
 			bh->b_size = block_size;
 			off = vbo & (PAGE_SIZE - 1);
-			set_bh_page(bh, page, off);
+			folio_set_bh(bh, folio, off);
 
 			err = bh_read(bh, 0);
 			if (err < 0)
 				goto out;
-			zero_user_segment(page, off + voff, off + block_size);
+			folio_zero_segment(folio, off + voff, off + block_size);
 		}
 	}
 
-- 
2.39.2

