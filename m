Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0C2FE06E
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318812; cv=none; b=Cvu+rIiln0d1aVWKT7nHRD3gj1DuqorOknZx7unmNIFKtbTBlMIHyBKsPjOlEmf+w0zjVkTCl1TQ0sF+4s7ULnVTPzrOwrC4xWG4zSOjAsPgT1OEAjAvAOoMrV1kMk07LJlnafRzC6a2xjW/MJmJoDhH34YrFUMoaUQRCg8X1AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318812; c=relaxed/simple;
	bh=TbxNohFMmSKnHTWH+mnyMfPFRdWdcWW/LS3/VsufZdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N/YEf7GkGfrwDMgxq4YaL0Mp6fhqfMtP5V7MpTyEyTYTOb7bFbGe9DJYPKbTdj6j0zA8T/WSnCI9l84mi/Xx5WuiL4OyenKoG7SikrWQLal4tcoJFN6wwlpXMsgTP1w8DZmEPNtLeUwh4zy5tYxlw3Zu7Xob7O7U3TPC2H9uU7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE62MRX0; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE62MRX0"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b553412a19bso1418192a12.1
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318808; x=1764923608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJti1W24hnwF4OFg7cS4jWnw0eZv9xglyyGrmFluATQ=;
        b=EE62MRX0atIaRAQP7wjFlyAOKNbJKyyLvIE6107ew5CLRL4pGzUhJwgHmkMnXm95G+
         BNM5FVWwaHisy0BhjrJ+gYlTvGsgoKc2k3IjfNvGt+WFJwq4t5MUyxKjvvN6iYVNVRYi
         +6TAMomOaLm20VKIXU1dhb6XT3w62E0yvhHLv6tA7HhexPOc/wd32EfBzNhlXIdc1FzU
         dH/f204qY0hTQkLX6T/GZjHSoeiGVBLL2bZPUlzXGlyQhuH9A30Llv3dHOpEjkFK+two
         jF9p/qBz4fs/tkQenQm/tHYai6SAxdSxvzSdyCEutvIQb6kYCnXUyEuirDBJcf7YaMt4
         ehcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318808; x=1764923608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJti1W24hnwF4OFg7cS4jWnw0eZv9xglyyGrmFluATQ=;
        b=bdHi5dvt8XZ+ZF2vBVdUzZEIMn/7/3nMqw6nmOQp5TaS5hxJJtjq9UnfNI743uBRhi
         GyLu2xmZWf+euI+RbpY/pka1BAhfYPaqT3ukCo6PobnjkZRoyQSsbJAcpKixeK5x+dxL
         w26GEJKq+QAT6ba39/DxbB4Mh31VJZC4YpicoRHX28fKPiwFHBe1YDALzEiAci8Fy9Ce
         qTV0y51UGOcXvefyipLygbJ/DyAoh3re4BFAkNAWadDpwcf6U2tEAZ6oJd4liaG84tyR
         gNptE8y7K2EJxuCuKkS8qjXlvUKJWD/DEpBNlq44lMEmRUtCUNiyxWiBjWJYM2Q7dTrp
         JKfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+fYVy0CWw7ojp+hsklE9m8OH3YlHf1+iU5T6jmswEUsJwkVE+WU9kqOX5MUy8EPu2gNzc6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqrNF9dNenk2dJfFQnj5BdncNGLCMyDo9qYiDnNyeIHkeE4beV
	IomEkTnSZ7prjv/DDvHIbydmVa+AB2Rlcefq11+nsXEDJRYo0Wf6qIIz
X-Gm-Gg: ASbGncsyFS2QaxMowqgRXB9jgEJMUZ+9cYSfdaSjGXLs4xJhSoUR16X04t4vEfCOw7W
	XdYkRhoVPiDRmsFWVhC5PHPE0OC1LiedyYVdl1i9FYsl6arYEb1VY7S3+6dk7L5Ic/J5x44XUuM
	EjNWY0kE+PRU0290Z82HYPKVx6SXm8FnOSnujqTC3hfJHr/tbjlHU3Af/YCOkSGTn7n5GUFTM/Y
	mrz0A8iTF3KaVImJDG7/GkUjjEWGPVyDcPGmPKcXcb+/yE63SZP7tah23xl2MU3a7yO9AOSmeul
	xTmK9enNqOszyW8Jods3FgtgiHdDAdEtGlg+Y0R56zCSiev2iIBN0T1oUDhEd4U+oUnEqSh5cig
	mau3HLgDtiE3EdV1vUvBTCpTVjEzZtQNo+8MwQYMQrsEUM6Hzhl8df8TWbEQ/GO0p8DQsCTKjte
	E6ZfiG1pUsIlJUmx0hKZjDVAeQ+F+AuvK4RNv8
X-Google-Smtp-Source: AGHT+IHDsMToqUoj0PcNSA32TYDuHE8zhBuDir1BrYt+w5Y/wAZYCWlUzMNg1Dgih3T9wVkLcbd8Tg==
X-Received: by 2002:a05:693c:2488:b0:2a4:3593:6464 with SMTP id 5a478bee46e88-2a71929687fmr16240699eec.20.1764318807899;
        Fri, 28 Nov 2025 00:33:27 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:33:27 -0800 (PST)
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
Subject: [PATCH v2 10/12] zram: Replace the repetitive bio chaining code patterns
Date: Fri, 28 Nov 2025 16:32:17 +0800
Message-Id: <20251128083219.2332407-11-zhangshida@kylinos.cn>
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

