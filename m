Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3843D16F1
	for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 23:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781738033; cv=none; b=ZIh6vIWR2leDcUx+KZItaunHxKUPrR2BwUdPTh0hqBLej01NKOl8fV2clrR4XAEJ0cODhZUQ+EnGy9YbfpTCTDyMAfvFaRG0ZI+xRqIlKJ/9kwEIue+vYfTksE7w4WXRmziNCxwXMwTZz+GgkkWUtw/iUN6gMTFb4Hh56SFGlto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781738033; c=relaxed/simple;
	bh=yRpTV2fREwzzqOKDQ1mQKF+YgHG+RYpUg5V3/o+sfI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fgd9kNlJsFevysKaT3rMxOGBr8Mk701/cimaIeT98wHNSoQuzpkzxR+8sbbG0FEB6uLTXda/ehI17WesYvoOQw/IyQhFJbB5lNZ0MxgswudaKsRgpe3vLd/CSnmTw7YJ1ZI4ew72BoEy787H9hZJQqXzKlFLwFLuMIZ8frxZ1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=g/cEhraj; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="g/cEhraj"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c88b59bfba7so119047a12.1
        for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 16:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1781738031; x=1782342831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1WZSdnDOexkXvu4kbAp0KpA84CDGtsQuc6Gr9g6y/4=;
        b=g/cEhrajuoJ78WzB1ZFRTfoMqz6xwuAeDSZhKCET+nQ1sT/90NDss72H4eYbbzzCpR
         tj15gOUUdGN9/i3C6hsh5jkU7lhUncOQz5Cerpav0dfHcwpXK2DG2tHnaHp7C+3tW5YE
         f3pEbumtVoHTAU/7914cJfVQ2C+vm5ZM8ijqVz45VeOwyn3yWS9UwdqR3tP1R46s7UT8
         NvfUKltJUFEK6tDSpgbp+mGfjDC5PHqeTwHdW1vbgajvXJiKHQ/19pdj+khaHlvL4XEQ
         8utV9Y/bw3RsqjIhEphLevL9JgZc15nGrostSu3k9lwSxS93+D2SQRJwZWHPGZauGwFN
         mZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781738031; x=1782342831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t1WZSdnDOexkXvu4kbAp0KpA84CDGtsQuc6Gr9g6y/4=;
        b=aANeR1HEv0dKIQdf3LFsI0m6ilqGKJCxKHc5NO7pDinZYIi6nc7gm505CS0YqPcVww
         gMh068vEU7xKaeQntP7q2fEFgoQhaiMX1zsGfvGZlWW51qfqDr+G934WDlKURXHm0WIx
         exfKO4P+W+oIC2g5+Q+nMVDaCYYbEUpBCa4JgPpKMT4EH+HOusOcfB7xmlhV8Nfo6DXp
         O39YUZOgE4DcEMwr1VkqWtetATt2RZdstdgAcZFoels7UpnSenm2x2Ui4RSzLE62MQG0
         obPD0IWiOnoqgObmzolAkhBwzHBFtI42JY6fkf3CdPgruEobR7UAoKTwv/xWwEz2uPcN
         Js8w==
X-Gm-Message-State: AOJu0YzmIcm7Hc7QV+ZaQiZ171htjCdlObJzpwR2ukD70IP0nktJQcBj
	yYGaXIGxc0PqVPb260Zz0XewKrO/4h+6pk9EjAtt1FQGDAmAZN5uqiEuwQjA9BNJdg==
X-Gm-Gg: AfdE7ckmIGIJ4NM1gfSPwLb3tVr7i0qRFFEg6JYCYiGk3/6sS37YObOC7ZQR5RgWkSo
	3JYb0Q2Ym2hsqhywErdnMRnEZq2C58xN6ArP1BXBRRaZ+qYQApeWXiFOkXNDfHxXCJ4+EyU3jpk
	Jgjld2pJeW6R5eCHx+w8LDytYo2tquPOqfAW/twX5lEhIZ3jEb0abGK3PM5eSl+Mqc3kLurYMP5
	DY29k5RNp/Srt4ESDGcH8Z7CezHLEFudl/c2bRK4hBrGTDZmqa+oPvoECzNywHS4GDczN+BgrAW
	2t9qBK3hOH+FLsYSrVdlPNIuTc5Gznn/y4U2m+h+iDvJPBhvFzl4gFAMt59tlbUfu0u2ka1L28V
	FEzT6O+AdAlY4MHEJptIiIZjH8cxklN7T8OqRAEut+tagEru/pDF7ekZ3gYeG8Dx2zLMEatabYA
	==
X-Received: by 2002:a05:6a00:238c:b0:842:5712:c2c2 with SMTP id d2e1a72fcca58-8453b3a63cemr907532b3a.41.1781738030668;
        Wed, 17 Jun 2026 16:13:50 -0700 (PDT)
Received: from p1.. ([2607:fb90:ec29:4018:2b5d:3e92:f9ad:889c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf4b5csm21073427b3a.23.2026.06.17.16.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 16:13:50 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] fs/ntfs3: validate dirty page table on log replay
Date: Wed, 17 Jun 2026 16:13:42 -0700
Message-ID: <20260617231343.403432-2-xmei5@asu.edu>
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

Each DIR_PAGE_ENTRY ends in a page_lcns[] array whose length is the on-disk
lcns_follow field. check_rstbl() validates the table bookkeeping but never
checks that this array fits in the entry, so a crafted lcns_follow lets the
v0->v1 conversion memmove and later replay passes run off the entry.

Add check_dp_table() to reject, right after check_rstbl(), any entry larger
than its size claims via struct_size() (the same expression used to allocate
these entries, so the check is overflow-safe by construction). All consumers
can then trust lcns_follow as the real capacity. This covers every
page_lcns[] access whose index is bounded by the entry itself (the
conversion memmove, the HotFix store via find_dp(), and the self-bounded
scan loops). Accesses whose index comes from the log record need a separate
bound and are handled in a follow-up patch.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v2: resend to public mailing list

 fs/ntfs3/fslog.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index acfa18b84401..b1ca84d83de5 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -778,6 +778,20 @@ static bool check_rstbl(const struct RESTART_TABLE *rt, size_t bytes)
 	return true;
 }
 
+static bool check_dp_table(const struct RESTART_TABLE *dptbl)
+{
+	u32 rsize = le16_to_cpu(dptbl->size);
+	struct DIR_PAGE_ENTRY *dp = NULL;
+
+	while ((dp = enum_rstbl((struct RESTART_TABLE *)dptbl, dp))) {
+		if (struct_size(dp, page_lcns, le32_to_cpu(dp->lcns_follow)) >
+		    rsize)
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * free_rsttbl_idx - Free a previously allocated index a Restart Table.
  */
@@ -4209,6 +4223,11 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		goto out;
 	}
 
+	if (!check_dp_table(rt)) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	dptbl = kmemdup(rt, t32, GFP_NOFS);
 	if (!dptbl) {
 		err = -ENOMEM;
-- 
2.43.0

