Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D12FF652
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318820; cv=none; b=ApqUCZemgnty+AFeQQVDRXFCIbGcWcD+kRmIym9kpg7GVK71j6dhSMa7ZBO8HygUlre+go62ro7IywNTq2Toa4ESvBzMnrwCR6JZflVwwe18xWnaAOlUjxf6gMoHeBaR6tXBfcvo7OK/Ghb8KL6PGS22ApQu+U38FBiUy0IN3BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318820; c=relaxed/simple;
	bh=MIUxfeIlXsLJb7D1x07khmxiQaV6FMQZLzsNI6cDMOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9yCmWbqag1/LLyUbwLNsM5naAeHwtG8nQIQpkA6HIttF9S5tWqGNT6zBbwxZN20pJWPgJ7ejCcLD/43kFDP5oCc/vRXxjsWieGfnN5UslmIt2hv9641fr/c/qdUbFR7x4a/qMO34lWXHvd1v6hj4iOZspK+YRh0Dj8Y0t6o52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H97JsPo1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H97JsPo1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so1098701b3a.1
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318813; x=1764923613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZsPDOjyUTRUehf6LhbOb026Dy93eapwVzPzgOc2prg=;
        b=H97JsPo1LV0dEJ3lm1aMvcWUzzRN9xS2cObapnNjcpA3VW9LbbgDmGMoiXLcZSoOpi
         JRyi7/VdLgs1QpfW5b1MEZ/EBaO0tfnwAIvAiGSEgI2SswH5RYqc0VhsC+KgeqS551bf
         1h1Xjso8J8yvtkuee3N5VTm9s1bFBoccdp0eflPRPCKijwWPPWmMG8KXmCS3pyWOpUgE
         D5q3O/GV5lK4A48yOVngdFyx5xRn1nriqI2bl0shQdRBlnlfZDx8jQKHjfqf/1Jm8vut
         2G93wRuffSM3+xsXnwEm4wTAZEAZD5bLOgCxvdtgEHYsDJTm6eln9M8RGVKPNqHhoVLG
         X/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318813; x=1764923613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rZsPDOjyUTRUehf6LhbOb026Dy93eapwVzPzgOc2prg=;
        b=PEO4OpBqwPW2bDPlvqA3lH52DLYje7ABmiR/YMx2j6RMbQShCc8az4BKTvc4TsFM9f
         8z2blFUSIcrdmSrC7rmgjrKyob0/funOCX+4ZMW0GPCyNLc2jP5wTvORhCs46v0HNUKe
         H0yWXmu6g1phLrv7lXDs3XpiFi1bXZli3RaVSlJDuVBbcU+zdiX38gvLBIpG5b8KtPza
         om5HJc1mFpikXTLUIET+PXwX2F9IUIIMfTjXhP3eyP/or2TguVVceuEWxXpMdXoPg8I3
         ifVmNelGdXFA1mskn+TZVabiXXTPr2sltcHPrbG4e4OaiA30/CpQu6MNnZhvgTrFm7GC
         T7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcsuRVbFshzeszLQ3D/zvCc3NXV4yRZs6qtQ/uZfHHR3D4iNFBxz+LhoFhcp7sNTlW0R3bFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw98CUFcnlUcilA6gvq1165ra2PoWzIju+tbUJMCujUJc5aqeQJ
	GtQf+onfsKmMeVRURHyGqXoB4U9aaS7aTZtrPQr6uX5qt7U3o7+oZVHl
X-Gm-Gg: ASbGncvaKedDFcgeXxs3zk+Sdd9alkT/qHBHe4Cosfrao63uQkcbK09i/4fw3VmD8bl
	xsi8C9Gu5KEBiuFuLqPvTLeKIznO4+UYri8a6k4CGycaIOBVsLXYj5p03Fd35NyXQwqcR3RkO7h
	47a7XCzoknZXM4RwBdhkJ0NZemvS0fbDA6fBAToCuu3763b8yA8HhrSr+B1XPwPJpiH2CTFqJwv
	W9YJFhat7r9MW5E95UVKncDByFB4oog0Motz8gMd5eG7LHv4iGir2FHSIVB7gUUKjI3v4vsD06j
	AMBq4CHLQ7QwT2hlTiNaHRtrZm1ybFMgb9btGhqMpfSw2Zimh4n/OIBx5F4hwVj2srCsVnDth0w
	QX3wd5GWB80AaWCtd4fd7p9unpOLHhSB3ppDVl2Zhc7bIbgYr3xbo2Sn9Xp0GQ/Tj6cjOItkmbN
	Nf9sjbJceqe0jyzSEXZ4HwX7mloqshm3rBH97f
X-Google-Smtp-Source: AGHT+IHqHdLof6s224+GbtnJAk22/n625R68t5gW5XXJrnH8NN05gDy1A3OVkHY/4+FwyWeG7e9t0g==
X-Received: by 2002:a05:7022:3886:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-11c9d867ff0mr21572562c88.41.1764318813388;
        Fri, 28 Nov 2025 00:33:33 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:33:33 -0800 (PST)
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
Subject: [PATCH v2 11/12] nvdimm: Replace the repetitive bio chaining code patterns
Date: Fri, 28 Nov 2025 16:32:18 +0800
Message-Id: <20251128083219.2332407-12-zhangshida@kylinos.cn>
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
 drivers/nvdimm/nd_virtio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvdimm/nd_virtio.c b/drivers/nvdimm/nd_virtio.c
index c3f07be4aa2..e6ec7ceee9b 100644
--- a/drivers/nvdimm/nd_virtio.c
+++ b/drivers/nvdimm/nd_virtio.c
@@ -122,8 +122,7 @@ int async_pmem_flush(struct nd_region *nd_region, struct bio *bio)
 			return -ENOMEM;
 		bio_clone_blkg_association(child, bio);
 		child->bi_iter.bi_sector = -1;
-		bio_chain(child, bio);
-		submit_bio(child);
+		bio_chain_and_submit(child, bio);
 		return 0;
 	}
 	if (virtio_pmem_flush(nd_region))
-- 
2.34.1

