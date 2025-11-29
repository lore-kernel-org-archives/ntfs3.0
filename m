Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7858C2874E0
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764406936; cv=none; b=mbswYGXHpa9jvNqVJLa6oSyBo2dV53zTNodwooCoNGSxB4lMxwhjNPKgkER/luqDsEkRM2mnZ/a+O8xuQHnNROHdW+9guvRXGlBIWfAZ1b8E7U8JZ4fyFGhDrRplTZ3khKxw9UaMOxF7lbX1Dr4qgVmRhws+pYGmiVhPNg5oMxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764406936; c=relaxed/simple;
	bh=TbxNohFMmSKnHTWH+mnyMfPFRdWdcWW/LS3/VsufZdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j9tI+wymW9WxLuSs1YbrUrx2Lyx6MyOG7Ca4IW9VNwitwqIFu6Utu9mwoGlCUI6m1sC4KmB8TGp7Urbwck4V8DlaKUCUvE1DT9m/UK2VMRjkKQYwOQCBonKNM3mvjF9eRymZAyfpRmuLoJrjqP4YpKdmGDvowhKsCt7sYECvUBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgWuOnQX; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgWuOnQX"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso2035434a12.0
        for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 01:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764406933; x=1765011733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJti1W24hnwF4OFg7cS4jWnw0eZv9xglyyGrmFluATQ=;
        b=hgWuOnQX99396ehXb19QLKMdMdZWUo0QQHgRe01NqGq3QAcSdvDripPyBli7jDvqDF
         DwUTro9xPzIgu48uV3Pt7jAHXabSgojUSr9sMifskoyUKGFSA3jp0+a80H2+Zku4hF1X
         TMLXiB3i8+ExCanBjmhQVREr7P/ahEydUKE/UB6KWHo/e3oHarvuj71sFcbR6eAlk0IP
         gWClZ4DM76elBnI9b9NqFHpUE3D952/d47v9CT1Dz2vDwzgjmz1PD9SsrwXCuZ0RwdV8
         wCLWNh1Zu+cgEUc04k9gSTiFDCR3aS9zxDT5vWx8u0T0hqDPAspHI+HiyMlqb6v9i5b7
         3Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764406933; x=1765011733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJti1W24hnwF4OFg7cS4jWnw0eZv9xglyyGrmFluATQ=;
        b=GP94lk2YpyL1ZiFmkgN2Mfj1tB+d6KpKeaYitFwdICoheYEFjO16ziDU3GW8DVjxy8
         Ve3wRwswflvRNblqVhDPCFDDIKekYwHTsDz8/JR728P9i+bbtfZMv6I5GL6FQrTlao5r
         nemjkvKbx+S8N4Y9uVqkVrXQO5IVvTEpAMMyP8jcWT/w8qcINzkqkqw/fsSW1NOrsmQ+
         krjBfXtBkhrfMWzxXHvwkCdlCvZMZ8datC+VGiHfeECR7bL/GK7Na+b6CKvbB1fup7mS
         upSvCQ8k6EC0TgIXPQwPA67tlSaL7o3xBBb74ZtquPoeN47B5+ABWCyeb57aaw+EoMbV
         2peg==
X-Forwarded-Encrypted: i=1; AJvYcCW8lDdDpFBSJ8reMk9noKrGUeLR+3FIQRhw3ol37IogYSnowkU7CAY5jt4jbs1E7sxXxT116A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzErb2KQDXWNQYFDpve5gCeESul6bLIREVO6Z8FPvIQVxG9dEv2
	rbrKxLHMApDau6/9c3iematRmjDSXgMmTwlegKakCFNpOvAnTDqQOyrs
X-Gm-Gg: ASbGncs5AuQV4t7CijNx+2vbmSYCCLod50W31ZOwYefYNF2hnpbmXpzNnh5WJWAYqoQ
	8QJl/UfDzDKp7oSveAWEnjKzczY2hw5HJENUrKaWKnEP1C62fXF1kkQf0MWu2ussiAg6FTtZGE1
	f+9ZtJXsDOVObMp/GFyob+DKL2p6rbFn8FNA5zwIEsF047oJ3UcQUxrqo+C1BUXfdSYMPujcXNa
	8Qiq0kUlbQSxaHTzZYC2ZxOWzP1H/SuesLJ77gFASHGqXHXSd+SF7kuav4wKZN2b6PlrJ1E62GM
	VmkDpea+V3gD/fGaYBFSkBtmSt9Ez8YOn3rIeT0anLzs2rn0wM9PIx6j1r+kwB8qBQnemT9JFF6
	cKNwiWJ+OnfdwJzmRKWq42lMMBMNsPlrWrd31tDCXAEFg9CTjQk1od3iA/5+gZZPT5yNiKn9AXD
	DaD0710Fa/d9/ofs21JB8CRtEBrw==
X-Google-Smtp-Source: AGHT+IFlPlVYDb7yoZVR+mp1/g2QkqJgugDSidMl3HlYfTA53/2piBoQC1SYt0i5BZxdW5Dqskhrig==
X-Received: by 2002:a05:7022:3c84:b0:11b:9bbe:2aac with SMTP id a92af1059eb24-11c9d863a7dmr14635218c88.40.1764406932641;
        Sat, 29 Nov 2025 01:02:12 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm28114394c88.0.2025.11.29.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:02:12 -0800 (PST)
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
Subject: [PATCH v3 8/9] zram: Replace the repetitive bio chaining code patterns
Date: Sat, 29 Nov 2025 17:01:21 +0800
Message-Id: <20251129090122.2457896-9-zhangshida@kylinos.cn>
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
 drivers/block/zram/zram_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index a4307465753..084de60ebaf 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -730,8 +730,7 @@ static void read_from_bdev_async(struct zram *zram, struct page *page,
 	bio = bio_alloc(zram->bdev, 1, parent->bi_opf, GFP_NOIO);
 	bio->bi_iter.bi_sector = entry * (PAGE_SIZE >> 9);
 	__bio_add_page(bio, page, PAGE_SIZE, 0);
-	bio_chain(bio, parent);
-	submit_bio(bio);
+	bio_chain_and_submit(bio, parent);
 }
 
 static int zram_writeback_slots(struct zram *zram, struct zram_pp_ctl *ctl)
-- 
2.34.1

