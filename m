Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963B370AF3
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209695; cv=none; b=s1MT+rvOzYBCGxxNiK1d4iUb6aLrtuhJk/LUbaDPOeR5EvAXsC65P4iPXT0F330HIzAoE38xs2FaxARGT6VTGGDKRACklCeHyIbKhO5+dSbd2ECOOD9pQhTF3l/eAqawUNNzVpyZE8Od2TQnMwxLwJae/YbFyjUTRIjpH+C36/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209695; c=relaxed/simple;
	bh=Q7d5IICTvnzfMseKwelv4deozHwF+eOxcRD2Mr1z6Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZWbGGAzYagx9zOuaQbOk/YOMW3opvOll2PyL0CNq31t45qeSEv29JPSTH4lSJkYtc6qcJfvFKcEy4XWnO4WLMPgvbSGvpKs0clK24cANw/l5XHU4tf3vclWnFHAZQXj212hSDH0dS/uyavph4K3pCQKcNuleQiYynkBKIWXx6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGo0w+L5; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGo0w+L5"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bf854d5feso10914435eec.0
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209693; x=1782814493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ti3rFFJLDIQUrNppgFMKlOzusnp+Nk94zj1B91S2Nf8=;
        b=KGo0w+L5b9Jv6G26r4x2PzNaHv3sC846QUqs6DkurHkwbZzBSS6xddj5+vAYsWmwZd
         QG+pQEhWSHrxIQHeSJzmvK4kl/MPdAO1n7v7yCBlyr1DyWepklQAwbfeSXdV6P7gOUkX
         StgbFozM4ifdFO16R+dyA4xd5Rk6PufQlQqSNjpfHuKSMSdiDxYcrEan+IJIVxADkipK
         Pfriv6bxC5+wzVsIF7qQe0uFToCcb7F5gxV6l+KZ1d2ga5tJO7NA9oON3fC0w0kBoTu+
         WyHcpLFGtSY+CViKOD1mGSHUevi0xG2MhHK9ntOXFDfpbq+nXN0/Cl8fEZ9Iw58RGK0T
         e48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209693; x=1782814493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti3rFFJLDIQUrNppgFMKlOzusnp+Nk94zj1B91S2Nf8=;
        b=md4+aJgXJTc6r+tldhtYv7N5Um2Peg62uRuAEe18riHs+pAX0u9K+PJf5sna/yeF0H
         PwBeU8TlH9/sSQGmCqAB3uttNpX+gkMEBfdbV/228IlTemG4BP5G30FzDaFHmpuAIeK/
         ZybcBiCDFZNalB+mI4M97BBDBuLTAC86iylCTY/N0sp2lbkYGNZ9PeTF+iC9n4iNsP6W
         15LVJi0VKMXZiAyxayf0XhoyGia2nmwyNFjLhKwzB4talKy1cMwZg/VaOeUpMcDwBZNh
         F7iBSHUC2dmpBl8yUt+eue+PqgvlI+zb3hpscc1CSsajRLuG0Pa3hxdzXxJauKBVYyXs
         owuQ==
X-Gm-Message-State: AOJu0Ywu96AHAlDg2cS0rqExXM9DdrpMEFBaCszn4xJNFBQW7O3fJfdu
	yjI+J8AWP+X8dKykkNCVoINuaubuI3bAaijy/4Bc3YAvi1219WRW5pcBvCzqmJQD
X-Gm-Gg: AfdE7cmoiyteZ33gs2T3d1Hh21YRDjSe1ATNJOBCAQxE4obT7qK3CEes7ra9xqQcLU2
	bmw+muyXqGNJkAZ8LX2gt+AlHpwDV10HHlQsCyQXOYF/agToybnThtRJh2abNaa8YsoegfPyl/H
	Cym4kvEJQ4clPRBp4Ufs8KjfxGTxiinD59c8so6iE7kIBqUgeQc7iFh35QoiY8LM8qm7pLbWkZe
	CZO0M6Z/RKD/BGyDLMeUgsqu8OuIir5dp6iAa3T9gIRbAI3/FV4f4MpvdVsUuIzrvvd7i+zrqmi
	Z4bhNwpVxAQbrkTokFCHPW1Yxj6gUIUKGNik19x1elE1PV9OLRnwMl0s1ezxLfrrOOo+E9Ugxes
	WrFTJ1U4yELFTQJtYqByj3iEsuY0AG8/gzhOP5A5AFO5Ivy92Skzm37u/qbr0z9tUq9tyO1ik9B
	SuUKpdBlQgad1NaGF9WWE993HK59Z63Dx3KbT5fb1TUvxV7BykH176u4jG+Q==
X-Received: by 2002:a05:7300:730c:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-30c5b8d36c3mr1160460eec.16.1782209693019;
        Tue, 23 Jun 2026 03:14:53 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c44ec51b9sm7862755eec.29.2026.06.23.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:14:52 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: ntfs3@lists.linux.dev
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Xiang Mei <xmei5@asu.edu>,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] fs/ntfs3: reject restart table growth beyond U16_MAX entries
Date: Tue, 23 Jun 2026 03:14:35 -0700
Message-ID: <20260623101434.1321291-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During $LogFile replay, log_replay() indexes the transaction table by the
transact_id taken from the log record header.  check_log_rec() only
verifies that transact_id is non-zero and properly aligned, not its
magnitude, so a crafted image can request an arbitrarily large index.

alloc_rsttbl_from_idx() grows the table to cover that index via
extend_rsttbl(), which passes the new entry count to init_rsttbl():

	rt = init_rsttbl(esize, used + add);

used + add is computed as u32 but init_rsttbl() takes a u16, and the
count is stored in struct RESTART_TABLE as a __le16.  When used + add
exceeds U16_MAX it is truncated, init_rsttbl() allocates a table far
smaller than the index requires, and alloc_rsttbl_from_idx() then
dereferences and writes at the original, untruncated offset -- an
out-of-bounds access past the allocation, reachable by mounting a
crafted NTFS image.

 BUG: KASAN: use-after-free in alloc_rsttbl_from_idx (fs/ntfs3/fslog.c:950)
 Read of size 4 at addr ffff8880327ffff8 by task exploit
  alloc_rsttbl_from_idx (fs/ntfs3/fslog.c:950)
  log_replay (fs/ntfs3/fslog.c:4562)
  ntfs_loadlog_and_replay (fs/ntfs3/fsntfs.c:324)
  ntfs_fill_super (fs/ntfs3/super.c:1393)
  get_tree_bdev_flags
  vfs_get_tree
  path_mount
  __x64_sys_mount

A restart table is limited to U16_MAX entries by its __le16 count, so a
larger growth request is invalid input.  Reject it in extend_rsttbl();
all callers already handle a NULL return.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/fslog.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index f038c799e7ac..78f34442aaaa 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -853,6 +853,9 @@ static inline struct RESTART_TABLE *extend_rsttbl(struct RESTART_TABLE *tbl,
 	u32 used = le16_to_cpu(tbl->used);
 	struct RESTART_TABLE *rt;
 
+	if (used + add > U16_MAX)
+		return NULL;
+
 	rt = init_rsttbl(esize, used + add);
 	if (!rt)
 		return NULL;
-- 
2.43.0

