Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7D03DDB09
	for <ntfs3@lists.linux.dev>; Thu,  1 Oct 2026 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855188; cv=none; b=elfkNxn5M47gUG3fBTpEyA0LS9BhD+UpcGiQ0H0QZzHq2fzF2TVu2FJ4Fw4jlj1VQ/CFa7EGZYavN/082/GbKr4ayR2nixz9ZBjjC3xY7TrVJ2/iCRvo1n3bR2+9P/2Gs9G+YwH2KObMOE8Eg4KoDNchVHT/mmB1CujPCf6z3a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855188; c=relaxed/simple;
	bh=22mN/Zqb8A3WZth5RnngnxilDkAVgwgza0/+NBs3OhE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WwHl8XDcGapJCYmgV8OoDB2KI8UlxlxvxcCCsA4DsqhJ6MeuYDoZhIVXsb54rps+27Zm0iLNkFYF1A8oLBEyWC+TEFf/NoZttFX6uWKDvzuNkvjNFeA98bOdFZstKeEwPVenKl9stsDWZzhatKbAhc3vosD+Oo+S2aaBBPJHdMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=eDhfuQZc; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="eDhfuQZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1790855180; x=1822391180;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cJ+4x9N5O37S/cvApiktNuhQViEjgHjtRgvMmynWYqY=;
  b=eDhfuQZcXXmKeSKsTlbHWj7xCd3UiT3gV5gqUPiDrOFp+zLyzEjP06rk
   jBoVS9CJfqP4XrW8mUypo4z3JXt7mU6o7MvtYfu/CiZ+3m1CvHO/ozFX6
   cEdyNaBH2p01kCCcqof1dsLL5LCI8xyfHUFfrIruwfBEq1AWvoDh0YYFK
   966RlrwLfZ4CC3V9WzWgEgiG6c1CIemtZt8Zp3o11WJwiLisVNALu8b1K
   1n2ny6Z6NPsy3SbQ0dGSPE1yV6wGyL0KVbqZSvIDbv7yN7lP4MxuzmI+K
   clpExZPxrOJLhdu0sPl1q09gqc5iHEOmON4q5Mn13ecKXvFWQ0xgBIBo7
   w==;
X-CSE-ConnectionGUID: XpgKx7vcQjeaxpS3P9De1A==
X-CSE-MsgGUID: 1wgvd0sFRs6e4O5r+4A8EQ==
X-IronPort-AV: E=Sophos;i="6.27,134,1787011200"; 
   d="scan'208";a="30159232"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:46:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:3490]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.164:2525] with esmtp (Farcaster)
 id 7509f975-4b3f-4900-bdec-e7b1082dd49d; Thu, 1 Oct 2026 11:46:05 +0000 (UTC)
X-Farcaster-Flow-ID: 7509f975-4b3f-4900-bdec-e7b1082dd49d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 1 Oct 2026 11:46:04 +0000
Received: from dev-dsk-nagornyi-2b-f14a9408.us-west-2.amazon.com
 (10.153.215.117) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 1 Oct 2026
 11:46:04 +0000
From: Nikita Nagornyi <nagornyi@amazon.de>
To: <stable@vger.kernel.org>, Konstantin Komarov
	<almaz.alexandrovich@paragon-software.com>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 6.1.y 0/4] fs/ntfs3: backport slab-out-of-bounds fix (CVE-2026-90048)
Date: Thu, 1 Oct 2026 11:45:45 +0000
Message-ID: <20261001114549.162469-1-nagornyi@amazon.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This series backports the fix for a slab-out-of-bounds write in the ntfs3
driver (CVE-2026-90048, an Important / CVSS 7.8 issue) to 6.1.y, together
with its stable dependency chain.

Four commits do not cherry-pick cleanly onto 6.1.y, so each carries a comment,
where adapted. Applied in order:

  a8f659ce14f8 ("fs/ntfs3: Add more checks in mi_enum_attr (part 2)")
      - dependency
  2afd4d267e6d ("fs/ntfs3: Mark inode as bad as soon as error detected in
      mi_enum_attr()")
      - dependency; introduces the struct ntfs_inode *ni parameter threaded
        through mi_enum_attr()/mi_find_attr()/mi_insert_attr()/mi_new_attt_id()
  5f33da04e6ce ("fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list")
      - dependency
  7c4841e2a627 ("fs/ntfs3: fix slab-out-of-bounds write in
      ni_create_attr_list()")
      - the fix

Built and boot-tested on x86_64 and aarch64. Tested on Amazon EC2 using our
internal test suite, including xfstests, kselftest, LTP; passed with no regressions.

HE WEI（ギカク） (1):
  fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()

Konstantin Komarov (2):
  fs/ntfs3: Add more checks in mi_enum_attr (part 2)
  fs/ntfs3: Mark inode as bad as soon as error detected in
    mi_enum_attr()

Nirbhay Sharma (1):
  fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list

 fs/ntfs3/attrib.c  | 11 +++---
 fs/ntfs3/frecord.c | 81 +++++++++++++++++++++++++----------------
 fs/ntfs3/ntfs_fs.h | 23 ++++++------
 fs/ntfs3/record.c  | 91 +++++++++++++++++++++++++++-------------------
 4 files changed, 120 insertions(+), 86 deletions(-)


base-commit: 1a8763b93150b2c8f3992c27a5ce7857fee4ab0f
--
2.50.1

