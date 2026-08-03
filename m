Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECEF2EA498
	for <ntfs3@lists.linux.dev>; Mon,  3 Aug 2026 04:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785731679; cv=none; b=hp6J2d0nXbZe9iEksgXgZZS4mkzwEfT03VK57hQCKTbCDqypi57nX+lgqtwRyye1N9g1K1buletShUpnPR3lP5P35iVR+0SySSZwYJNWdDSb8ZFntIlDCIR80xH+32WTL225iZIcEpZ4QWinFFd6IXH8O4BiMX6ljNUPW1Y9ubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785731679; c=relaxed/simple;
	bh=6MaiF08US6EBABB8rzhXICVg0DKE/Axy9oSPVxG0dZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCaVwL2ISKpIUGxLu21G8NFHdpRVwRZsF4zWiuV+LS2Ua/l4WD2w4UV3v2tMJ7YsxCPcG17oCE+I5lXhm5djMNftMlSNii4qGvtS2fRFw74py3HzU9kGlIyvdW3iigyZpdy11hmAUo2u6e6xut7fIm0+ANJIA+aLi5wkknlenH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EteCaC9s; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EteCaC9s"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc97653887so30919955ad.1
        for <ntfs3@lists.linux.dev>; Sun, 02 Aug 2026 21:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785731678; x=1786336478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhmhEpINn+raFaWrTltRP0P5bFP6jSqRDnD8vpTuVFs=;
        b=EteCaC9sKhL2dZHPvY+uFL24I/DaK9hvEj89Ot1DiOR023aZG9wqxpYYE8kGCB2eWy
         BNzvXeofmx/aVkfJz9kx/TmUohx2c9CcyH6tsm8xS4tFzW3m6ee87WBUSlasqJRQd5Jy
         ZBKq/f3atlj90izfBnoaCAejGY8QgTJLpvKRrXUKgStgAKQPd5R1ZSrtzJITSfbgVfDe
         3qDj5Fet19PyBqQ+rVftAcyzVIkuQ2D7m/8D3d4fTPQDaoo4PhqopHHDkw09TwZvwtdG
         oqIyhchg9+oxT0KQN/UvdzDNDzYDuzl/WU6q5PMO+BhrxX9Z59zviU34g+VtXRJZPRMA
         CsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785731678; x=1786336478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhmhEpINn+raFaWrTltRP0P5bFP6jSqRDnD8vpTuVFs=;
        b=OpAseujGitpo3qBX6NxdY3mrmLlr4stSjoOCP1/9a+TPVPOs79/rZWPDzxQmtsUlVL
         /niiTBRilPqoQoua3SqieewjBSNgICWkS/qD64c/DCxOu57lW7TjbmwnfDBidN/2olC+
         dBiO39D1lJTl5hpWRCxdS13sYgH1m8+wIlVU6tv4BMTyfpqPdHZ1uf2U8fHoEbKrehkX
         fM6PwSd+nFh439aBg0KxoJF8FUIeOaTATNM9hRWhbPe5XnnpOB99Jb2E7OW/fJvTJcBm
         H2aBerfSpdCN/M86r0NTnnBw5RaQbb3TM9Byaa9R3pTPFu/g7pPsHyGQRms0F9q4C99S
         DJXA==
X-Gm-Message-State: AOJu0Yxa8CsS44yN/QnloL0ufNYB1LtEc71YJlsjateWfxsKuBkqeN4s
	Y3MJC9i0wSm5EIbvniZM2US4Mmx4HGcQmtbJQwk6Vg9ncdnpWDAiAuug
X-Gm-Gg: AR+sD10q07ypdr4FWfVP0cI6CLUEeg6DdpOucAhLxhDWGluZ/jAxk380D380AMEGPKf
	B/EuXVsAovpSQbm6RLhT3ue3PyYG3d+KRlsYYPBIOanoVau+UH6cL0O3OSb2lEYVD/f+lj6XYU+
	fRJd5DVb0WkB7rE4JbfiKz3c/oyuCM8GUg6ObuMIE3WWuufBz4gneaCQX3vLMfZqIu45ZSke0Cy
	W8tu0qjm4bX8+b4UZiGwmer4bgD5tJ3WH1VaqYommqKRNVDpPFArt03k1Wa6Yc/lifYzKlhnvRS
	O8fCE/Z/BKS9yorMBcEY7po+kDchGUIgTIUr2b1sU3t61RIO2cffRdCfhlJbV6m8Q3R58gK18sk
	MkVttw69/+EqULgR6c9Tibmf2mtdkuOhuyPOlvj3+psLHKnAycY0ONKFIuQhCOjKi9H+edmWe3s
	sG1bWomm7jllvsGXhFZZcwY+S+nHlDMkwQMiEDy7w3vcmYPygZZ2qVG1IL088htEnv877HwoH7T
	VDMo2J8tgKMpA==
X-Received: by 2002:a17:902:f60a:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2d05246ee7cmr89005425ad.24.1785731677604;
        Sun, 02 Aug 2026 21:34:37 -0700 (PDT)
Received: from localhost.localdomain ([113.23.46.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm39302243eec.13.2026.08.02.21.34.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Aug 2026 21:34:36 -0700 (PDT)
From: Yuejie Shi <syjcnss@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: validate the EA value length in ntfs_read_ea()
Date: Mon,  3 Aug 2026 12:34:32 +0800
Message-ID: <20260803043432.94886-1-syjcnss@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_read_ea() checks the $EA list for consistency, but it only
recomputes the packed size of an entry when the entry's own size field is
zero:

	for (off = 0; off < size; off += ea_size) {
		const struct EA_FULL *ef = Add2Ptr(ea_p, off);
		u32 bytes = size - off;
		...
		if (ef->size) {
			ea_size = le32_to_cpu(ef->size);
			if (ea_size > bytes)
				goto out1;
			continue;              /* <- elength never checked */
		}
		...
		ea_size = ALIGN(struct_size(ef, name,
					    1 + ef->name_len +
						    le16_to_cpu(ef->elength)),
				4);
		if (ea_size > bytes)
			goto out1;
	}

ef->size is non-zero for every entry except the last one, and it is what
ntfs3 itself writes (ntfs_set_ea() stores exactly that aligned packed
size), so in practice elength is not validated at all.  find_ea() then
uses unpacked_ea_size(), which also prefers ea->size when it is set, so
it agrees and hands the entry back.

ntfs_get_ea() copies elength bytes with no further bound of its own:

	len = le16_to_cpu(ea->elength);
	...
	if (len > size) {              /* size is the *caller's* buffer */
		err = -ERANGE;
		...
	}
	memcpy(buffer, ea->name + ea->name_len + 1, len);

so a caller that supplies a large enough buffer receives up to 64 KiB of
whatever follows the small $EA allocation -- straight to userspace via
getxattr(2).

Compute the packed size unconditionally and require it to fit in the
entry.  Hoist the "bytes < offsetof(struct EA_FULL, name)" test above the
ef->size branch as well: name_len and elength were being read there
without it, which is itself a small over-read of the kmalloc'd buffer
when fewer than 8 bytes are left.  The old "bytes < sizeof(ef->size)"
test is subsumed by it.

  # mkntfs image; create /mnt/ntfs/poc with user.ntfs6 set, then rewrite
  # that EA_FULL's elength from 0xf to 0xff00 on the raw device
  mount -t ntfs3 -o ro /dev/vda /mnt/ntfs
  getxattr("/mnt/ntfs/poc", "user.ntfs6", buf, 128 * 1024);

  BUG: KASAN: slab-out-of-bounds in ntfs_get_ea+0x294/0x3e0
  Read of size 65280 at addr ffff0000cca53acf by task xattr_probe/142
   __asan_memcpy+0x3c/0xa0
   ntfs_get_ea+0x294/0x3e0
   ntfs_getxattr+0x284/0x318
   __vfs_getxattr+0x104/0x160
   vfs_getxattr+0x1b4/0x1e0
   do_getxattr+0xcc/0x230
   path_getxattrat+0x184/0x270
   __arm64_sys_getxattr+0x64/0x80
  Allocated by task 142:
   __kmalloc_noprof+0x294/0x668
   ntfs_read_ea+0x1e4/0x420
   ntfs_get_ea+0x2c8/0x3e0
  The buggy address belongs to the object at ffff0000cca53a80
   which belongs to the cache kmalloc-96 of size 96

The object being over-read is the one ntfs_read_ea() just allocated, and
it is 96 bytes.

Entries written by ntfs3 and by Windows set size to the aligned packed
size, so the new test does not reject anything a working filesystem
produces.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Yuejie Shi <syjcnss@gmail.com>
---
 fs/ntfs3/xattr.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 04814dd29375..e67a1100d0cd 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -146,26 +146,31 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct 
 	for (off = 0; off < size; off += ea_size) {
 		const struct EA_FULL *ef = Add2Ptr(ea_p, off);
 		u32 bytes = size - off;
+		u32 packed_size;
 
-		/* Check if we can use field ea->size. */
-		if (bytes < sizeof(ef->size))
+		/* Check if we can use fields ef->name_len and ef->elength. */
+		if (bytes < offsetof(struct EA_FULL, name))
 			goto out1;
 
+		/*
+		 * The name and the value have to fit in the entry whether or
+		 * not ef->size is set, because ntfs_get_ea() copies elength
+		 * bytes out of this buffer and checks them only against the
+		 * caller supplied buffer size.
+		 */
+		packed_size = ALIGN(struct_size(ef, name,
+						1 + ef->name_len +
+							le16_to_cpu(ef->elength)),
+				    4);
+
 		if (ef->size) {
 			ea_size = le32_to_cpu(ef->size);
-			if (ea_size > bytes)
+			if (ea_size > bytes || packed_size > ea_size)
 				goto out1;
 			continue;
 		}
 
-		/* Check if we can use fields ef->name_len and ef->elength. */
-		if (bytes < offsetof(struct EA_FULL, name))
-			goto out1;
-
-		ea_size = ALIGN(struct_size(ef, name,
-					    1 + ef->name_len +
-						    le16_to_cpu(ef->elength)),
-				4);
+		ea_size = packed_size;
 		if (ea_size > bytes)
 			goto out1;
 	}
--
2.51.0
