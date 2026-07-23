Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF263644BC
	for <ntfs3@lists.linux.dev>; Thu, 23 Jul 2026 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784844660; cv=none; b=VQSjgn01XSpd/oVopgRs2Cjx5Ifl5EruZI/KzeVnimhAexsn/neDO2sm5FBdDv12QBuNQJKJzWY81MKD+Ovw4z5JgsOBfugIgMY6Cs8CyiATtmtqSwk2ePfay2wdYX9wLfFQcmb0JFLRUZThNr14192Pb9JZ5mimeQ7AAnFEfqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784844660; c=relaxed/simple;
	bh=C2Zn4CbY0hbSGyEmBt2MEmF1iqU58U4gSfRk9aHfces=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GULyUJ3FBUq2QJrfvxMDzwcgm90bzRe0i5fgjASR9TOdR+vKHW5jwdwPH5Xgm9hQ38+/2ofbmLz8Ea8ivclSU0tdUjnIk5Jy3J0ilOzy9Kr4qSOm8Xmj+gU5v6ZnDf8FXdiXsShjn27jJ3G0bcSf6jT6UK5OU2aBAjArJe4akhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB1/+UZl; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB1/+UZl"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1c24ec9525so175255066b.1
        for <ntfs3@lists.linux.dev>; Thu, 23 Jul 2026 15:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784844658; x=1785449458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3sImDHanXm/nP3OwyjC3fU83vihxLVlwyFoNqtWFgU=;
        b=gB1/+UZlU9OzTsU0xCLEY1ZLf3TpF/2u6YimMSBGyYPi14VLqkX/axTIQ1D8im/Eu1
         jToAOwO6Mn7WqCdmJyhUHoOWGokft7LEIeiOQNylgMdGpqNzZCc/T/lVU8PjLIQrVbe6
         +ybe0HT8A51+YbyS10pcmwN2KxypvX9p5XfSMaRXoMxbQbjNEMRumvKod0MlyyAwYqsZ
         BugNkteJrxmam6hxgODqjTxDkqcPCHS0Con/UutOEl9OoHM0W5+QbXRd/9QMLAmiH3Kz
         ALYUT3JhnIjyGCrkTLRENzSbD9LNARwU+GX28/sTq3eHdZIGhOnsd9APNSznDqDzrsoQ
         7oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784844658; x=1785449458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3sImDHanXm/nP3OwyjC3fU83vihxLVlwyFoNqtWFgU=;
        b=XdNhmAkDlTpTRdcAEBaZ1YSW13vInYE+XoHDkLsPGNH/MmOocpHvfWvFAYVRRi067V
         tDFF0/prItUe3IDV1dbNap5FxdJ68HeJBsd7X2Zy7vbey7tAKM5cRdyIDGNfd5Him6XH
         0sBYJ8fvG2cDxYmHYyF+6sxtOGH/ug6PUzQJZCUSHPuCRphItQF8TmihUdc/ddPLj/gF
         AYe06vqK5e+qKBOjqjQ6lLTn21LXEWlMdkIaOkbHatxgO52K9NSukT+Zvsw5AiPavhr/
         i9/MCb3zWWlIDDlLPFQKJiyJGI516lKCFZM8u5PFeszdEBMAJKGMDS07ElKpnZlsmPKd
         67Bg==
X-Gm-Message-State: AOJu0Yx9FTtqwuGxh+uvb43KxLHqHbsBWnOHwwTzGlajnyMU6KUR0paq
	2Kve7tvnkob4uUNf25fMm9i09ntxRmhAM57Na7aKJ96nGWNNR6T3N4IztdF30BGAcoE=
X-Gm-Gg: AR+sD13TIRrHbybYACjncDaEDUMYrBQU7ZhQuhkVRn2i8IuNT23k8LUSJM9aCJtMH3e
	xiZLgtX/JbLc6MEfekh89M/EaGk1xG7m6o8PwaS5R8xXgrA0XaEaL0w2HWflHgiq8YbJ+OFQWXr
	2zyPCYUNxMZtQ/yOvMCywDwk5YvD+nmy1GUFkWAIcfWNlcdA59u4UnhTczEEt1qyJ08xRZaucyl
	27GMb2hkbY9XyVc24Kij2CprPdlj1VqdgfKXpSeke6ecuCHUpX4GLcu2O5v/zfZ6PCmrY1LbyRU
	x0CTaLAFGa/AmBKyhjV0uxEC8xR2zRgzgrJ3cMy0Xc5we0UHwGNOghR77jgCxdgSXkD2zZxauKk
	oyBavk+WwDnRedjPUnZABoefDWN0cjH54mij9tZ8PjMTIC5hxBPhqDyZFwPHsehtwhA2aNie72A
	k15NFD
X-Received: by 2002:a17:906:7304:b0:c1c:62b4:1ebf with SMTP id a640c23a62f3a-c1c62b41f9emr108510166b.60.1784844657499;
        Thu, 23 Jul 2026 15:10:57 -0700 (PDT)
Received: from beelink.. ([186.247.163.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90205sm280929566b.33.2026.07.23.15.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:10:57 -0700 (PDT)
From: Your Name <qwe.aldo@gmail.com>
X-Google-Original-From: Your Name <you@example.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: validate that EA entry size covers its name and value
Date: Thu, 23 Jul 2026 19:10:45 -0300
Message-ID: <20260723221045.529665-1-you@example.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

ntfs_read_ea() walks the on-disk $EA attribute and checks each EA_FULL
entry for consistency.  For an entry with a non-zero ef->size (the
offset to the next entry) the loop only verifies that this stride fits
in the remaining buffer, and then continues:

	if (ef->size) {
		ea_size = le32_to_cpu(ef->size);
		if (ea_size > bytes)
			goto out1;
		continue;
	}

It never verifies that the entry's own name (ef->name_len) and value
(ef->elength) actually fit inside ef->size.  A later reader trusts
ef->elength unconditionally; ntfs_get_ea() does:

	len = le16_to_cpu(ea->elength);		/* up to 0xffff */
	...
	if (len > size)				/* size is the user buffer */
		return -ERANGE;
	memcpy(buffer, ea->name + ea->name_len + 1, len);

A crafted image with a small but valid ef->size (e.g. 24) and
ef->elength == 0xffff therefore passes validation, and a getxattr()
with a large enough user buffer copies up to 64 KiB starting just past
the short entry -- an out-of-bounds read of the ea_all allocation that
leaks adjacent kernel heap memory to userspace.

  BUG: KASAN: slab-out-of-bounds in ntfs_get_ea+0x2b8/0x3f0
  Read of size 65535 ...
   ntfs_get_ea -> ntfs_getxattr -> vfs_getxattr -> do_getxattr

The zero-ef->size branch already computes the same struct_size() to
derive the stride; mirror that in the non-zero branch and reject the
entry when its declared size cannot hold the name and value.

Fixes: 0e8235d28f3a ("fs/ntfs3: Check fields while reading")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/ntfs3/xattr.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 04814dd29375..57114fb726f7 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -155,6 +155,24 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
 			ea_size = le32_to_cpu(ef->size);
 			if (ea_size > bytes)
 				goto out1;
+
+			/* Check if we can use fields ef->name_len and ef->elength. */
+			if (bytes < offsetof(struct EA_FULL, name))
+				goto out1;
+
+			/*
+			 * The declared entry size (ef->size) must be large
+			 * enough to hold the name and value.  Otherwise a later
+			 * reader such as ntfs_get_ea() copies ef->elength bytes
+			 * starting past the entry, reading out of bounds of the
+			 * ea buffer and leaking adjacent heap memory to
+			 * userspace via getxattr().
+			 */
+			if (struct_size(ef, name,
+					1 + ef->name_len +
+						le16_to_cpu(ef->elength)) >
+			    ea_size)
+				goto out1;
 			continue;
 		}
 
-- 
2.43.0

