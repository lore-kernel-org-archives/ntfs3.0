Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075E2F1FC1
	for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318780; cv=none; b=orCMqjiC203Ry9BJd1sleFS1aDy3bQoEJmjtvMQkuQZExLPs1fvmXsuCrQKfoweXsanFiftxBFNkJwi3ilf0PykJLaqxULJ6MaMEdPfPWWPaY1lz1goQezv1V89n7jEtB7eyZtJy7pKUvkcS8hKMy0okYsVOSnmh+HCsYuX/ots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318780; c=relaxed/simple;
	bh=XfGf+/4TH9UT7Q+DEbtJ2829MlGgMcgOkxUS/OB2JNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LpyR6jPqsVvRxIG9qeVNKO35anLhhnSR3lNca7V8B0tlBjYyr/hTFvABwzs6t+hSvXCGxA/Yxg2Vg26ntS74Vmp8xvRkr5RQkXXB0OuX9OeY/QQMo2Mseod6/B6f8LYVsblvm3HnOdq7dy3r1HYu7Njqe1gdhdwpdTNM+SZH9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYLy3d6l; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYLy3d6l"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1827488b3a.3
        for <ntfs3@lists.linux.dev>; Fri, 28 Nov 2025 00:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764318778; x=1764923578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgav++xVu99AZZZMA2bV1F+Nxhf+A3QsmIfb5iyDR/M=;
        b=AYLy3d6l8pqS9y3rV+T50YmF3ZamtXqnYS68ZgS3dl0vYkV/CGZa4/lLxEI03UkEI4
         1vfV8VEkShbVDBjLcc/zqPqzZchkVqVJF0AfPlosBWpYxvA183NsvMV/aMc8Tojv0bGE
         LvAP2qTNnqkCXP3LreqEty63ALemME0sNFZzUW1rdb6S5ukvjxPf6qIDB155lxsozTDR
         BxmLo05a74H4OtJ1gz7k0IFvKOXuJVIo+flLwWMxIBvckk6AB7X1bmkPYwPBwviZgfTH
         yzBCtuHbBiadaNzPk/FyZXXSHlznsoa6hyTAhoUnkq/ZEmaY3gymtfSq6aWW6ZJeNRiC
         HD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764318778; x=1764923578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgav++xVu99AZZZMA2bV1F+Nxhf+A3QsmIfb5iyDR/M=;
        b=RNmzZa17C1AWtgpvZs18VrvG9oxcHCuHPw40zxuqbsTDYhOI5xtj1E7wEfj2L9WpHq
         gar94tjoLiqJbsEqCfkUFxPg0rhX5zevPUGXsmzE22U6cne1eH+3O+1hm+Lq669QlJKd
         9Az05ZzRbhawdeAK8vsIAiCkQA9v3JjWWmyCLIIyjGikdvR/JHseMesH1Mr6dDfkjCaX
         m4Facj271YPsbzM30Vd8EinpZw6f7lY7EoyWKerIy85/m6iv4JUXER7ylTMd+zWiorUt
         61vDbSirBiH7rdVnyHdEkA/lWuLQ6NXybUtarmoBfUoINCbzGVDLS6LSI/H7nX0dGDh/
         wQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCxwOwT6w6fMZdtuTPOqvKHKBew8H96AnllyRspr5s1WPCoaC9A4Q36oMPctW6WJz5dc1xcw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywue5/xmZUAKeRsQ2f2V6PzzjnnLpf2JzygQeUCKih7ihugkNUF
	fa7/d6LE2IBac3m/0pR0AQl5Ip1LNFLnEj5SlUaun1lxF1EobvxIzz7c
X-Gm-Gg: ASbGnctjiMfeBmYs2ZCH6Bh8ZvkdEOAcJr37tuoL5UYhc23Ojf44gO2PsXXV7mp5sWV
	0WvGHei8HIGNh12FQdSGUglXLVic2QRoXlIOog25sr0WEble5IeLsDhWB7iS9IZcj/H+r2YFvFl
	/EfU1JbODS6J/1LzafS6t2mX0X24g8xc0f7ljxokbsJdHhlYGiYC7R0BqL6eAigHB8lt3MGHKeW
	TZZFlYEmofuQpPKZJKEpCPi6VfGI+7xgA70v3NXE4ltYojMlPw4xIP46iRM2pBuOHrA1Mwl08Yf
	ge+tIRiP19VFwxYb/ZfpYJYwDiiAOTt+9MbstoJ9iuRtvFGWRQsQoBvaL2Kmd1lpl8sUfjuQzXI
	dm7rZcDcefcA4nx57+gQ8r4SIhGqQZie35QJi4yQeOsj9CWoWRAFEmZnGK+3uQ/aakd5ka+3vsE
	yH4YYQ+QGJiP8NAuwhun3bR90OdA==
X-Google-Smtp-Source: AGHT+IHuO0sAEeNowy1+oe3IeEgaIYQcRN0FMbygDOiWMPQmdT1sBtyBJY7y0vyzVSrhuxE7eNWdhQ==
X-Received: by 2002:a05:7022:5f0c:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-11c9d8539f7mr12036129c88.26.1764318777892;
        Fri, 28 Nov 2025 00:32:57 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaed5f6bsm20941371c88.1.2025.11.28.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:32:57 -0800 (PST)
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
	starzhangzsd@gmail.com,
	Andreas Gruenbacher <agruenba@redhat.com>
Subject: [PATCH v2 04/12] block: prohibit calls to bio_chain_endio
Date: Fri, 28 Nov 2025 16:32:11 +0800
Message-Id: <20251128083219.2332407-5-zhangshida@kylinos.cn>
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

Now that all potential callers of bio_chain_endio have been
eliminated, completely prohibit any future calls to this function.

Suggested-by: Ming Lei <ming.lei@redhat.com>
Suggested-by: Andreas Gruenbacher <agruenba@redhat.com>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 block/bio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/bio.c b/block/bio.c
index aa43435c15f..2473a2c0d2f 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -323,8 +323,13 @@ static struct bio *__bio_chain_endio(struct bio *bio)
 	return parent;
 }
 
+/**
+ * This function should only be used as a flag and must never be called.
+ * If execution reaches here, it indicates a serious programming error.
+ */
 static void bio_chain_endio(struct bio *bio)
 {
+	BUG_ON(1);
 	bio_endio(bio);
 }
 
-- 
2.34.1

