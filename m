Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ECA23B7
	for <ntfs3@lists.linux.dev>; Fri, 30 Dec 2022 11:23:08 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 121FD20EE;
	Fri, 30 Dec 2022 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1672399173;
	bh=kP3p0IoMx80T17qzhnWU9PKl5JGLg67woKpu7rEhMmc=;
	h=Date:To:CC:From:Subject;
	b=CJ4gVNh0O4UUY+5ERNg+11nhkKZjGEqv9wR/7zghoNf0tn44DTmX9RAsSpa2BE5KO
	 vUU1yozoCH0Gm6ltvVmjizQd0VQQJy4FKZ0aQP5KbybUziwjfASyJnqxyweucbWBjf
	 hNeUFtchLJzfsmna803ccgqaVFcFzRu8yz2a1qIo=
Received: from [192.168.211.146] (192.168.211.146) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 30 Dec 2022 14:23:05 +0300
Message-ID: <b06828df-f9b9-1c5d-d6db-05839bad7016@paragon-software.com>
Date: Fri, 30 Dec 2022 15:23:04 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/5] fs/ntfs3: Refactoring and bugfix
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.211.146]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

This series contains various fixes and refactoring for ntfs3.

Konstantin Komarov (5):
   fs/ntfs3: Add null pointer checks
   fs/ntfs3: Improved checking of attribute's name length
   fs/ntfs3: Check for extremely large size of $AttrDef
   fs/ntfs3: Restore overflow checking for attr size in mi_enum_attr
   fs/ntfs3: Refactoring of various minor issues

  fs/ntfs3/bitmap.c  |  3 ++-
  fs/ntfs3/frecord.c |  2 +-
  fs/ntfs3/fsntfs.c  | 22 ++++++++++++++--------
  fs/ntfs3/index.c   | 10 ++++++----
  fs/ntfs3/inode.c   |  8 +++++++-
  fs/ntfs3/namei.c   |  2 +-
  fs/ntfs3/ntfs.h    |  3 ---
  fs/ntfs3/record.c  |  5 +++++
  fs/ntfs3/super.c   | 10 +++++++++-
  9 files changed, 45 insertions(+), 20 deletions(-)

-- 
2.34.1

