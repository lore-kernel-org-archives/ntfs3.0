Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415098;
	b=zJ4KTgKbbNU3of/XOFHzNoRHoZiXFdseAEWB3uVIlSvetifgQEWKuKvhnZfsXrbVYfaF
	 QuPPQCl0qFWjJjOuT7VgsIx4rRAbJMu1I0FkjTZdd3FZSylDciLtYRO8uYcBULMzm3hOo
	 idw9wo8lYjvj5EU8MofPNHsrvXZmPQE+50zPJw56fGC0REHFW+uUV5lgyRI7Eucye1rjz
	 uj8CoANhs9sMSBsaIVhmGW53p3IJ+j/AHTInsuMFlLO+HT/6l6IBmrB9fBV2M1+DP+AOA
	 MSzTHkPDeqMlvDGNt1Q494xLXXnqRXV/i8v/1nnP6yP2JSZ5NIFTREJlXLVZrsUljGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dFdEqFiacjVlyhuruK5DmKXl2N1tqCNj7wsKhuFYg58=;
	b=LREo4SmCxywavfItPC48vVKKYgR9huH/HesLPcS/mFWqu9D/eG4x/dzJcC57rHKKH+f3
	 KV8kmS9xAm3+D1IKvXpP6ApkHM8OrR1WPxqS7wjpHYUdImsIPhIS2Ph39KnAxZu+cwWPe
	 /yyvjH405uWhzWZKDjZ8DkAqdK9mhqnRlehW/4hTG1+jsjOh3xxc+LV9tM0FfPj8FAj21
	 vmlklus5WfkEQdsvyYQR3UIAtu7WT/ikVGlsNv3sA4zyyFdR0RB7dB50HsYO7+j5UxPLd
	 ZKbh8BaCHW/r0Mnav07IyLGio5eOaRHIugbH8Szm5S/wMVkjOKaKALdJTzOvLN1xhJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeS+z9t+;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776AA606A331
	for <ntfs3@lists.linux.dev>; Mon, 23 Nov 2026 06:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 776AA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeS+z9t+
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386ab9ab619so1556189eec.1
        for <ntfs3@lists.linux.dev>; Sun, 22 Nov 2026 22:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415097; x=1796019897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFdEqFiacjVlyhuruK5DmKXl2N1tqCNj7wsKhuFYg58=;
        b=JeS+z9t+TqYqjGqboP+ureSXbBdmNnX1nhJuL8yVkXNz4susYDVqk7s0byKN59+x2v
         q/st9CiMyULD8K4kP1rVWO5BEORFi1yh5oLSw0MC/27dOdZLh45SYsXGL2mZwVF8lTYm
         NysHryDXQsMxnfvZTMssrMhpWoleYF0htb6RtfzpeW+HziTfxqSCkY9a/WrM3GSKtdg6
         EiovOcnsJlJT9No8QR2nN1EhEd8xEI5Rvll1JeQHQLU3/q3R2w1f41KLvmtLbtQ3Z9GZ
         /jVpXwe/eCR+Ji85HXRZJ5ME+MB1csaAqGJux+r7QeFj649FmJgnNcYuxFHMRVlT85CG
         LeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415097; x=1796019897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFdEqFiacjVlyhuruK5DmKXl2N1tqCNj7wsKhuFYg58=;
        b=Kq9yHfc65Kxnj5VlXhNzN9FGZP4C6qXUXNs34SYBRa8PnJ6HSDPOoHE7tfvwZhgJI3
         sXea5Nt54jgfmp0lrPGSIe4I0Lm29hBbGx4DDy5xoRADFFx3Y2m1HuLgKZf3eCsfzQeG
         z2IvucDG79bowdMNrtI145I77AyzJeqdaduj/LjiJDwLAAknkvG9qXBxIT4B1FPufnZi
         G7AfcHR+AKp7GFAIODvFTxs72BzLRUUDwBZb0P5DBggKOQ4nRbWDDLjW4LYcfWOD//DL
         VB9vMGfI6KQinGlF4X1jxyjQ7zL8pqH8WLi2/Yezz81qL2aGdSHAyv2WFqncg/JiZW7r
         a2Wg==
X-Gm-Message-State: APuU4Z9T1hw6dadhe83tIUyzJ2/99kMWVzoPUL0qc+ITEN7MseZOYIPu
	e9M7cv0mrJM4R9BwSrumTVQ/VrZZAhcFvXji/hxFIxHHYNNTqW2z2JHW8BkyW/eYwaA=
X-Gm-Gg: AZFdTZf+Mp17wV/4af0Y2fJz0nL+NJUDW7j+FQy8D6/WBLyFXBCl641WLBMboVmzzsG
	i4X0ZyM/uLrfA10SyJ1zajfVeNMnUL/fVfT8sVsB660DJJ7SWfGBDtQ7IxqA9mKyVDnz1Pfmkhz
	e8nvQRiDVGkvA7sEJwBXpPqmNBJDDdMcnS5O67iYXta84MwyTJV83mURlFX2q/xr666KwpvqE0m
	ohtmmbfXhpeJHB+UKFrod/Cmpnu+TaR45DDya0HPEHpB/zn9d758Wt6+mH22GAAt3hNxJlPtTkc
	UCD3+rf0tEx+w0m1wivcmgKJdDMMJjkqAupdx5GXbggBwWxLONKC3m1r+djtJoweQG7jrraiQv7
	7HYQpQ1HzQVuhZ44hTU69oisAbW0wXA1RoXDqTJPlExIHh8diUQfOACkieQPgFbTkifUQTudfhD
	TJqoVBzeNqZIf6Zrz3KJcGQ5fWTHGNFxeIp9n+kxr8wl6I0HwOL3LdX5cJbiWtdBcylIkz1FzrI
	Kd4hFL9MJOosT4Y4KxMMoxMcZP2AgQLaga3BXhrazj3v/ujMvKQ1B0gP0iDYtXXCw+Bqdslg30+
	xwcsd7gWfWpgp62mNJE4GUPAMYlsczV6oshIvW+fSLUcMJXBDOyGVpP9WjO9M8bxVG+H+bD/vFB
	r2MAHMgXOmr4OvvTfJA==
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr12905314eec.22.1795415097415;
        Sun, 22 Nov 2026 22:24:57 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:2009:6412:a5f6:d81:c3c7:7d8b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm55987369eec.3.2026.11.22.22.24.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 22:24:56 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Tanuj Sharma <ertanuj96@gmail.com>
Subject: [PATCH v4] ntfs3: fix out-of-bounds write in do_action() bitmap operations
Date: Mon, 23 Nov 2026 11:54:50 +0530
Message-ID: <20261123062450.5153-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <2026112152-delivery-synopsis-ada7@gregkh>
References: <2026112152-delivery-synopsis-ada7@gregkh>
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

In do_action(), when replaying log records for ATTR_ALLOC attributes,
the buffer is allocated based on bytes_per_index (typically 4096 bytes,
kmalloc-4k) but bitmap operation bounds checking uses lco -- a larger
value derived from lcns_follow << cluster_bits (typically 8192).

This allows SetBitsInNonresidentBitMap and ClearBitsInNonresidentBitMap
opcodes to write past the allocated buffer into the adjacent slab object
when processing crafted NTFS images with malicious $LogFile records.

The bounds check compares against lco (the full LCN extent size) but
should compare against the actual buffer capacity. For ATTR_ALLOC, the
buffer is only bytes_per_index bytes, allocated here:

  if (attr->type == ATTR_ALLOC) {
      t32 = le32_to_cpu(oe->bytes_per_index);
      if (bytes < t32)
          bytes = t32;
  }
  buffer_le = kmalloc(bytes, GFP_NOFS);

But the bounds check uses the larger lco:

  if (cbo + (off + 7) / 8 > lco || ...)

With bytes_per_index=4096 and lco=8192, any bitmap_off >= 32768
(byte offset 4096) passes the lco check but writes past the buffer.

Fix this by computing the bounds limit as the minimum of the buffer
extent (cbo + bytes_per_index) and the LCN extent (lco). This ensures
bitmap operations cannot exceed either the allocated buffer or the
on-disk extent, and also prevents a crafted bytes_per_index larger
than lco from weakening the existing check.

Found by code audit and confirmed with a crafted NTFS image that
triggers the OOB write on mount.

Cc: stable@vger.kernel.org
Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Tanuj Sharma <ertanuj96@gmail.com>
---
Changes in v4:
  - Removed unnecessary braces around single goto statements
 fs/ntfs3/fslog.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..0f83e4e8dbb9d 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3125,6 +3125,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 	u16 roff = le16_to_cpu(lrh->record_off);
 	u16 aoff = le16_to_cpu(lrh->attr_off);
 	u64 lco = 0;
+	u64 bmp_limit;
 	u64 cbo = (u64)le16_to_cpu(lrh->cluster_off) << SECTOR_SHIFT;
 	u64 tvo = le64_to_cpu(lrh->target_vcn) << sbi->cluster_bits;
 	u64 vbo = cbo + tvo;
@@ -3751,10 +3752,13 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit)
 			goto dirty_vol;
-		}
 
 		ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty = true;
@@ -3764,10 +3768,13 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit)
 			goto dirty_vol;
-		}
 
 		ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty = true;
-- 
2.43.0

