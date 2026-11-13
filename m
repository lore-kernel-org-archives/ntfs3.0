Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588371;
	b=e1Eoh8dtV+TnFK0QXFPlsnGlCa6TzHLpv4KN6knkUi6Rk6ZLVvVtL/KTMAJtdSbTy1Tg
	 EMr8+IiyP1CF0a4/9iVRLJ8EnUKf+qjbs3EhlAVUt6h48BAuneSInfXU/tu+VHwfVYcWn
	 ZNb068XDwyyxoOu/sj7q5uu1e583ag45jtJVH8Z9bhx/eCsoYS7chjxZPViigO3DMwRqR
	 DMdfh4rHh3JZS9nmyPXt3A7PlMhPgjugmyEYkW05vmM05mDZMLpiSWxT6Ji68jIM8Oxk3
	 Wj5UXSl26oyesbBoNx48W7Q5Tg33vMqE9zvvX2kAjbtuRjQ4BreYNAuwtMe6BQ7V4Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7adDJu+xJ9rJRwV/7K7rSG0s5vC11B4S7V3+Mb90FEk=;
	b=BpZHM5pZOP1PSlJv1CYonsIVFGhk+/R2cZpjs7teUVZU9mtnw3PsRMb8JbugDTHC5QS/
	 bZxZ6I3zCEVEM7Ef9JOO8NkgQ5d5ewlW9qF7Q8mpUuFgT8MUVmjwgK5E0FoLVzjVny9M7
	 YYyaaEL3JwZfnOwSHz+nnJFClYRtgbxEdcR0GsoS2KhK31xCYIxSBKqLs6CdY6sf8K0wX
	 bsMmGCGecuiCVKTZG5aFEvsfC2Rnz/S6ReXSd6zIJOvS/s16WqcivQHiFta9aXG3vbdtM
	 GXiJBacE5+HT7oonyCNiFeaO1jlmJrbDaSUXkZOoderYXcTbQ46vH1jsBFyVb3BPKlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mWQ8mAwC;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E88F606E217
	for <ntfs3@lists.linux.dev>; Fri, 13 Nov 2026 16:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E88F606E217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mWQ8mAwC
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed28bac8d7so5588785ad.0
        for <ntfs3@lists.linux.dev>; Fri, 13 Nov 2026 08:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794588371; x=1795193171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7adDJu+xJ9rJRwV/7K7rSG0s5vC11B4S7V3+Mb90FEk=;
        b=mWQ8mAwCW2LaajgpQtD2ZFYYwS9XFifpkxa25bhf1g0TWWTENpiFzWMwROkMZHlrAV
         C9FgUsDcBzce9oPRVqyaCZEkoz+6/VLVDRYsqZDAEaZ5hUhNyXbxkCZu20JSs/Xt5mDy
         fjZLROKTAj4XmUrY0BZFdFMqytHf1c1hcVYMD6OhC5UDSasaqIVhlFd7u8ObAvPdooqo
         TgqUnfLF1MNxJlxzWzgsOXj6WcvL8ha47GG1jP/2HsdVg+lNrn0VFeS3M5BLEVs6YK9L
         EJyjCMm+BOjjdywJYGAj0kpVXA2ZINb5KGELxOK0aSqaWBbiZ97ishSIw3nFUEdAKP5P
         SlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588371; x=1795193171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7adDJu+xJ9rJRwV/7K7rSG0s5vC11B4S7V3+Mb90FEk=;
        b=zU1TNUVbyuNb5+3ktWvHorToIb6EWg+2k0+IxyrBYOycnPK6w10MSMYP6jA2PvLPbm
         2MGN3HGoJS+FiL4jhfgydOenlSJHt04toAWS1wgwjwjN/OQYlJVWK5h+AoC05Nwt8m7f
         VPL4pevhPteZWKXWlBXGeXye+9bn/z3uGjpWUp3Ckn6qxAtp7DDUITVwKhNwkcbz/l5V
         V49SN0u0VOQBsPFQGJ/XSjBJNqUrvUKQHzKvTAl6fofjMLZ9IlmVM/jZDVEatLY2uPks
         sfq5QSjLU+S4K+mHW3TC+BLEN3Pd6KH3E0P0IEu5BQbEOYSSAweIiIT8jeT/IAf8MQzS
         YKow==
X-Forwarded-Encrypted: i=1; AL+hErHmc1LMxhJwUPK6oUcUkowFtfbCXGKXwCYPmvNSV6INUL/hBZzwX5SjAApoHZx5CnKiaaCkCw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8wKGrd4ZBfr0UjiQx+jdYfz7pG4rbVtBIX/IQDRvnjXZcE56sC
	llxZXqCyU4K76TMi6WG/gWdnbOH472j9LVJfiYITSkfXfhf21oinP6x+
X-Gm-Gg: AYBFou0wDYodbjGCVE23YQB79tH7ZfX35bOXOgEAomLyAr2foiy2sAxNpwbAYoFV+6N
	fE6NZA2FAdnIUmyyz52dPW3LwhXBIEJUD+iAsI2Dm8UXR+wsE5liomJkLKncNKW5IsS+bikWlH0
	nL47b6iGpnNxF/nFC84dY3MWqTmV56TrophohA1x1RZxQGM3cTC3ifvEiX9Bw2z3Ou20CtQQq+F
	wZD383QrPWva3uR/Pq0wPrOJSo/0CeWE1bsjSGvZvrIEI4aRgjLKRM6G1yQ924LB7nrphFciNZ3
	XMxnhkgI5Wf4SmNUbi+h+BmDyjN1iGJIMc9/+JG6sVahnExJleuVpOgrhlSuE4X3t+Trn17N6kL
	/NzLqZHUg8NyJm+7qjvpN4k1zHMcFez/37YKmam2hfuFNZbaSk0bjSuv89IaOfCc6olAp+Bg+DE
	IduUCoBDMr6VncaUvQ6TY8JjjCoQ1JPgKimxbW9l5vEZPIsuPv49OUEb+Fwy1wvQ+kF6xZEUmi2
	GlM8BFZ+HRjkwXy+btA5V8ab+N/T524RJhU4Wy64qZITcuEZfiWDTUDmj6j9Lf8hf2jAd/6FP1B
	zZ7a7xH9UHSwe460WgGu5ez2i+u+Nyp4j++TPIaWgMcTY6RzPA==
X-Received: by 2002:a17:903:22c3:b0:2ea:f85d:a076 with SMTP id d9443c01a7336-2edf21c0a32mr46602165ad.35.1794588370521;
        Fri, 13 Nov 2026 08:46:10 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868231sm12908475ad.50.2026.11.13.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:46:08 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: validate dlen before copying filename dup in do_action()
Date: Sat, 14 Nov 2026 01:46:04 +0900
Message-ID: <20261113164605.782979-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In log_replay(), data and dlen are derived from the on-disk redo_off/len
and undo_off/len fields. When handling UpdateFileNameRoot and
UpdateFileNameAllocation in do_action(), the code unconditionally copies
sizeof(fname->dup) (56 bytes) from data:

    memmove(&fname->dup, data, sizeof(fname->dup));

Neither handler checks that dlen is at least sizeof(fname->dup), and the
generic log record validation does not enforce this operation-specific
minimum.

A crafted journal record with client_data_len=0x98, redo_off=0x90,
redo_len=1, and the multi-page flag set passes the record range check
(0x90 + 1 <= 0x98), allocates a 152-byte buffer in find_log_rec(), and
triggers a 48-byte KASAN slab-out-of-bounds read past the end of that
buffer during a read-write mount:

  BUG: KASAN: slab-out-of-bounds in do_action.isra.0+0x353f/0x83c0
  Read of size 56 at addr ffff888007d9bc90 by task busybox/67
  Call Trace:
   <TASK>
   __asan_memmove+0x23/0x60
   do_action.isra.0+0x353f/0x83c0
   find_log_rec+0x277/0x500
   ...
  The buggy address belongs to the object at ffff888007d9bc00
   allocated 152-byte region [ffff888007d9bc00, ffff888007d9bc98)

Validate that dlen is at least sizeof(fname->dup) before copying in both
UpdateFileNameRoot and UpdateFileNameAllocation, jumping to dirty_vol on
a short payload.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
Notes / Reproducer:

- Tested on Linux 7.4.0-rc2 (067c5c24cef2) x86-64 in QEMU/KVM with
  CONFIG_NTFS3_FS=y, CONFIG_KASAN=y, CONFIG_KASAN_INLINE=y, and
  CONFIG_FORTIFY_SOURCE=n (patched kernel mounts cleanly with 0 KASAN
  splats).
- Note that previously posted patches bounding the destination index
  entry or checking off + len <= client_data_len do not catch this case,
  because the destination entry is valid and 0x90 + 1 <= 0x98 holds.
- Disclosure: Assisted by a custom LLM-based tool; all results,
  including the root-cause analysis, reproducer, and patch, were
  manually reviewed and verified by a human.

To reproduce:
1. Fetch windows-interrupted-1.img.gz from:
   https://raw.githubusercontent.com/antimatter-studios/rust-fs-ntfs/main/test-disks/windows-interrupted-1.img.gz
2. Patch 3 bytes using poc.py below (`python3 poc.py windows-interrupted-1.img.gz short-source.img`)
   and mount read-write (`mount -t ntfs3 -o force short-source.img /mnt`).

Reproducer script (poc.py):

  #!/usr/bin/env python3
  # SPDX-License-Identifier: GPL-2.0-only
  import argparse, gzip, hashlib
  from pathlib import Path

  BASE_SHA256 = "c45659e95104eca5f793c3f21061f42705a01783e62d1c7a46c63e4089db0b9a"
  TRIGGER_SHA256 = "0e176bdd374e73dc3f40163320d6d69bfe36fe664735a50001a3bcbcad2ec2e4"
  CHANGES = (
      (0x292F878, 0x00, 0x01),  # LFS_RECORD_HDR.flags: separate allocation
      (0x292F884, 0x28, 0x90),  # LOG_REC_HDR.redo_off low byte
      (0x292F886, 0x38, 0x01),  # LOG_REC_HDR.redo_len low byte
  )

  parser = argparse.ArgumentParser()
  parser.add_argument("fixture_gz", type=Path)
  parser.add_argument("output_img", type=Path)
  args = parser.parse_args()

  image = bytearray(gzip.decompress(args.fixture_gz.read_bytes()))
  assert hashlib.sha256(image).hexdigest() == BASE_SHA256
  for offset, old, new in CHANGES:
      assert image[offset] == old
      image[offset] = new
  assert hashlib.sha256(image).hexdigest() == TRIGGER_SHA256
  args.output_img.write_bytes(image)

 fs/ntfs3/fslog.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index bb8d40bb5869..29840814c82e 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3568,6 +3568,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
+		if (dlen < sizeof(fname->dup))
+			goto dirty_vol;
 		memmove(&fname->dup, data, sizeof(fname->dup)); //
 		mi->dirty = true;
 		break;
@@ -3753,6 +3755,8 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		}
 
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
+		if (dlen < sizeof(fname->dup))
+			goto dirty_vol;
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
 		a_dirty = true;
-- 
2.43.0
