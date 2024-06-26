Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84776D53B
	for <ntfs3@lists.linux.dev>; Wed, 26 Jun 2024 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719405798; cv=none; b=QXTQKw4fuX3XNnb7C8+itDq/cwkrkOjQOLC+yixm7X+l0thehjVsigmYMb78nWtBZqKJ79ViyQalERk+2lQEEAOBPNVSrf8DTLiF3A5sd+b6LUW/8iUKWQUyEWm8eYQxTJnzq9/g55QkUBSduqLktpQ/ggeGy2HbYADr/zjGHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719405798; c=relaxed/simple;
	bh=rm7Eg9K6n3mI8fqdIiX02+3M+D0DjGUMD9cZ3ASTrNA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zlra2Sgxx8C9GM/Lo3zvWgWD4HqQTmHTHXYndo5QFCPXd/jpOJPqfm5naVy3Fsr8V1r2c3v3hpVMU6eMEbNWR44LNHKChHphd31ScE/of3zvAA+A6R+Fb1KIjtK6aChgCDHdkBvx+HclN0e+REcHL0+dKVZpnOK3D//Kt0N2jew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=PhkPdo66; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="PhkPdo66"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id ABFEB217E;
	Wed, 26 Jun 2024 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1719405304;
	bh=ycuR1z8LrpgV7qtP81UiCpVBYHddVSYi5r53luZ0kyE=;
	h=From:To:CC:Subject:Date;
	b=PhkPdo66Mw5w5GuzZacuWrdTJ7dV9vF2WOlXHDK0/nJTFa+ZAezvCbws9LHWrhPeV
	 M72V9O6eKY1i9VySmMB4+kgfJc692WYLfstN3jgRtzUVAUQr2TrCy0xvUS5nz/lIQ5
	 WxP1a5HecvFGfEhJE0s8SnuykPXIMsKxRXbhVT+E=
Received: from ntfs3vm.paragon-software.com (192.168.211.129) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 26 Jun 2024 15:43:07 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 00/11] Bugfix and refactoring
Date: Wed, 26 Jun 2024 15:42:47 +0300
Message-ID: <20240626124258.7264-1-almaz.alexandrovich@paragon-software.com>
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

This series contains various fixes and refactoring for ntfs3.
The 'nocase' option now works correctly.
fileattr was added to support chattr.
Legacy ntfs support was redesigned.

Konstantin Komarov (11):
  fs/ntfs3: Fix field-spanning write in INDEX_HDR
  fs/ntfs3: Fix the format of the "nocase" mount option
  fs/ntfs3: Missed error return
  fs/ntfs3: Keep runs for $MFT::$ATTR_DATA and $MFT::$ATTR_BITMAP
  fs/ntfs3: Do copy_to_user out of run_lock
  fs/ntfs3: Check more cases when directory is corrupted
  fs/ntfs3: Minor ntfs_list_ea refactoring
  fs/ntfs3: Use function file_inode to get inode from file
  fs/ntfs3: Redesign legacy ntfs support
  fs/ntfs3: Implement simple fileattr
  fs/ntfs3: Fix formatting, change comments, renaming

 fs/ntfs3/attrib.c  |   9 ++--
 fs/ntfs3/bitmap.c  |   2 +-
 fs/ntfs3/dir.c     |  54 ++++++++++++++---------
 fs/ntfs3/file.c    | 104 +++++++++++++++++++++++++++++++++++++--------
 fs/ntfs3/frecord.c |  75 ++++++++++++++++++++++++++++++--
 fs/ntfs3/fslog.c   |   8 ++--
 fs/ntfs3/index.c   |   4 +-
 fs/ntfs3/inode.c   |  35 +++++++--------
 fs/ntfs3/namei.c   |   6 +--
 fs/ntfs3/ntfs.h    |   9 ++--
 fs/ntfs3/ntfs_fs.h |  10 +++++
 fs/ntfs3/super.c   |   4 +-
 fs/ntfs3/xattr.c   |  25 +++++------
 13 files changed, 253 insertions(+), 92 deletions(-)

-- 
2.34.1

