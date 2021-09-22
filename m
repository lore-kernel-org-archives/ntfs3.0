Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA6A3FC7
	for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 16:15:29 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 7BEED82304;
	Wed, 22 Sep 2021 19:15:20 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632327320;
	bh=M5bfFgoFlXE4KcXmZ923eoBepB1UY06djY36XfpJqD8=;
	h=Date:To:CC:From:Subject;
	b=AnMm+MOUivqDSWHpbRKht4sFkHLQT7L8HPV68cpsn0MjCXqblrfjIydc08/7e4tjY
	 V3PJq2xYOaIQ4BVgwbjAmg3X5w3NtDxeTz4TqZDioDVSligWOQzcT97hOwobWYQf1o
	 wMvCFINhroRqEj6nM6VzpbkjCdg/EJNE0e15oyCg=
Received: from [192.168.211.195] (192.168.211.195) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 22 Sep 2021 19:15:20 +0300
Message-ID: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>
Date: Wed, 22 Sep 2021 19:15:19 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/5] Refactor locking in inode_operations
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.195]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Speed up work with dir lock.
Theoretically in successful cases those locks aren't needed at all.
But proving the same for error cases is difficult.
So instead of removing them we just move them.

Konstantin Komarov (5):
  fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode
  fs/ntfs3: Refactor ntfs_get_acl_ex for better readability
  fs/ntfs3: Pass flags to ntfs_set_ea in ntfs_set_acl_ex
  fs/ntfs3: Change posix_acl_equiv_mode to posix_acl_update_mode
  fs/ntfs3: Refactoring lock in ntfs_init_acl

 fs/ntfs3/inode.c | 17 ++++++++--
 fs/ntfs3/namei.c | 20 -----------
 fs/ntfs3/xattr.c | 88 +++++++++++++++++-------------------------------
 3 files changed, 45 insertions(+), 80 deletions(-)

-- 
2.33.0
