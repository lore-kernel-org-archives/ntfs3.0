Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3CF254866
	for <ntfs3@lists.linux.dev>; Fri, 28 Feb 2025 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733064; cv=none; b=EhJGlbmqF0rTU5xo2RBuR4kMZDFk/RUcGUF8V8sGz9GGgzDWTpT/c23DlTHfah/1YjHq/4fxo9meEAQliekmvpfOhO6EAN5slND7PJDcHJEki+JS3lUVovJ6C2iS9p9+FZAvztrZNm6sqJoBNPrmAkIg0R5hel2ITClOl8hviEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733064; c=relaxed/simple;
	bh=8ApnVxOAIku1y1NGlqRF2zzBzpu0NT4/22VcCwtbvmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z7JHU46lW+bIQK3BaZDEOk32yyKQqsqGHVLnvyflGJo18sw2BcL1upv4DMwezNlFWsbomyWcP012CSqkLvSlkWFaHqWS4/2ih2NfzI2vUoMakklvEj6n5hDJ3bjv3ewqu99OZhG7qU9koiZ6bcNThQA4QVvRPR15gbLNEfJc97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyNBR7wA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyNBR7wA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4399deda4bfso12246025e9.0
        for <ntfs3@lists.linux.dev>; Fri, 28 Feb 2025 00:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740733061; x=1741337861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOOGOHp/kT32Ubbsvrda4rp5OvOxGdyciA4qun4jkHI=;
        b=YyNBR7wA3pevp4ylieUtCM/RtDGX//4T1I6lLFUI765cBulQsy/8pPmaP3IY1mTk+Q
         mTEmuSULHBpZU9g/NTghvhV2o+WXCmf8rejuSLjAeSmxLBYbLFg4AgbCigZVMMCWGbeN
         mtDwSWktOgswH9kOGtsZ1wzFXR9picnh1Ksqx3ES4Y7F1K0ylA8DQZRy4DVPlmlhS/ew
         n4expih2Pzt5yJNr0KAT6Wc3LfhO7xf8SXZwlazCZ59GYtHp7uFm557G08J4AdlRl9GU
         ns4fkianSeyfqkrKbqOwoYWvZHuPtBeb0BcV0HwWEByiPpv6+Lq7MrKh4EEmo2WodduZ
         natA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740733061; x=1741337861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOOGOHp/kT32Ubbsvrda4rp5OvOxGdyciA4qun4jkHI=;
        b=FuO1vGlRUmZnTy+OMKM1ZiNWcPA/1F+n30Y+pJqKdFIUwkDJknRbO+0QYjsLnDouNZ
         T0vjSGlnTmVIRFEhtpK5H+IgwIJ0Cv84Dpakt488vwAOjDgW7mxOPiAwp0L8lzRQrhTX
         J0oM3hXJa2Pm4hl9wCd4n4gf425ldGposSveqw1Do2lKnPdCj7z3hYhPwAIc7cB6YUyM
         oUu8z3SWGd25XVoR3+8NbZqvFiEJJsNqMoa8ufh2myLgepU62bwdLlYFzVZ3OfaQ3qhM
         DIQXmuacKp0jeAGVuzjXXG8kv6CIHCkdv0s4nGPgeJNihQH0np3AQdoQHU+OzH9ZqG6K
         92pw==
X-Forwarded-Encrypted: i=1; AJvYcCW0QzKFX6SFGyd1TZFLmXSh74hPpC4agjqPY7hDivQgePcG3zKWWIQh5eQ95GnwzE3UMhto4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKdNCy7HAUUTd28I4e656UbaMnqha4oKk9+WJsuCj/DGdlhvhi
	UCRV8xI3XqYkdPmWwFx9SMccwf7Fflg0UqYMHlu6RYhMFXLZs/l0
X-Gm-Gg: ASbGnct8wP37BiOnSRgrrRWbT9/bO/cykhpyNW0vLKnNDPhFyBzePgvpXs2dZyFIp8T
	SDvsN1wLiIhNgqB4Drb6mAv8Q6kUkpkM3IiuZ/77X8dhG270wyMcAIs8jQ+XM1bE3CzLDSqW6jM
	nI6VCO5WZkOfX/tsIDIHoQ+oGjcI3F8EWVRKt52kCWQH4fa3iD4LwQHna00uBr1iiZZ+/Xqxe6k
	a6xR7hYXj4TC5CObfLvSS2z6tg2htrE2uREcrGj9v3ykIr5EAOnbuFMkUyzIhdOKcGNj9PGjRLY
	E+bROiqqpXPst15ohXLnBMD3LyU=
X-Google-Smtp-Source: AGHT+IHh1cn5sBB+ae6U8u5TgIgCJ1b8UOf6j64PpB4BLf31Gp1M6o46xk83F0wVo1aSC8clSYk29A==
X-Received: by 2002:a5d:5f84:0:b0:390:eb06:d6bd with SMTP id ffacd0b85a97d-390eca41380mr2114817f8f.34.1740733060559;
        Fri, 28 Feb 2025 00:57:40 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e479608fsm4611706f8f.14.2025.02.28.00.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:57:39 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] fs/ntfs3: Fix spelling mistake "recommened" -> "recommended"
Date: Fri, 28 Feb 2025 08:57:03 +0000
Message-ID: <20250228085703.678824-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in an ntfs_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 920a1ab47b63..d0d3214d3688 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1293,7 +1293,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->volume.ni = ni;
 	if (info->flags & VOLUME_FLAG_DIRTY) {
 		sbi->volume.real_dirty = true;
-		ntfs_info(sb, "It is recommened to use chkdsk.");
+		ntfs_info(sb, "It is recommended to use chkdsk.");
 	}
 
 	/* Load $MFTMirr to estimate recs_mirr. */
-- 
2.47.2

