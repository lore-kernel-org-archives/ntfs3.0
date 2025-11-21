Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466D33ADB7
	for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713113; cv=none; b=mU+u81kBm2OHvEzPItQBmJKMj70xs5a2YvfhBKPHJ6axsh0NOJYmeE/aTT3oaGd++xCYu7oX7/2LV+CVmhKlV33wCtZNOr2q1LeGxIc0Law7gqDShEpmN1U/BryAFlZ+Q/3CfH45iOyUO6L6hv8bayKVCZ/pMgxPs1Sm2SgmOTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713113; c=relaxed/simple;
	bh=a7LSL2iwilO1NB088738btanTUaCE2U990irg/c2KQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VTEK8MoIsD3Hm2ITOlICIWZ27XMWCfMeadWhRYEykslN9G5y1YIKHxvt9c08+7COOcE2fjAUGwM8SIxkUuQVMD3jH0VExM5uMAcfoloe01V7xb5zBdHK+UW8eUDUnp3xlNStX3KHsLy1KSqaHntpExWvOGcVL9dMoWSWQbD/PvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HG1khWBk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HG1khWBk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso989127a12.0
        for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 00:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763713111; x=1764317911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqJVIkHeBy2QrJ/910C594A/mOhcsYvy9xKzTt/nypY=;
        b=HG1khWBk5LXl53K5NDYrTW8VCTVBPEir7KvA5lKQ7Ee7yU4g1MAsQYyXZ9OcjuxEIa
         73z08097waazSMlgyDUpPNvt3u+aCJAOhutIDFm1Ltv82Dt7DH8Gf6YIS1KyojmqTiag
         Nw7uRMOgZXXg759DKRL1izLmL64IIAO8Q3cVFHStJn18Jbe1hAYE7QHTix8BcKlr8UP3
         zyII4M+5GmKkEwqrbdu0aUF2YfTzaNlVuXXNF5zBMj/TPavDaHU41gaQJsu4YT6ekXp2
         H542hg/KeRt1OWU9ACiGazw9/sbhnJ3wcqJxYWiYJhnfELIyKZ8tIV4SPQKUvMlmYLIq
         k01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713111; x=1764317911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IqJVIkHeBy2QrJ/910C594A/mOhcsYvy9xKzTt/nypY=;
        b=F9A2xNRiNpTs2frs/AokDCn10w7lWkVxCYY6K7KdlS0ZxrABEmNHpLiDFblnzrKKIG
         YER+f38TEa3xBKx1qlYeLUJ2/vJ2Knu0L33WaQdUnH0zchLxMnDnsLvL5q+iKfi6IscI
         bfCTtf2U4RwU0KJwkr89x0FPLcrq9FM49/jR51XehxWahDaeVRBKf8dXoLqXKMUlqjrM
         BY1XoWkbIVXihfefVsy2bbWiuEs/+4GqjBK35SxMFHlJZOpQsp75caf4xdcmkn3gDADu
         chk37A6Ju3MFVjffxBGzxbAJc35mK/eRCqSsyC/q84qxZcOjsOmxC1DgCzOEDHJebD/A
         Z9zA==
X-Forwarded-Encrypted: i=1; AJvYcCWkYFiRpxACfulnh/+aXIhL1HFeX+sgQ4lBMGkQfmSl4ftn27TR1UXoZ8cjaz+Iots/qYCqDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjMRJY5r6uT2krC3dfQR1jVjR1SA5mt1pRv2Erpl2hwlAfLs4W
	vLb9rp6iiGQO743rkj6kDJpH/5Bea7qxkCE6u+DLDIVh/DH9QdGXkp93
X-Gm-Gg: ASbGncvyBvrGRWfADjXPfF0EjepfmGDblLrb49sbYqQd0QpZhbSsVqIo4ow9I8JRf8Y
	ftKdpNVbjs6iAkk74bR615yKK8ewFkNS+spzaYnJQyVVvTnMu3Lim6uQwkVKOTMYL/gYT6FLX9Q
	p+j3CvFLN+kTwR4xSSL/MQgoAci8hddu2I3YdCTB5PBebD7DMyW19JcGFeUUBSruqsbQf2Dh5np
	S/HKq3p/yYpr4j8QdVbQI/igU0uKUROAkZqpGadA8iT4VXEkGQXCS5IVB0jOVidjSUVjryKD+XS
	mYVl3hSCshQvOsE80VlL30vffrBPTPYGDxi3o+glnIVqW37XWHMbel5hZKViBl+LbqH9j2tWViA
	Jz4kk0kl9CQKAVDDZFNiqZsLQQ5J/k2Nm6jAFDmwgT/k0cm+B1DP6NNrnKD3uFgCW4y9E7fhZPh
	i9tytbNPK7QeSYVvc/0vq53w3oTA==
X-Google-Smtp-Source: AGHT+IFWgtWuJbeRkMQREJ+GB1+CIl1owO0q1AKLfdba/kSV5Dme/s+uE/AHBWMGMV79yRIBfle0AA==
X-Received: by 2002:a05:7022:628d:b0:11b:9386:8257 with SMTP id a92af1059eb24-11c9d87a334mr448835c88.44.1763713110905;
        Fri, 21 Nov 2025 00:18:30 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm20997352c88.7.2025.11.21.00.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:18:30 -0800 (PST)
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
Subject: [PATCH 8/9] nvmet: fix the potential bug and use bio_chain_and_submit for simplification
Date: Fri, 21 Nov 2025 16:17:47 +0800
Message-Id: <20251121081748.1443507-9-zhangshida@kylinos.cn>
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

the prev and new may be in the wrong position...

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 drivers/nvme/target/io-cmd-bdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 8d246b8ca60..4af45659bd2 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -312,8 +312,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *req)
 					opf, GFP_KERNEL);
 			bio->bi_iter.bi_sector = sector;
 
-			bio_chain(bio, prev);
-			submit_bio(prev);
+			bio_chain_and_submit(prev, bio);
 		}
 
 		sector += sg->length >> 9;
-- 
2.34.1

