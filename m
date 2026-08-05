Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CE13E3152
	for <ntfs3@lists.linux.dev>; Wed,  5 Aug 2026 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915355; cv=none; b=LlWuf/F00mglGX9eM625/XRWNBiW1uh6alNLr11vcrvqqUkGDlO4FZdBj6tISPx2r8e8LBRqtdrCI9qityQxfKmSjQyD0yGeBry/vYW0K1UekKfRyLH4WXVe6adjGKhYOcn0T4ojx0wKK5IA55tKSJus7OjDNe3qqZ7ToY5cLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915355; c=relaxed/simple;
	bh=z7jxl+e8jm06YnFJ7ulXVe01RvsrUZ9KccYhJgKrkFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dMKJemipNlrsHaocbvmfqJfc6RsOZR4IbJwUqlR2l+b+HOEuYthnXCsRD76Z+I0TjeSIiUB3cxbSCnYN49euQ+eefrNLDbQdOCHC+jtU5P5AN8HtTHHbO10kFXqdyGwaJgmoxdpGC9hb8BEqwc/GdvwQYyQDGuBcbZmh/XoLhY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=l/eU8euy; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="l/eU8euy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qj
	5zTRFYCHrbHIr5mSW+KX7DKQUhqYyAxwN+L12YP6M=; b=l/eU8euyk1d+ifnEuc
	3L4QdUwkTabWrFwhJcHKMOqvy/wiXpAJqSPZwqfi9/cY1rrZSurO3VXMMm8JzQ+D
	hJ+4iu2d3PWOBbtCvzCoT+AB0oDWnzrezksL8Eqr/qH05vGQyGBgPbFXR4yQ8OnU
	PoWylrgTCyHIUt2Mom0IW+2Kk=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3fyzL53JqTdA7Kw--.16788S2;
	Wed, 05 Aug 2026 15:35:41 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH] fs/ntfs3: check wnd_set_used() in ntfs_look_free_mft()
Date: Wed,  5 Aug 2026 15:35:37 +0800
Message-ID: <20260805073537.2044570-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3fyzL53JqTdA7Kw--.16788S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1xJw1rtFy5Cry8Jw4xZwb_yoWkuFX_Ja
	4xC3WfA345AFnI9aykWrWa9rW7X3y8twn8Wayxta4SkrWDu3Z8AFZ5Aw45tFW8W3yUJa4r
	A3srGrWrJr1ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbg_-tUUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQ5kL2py586-3QAA3X

From: Baolin Liu <liubaolin@kylinos.cn>

wnd_set_used() can fail, but ntfs_look_free_mft() ignored
the error and could return success after leaving the MFT
bitmap unmarked.

Check the return value and unwind the new subrecord on failure.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs3/fsntfs.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index d0434756029b..ab9e03156cce 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -741,10 +741,19 @@ int ntfs_look_free_mft(struct ntfs_sb_info *sbi, CLST *rno, bool mft,
 	}
 
 	/* We have found a record that are not reserved for next MFT. */
-	if (*rno >= MFT_REC_FREE)
-		wnd_set_used(wnd, *rno, 1);
-	else if (*rno >= MFT_REC_RESERVED && sbi->mft.reserved_bitmap_inited)
+	if (*rno >= MFT_REC_FREE) {
+		err = wnd_set_used(wnd, *rno, 1);
+		if (err) {
+			if (ni) {
+				ni_remove_mi(ni, *mi);
+				mi_put(*mi);
+				*mi = NULL;
+			}
+			goto out;
+		}
+	} else if (*rno >= MFT_REC_RESERVED && sbi->mft.reserved_bitmap_inited) {
 		__set_bit(*rno - MFT_REC_RESERVED, &sbi->mft.reserved_bitmap);
+	}
 
 out:
 	if (!mft)
-- 
2.51.0

