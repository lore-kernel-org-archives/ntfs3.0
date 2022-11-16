Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDD45CB7
	for <ntfs3@lists.linux.dev>; Wed, 16 Nov 2022 13:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=wN27VSHbVPU6TbaQTOB8tbPBzE7eCXcliRnMfQc+TUc=; b=YV8+81vKRXuoZAF7gFPUTXzTnh
	aBYHVNOWIpvX5R+vt1WUEAB7m01XTfFmuQWXzvTEifYTlym1yJ3vfvsl6m1b1V+a520n4cOCyANUC
	F4aLqxfnaPvgcnA6hhTUTRIECnArZrsDKXvMbFAEJ9vksMxWkcRHT9q9XAGuZcTAACPohgOY4Fhpg
	YmJtGEVbRWHBqsxvZKO/bUKf7MxWABaLf87DpljCaNWtmHYNqR8JvsqDk5eMzznVRB+UGqyCGxb5y
	qv8Ge3wssieLHQA19tlq6+3P7TgDJ1zhbq7iP3NeIm4IdgpOntR8VAwB5uXZ9NZ3hFV7YxmirfBOb
	aBBjfQdA==;
Received: from [2001:4bb8:191:2606:427:bb47:a3d:e0b8] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIZ8-003zfe-Q4; Wed, 16 Nov 2022 13:34:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/2] ntfs3: stop using generic_writepages
Date: Wed, 16 Nov 2022 14:34:51 +0100
Message-Id: <20221116133452.2196640-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116133452.2196640-1-hch@lst.de>
References: <20221116133452.2196640-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Open code the resident inode handling in ntfs_writepages by directly
using write_cache_pages to prepare removing the ->writepage handler
in ntfs3.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ntfs3/inode.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index d5a3afbbbfd8c..7a869e2a98620 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -846,12 +846,29 @@ static int ntfs_writepage(struct page *page, struct writeback_control *wbc)
 	return block_write_full_page(page, ntfs_get_block, wbc);
 }
 
+static int ntfs_resident_writepage(struct page *page,
+		struct writeback_control *wbc, void *data)
+{
+	struct address_space *mapping = data;
+	struct ntfs_inode *ni = ntfs_i(mapping->host);
+	int ret;
+
+	ni_lock(ni);
+	ret = attr_data_write_resident(ni, page);
+	ni_unlock(ni);
+
+	if (ret != E_NTFS_NONRESIDENT)
+		unlock_page(page);
+	mapping_set_error(mapping, ret);
+	return ret;
+}
+
 static int ntfs_writepages(struct address_space *mapping,
 			   struct writeback_control *wbc)
 {
-	/* Redirect call to 'ntfs_writepage' for resident files. */
 	if (is_resident(ntfs_i(mapping->host)))
-		return generic_writepages(mapping, wbc);
+		return write_cache_pages(mapping, wbc, ntfs_resident_writepage,
+					 mapping);
 	return mpage_writepages(mapping, wbc, ntfs_get_block);
 }
 
-- 
2.30.2

