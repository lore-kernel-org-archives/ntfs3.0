Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832E39A7E7
	for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666652; cv=none; b=OoVKsUc3fL3FufJzSptnSGvlhayqrr4NR2pIrzNkKLxNYv0f/wa2O4NJFovu4tF8beEJu6ak0D/JRr2XaQKtabS46skR9b9o8J7K2b1zC+GGupI69QbanFPvzsUIUcij6O0oq/G8eez2PpuzHNtcDJginvzTfxAq/8pAx2qymA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666652; c=relaxed/simple;
	bh=9w6nTAHB8G5P+NtmTJepYiRl0Ypkzk1jCmGQQ79jht4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+D5u3YAZ2hTdJplcBdU9E5822pEDn3lrY2RF7zX0r1sGJWwIqlAiz2jyUnCSjo9Zk6OVawH63DKQKiQ1URE6JyhGJaffbfqF1SuFIoOHAcmb8IZfEBwL1Iv65ZGNqycHlxC25AUlDd3ImPqnXjdV/61sVIRm+x/01Ugtlpvr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7W7fDF/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7W7fDF/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-881269371acso292338b3a.0
        for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 00:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666650; x=1791271450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jh7IxIMeGWVcAIbqfyHopn8hAOw8pMEoVf8MFSMNyOc=;
        b=o7W7fDF/cd/cwY4MDnU/kNLHmap2RHeHAZ029pEUz3nfugn4oZpoo5l9bAfa/XhiQZ
         0C5bUz9NxEE1+CcEgdSRh2lwXPspJXg8UVKjR4UGOdp9kTqgArFyIymeAVe604OUW01A
         n/YOKXzLMxhT6GbAISW+AFz72LMdiN3s/NhsMHHTpH00It2RfDzta/Hz9hm6H2I1iymJ
         DXl3Cd6REAvuB7hColoUbrf9r/Wxey2BHOwFhOmKaI4XVR4W/AUhVZNQFK4LNsXetS0T
         uiUq8YASidyi47q7f9ll0Rj4m/ASEVMiBH+Bc1agzDDShxqAsC5XRRW2c6z9ojUWWM9D
         yYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666650; x=1791271450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jh7IxIMeGWVcAIbqfyHopn8hAOw8pMEoVf8MFSMNyOc=;
        b=lY+nE2l+1/snOToURXkbYIE9TwpcwnfWoMinOhcXfVByoEOQWT4reBj9FYk9j73kEY
         ldwaUKlVC9biwK37aMOhs6oQ7PuGojUigyq439O5PuSkcqm7Zvoi2jymZfyGlVKlX5pK
         CnpsuFUrQ5lrwb5P/0ZNN0kNabeKyPqCFiSJhZOGjYZ/kV+ZSYIxek2deaCEIGu+j5ad
         aWGVh1qlQ6ZACl81uIaTRGyogrxy4MRdApxyXoTQb/YKxX+eWzIdRGlnR4QoMfuGYTE6
         RWKfaWtmPjqIv/dhvm6KBzQXIDa5p8+OrbzFV7VskQQ0cKkUySrXgdYSXuJOWu8AUnCN
         D1gw==
X-Gm-Message-State: AFuF++mH7H+/HNiQ3VF2oEwKN+xpuRwv2qu93IaIoF3Nk52rvCuy5Y+O
	+sgZL6uevlMYSxXonsEBhk0OAsP+BCBiv1PdwN1ObnW9Poi8zsbkNKEs
X-Gm-Gg: AYBFou0MTornf++ZTZ/p8qh7RHKY/gkz3SaKOUarAUKCj3wB1LZM82Lb5LbYcLKD7t7
	63hn+RH71XMIE2lr1jUClYfS8AxhrQcox99VLBkYyB7SSRThSWjLYIBYlyhHW//5scRV9Dn7itg
	WqH2DxVejpMvoRDy54D1RJu4scGrEA6UyMCsSxGlhWlN7Hft8MQr7jmp84p71jmoJINtLH7BQWy
	ExTNGVdwkplXEw3cEu31ZKKK8L/kn2uo5dDsZznE+KX9nDFVFvMGiMNNOmZBqzLt9xeiY1LwodD
	Fnrld0ODWboY1hhcf9oXhkzJcfngSRb6gtLbLFqIFZLM46H7JrJJ3rfi7Oa2RJlGzXsdiZgxIk6
	0zIvtZwA8LUcaGKNn5vPPk9h9pOAAvABTcN16rCjZu1MU754SJ98ZRb7CcqKSTxZANMGLQ8UlPV
	lroRe6wCYDIws29YBEUbndUab/Vik4O8XBaQjIXIoOTARQe1nMVJT9T/PYF5t6YFsLllTBpw==
X-Received: by 2002:a05:6a20:a104:b0:3dd:85ba:acd with SMTP id adf61e73a8af0-3de7ce947a7mr1379360637.32.1790666650250;
        Tue, 29 Sep 2026 00:24:10 -0700 (PDT)
Received: from gmail.com ([106.16.239.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a4b03082sm3483547a12.11.2026.09.29.00.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:24:09 -0700 (PDT)
From: Xue Boyang <fuchen.dust@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xue Boyang <fuchen.dust@gmail.com>
Subject: [PATCH ntfs] fs/ntfs3: fix out-of-bounds read in check_log_rec()
Date: Tue, 29 Sep 2026 02:24:05 -0500
Message-ID: <20260929072405.61860-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During $LogFile replay, check_log_rec() validates the alignment of
redo_off/undo_off and that the record holds the fixed header, but never
checks that the declared data window fits inside the record:

	if (le16_to_cpu(lr->redo_off) & 7)
		return false;
	if (le16_to_cpu(lr->undo_off) & 7)
		return false;
	...
check_length:
	if (bytes < lrh_length(lr))
		return false;

Every consumer of the window reads from (lrh + redo_off, redo_len) with
no source-side bound: the analysis-pass OpenNonresidentAttribute handler
memcpy()s bytes_per_attr_entry from lrh + redo_off into the open
attribute table, and the redo/undo passes feed the same pair to all
do_action() memmove()/memcpy() sources. Since redo_off is a raw u16
taken from disk, a crafted log record makes the kernel read up to ~64K
past the kmalloc(log->page_size) page buffer holding the record.

The destination side of do_action()'s UpdateNonresidentValue already
applies the equivalent bound (lco >= cbo + roff + dlen), so the
invariant exists at other call sites; check_log_rec() is the omission.

Reproduced deterministically on rw mount of a hand-crafted $LogFile
(QEMU x86_64, v7.3-rc4-0094-gf49a343b305c, CONFIG_KASAN=y): a single
RCRD page with an LfsClientRestart record followed by an
OpenNonresidentAttribute record with redo_off=0xFFF8, redo_len=0x28
triggers the read on every mount, no race. Multiple records with
different redo_off values were verified to select the read offset.
The KASAN report of the triggering record:

  BUG: KASAN: use-after-free in log_replay.cold+0x3b12/0x4251
  Read of size 40 at addr ffff88800420a028 by task mount/71
   ...
   __asan_memcpy+0x23/0x60
   log_replay.cold+0x3b12/0x4251
   ntfs_loadlog_and_replay+0x2cb/0x300
   ntfs_fill_super+0x1375/0x22d0
   ...

Both operands are u16 so the sum cannot overflow u32; with the checks
in place every consumer reads inside the record buffer itself.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS3 filesystem")
Assisted-by: GLM:zhipu-coding-plan/glm-5.3
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---
 fs/ntfs3/fslog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..498f63da2b96 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -710,6 +710,13 @@ static bool check_log_rec(const struct LOG_REC_HDR *lr, u32 bytes, u32 tr,
 	if (le16_to_cpu(lr->undo_off) & 7)
 		return false;
 
+	/* The declared data window must fit inside the record itself. */
+	if (le16_to_cpu(lr->redo_off) + le16_to_cpu(lr->redo_len) > bytes)
+		return false;
+
+	if (le16_to_cpu(lr->undo_off) + le16_to_cpu(lr->undo_len) > bytes)
+		return false;
+
 	if (lr->target_attr)
 		goto check_lcns;
 
-- 
2.53.0

