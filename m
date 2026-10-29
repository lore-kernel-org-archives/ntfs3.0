Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279654;
	b=UD08m9R7PXcPJ3KlCodlqI8RRu1lNkEVY8zBXr8EZzA22C7rU6WmCx7u5ntd1pkB73oI
	 p0lYtBRLawnhqEZ+BNewKCXc6qNLIhQBUwyt1sS+5VzLAPMapR+jCJ9r6dbV0iUCaK8kr
	 emwmqTFk0kF+8gmxOFEZDH32uU8Uoh2PNYo3CcsD3rMqy9fInMr0+FMzBB0pPatjHPZiI
	 oxzDkhMjBnG+laKt0fFj2VlCzRNeTeVHvlue3cl8DasGhOaSRYXvZEm98qg7j6TeQvX1M
	 R/3u0CLzqGqP5i7fKk4M5e3W4nbIS45X/vCO9bL0x5YSnaHibeWUnUfNCMddF8/7EZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279654;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=cJdBYcQWZzEcW170Dkg1FZUpnGDs52EYrFStRAwM8lw=;
	b=FHhoJxkIExQSg9yC/VXhy9jk12585XoDbfkODvSHbkfnbuwQTq/HqOTv8qZPd5BwOxT2
	 3owzDqgK7pzTR1QjFMRpKdQeE9tVuEWdH9TidcSJnbx3B/FN29YGYrjQs2GyYpXyjDw7w
	 EcADiE51r7e1aLXZSQZo/mugaVoN5afbaYXS1FqblO9S8WNxf+dQF18+94oAaHlpSwTnP
	 Njo6VRK/gHfU7lVGN6u2y7USnWY2Frmti6kWOfBkxjjWYJ3SzE7oyFBny5oV5fcrorQOp
	 ciFUi16ITLa13JFW5EcoMFhjr+qk0Y4MMhBVXIByX7KMyotFGQEykt+71iAX0wNN8DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="cEvG/H26";
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B676606A32D
	for <ntfs3@lists.linux.dev>; Thu, 29 Oct 2026 13:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B676606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cEvG/H26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cJ
	dBYcQWZzEcW170Dkg1FZUpnGDs52EYrFStRAwM8lw=; b=cEvG/H26TrlAW5LocT
	FBivRxuwOdpf2GPxisJ0huVJ7e5boQE9NQfeNaWuqbyIUoeI4iQNy0URW++jQkGR
	Ib8NhO57fbcerh/TC1vnTwtsnuEJnIRIqbPW9SzOoGKTjBnIf3I43cMNr6N8jNXb
	/LsyBlfKMKd+Cgc/PiXRZ7NBA=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgB3u3eeRuNq+Lb+CQ--.14261S2;
	Thu, 29 Oct 2026 21:14:07 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: bound UpdateFileNameRoot/Allocation by the entry size
Date: Thu, 29 Oct 2026 21:14:05 +0800
Message-ID: <20261029131405.30-1-shxzhaosr@163.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgB3u3eeRuNq+Lb+CQ--.14261S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFyDGFW3Wr1UKr48Xw4rAFb_yoW5WFW3pF
	ZxCFZ3Wws3Jr17XrsIyFs5Aa4Fvw4kZ3WUWFy0yw10yr4agw1xKa4DK348u34Ut395ZFy3
	tFZ8tw47WrnruaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbL05UUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7R9MimrjRp+HPgAA3d

do_action() resolves lrh->attr_off to an index entry only through
check_if_root_index()/check_if_alloc_index(), which verify that the
offset is an entry boundary.  That boundary may belong to the 16-byte
NTFS_DE end entry, which carries no file name.

Both UpdateFileNameRoot and UpdateFileNameAllocation then assume a full
ATTR_FILE_NAME follows the entry and memmove() sizeof(fname->dup)
(0x38) bytes starting at e + 0x18.  With the end entry placed at the
tail of an ATTR_ROOT that ends at the record boundary, the write runs
past kmalloc(sbi->record_size); the non-resident path has the same
layout in the index buffer.

Reproduced on v7.3-rc6 under KASAN, mounting a crafted image whose
target MFT record (record_size 0x400) holds ATTR_ROOT.size 0x3c0,
data_off 0x18, data_size 0x3a8, ihdr.de_off 0x388, a single 16-byte end
entry, and log action UpdateFileNameRoot with attr_off 0x3b0:

    BUG: KASAN: slab-out-of-bounds in do_action+0x3407/0x8790
    Write of size 56 at addr ffff88800375e400 by task mount/205
    __asan_memmove+0x3c/0x60
    do_action+0x3407/0x8790
    ntfs_fill_super+0x33e4/0x3f40
    ...
    Allocated by task 205:
    __kmalloc_noprof
    mi_init+0x81/0x110
    The buggy address is located 0 bytes to the right of
    allocated 1024-byte region [ffff88800375e000, ffff88800375e400)

Refuse the update unless the entry is large enough to contain the
region being written.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 fs/ntfs3/fslog.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index bb8d40b..abc066a 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3568,7 +3568,19 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
-		memmove(&fname->dup, data, sizeof(fname->dup)); //
+
+		/*
+		 * attr_off is only known to be an entry boundary; it may
+		 * point at the 16-byte end entry, which carries no file
+		 * name.  Bound the update by the entry size, as the
+		 * neighbouring UpdateRecordDataRoot case does for its
+		 * payload.
+		 */
+		if (PtrOffset(e, &fname->dup) + sizeof(fname->dup) >
+		    le16_to_cpu(e->size))
+			goto dirty_vol;
+
+		memmove(&fname->dup, data, sizeof(fname->dup));
 		mi->dirty = true;
 		break;
 
@@ -3753,6 +3765,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		}
 
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
+
+		/* As in UpdateFileNameRoot: e may be the 16-byte end entry. */
+		if (PtrOffset(e, &fname->dup) + sizeof(fname->dup) >
+		    le16_to_cpu(e->size))
+			goto dirty_vol;
+
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
 		a_dirty = true;
-- 
2.49.0.windows.1

