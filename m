Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902312773FE
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764406931; cv=none; b=FsfT/emnP4Ts/b63LLT4h6VGpqsYaH+tFU+ydojbwON4lm2F3vblX6rwnvhbUXSNwTdRC1HKw9SGHMjJKCAVU7KCg2YqK4OMdXeoFDA/cSmK0Fwe0qjewkq7QLZkdnDDQMREheJaqjvmfHvXqTwDTKYVI+LonOux7GCDO3wiAdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764406931; c=relaxed/simple;
	bh=FvdW5UGbfZbg4/JUFTbGCNNccxPDUjVX1PnGr5SdWKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CnLAe3lvUg2xXS53BVJmGs5dqNSpWYT+O6LozjxbCI5EJLBGvIiF3ob0yLvL2JQtb5nSWmz37OXXkeg8fCTSxStdxXkuCRdBEW/Bqo/A9protwcGlKspDKsLeqIJ3+uHyhP4tKcwJEITDH4vzjEoFP7fp8JS7zOhhwub06hAcNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sut2w6uG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sut2w6uG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2258754b3a.0
        for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 01:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764406928; x=1765011728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqwLZMa4ASc5Rs++C65X8rlK3EmN43I2MLDa5i9050U=;
        b=Sut2w6uGhsId2Yk2OtlET3e6SuiWi3wlms/Aov+int5QuSVhkIXpu34Ckemd8b4Tas
         C2Vdyj8S0X5eDm+hwbSCmJSQQF4Y9UfAOMx1yVcb8oXDwSDgU+WgkO0vl/oAEpUnwHdb
         otl1J4G+tKyPA8l35Rla+YcgSI8qNw/1j4IBxFFsHgkUMeKp9vohV8JwnAGICgxEJIaH
         RclDbY+vEffp5mLujhm0DIrS6LZfDWWsi4Z6ltKxuJGOhyHsz5zyOCfYt7+sbxOdoDcZ
         NnC4Jp4WmH75tUBCrn3jiKpM1G+rWLnHY4cRanI/atrElMqEPkjyqTu880UkvEOHdyvq
         WRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764406928; x=1765011728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fqwLZMa4ASc5Rs++C65X8rlK3EmN43I2MLDa5i9050U=;
        b=herSGWAyVVn3JHruBogTZO9rjPFrfAcbBAqaAbeas0SWPREqSjQKhsYpv/Yhy+d9Oz
         1w410N6evb3b3BFGbSEyE1bLTnC3ipWwN7qhU9rptUT5JVZzwmoRq0gfLCLPW30uEsV3
         P+9EtC0BsYP3fWhAGgS03jYaxF0OC4gZmZCJXes7Xa4gQ0fa+uUT8Ondq87/VLiO1/zs
         hiYBqFxqdglLYIf7HxslKzEBmbOl3dkZeevpPUsghuErZoyhHHnOw4/FE+MFn+c66Jdv
         OfJtRwg2fOxkwrR5B1ZNDehLjPU7vFiasBUrLBZRVjhkb2Ay4+l/YwIPFQKHAC4gaTGS
         AIsw==
X-Forwarded-Encrypted: i=1; AJvYcCWtkdSxuxoI+aDSIxRmAgCRUVKussghtS8l/q4hGuRVVEMq6kMv80EgeoFjuUXxEpJg5B5POw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwcJINEYR4DeBy34Y8qTWkAsV5x4GkdvTBAUImwz0pAuV+1zNz
	CBn8iAfcrzH+hRk7cJ9+bAhGdfdVMWoG4DkEfHcFeZmIPZ3qRSF2hoy4
X-Gm-Gg: ASbGncs1jw+GaR/s7pK3tgJqY2Gg4Y0puAa5IOBbDbZkTsYS+ZRdkY4dvxwZio2iGng
	gs3YuL4vcP4wkP9P1qMWK8X3wHocERvMjNtjJqifiSmCv7E12Nj7e90vL9P3sxnt7FgupCjyULa
	6DAZFzFPp+csi0N9JOPVsUfOynZMtovdf04lVZUGARfPWAQS7zG2r6gnZ13Ctku8nCSB5usR1do
	JWkl7XjRglNeTDRhtMPV3jNyx0RE5T2EsUFUd3thwoIMKW0tFLfR/RfPK/lFMlGrYLhoJWDaE1d
	UvqOT/1dl1/HvZ1CdPI9ZyRgelESnv2Fl6+CxcanTuZntcVOkrlJl7fePRRgldxm407RUImLLmK
	sBDlYtaXYYnBs9WXPhF7DQIbyJqEDnrpS1P8tNcou58k83v+zE8tyLsZxBuRGyWHBsau/r2ZkTM
	595G6n1S9S0i8ScJ9Ji1u1D92HUg==
X-Google-Smtp-Source: AGHT+IFpam2VF00mu2rmyIi1m2lRR+Kb7w2Y0p3kOg5DIMgR5i6hM310V7yybDkza8FyIBCJgjbVWA==
X-Received: by 2002:a05:7022:4186:b0:119:e55a:9bf8 with SMTP id a92af1059eb24-11cb3ef2761mr13917973c88.20.1764406927773;
        Sat, 29 Nov 2025 01:02:07 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm28114394c88.0.2025.11.29.01.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:02:07 -0800 (PST)
From: zhangshida <starzhangzsd@gmail.com>
X-Google-Original-From: zhangshida <zhangshida@kylinos.cn>
To: Johannes.Thumshirn@wdc.com,
	hch@infradead.org,
	agruenba@redhat.com,
	ming.lei@redhat.com,
	hsiangkao@linux.alibaba.com,
	csander@purestorage.com
Cc: linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	nvdimm@lists.linux.dev,
	virtualization@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com
Subject: [PATCH v3 7/9] fs/ntfs3: Replace the repetitive bio chaining code patterns
Date: Sat, 29 Nov 2025 17:01:20 +0800
Message-Id: <20251129090122.2457896-8-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251129090122.2457896-1-zhangshida@kylinos.cn>
References: <20251129090122.2457896-1-zhangshida@kylinos.cn>
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

