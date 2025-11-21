Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C933CE89
	for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713104; cv=none; b=Zs2Ltu6FZtgOOnLo5Z6vmdFYMBBPxCGh+MxCA0i+69G3JME5Nk9zJYD8kiOrTPKWrfu4tDT4B/JMYxKheW38u8spSAYHhxeHIT8rWGigjB40PFVFkZUxvVfBHO0VeSSPWu65QXc2EjThMZNg36IyT7AJD4UNeWe+koD/+cCO6c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713104; c=relaxed/simple;
	bh=GyhI/g6BT2jDyrnrno9j5u6Y8zL8PZ/BqiyLx603u+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZFo9SxjNdCh/XcaEv+X9/UhWdAJgipX5bPvUvCYnq2y9ngNSXQ3yVDcz/gglkd3uWnFz3c7eHAiGDy885avnxgxr/bASypISSrKHEPWRsigRRCDlr8rP5PTidPdqx4EDdJ3oJ1t5Hte9aEEXLNrn5zHXBeNun9iGoCMdSnc7LMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSXLmb2T; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSXLmb2T"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso2707827eec.1
        for <ntfs3@lists.linux.dev>; Fri, 21 Nov 2025 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763713101; x=1764317901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXggH0+b8/rP3aYBPWiHo2+gkYlGyUfzMd+zPzEVv4o=;
        b=LSXLmb2TII/vBPRbQW1OoRGloQwPGNXm59LGFOVFRkqPXcEf3rAnWErfiZOsrWJGLa
         RJr8JV7qnk/x2qHGc6bXHW/0d7ykKHgiEURdqB1rXVRGZWQrV370ixHhkjMFc9fkmSYN
         Bf0ZJIYfvd0sOxilJPymkiS5NbNIazYjFO584C6TilYbuiufku94rPCSkc1etLyMMlwf
         rkvwDYcJlHuIcs8KTNfOzoA9ULAS0wszn4bIHSWxws+pRTuRCq0rHIAhs8GxoGAPlshL
         Pp38FLNLaO6/T2jDDitFrwiUUP/B6efP5HjCIt24H9dquU86fKzt4y4X761iIY9jr4+U
         uB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713101; x=1764317901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXggH0+b8/rP3aYBPWiHo2+gkYlGyUfzMd+zPzEVv4o=;
        b=fX0gnn/LKguEdDst/XQnxMF85wxjs4m/ldEGQ+ba+Sduc2DY1IFaHTAaWBhlIn0vIz
         gU+TLkdXU7Tm9fRl8p76sH1O0Z7d5bXWmEceheBbDvCxuH52QfR7BlGY4PbLxzvOfgnj
         PQLT/MectUMCsNBzStW4dGbWTBk9eAzfrSLbnrUSHuv8hO2FQwQdCR+x84lbY8hS8JwC
         zvOsCUlIjMRQM0QaE3pPqdVk3F9HpWQc1TI+0FdXQJqZVyxs4QvbYPSwUVe+3i7w3Qgl
         +gwPFL8k/zWUx5qyUvIyDhh5Y2LCJCeBq0veQuE/eA8L2mrlWFSxlKX+JAElre7i7Dzx
         sqXA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ4YvrFVle0pk9mnMNvhS9Qe75V5tJp2AMo5FSdjE8fdEJx9iyHUzd6k3ywCssTxbjrDbnvA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7I9Igd111gWp7Axz9wqf9309H5YuFaZfJD4hjOuI/uXiU6cUZ
	2b8SovMR3MYaHzXE4wfofTOc8nxIFhNHvlCR8ElkjQm9hA0zY2Mka/vn
X-Gm-Gg: ASbGnctDkW69VKKoySapn37OhHL9qVQNMbdJ7RhKnh81vMCCuWEegtZqddSCIq0a6cY
	igXg3k9U83RowiSqQcY188ylTOMdhejCavu0OpPg5MOYWz83+B6gIhlzsxEiobEX0ghb1CSZ7GJ
	nu9iibWNgWwNQ3twgMkefGZx9EcQiW20rW4pr6HURFEdJLWiX6OFq8SqDHAI8yH61wvO9CioyQN
	QlhwrJ3qpEYa5P/disNsPlpqtlUGftKYCuOswoKA6Qs8J3z9gAhudhpogj+TBzwDXWe5kVY25/m
	23qmA76ECSUkhb2IlCKWqRCPpeEwyma1XEmdNsH5FUCNq+JjI3v68Oxepe+83zDuhYH7vqQ3JQ1
	fr+fgZxG8Ct0JpTLlE3cV4f0LwwgMqGfziUvRTvEOdC2HkdrtSKxP6dQWzLC/prDrxnjzZQWjVX
	uoO+RAM3kj2z/O1tBZZ3jLLBQXLOGZzBcwVpF/
X-Google-Smtp-Source: AGHT+IEZ79TJZoTtjlwZLisOIZ0dGAr2lEGHTXQQoCt+6eH8PV20aIRNYUKQ7CDTkbiFuInj7IJvjw==
X-Received: by 2002:a05:7022:1e14:b0:119:e569:f86d with SMTP id a92af1059eb24-11c9ca96a9cmr324319c88.10.1763713101474;
        Fri, 21 Nov 2025 00:18:21 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm20997352c88.7.2025.11.21.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:18:21 -0800 (PST)
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
Subject: [PATCH 5/9] block: use bio_chain_and_submit for simplification
Date: Fri, 21 Nov 2025 16:17:44 +0800
Message-Id: <20251121081748.1443507-6-zhangshida@kylinos.cn>
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

