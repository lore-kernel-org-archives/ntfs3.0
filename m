Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8353ED1D
	for <ntfs3@lists.linux.dev>; Tue, 22 Sep 2026 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077235; cv=none; b=I4Unf/vxfA6/LL6q/WhlmgmNkeoOV8StZnrmB7c7pyMrRaKsW2AsUxeP9xSMxO+lJBm5SWxUxgrUejFGxDPGiL6hqRvkPGb5dSNJ15t5QfC63+stjaVIAbF2d298ILNuWdFDlHi7lnZtB1PRbSH29RR6TnwibHROc5GQmNQxgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077235; c=relaxed/simple;
	bh=tlzCI060j6L6IgPt6ESM1jcNU3DreN2TbG88T7MTW/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WWjb1rt1DDU9oOoRzPO/qw/vGr6ihi43Y2/G5yTfk84rOmlxAY3dKJnekhZiGWx/odY3M8j/BwNEa9Us0RBaeW32UjNltnLKFW6bGsYVYGFXzWEJYe6cLxzE4jgj84ylHwgXzUmtPpBZUlXVyjcvTwzXV0thXf5Q1/vI24QWZmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=HJp791yY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="HJp791yY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so22157765e9.3
        for <ntfs3@lists.linux.dev>; Tue, 22 Sep 2026 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790077223; x=1790682023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHRXa6eMg2Bs2shmzct4QOAwZZW+bRsX/lrRsgr4gI8=;
        b=HJp791yYOyG6Y7g1WLRrCm7SPIvLxrgVEt6sTS1aIjjl9UgABQjaytxJ6fjg0m1J0t
         a0n9PDgTK2IxB1D5Y5m+jSzzGj2WZImxDKmdgU+7gHOgnyAUY6+tfTb0Cc+RIwt3Tgdu
         /olOySnXNQSTfsoYL1xgtFHjxldZQa0WblfRuXe167H5qkOlmiPBAAr5fdCdSMLaasKF
         I5dBh89MrFQKCS6adn6TJkzqaR2xf6fF6CyW/tBd4o2KdvWP9sWfTcTlpVkOpfRAVXD2
         pNm9zJ3RQRKZ5PAsbB1B+GUOp0GHubvr88clfCtE9oJXKArbIsttv7+sdXCiBeLyoKC1
         gS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077223; x=1790682023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHRXa6eMg2Bs2shmzct4QOAwZZW+bRsX/lrRsgr4gI8=;
        b=2jUxzbaB8gvZNlcC02s+f6ts7PxRYUWvyBZSKYADu0HCKhE/Q++pyCG0LO+1+0ZIZe
         aZtN93aKnjLKsZlEpmTBfcKFefSBaT2ey4D79xOjzxfGNuPPZiH4ehVMp210HhhcFqMw
         hwRgmU5fTl434JoqyzbjlE9YWKAzCleD+gVnjRg9+KBEhTfLZsk08axtimd7wMzbB79w
         vugHj9PMuRJi5+lTkDnqj0BEnht5mu6e/F6ewtxGZltPe5opKoYZbYGHwnzxSrS9UZAv
         d2U7JlzJELhQbRs7QTewWZLZJ8CijWy6ABOLZGasce5aX4iWl/zG65X19TeuiY6YS0LF
         PNDw==
X-Gm-Message-State: AFuF++lAikDh2c07KWTue20LlBZXuDhrMq5o5xtEs0EFzgKGhT7pt97T
	HVzyEF1uWf4E2rvhRik7pwJX6tJbmMJ1jcxbGLQPtrkygLS5G0KCS0ut6XlIaOALmOY=
X-Gm-Gg: AYBFou3IDO50rsNjNqA9fL0C7YVpGy4BLzzM0qeAZ3GKDuVTqo3GH7yykwUWNtDk3BV
	AOICQMUhUTi5OX6t0BXJ7+ET6/Lg+ZukVVAm3EVzLyPHSesSoHisx/gUYHoiI1NdmE78/qDb4nb
	EHj454jnZ0iV4rOIQlwdT+EwYwLlFelNMoC9317t7bRy3kPLa1XND8fxNTgOcA/7R4dnAsKWUZl
	dgs0ruh8SfKUyNhK+8CIBdb76VMJNI+9WmXR7vOX8qTPU64xXo3tgMWVljuecdKqeTTK6fgV6zr
	dmKrZXw9HNbWeouh1gZtHaFg0fRpLP7vtlGTTKbcyr2ohXB8MSY1clgicFZJic77Ys6emlgmyyg
	sbcooFORPE8NdN3ARuzsaz9fGcJAzWYspL+OCQ+VsxHRaG1xUdf5vYqe62aRQpKVInp6AF/OWZM
	BcW/intn3q3ZM2qSn8MIwOp06IIFqEE0036w1X7gSq0/zhl+12NtiHVgXzlYdVeSYwKYOIvSyc3
	1xu9SPxjA==
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr206467155e9.10.1790077223229;
        Tue, 22 Sep 2026 04:40:23 -0700 (PDT)
Received: from localhost ([2a02:168:9d56:1:84ba:d001:a11c:487b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fd8ce2646sm77863515e9.14.2026.09.22.04.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:40:22 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	stable@vger.kernel.org,
	Bruno Produit <bruno.produit@trailofbits.com>
Subject: [PATCH] fs/ntfs3: Fix out-of-bounds write in resident insert range
Date: Tue, 22 Sep 2026 13:40:18 +0200
Message-ID: <20260922114018.1829807-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

attr_insert_range() grows a resident value before shifting data at and
after the insertion offset.  The current copy instead moves @bytes bytes
from the start of the value, so both its source offset and length are
wrong.

For example, inserting 2048 bytes at offset 512 in a 513-byte resident
value copies 2048 bytes to data + 2048 even though the tail is only one
byte long.  The resulting destination can extend beyond the MFT record
allocation.

Move the original tail from the insertion offset to its new location,
then clear the inserted range.

Fixes: aa30eccb24e5 ("fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE) implementation")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---
 fs/ntfs3/attrib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206..4bd758133 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -2610,8 +2610,9 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
 			char *data = Add2Ptr(attr_b,
 					     le16_to_cpu(attr_b->res.data_off));
 
-			memmove(data + bytes, data, bytes);
-			memset(data, 0, bytes);
+			memmove(data + vbo + bytes, data + vbo,
+				data_size - vbo);
+			memset(data + vbo, 0, bytes);
 			goto done;
 		}
 
-- 
2.53.0

