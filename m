Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713810FD
	for <ntfs3@lists.linux.dev>; Fri, 25 Jul 2025 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753452077; cv=none; b=uOAA6iBlnmirIvD4nQnSa+1Q2pCDlrjkV37C8XeTWvWLabCirw7JHfkA/8xBaGukjdjhi08KCd+cs2aJAnV/F2beVsljOpwzuMdtoBxqq/aDVsMO3KvTVXYO7E5+pIksZSLLNxfzTOKbpPc5aJ6C+bjqGgGmqtvMcQLwDk/cZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753452077; c=relaxed/simple;
	bh=CU/ofPcM/4/31XAsGzsSMeFb1aVoCrvt6kL7NaWtHiU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MTfxHf7Q8t4HMGv0t7pa6cmgYs8rWvEeWbsUiZyT8Fp7YQlhHooGLGo01tSbB3z1GiCtQvCRVAorTGtNYyhejdR36Ii7+0BWMcag8SoVS6kIuKskoy0GKJv0LCdVIpVaqBWGoNcmJxvC6g4z7gz1UatHkIV+6Onicz9K4trtBtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=EHENJhpt; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="EHENJhpt"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id E69301D1A;
	Fri, 25 Jul 2025 13:52:57 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=EHENJhpt;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C7FA12302;
	Fri, 25 Jul 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1753451661;
	bh=XERKZUg/mSTGqo3b6VJtn4q+/PRdwVrweknVT9vWgnc=;
	h=From:To:CC:Subject:Date;
	b=EHENJhpt+Erc+3kdzeeDpP8aVnliX60cIimbGnBxooKRug3QbnmrkyHP+JBDTpBqL
	 VKtASoDe/nfYuyGEEoEH7H0ATe17p0bHnwr38TbyRqnAGn1LWXsfGV900XCzxLHcSb
	 hscmdNckkIWUi+eVsPhHyV+BPLXG6Noo118Vf4oI=
Received: from localhost.localdomain (172.30.20.191) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 25 Jul 2025 16:54:20 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <torvalds@linux-foundation.org>
CC: <ntfs3@lists.linux.dev>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [GIT PULL] ntfs3: bugfixes for 6.17
Date: Fri, 25 Jul 2025 15:54:11 +0200
Message-ID: <20250725135411.4064-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.43.0
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

Please pull this branch containing ntfs3 code for 6.17.

Regards,
Konstantin

----------------------------------------------------------------
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Paragon-Software-Group/linux-ntfs3.git tags/ntfs3_for_6.17

for you to fetch changes up to a49f0abd8959048af18c6c690b065eb0d65b2d21:

  Revert "fs/ntfs3: Replace inode_trylock with inode_lock" (2025-07-08 09:42:21 +0200)

----------------------------------------------------------------
Changes for 6.17-rc1

Added:
    sanity check for file name;
    mark live inode as bad and avoid any operations.

Fixed:
    handling of symlinks created in windows;
    creation of symlinks for relative path.

Changed:
    cancel setting inode as bad after removing name fails;
    revert "replace inode_trylock with inode_lock".

----------------------------------------------------------------
Edward Adam Davis (1):
      fs/ntfs3: cancle set bad inode after removing name fails

Konstantin Komarov (2):
      fs/ntfs3: Exclude call make_bad_inode for live nodes.
      Revert "fs/ntfs3: Replace inode_trylock with inode_lock"

Lizhi Xu (1):
      fs/ntfs3: Add sanity check for file name

Rong Zhang (2):
      fs/ntfs3: fix symlinks cannot be handled correctly
      fs/ntfs3: correctly create symlink for relative path

 fs/ntfs3/dir.c     |  6 ++--
 fs/ntfs3/file.c    | 37 +++++++++++++++++++++-
 fs/ntfs3/frecord.c | 31 +++++++++++++------
 fs/ntfs3/fsntfs.c  |  6 +++-
 fs/ntfs3/inode.c   | 91 ++++++++++++++++++++++++++++++++++--------------------
 fs/ntfs3/namei.c   | 26 +++++++++++-----
 fs/ntfs3/ntfs.h    |  3 +-
 fs/ntfs3/ntfs_fs.h | 17 ++++++++--
 fs/ntfs3/xattr.c   | 22 +++++++++++--
 9 files changed, 178 insertions(+), 61 deletions(-)
