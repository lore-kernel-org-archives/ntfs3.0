Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9F92989B7
	for <ntfs3@lists.linux.dev>; Sat, 21 Mar 2026 05:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774069311; cv=none; b=S/G8UW4F38YYsRF9dydpf4/wBTtdvfUxXhjPnTn33gzgP57n67JWJ9A3mggWnIiLYvvIkoL1vUt0ezNVHBM49usfR1xkhbmHwdv3K66d+PednMZCQWssw3vl5F71DASDCNrMyTbELcLKVY+CoOh10592su0+R9BxNOveSH6NsuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774069311; c=relaxed/simple;
	bh=nkpfooB231w08yEuMmEI3pOCLhwFDkpkvgaj5ETgiwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmanstvsWsBG7hE8+mldDwXf41+c+w6IlRyVPA2A5/ScKsCEgEM2iF4Mq+AYZ4dfvXN03rviqgMFpRjeJz2QLHokW/v/iNjSZlg6qGL7DatqH+I9DiGHYeY8nI6dNUwzlinT+pcgg9dra8oBQw0sgapRffEu1pBe+0DsMOiT6M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQVWS4uT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQVWS4uT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82ae379000fso566312b3a.1
        for <ntfs3@lists.linux.dev>; Fri, 20 Mar 2026 22:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774069310; x=1774674110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NanPiL1bkZBnaJPUdNrmZem0Ql51ml2Y45NTYmJIv+I=;
        b=LQVWS4uTfS+SwiqqA1Kfkegz2YEi9IEHaU9VJx2B6MSQ4zznZUWllWlsQSoe8yrXF+
         jFe7DGCKWVe5eOiIDYrWuAQ3ndJ05GQVNGt+yH0zhqPmucAKbXMiD6/GZ5czi5pwYgK6
         B/Ets+oGxyxEz1qPJ9ITRQzEKwNiBRfe7aZl03oK6PQ1fwSDQVov1rhlbCNLQra1hMUD
         WSiboe/f4KWQeBD4SGCAz59EF+guqoJRl8fi7xifKIqSBMnaX3Xrtr4W/KbGsczEt7Fg
         gyxYGuv+GuxQV7dAsugDSncfo1fnbwlPZsw7RY6iuUeeE19Uq3tLizWt6HTKuuaJSqeG
         S0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774069310; x=1774674110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NanPiL1bkZBnaJPUdNrmZem0Ql51ml2Y45NTYmJIv+I=;
        b=d8LqR1wN0F/5CQ6LBg+QJw0ngZKBf2ijEoAN97y98C5OB8IgQceYKy0Z44UtIdMCIe
         5sgg5tiqrI+kCNj6VfUc9uHwtoe7Z0//fPneFtesa/0Oe2Wk9JGyrZpoNA85ZfeQFlJh
         2YsKzIl9pKlacjGXtkltirJrc2KKjzSEr3DsMJ+OXO+QVzYNQ3R3APPWe73QQ5gvQGGZ
         B2L7HLAXqZcgansK1a4M12AdHSqTUCKmVAY6LBOcZqffLZEbPFZRF6jsz3gFYVQwDjkU
         Mh/Hvp72Qi1+475tnFv2Pre1BvM15oViOTM99k0fFOfTZ8HD2XHpnwewiB8TK7zNHyjC
         qdZA==
X-Gm-Message-State: AOJu0YxzuTllpmS/RD9zvgwP//RSJBcagDxB81SYv0BxBZAx+laJPd+1
	cIeiRqoLhXYA3NkzVl87P/GDxcrj4ou0+ym6e8Cu1QKCS8XHqpap92UK
X-Gm-Gg: ATEYQzyhbdDtUMnL5+8cF+aOH8Bbf+RunKvogrSl4lhoBjo+mlRTG3Ec5mhIhKtcPh/
	XspjDuENsmGMKQw4t9rJEpbGBFAbD1Pv1PDxf9Tqig4tws1zSKCpz5tZ4REYPqht1nkTTM2TbfO
	OvxPzF4EmdjgAyuonU4oo10S1ZzM5RllcDYM9PV2E0hrXYzQ/XR+F1lKB7y1O/RICMHl5MEjYcA
	Cxvxx8zQL6hnG+T0qoVJ2FRFXiEyWPMvHk6KLcuurAhz5jHVPMa/PLtGsHBlm8j/mVoX+25jAmk
	ySHgu1ArqytGYlHEFHCL9OJVRRX4ktKm2n+8yrXX+/RM+2AnDdOFXPR02YYC3dxISw+O2Keki67
	kumY3+T3QSmSWtLZ2dTZGNYbD5OmaDQG7MKScPhF8PprMAs2M97krAo3ZdXK3GkfEo/1XJzTeyD
	MJSyH/sHpm7HJU68raou9tqqB3FjWVwo8dKbTjlYagJlwsFqCshKhO515eFJRdchWZAsUfWhBGL
	JLfU8I=
X-Received: by 2002:a05:6a00:69b1:b0:82c:20f1:ea9d with SMTP id d2e1a72fcca58-82c20f1f47bmr1784126b3a.5.1774069310128;
        Fri, 20 Mar 2026 22:01:50 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:5c27:b800:7775:1147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbeff2sm3573925b3a.20.2026.03.20.22.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:01:49 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com,
	Deepanshu Kartikey <Kartikey406@gmail.com>
Subject: [PATCH] ntfs3: fix memory leak in indx_create_allocate()
Date: Sat, 21 Mar 2026 10:31:42 +0530
Message-ID: <20260321050143.1117500-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When indx_create_allocate() fails after
attr_allocate_clusters() succeeds, run_deallocate()
frees the disk clusters but never frees the memory
allocated by run_add_entry() via kvmalloc() for the
runs_tree structure.

Fix this by adding run_close() at the out: label to
free the run.runs memory on all error paths. The
success path is unaffected as it returns 0 directly
without going through out:, transferring ownership
of the run memory to indx->alloc_run via memcpy().

Reported-by: syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7adcddaeeb860e5d3f2f
Signed-off-by: Deepanshu Kartikey <Kartikey406@gmail.com>
---
 fs/ntfs3/index.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 97f06c26fe1a..11f59d7b9ea4 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1481,6 +1481,7 @@ static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 	run_deallocate(sbi, &run, false);
 
 out:
+	run_close(&run);
 	return err;
 }
 
-- 
2.43.0

