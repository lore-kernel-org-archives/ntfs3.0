Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCD62248AF
	for <ntfs3@lists.linux.dev>; Sun, 18 Jan 2026 18:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768762662; cv=none; b=rPP4/p1/kABm9iIuT4yUzmeodWduQdV+HhCnW9uGprsTw1ktxckNJKCrPr+kBtFHMtbupLh+dHv9yyNMYOiHouB+zMukHyxpaLJp8YCxu5W2IZ47xThevaf5csg9G98AGC+5LMkHgVxJs29ct5S3fBgRPNkqN8Aw9/LzsM4kH1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768762662; c=relaxed/simple;
	bh=uEH6tkrhwnjKM1uvdiIJIJXExMuu7hcx+AmXyWxFOOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lmzAxrU9a1hVc5EF5dOzUHiiIrb+3nmoScMdSHZpwhd0+uFvBSI/DyfNgJU8i6yVQKfMwT618+u3Hhpcz/m01ZzoLX99aNZ36xQXxRKckr+XrQcMmwQ0wmF1Ybd4QCTqEMKi1EpHwuHAz2xvlT6VauUuU4i9/iUIqNps4g1orRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnB9E+iS; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnB9E+iS"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7cfd2423793so2579119a34.2
        for <ntfs3@lists.linux.dev>; Sun, 18 Jan 2026 10:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768762660; x=1769367460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIn7kPGIfDc+QhgxXADc8Eo2fOwVdn5dCfxtYkZG0x8=;
        b=PnB9E+iSnL3SrMhFUQh8kYBhitri+1P2HbWigKTeJ2mO6thxMW3KxsaaguwdfqM8uf
         HWRDUEHyPyA+Wdx22eSvObBLmvgBwgaxhhJJoxRYxp6WUIZEk4uI3lF6VDa9Ey9aGf0K
         PSiLxSXJTqJeJ+8+g4sd0METZon7fotA+O10BXVAoAusPV32W0Yz4vJ3kFnO1f0133V8
         v9wit71CTxrg8rQySG+g4DIC2ihcId6p6KLYZbFU/MBonmkcND6csDA/3n9l+Io9JE47
         FJEfnVSILQIAYAcs0acbvOtVxgxZ5wP/UrneN6TVXYMMfJbi1sOo3gCxHj/cHKEPUffL
         9GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768762660; x=1769367460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sIn7kPGIfDc+QhgxXADc8Eo2fOwVdn5dCfxtYkZG0x8=;
        b=p1EjhkSPX1QqhTm3o37g8xR0tc5wlEdgVY4mPXUKEeYD7QmIwoI0cmnHKZu4ca2Xtg
         Glq2RHIG3g6RxLitvMD/I4LSqxwP+NMaAwW+sh0A7oxwTNEaFnP1CO/7JxktAWzGDHjV
         itVf+a4Tpv8A1pNWkXRbheTSvW+VitNnW8NUjYIwK3EM+qfgI2JQ3bXdQMBQXyzccgFt
         lgECwYv+q3NiF3fsWTMvC/7jiZkUNDmwJChcpW7r8Y09f6lXehRNJEXAHo5H0IynKCBW
         +4iw80naX4murRxJjpglrLJFPui0wLuh/QiMGoehnaXKERROY/QAPcDlxyFukuTJ+yB+
         tXPA==
X-Forwarded-Encrypted: i=1; AJvYcCVGG5eILzznvBZGxrODjI+BBk3LHkqDc/nCw73CXC4lWkugvfAV095ji7V4Y2/Bl1D1RB+3ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNhRvSWTOD7MoD3x/D7xkUzt5F9/qZVNH4id2jvcK9TYwrk4ii
	XsiIKRRK8IwQm8GEnRqIVgEzCzjNXqLmJi55v4BELN5FzRZ9RP+GcOaD
X-Gm-Gg: AY/fxX7cp8dGQjuwG4Fz7YNclOv/7gYN0npfVdH5Ay95IR19a6Km5BeRpYlGJSrKHED
	MzRo1ESgI1bPUY6rL5g5fsGyugylf1DNsr4n4Kvz0MQ0kGZYAaJig/sLa9MIOBevTRmBqKemoqZ
	Si4zMldBzPZHCjJVWKsv4JPM6cq/BdKPcdLfVp3MoosPYaMUzL2nXSPmi+dUru1uSP5XWw3Lgzg
	gpg4dw7XbX+z7K4quV/QAsAu5wPxRyokloVX5bne9HZXFDtyXhb4qmIx2oprrKzG1mN/vPOXTez
	9ndMx3JaQTxB2ge5c+viy5ofMiV2u7gEGsDs7lCpS9SZRBfemP0VxbX/g4x2USplBfvRGiFCLKv
	Zc8kOFI7asu+sKhxI+2OaStvYksT6m0uQgSnK3LQ8EkYAnq2TPvezGabBFPPmczs5rRRQ9RUk0v
	Oheb31Jjgz40Laf7YPZoyfK9dfNiPgd+9pqah07zJLuFg=
X-Received: by 2002:a05:6820:490c:b0:660:fd8d:954e with SMTP id 006d021491bc7-661179cc735mr3331882eaf.42.1768762659937;
        Sun, 18 Jan 2026 10:57:39 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-661187820a5sm3867685eaf.10.2026.01.18.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:57:39 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: markus.elfring@web.de
Cc: almaz.alexandrovich@paragon-software.com,
	jiashengjiangcool@gmail.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2] fs/ntfs3: Fix memory and resource leak in indx_find_sort
Date: Sun, 18 Jan 2026 18:57:36 +0000
Message-Id: <20260118185736.41529-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <17914287-640d-4500-b519-5f3d3aed2878@web.de>
References: <17914287-640d-4500-b519-5f3d3aed2878@web.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function indx_find_sort() incorrectly uses kfree(n) to cleanup the
'struct indx_node' instance in error paths.

The 'struct indx_node' is a container that manages internal allocations
(n->index) and holds a reference to a buffer head (n->nb). Using kfree()
directly on the node pointer only frees the container itself, resulting
in a memory leak of the index buffer and a resource leak of the buffer
head reference.

This patch replaces the incorrect kfree(n) calls with the specialized
helper put_indx_node(n), which correctly releases the internal resources
and the buffer head, consistent with other functions like indx_find_raw().

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Add a Fixes tag.
---
 fs/ntfs3/index.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 7157cfd70fdc..c598b4b2f454 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1248,7 +1248,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		    sizeof(struct NTFS_DE) + sizeof(u64)) {
 			if (n) {
 				fnd_pop(fnd);
-				kfree(n);
+				put_indx_node(n);
 			}
 			return -EINVAL;
 		}
@@ -1261,7 +1261,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Try next level. */
 		e = hdr_first_de(&n->index->ihdr);
 		if (!e) {
-			kfree(n);
+			put_indx_node(n);
 			return -EINVAL;
 		}
 
@@ -1281,7 +1281,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Pop one level. */
 		if (n) {
 			fnd_pop(fnd);
-			kfree(n);
+			put_indx_node(n);
 		}
 
 		level = fnd->level;
-- 
2.25.1

