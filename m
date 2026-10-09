Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA012D662F
	for <ntfs3@lists.linux.dev>; Fri,  9 Oct 2026 01:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791509806; cv=none; b=VVlvhLOYOpGIRuoAbjzO/sjSRjd3ofmASbsXv9Jv8WFhiuikkHl/E6BKWCLTX0xdm3eVKeezULfUh2lpkm4a7o2q8VG8v69XilFCRKV6Ll50G7EnauKbMk2oFE4KI9+olnsUOZ0qQLz5UY4C5BVxjkTNrNS836DkXO/sGv5dvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791509806; c=relaxed/simple;
	bh=NI8OFL2J7qAMszDxg74xt5ZHtNJOxFxoplsZH9cq/kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3hPfaMR/tvf9vYHSo+4kFvlZJuydSIasd4fdmUzFHQSVaEhDdFRgOGaej6ZHf2Jb6EDUQWakmU/6H0/nxPnzTYd1XJMOgVuh9HZRPm1AOceh2sjv2MzUXcM+hi+lxfkaQwZc7cItwPPSAYvz/8Qd0cxrzIO61dtKAMsFv89apw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9V6f2cn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9V6f2cn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1790342a91.0
        for <ntfs3@lists.linux.dev>; Thu, 08 Oct 2026 18:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791509804; x=1792114604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Bnewlcc3wxUQK8ZF4pr/LclN0rmZn+IbM4m62WaKNI=;
        b=P9V6f2cntHYtsbO3GQKmPRbdl9eXOpz9ZRg9eNX05FFO3usuxI5hd38RzSA5dVL79V
         1R3uwgp0UI6qzQ/j3A8yp6VNK+vUTtJIzVzfNh5zHVoFcvVLvIdDp+9tIeVWD6D8uUGQ
         m55Rl6zNC4YW7cs0rWJ+a7VguViFuXrVR516zI5t2YswBtDS+MonsOhn/vv/J7Lkf9v5
         ShXnDi/byE2ql36gmH9hiuDZqZYiToOYQUiTjqkl31ny4u3qHGz/THMdXhWydQmeRWRk
         5x72vpJi6oL7Kf5WN5+4a+AJpItHfV3eVdCVS7fjQrCu8C7fBXnPmA/2Mzl3nu1oyp4x
         AN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791509804; x=1792114604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Bnewlcc3wxUQK8ZF4pr/LclN0rmZn+IbM4m62WaKNI=;
        b=DKlj2uSH30O9WFv1crKNH/JKB4Vn1iEfWMzltizthUE/WOze0HPdOkDfjt2arI7M64
         FBWkzWnnDd0hBZh5K5y3y08JW6Q7zVrPQWuc/b32o+ROapQ2Xsrw+aEmAFpkqzFUMSt+
         aWLNe9jIhgvdYXNdh0SS1rDfVlsf/h41+aWP1VE7Fx4avcnS7qKhQmYLnR76EgHd5rog
         oQSQaD+YRcqYa1V1diMnzfWdEj+u27SneNQRHjEL7iJvATx6LntqG67FTI2O1W9PRyvS
         Hq1yje6tCGTuS3i2qbekmxfr4HtZ2O5QiZ2vqa+k5K5+HBumiEFl0KSYUbgz8ASh/iTf
         p8WA==
X-Gm-Message-State: AFq9FYJn9eiMEkU7wrkPuVlyxVsY4gc9hdzw/LMiATaxZt51qokjF8Vr
	1WIk4Xq5GIHZSSgi5QTn0TKyoziMKn4BxaPVysx1WQEbdud49aTdea/b
X-Gm-Gg: AYBFou1TXV94BwYeuywL9EQsLZH7i3q1p04oXWYi9L3YccnB3uOa/nTiL6EL4C888sm
	epNl44JYcOSQNH4OLC3ZTqACDQMBGbzVpeZ8o0woKgbb2f/GSCcVhzfxG1YLSC6lbaZ8nEi813l
	qmPE2w5+erWdrUtbXaKBHg1yViv0t5YyLZdLW3d8VzXR9qwxKVW4lhK4s5ICGKWG5cLySqhcHZI
	JqmPe33/ktdYDpSwX8pNr/ZbZVtTrKELUebewVINtT/zeE9DLwA5dhXgP/eb04Dh7hKhw8wgTTp
	d/dTMz1J/DPHU1ezEXm6Nw4LHMW5IpLQoDp/oj4PIplL3VPE3r+2xm6zVc2yFx06+9qDPzpj2iL
	+t4mCi9yfjRC0g0jYRHZ9KH05xeHXfVpj5sfb/rJZosmjMbTttiHAchQgZiWu7odY1QLQ6fbRXi
	VNYhfNnKIMyNIpKuAASTH/x/j2gQ7Ll9CWHBocHi6FIxYTA+mJCuPKX2u1JAb3hziAmwPgi3Q9w
	zRxsHjHsGc=
X-Received: by 2002:a17:90b:4b92:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3ab3a366814mr527166a91.6.1791509804000;
        Thu, 08 Oct 2026 18:36:44 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f5509fsm1052576a91.12.2026.10.08.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:36:42 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: widen wnd_bitmap::free_bits to u32
Date: Fri,  9 Oct 2026 09:36:36 +0800
Message-ID: <20261009013636.2920704-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_bits[] holds, per bitmap window, the number of free bits in that
window.  A window is one block, so the value ranges over
[0, 8 * sb->s_blocksize], but the array element type is u16.

ntfs_init_from_boot() picks the block size as

	sb_set_blocksize(sb, min_t(u32, sbi->cluster_size, PAGE_SIZE));

and ntfs3 accepts cluster sizes up to 2 MB, as true_sectors_per_clst()
and the comment above it describe.  Nothing rejects a block size above
4096.  So on a kernel with PAGE_SIZE >= 8192 (arm64 with 16K or 64K
pages, powerpc with 64K pages) mounting a volume whose cluster size is
at least 8192, the block size is at least 8192 and a window holds at
least 65536 bits, one more than u16 can represent.

A completely free window therefore stores 0, and five sites read 0 as
"this window has no free bits":

  bitmap.c:533   wnd_rescan()    treats it as all ones and skips it
  bitmap.c:950   wnd_is_used()   skips the on-disk check, returns true
  bitmap.c:1155  wnd_find()      skips the window when looking for space
  bitmap.c:1243  wnd_find()      the "window is empty" path never fires
  bitmap.c:1450  ntfs_trim_fs()  skips the window when discarding

The free space in such a window is then never allocated and never
trimmed, while total_zeroes, which is size_t, still counts it, so statfs
advertises space that cannot be used.  wnd_is_used() reporting a free
range as used also costs mark_as_free_ex() its per-cluster check and
ntfs_mark_rec_free() its already-free detection.

bits_last, declared two lines below free_bits, is u32 and holds a value
from the same domain.  Make free_bits u32 as well.  The array grows from
2 to 4 bytes per block of bitmap; for a 1 TB volume with 4K clusters
that is 32 KB instead of 16 KB.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: 4534a70b7056 ("fs/ntfs3: Add headers and misc files")
---
 fs/ntfs3/bitmap.c  | 10 +++++-----
 fs/ntfs3/ntfs_fs.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 60b362f388d96..41ea3fad99af0 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -677,7 +677,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
 		wnd->bits_last = wbits;
 
 	wnd->free_bits =
-		kvmalloc_array(wnd->nwnd, sizeof(u16), GFP_KERNEL | __GFP_ZERO);
+		kvmalloc_array(wnd->nwnd, sizeof(u32), GFP_KERNEL | __GFP_ZERO);
 
 	if (!wnd->free_bits)
 		return -ENOMEM;
@@ -1330,7 +1330,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 	u32 b0, new_last;
 	size_t bits, iw, new_wnd;
 	size_t old_bits = wnd->nbits;
-	u16 *new_free;
+	u32 *new_free;
 
 	if (new_bits <= old_bits)
 		return -EINVAL;
@@ -1342,13 +1342,13 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 		new_last = wbits;
 
 	if (new_wnd != wnd->nwnd) {
-		new_free = kmalloc_array(new_wnd, sizeof(u16), GFP_NOFS);
+		new_free = kmalloc_array(new_wnd, sizeof(u32), GFP_NOFS);
 		if (!new_free)
 			return -ENOMEM;
 
-		memcpy(new_free, wnd->free_bits, wnd->nwnd * sizeof(short));
+		memcpy(new_free, wnd->free_bits, wnd->nwnd * sizeof(u32));
 		memset(new_free + wnd->nwnd, 0,
-		       (new_wnd - wnd->nwnd) * sizeof(short));
+		       (new_wnd - wnd->nwnd) * sizeof(u32));
 		kvfree(wnd->free_bits);
 		wnd->free_bits = new_free;
 	}
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5811d89d67b39..6f05b1bbb565a 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -152,7 +152,7 @@ struct wnd_bitmap {
 	size_t nbits;
 
 	size_t total_zeroes; // Total number of free bits.
-	u16 *free_bits; // Free bits in each window.
+	u32 *free_bits; // Free bits in each window.
 	size_t nwnd;
 	u32 bits_last; // Bits in last window.
 

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.43.0

