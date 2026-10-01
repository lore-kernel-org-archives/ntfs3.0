Received: from mail-qv2-f24.google.com (mail-qv2-f24.google.com [74.125.230.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3C1388891
	for <ntfs3@lists.linux.dev>; Thu,  1 Oct 2026 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.152
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839598; cv=pass; b=KHVRcTHL/sKrNch9ig8oI2KO9w4zi9PecdzKJSvXr3Mqs1Wp7b+56aQQeT1yHf+w40BLVvVPLCHN6+g/0f/60c/fsHoYL+J+uHuTqwP/9RtilS62KnBL7oaSJZR74hv1+gCiIfyL/HoV3DGip73E1RCQFrj0hROcq3CwZwsfFyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839598; c=relaxed/simple;
	bh=39+UbTrd15evl4BErQkB3FfRMtQYMZH3Gsqk51OEhGo=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=BY7Hm0K3vux+CRuoFI6M3aMgWTQctQdFCXZTeAjHkm3W/Tzn5u3mM68IrJqjqQo1W1c64cNvAbVfFrGNLmlIBDVHiaW40fRjSKgx3D2i4CR3NjsRNwoYWVyOQABSxWS6cMk7C3c9u/U1w33nLDlpqZcSuf3PkYtn/0pdIrh8C2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEBGOGe4; arc=pass smtp.client-ip=74.125.230.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEBGOGe4"
Received: by mail-qv2-f24.google.com with SMTP id 6a1803df08f44-9144f89ce90so53225566d6.0
        for <ntfs3@lists.linux.dev>; Thu, 01 Oct 2026 00:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790839584; cv=none;
        d=google.com; s=arc-20260327;
        b=kVKfvMafrz2pVT7AzYxBP5mgRP/wamBI+HPfQnRr22n7fz5vxArshbpzp8H6nEUpXO
         YJfLgnWj0KmGk8VMQCynp1kCymdk9s2GSI1YIEsBsw6a1u2ydO0mOBXJgepMc9BGrnh5
         YxrXE61StAItNJLeD9KQ9JmfnUGbdCeoW3cIQ3zKxqcg8gz+Uj/TaMJ5ow2NX4AObedG
         5Zt/eN1+j+VNl4GYJwD9xwYbfdhAeRfMkBntcRnNIS/kMvfh9VpXXhYcXJ5xlOWjD7Yh
         wwNPPpnof8sPyOaUbklmEeMFCDAZsBhPK2jO+H1EYhsYyVtSru8QHAvkHcMuC7wnf5if
         9XXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=RQhxhIkbMtU/v8KdCMZ8ljBnV91qWcFJsDkycf22N9A=;
        fh=8Mxx1paKBLL0xykYasOtZrCa9fkGidddz5kTCkBWAqo=;
        b=kbk2iENrZ/Vh7+7u9doz/l8JfPMBMoPcneAmM1Mpli64Ykwpw/MeIkeoXdAoNsGf7G
         vZFCEKPl4qBLprT9atOxtURsZkw58A3/iyYvRh0LbYTh3v9S6rvZr/Xhkmh8Ff/RDsfj
         Ys9C2z7nR3poHEryKpgHCONJkdyswwjBMMOHhNRqP7eITgxlUNa3Fv2zJF41W7XAkrLm
         /byk7cZ2et5pzt9vHpGO5IQt6bAFR9fm+cflBSS3QbMOqw23GNh7fcQ56sFDQFsqiudx
         /gc7bIaw7J2psuepYwEl/FPRtJyUzTPizRw1vyE7CqapqKGVXcBz7u74opCVMzIf0IMW
         5smQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790839584; x=1791444384; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQhxhIkbMtU/v8KdCMZ8ljBnV91qWcFJsDkycf22N9A=;
        b=jEBGOGe4CRe2/fXoP64xV6EMCCrGY4KWqRBAPPyJuNnBMoTS2ulpWVutMzpOE97CFx
         9HRtvLLB3VbC/6rSc5+yLcrgnOJova/oyBRHx8tD0kpdGMGj1jHu0/+wdU9rHd+gt7uY
         RaGo1YxeMpNUFNGPTxDKzScXja7FU4kml0ByIbYcVV6k9TBTdHN0fBdSPRytULG5mr63
         nrfxI5S84CAgYPo5kQMruHy0yQBC2OwrbIWDsuQoAtjt5vEYFld4AkmP8ye9P0Au8b5n
         amnnOFm5EH9hgceSFLeRZbupD9DeT8yf0/SUnj/jDxZKpnec0ZdEkw+LrBeP6YIxVr/U
         LvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839584; x=1791444384;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RQhxhIkbMtU/v8KdCMZ8ljBnV91qWcFJsDkycf22N9A=;
        b=M/IjG7LFgodB7EfMZ1Op+l1V4tKjr4ZFO5VsBV89+lIIEonjAV1HAZXy3OzIb0cL0R
         haG2FdFktviot+aog8L/3fDiUXe75doOULSfC8//zYdDFT+uiUJEctApj33Hgo122T9o
         ReudCLvLRgxA2zAGiyqoxH+e2moBxTcslfa6kCLPG8rUoE9lpzso6d7FjyliOB03o61g
         bV5yj/EbPezlO5533tvnC5hr/IeLPUbT4Izy4TrQhxKeGgypN8HBUJmUblWRreg2C702
         k0KNU48coIHBSKqJcn5JOAffh2hX8N7msAVVGhKXBtFkNwGm1s7pF0IrLWdK1jsXLwbH
         NOnQ==
X-Gm-Message-State: AFq9FYLUF+fyhUwPhr20Y6I68c5OuomW0LXI3YLz+EaS+K6/UhqV0tB9
	0hZT+ybIPVKGLI+Lz9bd716LRgJnnXFZZUN0hhq9euFtVHnQAmvd7QXa45aYJ8VAvDTiyTyXR6z
	YtyI1P5SYUl8laYmO1UyxzDD8HQgbWVQ=
X-Gm-Gg: AYBFou39urD8RTzEFG/+/o0tlgYZeLecfeS6SUDaCGxxu/vzh8N1b9qVnbdf+40Pe3X
	I/kry1R6ekfRvUMRHnaPgLeRUWxH0C7Fo78LHbtQ/oK3kSXPvKJKIKOvzvhEq0cwRJBzjPCi3cZ
	cZf8tzsc4jqcYvHC2oIo75By2TBa0uT1vDTSTvRBkbGW+qx5aAERT3JC9itrLPtLfLppf6o9Pnu
	d8HYMq0cXhwTEE4EDQPvPOP2iZJY8Gu5eofwajuWY0zQC6s0TfBpdweCPzHV1IkBzAIHc8/wKU2
	JfFjyDhfzmRALyyNkDVeUURL5l/WG03i0e0W4b8yiOn5Lu4598IQ5CaL3vvdS2ZOS5xzmUQxbjN
	X7JbTHxw=
X-Received: by 2002:a05:6214:20e8:b0:917:b08f:e8a2 with SMTP id
 6a1803df08f44-917b08ff134mr18560616d6.25.1790839583769; Thu, 01 Oct 2026
 00:26:23 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 07:26:22 +0000
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 07:26:22 +0000
From: aljojobypls@gmail.com
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 1 Oct 2026 07:26:22 +0000
X-Gm-Features: AclHuK8pvE4CJAFL_nt5ep6-wjgFpJoAWO1IdH6rdWgHF6rWWf5eras6BWwqlNs
Message-ID: <CAPNiJxCDpbQNO8K=+Oh+c0mKyji-HDz0xdLZnJySG-Yuj+d_7g@mail.gmail.com>
Subject: [PATCH] ntfs3: update iomap folio state when marking folios uptodate
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ntfs3 hands page invalidation and dirty tracking to iomap. With a
block size smaller than the folio, iomap keeps a per-block uptodate
bitmap in iomap_folio_state, and ifs_free() warns when that bitmap
does not match PG_uptodate.

The read past i_valid, compressed reads past i_size, compressed
writes, resident-to-nonresident conversion, and ni_read_frame() still
set the folio flag directly. truncate_setsize() from ntfs_setattr()
then drops the folio and hits the warning.

Mark those folios through iomap_folio_mark_uptodate() so the bitmap
and PG_uptodate move together.

Reported-by: syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0e70362e1726b5a7502e
Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Aljo Joby <aljojobypls@gmail.com>
---
 fs/ntfs3/attrib.c  | 5 +++--
 fs/ntfs3/file.c    | 6 +++---
 fs/ntfs3/frecord.c | 5 +++--
 fs/ntfs3/inode.c   | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206..73f059765 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -7,8 +7,9 @@
  */

 #include <linux/fs.h>
-#include <linux/slab.h>
+#include <linux/iomap.h>
 #include <linux/kernel.h>
+#include <linux/slab.h>

 #include "debug.h"
 #include "ntfs.h"
@@ -327,7 +328,7 @@ int attr_make_nonresident(struct ntfs_inode *ni,
struct ATTRIB *attr,
 				goto out2;
 			}
 			folio_fill_tail(folio, 0, data, rsize);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 			folio_mark_dirty(folio);
 			folio_unlock(folio);
 			folio_put(folio);
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 2abf334bf..520b72456 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1071,7 +1071,7 @@ static ssize_t ntfs_compress_write(struct kiocb
*iocb, struct iov_iter *from)
 			folio = page_folio(pages[ip]);
 			folio_zero_segment(folio, off, PAGE_SIZE);
 			flush_dcache_folio(folio);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 		}

 		ni_lock(ni);
@@ -1080,7 +1080,7 @@ static ssize_t ntfs_compress_write(struct kiocb
*iocb, struct iov_iter *from)

 		for (ip = 0; ip < pages_per_frame; ip++) {
 			folio = page_folio(pages[ip]);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 			folio_unlock(folio);
 			folio_put(folio);
 		}
@@ -1166,7 +1166,7 @@ static ssize_t ntfs_compress_write(struct kiocb
*iocb, struct iov_iter *from)
 		for (ip = 0; ip < pages_per_frame; ip++) {
 			folio = page_folio(pages[ip]);
 			folio_clear_dirty(folio);
-			folio_mark_uptodate(folio);
+			iomap_folio_mark_uptodate(folio);
 			folio_unlock(folio);
 			folio_put(folio);
 		}
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index bead01a95..3bf794dc9 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -7,6 +7,7 @@

 #include <linux/fiemap.h>
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/minmax.h>
 #include <linux/vmalloc.h>

@@ -1943,7 +1944,7 @@ int ni_read_folio_cmpr(struct ntfs_inode *ni,
struct folio *folio)

 	if (vbo >= i_size_read(&ni->vfs_inode)) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		err = 0;
 		goto out;
 	}
@@ -2521,7 +2522,7 @@ int ni_read_frame(struct ntfs_inode *ni, u64
frame_vbo, struct page **pages,
 out:
 	for (i = 0; i < pages_per_frame; i++) {
 		pg = pages[i];
-		SetPageUptodate(pg);
+		iomap_folio_mark_uptodate(page_folio(pg));
 	}

 	return err;
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 4ac26c80b..8e4a5dd6e 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -842,7 +842,7 @@ static int ntfs_read_folio(struct file *file,
struct folio *folio)

 	if (ni->i_valid <= vbo) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		folio_unlock(folio);
 		return 0;
 	}
-- 
2.53.0
