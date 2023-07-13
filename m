Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E04689
	for <ntfs3@lists.linux.dev>; Thu, 13 Jul 2023 03:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=elFZct2zLYsO/DhALW8T/PkTJ32hYfvGI0lmoYqZOm8=; b=fCiRDDQ0vsrg84r3mAsPC/UJja
	5X9ojaJStev+XTF+eZJYbr17rKhQEEX9Ks9wL4MCB6e7OI6ojgep5XBSuh/DBw8cfgfEvy2BmKc6u
	Li69Ba8gh1z058APNhZq5Aim+JeSvfn8oczbZ4uMvAO4v7izUuF/mdeN/YyX/c+/D3ShMIyWMhaHy
	t7H/nzZ29DsCV9n+Duqfz91bmWB+fVjVvJVRGMp+cqXowLegsfEb7Q9RgjYONN/HJhfmvQwB4DFzh
	AK67mENltmR7LSdQ2RuuBlSfxaQqWnviR/iXAJKzBqP6VDC98loO+gHarV82dAFbYyh5TW3hzlwdr
	Fwca4Cew==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJnQA-00HMrq-Qg; Thu, 13 Jul 2023 03:55:14 +0000
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
Subject: [PATCH 7/7] buffer: Remove set_bh_page()
Date: Thu, 13 Jul 2023 04:55:12 +0100
Message-Id: <20230713035512.4139457-8-willy@infradead.org>
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

With all users converted to folio_set_bh(), remove this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/buffer.c                 | 15 ---------------
 include/linux/buffer_head.h |  2 --
 2 files changed, 17 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 587e4d4af9de..f0563ebae75f 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1539,21 +1539,6 @@ void invalidate_bh_lrus_cpu(void)
 	bh_lru_unlock();
 }
 
-void set_bh_page(struct buffer_head *bh,
-		struct page *page, unsigned long offset)
-{
-	bh->b_page = page;
-	BUG_ON(offset >= PAGE_SIZE);
-	if (PageHighMem(page))
-		/*
-		 * This catches illegal uses and preserves the offset:
-		 */
-		bh->b_data = (char *)(0 + offset);
-	else
-		bh->b_data = page_address(page) + offset;
-}
-EXPORT_SYMBOL(set_bh_page);
-
 void folio_set_bh(struct buffer_head *bh, struct folio *folio,
 		  unsigned long offset)
 {
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index a7377877ff4e..06566aee94ca 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -194,8 +194,6 @@ void buffer_check_dirty_writeback(struct folio *folio,
 void mark_buffer_dirty(struct buffer_head *bh);
 void mark_buffer_write_io_error(struct buffer_head *bh);
 void touch_buffer(struct buffer_head *bh);
-void set_bh_page(struct buffer_head *bh,
-		struct page *page, unsigned long offset);
 void folio_set_bh(struct buffer_head *bh, struct folio *folio,
 		  unsigned long offset);
 bool try_to_free_buffers(struct folio *);
-- 
2.39.2

