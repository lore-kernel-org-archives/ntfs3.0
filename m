Received: from cvsmtppost13.nm.naver.com (cvsmtppost13.nm.naver.com [114.111.35.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E4544E66D
	for <ntfs3@lists.linux.dev>; Sun,  4 Oct 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791118017; cv=none; b=NcMQBP6alhDdPz4CkTlxBFVH7giymT2jLUjzz63KpVUgVw/zxPoOmrUZUoBwpGkazESADJ2KFG9Rgotd+tzHiIrPspK2M7iU+WCKE9DH9mCk1dtNelgxAoydHWskY06lMe6UACCOuhMs8udhzT3n0zCsg4AFC8f5fHlDA6f9l9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791118017; c=relaxed/simple;
	bh=0M4OSaWXsNitp5wK8fWnunOhHj1CeMqi0Xt7wewH9os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rx23bEz7HHiG9F4+diNGhRRp4aGmXkUktp6hwfiQ4rKVSEN8KjWpjet2oa5ZatH6wjf9gEnB87IaqXvF/O1FqdgO3CKkH8SIzooW8/6oJFCCXA5n4Aa1PylKHEXp7A/8FYSlrhVsWr8wK2/sjJOmYxgPMdjz9XaYyUKEbxFPacc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=nkUwkIfZ; arc=none smtp.client-ip=114.111.35.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="nkUwkIfZ"
Received: from cvsendbo009.nm ([10.112.18.55])
  by cvsmtppost13.nm.naver.com with ESMTP id EoXkhRNxQzme42w+FmtbaQ
  for <ntfs3@lists.linux.dev>;
  Sun, 04 Oct 2026 12:36:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791117407; bh=0M4OSaWXsNitp5wK8fWnunOhHj1CeMqi0Xt7wewH9os=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=nkUwkIfZ6SGXK5r/yBmZTGRVfpvhz60b7fvw0+6wcNcKJIzT0erKWEk00FsKzMSB4
	 5VtPVSGgpiFsQTp9bL3s8DAdQVcYbzGIFf1R7TnR0rBK5L/Xei8qvOxysGrSNn2MPp
	 EfaXg0E/HohZg4AnDrJY9VbZa4y1IbaUUuWN61otpWWEk8gBNduBAcsTngokp0gsrh
	 hTvrPFB+L5z/id6c4PMkbhULTH7zz80pd51/xMdAqg3SFbgZA4j2NGtXuTn1lw9dbJ
	 fWP9KliOrnR0TQlhZyy7N2xBrxrPlQyZqQUzHqMdWXe46Jy7QXRq7c1HTL7snnQ4Ti
	 GMQzzR+GkUsRw==
X-Session-ID: nbejRPm0TuKm4bdkDC0lvQ
X-Works-Send-Opt: OlewpzGdjHmdKHFOMr39Ko3YKHmqjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: PwY/KAulFqJZ+HmrKAg9+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp005.nm.naver.com with ESMTP id nbejRPm0TuKm4bdkDC0lvQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 04 Oct 2026 12:36:46 -0000
From: sungbyeongchan <tjdqudcks0424@naver.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: reject overflowing replay bitmap ranges
Date: Sun,  4 Oct 2026 21:36:37 +0900
Message-ID: <20261004123637.587015-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BITMAP_RANGE bounds checks perform off + 7 and off + bits + 7 in
u32.  Crafted journal values can wrap both checks and make the bitmap
helper perform a word-sized read-modify-write outside the replay buffer.

Check every addition before byte rounding for both set and clear actions.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
---
 fs/ntfs3/fslog.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..38873c02d30d 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3746,8 +3746,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		if (check_add_overflow(off, 7u, &nsize) ||
+		    check_add_overflow(off, bits, &t32) ||
+		    check_add_overflow(t32, 7u, &t32) ||
+		    cbo + nsize / 8 > lco || cbo + t32 / 8 > lco) {
 			goto dirty_vol;
 		}
 
@@ -3759,8 +3761,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		if (check_add_overflow(off, 7u, &nsize) ||
+		    check_add_overflow(off, bits, &t32) ||
+		    check_add_overflow(t32, 7u, &t32) ||
+		    cbo + nsize / 8 > lco || cbo + t32 / 8 > lco) {
 			goto dirty_vol;
 		}
 
-- 
2.43.0
