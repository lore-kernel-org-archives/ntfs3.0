Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D261367B63
	for <ntfs3@lists.linux.dev>; Thu, 11 Jun 2026 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213590; cv=none; b=rzGl+vBzvz8jDLeKecyd/yNrzebQ57r9ErlArG2qAF4hxSPWyVa2aeWXzWVFuuyvRxqFdtatCbiznpQxAVZH8YNWSj0biaZBp0hR/e5a/NQjdXdTFtHU3eyAj8QtWBMf/HhH5CaHcB+8A2pTWsDEGeraC6uTJGWKFHp8bFdZtX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213590; c=relaxed/simple;
	bh=lh3HK6R1DoAVzBu90GhUAqLKTV8x5/+or6ifAKGlGtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UJihuXxC9DcGa8D/NzdDImSTMXCbhWpChsCAJuvNj/aQ2wfkFg3quE4aI7IriTclM+boDEqmfQY9u2yIFh8Ew+LNfdItxaYoEgrP+o9EN1OXF0eBCYdRfd5PjaxDV0n2J6FVfx9qMSzJlwzrS8ZT/lbmJUPZgFQQaeyfXvjhuLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=Lqy6N8xv; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="Lqy6N8xv"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9159da9bba5so24911285a.1
        for <ntfs3@lists.linux.dev>; Thu, 11 Jun 2026 14:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1781213588; x=1781818388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p04G+PCpwT9vL1o2A8fD6xEdLkQoStt4tP7ytz6vMg0=;
        b=Lqy6N8xv0ijalguUBLyoLS0F5ogExj3okOiwWkmny7K4k2n+sUhpMJ+EgKRsuPN3d7
         DrFdjSSgufAgtNjxPxUScgk6VCpcttZJjGer6wJu5Bxqt+myDKHwK8pThiqY8Z1ePe9x
         oqTrBjdwGKO4Ss/5w7g0FDyhZ4h6lHVaA2SVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781213588; x=1781818388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p04G+PCpwT9vL1o2A8fD6xEdLkQoStt4tP7ytz6vMg0=;
        b=ko8p9dml3k1sfrvmiYDnQTJ+vxZjuuAg8cOOskmnweedRdYJM8ml9Gmu3mDXaETblv
         dsjyFw/PyZheGsJTY8iTIONX9NLH3xhfON5SQNHtFDhCYZWvn6H5S2j2N+Mmw8Q/y/ms
         yrETH8D2uySifCnBXDPSZDFQPukkEfF85YHQ1T769KgeiXJYidaX4qhzL9N9k4ZkVZS5
         TVp4jxDggai/x9V3WfRUYNWHvczdUIFQI5kXXj4gnfrMN5dRn/6XkbjddbLxS38VE8Is
         wIvWKoQjH7lbVzYmI+mDzux9w1qQau+Q/6v9l8NQDzrVr5/nIYHBwuU3TpG5pSJBRfNk
         mh9w==
X-Gm-Message-State: AOJu0YxWzy6Y2Qyyodek3tb7CJFjXFpP6bEIKp1T7oeZog72bzjF5DrB
	CN3RPvmjWKgl0508+N9sBS6blmoGMsKty/ycbj5I0xW2bmULDZTGafjvHyXUpaNVSyRF8gH4HEW
	sLQ94zvc=
X-Gm-Gg: Acq92OHIFAkxV+k0BY0teUumGwDyf6uoxKtxWtEz7OjSqnL/E61CWTvmif+9GIp/ATh
	L9us0GOod74cvSI9Z7KfJ/WK86BoMOFzbulCfXvxfZ/1WVa/Uouvx4+Vq37lp+uA1H3voe/fpML
	jkA0O+nqPa/UBY5KYp9HoIyj5793a1hjktHYm1Nq7ZmLMzHf4CMRxqziywuQlgoEyB4pCJFNHqi
	d5yqwswINhwJ08jFVKN4AjlfewGG6XoEOhU9PPrFSmt6n1/ZAcnQiTYQNywCznr5xjZN7FliUFV
	QoqRBCUzAcoNXa4nUCKv8MN6iZ/vEnSLfFsAsNObvdiBTHbzF6EhFAbWA2Lnwh/8DLG4UicjqN6
	8T93WcTaSwz7R966TSC73QFlCdZwQekP6zvVeYpnGrsZEWtMGgUDy1BRVX1LFRHBmMVLIyQVgAo
	3KkO+sRDexLxGDaFMKEElHfsTFvl5jz0KDpgvyEHLpuECa5tz52vjqw1xHOPb6uPVA3eu6pgz3O
	J2tbNfwBBZPpl873I6p3fH4JP9TmNoF6dE=
X-Received: by 2002:a05:620a:f0c:b0:915:a101:48d with SMTP id af79cd13be357-9160ad93320mr721143085a.56.1781213588300;
        Thu, 11 Jun 2026 14:33:08 -0700 (PDT)
Received: from com-75606.node.ndb.openai.org ([209.249.37.146])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006ef0sm26666385a.24.2026.06.11.14.33.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 11 Jun 2026 14:33:08 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] fs/ntfs3: validate dirty page table entry sizes
Date: Thu, 11 Jun 2026 14:33:04 -0700
Message-ID: <20260611213304.16654-1-kylebot@openai.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic restart table check only verifies the table header and
free-list shape.  Dirty Page Table entries also carry an entry-local
LCN array whose length is controlled by lcns_follow, and replay later
trusts that value when converting version-0 entries and when copying
LCNs from log records.

A malformed $LogFile can provide a Dirty Page Table dump whose generic
restart table is valid but whose entry is too small for the declared
lcns_follow count.  log_replay() can then run the version-0 conversion
memmove() past the kmemdup() allocation, or later copy/read past
dp->page_lcns when a log record spans beyond the matched DPT entry.

Add Dirty Page Table-specific validation before copying the table:
require entries to be large enough for the typed DPT layout, require
the old version-0 source layout to fit before conversion, and require
lcns_follow to fit within the restart table entry.  Also validate each
log record's LCN span against the matched DPT entry before touching
dp->page_lcns.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 fs/ntfs3/fslog.c | 61 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index acfa18b84401..1fc9d04806b5 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -647,6 +647,23 @@ static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
 	return NULL;
 }
 
+static inline bool dptbl_lcns_in_range(const struct DIR_PAGE_ENTRY *dp,
+				       u64 vcn, u16 lcns_follow)
+{
+	u64 dp_vcn = le64_to_cpu(dp->vcn);
+	u32 dp_lcns = le32_to_cpu(dp->lcns_follow);
+	u64 off;
+
+	if (vcn < dp_vcn)
+		return false;
+
+	off = vcn - dp_vcn;
+	if (off > dp_lcns)
+		return false;
+
+	return lcns_follow <= dp_lcns - (u32)off;
+}
+
 /*
  * find_dp - Search for a @vcn in Dirty Page Table.
  */
@@ -657,12 +674,8 @@ static inline struct DIR_PAGE_ENTRY *find_dp(struct RESTART_TABLE *dptbl,
 	struct DIR_PAGE_ENTRY *dp = NULL;
 
 	while ((dp = enum_rstbl(dptbl, dp))) {
-		u64 dp_vcn = le64_to_cpu(dp->vcn);
-
-		if (dp->target_attr == ta && vcn >= dp_vcn &&
-		    vcn < dp_vcn + le32_to_cpu(dp->lcns_follow)) {
+		if (dp->target_attr == ta && dptbl_lcns_in_range(dp, vcn, 1))
 			return dp;
-		}
 	}
 	return NULL;
 }
@@ -778,6 +791,37 @@ static bool check_rstbl(const struct RESTART_TABLE *rt, size_t bytes)
 	return true;
 }
 
+static bool check_dptbl(const struct RESTART_TABLE *rt, bool is_restart_v0)
+{
+	u16 rsize = le16_to_cpu(rt->size);
+	struct DIR_PAGE_ENTRY *dp = NULL;
+
+	if (rsize < sizeof(struct DIR_PAGE_ENTRY))
+		return false;
+
+	if (is_restart_v0 && rsize < sizeof(struct DIR_PAGE_ENTRY_32))
+		return false;
+
+	while ((dp = enum_rstbl((struct RESTART_TABLE *)rt, dp))) {
+		u32 lcns_follow = le32_to_cpu(dp->lcns_follow);
+		size_t bytes;
+
+		bytes = struct_size(dp, page_lcns, lcns_follow);
+		if (bytes > rsize)
+			return false;
+
+		if (!is_restart_v0)
+			continue;
+
+		bytes = size_add(offsetof(struct DIR_PAGE_ENTRY_32, page_lcns_low),
+				 array_size(lcns_follow, sizeof(u64)));
+		if (bytes > rsize)
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * free_rsttbl_idx - Free a previously allocated index a Restart Table.
  */
@@ -4204,7 +4248,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	t32 = rec_len - t16;
 
 	/* Now check that this is a valid restart table. */
-	if (!check_rstbl(rt, t32)) {
+	if (!check_rstbl(rt, t32) || !check_dptbl(rt, !rst->major_ver)) {
 		err = -EINVAL;
 		goto out;
 	}
@@ -4547,9 +4591,13 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		 * whole routine a loop, case Lcns do not fit below.
 		 */
 		t16 = le16_to_cpu(lrh->lcns_follow);
+		if (!dptbl_lcns_in_range(dp, t64, t16)) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		for (i = 0; i < t16; i++) {
-			size_t j = (size_t)(le64_to_cpu(lrh->target_vcn) -
-					    le64_to_cpu(dp->vcn));
+			size_t j = (size_t)(t64 - le64_to_cpu(dp->vcn));
 			dp->page_lcns[j + i] = lrh->page_lcns[i];
 		}
 
@@ -4928,6 +4976,12 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	if (!dp)
 		goto read_next_log_do_action;
 
+	t16 = le16_to_cpu(lrh->lcns_follow);
+	if (!dptbl_lcns_in_range(dp, t64, t16)) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	if (rec_lsn < le64_to_cpu(dp->oldest_lsn))
 		goto read_next_log_do_action;
 
-- 
2.43.0
