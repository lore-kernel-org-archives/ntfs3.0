Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946EC2FCC06
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318801; cv=none; b=YJ+XMB1I45pawWXEIScoIXhVfBCLwjFxXIe4bYos+iXQXCdfYkTN9BHu+vC3EnLSc20yO2wris8TZYPkANp5NDXFno9FTG7o9gefh9R47fDTxUJffMxQsXB8QMz5TDwWfZMZNuEwDBeV51+jSxK5BjISR8arjOoCW8/eq2YeLWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318801; c=relaxed/simple;
	bh=Hfn+I4xKib6YHUNH+g6fjmCyECLvbavw8yPYoNL/5CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dijvbtkWhee/iLK7CZ2nLB+tT+qSoh1/i6vAOfqvRTZFV+LEsBBjxccurF9tV9qWKrlGM6dAC9F07wec1mc++FKg2CVp+J2QevV/vzLUtORUfGr5ImexN83e//nq681A9iqd1ex+D8BjujspUCdd48PJpwHF5S8tpsnsghq3O0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0aOLTiO; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0aOLTiO"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso995469a12.2
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318799; x=1764923599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdyx9mvaY+8x+eK9XImqi9TsYLR1v6CaCbGe/GD/N5s=;
        b=E0aOLTiOgeQw15qD+0lcu4SBgBMtSbwysfU6q8Elgic2p5citmMT9WtnTZU+exM/zf
         P1qxw9Hcsx4VPSUXKUAlJCd6rENwT+126hey4N9kTiGiM4rVxi2W4G5jzKuJgaybWweO
         BgKPYGZCxMno2xm+7DLIjhKtttyZZjpP439fUXOdNyQfOo/sTffV5ecd/mfQcsexYuXo
         fhIwOmGX4kxVJIqeqmh+K82VpTm4UrfkWuCL03irGEbeMfoK4vw9at5yDziodT4EG1LG
         fCmyYvMUjUoFO1XfPd+qGYSYowoDjij+HN7BxGTh2VMTfydt2qrTFpq/AxGdhPJDnRCW
         qs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318799; x=1764923599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdyx9mvaY+8x+eK9XImqi9TsYLR1v6CaCbGe/GD/N5s=;
        b=OY4PMsJRSXlM0j+dbF1XnQemUzefZ3maGhOJTfmiUEu48puTkgl3IGKQPLtLstcrK4
         kn9pbuqRAk4YR5x7b6srLofsfBvxDFEyxy0QMK00bf8V/Hx1Gx9ZedzIby32sH19wl9Q
         1wD0j3yAKSpJ5nGeFvFj7VIbRRHnuSVZggg4grxY5ux/+A3gKsJHoTZ/Qb1JqdPtxuuO
         3zSajan2Yi8F7rNpPJ/FD+EZdeG66VpzZYRM+IPPLvGjupEgfHbBgpmdnznfsPgdCPIh
         SyHQDTAbU9sPqWYMEPcdyHtZM2/6XxgbKylsbR2lan6aMPTuqBv+jfs0p0HRiXEe6H99
         FQPA==
X-Forwarded-Encrypted: i=1; AJvYcCXpFFwD51zrn5mfeIT++efnWcCu/3NzAKMvKkMWyEu6q7Vk1KMn5PSO+cpiXX1CCZEcAE5DPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnQ9pz0doCFjktPOZSjpIas8ND4pS5kqJeBCwLVb+9kv+hK+Yp
	z1Nslc9pyfsW3JI1f/UAeBXFfgZkXhHYeJHJeMNvRLInnHJev+JixcoR
X-Gm-Gg: ASbGncsJHeXD+bYmunztl4Cp6L37hhBDOlndWPlVe1IxOceYhBSQoSKjhLZaFbmsrIN
	XeleR5QQrd2kliASn6Zc+TzeHLHNnnpuzMdt226khl6JY4FQ3vsXTJDGMa8KOp+N+t2zqwgBlR0
	v03oxJthG+00En6LVwHxgKK1jAhQpDpeLYvKpCSequ3+Pm+z5FkYdALedPMFxMCF+shIhsb3Jnh
	x/KaKw+agrpRUDAdeP3911/ayz+MyvuFaQ7DiUFCzCPVy6j333a4MJ81cJvzGEW3UFVG/kUyIeQ
	Ll9hlmI7ZkvDNObsF/uKTdJ2OWutxUuBlF3NPfAhlbuuR8L4knGu1wXGYhFQzIexl8jgAWq1SjK
	utZMLp/qNg4+IHRrb5XejyNLRtYFbeHAM9ih3d8sMsyCPs9+Asismb/+xx1SHe7xeOrBPleXlwy
	kM69b12r6OjTyG+EXK0femHGuBEg==
X-Google-Smtp-Source: AGHT+IHKXq8x9elSCjEHks4N7hQUevj8WxDVP5HKi9llAEtlIQFfHNb05BLq+B1Nz6uA8fi9DHZiww==
X-Received: by 2002:a05:7022:671f:b0:119:e56b:91f2 with SMTP id a92af1059eb24-11c9d870411mr17436186c88.35.1764318798796;
        Fri, 28 Nov 2025 00:33:18 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:33:18 -0800 (PST)
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
Subject: [PATCH v2 08/12] block: Replace the repetitive bio chaining code patterns
Date: Fri, 28 Nov 2025 16:32:15 +0800
Message-Id: <20251128083219.2332407-9-zhangshida@kylinos.cn>
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
 fs/squashfs/block.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index a05e3793f93..5818e473255 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -126,8 +126,7 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
 			if (bio) {
 				bio_trim(bio, start_idx * PAGE_SECTORS,
 					 (end_idx - start_idx) * PAGE_SECTORS);
-				bio_chain(bio, new);
-				submit_bio(bio);
+				bio_chain_and_submit(bio, new);
 			}
 
 			bio = new;
-- 
2.34.1

