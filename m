Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3F274FF5
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764406902; cv=none; b=DF7ItkA/VnLM2OqsIRqnnZ8krAltairHmF4ZR68JRRSRuNO5HjXSgJ06FZCZyQ+LHcpopdQQjyQ+Qzk+DlAOR8WsTsE9V0zMQ6eXpLrhXnKP9jQX5TCujo8PurM4IpP/hAdG/G13weGGdEKAkLpHYR3ye+VrWBKkHTsIX6kllN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764406902; c=relaxed/simple;
	bh=JLIdNXPMejF737Jv1xzF5GicNRibkuRDb9iX4pmjoI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EboZp8lCOqUSw5VTqMHEO77u9lA+mIHjih6QuILcCcWvk6REbwqVGl+/F+a/ArCFOnXeRO3p/HphkXSyGNV+Z0WxNOT3VUfNGi3VoPiKGv3/nfiUXrQ1w8+fUg7LuQrEheTs+QH+dYVZ5zym0owWbAEHrnV7BIW16bZJvJ6O3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6a4y1ab; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6a4y1ab"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7aad4823079so2259913b3a.0
        for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 01:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764406900; x=1765011700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B+NwUppxNtx5dO3GeNOAlGv3QVGc2Q+cteUdMRhiTw=;
        b=M6a4y1abV/WzvZ3r4zY8larKIGFwqUaJUw86JNHPP6XZWflt7Voamr3OhWGKUATPvt
         DktUsOndfhgAKbxDLs0AlCHLN1MSQn0/QsyKFReYO7yp05LmziT+ryAJQngLW7wlv9b9
         pEPm2u6j3ma+zqFXK6Ty9uzaGDweejp67+O6tHYItJLvXGk+BXAR3grL68nejKOWFti1
         ZgE9s5AT7MzKo7diZkGIEceXEhBGtBFVgiKSqHPRMFeY4OQ5Zsi1yyuNyI29r4UnkwJh
         w+5yzaKQ8GRtajv6GvcemKb/z2tcbFgyPUgJE2rstbw40CmRJcq05S6qKCbMD1XnsSEB
         GkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764406900; x=1765011700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3B+NwUppxNtx5dO3GeNOAlGv3QVGc2Q+cteUdMRhiTw=;
        b=AeKP3VbEAmgpvSnb/mrSufhFN9j8nY6/fNynkEk0uTJ0D9i4pRfHEAqCmjzA7MPvwG
         JBsOhRdzzh+ZglVyuF5KaGo1yc02zlGvqb4XndOmzK3rTxrPngMJwa/3xv0kD2RmWsV9
         EUXEZS9uYZHgRVpiNOAaHkJp1S8nhukstEjdAfatSpOvzR9vNmBWi7kpLt/wVF1IZ84F
         4l7N0bSWRVRb30JBotQy9qnIZUk9LL6Y4kXQZqelW42aVIaGXCcgJ42gc2d9Rx4kjDBK
         7V6iIOygXK5JyehXSNMXwNHXFeLkqt+dPEJ6iIb1TRRW7Mgmv2+5R75jRmRgfXbuuHlu
         jy5g==
X-Forwarded-Encrypted: i=1; AJvYcCUNEiEXwpqwNWONsYxfo3QG+NvyjeIAQaPgvDQBYUYm2J6E380QbbFM+Fl/LzfZLbPoJcGAXw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9fB3un40Aq+q+6T/C0zKYHff38WBEQ/5SmWgqxuD1Te5+4qeO
	icRsL5OD0ueuwVij0Bg6JZuvTBbPrN8QKdcmDkANzJsMkkdpxUuba1h2
X-Gm-Gg: ASbGncuom1VSPTDUeYc2ancOB9sjSUc7BnmmmN9ON5tWmnzRr9o6hH/rk9HVSpN5uO9
	G7mZ9ifpz6Hfo3Zj77qbZWw6OgGYNQI2+BRTEHRcRqRqIHOJUPS2EayqrCfZBEpGkmUjUm7kcTD
	8FZfEY4qhY88kJrUWtqz003GpMBzs2KpAhbq7BJnLkfGrqm327SRzTM5rfABN26CWMBbGCXHet7
	Yb0rjL47YHSnCho/sHQvxOSA9KYxIn3Cv1xyzDlGhoXbctiEbU5+xHb/H+1NgZlhgD1qEpReqeh
	F88fW0ONeW+3fRsof4FGOIZUUZnst8AksLjL5315R5otW+SNABGQGF+9ZApSh/Obw5Z6SG1ByCB
	D+59sLpIvM27lCHsZ2/wp9SWPc2YEe/N7TxbVI2XXzfMsbOao9G1PBMLMLf7ub61cVf3efOYL52
	lKQkFJF3WhQVH6xZbk0+PRKLbRR2fPxBH7uQ7R
X-Google-Smtp-Source: AGHT+IF9fpUjxnsoJ856uo76C4AbEbv+isvtq3QMxPEeI8s0lui+ms4Diwary4B5eKv1gtl0O4hKMQ==
X-Received: by 2002:a05:7022:ec0d:b0:11b:9386:825b with SMTP id a92af1059eb24-11dc87b150cmr7316305c88.48.1764406900072;
        Sat, 29 Nov 2025 01:01:40 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm28114394c88.0.2025.11.29.01.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:01:39 -0800 (PST)
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
Subject: [PATCH v3 1/9] md: bcache: fix improper use of bi_end_io
Date: Sat, 29 Nov 2025 17:01:14 +0800
Message-Id: <20251129090122.2457896-2-zhangshida@kylinos.cn>
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

Don't call bio->bi_end_io() directly. Use the bio_endio() helper
function instead, which handles completion more safely and uniformly.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 drivers/md/bcache/request.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index af345dc6fde..82fdea7dea7 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -1104,7 +1104,7 @@ static void detached_dev_end_io(struct bio *bio)
 	}
 
 	kfree(ddip);
-	bio->bi_end_io(bio);
+	bio_endio(bio);
 }
 
 static void detached_dev_do_request(struct bcache_device *d, struct bio *bio,
@@ -1121,7 +1121,7 @@ static void detached_dev_do_request(struct bcache_device *d, struct bio *bio,
 	ddip = kzalloc(sizeof(struct detached_dev_io_private), GFP_NOIO);
 	if (!ddip) {
 		bio->bi_status = BLK_STS_RESOURCE;
-		bio->bi_end_io(bio);
+		bio_endio(bio);
 		return;
 	}
 
@@ -1136,7 +1136,7 @@ static void detached_dev_do_request(struct bcache_device *d, struct bio *bio,
 
 	if ((bio_op(bio) == REQ_OP_DISCARD) &&
 	    !bdev_max_discard_sectors(dc->bdev))
-		bio->bi_end_io(bio);
+		detached_dev_end_io(bio);
 	else
 		submit_bio_noacct(bio);
 }
-- 
2.34.1

