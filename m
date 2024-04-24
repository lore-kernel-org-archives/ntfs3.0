Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE611591EE
	for <ntfs3@lists.linux.dev>; Wed, 24 Apr 2024 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713953510; cv=none; b=o1xQDByOf2ttW60kGfA/q8bgB3MlSBJ6QCiSQA8xxJmxlnNeiW7aDpUVlos0wllxZFdHShTmi4eFE42ZRAFticRd3v3mQDJCqzfXD1bMk2OLqihrZS49r4l8lD1YVURwOZFWqMmxL9LtOtxqGiiWkqagmiNwDsOmDHZAImeKWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713953510; c=relaxed/simple;
	bh=wMFLeAjrypTZM5NhXWmygbjozVdPJvrr5eHHRx7HwmU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WJNL2ACf4ylxoXw+8Jwa4zuwvuVZgp2Z9yi9uY6MgokroowIUL3515BugbNNbRLYGlCZBol8Pxkmytca/M76hSV02wDFPcbf8mO5iEiio1Op3pdUYU2w+j90/C8j+F6XemTcso22IFoEJC+5eVIgCsfLsM19VPtG6QtLe/+1V0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (84.18.126.32) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 24 Apr
 2024 13:11:36 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
CC: Roman Smirnov <r.smirnov@omp.ru>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH 6.1 0/1] fs: ntfs3: fix UBSAN: shift-out-of-bounds in ntfs_fill_super()
Date: Wed, 24 Apr 2024 13:11:13 +0300
Message-ID: <20240424101114.192681-1-r.smirnov@omp.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 04/24/2024 09:53:10
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 184894 [Apr 24 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 18 0.3.18
 b9d6ada76958f07c6a68617a7ac8df800bc4166c
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_one_url, url3}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 84.18.126.32 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;syzkaller.appspot.com:7.1.1,5.0.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 84.18.126.32
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/24/2024 09:58:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 4/24/2024 8:46:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Syzkaller reports out of bounds on shift in ntfs_init_from_boot(). The problem
was fixed in upstream with patch 91a4b1ee78cb100b19b70f077c247f211110348f.
This can be fixed in branch 6.1 with the following patch.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Link: https://syzkaller.appspot.com/bug?extid=010986becd65dbf9464b

Konstantin Komarov (1):
  fs/ntfs3: Fix shift-out-of-bounds in ntfs_fill_super

 fs/ntfs3/ntfs_fs.h |  2 ++
 fs/ntfs3/super.c   | 50 +++++++++++++++++++++++++++++-----------------
 2 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.34.1

