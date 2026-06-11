Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF213314C4
	for <ntfs3@lists.linux.dev>; Thu, 11 Jun 2026 21:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213618; cv=none; b=IELPprx60O863qvJWjaKG9JgDuuD6GGu9Fg1ttKMP4F0CxDouRNnZ3fFjenlUD8aK/lXFEuBT8GeR8oiI8/sA1MQPs0O+XTKFcCYvL0v385r/zAzblts/zBsdcpz1WuTfoq9BM1GwhbQc2bMNe6Hfb4C+Xte4QRUep5Z/8psySw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213618; c=relaxed/simple;
	bh=mT8kNUEDIcc/xJe/GoAWK7HRYZZ5fog7EKo6wCAye9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mmMwNQiEHGmig161nkNRCixbKJEkxT6agVWdjcVhsLEq0y/XSBNU52FQE2ZKK0m4ACGuzHLpVUsjn/1/rQFIlzKFIxW9FkYgNu1OY+2CHgWkPWLxVpVPFj8oP8suyNsFZaVyxb7LFVKnmvuNEwKdNkotBpp1weJ7gwaj3O7Z30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=TcH+hdHl; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="TcH+hdHl"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9157b94a07aso34656585a.0
        for <ntfs3@lists.linux.dev>; Thu, 11 Jun 2026 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1781213616; x=1781818416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mKga1ggz6sdNzSSWK/KwEajXdsMF2aeCFFV+bSkqv7s=;
        b=TcH+hdHlu90Xz9liEaB6MUnuquLHVhUWTVRlNqbnHesuuSMWXGfy4eqo2CGKWLp1KP
         xUYp9xHswLU0/7QhCOChpYLJMdMpu2XY2HCKn/f2YPSsAKo61/QmYrvIhbB0av9/JCLK
         kaa8hZA3+qVzjen8M7gqvSm8Cv7dOCxwQsKKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781213616; x=1781818416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKga1ggz6sdNzSSWK/KwEajXdsMF2aeCFFV+bSkqv7s=;
        b=C7HJM/3k6zCbrHll8hZGfhaJttL8/cdEgIHbCvomvHKfWG5AzOHDMExZriU3sqvaKA
         VwQUBZUiZ8omU8cFfIQ0hlXfaEejS+2RHjpx7OnyilN8s3BVcSTw2hRnF8PRCaFbhvHi
         qV+tCsoAPOYYjTML6LZSVgTF+/vfdHx2ObVAhUzNszTTQrnvWu578UGX0ZVE/iMOYF3D
         gFFkAYLHFIW/aAqgdtD9gwSJx1MUbhHAmE5z5g/cp8tZ2w8jPQ2ELplw8DIOdfpEZeyj
         1WSkC67TVI1DTEnuLZYTVnOslJEMNSvnO7zG2gbmyvQcSJZ21DyexKdrO3VxTCSEsaYm
         B/6Q==
X-Gm-Message-State: AOJu0YyC8cONgG60JG2umva07Jb857sC4NnXrz1lW0rxkYcbVUDlmmFJ
	DEty+YNXiLd+xPFbUsx9kf6g9BquXNq2oW4g/oW4WVIKzp7/SNAI3qsr9lqNJpBMOfZzaYClQ1o
	Ghkfzy6c=
X-Gm-Gg: Acq92OGkwxUUOg2NocMcDRUBykzA6BaxSGz0xWhLqBoQge8dxbVjyM+Ux3sBJ5l1CyO
	IIvvjnQQzcTVYDlWsBjUK2+XV4NmolzNCEsCZh3Zaxqh/LLg9VBHH/WJ5+8AFqqDg3ysTvadE2o
	urhZU2L9Pp6MB63A8rnBgKKtVUINnqXAt8y4p4w34tgciePOnc4GivbWC/bMUOwAkfq55cmB4mv
	A+jAh1Vdx0QEK2pWZ0HU+V2roT+Cb6GORksnALOVuwF8/xs4jWj7mA82K28h7X2pAN/1vXAtj7Y
	DAWuU2h61kcws3fVMJ03R/fFKYG+Z98/bkR7Ja+Hh0R5E8++oGdX4I3upIMirA6qssigtQfdShI
	bcD9cLDeyomrBN/sVtkl5b/5rzrGwjaDd3l6ms6f68xmRxeYKV+40Yw2pKXd2Yp/8SA34dCaa4R
	2Ofwh6Ur0JBNJ6p6xws3F/KxOaaiF+VuTdNObEiDB2hGuh2G1vhVyTiJgj2MTjMgJKkTZgoGiaL
	PN7rAErQd4LadTm5EYjHJd2e4LgjSEdj2k=
X-Received: by 2002:a05:620a:c4b:b0:915:e12d:19ce with SMTP id af79cd13be357-9160b030a68mr742279285a.47.1781213615629;
        Thu, 11 Jun 2026 14:33:35 -0700 (PDT)
Received: from com-75606.node.ndb.openai.org ([209.249.37.146])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e50sm26861285a.29.2026.06.11.14.33.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Jun 2026 14:33:35 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] fs/ntfs3: reserve NUL byte when converting UTF-16 names
Date: Thu, 11 Jun 2026 14:33:31 -0700
Message-ID: <20260611213331.16763-1-kylebot@openai.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_utf16_to_nls() appends a trailing NUL to the converted output,
but it passes the caller-supplied size directly to the conversion loop.
For the UTF-8 path, utf16s_to_utf8s() can legitimately fill all
buf_len bytes and return buf_len, after which ntfs_utf16_to_nls()
writes the terminator one byte past the end of the destination buffer.

The same contract problem exists for the NLS path when a converted
character consumes the last available byte.

Reserve one byte for the terminator before doing either conversion.
The function continues to return the number of converted bytes,
excluding the NUL terminator.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 fs/ntfs3/dir.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index d99ab086ef6f..e8892cd94e04 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -25,6 +25,11 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
 
 	static_assert(sizeof(wchar_t) == sizeof(__le16));
 
+	if (buf_len <= 0)
+		return -EINVAL;
+
+	buf_len -= 1;
+
 	if (!nls) {
 		/* UTF-16 -> UTF-8 */
 		ret = utf16s_to_utf8s((wchar_t *)name, len, UTF16_LITTLE_ENDIAN,
-- 
2.43.0

