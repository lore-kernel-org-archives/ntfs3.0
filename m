Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05233EAEF
	for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713108; cv=none; b=rFaZF/ayjK6geQ1KJ9HPG+dDVYyyXrVsmu8neO35xk5H+uarsOJdLEt6rqI0jB/utSKLNpoT3Wh+9mCzDa5+pjTFthwtZ16LiLz1mA0k318cZ90BzRRHfQaSDWV/NV4vU36Pi3S7CS3wBbxF7tn+JGFi7UUol2FMi9rLLv3q/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713108; c=relaxed/simple;
	bh=IQk4UzcYY75MLGhtAKmFDWXe3EWxpLfeGLiZbBZmOTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l6zgzpRuvGAWsDq4bvqlc/AMy+B0/hkhE90R5AYl933ogvsnMKSBExKGCkoc4WEI20EqemCTfO3OhKn1B4h8zFtUCN43UjOGkWmhWnfWP/BFVi7Uz3wiD6GIMAVRGUpvZoXR59k2eQzKDFYP1b+yJdi4GqrKLo8gn/PGPHyuxsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNn2zvaH; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNn2zvaH"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-11beb0a7bd6so2462007c88.1
        for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 00:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763713105; x=1764317905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9uQUsysFrv2eFtHnu17b6ejhzRgB/BOqXyxbR99K8c=;
        b=VNn2zvaH1dla8AYLvTewYko7Ry4+H1pNkClbU0EHjR4Pjax9W1Z5AeUzKGkGmapwhu
         Zn/eAHO2juPdsB+bdpwRogURwMXs8AjraBZkeEUWo4Y0hBjlpmviRmvj2PRGII8MZZ/W
         02vzTPtd6NbjOs/QdX7o5rEld+t9ZNsnTSSTG6M9Vm+3TGaAfXtITwX3dBqopZ64U4o3
         dQB0I/BumzvDR3g9L+V56HYdYVsP9rWr9pWOM3z5qNrAzwA4jw0CiCGhUCIafLlbJkNW
         sFCBTEoUlAorSrrXs5VOvL9XCDjYwx3SpOEHu05B/XNz8ZDg63tj5kt5NErXdmAqTR6w
         A/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713105; x=1764317905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9uQUsysFrv2eFtHnu17b6ejhzRgB/BOqXyxbR99K8c=;
        b=CU8BCBCTObWEUFcbPdWxkmDLv6vp9mQdA7aI7AJzP9lTCshfPBwlN+WziEPQ3hmN0V
         zlv14QfkHS36fN/2pca8LwKBxbl1n50D9IZUhmzQ0rBHWNkCfr7kPTYy9cLwgMKy5Bus
         y6nlKYBFYKnZprYDY7q499vJTdslLGGlkfXveJwANqLCt1ZMm0oZbHvS7vocnL4z6t9g
         i7qjh/I1nv6W9gWPGm6pDrOb25dAgRPgOGOisOfPnGJbt4x5IxiT6+g1z9Y0EowbIp2V
         d3VtxFqa3JyfpsH7MrhSv9Snl75exnljcGRbz34eEwKXtmfxoqEVQmzSaLoYcfqs7qxK
         sE4g==
X-Forwarded-Encrypted: i=1; AJvYcCU2H6FWoyxZRU2nhoSxs7RdgO2FhtFJ/g+k3l7iMwOTewau6tASJxGjkuqGBL4DvGpT/Z7ZWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyC4eT8RKWhCCYwkcCCk1v/OncKvzBbP0GYfmzfqn1s6aXwpQ84
	mXHCOncp7O0PKn0G0sVfRdciX6t4kWOnX/I9mCyy+rtXd7NkmALnkVLS
X-Gm-Gg: ASbGncvuc4ccDXJaaoS3mNfP+xsZ5UFGDWXKjQpOVZijy/sHJNV1dod8m8Ntb6Nztkp
	CHjIVx2cNpphk9FQsFrisHFYUgwJ3hSVUSuVwhVRNFH5ZsrOxNgjT+PWB9APAWFhXkSOFC8XQL/
	PEHwUU4wnXhAOHeqEwHDixXGlI+jRWvHYQjIZnAdwAW6u48hTYQbK5HQDcMolr1GGvbq6ykV13e
	HHcbnsORXPrU+uWqmK6HHiQyuGnK8Jxo3KJYGowWJj+wy399WQrS/jLctZ7qj9EvpjO8JBvAXC4
	NbMTtT7dWPbEk2cpBZI4a6SlxMJ73us5wDLGpdEGncudeXfmBNru2Zpt/D29SlruPx4C2OefPtM
	vZMEf1+6gaYiU/7pyra0t3fGqxxbzH+2i+cmDfICLUQEwS39K2QyTn4VUjTiTBocREgvefgdamm
	fmvLhVgptu7QR/PwDR5SWm3/+ygQ==
X-Google-Smtp-Source: AGHT+IHMz3ddZnRtvaJ/THHwP1wUMl1t1R0JBJZczRRfd42vINt7DVj8VsCW+6dMTczCFjZ0JXIsxw==
X-Received: by 2002:a05:7022:a93:b0:11b:a738:65b2 with SMTP id a92af1059eb24-11c94aefcabmr2003355c88.5.1763713104659;
        Fri, 21 Nov 2025 00:18:24 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm20997352c88.7.2025.11.21.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:18:24 -0800 (PST)
From: zhangshida <starzhangzsd@gmail.com>
X-Google-Original-From: zhangshida <zhangshida@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org,
	nvdimm@lists.linux.dev,
	virtualization@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	gfs2@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com
Subject: [PATCH 6/9] fs/ntfs3: use bio_chain_and_submit for simplification
Date: Fri, 21 Nov 2025 16:17:45 +0800
Message-Id: <20251121081748.1443507-7-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121081748.1443507-1-zhangshida@kylinos.cn>
References: <20251121081748.1443507-1-zhangshida@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shida Zhang <zhangshida@kylinos.cn>

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 fs/ntfs3/fsntfs.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index c7a2f191254..35685ee4ed2 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1514,11 +1514,7 @@ int ntfs_bio_pages(struct ntfs_sb_info *sbi, const struct runs_tree *run,
 		len = ((u64)clen << cluster_bits) - off;
 new_bio:
 		new = bio_alloc(bdev, nr_pages - page_idx, op, GFP_NOFS);
-		if (bio) {
-			bio_chain(bio, new);
-			submit_bio(bio);
-		}
-		bio = new;
+		bio = bio_chain_and_submit(bio, new);
 		bio->bi_iter.bi_sector = lbo >> 9;
 
 		while (len) {
@@ -1611,11 +1607,7 @@ int ntfs_bio_fill_1(struct ntfs_sb_info *sbi, const struct runs_tree *run)
 		len = (u64)clen << cluster_bits;
 new_bio:
 		new = bio_alloc(bdev, BIO_MAX_VECS, REQ_OP_WRITE, GFP_NOFS);
-		if (bio) {
-			bio_chain(bio, new);
-			submit_bio(bio);
-		}
-		bio = new;
+		bio = bio_chain_and_submit(bio, new);
 		bio->bi_iter.bi_sector = lbo >> 9;
 
 		for (;;) {
-- 
2.34.1

