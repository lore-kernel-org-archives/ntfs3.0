Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12EC2ED87F
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318775; cv=none; b=No0a1ZVBLeYwxAkVzbcWQX/ApmSpTgRIVedzHeVeFPuUayhlhAintebYuw/wZOHMJvHdM8OfTkwuVPjgTggYuuyMPJUGQ5tLGvz/TYGd1tWR9qbzi2EOyHWfUhbdWedJkrmtBSm8D0gxijjHnn/CTNm8MlI+rSir4r5DNQjJwLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318775; c=relaxed/simple;
	bh=JLIdNXPMejF737Jv1xzF5GicNRibkuRDb9iX4pmjoI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EmjzvHkm8S6ba6vZVBt47lCRj2ZwzSGChu3UYEPyX1SSI6exmJ2lBmxaExBpEYjAaDc5LCyCvYef/6U7k8LV+EjenVvAVr+pEBbBjnLWVuTJ2SNT+yqkEbZCKQwMHER7U2t+IeSb9PCPIyUduv+pzMcwFd/E/5T+/+iswe6wrEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAEv0oMo; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAEv0oMo"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so1899081b3a.0
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318773; x=1764923573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B+NwUppxNtx5dO3GeNOAlGv3QVGc2Q+cteUdMRhiTw=;
        b=XAEv0oMoJmnvz7yAy/Yz/2uSLB9ZsoFumWWf6ZscqUjoyFlhf6oe55pLKaCc+oOi2C
         XouMwdq5ijyOFM3ZanhxvJag7hwMrJwAM7RAfrgrtBN5NmLlTdlW1BBLy9K3x4wGKF58
         nByiKYJAIZ7/S1TD447VQSkDMtrU7PT189dd03P84QfJxs5irWBdSRVQx0tMLimsftt4
         7GlixMqk2PeJ3xNJCx3K9sAKFXCCvNeT8XQb+yuCwFHFQGaKp1RplXOuX6od0nzducGK
         hdQcPXpMyeGSBIxG0YLC95SZn5YYEtedJlwjD3p41i6CfmTcsPglJDbO21AWTOXHnLna
         Olng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318773; x=1764923573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3B+NwUppxNtx5dO3GeNOAlGv3QVGc2Q+cteUdMRhiTw=;
        b=weP5HMOoxBOcQvYCBJAXp6oAo6x+u3KvBw8wbHK/QzuBi2o6rymcXOvkrit+wai+CE
         JZVm/SgmhY2XTnyejQ7XJPuuuAqFSoHep/voFSrfZEXtMXUOV/JaoaQBM6jqD8JfoQjF
         DT2nDGE/6Wn84O4SvyzWJT1E6+JJgMrieh+UJTQZmNrqYEUaT031yEbFWfnTeumAFY4Q
         l4OFy562ELtIWZFyJHchTdJJqFVLAZLzTSm3e7YEzvp3Zc9v3UaTKRm/wRs7TwJVfAkm
         9v8zCfKIbyCciWU7FI77uWD6zRkAIysYqaDo8//XKDYQic2l6NjziJsnAIPN3romIt/F
         6pVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbBh+oWMPJsByJ0YHsJbxzN0uQtkUBmJGH6TGJ60L44eGCvW1Wm0S3OPDmNa/+ZO5LvF71RA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+Aq/BkLJL8ld/EhweLx9j4MqnYaFeakyxOe8eYHevGiVNffJO
	JGNtPxNl/bLJnyYmyn7zlR7PD2nnR9giOUyzITXl5JwvafVIXKTmV+wt
X-Gm-Gg: ASbGncsvPmiP/TpudhpUvZZM1ynoJtRc5fcRVyw4iBzia6kpHxp6n/RM6hQLdmcAFCR
	lGZgxVzWvH+ag7lSbR6LlNHa7aOAj6VEI6gsDfELg7Pae/Bo9xX7oLFYzZ/PvoFXR2OGixe+K8h
	BCvVTQw3cmi/SaaxPIFtVZYL4WRTaTkooqEnir/F+CAin9kbLSb/6M2IFsRYDLI2MHSH6O4OLOE
	n5bRFOEZQFuaFQqOskSLs5fraxHqzo8+gIQvnCcOqediQ1tok36Ofnzm5XVPU0kSgMj20TC0fvK
	rGMMlf23n7yU6X11BvfOtZkKtz4yLNtnKmFvuSKJQAfxPay2kTFJ4y0BCd0OvQidOSwsefQ3BFD
	/dAJ9fwRmJ4jmp4Qi1bGCMF63SN7Efi9UQwWIVO1tEkGFsgIEETGHjbgPqz2YmgtMEvLsMkMUQ+
	0lXSLSUyybW7Zhfe2Yf5uGcz0TQw==
X-Google-Smtp-Source: AGHT+IExpRIXm/rx9JSaduyyoo433z0edlCZgYRCixn+2l+uiE9AooEQRv+QW8QlPPxN5lYcC0yJLw==
X-Received: by 2002:a05:7022:2390:b0:11b:2de8:6271 with SMTP id a92af1059eb24-11c9d8635bcmr22508225c88.39.1764318773026;
        Fri, 28 Nov 2025 00:32:53 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:32:52 -0800 (PST)
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
Subject: [PATCH v2 03/12] md: bcache: fix improper use of bi_end_io
Date: Fri, 28 Nov 2025 16:32:10 +0800
Message-Id: <20251128083219.2332407-4-zhangshida@kylinos.cn>
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

