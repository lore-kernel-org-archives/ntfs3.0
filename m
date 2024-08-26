Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8614A098
	for <ntfs3@lists.linux.dev>; Mon, 26 Aug 2024 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668845; cv=none; b=CJfHwjEa+TSsj2Bc+/Gm8vr869ehRFkLW65be+h8/k73JrV1r8W1gZUatFxBYIO29I6qF5qSFy2aPH+C/Jjc5GMhuP/VZuaJIvMM8+MvDRrL2A0v4fkXo6gN7p25yuQOjaIVldsVWs1nZhBhDN84Dzu6m9GY1YDr6qVP/huq4F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668845; c=relaxed/simple;
	bh=6g/oV404bW5QFuPJUxPuEebiANjYNEz6eUT4NbDeGy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4zC08j0Owkobc7/ud/UBbmp9gIoMfbkUjLrkMVMwfcFiGQ+81avX4zRmGIe3zQB2ECVNjDYLRHMhva1PrV0lsXWKMohPxEdA768PEUDKCbPF2I3tHdJLU2a1Sk0TDeJ2sTz35f/Ltwo3Dl4gK4QB01z1VOfjk2gnk7p6zaqIKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=qhvFAPq/; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="qhvFAPq/"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bec23c0ba8so653579a12.2
        for <ntfs3@lists.linux.dev>; Mon, 26 Aug 2024 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1724668842; x=1725273642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JjbeKVSi31WzRxhWlL+Ld03XcZ51OwPUH+uTO2cw8Zk=;
        b=qhvFAPq/U3lnN9KAECfI0pElalWLUCCJL5iLVUp4kTEM6nQ86/qrylEm5hYvHO1zGL
         6CIf5iC40kxwcZuxwqTecwm5Au3bwyy+TT91IdhxmG9SFCpjCMP4+hkMpvCdvHCX+l0n
         LcPkcnPBa+kxd6RyU8Y/JFBNBWFePivHGDyh5YuU8y7jnoyBbu6UTHE+bEl7jscd2uJr
         R7+gOEqRLJRJmih0F0iNFxOECgD+D/YEHqXFLpuHB2fK4/jL2ogUoDMFDwXhacH0Zkbt
         xgyv716DKnqzxygDb6IexZdqVMNemRwt+MyBuovhLJjTWPJxIdSr10dAgkEKOQa6s2QY
         Mbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668842; x=1725273642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjbeKVSi31WzRxhWlL+Ld03XcZ51OwPUH+uTO2cw8Zk=;
        b=DIZ3LUrfjmbGPKeC64i+aIr8yJC5P13QXadBiHg/BqVZh8dUld0kJ+hkvBzw91z/KB
         hm4ftocDXSXjH5Jk+QDTbYeL8NHEf7/RQWO89WS6Rjs+lE8Nfgush47UaIEBGv++KWaH
         gTZtttDyLy2LuOOZNIvZUwpowZ4lpTp5mnl2uMOZLWXIBcfws4ihXaf64eL8tjQx/6iH
         Bk0IVJHGbn3/9mRKZMWGCfJOGlnTwtq746cZwcfUpQc9LQVf53iWt214WsG2W+YjtSvw
         vUz5/AlVoS03j3E+Q/kxmBhI/CwXqL4EXviTr9wcOi5WHyjhV/ofeUb3EEdeX/vua3He
         fv4w==
X-Gm-Message-State: AOJu0YxfidKZavNtQWPGwaTg98VppnkluXDfxiPZtcHX02e4cf/HLNoN
	0rBPNtx0kKf+OJI1+We8EpHuOVWJ4u4FECsdL3Ad6z0nBCmF57lP5cz1aQ5zE9Q=
X-Google-Smtp-Source: AGHT+IF3/CR9+PS5ME8Zc2H/zaAuxXs2zJ+J6nyz7JzpsWcXVfSGLWtplzdX2HeAajXOJbeQRQeKfg==
X-Received: by 2002:a05:6402:2695:b0:58b:e3b:c5de with SMTP id 4fb4d7f45d1cf-5c0891b5c97mr3571705a12.4.1724668841917;
        Mon, 26 Aug 2024 03:40:41 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-228.dynamic.mnet-online.de. [82.135.80.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3eaa90sm5407427a12.45.2024.08.26.03.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:40:41 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: almaz.alexandrovich@paragon-software.com,
	dan.carpenter@linaro.org
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH v2] fs/ntfs3: Use swap() to improve code
Date: Mon, 26 Aug 2024 12:39:40 +0200
Message-ID: <20240826103939.63548-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.46.0
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
Changes in v2:
- Address kernel test robot feedback and assign match_offset as before
- Link to v1: https://lore.kernel.org/linux-kernel/20240731135403.80805-2-thorsten.blum@toblux.com/
---
 fs/ntfs3/lib/lzx_decompress.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ntfs3/lib/lzx_decompress.c b/fs/ntfs3/lib/lzx_decompress.c
index 6b16f07073c1..4d5701024f83 100644
--- a/fs/ntfs3/lib/lzx_decompress.c
+++ b/fs/ntfs3/lib/lzx_decompress.c
@@ -512,8 +512,7 @@ static int lzx_decompress_block(const struct lzx_decompressor *d,
 			 * the same code.  (For R0, the swap is a no-op.)
 			 */
 			match_offset = recent_offsets[offset_slot];
-			recent_offsets[offset_slot] = recent_offsets[0];
-			recent_offsets[0] = match_offset;
+			swap(recent_offsets[offset_slot], recent_offsets[0]);
 		} else {
 			/* Explicit offset  */
 
-- 
2.46.0

