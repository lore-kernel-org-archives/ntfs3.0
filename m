Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00890340A62
	for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713117; cv=none; b=QU7cuzmnpfYVdGtTAGGVSoP0Z/muKZ3EfEl09ggPkHidSPfdtWJ7boffq205nsXP47qYTfxfPvDgEj9Bi+rn8z2ImPmxuM3VDq2XgmPVmv94oW2torbn/TDzjvIh4B3CvwpVDTCddlw2rT8LxVuB57qcfk3hYlxvFr8RNVLDcKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713117; c=relaxed/simple;
	bh=EqzE5eAUrOzw5wQ1NpDCM3tWSo+9dLaAmuNQNwJKJDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bFM9IT6yz49SqhRLzN2bo3kTIhRNKekbTgISork+YDag9khTAtaUR7HjKUR2ZUgsiUK7tg7HO9mHo73G9lxFoXW78N8NJ//BtIjKE9SfiUgOTmfhGVVyRwVIvWj8x4KHnjUEXsieOuU/yU7S+JPTLrEyToyEYd2SK6wXHhikdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G25UJC0/; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G25UJC0/"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so1175057a12.1
        for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 00:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763713114; x=1764317914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt1oIqGxOTrmRU0wY5Kf2stOafiOCOsnZEA0d2AzsC4=;
        b=G25UJC0//DH7ctuSypLo6dh4zliaOaRLsJKbJziaiExnxZGaz2DTbSj4+M/sPm5PUd
         AgeOExl78tR9vvnst6SQiasUWbqpH5eyN8Vqj07kcP4cWNCWL2A+WD8O4SX4ZhwDomOO
         hPaHyIRVXp9xbhedIS4IQ6JMgDucCD2i73IUBvXxt34qvmqe4FvlFVvzcED5T3wNFZxC
         4bsdQB/HiiXup7XogK5HNeQ3pRRe8j80tydIVI7CkVCZyKrrZlaB5hhKQD/UTB3Et+fh
         HwBhXnmPdeE/ftCepDE+E4ork90JoSnA6tkhI0vIcLoxc++AAvNS8Gl0CMyd0yyHW/DF
         uRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713114; x=1764317914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yt1oIqGxOTrmRU0wY5Kf2stOafiOCOsnZEA0d2AzsC4=;
        b=Az9qE6jmrdK+veAW2hhluJyEJutaRXaBpMqnkFyoEIpJCN2o6A+bIwTrxkgR+Sj17P
         ExGBVhtaPKlzK7LNEybGMylulZOjSdDMBrDk9sDejojxiDWkUrGsHMNS0z/feiG0j6v2
         RJ+KBrRKNTpYLqjQZv7pLj06vSjVZTYQEpjBxBzfegHdGnqpFHb7dk67Txf+0cb9pofb
         We66pEtBbgGFZYG3BRARIjsd0d4c4iXZ4puUiKwFc0qD3aSjAVHm9fUaI2YOvME6nnHZ
         Zd7CcX88+A4FTrBJaeWiNhWW2suyJCSJXBNR9uPCPOMKjJLYCoC13fvRzvFCGr3Vinkm
         +sSA==
X-Forwarded-Encrypted: i=1; AJvYcCXiKSzC7IphSeJBMYqeACg9wXa2i9LfZGrAjDvfP0p00rEpIeyMKBIjFBMAUEh9faubrSPm8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtscW8Gmj891ct7aJmFfVVTjJFKZjfsGosO0gklo9i2iLWL2o6
	MFtboJo0NXlAJdxW7T8PCLvLUb5rApFc9mRNYBJl1aXI/GpE59HlzXgc
X-Gm-Gg: ASbGncv8boNxx1cVso/l/C2Z6ROIYe6GTiCaNMJ60aZuTvhcwn9LVbJTQJoTAB2bk5D
	4SPu6BLJXhKbP/JDv2OYmCl1Gvd89E7nkEZzRhLcs8rXYcURIhzfueLpt2VMa9UVuOAzJql/TZ3
	xB9rwDeDejlsSgQq+E2Wpw4ujnFzO/ewbtp1oEHxIvaQrXC3ds2Bex5A3/Wp5ND6asTnFBrMcdk
	/z5EYkAI/WF+aoLJfQUzSZb5uKKH/pIOOTE6Xe0mOQyJgtF+gly7ol4+h3ND9I0e3vSwIi1np/T
	56iBYGxzOGiFVGAm3z+UiwpH35PuYJIPQeCRhtoRLbUDze32GIMRo9PoOnYOQG/GKiXqcypUkbw
	Lt2AbL+h/XtFo7Krpo7DADJBW6tuDV1Fh3yh5kQcZEIed6qlIel38dpnUZQAeHCUNAxQQ39ewlZ
	gXcpi/Aceg7sW8G6x6VaiRCR9xWlSZBj551L9Y
X-Google-Smtp-Source: AGHT+IGjQz6D1HhxF/O38ExwwmQdYex30Wle92q1+zy1HDlDdyzSrgD/kMDXWQtHpmE2DiVpd2L90Q==
X-Received: by 2002:a05:7300:238e:b0:2a4:3593:c7c9 with SMTP id 5a478bee46e88-2a7194d07b7mr663198eec.9.1763713114130;
        Fri, 21 Nov 2025 00:18:34 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm20997352c88.7.2025.11.21.00.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:18:33 -0800 (PST)
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
Subject: [PATCH 9/9] nvdimm: use bio_chain_and_submit for simplification
Date: Fri, 21 Nov 2025 16:17:48 +0800
Message-Id: <20251121081748.1443507-10-zhangshida@kylinos.cn>
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

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 drivers/nvdimm/nd_virtio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvdimm/nd_virtio.c b/drivers/nvdimm/nd_virtio.c
index c3f07be4aa2..e6ec7ceee9b 100644
--- a/drivers/nvdimm/nd_virtio.c
+++ b/drivers/nvdimm/nd_virtio.c
@@ -122,8 +122,7 @@ int async_pmem_flush(struct nd_region *nd_region, struct bio *bio)
 			return -ENOMEM;
 		bio_clone_blkg_association(child, bio);
 		child->bi_iter.bi_sector = -1;
-		bio_chain(child, bio);
-		submit_bio(child);
+		bio_chain_and_submit(child, bio);
 		return 0;
 	}
 	if (virtio_pmem_flush(nd_region))
-- 
2.34.1

