Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5B5A79B
	for <ntfs3@lists.linux.dev>; Wed, 15 May 2024 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715776836; cv=none; b=u/m76b2EWNBTOMW4haO+Nkf+6/rMlWtM1CykDNfqlGdZltElDOCRnNev2QUEdWuGrz6kd/zB3fITTiyLIXRTTnL6TYgTLkE0p/DLECnS+eW0ZzwcRRV4JS57Ze03ChLMWTf7DINsjn5ObshvrpQtiVUKE23vm9wje0N6J9iUfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715776836; c=relaxed/simple;
	bh=CBeVeudKaMa64Hk0EQo8xz/HGk7N1bFC2eJIinxtmbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qq8/KBvpE5x/wE/pB8bFb3BANadicERFcwPWM9VdV0TYNnjYLwWD1vC6AvRbDGItbBLML8cRozxKThYQz8Ezv+fULvFt0mKAJe8fKFXWIav7JKtK+5m3TTt2bH35MIp5Y2jFcEwGoOUxAcNzWwbpYgXMkYlJgqylknd2pPd3ENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdjrMW98; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdjrMW98"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f0e190e5adso2433231a34.3
        for <ntfs3@lists.linux.dev>; Wed, 15 May 2024 05:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715776834; x=1716381634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRzWc3KEc5QqTvXb/3YsxeGC6cz6347lvqioXf2gZ70=;
        b=kdjrMW983BqzXSO5Su7ABKJ4z2GX0xua0qBuJJyymXZI652HeOlMSWkkwdjHBuFSg/
         5lY72hp1SKTIr0N0r5FKXqdD1lOKOUm6IOQn+4voXKHkJjTfx4etuya3paYSD7z7AT5S
         +aMN15SE16zM1Mj5g/51oSdl0+Ub88cgYnAuemcYf1RWagqMeWwpv3AxP9ZATBUs5Llk
         0LBb3Vjx9EDTbFpqjsJ6V5piZQz7BV6rXUMEKrJC2Ka+RbZr3AU76L/xP9WdyUFPTorR
         7Sx1uqGWnbJD6v/yWxqocsBpxpS7KAqsVqxWyp6zOCuwSJ32FZ+44Jq+9vO+d5rC8SgI
         GYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715776834; x=1716381634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRzWc3KEc5QqTvXb/3YsxeGC6cz6347lvqioXf2gZ70=;
        b=YIMVjaozyV7sIcimqjIKF9EmfJH3gu1xuY21zobWSR4tfK6aTszUrxre3dBZDkk2V+
         YRT4W09Z3YOT96tMHDHzvZmV+PRcUJw2cpPxI86FCL1Xp4ZE48nVEgMas6jz6ntD8mqf
         KNL9NFRSDrU7Tu2POUvVDwzaKxdPWgK1laCRx8tNsFHcw9qVsiMqWM/rlw+oR1V9cZ2Q
         Zm0XHvz7W9YbuG5QHpLCTDmj4I/f9mAXzkHsqP2X6hqSm5lQAHLKvw5i/C1GMltM7gAx
         IekSl6ZVo1fKudXQpqLIwgybYLT9E77yB3e/lr+R1C1wMy+I2cHKwR11XaFilWiR9iyW
         KEnA==
X-Forwarded-Encrypted: i=1; AJvYcCUro/xKqkesuurnL6UCyfjGIrZrYiEeFVRuzshd3EGLZOwAXI9WpkY9T6n0xEZXgy8szsd9GzcZwv7tre4wxXnXT+IW8Eo=
X-Gm-Message-State: AOJu0Yw1zSJjLeksSZA2nGKt7J+UMgUSBlmjh2QtaqM23xq7YjrjF9yt
	4UerRQbY0jr97PpQ6RTiSLpKxcZIjmjiflwWwcvU7uU49aEuP6A0
X-Google-Smtp-Source: AGHT+IHCjGtL6PmYiYtUJfANxegVmFHGwjkB08YLirqldBcqADqviq7g4qu1BpAhmj2E7DyUT5ltJw==
X-Received: by 2002:a05:6870:364e:b0:22a:b358:268 with SMTP id 586e51a60fabf-24172aa925fmr19183260fac.25.1715776834525;
        Wed, 15 May 2024 05:40:34 -0700 (PDT)
Received: from my-computer.lan (c-98-39-64-40.hsd1.tx.comcast.net. [98.39.64.40])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-2412a3d1fa7sm3014855fac.8.2024.05.15.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 05:40:34 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] ntfs3: check if more than chunk-size bytes are written
Date: Wed, 15 May 2024 07:38:33 -0500
Message-ID: <20240515123946.874688-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <00000000000077d29606186c5e99@google.com>
References: <00000000000077d29606186c5e99@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

a incorrectly formatted chunk may decompress into
more than LZNT_CHUNK_SIZE bytes and a index out of bounds
will occur in s_max_off.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 fs/ntfs3/lznt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/lznt.c b/fs/ntfs3/lznt.c
index 4aae598d6d88..fdc9b2ebf341 100644
--- a/fs/ntfs3/lznt.c
+++ b/fs/ntfs3/lznt.c
@@ -236,6 +236,9 @@ static inline ssize_t decompress_chunk(u8 *unc, u8 *unc_end, const u8 *cmpr,
 
 	/* Do decompression until pointers are inside range. */
 	while (up < unc_end && cmpr < cmpr_end) {
+		// return err if more than LZNT_CHUNK_SIZE bytes are written
+		if (up - unc > LZNT_CHUNK_SIZE)
+			return -EINVAL;
 		/* Correct index */
 		while (unc + s_max_off[index] < up)
 			index += 1;
-- 
2.45.0

