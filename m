Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23572F7453
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318785; cv=none; b=XXAsSXQk9vlQa6YZq6m4bSd+yfYkjnRRsqtww8qJd2BxmOiSD7V0Suh5Tk3t6uObvj+n4/nU5Q2VdmqFoRtDP1YvXVKsFo38pL/cZku+SD0QFPeOoYmCN5TBGu8ua7j/BstnpJIdssA1nTAQ3kfcE06MhhVyyZz63J7grFhi56Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318785; c=relaxed/simple;
	bh=+kdxszjTpaHcpdO+OsTg3+9Bb8a87RQlO+SGH8oGptU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r0/nWypD9PwrMbQFqfcE5QGZ5+EHQzc9khlczyxGQpdjRXZmURjzQnM0z24+e/TdoGK82BvF6S8JLc9EEP5hD7mbIFfYRQEtAfeZoW+Jz7SAdtOuBY6/Z/k2qOFIUE4REpudtrwLFQxqKizvNc2nY2h3Tl6K0X1ImvZZus6ys0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqG4gacU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqG4gacU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1303548b3a.3
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318783; x=1764923583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOTI9zrIzg7zm0suBs1FvPesu0SkZxT8M/7CVofybKk=;
        b=XqG4gacU9SZIdL3nRR+pIDFwdfQAQYW26WeggPlmgHk91pUMHvWR1y5CsH+rPw8UeB
         cL1Nsf9IDY/mUKAvyJmVzT/UcMj4Faxcv/YQRAr4lGt3cmy5QNFF/CAtURb4WZ/Jav21
         rxnEtlNu3UXu89Kr02dKhykQp6/02H3LV9XOsDV+eFMR1lalfO5gimckJ7/NAzfCVcQS
         PpdTS73u/VC/tNzY0Irygas+BUZt/fBRuGod0AEkE8ZKifZMBTCIcg/PbHyRiCz4r1iH
         ezC+0zlovmt1GYTFv4oQkTTHIazidHbKomV8yeFh4geRr75kKqmKOuzom4A2r+i9KyZM
         PImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318783; x=1764923583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WOTI9zrIzg7zm0suBs1FvPesu0SkZxT8M/7CVofybKk=;
        b=XCyHXvCc/+zSNi0SOrk9HuIVotXJH48JSWD8MLNRQBjZ4ll1Wo9es3Wsee66eMrjHA
         gEV0ajgcxoGBGJLX/bnDJhuqDRKQXLtyxnFD0qry24t6biIpn+AbiN/5a2yraD75BT0P
         1WLI5w6FH6jvfc8am9uVO8BmySA2yt1ISsbKnlCWGc2E5C2lzpE33IpLsAsdlT1JDKlm
         6yBFXnIbgRJ+p6n8HH4W/y5I/6bULYgEIq7PwXd+4/f+xvIyPJjy6XFG6GMoR2L8wJjr
         Ta03Wsd9EAEkADDG1uYcoPXB3cVaYwuGwDQZQH+euf6h1dCVGyqvNq+HWnFYovS1NLAM
         cc5w==
X-Forwarded-Encrypted: i=1; AJvYcCV4/U2n/n+THkUC9rzIfCNtqC21z4g9EIDefLcD/iExQIbkP+Hj3qnharKVoKoMwF+5ko4GlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyF6OhLEz9PfD2FCLAiR5XmYcscmMKL9id95mybIStOhFvG5My8
	MSPssDOvMkYkxfdgi7sB0rChR+M3BQmaQ5uoFIDSUqvT/sK/RvdNv8Rt
X-Gm-Gg: ASbGncuR/JUFubFaw3mkv2Gx+hdUXkfd8ew248ajAwmapq9JilbphOIPkyfyK9FEt+K
	GLH3mtSckW+h58tG5Q9tijb17lDLr9A5urvnWVBGefobbZc50aaZrfdr6QP/rPlxzMAOaa1BASk
	m7jVA5LnldYc6yTu/GsFwiGoUGfGl3Li57Btgc1zC51DpLM1dxSMQfDcOs8z0Fvq3COSei2VvoC
	kr2sMidALWxDTNWOG+HgPAuPFJXt645mvTWYhmO0JdBFff85baHJlKyE9hZDXFSIVUUULuMybLz
	/xhcofvJ7J/JvCAp5LJ7CjuEWMmF2Mz2emKxQ2Ym87Knk3vtMFvguug8DMhlEfxBp0ntpqlOdHh
	VHtMcHBREyeDoRBWzIll8DzmbLDbGOLOBG2lae7mum0IjQGQMrnVXh7q1J43rhEc80whGpKc2Qq
	VVMayRiennmI+rpnoPblm+7Z2qRA==
X-Google-Smtp-Source: AGHT+IG9KZ7rWCO0ABhUceCtzlD+O/EyLZjlRlvHPaAHNjz6G3IYpmLI91Aw7ItyMwREv8ZXa06T1A==
X-Received: by 2002:a05:7022:671f:b0:119:e56b:91f2 with SMTP id a92af1059eb24-11c9d870411mr17435747c88.35.1764318783005;
        Fri, 28 Nov 2025 00:33:03 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:33:02 -0800 (PST)
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
Subject: [PATCH v2 05/12] block: export bio_chain_and_submit
Date: Fri, 28 Nov 2025 16:32:12 +0800
Message-Id: <20251128083219.2332407-6-zhangshida@kylinos.cn>
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

Export the bio_chain_and_submit function to make it available as a
common utility. This will allow replacing repetitive bio chaining
patterns found in multiple locations throughout the codebase.

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 block/bio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/bio.c b/block/bio.c
index 2473a2c0d2f..6102e2577cb 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -371,6 +371,7 @@ struct bio *bio_chain_and_submit(struct bio *prev, struct bio *new)
 	}
 	return new;
 }
+EXPORT_SYMBOL_GPL(bio_chain_and_submit);
 
 struct bio *blk_next_bio(struct bio *bio, struct block_device *bdev,
 		unsigned int nr_pages, blk_opf_t opf, gfp_t gfp)
-- 
2.34.1

