Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552BF3FA5C2
	for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 08:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833394; cv=none; b=rMHUx2fABo1SWszqLcUNKMheYx1fxhFeWTHbrXJAVGXWxQJ5kU6if9jeDuQGHMFnfSoCfSNBilM/nWsfFPo904lO0hZVqrnGEg4Y1pYaKJyUu9t9j2QvladJmqfnodBlD1EMT0ju9+TIFMKJRzqjF+fkso6PunUPpG982b1L6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833394; c=relaxed/simple;
	bh=kf0TrrJpgVAYeBXNpY6fNQGA/hm8ajYhClup86nat0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KiaLlQTonK4F2oWtRxh2odpDRyy0kMxgn34trEbiCgnZYu/CuWBBm4cE5B7dG0Ci/MdfKBePG9sZ86S1OgIFVjFbN0vXx3I2hiuog6jcprMkeXtM88x6Sow2/MjSfhHV0Gucbk7k68sx2O9fFzasCa+8cYa2Yl+i8vnGhTq0pHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/Lgtz4Z; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/Lgtz4Z"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-835386ff122so8552097b3a.3
        for <ntfs3@lists.linux.dev>; Fri, 15 May 2026 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778833392; x=1779438192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDJhfoHAUgZQanl3xvd/N6+ekkXj0jZn5bqMRuYYEWM=;
        b=a/Lgtz4Z1Ut49JtCGZIvC6MzPxbgitqq5IqzZ9F+DpXBR2U7+QGRJr5pb58TwsaW6w
         MkAeRdu1aZaoIOLLovAxfPg18IBPhIZPrCopyrw4q2LQffG5MWGL/u6ko07G/dDAgUlH
         +8qhPMPYVc8P5i/Kbz4FRTmslPxI76Ra38Jj/BB4ol3bVOniZc+89aG2bhaptluSw2LW
         1HzVVOVpfO/yNZP/KjwD49ytdnF2oCJnoTRzvisHU+zJdFlYJH0JOjUtP3C7CSF8Nc1y
         Zjm43J6tKduc8Dh95EyeZDZk9Qs5HxjJjFbZwNifWqGb+NJSISHK6pmYtURckBPSZNP+
         E1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833392; x=1779438192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DDJhfoHAUgZQanl3xvd/N6+ekkXj0jZn5bqMRuYYEWM=;
        b=IsFLcpiEhB1Pf+4TgNI1x/Aruu+36/aON/jd9DFVIFPzLNp6419yUW9nrPOrjBQZqc
         7qbJyLNqC5Z6gXT4AlT9ZVH5dfuN7DkxV9Rj3rt4qlv8x3XUdS7piTtdQ2f/WJpn81VI
         m10UF2RIIKdcXnRSOIKKNVYXc2g4yMpMvzwWvk498YN64mSty0iH2nMNxzQsyZwBAM40
         g6vfksLEXU3y1nNE4DigD+ABEhmXL8T0DgJJpClot+RaeCGJkFSK2d7yCM8gEQwOVqAg
         dE23lmKmLVBZeSnZo59aHauwDjbPLKzfV4psb+iPr9ClvJU0lahfDlsbCmhlsgUOCtC/
         MltQ==
X-Gm-Message-State: AOJu0YwrGswD/Prhn1FzCY3ptvYPQHfZJ9GFvGWzZx42O/nU3Yhnc5Vq
	VJJIpwwiwePLBz7qWJI1paUJ5lYEshjdkbFPrfBIkCIVRS3MntCfeVuk
X-Gm-Gg: Acq92OGiH9gvzp37pGiMAX6Sun6PCYwfx1Di2OuRMbEIjRkzq5XJDGZSezEhMB3SoYh
	37STsJaoSS45b9B9ZvYpHQ1M7HcE63+VdjjEiwI6uZAogBgjL+WxV2Vx/SStfDdMQThDr2pEiri
	5sXlynpr63cIgPCHRc6VaKGCC8SxcNnEumJ/zzX9tO4rDzPYB5nD3+kqVvY+MpNxQgfDEY7TqYY
	O9SUPN3jQMjYleQ6VqbrsWWiBxNmWuQQZ1QkH5ZF7d2KFRSvE1nmLm/4AlGaiVZkYM9dd7kshWK
	XF7TrV0S2HvO009xgcjZcVTQNmnUFepbcnRiT9H4x7KhZMILTj8HSFTSYV9+oJ4NwDqfeCsEp12
	xmRfMw5Z4n1jnAP0zsK9WJlHbvLHwRSuLum9YSR4sEFcf8D6gzkrXETqVqwPZdeVMRUP1puNMWu
	O+zmzxghkpqGU3vmw+go9w4q3+JU/+ePKdnGaRxg==
X-Received: by 2002:a05:6a00:a22a:b0:82a:65fa:cecf with SMTP id d2e1a72fcca58-83f33aebd61mr3456119b3a.4.1778833392367;
        Fri, 15 May 2026 01:23:12 -0700 (PDT)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775c97sm5318589b3a.15.2026.05.15.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:23:11 -0700 (PDT)
From: fra-build <zhanxusheng1024@gmail.com>
X-Google-Original-From: fra-build <fra@build.local>
To: almaz.alexandrovich@paragon-software.com,
	david.laight.linux@gmail.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v4] fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
Date: Fri, 15 May 2026 16:23:05 +0800
Message-ID: <20260515082305.54624-1-fra@build.local>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427035025.38158-1-zhanxusheng@xiaomi.com>
References: <20260427035025.38158-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

In mi_enum_attr(), the start/end VCN validation for non-resident
attributes is:

	if (svcn > evcn + 1) goto out;

When evcn is U64_MAX the "evcn + 1" expression wraps to 0 and any
svcn passes the check.  For evcn values close to U64_MAX (but not
equal to it) the right-hand side is still a meaningless near-wrap
upper bound, so a malformed on-disk attribute with svcn == 0 and
evcn near U64_MAX can pass mi_enum_attr() unrejected.

VCN (virtual cluster number) is a cluster index, so any valid evcn
is bounded by the volume's total cluster count, which ntfs3 holds
in sbi->used.bitmap.nbits (set up in ntfs_init_from_boot() before
any caller of mi_enum_attr() runs).  Reject evcn values that fall
outside this range; this rejects all out-of-range evcn values,
not just U64_MAX, and as a side effect prevents the "evcn + 1"
wraparound entirely.

Fixes: 013ff63b6494 ("fs/ntfs3: Add more attributes checks in mi_enum_attr()")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs3/record.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 32bdb034c2a3..4379446bcf96 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -202,7 +202,7 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 	u32 used = le32_to_cpu(rec->used);
 	u32 t32, off, asize, prev_type;
 	u16 t16;
-	u64 data_size, alloc_size, tot_size;
+	u64 svcn, evcn, data_size, alloc_size, tot_size;
 
 	if (!attr) {
 		u32 total = le32_to_cpu(rec->total);
@@ -310,8 +310,17 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 	if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
 		goto out;
 
-	/* Check start/end vcn. */
-	if (le64_to_cpu(attr->nres.svcn) > le64_to_cpu(attr->nres.evcn) + 1)
+	/*
+	 * Check start/end vcn.  evcn must be a valid cluster index, i.e.
+	 * less than the volume's total cluster count (sbi->used.bitmap.nbits);
+	 * rejecting it here also keeps "svcn > evcn + 1" meaningful, since
+	 * evcn == U64_MAX would wrap "evcn + 1" to 0.  svcn does not need
+	 * its own bound: once evcn < nbits, "svcn > evcn + 1" implies
+	 * svcn <= nbits.
+	 */
+	svcn = le64_to_cpu(attr->nres.svcn);
+	evcn = le64_to_cpu(attr->nres.evcn);
+	if (evcn >= mi->sbi->used.bitmap.nbits || svcn > evcn + 1)
 		goto out;
 
 	data_size = le64_to_cpu(attr->nres.data_size);
-- 
2.43.0

