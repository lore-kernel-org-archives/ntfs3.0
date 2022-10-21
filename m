Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DFB3D6E
	for <ntfs3@lists.linux.dev>; Fri, 21 Oct 2022 16:59:17 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 295122200;
	Fri, 21 Oct 2022 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1666370897;
	bh=WeVn35Qu93dW5uoNZOx7Po56GHqBOQvSph/fAxdOSGc=;
	h=Date:To:CC:From:Subject;
	b=F11S1+Mz0IWKy13Nd+V1DMdcYBHUfWd0xQmbvSLcyQjBfuLrGwKgDV7Rx09CK9noS
	 ZuZbA4nMfxE5zjLpXqWhM9CqySjMGG9H66Rlu5HX7OzS3dY1HyivuLHPeCeIz3ChLK
	 N7ljr6veaL6eBaId8AlkjmwawXhyQVxtS/Y77x/o=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 380352138;
	Fri, 21 Oct 2022 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1666371050;
	bh=WeVn35Qu93dW5uoNZOx7Po56GHqBOQvSph/fAxdOSGc=;
	h=Date:To:CC:From:Subject;
	b=fmKhGWbGQr0hrVd9sPzUmHoEhVlDLVWNajkBBtUD7POB233EVCMy2pTbxrFp6M2i1
	 yXls9NBuXkFPV7OJW9MkFu2kS5mQNv4AxAHHcY0xv5XXqg2+GcRr/S9p0vuI8+TmAE
	 B0ynbPm1cQq9hOEiWzZb25LmfiuzvfTetJcjuWNQ=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 21 Oct 2022 19:50:49 +0300
Message-ID: <9a7d08c2-e503-ac1d-1621-20369c073530@paragon-software.com>
Date: Fri, 21 Oct 2022 19:50:49 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/4] fs/ntfs3: Bugfix and refactoring
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

[PATCH 0/4] fs/ntfs3: Bugfix and refactoring

First part of fixes and refactoring for ntfs3.
These patches must be applied after series
"fs/ntfs3: Fixes for big endian systems", that was missed by me.

Konstantin Komarov (4):
   fs/ntfs3: Add ntfs_bitmap_weight_le function and refactoring
   fs/ntfs3: Fix sparse problems
   fs/ntfs3: Remove unused functions
   fs/ntfs3: Simplify ntfs_update_mftmirr function

  fs/ntfs3/attrib.c  |  34 ++-------------
  fs/ntfs3/bitfunc.c |   4 +-
  fs/ntfs3/bitmap.c  | 100 +++++++++++++++++++++++++--------------------
  fs/ntfs3/dir.c     |   4 +-
  fs/ntfs3/frecord.c |   3 +-
  fs/ntfs3/fsntfs.c  |  33 +--------------
  fs/ntfs3/namei.c   |  13 +++---
  fs/ntfs3/ntfs_fs.h |  13 +++---
  8 files changed, 77 insertions(+), 127 deletions(-)

-- 
2.37.0

