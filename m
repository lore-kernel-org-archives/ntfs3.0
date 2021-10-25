Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385CA72
	for <ntfs3@lists.linux.dev>; Mon, 25 Oct 2021 16:57:40 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6F2E11D18;
	Mon, 25 Oct 2021 19:57:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1635181051;
	bh=zE92f7no4pPlDEilsj0pP1PCQtLcS1RcHHNEWDSZNLA=;
	h=Date:To:CC:From:Subject;
	b=qhhE8t+TDmtff5FnK9/CyzHEyTPank/TsaKtaOOnukaMc/ec8AV1v+gC4LoLAfHQn
	 AstlWKoplKfwaVsEKnslHsZr4i/zeI5NdRnx5b/9Y13vwzFfyiHN3oY47FphVT22FK
	 m7fKWTx44HhwwTMf1G13aL7Ib9CKN6xhM39GGg4U=
Received: from [192.168.211.155] (192.168.211.155) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 25 Oct 2021 19:57:31 +0300
Message-ID: <25b9a1b5-7738-7b36-7ead-c8faa7cacc87@paragon-software.com>
Date: Mon, 25 Oct 2021 19:57:30 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/4] fs/ntfs3: Various fixes for xfstests problems
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.155]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

This series fixes generic/444 generic/092 generic/228 generic/240

Konstantin Komarov (4):
  fs/ntfs3: In function ntfs_set_acl_ex do not change inode->i_mode if
    called from function ntfs_init_acl
  fs/ntfs3: Fix fiemap + fix shrink file size (to remove preallocated
    space)
  fs/ntfs3: Check new size for limits
  fs/ntfs3: Update valid size if -EIOCBQUEUED

 fs/ntfs3/file.c    | 10 ++++++++--
 fs/ntfs3/frecord.c | 10 +++++++---
 fs/ntfs3/inode.c   |  9 +++++++--
 fs/ntfs3/xattr.c   | 13 +++++++------
 4 files changed, 29 insertions(+), 13 deletions(-)

-- 
2.33.0

