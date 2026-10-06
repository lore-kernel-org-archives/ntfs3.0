Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76074195C8
	for <ntfs3@lists.linux.dev>; Tue,  6 Oct 2026 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292265; cv=none; b=EgNb+EfbBdoKflh5e7kEnJoUgoGP+hP99qTb+vE/R35OjA7hzItJmm/GhWwxtoxWU90e2lUwoNG6x/H2R7IKsNwUGHz5GKw519sv8R8J5OnTpXdaXsqSkFMIB6xI6e2z4HjPlLnHLwgbXyN9P8RxlL39NyygRKXbRhrg9wDW5xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292265; c=relaxed/simple;
	bh=pKG+G/gx2NfFQHOz7fygi4Bq33B7vmC6kn9GiCKo7Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gt/Sh7E/Wi9eO4WqgaOy/R/Xy05q3MpSY1DmQ00fev/iLadt3JhymHwXFFH4ZfYbZkYKa3EaSHmeImaP+9B0b79mCl9y4DMoOCeDaDtVyn2T1N02PHtmHgjvHSv+e/p6nSHZ069+MNF6j2oUVqCfBam5NjUzcUzAj/SiT4PUct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioqvlydn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioqvlydn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so5047705e9.0
        for <ntfs3@lists.linux.dev>; Tue, 06 Oct 2026 06:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791292261; x=1791897061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kR+aK5Y7Uqk9JqfaD3k6LXtSgo3UHIu2EWnIjGCHhl0=;
        b=ioqvlydnprlwWt/QVml0+fFwxOR4q75AWciZAbDsamEz/BWlKwCd5dN/Sm9REwIT/n
         Rg+t7vXc9n9/eNX9cpYFK38e+TJ4JFtlZTzL67XIVtBXnDLNPmXGEa7+iyVjOYUW7z88
         gK0ZlS4e7DxKc62VeDSYf1BuVMmnCW2JFO4240vkZ1vAOd8NaNFyNgRhIFrRqNhe7/kG
         xxjh+GEMOW/E0EiLlNzDfznuyMRW2Cs2fSXbmuEQdO/NAoDwm8DOHMcwCRPb1VVFLy8k
         gjAsu7q1u/sf9GhtwcNQ4ejE/5HNuVnm84X2Rbv5rWJc63UWF8mbOT4khNCIrxfvnOtn
         CGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292261; x=1791897061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kR+aK5Y7Uqk9JqfaD3k6LXtSgo3UHIu2EWnIjGCHhl0=;
        b=I/IIjirSL+7fa0/hDnxd4n25rYCGitBf+wV2n5Kf+GVAV9fFi/i/5BQe8BBoiUVGU9
         uPf1BF/xVLSfdBC2K1+bDzfc9Os8sXZzT+DK6aMW0LBpZ+hJICZjDOWGSBNk8x1wE4Y+
         6EydIL6qwJ1VxmKkOTRvYgYBDMOEnB0ihkPQiEzqSgjvnxLfOroaTfvg9c/oXN7kyJ84
         BMQssfuhzX9JAghB0kkIewCZzgQq2cFZM1YrLehlaTZMFeXmTmdqjbCl9K47TSp7eoBl
         CIFrQdPuxMTUJv32IkChhxnC532gpMLvImie7bN43qHpMwj1F/VNS2jjP2DlVkL2HQ/+
         oNRg==
X-Gm-Message-State: AFuF++mYsPuoH1HWfyiJcApo4fSoQWU0x4VRXg3qOVMKiIBssU69ijZy
	MwVlsY2BtulrmMI84X+5cZcWnz+e6kK5egWvqjNwjdNcHzHKd77cu6v5
X-Gm-Gg: AYBFou2G+z/3t87IwBon7/2GmZIWkuRGKPmDckqsljDYdDWBLEAcWY9HJAqIHl9jQu0
	JamiE4fF55ZxQ8rK1itEnZYvSNWaHZEz/pSRZ2sve3ekNaLWc6mik96icNf4nMwzBPXK6gL1Nex
	lbqRGle295Cm48V+bcJXx6/QvfPcByFBodvFBc8+HZi73uJ3x7A9+6VNKD2DegyAcW6nIaKNbjz
	eymriBX7OATURpM3NirX7i7Cy6SI5vWFgoMLtRbvO+ULdaCmvk2C4UAsAyX1YFSYXS1gFvmFl93
	2BR/pNxTX2wbdNHz7QP9RjK/k8PK1z0qAhc9LNMJPB5IUmzEqlknPeWqCePhtLF8WwGYQLFRUqD
	NypPQSu3xfrxrQWc17Nw5j8Rd928WivGApR9+zzqC8vgL4cvdAsnDqnzZBXwwtI6LLpx6V6vMo2
	XoQXK3J8GUEQBtjZ0lONB9LjHK6s11g/QmZFPmaoUkWClbSsVC3EvPaz4dsOc+Xwmv3Q==
X-Received: by 2002:a05:600c:4f91:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a17b4b8591mr25357415e9.0.1791292261003;
        Tue, 06 Oct 2026 06:11:01 -0700 (PDT)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1776cfe45sm74047955e9.1.2026.10.06.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:11:00 -0700 (PDT)
From: Andrey Misiurov <andrey.misyrov@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <andrey.misyrov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ntfs3: check split point bounds before copying the split entry
Date: Tue,  6 Oct 2026 15:10:29 +0200
Message-ID: <20261006131029.2503576-1-andrey.misyrov@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indx_insert_into_buffer() copies the split entry before checking that
its on-disk size fits in the index buffer. A crafted image makes the
copy read past the end of the buffer:

  BUG: KASAN: slab-out-of-bounds in indx_insert_into_buffer+0x49c/0x1310 [ntfs3]
  Read of size 4352 at addr ffff888172fcc760 by task touch/970
  CPU: 0 UID: 0 PID: 970 Comm: touch Not tainted 6.12.88+deb13-amd64 #1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x110/0x1a0
   print_report+0x237/0x77f
   kasan_report+0xdc/0x140
   kasan_check_range+0x30f/0x350
   __asan_memcpy+0x33/0xb0
   indx_insert_into_buffer+0x49c/0x1310 [ntfs3]
   indx_insert_entry+0x14b/0x480 [ntfs3]
   ntfs_create_inode+0x2016/0x4b20 [ntfs3]
   </TASK>

  Allocated by task 970:
   __kmalloc_noprof+0x349/0x6c0
   indx_read+0x75c/0xc20 [ntfs3]

  The buggy address belongs to the cache kmalloc-4k of size 4096
  The buggy address is located 1888 bytes inside of that object

Do the check before the allocation and the copy.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <andrey.misyrov@gmail.com>
---
 fs/ntfs3/index.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1899,12 +1899,6 @@
 		return -EINVAL;
 
 	sp_size = le16_to_cpu(sp->size);
-	up_e = kmalloc(sp_size + sizeof(u64), GFP_NOFS);
-	if (!up_e)
-		return -ENOMEM;
-	memcpy(up_e, sp, sp_size);
-
-	/* Make a copy for undo. */
 	used1 = le32_to_cpu(hdr1->used);
 
 	/*
@@ -1913,13 +1907,19 @@
 	 * that (PtrOffset(hdr1, sp) + sp_size) exceeds used1. Without this
 	 * guard the u32 'used = used1 - to_copy - sp_size' underflows and
 	 * the subsequent memmove count becomes a near-4-GiB value,
-	 * triggering an out-of-bounds kernel write.
+	 * triggering an out-of-bounds kernel write. The memcpy below also
+	 * reads sp_size bytes starting at sp, so the check has to happen
+	 * before it.
 	 */
-	if (PtrOffset(hdr1, sp) + sp_size > used1) {
-		err = -EINVAL;
-		goto out;
-	}
+	if (PtrOffset(hdr1, sp) + sp_size > used1)
+		return -EINVAL;
 
+	up_e = kmalloc(sp_size + sizeof(u64), GFP_NOFS);
+	if (!up_e)
+		return -ENOMEM;
+	memcpy(up_e, sp, sp_size);
+
+	/* Make a copy for undo. */
 	hdr1_saved = kmemdup(hdr1, used1, GFP_NOFS);
 	if (!hdr1_saved) {
 		err = -ENOMEM;
