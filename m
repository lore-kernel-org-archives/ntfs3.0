Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5D358363
	for <ntfs3@lists.linux.dev>; Wed,  5 Aug 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915389; cv=none; b=eu+I8tqMeQHRs8FtZEGNVrRKDM96muMZ741tUqXFIai4txS7Qd1LF/VH2zaTpc6LH6Bx8iS+YvlYPDnxT3vb/1MUJ4V0x+NvorUdwUARp13LzeAforCEo8FSDsvL53fcMNJ4fhHpHUCmAlo3GNAIVLF0ATgEqdrBGeaOFXffsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915389; c=relaxed/simple;
	bh=z7jxl+e8jm06YnFJ7ulXVe01RvsrUZ9KccYhJgKrkFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3Hj/HWsDz6GDQ411YseCwGYyBqaNeZRr2lmztaVXs7BAlVOlN2ElN1vbaTnXBNQIYwmjwp3a9fHTbzTe5oUSkI2pyW3V/5RdnWWHTkGbpWIEzmKHHYr/B3MeOCvecy5gn4MgUkV8MzJR/aIrOBvMRbjKTvAD6/eEGZZ4tbMvzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JYgFlNZc; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JYgFlNZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qj
	5zTRFYCHrbHIr5mSW+KX7DKQUhqYyAxwN+L12YP6M=; b=JYgFlNZcBRv4Lg62E8
	x07oGNQ0OkgW0GQK9HvwFmbyfhPVnpyzXgZBvronuPzjbLtNV+Sm+w6uW8KSTfCB
	dQkcv73vjZ/Jd1GSCsDqfjSOXq1a50wncurCdZ14FXZF+oITTyauNcQcuW2odJYI
	lLmlO8+CDDu0SfQj52I1iQPG4=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3nyfw53JqU334Kg--.15929S2;
	Wed, 05 Aug 2026 15:36:17 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@gmail.com,
	liubaolin12138@163.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH] fs/ntfs3: check wnd_set_used() in ntfs_look_free_mft()
Date: Wed,  5 Aug 2026 15:36:15 +0800
Message-ID: <20260805073615.2044614-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgD3nyfw53JqU334Kg--.15929S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1xJw1rtFy5Cry8Jw4xZwb_yoWkuFX_Ja
	4xC3WfA345AFnI9aykWrWa9rW7X3y8twn8Wayxta4SkrWDu3Z8AFZ5Aw45tFW8W3yUJa4r
	A3srGrWrJr1ayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiApn7UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhFtOGpy5-HptQAA3U

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

