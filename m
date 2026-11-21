Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263866;
	b=nqCwLhNSwYwR+Kt7UeoiIWdGlBpVLyUxIXX42A7MjHOtZqolmTiFJ/DmoVr7uNesd20q
	 u+OX5fC0p349ZtBq2GwTfCvC0mvQxwg1hBg9+oJX19OOfxtBi5bjB5xIjKv28ITMuulav
	 UQsm7s7Mama9vP02Hn4LK/XhDUWyXYnoGI3Uz6qC7tGPfdhe+ods6bVWsz6NvzC4i3r7h
	 0qCXDZo2lz2nfuK/MeNj9WgH9P+ypuQ/uZ9rVCDpcfhJGh2m1RQotInSzqJeVKZ2wYhXa
	 vARfjr8hzd4FIdENQKfStGsEiTah2K6V43e1xKFxFnUtHb9CGdKHweONVw1TxuPvKVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i6Qv8wZdxu9JFYsmpOYL26yXLDHBJkV6sn6Hsg9cqy8=;
	b=XFFNAOULy++gEp35RzDVm8dVIiLLPI42xw0qD1lxb75BK6eMNq5fj0kAIOC+5fKsqdOB
	 cJWBY58y7ouabFssgwKecoaniFIL32Frdc5r2SqMgIVySBWSrpedjK5FMtKIUxNFPFXz5
	 SAvNg4wDYemTV7iHxvn+U7G5Bi8A3/IUru6/rRYqGEJFZ0O/LLQRN/eGYT4pp5kijzRFs
	 vmDlHGf66P1b5/W8lFty9D0SyD9S2A5txDjTdxL4e27LryyiwVTju0p1pHvR4yLjOQ6sq
	 ERC5Gwy5Yr51u56F2ASlChR81urI2uD+CG39SU9UsR9pxxMf6BG2yzqHcf/HvzcQQCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osu0ju4z;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C5606A332
	for <ntfs3@lists.linux.dev>; Sat, 21 Nov 2026 12:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC6C5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=osu0ju4z
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso3788342c88.0
        for <ntfs3@lists.linux.dev>; Sat, 21 Nov 2026 04:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263865; x=1795868665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6Qv8wZdxu9JFYsmpOYL26yXLDHBJkV6sn6Hsg9cqy8=;
        b=osu0ju4z1R7YjSvE177IedbCXeKi1BHzDgvUctem94cdRI+psgVNIp6Z6mZgXJCBXD
         MzrsPOhq/MFU1YzSQA0gF+2XHtjybP/2je1Sk79WZ+a+C29NFaNhV4EIVWkr64Iv+0nE
         r0QwoEr0WyvxclxYEym+6rSEN7a4mbeazcWJFgIVXCoiedrgISHLTaQP7sFnrKle5HFH
         YZAeOQEEP4tahph5j0somVdHKxYtudTxZ+5TnI7UcCB2dhBvMUuSlPNACxyE3pAk5rEt
         cd79r+GAnidZp3OMJpi6QfRCklErr8wta7zgEzxN1alWkHnfPz3JLfsNa5Gmmg1VYad5
         CDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263865; x=1795868665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6Qv8wZdxu9JFYsmpOYL26yXLDHBJkV6sn6Hsg9cqy8=;
        b=ab/PIo3FujY1nhd9MIeXshWABGLZZIvNgaWAdWFgmOXbnwzfyLcGkhMoSZND4OvCE3
         eO2sEOW0rdAvCwn32SqktPtHu8BLNrCx4EL9qow6xOOFWaw22Bt5KMekacndI2kTPlE9
         4ELukB0YWxvNf8W9WpBPoE7Xdfl/ypj68kLiCJEN5d1FEEoZXVwNXi4xPeb8nnk+1Hpe
         Jx/vjf7EgS+Zbb9VAUYqlk55Lil4sSakEKnegqdYFOSLl796U3FnVji17pdcJwd8m6ui
         KIHj0neVfXoDBxQ2Q6oMzvbFoHcUezEFNl2KPgpg2JF5zaM7yN4ztI7wmQFQJewzL213
         Uhrg==
X-Gm-Message-State: APuU4Z/YMCKOGVZ+v0MQBVnZWDR0cH9K9stLv9aOfpT3LA6wnCsPAeBC
	i3g7ttoG+K5NxXCETMymORoxahod6xLfKXplFN02H4NLrDeftloqwyNZ0a5b80D7fjwpbw==
X-Gm-Gg: AZFdTZeYdIOyf7jyQYyCetP9lOvtbk+KkwFf5wSuTVjbDazM4chCDqJXV1KcVlAZzaj
	FHVMHG6zxp2fJoafFhKa8g6Lu1Y4nzFfbuLfCk8iJoudBiYR8NJOysvNRCFh5BMssk1Ks8A2SPe
	X+EKNNA+NMC6Ln4qMhQt4cKRwiR6X87xZ7V99vEGrSASqrfgMhv7u7uiJgYNe5ag/i4ovHZh77s
	lvJq8VvJwAE17uwAHQwz5JhSNwgPcvID3cr7CWS9VN8bvgY41l5x71c2QF8NlDisMKZydtqKKmx
	JeCw4c0mSrKpaIk+uee0Vze5zPxwk+E1nJJKuRj/hC9zx2pP0+7qoWZlsbs9pfqOQ0ZLIR91nL7
	LffC6WDDkNIV3imPB6SQwXyZyQMtNxFb7jhuYCxduZ3tnGaPz6UwUd1vuwat0pXYH4QyeM+oa2M
	8HRmcWcvoOUHHETu46nYsiP8ym9riaObaROfyvAusHg6lTX0gl/fHGSL6Z96B5nSQg22TyRIL7k
	dZ0ogUwJSrkbhcD8F3E4aRQHrrBw2Q2w5jiInxcx6jTUkvkPRLYAKkxpYiefP+9KX8ryoxx6CGh
	RXLFMqo/mo39EH7qJQWxoEyicbcXb90SoWsJCa7ZqmItuWUg2iPJXmh/aupBiqJ1SqbTteU4Ckc
	84QG1M20EK7adYKDce43Zi4im
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr6730337c88.32.1795263864702;
        Sat, 21 Nov 2026 04:24:24 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:10d7:e30e:302e:83a2:5a33:afcc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm14733690c88.6.2026.11.21.04.24.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 04:24:24 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Tanuj Sharma <ertanuj96@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] ntfs3: fix out-of-bounds write in do_action() bitmap operations
Date: Sat, 21 Nov 2026 17:54:17 +0530
Message-ID: <20261121122417.72854-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <2026112132-spending-smoking-5e7d@gregkh>
References: <2026112132-spending-smoking-5e7d@gregkh>
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
Changes in v3:
- Fix coding style: move bmp_limit declaration to function scope,
  remove bare blocks

Changes in v2:
- Resend with proper formatting (git send-email)

 fs/ntfs3/fslog.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..373d84545a8fe 100644
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
@@ -3751,8 +3752,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
 
@@ -3764,8 +3769,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
 
-- 
2.43.0

