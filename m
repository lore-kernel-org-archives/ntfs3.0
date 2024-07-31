Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345F1AED53
	for <ntfs3@lists.linux.dev>; Wed, 31 Jul 2024 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434089; cv=none; b=Rdmyd6Zct4Mj5ztXZVVooXS8xbasEAdjVMUV8MNxEJblwxRxbQ+/gCQfGuajX8smr9NdQ6x1m/4CujMeYpwALUtTSzVGZznGk5pohBIEMoXtS/ivH8qbq/2TvPjKUKfe+VrsDsdLazEAFo77Fr2P9rzDap521t6nP8lAYk6qWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434089; c=relaxed/simple;
	bh=8cZ7LKFs7mJeGc+v4+iPls/B4S37umLa96hNuJxowA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHJZMMPUgKxKkJ3pqSYOCd6icTZ1cExBJ58ywlszRvIf5xWilolqqfv1cWK5r2HDhIywmM4QqPIuvqDF/7ub09KUN3Md1hTfIl4PcoEVPdUINkTnX0Kxd79kXPL3USFztf9AbBLMVAuVY2NbEt45EwqR5+NSAsGRsyTMf7CSmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=TLWJzPwQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="TLWJzPwQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso38091865e9.0
        for <ntfs3@lists.linux.dev>; Wed, 31 Jul 2024 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1722434086; x=1723038886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoJJmKmlb6pOf2w0Io+9nkBW5fd81cjrd3TmeWughbw=;
        b=TLWJzPwQjcvKImrn618TWw3f5liE5H6mkXlwJbv3Q7z9zNVs/SU/z0WLu1rN0JB8sq
         /Z1e7ssA3LqEILRoEfbnrRzQ0dbBf8GORCw2B3GJFwpgQDh+7VfJ3972yz1Z4rASG4+R
         GF9Vlx4VmVYtmnZ7qnGBRR1GX8ld6cbljiX6BIZJ6uo2ySPsIK7lT1P1G0zz8VKQAoBu
         Xrv3B1hOQ0wlUftMmd5HhHuxRpghLqz6QvMSm254PFraa6l17QtzI0G0doe/wLwRX+n9
         LXfPbQ7S5xLbbm8v18ML1U6BBxUl1YNxjFtwDzvRgv4cX10pB4au8Av3rky+lVWbCkQM
         eUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722434086; x=1723038886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoJJmKmlb6pOf2w0Io+9nkBW5fd81cjrd3TmeWughbw=;
        b=b3xiK/0t1n6vmMjmOuT+7IKV9B2c2XPa0cJ5o4MSLSopq8E7ImUfHUPlMeSDwB1Zhz
         /fVVlIATx1GVy0KG0Ceg3nNXUe83RHc4nDKdS1uPObW3Q0XtYC7AjseS9lfcWiS4wkNk
         PvM5AmYi6RD8cZXecg4l0XLJvuLPKGWY3K17p+lG69TE7oN8xxXcmuVLFGKZp+vRjEoh
         bLHJtNjqNgBWBtQ20ZhT/zX+OSt04gxj09CqHc5YZEklMtypKB00GOsQicTQ3Q7EGlJg
         kPmgweBXQpjxGPSGtX8gfF5FO1qxpVZ+UhrjEu2buo7xLiTWyCiF48QW53xg4Nf9NR8f
         BomA==
X-Gm-Message-State: AOJu0YxKwRJ9UvXHPHwV/nX2KNzqUQyiDSQ52GJv6ocNwYDdqTNnF13L
	j2+Yg7KBko3nDUhYfMKWn6yUc0Tt6vDrxVkW0HiM3+DfC5rqhWYeEHv0NaK7FMdP+BUMDVOPeeQ
	kJ48=
X-Google-Smtp-Source: AGHT+IHUO/t8tbBPVuGLNpykHjNyPFsLLPMW/WZZS8E6EuBjBA0hdH54GNHam3w9GuGi7t3kslP7qA==
X-Received: by 2002:a05:6000:1c4:b0:367:96a1:3c91 with SMTP id ffacd0b85a97d-36b5d0d1478mr8875813f8f.62.1722434086539;
        Wed, 31 Jul 2024 06:54:46 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b3686fdc5sm16938028f8f.114.2024.07.31.06.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:54:46 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] fs/ntfs3: Use swap() to improve code
Date: Wed, 31 Jul 2024 15:54:04 +0200
Message-ID: <20240731135403.80805-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the swap() macro to simplify the code and improve its readability.

Fixes the following Coccinelle/coccicheck warning reported by
swap.cocci:

  WARNING opportunity for swap()

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 fs/ntfs3/lib/lzx_decompress.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ntfs3/lib/lzx_decompress.c b/fs/ntfs3/lib/lzx_decompress.c
index 6b16f07073c1..d9adb290acba 100644
--- a/fs/ntfs3/lib/lzx_decompress.c
+++ b/fs/ntfs3/lib/lzx_decompress.c
@@ -511,9 +511,7 @@ static int lzx_decompress_block(const struct lzx_decompressor *d,
 			 * quirk allows all 3 recent offsets to be handled by
 			 * the same code.  (For R0, the swap is a no-op.)
 			 */
-			match_offset = recent_offsets[offset_slot];
-			recent_offsets[offset_slot] = recent_offsets[0];
-			recent_offsets[0] = match_offset;
+			swap(recent_offsets[offset_slot], recent_offsets[0]);
 		} else {
 			/* Explicit offset  */
 
-- 
2.45.2

