Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071806;
	b=Sq2Yu77PaWszQZJiQQI05c4wlguf4KhvJy5DtnN82Q0l9w/WnF5Gx9C3ZCH3xxoYtfvX
	 ZSer2WaUdSvA7RKSlE2dHPI1Lgy/7+u9/Vfwbhkas2wehPcnrMT/OGxWA2cWWWqwfe1tn
	 vJ6ip7crb8ncH34fhArZuN6j5DIgtpa8w9XeKsI5ALmIHto1nFpiu2cuKyueZ7i1fbQW5
	 u5d4TrUF2Uzw2bzXXTrNSqIYyyHx9RoJmcWyxY5ykOC1YJVSfCgTrB8MIseGzbFGeagFc
	 VD3nvT3cydiBJIybHSr+8d2I8GI2cY0HBQCCr0T5a1lEOEEGFhqnqgrKT9UuLzCma0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rmF6Xu+9wYrDXpgVne1XB3MHrNc0Gs4/uTZG5IQjBTA=;
	b=OsA6zDMP5ObaUH8+ZudB+LPoI3jRq2T+XqibbCsCNL/b9q39Py43FOV5R2GEtT42RBso
	 N6FTIarDOWrI0ucqiUczKBFheKRm5zyLJwYiw9++Ohn/OIjBVCed3jR2AIefKY/YUeIw7
	 pmSb5N82Hw0UMVVjmmL4T9kRg6fuYCn5IDAmfLcU7fMg6Lx7R3+RspbXMYaNxuYpzzIJn
	 r5jJa0GRGk5d9iyHXK0natcyZxn639w7s3o/cSKNfB6RYCCpyKoVsISMHzswrY1GeZSio
	 fjFl9e5TgsOtYf+omTWW/PVZsdOZbgnkhf94BdBQzzjaYsaMKjQRgKRFHQtTr8+fXLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpAU4Jab;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A28D606A324
	for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 07:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A28D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KpAU4Jab
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9ae391a05so4108725ad.1
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 23:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795071805; x=1795676605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rmF6Xu+9wYrDXpgVne1XB3MHrNc0Gs4/uTZG5IQjBTA=;
        b=KpAU4Jabef1G4dhYOZHHaq0AZL8IFjvl1jaxacXR+WUMPDOQ5iy2KsI4eu/3awFyNx
         VgoKiQeJKfXq4zC+HYuxZ6zqNe5NZFx1cQq64WWxU1Bb/nz55JfRTMusxhbGGrEPCEId
         ePTabSI4QkgAPbhE0BffcWn79uBqYJVWxeeD5oyetqQ4yno63I/MTsKxW6JBM2PuFQ/n
         61FLAA0S1NsXkiROAE+8VL2roq0oq9y8es1LxVmTxahXjbn5veGwZ2hV21MhbFJj22sY
         yCGVNp3DcJW0mLTp94m19xGJLz6bgtS7pROQYX7e/tp/jdCOBJdXWjiglPQIZwuB2Ib8
         hlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071805; x=1795676605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmF6Xu+9wYrDXpgVne1XB3MHrNc0Gs4/uTZG5IQjBTA=;
        b=CQg3Ktw/Shrdyz046tBONeuHyTzVxicirHSZEkuTG92tRqBMey7ZR2CJ/SA/kT//aT
         x9KUeBFz0EQw04xlQ+CGkONoDohaVafBVWjcY4XiBxqsV6o5RX0opJ4gARFI0KR+MX1u
         buW8slp0Jxk0MgJfKehfCHFuErEl8Oi/Gr3L5YVhpLETc1YBqrCkrkKbKocznVSyuS5H
         8su6LlWfv9/Blrp/YZoWJJS7tZdkmP/j5+8iC5QEsRKMbzWWGf+f+oOJ0Z/5NbQ6Wq31
         ryEy/O65LjDB4utzvJUiTqha4kb1OHfXtP6M3lTc8K8OOXudEMbRFsvMbZqHW2o2MICW
         tSlg==
X-Forwarded-Encrypted: i=1; AL+hErFPeigjiJz5BwyK1YWNthYKDtSK7VzhxiF+Z/9TwPoOLvshX/9LUCZebPY5iWUqbhOxFBxgfw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8+kGiextm47CrdxYibtSL5tLA7pJUJLb6rNyRY7tLjlr8RcdvJ
	Zu2kFy5aF9SpTkJUsal59pwziu0kY8TmHwkVJfH+bU/4407mvIOVRDVk
X-Gm-Gg: AZFdTZefiU7EQHp0FIZ27vCtlu/UsWl7mtnbiBQS1Fo322E/w0a8DF4z1lLOzOI7RGu
	OhLGr7OcitvRKOp04aQXea+tTHot02m4oo4Pd2/SSyG0lqH9Jh/V32QTogUCRcztL9ERjpFR8xe
	xxROisC/Hc2wq5LDjjcq2HOBoru4j6Rn8U6AUip9Ha2GgbMD9Tsp/YvgYKPD7aSXrbfPFCQ18Io
	5SuP4KF/tB6MAlovzSPlIUTweTql0DHaaJG1xYXmkhGM+7HBfjqCv5zoKrZn+6QP4kxyY3XGBcq
	pqW4qPzdmkv6grvXu+GNOBNCNWlMmR+x8tT6XS7wtKbzmH/NU2m5EspkH9sOtczYZPbzLnlD87+
	UWtLWLZ3zUCPvJvxcHmwn1G2sqGbPYSpVe+NsSq4tTDkmiEmI1h3X4aKAbChJw017kRcz0EeBrV
	7avqqFwvpSSixDEi8Ofur7/IoOSJUDh8M6e2lk0c0e9lapwbwhd7xmoEsuiUqieWXSjEvc/4qyv
	HIHZdtCOTFsJU944mGrnEsnSyhIJyhIu0bR5AjT1hQhYgK0ho/Rzg6MDgcRBTV0DhNJTRF/UGUV
	MJ3AdVf4Xkgw2frEKSe9lV4aHVtucW/wJI77dLzwrUPoLw==
X-Received: by 2002:a17:903:384c:b0:2ed:520:2641 with SMTP id d9443c01a7336-2f031fff21dmr2143265ad.31.1795071805138;
        Wed, 18 Nov 2026 23:03:25 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617f8cesm25297815ad.27.2026.11.18.23.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:03:24 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: jakeld@gmail.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] fs/ntfs3: accept $Bad covering the last partial cluster
Date: Thu, 19 Nov 2026 15:03:19 +0800
Message-ID: <20261119070319.3803611-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs3 refuses a volume that Windows, chkdsk and the ntfs driver accept:

  ntfs3: ino=8, mi_enum_attr
  ntfs3: Mark volume as dirty due to NTFS errors
  ntfs3: Failed to load $BadClus (-22)

The volume has 64 KiB clusters and 7337721855 sectors of 512 bytes,
one sector short of a cluster multiple, so sbi->used.bitmap.nbits is
57325951. Its $BadClus:$Bad covers 57325952 clusters: evcn is 57325951
and alloc_size is 512 bytes over sbi->volume.size. mi_enum_attr()
rejects both values.

To reproduce, run mkntfs -c 65536 on a 256 MiB image (524287 sectors,
4095 whole clusters), then extend the $Bad run to 4096 clusters and set
evcn, alloc_size and data_size to match, in both $MFT and $MFTMirr.
ntfsfix accepts the image; ntfs3 does not mount it.

Compare alloc_size and evcn with the volume size rounded up to a whole
cluster. run_unpack() still checks real LCNs against nbits, so only a
sparse run can reach the extra cluster.

Reported-by: Jonathan Pitre <jakeld@gmail.com>
Closes: https://lore.kernel.org/all/CADjMKxV2F-vgD6kVoo58j83p9Cc-xn1U_L6T7V5Y+FNNHaGUNQ@mail.gmail.com/
Fixes: c4a8ba334262 ("fs/ntfs3: Add rough attr alloc_size check")
Fixes: 20fd9f64c005 ("fs/ntfs3: reject out-of-range evcn in mi_enum_attr()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in a VM on 7.4-rc3 (20eef29b7c84) with images forged as above,
64K and 4K clusters: before, mount fails with -EINVAL; after, mount,
write, fill to ENOSPC and remount work, and ntfsfix -n stays clean. An
image whose $Bad extends one cluster further is still rejected.

 fs/ntfs3/record.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index d7785f9e8e09..22c5a2c56064 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -317,10 +317,10 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 	 * since "(u64)-1 + 1" is 0 and "0 > 0" is false.
 	 *
 	 * For a non-empty attribute evcn is a cluster index and must lie
-	 * within the volume (sbi->used.bitmap.nbits, set up in
-	 * ntfs_init_from_boot() before any caller of mi_enum_attr() runs).
-	 * Bounding evcn also prevents a malformed value close to U64_MAX
-	 * from slipping through the near-wrap "evcn + 1" upper bound.
+	 * within the volume rounded up to a whole cluster: $BadClus:$Bad
+	 * may cover the partial cluster at the end.  Bounding evcn also
+	 * prevents a malformed value close to U64_MAX from slipping through
+	 * the near-wrap "evcn + 1" upper bound.
 	 */
 	svcn = le64_to_cpu(attr->nres.svcn);
 	evcn = le64_to_cpu(attr->nres.evcn);
@@ -338,7 +338,9 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 #endif
 	} else {
 		/* Check out of volume for normal attribute. */
-		if (evcn != U64_MAX && evcn >= mi->sbi->used.bitmap.nbits)
+		if (evcn != U64_MAX &&
+		    evcn >= ntfs_up_cluster(mi->sbi, mi->sbi->volume.size) >>
+				    mi->sbi->cluster_bits)
 			goto out;
 	}
 
@@ -370,7 +372,7 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 		if (attr->nres.c_unit)
 			goto out;
 
-		if (alloc_size > mi->sbi->volume.size)
+		if (alloc_size > ntfs_up_cluster(mi->sbi, mi->sbi->volume.size))
 			goto out;
 	}
 

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.43.0

