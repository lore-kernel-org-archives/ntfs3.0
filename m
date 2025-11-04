Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F65283FEA
	for <ntfs3@lists.linux.dev>; Tue,  4 Nov 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762273171; cv=none; b=ZvmUDwAUIL7QbgeKUkOwlJOBcwFJoq1LoCkC1PLntrbTAL0oh6AievjktReHs2OEcotrf7VL6gfpd3nX8RXMyvgtL7KVLfP/y3VGTHdTIJO37G2PTlqDRDduX0Er9fITvHlXtIb6m2ZkCC+P11WrkdUjIO59HvZK6Fnm2ieSOLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762273171; c=relaxed/simple;
	bh=GeZ3Yx2Nustph9F7+u4asv383OMD1Ha7urNnR+GXemk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBynOm6VK65wUi/ggd7hXhMfaVOtxC77ftrxaevLed3uTd3+stt7j1js11oKsIvJE7d11JE9L1qjZLY6S+3NhpaciJ3eCNnP9RZ32VLdaA14VPwCbzfT5YT/vPXqtVBWzjUsGR48WpuPaSlwSPl/nZXsCUK5i38ZBKJlH/RQT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bq7pUomj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bq7pUomj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so5404690a91.2
        for <ntfs3@lists.linux.dev>; Tue, 04 Nov 2025 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762273170; x=1762877970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTY5WyoBsQN2JxFiFnbwp1fuuZHU0Trrum8pR4htY6M=;
        b=bq7pUomjMROS2sthbc5qP1AU+BFWiiyvtjcrMl7Fq++UwYZnei6DF/dMFO7qXnpHts
         bbjWy8conwM3Y2AaK21VzMl0k6FXyzioftMit/vZYdHBh5I94uhcXpC+DvYWWf/8P4EK
         ebW5ZLF+5wrPj4huAsqVs1JhwJs3sNRbaM2nfgnEi+tRxTnMMl48m3UUjFD41oB63UwR
         kAX0DrbYrZG6DaynOgeZ8whrBJD1XkWAyvQv6qNORY8tnvbX8fnPVDi8HULgn5f+NJPO
         pHuhzh16jG7tKGxhY9sZpemnb/xdwN/Mx2gsloxX59DbabdRv15+Ln59HrTyabO2bNjk
         6b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762273170; x=1762877970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTY5WyoBsQN2JxFiFnbwp1fuuZHU0Trrum8pR4htY6M=;
        b=LEoMuDMWnlW7dufKtEdiQKT8mrSjxbc7XPSVJv/u3wclWPw18zr+MDMnjZK24CNkQv
         sQ7Qp4YgI3qebfwr4FnHRoYMW68x8WFdCVS3YZ1g0qwCDR6+Q5LCN289i2rhg5ED/6CN
         V+kj39H/M7rQnhd/JZ7hxs/om4CL6JkOw+pWNIAvMlBLsxa3371j+57ACljyea8oWGYr
         mY3K0U/LL80uYDCTf4rQaH+Y/ZWxCXm3UIcZ+SVI4E4jcjkt2JYFuCiDHJ0eNdWWvMYm
         R682NoqGQYCoahro8SZCikHe+ywmSR46u37GsZp0ZQi2CGCZ93xGzdA6TPmI+W5ypdLb
         dH0A==
X-Gm-Message-State: AOJu0Yxhy7v7U/V5ypRUBtZPqpB02mvDnf5hx7LzOYTElu7cbZn9KuqY
	pLgrFoWTDYNrUHgZwplOcY5HjnBQWzlar6ttP8XH76IRrrVmfiVxW/sk
X-Gm-Gg: ASbGnctTCxZZnyzByEHeh+z4BpzK0CNnihKZDWZvFUcluowQxsqhjJqeGsYQuxoVNHs
	YJB2JweOBlv3RsGr99+PGVEDLa4uVB7WkSRyf57dKQcUBvV8fO9Nf+PZ3l66gtylYsKkOSFcmiv
	mjuNIb/KH2IYdh4ckkPiDhTeBOCfPT5CGkoT1p3ZaOoN+3ySwL6Lf0OuWZqSgn244s/11KznxWn
	DLTsOXIm6kS7SbiADcBIBRCL54eUdoqsNfk+o0FFpJfklwKSX4plRPZGSlveQMdC/XNW74YzhSW
	gPaDAaIY9IzWg47tLI5o+34WAlMAur/iMAd8MQVBUawFkom/Qbq4Ch8gy7R253Ts65wdyCUWnwu
	SjxW4ACZQF9Prd7fLg1A5/rNdFBGLmz5DrQ4uhMHAFVvW0Yshgi4cyGWWqMtkM2LqsmaCY5gP0q
	4=
X-Google-Smtp-Source: AGHT+IEOdukJj9iAE0dM5GhVY3oVQCgeXAqTQ5UrcJb6jylIu6zhZdGwFEjdzwklrdczbajwQ4pahg==
X-Received: by 2002:a17:90b:35cc:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-340c261fc91mr15182354a91.14.1762273169550;
        Tue, 04 Nov 2025 08:19:29 -0800 (PST)
Received: from fedora ([110.224.245.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c7a21a3sm5027696a91.17.2025.11.04.08.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:19:28 -0800 (PST)
From: Shi Hao <i.shihao.999@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	i.shihao.999@gmail.com
Subject: [PATCH] fs: ntfs3: remove redundant kmap() calls
Date: Tue,  4 Nov 2025 21:49:13 +0530
Message-ID: <20251104161913.20256-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary kmap() mapping calls which serve
no functional purpose because their return values are
immediately discarded right after the calls and also
vmap() calls has been used right after these kmap()
functions which is another contiguous memory mapping
function too.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 fs/ntfs3/frecord.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 8f9fe1d7a690..372673bf803f 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2407,8 +2407,6 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 	 * To simplify decompress algorithm do vmap for source
 	 * and target pages.
 	 */
-	for (i = 0; i < pages_per_frame; i++)
-		kmap(pages[i]);

 	frame_size = pages_per_frame << PAGE_SHIFT;
 	frame_mem = vmap(pages, pages_per_frame, VM_MAP, PAGE_KERNEL);
@@ -2657,7 +2655,6 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 out:
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		kunmap(pg);
 		SetPageUptodate(pg);
 	}

@@ -2735,7 +2732,6 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
 		}
 		pages_disk[i] = pg;
 		lock_page(pg);
-		kmap(pg);
 	}

 	/* To simplify compress algorithm do vmap for source and target pages. */
@@ -2745,9 +2741,6 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
 		goto out1;
 	}

-	for (i = 0; i < pages_per_frame; i++)
-		kmap(pages[i]);
-
 	/* Map in-memory frame for read-only. */
 	frame_mem = vmap(pages, pages_per_frame, VM_MAP, PAGE_KERNEL_RO);
 	if (!frame_mem) {
@@ -2815,15 +2808,11 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
 	vunmap(frame_mem);

 out2:
-	for (i = 0; i < pages_per_frame; i++)
-		kunmap(pages[i]);
-
 	vunmap(frame_ondisk);
 out1:
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages_disk[i];
 		if (pg) {
-			kunmap(pg);
 			unlock_page(pg);
 			put_page(pg);
 		}
--
2.51.0

