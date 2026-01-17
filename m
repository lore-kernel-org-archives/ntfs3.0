Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF617555
	for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768675749; cv=none; b=Kb80Fafp06VPw47+0dJCMB9cJxSEgVufbBq7b0hKRxuzfi/yD2Dv95NXYpfzZ4AfWfrfURCDvfIuGYHsQJvkSWnUzp7KLhTUEYaNIkJu2AbChiPPHko3PjPzyKi/3TO9GKJ5FATQlL9+n+MK+iSuF4fr5Jy0eZlSV21TbrK25xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768675749; c=relaxed/simple;
	bh=gkmYEbGAgHevoVkA4IYHSzkeHVNrwaV7mJJGhZL6XUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RFEqH8NZ7+NQ2YSkIoiyg1zKvKlvB//5gVwo3mCVGgPzYZ43PgdOX76jfp6paRf1KbOECUZuGVgnO4m6giJ9xsh0MhPdqNwzK/AZx9p2otRflFnQBqhpL2tv4owiLXNzOmz97tMH1EtMpf4y0k64iq5TvEmK535DldodzaV8JgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHbFJXto; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHbFJXto"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7cfdf7e7d19so1475329a34.2
        for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 10:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768675747; x=1769280547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHRHsas+GYQE45QujBos5PnyFEN/pq1yF5D0rtwwmZo=;
        b=SHbFJXtopkHDAyL29OjMHfEy1KAG8UE9NIu1VCbtRmKY+h44ef5SlxyfSd6uT6varC
         3Q87BYkNv1apBkSgMgu3mdwNS2+fSxrIY19A8yMHcJ/I5LD+Ed2bG93mptumw1T18esW
         PtGfybCWnTz6g4Ge3DySzJZ086QFaunZmenL6Uz9y9lvb2N++BK/ruYkkrBj9G4N2HMc
         fd18OwNQT3L9x5EXXR3gpTbw0Iif0pDfowoORQpAuPkWuKypXbH17zfOY1xNR4cl4vzW
         OM3y8GijR3GwVoXEK6YvRz8vBxgZ/4Y+Rl8wEq7AheTJcjcpyJgNV0xn6Uvnk6Jb+dB6
         4Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768675747; x=1769280547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHRHsas+GYQE45QujBos5PnyFEN/pq1yF5D0rtwwmZo=;
        b=JLIuGDDWAa0QngaTMbfRMqRx3HbOZ/a5ja5r58t2ZmpgY1MU43w0GOOeRpCvDzGH9c
         2AdQvN6H0qPi3KGY8x/vLO0bxS2qUbi3BIAIYXlonXjg6y2SkTyS9qC+Bsj4c/aBgj/x
         HbdGB2cjx3VOCledYR9t9tIcPfFQWMyV00K1D7kn4n6fqMk4eOvLpNmTr4RzbKLLeCZe
         c/k4YKQ6NFUXWYIVWqTYgxKLyxJ6dBK2VOK/dSdBus/O897HeklOJxsOWJobWf35gbXW
         t4JDzZ5YtSQuaD2fwuxT/Rr3mCqEOKH2qahe5x6l3VPcc8AUAFcZrSxcpKRkLog5G4FU
         D0rg==
X-Gm-Message-State: AOJu0YzZrG2ANaYpUBt2xjQYhVhqNFpn6zWicrh7vjdILQEsHFQS1z3L
	Es6PPTI4CjagBWZvuqUbTGu5KXwXAi0T/3091L/XsPdiHCi460BXItnK
X-Gm-Gg: AY/fxX4TEXFLKxPzbKwJzriebVavzpsgsUNw0RMY674hbZ8Wm+pVhjAgvMH694S/zTs
	T8YcqOFHRfIi9q9E9ZzGz8lQFf9gWUNpwuJQ31Tr31JE8IkfzxNpVn4iVd+p56fbS1dd6w7YBVq
	SK/GyTjV2H3F/ORfCz7d0GAXj5ueN+Ehvp/YKyCRWkiok0gQfhIwFAfEF1YcnNfgWr1LrcL7hrE
	5ZiEmGnhrSWooKHGSe5bacc4CIypquU1hDal9TGl998yX08QZuHZILxzQOfCiIvriBD7cSe62aR
	D0WO3s2BKEWMcv7vYkSBAvoyuTtemAzXSxwt3h1U8uiSzuSMSNfb4QrKEGXXXeCCCQFn8eG/BKw
	Ibp8ammtFwmG9gIBHYusPUNUZLJF8d+GIJwPldXG37SIfNpBeOIDwR4HLTKVE9/qIJOTldFoU8M
	sCE/Gw41wlkOojFrfLZYcOR1+h2VJVzaCaU+6/p8clGoc=
X-Received: by 2002:a05:6830:7305:b0:7cf:d0f4:125c with SMTP id 46e09a7af769-7cfdfe21ebemr3823903a34.8.1768675742195;
        Sat, 17 Jan 2026 10:49:02 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf2b57e2sm3833216a34.27.2026.01.17.10.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 10:49:01 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-kernel@vger.kernel.org
Cc: ntfs3@lists.linux.dev,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] fs/ntfs3: Fix infinite loop in hdr_find_split due to zero-sized entry
Date: Sat, 17 Jan 2026 18:48:59 +0000
Message-Id: <20260117184859.37979-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hdr_find_split iterates over index entries to calculate a
split point. The loop increments the offset 'o' by 'esize', which is
derived directly from the on-disk 'e->size' field.

If a corrupted or malicious filesystem image contains an index entry
with a size of 0, the variable 'o' will fail to advance. This results
in an infinite loop if the condition 'o < used_2' remains true, causing
a kernel hang (Denial of Service).

This patch adds a sanity check to ensure 'esize' is at least the size
of the NTFS_DE structure, consistent with validation logic in sibling
functions like hdr_find_e.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 fs/ntfs3/index.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 7157cfd70fdc..da6927e6d360 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -577,6 +577,9 @@ static const struct NTFS_DE *hdr_find_split(const struct INDEX_HDR *hdr)
 			return p;
 
 		esize = le16_to_cpu(e->size);
+
+		if (esize < sizeof(struct NTFS_DE))
+			return NULL;
 	}
 
 	return e;
-- 
2.25.1

