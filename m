Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE871990A7;
	Tue,  8 Jul 2025 23:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752015922; cv=none; b=OXN1L8YRhJ4+hWLXGD6B87mKCK3OjICxqkT6qtq/QczKhB0NYYnLt4M735yIKZgvERhwPinPYCnR2ozgLZ1Cf/JVh6kpnEI2mJ11wPrv7h9L6RYA0BAOL2A+a2e0DpBMIBIvQ8TxbV364TY8Dh6lN9pYURT3YL1mkTUf37O3+JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752015922; c=relaxed/simple;
	bh=WovQaQ9PikrY5uLmVbsHl3tpSSKbTT19zMVimO8nhF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sw5gcSS9+66dBAPHGOqC5wVIh5dksRW/M0rAm+LG34WNiqEjskVsYm06PRXMVaBn38XmB14Q+QMnkjnuM0KEyhqdQC6I5T2sMmldnUZqf4Qe0n4SwFvHMSWtAGC+oZdHs6ZSqy43Y+uGdpg5MyG5FWgdScuzBaap1xAHiTf3Q54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2SOicbe; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2SOicbe"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235e1d710d8so65013515ad.1;
        Tue, 08 Jul 2025 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752015920; x=1752620720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nTeLrKufhqWMbv8ZxgNZNY3CTIL94aICMXLX0urdhU=;
        b=K2SOicbejzpkIS7DtgE9isBonEBZ3bMftY6uj1L3XCVYn5PCLtM4MCrqCbJ7m8LstI
         wVEYVoexCBUasozFtd4Q77oy7MHu1P6MPRpFcGduDMLAyBKXTbzI8LxHkGvjtP51qyRJ
         RQdEAGFyjHaJvzRyeV/LlZLxoGpR35IJ0gtZyE+ixFxVmmn9cwv4U5uu254Ot6K+gOVW
         dYpUYThAfDDD9xcxrKSAX9bAXhWuhyfy5icUh18KAbWXCRbKivI7mDkcG00jSY28YX7O
         mOqPEgmZ8bb8+qpzgOyHYeLHgTuTa4GjoBqIJ7uRJPAcztbgZJddD65d69USFPDdRpPR
         FGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752015920; x=1752620720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nTeLrKufhqWMbv8ZxgNZNY3CTIL94aICMXLX0urdhU=;
        b=VNfrIgYQUXhaH/kkxYsdGTsMB21bfttTHMF466oyUc+i+wLSHeV13BJh2dPszp0kKR
         GCCAybVJr8J+3Z3E7gPa2q06c6y0Hv8bYuGl03h6/xscL6kCRQ7Agv4tQH/YoIB3eylq
         gcv018g7/ZTrQrjtsc8VDqOjf1E87eoYd2TQurozwo4YgXfwWXV2EJm2fxRj3NcijmC5
         41USkgVQpP0Ba3IF1R/MFOx/+3M9yMtsa1vwPUMrsLOCzeyUKq72vpgvn7JZgS4zxwxr
         YAiOHROVTUo7ptmetp1V3rJ6ezxKL92fbM28DRpAvRCfjDAXp+Ml3ilkdg9JD7HhBXgR
         mzpA==
X-Forwarded-Encrypted: i=1; AJvYcCWAWPT0Gd4gmHQhhPBBqA3Xlf9BlLDY9RWZ2bjbjFAmwEpAccoTGaNSkumuv5/IbXICYHaOn//swdOfdSwmVJLXY3UUXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUkt+2nkjJOFLgwvlE4xrhlntUwmlDqHqGRg/cv4R4dPofTOyp
	+oWON+bwiVJSX4hryvLk0r/hUKJvOwCNK6lR9vOE68hjp7fThgIforFk
X-Gm-Gg: ASbGncuHiYhpX/c548JFrVhUamJ/KhqVER6oXsxJGraVQ5CZmVLi5x3CRPOCcQJ3RFH
	4GPYAB10KWSBNvP0A9UMLr5mhM1Yo66aYUhieH9gLEebo7cTtYuPZPikHHY5Is96ILMk18JNGNC
	xZrJ9sV4+Ly8qAmFv2hBIzr63Cwy+p45OX9A/W8u9Ml39ZjiarLrVmihKGN3pYejut6iHaTiOcF
	v4f0aZTIogq6VQIEliF0/VpyI43R5gOBkHKVCqyh0d1N3gQeVUx6+aEem2soHbquK+UoPPxrezf
	oiws/Yn1hUqUgW1hHJg3Tm2KNhW1b34cRQK4zVXa3aCqcQFCB506+eh6EZn7JmPk
X-Google-Smtp-Source: AGHT+IEKFLgqtEP19+48DpnOvxj3AeRJtQt+1/a9IT4AzzhP5p8Oq+cBQQrGaVgjDHWgXi4OBaDXaA==
X-Received: by 2002:a17:903:2888:b0:236:363e:55d with SMTP id d9443c01a7336-23ddb2f2e2emr3240005ad.28.1752015919744;
        Tue, 08 Jul 2025 16:05:19 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:edd4:8189:b111:bc2a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8434ee13sm118879925ad.70.2025.07.08.16.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 16:05:19 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH] fs/ntfs3: reject index allocation if $BITMAP is empty but blocks exist
Date: Tue,  8 Jul 2025 16:04:55 -0700
Message-ID: <20250708230454.156971-2-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Index allocation requires at least one bit in the $BITMAP attribute to
track usage of index entries. If the bitmap is empty while index blocks
are already present, this reflects on-disk corruption.

syzbot triggered this condition using a malformed NTFS image. During a
rename() operation involving a long filename (which spans multiple
index entries), the empty bitmap allowed the name to be added without
valid tracking. Subsequent deletion of the original entry failed with
-ENOENT, due to unexpected index state.

Reject such cases by verifying that the bitmap is not empty when index
blocks exist.

Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
Fixes: d99208b91933 ("fs/ntfs3: cancle set bad inode after removing name fails")
Tested-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 fs/ntfs3/index.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 1bf2a6593dec..6d1bf890929d 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1508,6 +1508,16 @@ static int indx_add_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
 			bmp_size = bmp_size_v = le32_to_cpu(bmp->res.data_size);
 		}
 
+		/*
+		 * Index blocks exist, but $BITMAP has zero valid bits.
+		 * This implies an on-disk corruption and must be rejected.
+		 */
+		if (in->name == I30_NAME &&
+		    unlikely(bmp_size_v == 0 && indx->alloc_run.count)) {
+			err = -EINVAL;
+			goto out1;
+		}
+
 		bit = bmp_size << 3;
 	}
 
-- 
2.43.0

