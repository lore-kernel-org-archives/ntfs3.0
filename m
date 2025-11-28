Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D0C2FBE1D
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318796; cv=none; b=Vgy46zzdwnBMA+u1UWjJ2W4wLpXgoOPjovV0BQzETS3DX0sem/B7CSz7Ch4ypHhDGjv43JQ4WI+a9VrM8TKGxlra3nmRlmAAB6cW5ZjUHSDymR3Q70IN5zBsoTFC6Ze6vPmr4EnGsO2TpZaq2FIoadyr104MhsptI++5DVn4/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318796; c=relaxed/simple;
	bh=rZqecGhzp3NmtFjaYLSNOTM+/xsMiNIYX8VY+Bn+fL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QXIebt30746wvv85gxT1QYcI2ewYmiHZibov7RsDkxc6xAwTamaK/9DL+1Nm3OVNuhuXm6XHPAvrmnB+TzyE1lbPvgZiGxcyBET6KrcLXv1MU3Imvps+Ouyh4wFYLmVktZjzCKXnKfJV1e+O9MJxHA9g4MNLW3XPAO8xnqfQCqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXY2A42u; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXY2A42u"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297e982506fso21631215ad.2
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318794; x=1764923594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7vHs8yXaPj8mv/GRmviioQ8omsZI2Wqns1LW2Ikl6c=;
        b=bXY2A42ud7FBQH3qIL8mEKigYEUsXDv08OcpyyfwlHCN+WwgpxwGjpFCzMGygZe/ci
         6WtbWfx7bw4V/CdvNKygCmnFmW0uDUSwWHiQCVnZO99G8gEfp/PwYDPCYh4nqhgkLJLF
         kptmi/fYwt8iswP3QtE1XQxlQ5PDBjH48rWXV0eFNbYz0tA3pBDzcfp26T8xkQEShzch
         LkCiokuVM7/ALhx2yhf7X6L3h4aveM9abHomprowb4yGsyi18IUKj8pCPUjM2r9bEQ1n
         dixORu8Gk7KfZjI8ovxCHWTEjZB94/q5Co7YowrrFktI93tFPni84ZaT8tO/pmzLTq8l
         dF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318794; x=1764923594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7vHs8yXaPj8mv/GRmviioQ8omsZI2Wqns1LW2Ikl6c=;
        b=lP+QjHbhLRxsvGNdTCGe/RlZ9MhGtjHIEe5MnPPWO0WCcJ4dA6jcwhX5NOys8uhSCs
         RQtMHEP/wQwkCP3GLvkrkIiT0dLKncOPv17u6+7oSrGaZLw/d4USuWeS6k+aPHRF485K
         smenEj0Ig+fsb1RFoviytsYlAwFGUCvSbG4qJZ4Q+j6ML9TwGHMf/vtarTKr+mg7AWwp
         OR2rnh28MqZ8bgK4OQRH1dTKniNYLExHCEfgeYJ7pO6OaFxg5lN50IANc/JE6dLkZ1ir
         H94WFBvo/261TNnB5TgnR0FdgM4yP+7Y5FbR+2M9VrLfB694LHFnJmucSvLTqKYFIUMW
         QcQw==
X-Forwarded-Encrypted: i=1; AJvYcCUt1wrFXSDx9KvSh9K2dVCE0yFYN0rXGxAUPRdFWQnaACA2rA0JPawMSoTiYJPTKdrSE6Llpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnTLNBgUsPj/W77nIYj/pqgYspI/idJxR2AmPsbcDFG0//x7nA
	YTD6DXTCRBe+omkR/uYQcU2GmIn29NxraXSUfYdd/9XGU2ZHBPKJnR49
X-Gm-Gg: ASbGncvoYG0ICqzBFUciSNmN/oq8k5vd7i1ztXCQxOK9owoPa9UrP8AYTP6p+DVUMxZ
	FPhPXKej/DgrMXbDq0kZzEIDfAd+bFH5q54zM20VHZ0epTBLITpySnrGRjQVlBnIinR2lx8BGEc
	8XfGXKpdi4E1Q3vah9MgYc9v3mEJpPzjcQ+bIzb8eN8jyUODXMK7eIiDWz+GXcuRA1nwzDy/4wO
	XeFWTY6s3FnibRvaB1O3oCNf9bjwUgMRGu6YZUyNH/oIWWd50xu71e6xDzndYZXB2eeH5SDSkHk
	C9uJsz8BFkenNqGwpdlQDuY8KpAumHkKgdIOvA4Yfi8yzXkZgHzD37kl9cuwEbNsIIGyyV1oQ7p
	hDX+K6wIZuee/ELaQ6Vmx09dK0h8e/e9NcaK7uchQ0Lja9OtFOfpuiZq+gIdfal5CySjlx6bl0H
	+3M3WDQAfb7vpiU6m/smmxt8DQYQ==
X-Google-Smtp-Source: AGHT+IGKjtGYvF0Bq9aksrL28VuK/U2PkCtZPwPR3BXXqxprAsbvk/b9CT8/yxSPTU2xDb2fwzHbRg==
X-Received: by 2002:a05:7022:41:b0:11b:b1ce:277a with SMTP id a92af1059eb24-11c9d8482b1mr15434117c88.28.1764318793604;
        Fri, 28 Nov 2025 00:33:13 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:33:13 -0800 (PST)
From: zhangshida <starzhangzsd@gmail.com>
X-Google-Original-From: zhangshida <zhangshida@kylinos.cn>
To: Johannes.Thumshirn@wdc.com,
	hch@infradead.org,
	gruenba@redhat.com,
	ming.lei@redhat.com,
	siangkao@linux.alibaba.com
Cc: linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	nvdimm@lists.linux.dev,
	virtualization@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	gfs2@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com
Subject: [PATCH v2 07/12] xfs: Replace the repetitive bio chaining code patterns
Date: Fri, 28 Nov 2025 16:32:14 +0800
Message-Id: <20251128083219.2332407-8-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128083219.2332407-1-zhangshida@kylinos.cn>
References: <20251128083219.2332407-1-zhangshida@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shida Zhang <zhangshida@kylinos.cn>

Replace duplicate bio chaining logic with the common
bio_chain_and_submit helper function.

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 fs/xfs/xfs_bio_io.c | 3 +--
 fs/xfs/xfs_buf.c    | 3 +--
 fs/xfs/xfs_log.c    | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/xfs_bio_io.c b/fs/xfs/xfs_bio_io.c
index 2a736d10eaf..4a6577b0789 100644
--- a/fs/xfs/xfs_bio_io.c
+++ b/fs/xfs/xfs_bio_io.c
@@ -38,8 +38,7 @@ xfs_rw_bdev(
 					bio_max_vecs(count - done),
 					prev->bi_opf, GFP_KERNEL);
 			bio->bi_iter.bi_sector = bio_end_sector(prev);
-			bio_chain(prev, bio);
-			submit_bio(prev);
+			bio_chain_and_submit(prev, bio);
 		}
 		done += added;
 	} while (done < count);
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 773d959965d..c26bd28edb4 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1357,8 +1357,7 @@ xfs_buf_submit_bio(
 		split = bio_split(bio, bp->b_maps[map].bm_len, GFP_NOFS,
 				&fs_bio_set);
 		split->bi_iter.bi_sector = bp->b_maps[map].bm_bn;
-		bio_chain(split, bio);
-		submit_bio(split);
+		bio_chain_and_submit(split, bio);
 	}
 	bio->bi_iter.bi_sector = bp->b_maps[map].bm_bn;
 	submit_bio(bio);
diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 603e85c1ab4..f4c9ad1d148 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1687,8 +1687,7 @@ xlog_write_iclog(
 
 		split = bio_split(&iclog->ic_bio, log->l_logBBsize - bno,
 				  GFP_NOIO, &fs_bio_set);
-		bio_chain(split, &iclog->ic_bio);
-		submit_bio(split);
+		bio_chain_and_submit(split, &iclog->ic_bio);
 
 		/* restart at logical offset zero for the remainder */
 		iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart;
-- 
2.34.1

