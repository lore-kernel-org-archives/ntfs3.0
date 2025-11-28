Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FFA2E7199
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318790; cv=none; b=YZC/2/kZEckljLGU+xI11byEEamviOQ4z8b7n5OEMRIThOBLTlOuIYO1uqzaUOTkix6k3PgZ43fUoTgipmhvABv2IeX9ZOMQ2SUYK31cTmt1odgdqEQclflShfBD5JfiWMtgC6iFlin45ju4FFL8J0Bnot2ofpx28Gw9VdB2ov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318790; c=relaxed/simple;
	bh=eIesZROL2LjNY0DrQ6P8R8b1cwhdKxEhWtmo1wbXnYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gOnqx3WNgwlIThIG2JyLVL8sY6rRh05/3XDCeqaJ8B2hmuWfxRhdBIELEmj6ayHjhopfzphZhhHkGq7UCvNI0i+xrfTOeWe3BrhiQ5ggwVia8kfoUI09kPyAk0d0TVyca1A4coRXnooscUuREBtdhLlvu22YaTPeI3Ina/E/+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/Tctji+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/Tctji+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-298456bb53aso20074735ad.0
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318788; x=1764923588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAlkzqFb5MzFCJaoNDunPaLLzQJH14gDGKiKCNGaT3E=;
        b=M/Tctji+zir8RrMJa02kHnbrPuoppwKNRP11A/OWIxzOrDNDFfeYfPrJqH8NOFr3Lg
         U51Lkt9+FdI5+MGSKkwWfVBD15CQfETA++ib5U3O1lwSsBsVVL0cFEbU4bdP4JhGtgNN
         fjA83q1t8qymBzzqEhqfHWVLzfPkaQrbj66xnfpTfj3qhP8YOs6sFe+ztMQWGgiJX+CJ
         oTeL3k19OeEYtlWOMcFqsb51c3ThLwd8sdwyPwaJSmEAgOwD2rfkqtbQ9m+qWhxqhGpe
         XWCcvSJn2o9qL7D2Bm5O4tfXWwEN0oAVkq5V05AQfn6449WZgMHygL77ft0IAnedO2K6
         1/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318788; x=1764923588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PAlkzqFb5MzFCJaoNDunPaLLzQJH14gDGKiKCNGaT3E=;
        b=Zmw3k+caIvgpHQ/3oGumSSk5KYwYHTlWV4k70qlFszOPCSRvgAFoSdsSAbLlO0/dVT
         uv+mLIUpPKDKz5nNEDg30tvyEdTdqyZeRWY5S8NZkxLu6pojMlSO2R9x4/4jNO4cApw1
         KkfFwRUs11N8cMVvvNRkHoyyVHLhVMYF+Sxp3ZZ0cJgIUwdHsapAS6VdBypna1FTMS6R
         L8O/QKE5qauvqAgkAeBPMKWNNIeh6Btd8+8x858Ph1YFZuuPQcpx9sdQdabxWsCzHqHS
         HUmdt8YCey8UonLJeqmITc3CAnM5VFLITW6xaxnBOMIRZ/14e20Df4oLZldTGrWlirTA
         i5Og==
X-Forwarded-Encrypted: i=1; AJvYcCXuaA7RfvhpOGCk+Z/M1gDIBPvt8J0wuex5P1Rz3+LXZkqK98A/brWtFE5JU3LuhlOdMySa6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRA8ARbh9BaVqJ7L6tvFWE+Our2U00GV6OuVqWpMYtHC23RyE1
	LOYCcl08NJFaGy9uuaITgw4i+UusUk0hMTwtgDd7ACzaY9uIWGq6PacvPEQM+Psl
X-Gm-Gg: ASbGncuRps9MtrtyWOR0VYwqUYr6ooWTsnWzfG0ORMOrgjMSMInRJ0mzIIC0hBA8UWm
	8EUSGKGUF5Hml9uznu/I4uqYT9ezfYETiYTZ0RHTEVAyTIjxdGdLRGsRCaKFX6PDywiCXMVyOdc
	IE9ljW/dPu4o10DS/D2W2+p7QGkToux7fxEW98RxzBHKvWT0BfY5UN/ncTxGUI7q2ThwFushOD2
	hB05A0hRA1e2p6/A99RIFNVjmIVZU0+WfMicgdes4xeari9WEr0co8LvBJd9PdhSPFVDuQ4A7TX
	1xWhSNFcmWHAftbeAb0V3oEUeKQTA/Zmy4WKiirMVcvpgRFslJT6tkVorwHM0hkEh0XlH3GcA1G
	+9dGWt+1Z6nbiZXfVAaRb0TQOUyWrEmS/HuwVPsLk/jHTRRmALlsieAN185WxICtSeqL/QI72/n
	h0HcS8LfWUqfayZEufzveXAW/taQ==
X-Google-Smtp-Source: AGHT+IFIaFCQuKpxcLcZ63tEcOt0hGjrfoUQN9LWUQ2kBfICDUhGuL68J3zsB+mI5c6KDSWUdB+sFw==
X-Received: by 2002:a05:7022:670f:b0:11a:4016:4491 with SMTP id a92af1059eb24-11c9d84c6f8mr17988575c88.24.1764318788462;
        Fri, 28 Nov 2025 00:33:08 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:33:08 -0800 (PST)
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
Subject: [PATCH v2 06/12] gfs2: Replace the repetitive bio chaining code patterns
Date: Fri, 28 Nov 2025 16:32:13 +0800
Message-Id: <20251128083219.2332407-7-zhangshida@kylinos.cn>
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
 fs/gfs2/lops.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 9c8c305a75c..0073fd7c454 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -487,8 +487,7 @@ static struct bio *gfs2_chain_bio(struct bio *prev, unsigned int nr_iovecs)
 	new = bio_alloc(prev->bi_bdev, nr_iovecs, prev->bi_opf, GFP_NOIO);
 	bio_clone_blkg_association(new, prev);
 	new->bi_iter.bi_sector = bio_end_sector(prev);
-	bio_chain(new, prev);
-	submit_bio(prev);
+	bio_chain_and_submit(prev, new);
 	return new;
 }
 
-- 
2.34.1

