Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62513AD4B
	for <ntfs3@lists.linux.dev>; Thu, 28 Nov 2024 19:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732823083; cv=none; b=EVuEYg3pK91YP3bDStUskWWRIMSXWW2nPjDorz+FwKOlTwGk7pFD22CKjnchY4TDo8ub5nQJoZIFmtCLr8FlvVs8KA74FwBLabuQrn+yjYzbuDY6ksq3ThycG+vRQj9LBgKBy7AJve50KaUDwATDRSjyLyyTxB+qvjI7M/F0hKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732823083; c=relaxed/simple;
	bh=WYhlFpczEeRGkoe4tr++d6y1fdKQU9bYzjMVoeOilgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qTIr/nwRt8l0C3SnkY4qxBMO+jJcC8FafRIjP963ebJ7oaSqUHVByu99sSsFt+JqSMFAJ+wysnYSt43RJe+phdOQ/5dGtmQ3FcI8MVMXvVtBdP79GtjvzzSaZeyLIbzl3BZN8r+TPnRxY6AMJaB6bh8N1w7YoAhN/R+9TaZEtwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Js7a014K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Js7a014K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qEORgdMlULtpL9rssDaTPkmuxaT8wIO86AqvfgjEpM8=; b=Js7a014KB8sth6QMpiGa8wwMXN
	YcwIau53P6NpyKuNzmz25Q+0bHP6MiM5+uTWyw6eJ4zsLo7i1sy8U1HIAjz2aC28XLe1sOZxntETd
	g92cWyUd+vrhw6nn+9KA8+Kv6uLP1gKoQi+UEAIQGGJSVpgRLUo1ut3gvNoGKzGl+pV524iofvIDx
	7QPcykZJIz8hY7i806EfB75aAZrzkNt3Hq9ruQY3aMJcL8wKHYN+RGOyNYXwbXu8PDX5GJyEUx3Ag
	e6KHNQ8tEpoQtitnXmuCVYFHKmOttGJ9PnkXH21GFWrFGyYPOxBUdgXCXrTBcjrDFjL5Wco/YoZH4
	PzRn0gHQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tGkRE-000000032QC-04VF;
	Thu, 28 Nov 2024 19:44:32 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	ntfs3@lists.linux.dev
Subject: [PATCH] ntfs3: Remove an access to page->index
Date: Thu, 28 Nov 2024 19:44:28 +0000
Message-ID: <20241128194430.724278-1-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the first page passed to ni_write_frame() to a folio and use
folio_pos() on that instead of open-coding the access to folio->index,
cast & shift.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ntfs3/frecord.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 8b39d0ce5f28..c57f0686b14b 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2726,9 +2726,10 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
 {
 	int err;
 	struct ntfs_sb_info *sbi = ni->mi.sbi;
+	struct folio *folio = page_folio(pages[0]);
 	u8 frame_bits = NTFS_LZNT_CUNIT + sbi->cluster_bits;
 	u32 frame_size = sbi->cluster_size << NTFS_LZNT_CUNIT;
-	u64 frame_vbo = (u64)pages[0]->index << PAGE_SHIFT;
+	u64 frame_vbo = folio_pos(folio);
 	CLST frame = frame_vbo >> frame_bits;
 	char *frame_ondisk = NULL;
 	struct page **pages_disk = NULL;
-- 
2.45.2

