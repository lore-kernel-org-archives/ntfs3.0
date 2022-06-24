Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758F23CA
	for <ntfs3@lists.linux.dev>; Fri, 24 Jun 2022 11:40:06 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D4CF01D74;
	Fri, 24 Jun 2022 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1656070746;
	bh=1/1elZUUKD7tI89T7KFg5z8eRLmsFz1VvhO0iissUGM=;
	h=Date:To:CC:From:Subject;
	b=c+aKHTPDJ7weN0SbS1MeDAVimh04arl+fffqRMGC/+RUZD0l9nKZAVGpzcpwecB+H
	 1UXGCkaQBh5BaEwdmFuV/SiHo4xN7Sh7rEixz3pFablhbNpOD5K9HXmCClrkDsbmPS
	 gihoAjBkkcduYeeACf6pXxj1rhycO6i0cw3jDs3I=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 24 Jun 2022 14:39:57 +0300
Message-ID: <f76c96bb-fdea-e1e5-5f47-c092af5fe556@paragon-software.com>
Date: Fri, 24 Jun 2022 14:39:57 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/3] fs/ntfs3: Various bug fixes
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

These commits fix 3 xfstests
Patches are based on version with FALLOC_FL_INSERT_RANGE support
https://lore.kernel.org/ntfs3/ab1c8348-acde-114f-eb66-0074045731a4@paragon-software.com/T/#t

Konstantin Komarov (3):
   fs/ntfs3: Do not change mode if ntfs_set_ea failed
   fs/ntfs3: Check reserved size for maximum allowed
   fs/ntfs3: extend ni_insert_nonresident to return inserted
     ATTR_LIST_ENTRY

  fs/ntfs3/attrib.c  | 46 +++++++++++++++++++++++++++++++---------------
  fs/ntfs3/file.c    |  3 ---
  fs/ntfs3/frecord.c |  4 ++--
  fs/ntfs3/index.c   |  2 +-
  fs/ntfs3/ntfs_fs.h |  2 +-
  fs/ntfs3/xattr.c   | 20 ++++++++++----------
  6 files changed, 45 insertions(+), 32 deletions(-)

-- 
2.36.1

