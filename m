Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248B156649
	for <ntfs3@lists.linux.dev>; Fri,  1 Nov 2024 08:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449590; cv=none; b=hEiIMoCzwU6hVNZXj9N2lz13aWbdfEXDxRWH0l51w1k+cVtz8Giom5mN3qPVZ6FTZ7Zz9+s4ZcqzIJkmDYG1TfVmfe+VinmaEkYNQbNU7LPm6tagHESSv6hdZpcAikwWU07+lCoxIECiyuY7UPWwC4c/zclGupPl3Gdq8P1jZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449590; c=relaxed/simple;
	bh=eZ1Q7gZqcyt0QTuc3GMXoV5qW8N3MvPQp8VUUrDalG4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WU6d4iFrx/Ujra1LvXwVnmeabh0C+/976NHutmNOhC5TfbvQ5mZorDu034aYy2SRPq9eR/caEzGVWzZjLanC1oItIgV0d9NAgxOjYHH8G+HsdjaITBGnED2iMmNEyL+K4Lf0uUZrWuZDP3dk1CnauYv1TQNXJlZv2rFneDQ4SxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=ZFgLdTT6; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="ZFgLdTT6"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5FC2B218B;
	Fri,  1 Nov 2024 08:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1730448622;
	bh=vQALuUF8TQQ3vlKVBbw30hHmFXQ2qDDoZ1nMgrAFL9E=;
	h=From:To:CC:Subject:Date;
	b=ZFgLdTT6i2CAfSuGIxOnv4xIDtR6L01E1SzmnNP6Ok2DBrTE+aAf9UweIj0RLKYdH
	 W/Gz2v76JYEz/72oqi0gnN4YNqKFvRga1lomi3kEIXMjUQzZQiY4kjnwV5g76IxZ6N
	 0aslrYNKCognnjjMPPCb0X7eHb77PTM5PUDmCYk4=
Received: from ntfs3vm.paragon-software.com (192.168.211.142) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 1 Nov 2024 11:18:05 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/7] fs/ntfs3: Bugfix and minor refactoring
Date: Fri, 1 Nov 2024 11:17:46 +0300
Message-ID: <20241101081753.10585-1-almaz.alexandrovich@paragon-software.com>
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

Mostly continuation of fixing syzbot warnings.

Konstantin Komarov (7):
  fs/ntfs3: Fix warning in ni_fiemap
  fs/ntfs3: Fix case when unmarked clusters intersect with zone
  fs/ntfs3: Equivalent transition from page to folio
  fs/ntfs3: Add more checks in mi_enum_attr (part 2)
  fs/ntfs3: Add check in ntfs_extend_initialized_size
  fs/ntfs3: Switch to folio to release resources
  fs/ntfs3: Accumulated refactoring changes

 fs/ntfs3/attrib.c  |   9 ++--
 fs/ntfs3/bitmap.c  |  62 ++++++++-------------------
 fs/ntfs3/file.c    |  34 +++++++++------
 fs/ntfs3/frecord.c | 104 +++++++--------------------------------------
 fs/ntfs3/fsntfs.c  |   2 +-
 fs/ntfs3/ntfs_fs.h |   3 +-
 fs/ntfs3/record.c  |  16 +++++--
 fs/ntfs3/run.c     |  40 ++++++++++++-----
 8 files changed, 103 insertions(+), 167 deletions(-)

-- 
2.34.1

