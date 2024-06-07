Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9955197A8C
	for <ntfs3@lists.linux.dev>; Fri,  7 Jun 2024 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717762589; cv=none; b=ttOSqwXLCRx/chkMyybNnu+Yvyxsg7f9iPkBD5490GbUsdzTFkPKgGn374SMpQsqwC+iAK15/V2dEqjQ5H9tJLjdpqhB6GGsgv/BZGR3W1H7VrXMoaJbtC2R5JiIoMrmQd5muKrgixqjuYcAmPKNsloHuJs3J97FJ1YsiOlv3TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717762589; c=relaxed/simple;
	bh=nUHidUzz1T0S+HSHLdTUekBbn8Zo3THzDfTfWfN6Fxg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m8x1/bxVNunNDe0IDj1zqnO8Sh0Md2j7MnDRz/hYrrgdPhJoS4UNerFYF8iHVTPr8s3Ind29965D1pOUmSqL1Pf0z7umyG5ZCd0UOUxtBm442n3w5pCt/gbXMeYjxlcklR0CBumosL7hGg/xq+bMSMKTgm8W5F/HYUFWl40d/rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=QUmZvKhN; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=iExIxDTN; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="QUmZvKhN";
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="iExIxDTN"
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C71EA2113;
	Fri,  7 Jun 2024 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1717762111;
	bh=0jJtz0eUYHftgd+JKDAtTz3HVvB1qMm8PesV+dw6f8Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QUmZvKhNWmQeghV5foiFsHvMMLNZxdC4rrv/gciu5yKSMaRs9UEunl87NjmLUtwz0
	 xb1NXGbvK8QhVlmmD3B86J0qPNg8ZevJUxZDF180ECHRzJHpMEwSWgyzKReU+A8FiQ
	 y42xXxSUEo/LQs85b592lzrezQVtEAbQe7TdBgfs=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A992B195;
	Fri,  7 Jun 2024 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1717762585;
	bh=0jJtz0eUYHftgd+JKDAtTz3HVvB1qMm8PesV+dw6f8Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iExIxDTNNCzD5gq6CrHZ52od/rxFwKtPrfC7rcG9j3Ja4yxGlpTMVbsmVFDKT20vh
	 8unw3dAhlSuXpABY6Ay4p8t1xp/DMxhwtGUjIG7dwZkPSA4vAnAcz6pb2DmWGaRmux
	 mmTLRR4Vv6WAc3T35edJrUp03zzauar8qPtNHsnE=
Received: from ntfs3vm.paragon-software.com (192.168.211.95) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 7 Jun 2024 15:16:25 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 17/18] fs/ntfs3: Rename variables
Date: Fri, 7 Jun 2024 15:15:47 +0300
Message-ID: <20240607121548.18818-18-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607121548.18818-1-almaz.alexandrovich@paragon-software.com>
References: <20240607121548.18818-1-almaz.alexandrovich@paragon-software.com>
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

New names make it easier to read code.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/fslog.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 6049ba33d384..389fce092d6d 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4243,9 +4243,9 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	}
 
 	t32 = lrh_length(lrh);
-	rec_len -= t32;
+	attr_names_bytes = rec_len - t32;
 
-	attr_names = kmemdup(Add2Ptr(lrh, t32), rec_len, GFP_NOFS);
+	attr_names = kmemdup(Add2Ptr(lrh, t32), attr_names_bytes, GFP_NOFS);
 	if (!attr_names) {
 		err = -ENOMEM;
 		goto out;
@@ -4277,14 +4277,14 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 	t16 = le16_to_cpu(lrh->redo_off);
 
 	rt = Add2Ptr(lrh, t16);
-	t32 = rec_len - t16;
+	oatbl_bytes = rec_len - t16;
 
-	if (!check_rstbl(rt, t32)) {
+	if (!check_rstbl(rt, oatbl_bytes)) {
 		err = -EINVAL;
 		goto out;
 	}
 
-	oatbl = kmemdup(rt, t32, GFP_NOFS);
+	oatbl = kmemdup(rt, oatbl_bytes, GFP_NOFS);
 	if (!oatbl) {
 		err = -ENOMEM;
 		goto out;
-- 
2.34.1

