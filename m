Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699A02E613A
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318760; cv=none; b=CMmgr1c2s0wGBQGpNCf+++0lv/FM9HAaLDIKNo/zIi/Dn2N4m1p+v1Al4UBAjA/9P3hgQwtn0bGl5OKLdbEu3Z37SE0Bt/y063y/S+WtOpcsrUYegoAO+u3dP2gKA5DywUC2lWBXuzseTpkXKZtETzjH6jbSNV1CnxMUsq4UARU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318760; c=relaxed/simple;
	bh=nXmk28ARgCcn+VciidQA11ELnwMOW79oTG8rwah+rkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NtFjSKBH3Hh7n5D25VT5sJxm/fmN8BNHRgFl9xRR0JdXJtFG76hztCLS7QnlRPrn6as4VBV9rmFNMoZGHtvx8u2kJByU74T7NujciZ/ReYZIIWj/aHe8FZJc1mb7scBvVype3qHF7NawBEYVNaNJZUyoxU4PFUvkxtROir5mkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUH8Kl5y; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUH8Kl5y"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b98983baeacso824227a12.1
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318758; x=1764923558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqrU9sAvwHlZJQNnImTr6s/wIfO8kcl//WUqMA/q7Cw=;
        b=jUH8Kl5yPbTHHmA8UhMI+1t5T/al5pZFyH+5kVWeLenfkKBtm2F6xkjJNrAiFL/qsJ
         G+tIkwkrreNF6FQCMhzcIGbd1kYEGeCGZVSmuT/AtKRQGe90kv1bnnt+720s+Mdj/Xvw
         dchkgOzrBmpfmRoBQUMlbwjKyZW5Ywap4VAfD71m0LTaKNHpyebv3nvwkIYakuPIbQ/H
         w7dF6XBScFFC5UxFPBQXxp+3+t7RX0w56csB1ZmRx10xm6NeHrxZLdvBPziqAmF9VruJ
         NquHmq8+Zt1XH56rB6TZxBnxIojG2LBj2np1sWQ2C99q2azy7ADhHZ9XY5OgWvSeRn+M
         tVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318758; x=1764923558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqrU9sAvwHlZJQNnImTr6s/wIfO8kcl//WUqMA/q7Cw=;
        b=KVfeug4i7IVKAxDuf/Gmi8FQxDb0NFHJPeqqQ0haPkm/estdQM4K8KQYczj4tq83Gs
         j8TgA9AWVdAY2fISkmrYV6ypfLQ3t5av7702ipLaWJ7Cr4MF9iV0+mLktcvh3VnInvIP
         jefjvHX2KZ4KTnPCZ/rDDyuSqR8oo9JO81ZnFlAtaSV3BD8k/z5XedVLlgzeBKo3+nOP
         0KCVcjAMt1wWpEO2Y2/Bk2P++yzdPDKCGl0E11y04QjxFebv7lM+WG01+KILCzVdfvKI
         6nNRa1P5nq8u4aXRTfK7kr5VDui533t7xfT210/Gm1rP7MTVvS4+uj9Kf3RMK2IOqdCH
         8XsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO7ialDQq7qhXL2jkscieOlDkomuXh05cQv8Mm8T//dzqDMXPvLNcFpqxg4maFPhyxT2L48w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEI7U7D6MG/Qu3Cthx97bygUwZP+cC0U/VRIc5hCSqp0+3MNQO
	KPbu3tAUnJJ8KYQRqIy2157qpGIHTwlNcmhE7Xk5JUEVIB+Qkw4Lj8yu
X-Gm-Gg: ASbGncsRkqvH4MZo3HtajfeVTI8R/Cv5oRvKup41tG5Zee2XRShv+bupLR58v/MjP/6
	Kcd93f5FS9Fi8tfKru+Fob223eiqkfsn14fqwKCzBib2xdEbJ0JJBfNgfE3wW8ZKiB7wz7g4rEX
	2Dd3Ij9WBOiW8TzE6qf+UZ9qvSIXV/sgLqmP+scNICyGjFNJv5Ju0BpM54yJiAA+PSSCVB7qSR2
	/xRItlYfmSKN5XHTRAFCtN2v+tvzyf7OiPWzouNFkSLluSOuMNzBwxHIKAJBpafQ4tTBssU6eS8
	EOa7m9+g2rE6OQpXPcXDMB9Arq1931YsJO2Y00PdM2z3LCTWEh2TPW19dRubphv2xRpUhaMt3PE
	TACcHTKurxK8+bMN/Rr7fzZ1dJe0SsQZRzmzynAs4BGBrN+zF4SWbygh3UmutwSKCAD1XZV4gkD
	it/frx0ff2qoyUs7/kZzhTLENAbA==
X-Google-Smtp-Source: AGHT+IHdakmTE4ccsFNQ1yLU+VXJurH34ar1nC0le8zm5bpThSihG4vDxPqEawqzf6sYQkBphfQIBA==
X-Received: by 2002:a05:7022:ebc2:b0:11a:e610:ee32 with SMTP id a92af1059eb24-11c9d85f282mr16086363c88.25.1764318757636;
        Fri, 28 Nov 2025 00:32:37 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:32:37 -0800 (PST)
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
Subject: [PATCH v2 00/12] Fix bio chain related issues
Date: Fri, 28 Nov 2025 16:32:07 +0800
Message-Id: <20251128083219.2332407-1-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shida Zhang <zhangshida@kylinos.cn>

Hi all,

While investigating another problem [mentioned in v1], we identified
some buggy code in the bio chain handling logic. This series addresses
those issues and performs related code cleanup.

Patches 1-4 fix incorrect usage of bio_chain_endio().
Patches 5-12 clean up repetitive code patterns in bio chain handling.

v2:
- Added fix for bcache.
- Added BUG_ON() in bio_chain_endio().
- Enhanced commit messages for each patch

v1:
https://lore.kernel.org/all/20251121081748.1443507-1-zhangshida@kylinos.cn/


Shida Zhang (12):
  block: fix incorrect logic in bio_chain_endio
  block: prevent race condition on bi_status in __bio_chain_endio
  md: bcache: fix improper use of bi_end_io
  block: prohibit calls to bio_chain_endio
  block: export bio_chain_and_submit
  gfs2: Replace the repetitive bio chaining code patterns
  xfs: Replace the repetitive bio chaining code patterns
  block: Replace the repetitive bio chaining code patterns
  fs/ntfs3: Replace the repetitive bio chaining code patterns
  zram: Replace the repetitive bio chaining code patterns
  nvdimm: Replace the repetitive bio chaining code patterns
  nvmet: use bio_chain_and_submit to simplify bio chaining

 block/bio.c                       | 15 ++++++++++++---
 drivers/block/zram/zram_drv.c     |  3 +--
 drivers/md/bcache/request.c       |  6 +++---
 drivers/nvdimm/nd_virtio.c        |  3 +--
 drivers/nvme/target/io-cmd-bdev.c |  3 +--
 fs/gfs2/lops.c                    |  3 +--
 fs/ntfs3/fsntfs.c                 | 12 ++----------
 fs/squashfs/block.c               |  3 +--
 fs/xfs/xfs_bio_io.c               |  3 +--
 fs/xfs/xfs_buf.c                  |  3 +--
 fs/xfs/xfs_log.c                  |  3 +--
 11 files changed, 25 insertions(+), 32 deletions(-)

-- 
2.34.1

