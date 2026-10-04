Received: from cvsmtppost01.nm.naver.com (cvsmtppost01.nm.naver.com [114.111.35.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E139E9AC
	for <ntfs3@lists.linux.dev>; Sun,  4 Oct 2026 12:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117992; cv=none; b=r8FC+c9ZA7a6J188ATwl0XqS8uAAbwsOVNdbR5c/ArtGM7fxjX0uuGNFVgEhuIlwBt7eF37QSETA+MmDLKDOx8Z3/ZsTGfblLLWJAdnzW47lfg3lcK7knIzwnvMmvrsrZy7ADTgdSFB9zaRDOF1yW2kBPw+FgFzpSaBahoP2o4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117992; c=relaxed/simple;
	bh=cAERqarAUY0L9E+YPb2L6sG90JSKvm4vIbHz1GJCHWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q1FoFaXrZpNaEJrSyfULhHS5stneHU/grTrvqE9NHtAOyvgqSXOowaO5vt/CYzZhbQJAtucoIBPDUbMdnzNDlxubhhWIk93XUMni7Qdq8cgjxHtkdubMZK/x7egoVqx1CQURJ2iLRLCuPhCYLu6tPi/rlORAZNqkqM7XWX2jW7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=TaoF8UMb; arc=none smtp.client-ip=114.111.35.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="TaoF8UMb"
Received: from cvsendbo009.nm ([10.112.18.55])
  by cvsmtppost01.nm.naver.com with ESMTP id +Zrv3SuyRZii2zo1B7kwMg
  for <ntfs3@lists.linux.dev>;
  Sun, 04 Oct 2026 12:36:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791117382; bh=cAERqarAUY0L9E+YPb2L6sG90JSKvm4vIbHz1GJCHWE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=TaoF8UMbLheKBlYA8l+Zeyh3VxETmlwGza/6bgCfXAemq6M9e+DTEtsihqFsetsMz
	 7hDE9s2PCRpFaJO7KXt/sfMr4+v70+X19y3z62LDzHkbpFJLnZ5bPXD0Ppl8RYz/Aw
	 /Q5EWU+GWIiq5Qtbd4yyv9Z3/CM9eziQCtzmTZlbaFxv8YSU7Zp38WYHQROS9Xdb+u
	 umo44htXIgShpFWS+UwayJzI0qOkzmJKwyCwH3aWnpKrB+GLh09Hej0oya0oWaTgNr
	 hhJPQQPPCTMeUhUN4ptc5N/Nj09ExMZ6TrrLz7peGTPytkCqEPBLP1uPMgDU0BeKp3
	 gjZ5+QsKtcxfQ==
X-Session-ID: MQxHqBC4SPOiS7AHSR2p2Q
X-Works-Send-Opt: OlewpzGdjHmdKHFOMr39Ko3YKHmqjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: Pdn/KAulFqJZ+HmwaAvd+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp005.nm.naver.com with ESMTP id MQxHqBC4SPOiS7AHSR2p2Q
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 04 Oct 2026 12:36:21 -0000
From: sungbyeongchan <tjdqudcks0424@naver.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: validate filename replay destination size
Date: Sun,  4 Oct 2026 21:36:13 +0900
Message-ID: <20261004123614.586837-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UpdateFileNameAllocation accepts a terminal index entry because the
generic validator only requires the 16-byte NTFS_DE header. The action then
writes the 56-byte duplicate-info field after that header without
checking either the entry size or the remaining allocation.

Require the complete destination to fit both the selected entry and the
allocated replay buffer before copying it.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
---
 fs/ntfs3/fslog.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23e..f95fa39e1f00 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3731,7 +3731,13 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
 		if (!check_index_buffer(ib, bytes) ||
-		    !check_if_alloc_index(hdr, aoff)) {
+		    !check_if_alloc_index(hdr, aoff) || roff > bytes ||
+		    aoff > bytes - roff ||
+		    sizeof(*e) + offsetof(struct ATTR_FILE_NAME, dup) +
+			    sizeof(fname->dup) > bytes - roff - aoff ||
+		    le16_to_cpu(e->size) <
+			    sizeof(*e) + offsetof(struct ATTR_FILE_NAME, dup) +
+				    sizeof(fname->dup)) {
 			goto dirty_vol;
 		}
 
-- 
2.43.0
