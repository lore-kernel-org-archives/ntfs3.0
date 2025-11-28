Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652842FF662
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318823; cv=none; b=QgjTNL8LwT+nb8rs8e09RrkWg3vyJUzbxfXbqOrLes0lKj92Rw32o4IkJeKD87XcG7/xP76Y0BM+uXxbxfizhSZMni7cHcUZWufkBAY5dDBqo6QL30KRT0SCL0AAnd9lB/evuiKex8ett5nzRYRd6JWEcuXRyR4JZg9J7hTNDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318823; c=relaxed/simple;
	bh=HTuaf3JKiz2KHLk/jbQPL7NkOb05byK6j+tq4J3zrGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qFflAwhAaRI7kh5DRGHpoxLVEnO+Yfpi4Ajs6JLE/o5eTnzYYx9ytbj/EEgbzGboFn1+hzwBZfqFDtBsSklIcORzDdiRJe540p3B8sbwdzGq8zlxD6nfvPq+06ddSD2ScByJKgGTd47jyuGk8693y5ou1+rDoKbRL8ykOiinUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYJ7GAme; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYJ7GAme"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso1002928a12.3
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318818; x=1764923618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JuZTiXTtCfnBMrxTr4djU8x13PVqvGl4QPuQVkzEeA=;
        b=SYJ7GAmeEdS8ECds/Mx2umdfnzhizauVV/jrQ3jwPmuX1L+WvRK6172NUEKe01eVcS
         dT/D1EXbpemUIblLAUGfHxPCWaT/vOEPR4VDs+FV6//OVcBXcBzjN2htjX5t0UY7j7un
         6HYJaMexBEAjekQWHBx8As78AdDacsNhFoEncV/WltITY7speVDSb7CwWw6I51ER0cwg
         BKblSgGoMVb6APfwiBiiAvheyD+CPe0qURr0THAo/39yRNgoJdVbYp1COmPso+NUK9IF
         GCM06OWuUpjtsl9IaYZ9SF4TmWsI7rdKZA8s6RWUjJ83WEe8gA6GVKcmWVUHTXQcXAZg
         y4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318818; x=1764923618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9JuZTiXTtCfnBMrxTr4djU8x13PVqvGl4QPuQVkzEeA=;
        b=JYiYF91xohLelj627cjWGSkM9ATMikqk+xCKcdRysMI3OMVOLoFUK1WTRw2Qcs0ZrN
         mdply/JmDDHFC92kpmUbbacYGnkxdE/e0bnebHp1lwnPkGp/8WazdAQu2es1aMrezCp4
         8qlzykN/3Erg+DMkQFQrPumEa1fCXdc4cisDcHiCOoLY5nfqD0HxfdPSX6rBGqha+PlH
         VzwzJUjUnFUKngQH+uxXCA8kSSp3dH0rms90U4m6FIi2JVY+h6T0iFYP/Lqzg9LH4bks
         n34rom8sIlqTdIZGF7Ky5AXt6zUYgv7vh1wq8N5oDtrkXvxYyeod4vzQGBHLPlS+7vg1
         6G2w==
X-Forwarded-Encrypted: i=1; AJvYcCVjtzGL2jXTbf3IRn7cywJ/CEu14+3EB6SVVYewxcOYi11XotZN1wOmmUZhWNSG4mUSfyDJag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/EiRUS4hRsF4rMH6M8vYVkcElTj+KYG+lF0eMguBVvRKmWqFM
	U5pRpvkVzTaeguVxl2dm2RhxGNYG5hW9xzDRVvI+BOh8wU8WjD0yXctr
X-Gm-Gg: ASbGncsCPawtjk2cd91Y1wd631QunYerUFgCG1vbCfACOOTiFs3G7OvccBcFMD24xg6
	1p0anTZxp78rKu69epDIbPur4ZfEKuIMr/iJHw6fjMIhflRdJOcx6uHiml/wYmCvd+k3Gj2EosC
	eHvHo/uB+KmunSxdLigHpGgu48IrLTNC2/P5QDiGD+YjF7XtnR/jNo1yjjSPWRGExehYYo+3nI+
	BV6mn1OYFzF5pvSJE8RoSIYDgLyA+ta95mSrAaeGoywC+vNCHmNp91vd929doFy7wt/Tv4XbRaM
	Qg2kCgQP0fcEk9r+ZLtcrUzpP0VNAACjzcvTiwykofi9QpMzUi39OLLcmrU39esvpZW3GhOa+jl
	UoE0OlAKU9frJkWk5DoKg3oYjDIbkSbqmQT0EBccdWtQPLRQi29B9U8aRdZmengGmOG4nekdkbP
	0fsSO4WlNFZGR/O6XYsvdhh07kig==
X-Google-Smtp-Source: AGHT+IEiYKFOm1UmbHzu9Io+L0ipF/pftCo6ih2XEqCkxPLrZNrFMt6HrxgMvpe9BJ/P01XRe5CPUg==
X-Received: by 2002:a05:7301:162a:b0:2a4:3593:ddd7 with SMTP id 5a478bee46e88-2a71953bfaamr12018765eec.4.1764318818087;
        Fri, 28 Nov 2025 00:33:38 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:33:37 -0800 (PST)
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
Subject: [PATCH v2 12/12] nvmet: use bio_chain_and_submit to simplify bio chaining
Date: Fri, 28 Nov 2025 16:32:19 +0800
Message-Id: <20251128083219.2332407-13-zhangshida@kylinos.cn>
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

Replace repetitive bio chaining patterns with bio_chain_and_submit.
Note that while the parameter order (prev vs new) differs from the
original code, the chaining order does not affect bio chain
functionality.

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

