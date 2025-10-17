Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308B30F804
	for <ntfs3@lists.linux.dev>; Fri, 17 Oct 2025 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696341; cv=none; b=Ga2bPyg12kGHC+SsyI1lQOlxSTTwmu7crF8tbh5EeIHl9ID20KSkWT+HAUA3SH56eYqKOw5XASDWVu+TFvTc3OEhjz3dsot4BSf+kxqBqewirYdUKdGq7el8tysTMt0VFg+/cK6dtivefea8/hZQ0yHYBvs2f4RyjcaDYb7GWzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696341; c=relaxed/simple;
	bh=lNASWFq9hkLr8MIHPepeg51anv+cru/E/QAApgicP0s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ViO9t1V0CKyfG1ma6TANFW//5usbBLcXXvz2RiSxy24uNHTEtItpR5Xjh8CqTWu2B1n+hKwK9V3qmeox/XsaIf7XcJ1S+rOJan/SFtyvkQAG2pRahALH1KqrpJfLNENW8o2mIFKFYok9aktlDkXkkHYwmq5HPXPkYdIKsta8ZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=NtoIEsTF; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="NtoIEsTF"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3A31C1D24;
	Fri, 17 Oct 2025 10:16:03 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=NtoIEsTF;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C7FC72421;
	Fri, 17 Oct 2025 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1760696337;
	bh=7gYjnXTWlXZnRzDxdd+FF1TOLbuiSGPJK+lCoMVUybc=;
	h=From:To:CC:Subject:Date;
	b=NtoIEsTFAWVts+98/hBFuKoUYVmGYSCam4q3aHdds6fF8wlnTBC1swSWpbrridCbK
	 NJm6CdYK4iBGafQtU+DghEsrsbR2yk2CBpgfWNbR4igjTZuOIlJ5iTZYCr8bLRN/4C
	 yY7D8Ib+ho3Cy7NCYa56W/y98Q3LO4TOja2+xd74=
Received: from localhost.localdomain (172.30.20.178) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 17 Oct 2025 13:18:55 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	<stable@vger.kernel.org>
Subject: [PATCH] fs/ntfs3: fix mount failure for sparse runs in run_unpack()
Date: Fri, 17 Oct 2025 12:18:47 +0200
Message-ID: <20251017101847.5874-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Some NTFS volumes failed to mount because sparse data runs were not
handled correctly during runlist unpacking. The code performed arithmetic
on the special SPARSE_LCN64 marker, leading to invalid LCN values and
mount errors.

Add an explicit check for the case described above, marking the run as
sparse without applying arithmetic.

Fixes: 736fc7bf5f68 ("fs: ntfs3: Fix integer overflow in run_unpack()")
Cc: stable@vger.kernel.org
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/run.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index 88550085f745..5df55e4adbb1 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -984,8 +984,12 @@ int run_unpack(struct runs_tree *run, struct ntfs_sb_info *sbi, CLST ino,
 			if (!dlcn)
 				return -EINVAL;
 
-			if (check_add_overflow(prev_lcn, dlcn, &lcn))
+			/* Check special combination: 0 + SPARSE_LCN64. */
+			if (!prev_lcn && dlcn == SPARSE_LCN64) {
+				lcn = SPARSE_LCN64;
+			} else if (check_add_overflow(prev_lcn, dlcn, &lcn)) {
 				return -EINVAL;
+			}
 			prev_lcn = lcn;
 		} else {
 			/* The size of 'dlcn' can't be > 8. */
-- 
2.43.0

