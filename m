Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D130C179
	for <ntfs3@lists.linux.dev>; Wed, 24 Jun 2026 03:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272503; cv=none; b=YCjN2lC0N8uxtC13joZUXvUAO/bgBpAJ0i6wlGRDbtOAyilU3FjDV1Z09txrxnWseYryUaUQ4hs9fqqKY0WEihG4grGMmmXrqk3nNJtO/nbE5Hke5RKONaOKtLsGQkfiRfxqZo/puB7QwtBTxVCIRMl5507uNkBBe+7D3Jy7XrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272503; c=relaxed/simple;
	bh=CY+tNU7GMtSGXkZAry8HH0JrKZdkesTI/8rov5D0NHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+oUg65draSO9ppRArNqscUsbxqdNsKCs6Tg8VD/8ZnGy4eJq5BJ+NmiDxLx11RX+dgz1GfQamZqCAZ1UcbIgbT5DDAaMGej6B+XmftubnSDMmOKQgLtrHDbrp6CoaBknfozSZTzHDCfL5ifoEbkyrUqjiog2mIZqJj8H1o2mUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeT1cpDl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeT1cpDl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so369678a12.2
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 20:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782272500; x=1782877300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=beN+/tmi2yavCBr4937vYEbhqn8BZbwpQDA/8eL/t4Q=;
        b=ZeT1cpDl7COA0jP8OWDoLA+s3qj12iaz9O0jm7RkTuIibaEQXK22qSn45r3mK+SRig
         G8H4PZmloEHTnN/z8Ht5WWIMdlOxGv8R0DnFgvWJW6KPGAu9s1jhKNLbC6XPrRNJmn2x
         QlRI9bPhMHbvVzhWKs/jmVOsRWcnHXE25/6PJILg0XqqkbQ3BNdlZ5NBLilRAw0hyXrK
         MqvtsAVIPx1iF8RFRVUArIurZHDKNCUgQNd8q9E49t96QMAMc8UrE/9bHvs6dCHBY9LE
         wX6LrpjTXPKzy/jCMb34rhB1o0KEpuahkSUdK4XHNGvSaOH3TtbXqkwx/Y8EdMboF+6F
         0ZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782272500; x=1782877300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beN+/tmi2yavCBr4937vYEbhqn8BZbwpQDA/8eL/t4Q=;
        b=Rnoa/FiDQ2h+A5i4HS+NcJDg3KyB46kBrMjo4hG5R/iWlx0elaFRCM9xSE5TaSK8Wt
         bezR1NCedUnhvXHupoVocaLjy4xa+sl9ljAdfhGbRDKIGRv92Pe2cR3riFZVMPGY9fw/
         h2XC7ACxudC4QO+4/fB4u3QlCnhD+pHSJZUgEBt1hvEWGcWegWaS9ELxX8XYJc+BIlhJ
         HnedXmd43tli8u1IPMzBUR43Rv0Kp73FpOhfbeoZJL7FQg3NEqgYonFqQ9FKKXdGECkE
         b46ro3ZEQXRKgd6WLdrNOckK/YxDnvzRWZSLThRhKRI9dOKs4lEjJSWubdKMtqtnaynq
         5lKA==
X-Gm-Message-State: AOJu0YzNEsu0AKtot9ZiI8QBGTWGDTremPjHcJ2FuqXA4CM1ICqM3QKx
	O/90RkPARGXm+UAd42dMwWl7o3M/ISX3xDzmXUn8BYPNaUHNrWovyqjJ
X-Gm-Gg: AfdE7cnhjO2yQbZcxez4FOOTBOVfbWYe7Z6HdROBP0HbHzxl9ftOcy00mjJU4di3dA+
	9+/BUIzYudoEdxolEzsWIhdxkhq2Gq4fotANWDvqnB8WfhIGvi59cmNtbzYN4zrdluJCH57RpIW
	7Y+zYF2QrJtPOA0wDXroRTGeG5TtBb3UMF2pMN/XL13jHme98G1edIzqPnMjzAXtPoUtWIwcpEL
	PIehARAUlA4rVEwyPCJ7H9TA5ke/rWwL67kwl+LumCOb8ie+TdELq3F6T5rwaZNq2CcgHPN7xuc
	JOVNL6msntlM3juhyOt52nW5adApImZ7rj8xonuDp6KFbMdw/IW8E/69gS1gZxFY/qknXhCOe8T
	+oMKP37rhynKCyV4yDFr2BiO3nEt4TO1qYcTkVqiPC7Qb3Uyw6EjGLLA7OMCcTDvqG/VKkpcXVi
	fbnXMG2vemnQy8QaRQ9RaDTnw=
X-Received: by 2002:a05:6a20:e211:b0:3b4:8fb2:a34b with SMTP id adf61e73a8af0-3bd14f2e765mr7359013637.11.1782272499998;
        Tue, 23 Jun 2026 20:41:39 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm658494b3a.54.2026.06.23.20.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 20:41:39 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: fix integer overflow in MFT cluster validation
Date: Wed, 24 Jun 2026 11:41:33 +0800
Message-ID: <20260624034133.57049-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ntfs_init_from_boot(), the boot sector's MFT cluster numbers are
validated against the volume size with:

	if (mlcn  * sct_per_clst >= sectors ||
	    mlcn2 * sct_per_clst >= sectors)
		goto out;

mlcn and mlcn2 are u64 fields read directly from the boot sector.
sct_per_clst is bounded above by 4096 (true_sectors_per_clst() plus
the is_power_of_2() check below it), but the multiplication is done
in u64 and wraps when mlcn (or mlcn2) is large enough -- e.g. mlcn
near 2^62 with sct_per_clst == 4 wraps to 0, which compares below
any non-zero 'sectors', so the check is bypassed and the malformed
record is accepted.

The accepted mlcn is then used unchanged in

	sbi->mft.lbo = mlcn << cluster_bits;

In practice the resulting reads fail at the block layer (sb_bread()
returns NULL via grow_buffers()'s check_mul_overflow() guard), so
today this manifests as mount failing in odd places rather than as
something more dangerous, but the validation step is still wrong
and there is no reason for callers to rely on the block layer to
catch a value that should never have been accepted in the first
place.

Use check_mul_overflow() to compute the two sector positions and
fail the mount if either multiplication wraps; this preserves the
existing semantics (mlcn * sct_per_clst >= sectors) instead of
switching to division (mlcn >= sectors / sct_per_clst), which
would tighten the check at edge cases where 'sectors' is not a
multiple of sct_per_clst.  The check_*_overflow() style is the
one ntfs3 already uses for similar on-disk arithmetic in
fs/ntfs3/run.c.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs3/super.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 3305fe406cb2..4205a212154b 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -65,6 +65,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/nls.h>
+#include <linux/overflow.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/statfs.h>
@@ -957,7 +958,7 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 	int err;
 	u32 mb, gb, boot_sector_size, sct_per_clst, record_size;
-	u64 sectors, clusters, mlcn, mlcn2, dev_size0;
+	u64 sectors, clusters, mlcn, mlcn2, mft_pos, mft2_pos, dev_size0;
 	struct NTFS_BOOT *boot;
 	struct buffer_head *bh;
 	struct MFT_REC *rec;
@@ -1026,7 +1027,15 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	mlcn2 = le64_to_cpu(boot->mft2_clst);
 	sectors = le64_to_cpu(boot->sectors_per_volume);
 
-	if (mlcn * sct_per_clst >= sectors || mlcn2 * sct_per_clst >= sectors) {
+	/*
+	 * Convert mlcn/mlcn2 to sector positions before comparing with
+	 * 'sectors'.  All three are u64 values that come from the boot
+	 * sector, so use check_mul_overflow() to keep a wraparound from
+	 * silently bypassing the comparison.
+	 */
+	if (check_mul_overflow(mlcn, (u64)sct_per_clst, &mft_pos) ||
+	    check_mul_overflow(mlcn2, (u64)sct_per_clst, &mft2_pos) ||
+	    mft_pos >= sectors || mft2_pos >= sectors) {
 		ntfs_err(
 			sb,
 			"%s: start of MFT 0x%llx (0x%llx) is out of volume 0x%llx.",
-- 
2.43.0

