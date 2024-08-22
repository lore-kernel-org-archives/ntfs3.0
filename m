Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013A1CC17E
	for <ntfs3@lists.linux.dev>; Thu, 22 Aug 2024 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724342491; cv=none; b=sLaK2LTdYPvcH8AagK3g0bE7upnF+0XDmHHNLK+64TpvomJt02CDludGqGGggRsdCYc/KnauZ8055T1nij1t7JCGFiU2rir/z6SzAcs05GCFxH+qYjRmbpR4j2OftbdIhWaR9AhYds/paHv8zhkOBb5SgdvCEC14r+a5nTeEh+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724342491; c=relaxed/simple;
	bh=EAj6vzOlOtssY1hIGQWlO2sMAKi2kO2/p2ueIrvDLtI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AGwX5Szw4EI9lrvL6eLo1FqnjqsoBhY9OHlA9sF60xpfs1+t6uLqxk9HUj9ge21LY8M6f6QJT0imfYcevXnhVYelO/vZrzwHSxN55gEuhEHQdWdDBymDyZ//a2zxtT2XNWepzxu0YwDUKZaQtISd3Vp7ALfIMLB12YoiOMxSJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=C3VDduoJ; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=FGMovMnR; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="C3VDduoJ";
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="FGMovMnR"
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id BA45621D4;
	Thu, 22 Aug 2024 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724341460;
	bh=+9Cxjj5ewNAyiHqG0WkT/4GxljY17nZF4nw5J/qyUhg=;
	h=From:To:CC:Subject:Date;
	b=C3VDduoJ7TMUVEeTYuPv8PI2sRTSfBBOT0jpN/lHmUxyE4tiSUqu894jQTwMvNoDk
	 +awtZxZvBa/+3OF6zMMQXAZKAPNsJxph7NrzRyapmk/9t6eOEjHHNzkxh0k2YH2UDl
	 dbXzZpt9dHvVCUi4Mxh3p85X7u9nThJ6Zg0o8xgE=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id DBA812215;
	Thu, 22 Aug 2024 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1724341936;
	bh=+9Cxjj5ewNAyiHqG0WkT/4GxljY17nZF4nw5J/qyUhg=;
	h=From:To:CC:Subject:Date;
	b=FGMovMnREefJuL8C/CDJqvDon3PtIJdKK4yJ2YwuuJnuqvjGTp7RdY6JQcuD1tMLY
	 U8z863Jf1yHkudq1/c/xQSg/l2rN0Ql8TuAol+l3zp40TiyBecGgGFEbQY4lVDERT4
	 /5e31hnTTUku8Msjl7DIE2oeR5ytA1v1axF3u8Xc=
Received: from ntfs3vm.paragon-software.com (192.168.211.133) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 22 Aug 2024 18:52:16 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 00/14] fs/ntfs3: Bugfix and work with compression
Date: Thu, 22 Aug 2024 18:51:53 +0300
Message-ID: <20240822155207.600355-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.34.1
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

Here are fixes for sparse warnings, possible deadlooks.
Refactoring was done with extraction of common code and some optimizations.
Added the ability to set a compression attribute (chattr).

Konstantin Komarov (14):
  fs/ntfs3: Do not call file_modified if collapse range failed
  fs/ntfs3: Optimize large writes into sparse file
  fs/ntfs3: Separete common code for file_read/write iter/splice
  fs/ntfs3: Fix sparse warning for bigendian
  fs/ntfs3: Fix warning possible deadlock in ntfs_set_state
  fs/ntfs3: Remove '__user' for kernel pointer
  fs/ntfs3: Refactor enum_rstbl to suppress static checker
  fs/ntfs3: Stale inode instead of bad
  fs/ntfs3: Add rough attr alloc_size check
  fs/ntfs3: Make checks in run_unpack more clear
  fs/ntfs3: Implement fallocate for compressed files
  fs/ntfs3: Add support for the compression attribute
  fs/ntfs3: Replace fsparam_flag_no -> fsparam_flag
  fs/ntfs3: Rename ntfs3_setattr into ntfs_setattr

 fs/ntfs3/attrib.c  |  96 ++++++++++++++++++++++---
 fs/ntfs3/file.c    | 176 +++++++++++++++++++++++++++++++++------------
 fs/ntfs3/frecord.c |  74 ++++++++++++++++++-
 fs/ntfs3/fslog.c   |  19 ++++-
 fs/ntfs3/inode.c   |  15 ++--
 fs/ntfs3/namei.c   |   4 +-
 fs/ntfs3/ntfs_fs.h |   8 ++-
 fs/ntfs3/record.c  |   3 +
 fs/ntfs3/run.c     |   8 ++-
 fs/ntfs3/super.c   |  57 ++++++++-------
 fs/ntfs3/xattr.c   |   2 +-
 11 files changed, 360 insertions(+), 102 deletions(-)

-- 
2.34.1

