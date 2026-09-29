Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB875218BE
	for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684732; cv=none; b=NZrw96aDCXOKOxiXQCupOtol3gVY2Px33HYK3iyXXBfakB0trf54L9SHDOhuLYeLu8efDGE1+UgpZbRxuqI034qa+vor3Bfffa8PcKyKFwKM5qssnJVVVQBU09Xtaqg/JS3yqI5Ae8pXmE2EbOGSGr+YdFAHbRkjkgwCYLExFmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684732; c=relaxed/simple;
	bh=Pj6KvNqBjDZrYnWKrO2uDDAWtlmglraWFZNgjyxk/Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOxHtR52XpcLU8BlttK0KWzTMyZ1uI7iL8PNxF85ONoYhV+gO2JRTClBneCM+mvECWijxNyZfbivrvmfG66UqfDIWG9QAE86u7cRodsRX6DdtPtcFbfCMrK/cKx2q1vlVfpjxKv3JeUx2uRLjcCtR3NiLG7Qq9Cf33cOGfZwc3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bswxAqpN; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bswxAqpN"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49bd98411so539152a91.0
        for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 05:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684729; x=1791289529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwHhpjVu6BlRKWyBSGHgYpAs9nS3uWumWH8uIhfw3wA=;
        b=bswxAqpNmew4h/FsBxoQJjGcP4c3wVTU1tSNJb/EatwqA4jGR+saQZURu1/88jNrGv
         XPerujnYGhV1EHTlvplzPhbxLFlQp7aoikHEO4EnOSa1ajLKUfN6NitnIZkRPSu+S563
         INvaLKcAXw6ZdxYYbYyhrXl9MDWTNMAteeRUuv9GgS2QSAyalqWJHq8VL6Z2SN0jUVYP
         MAyhDEwuQS0loPwjPxZY45n22KIf7wjqv28fB94WJsKO0Umt/PuwkAMB6tXV7NYVjJcN
         gkMwaWgrLmLBy/BBYx3Nbej3REB20d75tR7lO4yfy84l/DARghbrtReMV2AAROTjlVAD
         21JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684729; x=1791289529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwHhpjVu6BlRKWyBSGHgYpAs9nS3uWumWH8uIhfw3wA=;
        b=Y+owhsDJZGNR+GqzQ2ZxpKxkabrqyLv9KSqXrPn9kJawWkRdj6ZZW0DJxP040jslvw
         BRW/WemdVi+w1JcfG+2IixTmNM/s/ybng+KG8oo8kPpy+7ERRnCLwo97wZzKAzXKwudc
         DPQXUEf0WjS4/srawfvGjNaSCrL2uzyCgLsdpRzMw+OMJacxbPCHHOLfnViyDcXP5Kx0
         EV0Knd8ScTqZXElXrf7iht3vWAoqDeu+tGgFKPwbyFr8c9FTtMXxFt/DZTffTZkghv/Q
         wNd6YIPa8mrrwZKCwCFjsye+7Jw1rm3OU2ORQHG8gArK2X/pc1D2dAmPtbbQxpagY3Zq
         NSxQ==
X-Gm-Message-State: AFq9FYKrUToy68NgwCFCn4hruwvkupa+IcA3JlOPVdsx0T+JxSO86NPq
	EULGoJ/ToVGl8X9ZBxKP3xVC4zB7C1OPTWQIWMd6VAv4S0MvpfpCaLu7
X-Gm-Gg: AYBFou3HPDB+jEQ7QVmfJAfBricNtan9V335Znn76qef6ecAWbSrPNMII5adSJYZYzi
	5WHg+aWy7lIzGb//rxMiIVhbtvBKfri/YKwOqlsckqRC2NzQKKV8eGCtBl1dKMZIXT5NOPIgvlS
	FQ//afPE9zf88Oc6rb4U1YJb/bM0f39P+MwxnylKfeVA4RE7+f+QXf0SeN91fd0cA828tQY6/YD
	kHYpAxvOYNyiWVUpmP7M6uO01CJJGraJzhju+SrmSRcfAfYfuSxupDlPNdWIjE537VDpGNBVHHR
	sxUoHQtBs8znsWHNaagjGHTkkmnEuxkq5CNE2IFjRNXwHFwB6lLN2qVRP9Oix3pOSB1kRvuwE4b
	2t0Nb09YozBjsHiaByfUbXYCaqloLm0PZQmjK5csc73mZUKWCkAm7K76jyuvq7h40T5wwk5kwRe
	PBIek0BNf/Z/rk2Y95/FbtYUaMxRUvNdCNfchGw6fjBRbDBGHtWIP73msi+nMet4bzx6EX
X-Received: by 2002:a17:90b:2e4e:b0:3a0:a515:c450 with SMTP id 98e67ed59e1d1-3a0a515c806mr12143744a91.27.1790684728865;
        Tue, 29 Sep 2026 05:25:28 -0700 (PDT)
Received: from gmail.com ([111.55.96.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ebd6b0sm5442941a91.1.2026.09.29.05.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:25:28 -0700 (PDT)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xue Boyang <fuchen.dust@gmail.com>
Subject: [PATCH ntfs] fs/ntfs3: fix slab-out-of-bounds write in index buffer replay
Date: Tue, 29 Sep 2026 07:25:00 -0500
Message-ID: <20260929122500.362486-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During $LogFile replay, the allocation-op preamble in do_action()
computes the buffer size as:

	bytes = max(oe->bytes_per_index, lcns_follow << cluster_bits);
	bytes += roff;
	bytes = ALIGN(bytes, 512);
	buffer_le = kmalloc(bytes, GFP_NOFS);

and then sets ib = buffer_le + roff, so the index buffer starts roff
bytes into the allocation.  However, all six allocation cases pass the
FULL allocation size to check_index_buffer() and
ntfs_fix_pre_write() instead of the space actually available behind ib
(bytes - roff):

	check_index_buffer(ib, bytes)       // validates entries up to ib+bytes
	ntfs_fix_pre_write(&ib->rhdr, bytes) // writes fixups up to ib+bytes-2

This lets check_index_buffer() approve entries that extend roff bytes
past the end of the kmalloc() allocation, and makes
ntfs_fix_pre_write() write the last USA fixup at ib + bytes - 2, which
is roff - 2 bytes past the allocation.

Reproduced deterministically on rw mount of a crafted $LogFile with
oe->bytes_per_index = 2560 and record_off = 1536 (bytes = 4096,
ib = buffer_le + 1536, available = 2560).  The USA fixup write at
ib + 4094 = buffer_le + 5630 runs 1534 bytes past the 4096-byte
allocation:

  BUG: KASAN: slab-out-of-bounds in ntfs_fix_pre_write+0xb4/0x100
  Read of size 2 at addr ffff8880044891fe by task mount/70
   ...
   ntfs_fix_pre_write+0xb4/0x100
   do_action+0x1c67/0x1e09
   log_replay (fs/ntfs3/fslog.c)
   ntfs_loadlog_and_replay+0x2cb/0x300
   ntfs_fill_super+0x1375/0x22d0
   ...

Pass bytes - roff (the space behind ib) to both functions, matching
the intended semantics when roff is nonzero.  With roff = 0 the
argument is unchanged.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Assisted-by: GLM:zhipu-coding-plan/glm-5.3
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---
 fs/ntfs3/fslog.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ba61767cab3f..4b83a21532a3 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3624,7 +3624,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		used = le32_to_cpu(hdr->used);
 
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff) ||
 		    Add2Ptr(e, esize) > Add2Ptr(lrh, rec_len) ||
 		    used + esize > le32_to_cpu(hdr->total)) {
@@ -3639,7 +3639,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		a_dirty = true;
 
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case DeleteIndexEntryAllocation:
@@ -3653,7 +3653,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
 
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3682,7 +3682,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		a_dirty = true;
 
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case WriteEndOfIndexBuffer:
@@ -3694,7 +3694,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			goto dirty_vol;
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff) ||
 		    aoff + dlen > offsetof(struct INDEX_BUFFER, ihdr) +
 					  le32_to_cpu(hdr->total)) {
@@ -3705,7 +3705,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		memmove(e, data, dlen);
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case SetIndexEntryVcnAllocation:
@@ -3718,7 +3718,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3726,7 +3726,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		de_set_vbn_le(e, *(__le64 *)data);
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case UpdateFileNameAllocation:
@@ -3739,7 +3739,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3750,7 +3750,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case SetBitsInNonresidentBitMap:
@@ -3789,7 +3789,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3802,7 +3802,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	default:
-- 
2.53.0

