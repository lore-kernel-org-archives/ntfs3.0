Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF43E832C
	for <ntfs3@lists.linux.dev>; Fri, 26 Jun 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469459; cv=none; b=VS1d5hCEYBmYTZkCcmDVdQA+d9jylHvFeBroXdM/bmLOOw6FIdhYQ4RfQA+aef6E1oKrpE1EyZzHyiyBeB0BGLSdGSPCSSgU8gUIKlwJ9/I58PYQ+d/hSc7E6P4c9adwz0NnLEuR9eKJtFW7Fn3Y/xGHx3GJlcbAJiFjDw9qrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469459; c=relaxed/simple;
	bh=z83CdnLi5YFF7qtCrEOr+qnnMz4U3Td81HTGSmZvel0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUKX19bb+kxVM60IBOxG0lWSblSF0O/DLU4BcQ2RDbZ1dz4wENB4gHdt2GCZmQTtwegYKMVdme26IL81akK85pvnYDFu5KmZZLkPzRaGKaKJDIHATdCeWl2MnYamtiI7APnynBk1P/+HNdm4ErLgPCy1JLwI0bQkeDmuKeLEjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlqSPN15; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlqSPN15"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c944aacbaso1239268eec.1
        for <ntfs3@lists.linux.dev>; Fri, 26 Jun 2026 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782469457; x=1783074257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cdNQ71yKzqYp/ZHR9FmFA9gCxqpqHZZIFlY6KfiVT+U=;
        b=GlqSPN15LCHzhXf7x8rZs6WDQhMiY1I+RKz4tjn9LplUAz6Z58YpudzIR2L13HvzqI
         8h0NfXnR2ehcH77QylB/nFDJoz1Hf3N1onP2ZVhWQk6Rv7aNJxf4KbsdJh/Yd6/LFAqF
         atO5/gshDL8UPgq8ZlKejU58yI5OITGUrCj/yRVogpSxvTsDfXFC3OhJsCIctH466oyp
         gOCbSmqkq70Ceolh4z02QT8zleFl4LrKax4oik8B/WB6YxADxHGvslAa4jc316KDyOjp
         gAHB7cGUCLAzPbnmn2mQfLL2yHGLPmQpgPdjrJa6reI97YOELkyZ4jQm7eNlBjk8Ffuj
         sy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469457; x=1783074257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdNQ71yKzqYp/ZHR9FmFA9gCxqpqHZZIFlY6KfiVT+U=;
        b=qmDmrTZ3QZGwKeWTfClZ/F5xEqbvod24GWVlkTyt3jbDaeWbAqA1seLBahWP0ZbFdl
         cQMBrX743pg4PLgvWIeUcPOiVcuOLvw448SDSMDkSOhtNepg4gnyWthLO5tSTR2a2P2T
         a5/ej7EnE7hNm0JZkyNkNjz75I8qyacQjPxpxU++qlLgeBMOG1V0sL2gK4bHNhTnuKBz
         +jVd8XykxJgZ5O5qrN3ajGHrMCtFr3NQ6Acwcz5QhyJITbCQI7CyJCsIbjgT6zaPS8SC
         LD9ELxhb5WdX+Qa4rsMJ0YzpM+c0g9IPX97210oCxa0sWN9xOxdd27Bsg/wGKRqbIgJ1
         jj/w==
X-Gm-Message-State: AOJu0YwVE81szNhBO+DiUB9qr+FtE6JrNJboxdOJgK7Qobv3/U6hcr3W
	bCqgnts2HcG76t80GFUabf1hgh6SJq/mi5FTFYkHoCR0hhFZcXz1XXGNCekeGGj82w4=
X-Gm-Gg: AfdE7ckKypz6jFmdEQKt3JIB2tQXZrpz6qYphvkVRZ+CB+2PqBqiwwd0RGyT1RR9Bix
	1+lAUu81kE1aMxR9VauOBxLA8UFlxL18D68x4MsU/n0n4Qh3eSJzLaSxl5nZLp2Fp2QpMAPDf8m
	mo0crcdv2pLAA/DQSnfFJMRZ+CQ4LKWk7sGt8kotkijuii+/moqDayCEkkEBpaBXH/kI0R8mtzv
	Pgs0rnKIxhyLUi1v74vSB1lnWFSdVq6JEjy/mg7PHHtPpYHCEFCt7diTaHAlextFAUZYrfjzTPQ
	b9FzTkppb8DRFN3QTW9RK+0GlWHJeaEhG+5JeN8zOhYHcNivgx3NtgX/lLOkl/y17waUjGuPqId
	EZCMPDZRE96baHGvPf8nRzt/WYZUvMQZPaAWc3kOYA6jHKNpiQvDapsxnsxC66a9ou53uE/rB5p
	R+ubpUR+/TvLjPTZK5fuG9Cs7bImImOVKrAFgGqlUY7uBBVz/0jo4Hpfv5qw==
X-Received: by 2002:a05:693c:8951:10b0:30c:a62b:d033 with SMTP id 5a478bee46e88-30ca62be4f9mr420484eec.15.1782469456483;
        Fri, 26 Jun 2026 03:24:16 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm15840584eec.27.2026.06.26.03.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:24:15 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Xiang Mei <xmei5@asu.edu>,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] fs/ntfs3: take run_lock when freeing offs_folio in ni_decompress_file
Date: Fri, 26 Jun 2026 03:23:43 -0700
Message-ID: <20260626102341.1909289-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attr_wof_frame_info() allocates, caches and dereferences
ni->file.offs_folio under down_write(&ni->file.run_lock).
ni_decompress_file() frees the same folio with folio_put() without
taking run_lock. When a WOF externally-compressed file is opened for
write, ni_decompress_file() can drop the last reference while a
concurrent O_RDONLY reader is dereferencing the folio in
attr_wof_frame_info(), leading to a use-after-free:

 BUG: KASAN: use-after-free in attr_wof_frame_info (fs/ntfs3/attrib.c:1619)
 Read of size 4 at addr ffff8880120c9000 by task exploit
 Call Trace:
  attr_wof_frame_info (fs/ntfs3/attrib.c:1619)
  ni_read_frame (fs/ntfs3/frecord.c:2421)
  ni_read_folio_cmpr (fs/ntfs3/frecord.c:1916)
  ntfs_read_folio (fs/ntfs3/inode.c:648)
  read_pages (mm/readahead.c:181)
  page_cache_ra_unbounded (mm/readahead.c:292)
  force_page_cache_ra (mm/readahead.c:364)
  page_cache_sync_ra (mm/readahead.c:573)
  filemap_get_pages (mm/filemap.c:2688)
  filemap_read (mm/filemap.c:2806)
  generic_file_read_iter (mm/filemap.c:2994)
  ntfs_file_read_iter (fs/ntfs3/file.c:842)
  vfs_read (fs/read_write.c:574)
  __x64_sys_pread64 (fs/read_write.c:773)

Take run_lock around the folio_put(), as is done for every other
access to ni->file.offs_folio.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/frecord.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 2b49bc077558..b11961a1f8d8 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2148,10 +2148,13 @@ int ni_decompress_file(struct ntfs_inode *ni)
 
 	/* Clear cached flag. */
 	ni->ni_flags &= ~NI_FLAG_COMPRESSED_MASK;
+	/* offs_folio is accessed under run_lock in attr_wof_frame_info(). */
+	down_write(&ni->file.run_lock);
 	if (ni->file.offs_folio) {
 		folio_put(ni->file.offs_folio);
 		ni->file.offs_folio = NULL;
 	}
+	up_write(&ni->file.run_lock);
 	mapping->a_ops = &ntfs_aops;
 
 out:
-- 
2.43.0

