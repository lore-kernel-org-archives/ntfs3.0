Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08F64A8F
	for <ntfs3@lists.linux.dev>; Tue,  7 Oct 2025 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824663; cv=none; b=J+NmFd2IfzghEsyKbL82bws5FaI9w1fD6c+YogrxCO2FNgT3Z0j2SlqrmfheseWY564ndDYH83gqBC0QS46vMfRGJ5NcduDMEPQcg/criBdMLqJ/SQoOceUVZWKoNSY2ibPflSu2OAFpv3VkEugu4LBi5Cpmyg7ULT0uLsimPi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824663; c=relaxed/simple;
	bh=Ou9RbX5uqxCtGtynVkAROokYxmIljor33wkMogIURhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0LvutqpXZiOwx9smaf1mKCsZSvSmvJwJI6ZZoM2iP8slfb5zPc5CmQJvol8IpI0NZIg9NiZ5G203ubdlliKgQpr8QADTgMVHDvMmzgpNSB68hfVM2SA5qiGd7XBOvKmM3Ng4tiEYkO9OwRH6/QRDo0k2QR84Ds/kSm2EF48KnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3S3nAy9; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3S3nAy9"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-789fb76b466so5232740b3a.0
        for <ntfs3@lists.linux.dev>; Tue, 07 Oct 2025 01:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759824662; x=1760429462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/D8wkb7OpnNtYTNHOq4pCL+v7kYN74Waroxt70FkiI=;
        b=d3S3nAy9tG+WPo6PG/KnL8IDbWXc5Rx8sknpi5HGCeVE+8zxIdl/qwcmL2ZZxJNvYi
         oKUfA3ddEjQtO9HGISL/Ag9lSA6cdZ5Noiu0yFkmNd6v9bhGe+EJGccFcnP5PdWAgB/l
         l8r/z3l9BM2kNNYo+WWHLSFWWNKfe3VIXok86KK+D6UaOkOjpquAvmWFsz0rfBpj7AJG
         I8auwNZw01nMa2uD9o3SjBxNEUh4ffDVEii/vZ19/h3FUKrPmR74SPCnsWgMqncrPXKV
         x78jCwHNNpcXZv7yLLLkLW/8tfKXB/3b5GhYO43Q+2EayQbmoVlCLJx3dFfshhW3RpdZ
         y57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759824662; x=1760429462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/D8wkb7OpnNtYTNHOq4pCL+v7kYN74Waroxt70FkiI=;
        b=oqHCFphCdyN6AI6JcjFG3lXIYaReRn37sOFftEWxP23L7dVXt0oihOapEY1xdd7jNW
         84+v2t3RSgo1k+cynAKgis90vsD24AJC1MbhSXcU5wDyPZBKtcS8skrOwE+QWhpzfPy0
         To6RL7c+lFZdOn9YiLp5ndOU8nLrH5gFde5uKQUQv9kXu0zunqQx+6XpfyJ9a8lsIAgk
         lMT8gs35+D9a/D+xQtIFsASfLLuNgmWPEQpY+qhywIP38vv2A8XQMXbgllC8F+L/ZyRI
         44TrTYMyNgYZ8uIJm0IJW4e5RkwwArYWCBfxke8f2FppSr4SZFS4MmSOcySEeWMAteFZ
         8izQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdWVj/oFbczhfRKl4st6HEEFCUeK7lHeSoqRvF1SV4lFXtCliGLnevbnTAsWRiQymyF+xGUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGlXMZ3OXq3cavoNglSk8wxX5r9zF1QZ+TKNbOctZ3etxA6Ik+
	bN9sQXpNeG+bB64h2bVftiOaobCS8g3PouGX+nyT24Jikkif8V8gDzre
X-Gm-Gg: ASbGncsx0tcuXvJJvi14hzT+hVDUVJlbPfnj5IKy5qVagK//ahimSSEJsnumopXNFhR
	xCMVkWc4KupOD8PJ/yOdZgo+2POZ9wABG5CgvgmhsfXPr4aC98aryeDe1Y10OGVSXJ8Q0C9TfOS
	OwoLPZ77krKBQIyahq1zZfcNSp4Msv+LtVI4qZWaPPJ1/bIQM9W0ZQQOEg/NGGkDLuP8YlE/diR
	V7RPm8QaPlzFoeStVpsc2rFMhFVsBIZMwyZCq9wlozA5JyF9l651U+Kza1w5CnAetTniZaCWeOr
	+J/MhgSSmL4idR739QphF3hu91iOPRoTHuFy0SoovS67Sgm7410baSVK7B9PsylyPJnhdAU0NZR
	pr7KTcit//ugwtSl6l8jYmUR3LmnNobd9cgzexXTBGxOqb0v+D3DJFg==
X-Google-Smtp-Source: AGHT+IFtJDcZJJqDbhKbqGHc5CZCzc4ifM/PYLCIhIeNnxJMzG+HMs9lRz9oO9kaELRH8n44x51jlA==
X-Received: by 2002:a05:6a20:a106:b0:2f9:dc8d:d2a1 with SMTP id adf61e73a8af0-32b61e661efmr20081578637.21.1759824661302;
        Tue, 07 Oct 2025 01:11:01 -0700 (PDT)
Received: from LilGuy ([2409:40c2:505d:3f1f:140f:568d:710e:1a82])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-78b01f9daffsm14736864b3a.17.2025.10.07.01.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:11:00 -0700 (PDT)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev (open list:NTFS3 FILESYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
Subject: [PATCH] fs/ntfs3: fix uninitialized memory in ni_create_attr_list()
Date: Tue,  7 Oct 2025 13:40:07 +0000
Message-ID: <20251007134008.144590-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reported an "uninit-value" warning in attr_set_size(), which
occurs when the NTFS attribute list buffer contains uninitialized
trailing bytes.

In ni_create_attr_list(q), kmalloc() is used to allocate a buffer of
size al_aligned(rs). However, the amount of data actually written into
this buffer can be smaller than the allocated size, leaving the
remaining bytes uninitialized. If those bytes are later accessed,
KMSAN reports a read of uninitialized memory.

Replace kmalloc() with kzalloc() to ensure the entire buffer is
zero-initialized, preventing future uninitialized memory accesses.

This issue was reproduced and verified using the syzkaller-provided
reproducer. The patch was tested by:
  - Building the kernel to ensure the change does not affect the build
    process.
  - Running the provided repro to confirm that the
    uninit-value warning no longer appears.

Based on commit: 9b0d551bcc05
Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
Tested-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 8f9fe1d7a690..4fe8da7fc034 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -767,7 +767,7 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	 * Skip estimating exact memory requirement.
 	 * Looks like one record_size is always enough.
 	 */
-	le = kmalloc(al_aligned(rs), GFP_NOFS);
+	le = kzalloc(al_aligned(rs), GFP_NOFS);
 	if (!le)
 		return -ENOMEM;
 
-- 
2.51.0

