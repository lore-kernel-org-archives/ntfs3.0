Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DBB33F582
	for <ntfs3@lists.linux.dev>; Sat, 18 Apr 2026 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776517883; cv=none; b=WAEsh3bn9NwM+KF9cGaqMu58f4DczpWXotHfHCh/0KXH4BOp95kZ+pdonpMh9g21GIRe0daFX5RfF2FGsiLtX8I/QZI5zCzhl92o3jKOlqk2Z2/TDS3mXdQ27MSdxC2NUtGmm4aUxSaTj4FZ5LgaZaIyfBRxRIvE2+EAxnJaxQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776517883; c=relaxed/simple;
	bh=Pw7KGEUKhUdedwptQ7WoiwVyDYLoy54O/AX3prGQi0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bNBKVpkDq4U1msblQffYXiIlZZFnJHS0hKeUysQLWIksSMc7hAjgtQbCEbGTWIWDN009vkCZGJU6H8m0QEqiz5LvWAIr9ixkAP7zNVqbqI0DIk7xKkG8lNrHOXlcpHJ2t3YzKY4DL1lK1m3qA5J4Y6ZUpy9LjRYBehqIfaxShoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqUC5NtK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqUC5NtK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a041eae5so9953115e9.1
        for <ntfs3@lists.linux.dev>; Sat, 18 Apr 2026 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776517881; x=1777122681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QB2Lzt5nJ7BYS4NIOtL6sS9VhTgTIpFR8HzjB/zp3KY=;
        b=SqUC5NtKMM4olqANy3EgFUp8XrHef5HOxgKCfpQFzhPBbYxQmX53zSbHO1lx9voaaI
         TIIg3KtP86JxY/XbnJzFt73BVQM1nIkvDBRSiK3wfrQ97xtiTNROj8A8tmu9i7mRS94X
         zM9ziHqLvdf5oIpqUCLKCCw/liTLcyIjAkb7J0nPwj6dEPX6fjj4JqQlOGh+9wUjI2lz
         PoEiJ20Z6kkj/ycHTjsPiaTqvcPJybGSZ+5QX+TJcgq/KK96Z+PzacdlqVfHpv14ikg2
         LPG1yRkDcnqa7fjQ7NMdPR1tshVkVLW5vvJjHCB5WBlDY7mVF/e0nCT5r11VcrS7inGJ
         mvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776517881; x=1777122681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QB2Lzt5nJ7BYS4NIOtL6sS9VhTgTIpFR8HzjB/zp3KY=;
        b=abAapR7PaZgpqdvds7i9y1P/QE1Jlupfzel1VozoW49km4VVyGyszNwC2inIj4q58z
         vurMjEfgoUVHaoxbuwz1sQtr9Ig+l02qW1fkxh0hrrWi/W5jkj/AX700YMLT/2WH0vPV
         T+Gm2KfbYLGOajd5rEEFrzyJXTt7JLW3aDSSwYCd4zsc91japB30gEIFL2dMsX2zNd5G
         NOJFDwYHAeF6j2yFgQnVQrw/KxUtMH2sAUvMEbvO1vpPGweT/7W5ZvwNKD0gk+aBf/Y+
         lZSuZ0qy/0EWHwwAhYhqQ0dgEMkpo14vE11YAX7O4wSnIdCer/pbMEkXwrntzbUnvnG8
         DBHA==
X-Gm-Message-State: AOJu0Yw+/D+Ws8NjP8FTH1IwGf0QdnO+9Ch+ZXTTi9lUxqRS8RTpi1Js
	bUVwEGe4LYyqyDpOASlYa9l10ok30MevO/L8lIAyPSwaT0Wf1Fcd1RisUHr9CPc=
X-Gm-Gg: AeBDiet8xRD7Jgch2dyUXmL93SF/1HLZCA1vh2spyQXES0xRJaZruXS3lyb2rR1v8bV
	wYRkEkqxt0bzxyoEeclbq/HnVa9CcTtp95dTpsAQK6SCCqwXHOWwjXLikq0x2hZb0XM0YxTrzEC
	7zg2WbCgJGnM13NH4l7RcA4u5UVEGtJGo5Xzin9/gTHVJzXkoQv6zv6nkGv7zPWaBlmms/DmrVK
	69EaNYUS/uzwCcMslB5dEnuCwBbiVs7xcm5zlwmFWyfBO3toHwYag+GIneiEkKW51VlTiiH3RKI
	9nup11zhdXpWpnWL76dZSZMVlh9kEUJAhE5aW+uXPBDTGQfoLNHhQpuzxyLKxxucA44jnezjBaA
	cMlTJrjJ39662wIFry1uMtr2iJpDsGn1lvHiPEhbGtM4BIf+NEpHJJq4bYLpZa3ZGG5Mk6SDAT5
	N7gJw=
X-Received: by 2002:a05:600c:c167:b0:488:be21:54b9 with SMTP id 5b1f17b1804b1-488fb747f8cmr100796545e9.8.1776517880573;
        Sat, 18 Apr 2026 06:11:20 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm138816905e9.2.2026.04.18.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 06:11:18 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com
Subject: [PATCH] ntfs3: fix out-of-bounds read in decompress_lznt
Date: Sat, 18 Apr 2026 13:11:18 +0000
Message-ID: <20260418131118.1063963-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

decompress_lznt() does not validate array index bounds before accessing
the decompression table. A corrupted NTFS3 image with invalid compressed
data can trigger an out-of-bounds read.

Add index bounds checking to prevent the OOB access.

Reported-by: syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 fs/ntfs3/lznt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/lznt.c b/fs/ntfs3/lznt.c
index fdc9b2ebf3410..f818d97850049 100644
--- a/fs/ntfs3/lznt.c
+++ b/fs/ntfs3/lznt.c
@@ -240,7 +240,7 @@ static inline ssize_t decompress_chunk(u8 *unc, u8 *unc_end, const u8 *cmpr,
 		if (up - unc > LZNT_CHUNK_SIZE)
 			return -EINVAL;
 		/* Correct index */
-		while (unc + s_max_off[index] < up)
+		while (index < ARRAY_SIZE(s_max_off) - 1 && unc + s_max_off[index] < up)
 			index += 1;
 
 		/* Check the current flag for zero. */
-- 
2.47.3

