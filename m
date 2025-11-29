Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DD28312D
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764406922; cv=none; b=nWGasEJFCB88+ZI7OigPl/vl70WOZTtggd/Q9/HYALC/uhu9X7m3TwrGw+oN+MKhUe3Rv8wG3F7Wg2KYTEaPd61kAaXnFx2W+ErMZnBXtiMaq643c7a57hk26eat8QaCqAVQeHp2SG+3MAg5/UtDc5VaX/kpjnhugpxoujved64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764406922; c=relaxed/simple;
	bh=rZqecGhzp3NmtFjaYLSNOTM+/xsMiNIYX8VY+Bn+fL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E5DcKP1u3CHM4AV6FmhAIJnyVbmfSHDUdLxGAs6onF5xzQMD3IwcJ8TKnyhlPUnBzHxMXSuNmyYy+KrKaxl1cJCrkK+h+OcWo/OntKEMCB1v56D22BqGkSg4fY6vrSMx8dhmnRB5JEn5CGk5Kb+Y2gAgYZ41waUtZHL8XuzF4w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLVjtbWO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLVjtbWO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aab7623f42so2804722b3a.2
        for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 01:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764406919; x=1765011719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7vHs8yXaPj8mv/GRmviioQ8omsZI2Wqns1LW2Ikl6c=;
        b=XLVjtbWONINt0EaUILQJJejxF+KjlAUjJY0U88Ja87nbAgztL6jG5NiivvCxrpFNB/
         sr+QE8iiFKgqoYEDHqCmMYX1GN243XbODcPpzEjxD/ZGlXc4ZvW0nX0BowuKjFk9SyTw
         jQGiRoD2Q6wz9wXdZ9tE/eCgQMWW1cqHC7daX60+7pJbU022ZSdA7RjaAqMWKSWQRhBs
         9lvSKBvuxjit+Dn+xpBciXPrnfeG4Cj0JKKGJESaRlKLKVr2z9lB01OrdtwjDbwJcipc
         HH2fuJeR6b8VyFc9jrlC/M/vshg2JXdfAUSlPHuRIr/u2zncY268FD95l1zKIwRaCjmQ
         +tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764406919; x=1765011719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h7vHs8yXaPj8mv/GRmviioQ8omsZI2Wqns1LW2Ikl6c=;
        b=Nv4C3p4EGJMuV1MRtJpZOUVWEud6q9uz9rT8NjAGc0LTtzZjYBgyDACU04gP7+wto/
         AwqFVvB8torPmkbZWoMtUjaKesa5dAR5J3/L9AW1sSJ44J4dfqq9nvjZnEEWx482A8vU
         FGzaQQ5Jc0NaBiOc7bZsvP3z3/zzU3irc2uCkERx/2HXQS9OM+7+eXM9tzyyr2Y06Xr+
         p5FUj2V2xA+wiBXdpWCPrgLmWEdx1iPEz9UbnmieSpXxBG2GW1Kr+X48zAsT0brK7XiU
         9HCDXZQg/6iE3yfk5rPKwpumbVbYFg23uknbLA9MHd4Ddb7LcxYAHdzXUVfniL0goNP0
         Z9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVBabySVDOyPG40H2OKq/FHM0m6k3Gh6UkfhxuOsn8FgZpBCUQpBrJX8gGxBZY0JXvDHhQEmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0MHbJS2hc9DzjGkLfzWJmx3zj3FoctFAX7lhvPeeCs4hWHs6s
	VfkLTSXqA1aPF3vY7Cc/ESqC1TzwwmfVmou+/PAMK5EKnf64SrEGBLe5
X-Gm-Gg: ASbGncvIEb3Gn2R2M5bGIQR6Usoql2fzpey1vLcguWUrBDBQce+2X0eSaxJv8nOwgkP
	IMJuRiSsr2hVtvXi74a+cb/o5YkpPXOVZ6gbhxcxqNPaXApDPfMDTDZzirpudoXpZTzRqF+nWsa
	Gl1gOMTDpJPslXuj+vRHN9yaKClFU1Nqo4sIG+eEXo2A3R7RH7VE1O4V6RoiXRRN3g0HFrE3QJG
	Yb5a3HraaIq50Qi4zm8Zhn51Zf/23G1aDxctWaXO7Cz4c5DFGiKA2PqsCSP7EdThiK/7nbqLtqQ
	aEWEv7wI17OhDaMbWQe7nfFw1xchmUK8nPZDJf2jb6kxobwrEgDNPHo/1gGiCoUNd7DZx3FEkKy
	18Gl/+iJ8Z28/hO3JU2IxYQABG9Y/8Qgt45xYjWMp8Iuhna6Z1ef9aFX6o05jAcilgJfYfzdvXT
	XkYCAodnCY00k+hJWcbAh0wWyoHezerd0GCz9W
X-Google-Smtp-Source: AGHT+IFdL+OyABUQodQSrM5NvvO0TZqbCFx6Z3c8afGQwuwppQB6YRBsN5vK+YoTkxr7MD5m+Dfwkw==
X-Received: by 2002:a05:7022:41:b0:11b:b1ce:277a with SMTP id a92af1059eb24-11c9d8482b1mr17983636c88.28.1764406918534;
        Sat, 29 Nov 2025 01:01:58 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm28114394c88.0.2025.11.29.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:01:58 -0800 (PST)
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
Subject: [PATCH v3 5/9] xfs: Replace the repetitive bio chaining code patterns
Date: Sat, 29 Nov 2025 17:01:18 +0800
Message-Id: <20251129090122.2457896-6-zhangshida@kylinos.cn>
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
 fs/xfs/xfs_bio_io.c | 3 +--
 fs/xfs/xfs_buf.c    | 3 +--
 fs/xfs/xfs_log.c    | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/xfs_bio_io.c b/fs/xfs/xfs_bio_io.c
index 2a736d10eaf..4a6577b0789 100644
--- a/fs/xfs/xfs_bio_io.c
+++ b/fs/xfs/xfs_bio_io.c
@@ -38,8 +38,7 @@ xfs_rw_bdev(
 					bio_max_vecs(count - done),
 					prev->bi_opf, GFP_KERNEL);
 			bio->bi_iter.bi_sector = bio_end_sector(prev);
-			bio_chain(prev, bio);
-			submit_bio(prev);
+			bio_chain_and_submit(prev, bio);
 		}
 		done += added;
 	} while (done < count);
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 773d959965d..c26bd28edb4 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1357,8 +1357,7 @@ xfs_buf_submit_bio(
 		split = bio_split(bio, bp->b_maps[map].bm_len, GFP_NOFS,
 				&fs_bio_set);
 		split->bi_iter.bi_sector = bp->b_maps[map].bm_bn;
-		bio_chain(split, bio);
-		submit_bio(split);
+		bio_chain_and_submit(split, bio);
 	}
 	bio->bi_iter.bi_sector = bp->b_maps[map].bm_bn;
 	submit_bio(bio);
diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 603e85c1ab4..f4c9ad1d148 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1687,8 +1687,7 @@ xlog_write_iclog(
 
 		split = bio_split(&iclog->ic_bio, log->l_logBBsize - bno,
 				  GFP_NOIO, &fs_bio_set);
-		bio_chain(split, &iclog->ic_bio);
-		submit_bio(split);
+		bio_chain_and_submit(split, &iclog->ic_bio);
 
 		/* restart at logical offset zero for the remainder */
 		iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart;
-- 
2.34.1

