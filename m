Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2167022619
	for <ntfs3@lists.linux.dev>; Tue, 23 Apr 2024 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713854704; cv=none; b=kiouU894CueXODT5i0hdmjjiBS0u6kezkTAaVnXsjyIIo9wDVqydmMa1VjOrgz9CCYXvG7aWrSeSEUlXDmVmTlNtTInpMbbD8kw7+8t7n0nKrAObsog/EtYCcuPYuBRtAlydOzuDw5gkmd/woZ3QcDUom7H1PMH9bRuxCNpPGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713854704; c=relaxed/simple;
	bh=yHYr9NZjTLV0KVkaIOczsUbndTX5BtsZ0/S7Jb6UjRc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZOxo9hYCQfvBYcJoGZwSxohNjiSd1mf7SHk6VAibBAhUbh9K3ueoI0ZnhOtICyT3LVb+ghCqGe92CXm9+qEc0QWm4UHdG8FljRIzkDIzUY2NaoshSYl3akLQVRRZhu5rE2/NuZkvXx9Bk167HFAyz2ygKhMSiqnVTpIXk+viVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=duK+jLT4; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="duK+jLT4"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 336401E80;
	Tue, 23 Apr 2024 06:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1713854243;
	bh=UmmlvBrk+NXAV/C0GvIsRMJbpjN8Ah/dZtXPiVlu6rQ=;
	h=From:To:CC:Subject:Date;
	b=duK+jLT4mqOFh4/ba2+8zXBJSlzAzybg0zVDV0WpOU4hrxjViTssHSMHd75r6bUZb
	 Pc0Qb7rV5SHUR3b3b2xsozcRE5nca3OUdapgpFLGv5U2kEaLuUT66C1NkRhC3SlnQU
	 Nu0HEMV1/4DWeYPMZXewqPFgZrx4io8+bIpMq09g=
Received: from ntfs3vm.paragon-software.com (192.168.211.160) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 23 Apr 2024 09:44:54 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH v2 0/9] Bugfix and refactoring
Date: Tue, 23 Apr 2024 09:44:19 +0300
Message-ID: <20240423064428.8289-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

v1->v2:
Here is a reworked series of patches with corrected formatting and layout:
- two patches have been removed for finalization;
- proper commit messages were added;
- important patches have been moved to the beginning of the series
(refactoring at the end).

This series contains various fixes and refactoring for ntfs3.
Fixed problem with incorrect link counting for files with DOS names.

Konstantin Komarov (9):
  fs/ntfs3: Taking DOS names into account during link counting
  fs/ntfs3: Remove max link count info display during driver init
  fs/ntfs3: Missed le32_to_cpu conversion
  fs/ntfs3: Check 'folio' pointer for NULL
  fs/ntfs3: Use 64 bit variable to avoid 32 bit overflow
  fs/ntfs3: Use variable length array instead of fixed size
  fs/ntfs3: Redesign ntfs_create_inode to return error code instead of
    inode
  fs/ntfs3: Always make file nonresident on fallocate call
  fs/ntfs3: Mark volume as dirty if xattr is broken

 fs/ntfs3/attrib.c  | 32 ++++++++++++++++++++++++++++++++
 fs/ntfs3/file.c    |  9 +++++++++
 fs/ntfs3/fslog.c   |  5 +++--
 fs/ntfs3/inode.c   | 46 ++++++++++++++++++++++++++--------------------
 fs/ntfs3/namei.c   | 31 ++++++++-----------------------
 fs/ntfs3/ntfs.h    |  2 +-
 fs/ntfs3/ntfs_fs.h | 10 +++++-----
 fs/ntfs3/record.c  | 11 ++---------
 fs/ntfs3/super.c   |  2 --
 fs/ntfs3/xattr.c   |  5 ++++-
 10 files changed, 90 insertions(+), 63 deletions(-)

-- 
2.34.1

