Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD133A1E9B
	for <ntfs3@lists.linux.dev>; Thu,  5 Feb 2026 09:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770284983; cv=none; b=s0OuUm8RhSEA651wQdZInBwK+JKqjqvR0m7jKE/QErxBAADOE9okgkefWq2f9Aod+vBH/RBsNlgEkP5Orsb1/51ISrgqgq5k8cD6wsvOyuiCYJwLT5DNWM9JQupAj2+wV0ciIG+Y/z7fxGAxWKOg0/nw5l/3AjLqvTFOxqpbp+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770284983; c=relaxed/simple;
	bh=uqbPScY7Mrr9zbcPk6OPKeVSt6cBkne8zch+j08rxGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYiK3u6q44ayqlQPiy70DDakAcEoBiEBXJiaSYGYI0vr3BiWY7OqeWH9JFpAmURMRevoegVj3fSSjK3FhKAWccQ2CZNFWfJNNhgSfCJ+CdhkhMbLE84MfDzZq0ZomEiHh/bACfIg76Cr79lXpLCopgDDySGJ9VAJe6UuV5bZ7f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLSWYJDx; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLSWYJDx"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79088484065so6671227b3.1
        for <ntfs3@lists.linux.dev>; Thu, 05 Feb 2026 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770284982; x=1770889782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbWiDKnd62npO8LZDnvmNT6GdPwvNySxgdLg35IKHns=;
        b=KLSWYJDxGFHGAHj3Yi3gSavTDhVkXMA/WsNQ+bo1Ff1YyxmtiYfKybvGGin9YpueQC
         B/84iuE+HLlqMybJiR4eQ+Nmz/FmJGpH8gT6NtgtTOAzU3foEWb8Qaxs8MGXuC/i41E4
         7awXPkRJbuYY154M8MvVbNO6HXMzVzNki9LSyj2Oy/RZX6s5a6GoBt3xHc7ItiLGEF20
         NZap30IDntR3HyI6MhoWselEoZP8i7P+so9KjJoDmkBmPxuee8soLLEXCayr1VNtXr/1
         uosijEDpz2XUoj+aXdUk2bRys8f9CN/u56rloDqgQVEWUDbWpJtDZMaO/G5T1MuKeUB8
         ipVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770284982; x=1770889782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbWiDKnd62npO8LZDnvmNT6GdPwvNySxgdLg35IKHns=;
        b=WB+r/SO0093bBmTbs2G1/kuCy5gneHPo2IdGR6TQaZzDVvJAs8sP86eg8Tvo+ejFSD
         pqJd81PB7nfy91g4qP/xBAhXFxkRG8Wf8yz+bztgf6TXzsCttZGv4YBERnkW30agqIzh
         5RF1fojYzSoj7RLHTAmsL+jQKWuVAVgwr9RCOcqQSbVPBxw6qvwm4bh98WF+QUMTY+TA
         xee2LEZkeYu8c75ElwpUNZohoGJE8Ek6eiJh4siCPkdzk0sT4ws2gvKA+Lm4A2gbEZ0s
         j9w8ycylO2V2JA0XElaEWDnmF1aOqrgnDYp2qEM1wQVWVTuhjRMjWOMEGz7Am5Zi8hAd
         lz4A==
X-Gm-Message-State: AOJu0YwQ1/URUOJPg+FRmA7Nj2cWuPlEW/td6PHLx246wMMVdz3H+XwR
	xeEz7CmSXLJydwNTAeCf4ZQomFrUpsSJcjiOvoXxlPxsfJzd2gJjJTRG
X-Gm-Gg: AZuq6aIVW+tZzTftwe3CHbydu2GjhpjEqQ1YmAe5wHLAZpHitA+ibm1WoHfdZ0Dp6Db
	KOrcBe/3RqzwW9fQkwzAPxbDDzRuW1FhwF1+WzzYStHfy2OriijdNnH8gnN22zKpkPmIvsgtQgU
	I+VlaNfA3GpmD+19oMclWReYoXa2fUAw3UdONH/GhR5MRkUetClmHAskQEJEb11fvBTbvI9EBGA
	xy552WER8p+OficYcnUr7+x2VGoKGGy3n18SDHBa8Z+7kmxpBtwdnCvFS/qQzGr70Xg8972l1Rj
	XMY9bZ8FXtYndu4SzpAWu/jk5mCHEAoKR4+5nElJ8kZRQgX2LkAmqjN6bgG4eZ+5rCRXuFQmrvG
	XA9D6RWjMXxIYI8graX/SnP/hlgeVjl9BFohXpnBReTtGiXvwxRmAH9QMmCuigYS93MFaBgdUdp
	+3EuTfFj7XmhcveQCJ0KWGLYHQ/6x5d0Dhye/RQS25nW7cV4Q21veeHsWliZSU4SYBunh2L8LqI
	a30Y0okJQ==
X-Received: by 2002:a05:690c:f03:b0:794:9683:4486 with SMTP id 00721157ae682-794fe69c472mr113447537b3.30.1770284982504;
        Thu, 05 Feb 2026 01:49:42 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc5ea03bsm4807961d50.24.2026.02.05.01.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:49:42 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] fs/ntfs3: return folios from ntfs_lock_new_page()
Date: Thu,  5 Feb 2026 17:49:34 +0800
Message-ID: <20260205094934.10500-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_lock_new_page() currently returns a struct page * but it primarily
operates on folios via __filemap_get_folio(). Convert it to return a
struct folio * and use folio_alloc() + __folio_set_locked() for the
temporary page used to avoid data corruption during decompression.

When the cached folio is not uptodate, keep the existing behavior by
calling folio_file_page() and converting the returned page back to a
folio. Defensively handle error pointers from folio_file_page().

ni_readpage_cmpr() is updated to consume the folio return value while
keeping the existing page array and cleanup logic unchanged.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 fs/ntfs3/frecord.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 641ddaf8d4a0..a23aaf34f001 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2022,27 +2022,31 @@ int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
 	return err;
 }
 
-static struct page *ntfs_lock_new_page(struct address_space *mapping,
-		pgoff_t index, gfp_t gfp)
+static struct folio *ntfs_lock_new_page(struct address_space *mapping,
+					pgoff_t index, gfp_t gfp)
 {
 	struct folio *folio = __filemap_get_folio(mapping, index,
 			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
-	struct page *page;
 
 	if (IS_ERR(folio))
-		return ERR_CAST(folio);
+		return folio;
 
-	if (!folio_test_uptodate(folio))
-		return folio_file_page(folio, index);
+	if (!folio_test_uptodate(folio)) {
+		struct page *page = folio_file_page(folio, index);
+
+		if (IS_ERR(page))
+			return ERR_CAST(page);
+		return page_folio(page);
+	}
 
 	/* Use a temporary page to avoid data corruption */
 	folio_unlock(folio);
 	folio_put(folio);
-	page = alloc_page(gfp);
-	if (!page)
+	folio = folio_alloc(gfp, 0);
+	if (!folio)
 		return ERR_PTR(-ENOMEM);
-	__SetPageLocked(page);
-	return page;
+	__folio_set_locked(folio);
+	return folio;
 }
 
 /*
@@ -2064,6 +2068,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
 	u32 i, idx, frame_size, pages_per_frame;
 	gfp_t gfp_mask;
 	struct page *pg;
+	struct folio *f;
 
 	if (vbo >= i_size_read(&ni->vfs_inode)) {
 		folio_zero_range(folio, 0, folio_size(folio));
@@ -2099,12 +2104,12 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
 		if (i == idx)
 			continue;
 
-		pg = ntfs_lock_new_page(mapping, index, gfp_mask);
-		if (IS_ERR(pg)) {
-			err = PTR_ERR(pg);
+		f = ntfs_lock_new_page(mapping, index, gfp_mask);
+		if (IS_ERR(f)) {
+			err = PTR_ERR(f);
 			goto out1;
 		}
-		pages[i] = pg;
+		pages[i] = &f->page;
 	}
 
 	err = ni_read_frame(ni, frame_vbo, pages, pages_per_frame, 0);
-- 
2.43.0

