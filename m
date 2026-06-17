Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762673B1006
	for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781738034; cv=none; b=KYAAk9mRjK4kTpDEYfbJtOKDSLp04qKEqEgNRTYIQomUKJoUb0QjP5CPgM4pQoSbPwx+oG9G1WLTbRM5bkMmIMcJ3FA8upr5ehPvkefB/43rZDhKo1RqU4EqHHAktt8k/TrPoYcRoVOmaL8Sdl6dGsQ/r3D6rZW1BPIG/82kohA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781738034; c=relaxed/simple;
	bh=Kj0TBfxEicM57cvRUBFcrL1W+6OHe2oDpqZXrRZ/o3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZmmZI4vz847bQyZOW4SXSqA9rX3eKUKaMIoHUumBzLqWhkVQ5NKXkOjmsSIQO11Ki+ahUR6SaItHE5DTyIUzI42aVitlbNbNxkVqnBvbZ07kNiHAxA0glop4zcJx76TKBV5odq56QoqiE27VDjdGNrhSyBEkn0FJrVyb9m5abg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=DKad2/LE; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="DKad2/LE"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84231305a80so140983b3a.0
        for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1781738033; x=1782342833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jtRzExnB/EeGtbnZ2qJXWTojvkZFyWJwa+IXv5Dkx4=;
        b=DKad2/LEzsKVBRnUPRbfGH9MFrrOFih9Lb6qI/1WHf3NHGQRYjXja+Rw0MxG4txmK3
         3fu6BDf0vY1o+H/5bSit0cBpWU/GPu28gIRF0VcaR9dpBwKDNFfVZRRleHbVzHUbXKyq
         sb/ydSe1dAHw/qYtG2ZztCqPJf/XQErwEJJolVXLauZbY4xSAzCmXWE8sbkznIUZHnE7
         47Q/KvkQWooVanAIxueBx+J8tXGth2h9jocd6L8sbfEX5RqHv55ffMg97cmbZLCnGmFy
         VhkJ4LAzDx2/uVjykYx1W/TmdBjoEa5KYYg7mPu75i/tNARmhcPnjknSK/whb6EbME9d
         P1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781738033; x=1782342833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jtRzExnB/EeGtbnZ2qJXWTojvkZFyWJwa+IXv5Dkx4=;
        b=D062CUpQGdsd3meL8mBn4KflNOr4NJLvV7tUTQwIpEw9QOxwTSmr6IMLRjeGOPbxlQ
         x0yeYT1nPJeQQyZpvFWOmpaiir3acL0y7X/zDOgqca1EqjVIfTH1G1TIH74zgenVsmRi
         8eHeAPXLsfAirOsa78I8aDHXfyUsqZk6nm7D3Gab5ZcpSZbYE5z1EgyclFraIsBMGoGi
         X/FHVZpLQwXfGMjxwXEvw7WRlmt786x+qwSuaPQl6gtQVq89abYCOBJS2znEHkUrUWzM
         LxGGfXnH4rPKvs3zmrJRuV8HyU8A8KS7fvfA89ZbxUdkXVRHakGQSImsgm+pyHLourdg
         h00A==
X-Gm-Message-State: AOJu0YwK1Y2VS2TD/8cFhwcaUZsTQffWKC+6ZoAgG/lTU70564mBtKfE
	gYyFGR2G9crA6sJ4xds3Xg8bgRitW/WHmtLM+Gjriq4N7JF/rnpcQdu2JnOVCODJOOQfvVypg5v
	LhMCINA==
X-Gm-Gg: AfdE7cm1kzZaQdSLp66rHwQgoEKjusdtOfN7DlkWpgjxBlG1557N14gMM/Hdc5Gu0Gq
	gXMJSqJCEYcwGgSQQJ3gLwTjdu3H8vzx/ZeZSmYzARwZopc6WZ7Ke1ngvohGqwx+2wtMAilgffC
	JqRZc9eBhGgdJX6ph81C9osOVL3DraegKDp9CSJF5vODwR3nontC3tk92ZLQbpUjXjBaJGoQCcb
	gT7XF+ldqO2Xz6iDQLo3DI3MoFnGvPdDlMRIIXn+qXHJIMX1C35ZwrKRxNn1EV07xNsqurd18wo
	/yg2L4LhHTBZ0/MywPtF42kmsYn762PV3C46/jrKRiDy0SVxoCZNa4T19P1oVEK0oyeO2WHoiKl
	OrMYpUlo1iRCo281iL+Ila1RvbkelkwViXIxbBD4yFPMs4bgZFUKQSLcfkXNfDPYQ9+onYZO9hA
	==
X-Received: by 2002:a05:6a00:1709:b0:842:377a:4dcd with SMTP id d2e1a72fcca58-8453b27ecd1mr853640b3a.43.1781738032748;
        Wed, 17 Jun 2026 16:13:52 -0700 (PDT)
Received: from p1.. ([2607:fb90:ec29:4018:2b5d:3e92:f9ad:889c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf4b5csm21073427b3a.23.2026.06.17.16.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 16:13:52 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] fs/ntfs3: bound page_lcns[] index by the log record
Date: Wed, 17 Jun 2026 16:13:43 -0700
Message-ID: <20260617231343.403432-3-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617231343.403432-1-xmei5@asu.edu>
References: <20260617231343.403432-1-xmei5@asu.edu>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The copy_lcns loop and the redo shorten loop index page_lcns[] at j + i,
where i runs up to the log record's lcns_follow. That count is checked only
against the record's own length, not the target entry, so check_dp_table()
(which validates the entry's lcns_follow) does not cover it: the copy_lcns
entry may even be freshly allocated after that check, and find_dp() bounds j
but not i. A crafted record thus overflows page_lcns[] of an otherwise valid
entry.

Add dp_range_ok() and reject, before each loop, any record whose run does
not fit the entry. These are the only two page_lcns[] accesses indexed by
the record rather than the entry, so together with the entry validation
every access is now bounded.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v2: resend to public mailing list

 fs/ntfs3/fslog.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index b1ca84d83de5..1cc7402fdc2c 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -647,6 +647,14 @@ static inline void *enum_rstbl(struct RESTART_TABLE *t, void *c)
 	return NULL;
 }
 
+/*
+ * dp_range_ok - true if [j, j + count) fits in a page_lcns[cap] array.
+ */
+static inline bool dp_range_ok(size_t j, u32 count, u32 cap)
+{
+	return j < cap && count <= cap - j;
+}
+
 /*
  * find_dp - Search for a @vcn in Dirty Page Table.
  */
@@ -3801,6 +3809,7 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	u64 t64;
 	u16 t16;
 	u32 t32;
+	size_t j;
 
 	log = kzalloc_obj(struct ntfs_log, GFP_NOFS);
 	if (!log)
@@ -4566,9 +4575,12 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		 * whole routine a loop, case Lcns do not fit below.
 		 */
 		t16 = le16_to_cpu(lrh->lcns_follow);
+		j = le64_to_cpu(lrh->target_vcn) - le64_to_cpu(dp->vcn);
+		if (!dp_range_ok(j, t16, le32_to_cpu(dp->lcns_follow))) {
+			err = -EINVAL;
+			goto out;
+		}
 		for (i = 0; i < t16; i++) {
-			size_t j = (size_t)(le64_to_cpu(lrh->target_vcn) -
-					    le64_to_cpu(dp->vcn));
 			dp->page_lcns[j + i] = lrh->page_lcns[i];
 		}
 
@@ -4985,8 +4997,14 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	/* Shorten length by any Lcns which were deleted. */
 	saved_len = dlen;
 
+	j = le64_to_cpu(lrh->target_vcn) - le64_to_cpu(dp->vcn);
+	if (!dp_range_ok(j, le16_to_cpu(lrh->lcns_follow),
+			 le32_to_cpu(dp->lcns_follow))) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	for (i = le16_to_cpu(lrh->lcns_follow); i; i--) {
-		size_t j;
 		u32 alen, voff;
 
 		voff = le16_to_cpu(lrh->record_off) +
@@ -4994,7 +5012,6 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		voff += le16_to_cpu(lrh->cluster_off) << SECTOR_SHIFT;
 
 		/* If the Vcn question is allocated, we can just get out. */
-		j = le64_to_cpu(lrh->target_vcn) - le64_to_cpu(dp->vcn);
 		if (dp->page_lcns[j + i - 1])
 			break;
 
-- 
2.43.0

