Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB32FC18
	for <ntfs3@lists.linux.dev>; Sat,  6 Jul 2024 04:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720239548; cv=none; b=fBhNmE3OBIz5hA4QypPWtM7lwySHi0SRVr04yGV4Q1uZNe+7vP31E49cSQjDRhA8Kv0j1RqGURLgaMQBwxLP2OjlEQaR16QgrElo13iQplkQERosw0wIoT2EzGKPo0T748GyAJGnCKr6jkzCcddyFBY0m8Gl4vZ6a+YH7T4uaA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720239548; c=relaxed/simple;
	bh=8cZ7LKFs7mJeGc+v4+iPls/B4S37umLa96hNuJxowA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sjcQXUm4WiTbsedrDP7BNx+OtySCa8CR0cCoMHaRcnok+bs+ZeaukhJ7Yl1XTCNE/Soc2PrLPFo/MUVbG5v9/Gy3e3FoSBL/XFbmvxPcY9QLqyrk1IzI42cZEzTs8qQ1aqZ2l9ILKYC7SGx+PZR9TjPT9MykIqiYFWEZvsJb76M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=ghQEQhNw; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="ghQEQhNw"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-765590154b4so933110a12.0
        for <ntfs3@lists.linux.dev>; Fri, 05 Jul 2024 21:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720239547; x=1720844347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoJJmKmlb6pOf2w0Io+9nkBW5fd81cjrd3TmeWughbw=;
        b=ghQEQhNwu/VSbNSZ++kS5Rkmqza2TX05sRNGAjuaGb7QDDJj7uKgfbataPLHoFaHJ7
         u2DgEfsUNxMJwDBPsBDEMw249AjSSsNQGu4mt5GyYfFd121NiKluHsDms/V48hnFlTyT
         ry6lrDhsJZhvCJmcFslqu0YfP7QyWDOPDsxxE7KdVzfNfQgXXL2jHUq03IIvnvSKPBKm
         LR/A0R41cy3Xwx9BIFVgLFlB8vQpfSos9fYuV0tU28hx0mXhokAdW3GFoZDYe5Lnq7oT
         L+L+UtfZtaRFUBiNF8dMTgLmboUs7724mqXk6qZv3BwJUzQk3bJKm1EEWZqB55oTYcEa
         Y51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720239547; x=1720844347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoJJmKmlb6pOf2w0Io+9nkBW5fd81cjrd3TmeWughbw=;
        b=cvKENkcSbPFbNZCbI+yes20Cb1euFaqQonA6oZE470QPFpWdfiKJyM9xOejfYfjz93
         Ifn3Pc4NK+Tdy2hANjHozzZ5rli3Y12gjX5zcktuL9cV1ldIySB0fHkZf5+7kOXQs9E/
         Xc1LLJMUqWoYSY/Zr6xv7WbTED+Bxfl4x5cjDblFPCM98b81N+Nuz6VAyZefc84zPAzY
         055S3EKGKpcbvqSFI48FxKwLyQ0RnErTTViq3tIf8qYuFNJRqeoswWKxYNqZyTZi4YXQ
         NG5RJeYppMCovuJBBbJzpkj1yjsgLXgJeowVWdOx7KmPtgmdReIU3nlFreuCMLiOYXuG
         CDqQ==
X-Gm-Message-State: AOJu0YyUCh+kzHD1O76GCdAUBzQAKbRQHI1S0JNP7fM2OITf/iW3IvGZ
	714Sa3md1IABfwBvPfNLNpyOn2JHy4hy7YiGsakfh6gzd6GK7CNAVhsHLu0uuvqBjye1kiELd1N
	+jm0=
X-Google-Smtp-Source: AGHT+IE44+7GX7sh/xGn5Azq1d+Bjhmd9/HHersHY4KzZwGcPBPowkX8B39dDOE78ShxSSXfkGbiyA==
X-Received: by 2002:a17:902:c403:b0:1fb:d7d:73f1 with SMTP id d9443c01a7336-1fb33f34288mr43166355ad.65.1720239546639;
        Fri, 05 Jul 2024 21:19:06 -0700 (PDT)
Received: from fedora.vc.shawcable.net (S0106c09435b54ab9.vc.shawcable.net. [24.85.107.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb3dbd7dcdsm33404705ad.157.2024.07.05.21.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 21:19:06 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] fs/ntfs3: Use swap() to improve code
Date: Sat,  6 Jul 2024 06:18:09 +0200
Message-ID: <20240706041808.181638-2-thorsten.blum@toblux.com>
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

