Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED24D4B04B6
	for <ntfs3@lists.linux.dev>; Sun, 16 Aug 2026 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786901838; cv=none; b=jCeICjoWcKmuBzMwZDPfTmHwUdwnDT6XUj2sxncv7V2tOg6qDEJR3xS863tUZ5EZp1YUYzL2Lb8rdgiTLyOxzqh2v+L7oeaTKErjOrlbOqDyCNcuF2MQyg/YeiuqV0FWVXDuLnNeuiaYXiCFDYhb7x7NMMDU5ugijltSJiDc1GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786901838; c=relaxed/simple;
	bh=MbHSlyDWkiwWoNtZsFY4lusG9W3piH9eUQmLhq3SiuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Itlejx8dYbzAD6U+30TROUspqioo1NDCpLIRrK9fyy9u7A6hIIYzl2E+B649XygOcY1YRVUbVeyyJaI024hNFK9i5LhduRqVqY8FFjoSwIHXHiFpDMDyQXerc5Txqo5fM88O2MYWjYN9G17sl9ig0/upRZaNGYCos22vEuly/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWbYcj8O; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWbYcj8O"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836c8bde2dcso33820177b3.0
        for <ntfs3@lists.linux.dev>; Sun, 16 Aug 2026 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786901836; x=1787506636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oj6R0l0UjLr20BQL47faiZR3FmjRiGpl/wUyh6ZLEfA=;
        b=FWbYcj8OWNrC0+B6wa9PAfVDxtoQhk/llljXYJEY5C73f7tw6XuOOtIDDtlaEENYQc
         8Bbpwz8ZNKy4NXsqFXhR7Z8uerOHzm2U3MgHCZRwmKHtWrwXRbKeG1DRxF/iwrcbki3y
         CEPzVF2L8s+KEtcGAmolwQt7BFKKyWXs7FEH+TxvFaAOn/PqBlLbwLxeGDp2TnRuLcPL
         CaVdGv27LNDZGZpCgZXWdA+B6H8DJsJuX6UEmRkRVigmgYYKs9QJWcSAfUFBlPWGWiza
         ZDQJSizEG1m0oH6JncDH1Rw911h3kpo5WL5mxqtkp67WeEiWH3gIsPLkrkrYLHu+3LJV
         IZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786901836; x=1787506636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oj6R0l0UjLr20BQL47faiZR3FmjRiGpl/wUyh6ZLEfA=;
        b=UcaE7dDReNIbeMKtO7XvGNJMUmeqINX4MLK8BSxMPgWqW6NwEcMghpwlVm2twU0j+8
         wVFnTyPq/8TFaQ5RqjfTNaftvP9291flmFwNSEONjtsk2vzVvHug26RzPNpp9JWvO5lv
         Liyb7fNnRmDC5FkI8blC+OjHBn/JQgXRbyO36pQIaSALMHmwE0TvHhV+p0pSdy8X37AS
         LX2WHqja/IBT+8Hj7Ef2Qg57y8yNYdqb9FJT41LDlkhPJu36qVVPkiCd2w72JtTy+e9m
         Ydk9S3Uwq89P8wH6uHHtQhlmzoK5EmfD2TH9GRRsK8hjY8i5Y0nkEGceZQOWWq91ATSH
         3zvA==
X-Gm-Message-State: AOJu0Yyz+8i1gEQt7qKReldeVC+0MLZKPeB4Vzyp4nwgk0mIx2Ub4a/j
	7RETR5gN8aqyVQ5rNJblOgcgzUiFLWq6p0o7fFpoING7TmTKtyb3S1DA
X-Gm-Gg: AR+sD13EqBJrP58pirlp55v+XeMZ//eeFAP7RkL3thUKkkvOV0fSqJJNm5WGrgEMIvF
	Ri+ejbmjRa73qFXNecR3KEyvcnKjt3JOjKBvCQ8nYBwPwg8fiktbd/zDzOCAQDOxwbJbwgktfVR
	hhM7ciJSS/DkJqYqjKvq5pc0gTuxIOfKDjzJ+kbD+rRJV208C9KH9wZXBFG4YQp7GrG6/bRgWZw
	Z6cfbpNm6/sV/FPLpV5/6A4mozzJNE/zuaoR+is0RDvGdKg6nO67cElWU9EL4UqWZlf/fc7wrbR
	BIbC049l3vQwGeT128qXFMe8ddzfwaloihzgkGqL51iTItNcxYXBDCgFX949a/zpXz4wHsbCtCw
	/5ywltOyWgP5uXWH8txkUQDffTlrWlRZ6lsGxZaUuoC60gF4wxhrEdmi6+eXclTgkhT8ZBSTeAs
	PqsD8QSgyoZo3SHh37ieJWq3uCHaDhy9T6RuWC6JyRZXXJEapi0Yi3ep9HZZxGv7U9hd8=
X-Received: by 2002:a05:690c:e64c:10b0:80d:964f:88fd with SMTP id 00721157ae682-8370c265cb1mr53004147b3.5.1786901835851;
        Sun, 16 Aug 2026 10:37:15 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836bc2a1ef4sm37839627b3.14.2026.08.16.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 10:37:15 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	blbllhy@gmail.com,
	"Xiang Mei (Microsoft)" <xmei5@asu.edu>
Subject: [PATCH] fs/ntfs3: prevent attribute-list pointer underflow
Date: Sun, 16 Aug 2026 13:37:13 -0400
Message-ID: <20260816173713.28998-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attr_set_size_ex() and attr_collapse_range() use the on-disk size of a
removed ATTR_LIST_ENTRY to step a pointer backward. A crafted entry whose
size exceeds its offset from the attribute-list buffer start underflows the
pointer, and the next entry dereference reads outside the allocation.

BUG: KASAN: slab-out-of-bounds in attr_set_size_ex
  attr_set_size_ex fs/ntfs3/attrib.c:847
  ntfs_file_release fs/ntfs3/file.c:1427
  __fput fs/file_table.c:512
  __x64_sys_close fs/open.c:1496

Before each backward step, reject an entry whose on-disk size exceeds its
offset from the attribute-list buffer start. This prevents pointer
underflow in both the shrink and collapse-range paths while preserving
their existing fail-stop error handling.

Commit be71b5cba2e6 ("fs/ntfs3: Add attrib operations") introduced the
vulnerable implementation. Commit 12dad495eaab ("fs/ntfs3: Add Kconfig,
Makefile and doc") added the local build files. Commit 6e5be40d32fb
("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile") wired them into
the top-level build, making NTFS3 triggerable in standard kernels.

Fixes: 6e5be40d32fb ("fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile")
Reported-by: AutonomousCodeSecurity@microsoft.com
Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
Reported-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
---
 fs/ntfs3/attrib.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index c621a4c582f9..562bfcf3561f 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -779,12 +779,15 @@ int attr_set_size_ex(struct ntfs_inode *ni, enum ATTR_TYPE type,
 			u16 le_sz = le16_to_cpu(le->size);
 
 			/*
-			 * NOTE: List entries for one attribute are always
-			 * the same size. We deal with last entry (vcn==0)
-			 * and it is not first in entries array
-			 * (list entry for std attribute always first).
-			 * So it is safe to step back.
+			 * List entries for one attribute are expected to have
+			 * the same size. Validate the on-disk size before using
+			 * it to step back.
 			 */
+			if (le_sz > PtrOffset(ni->attr_list.le, le)) {
+				err = -EINVAL;
+				goto bad_inode;
+			}
+
 			mi_remove_attr(NULL, mi, attr);
 
 			if (!al_remove_le(ni, le)) {
@@ -2216,6 +2219,12 @@ int attr_collapse_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
 				}
 				continue;
 			}
+
+			if (le_sz > PtrOffset(ni->attr_list.le, le)) {
+				err = -EINVAL;
+				goto out;
+			}
+
 			le = (struct ATTR_LIST_ENTRY *)((u8 *)le - le_sz);
 		}
 
-- 
2.52.0

