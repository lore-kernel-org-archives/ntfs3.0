Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318742FAF
	for <ntfs3@lists.linux.dev>; Fri, 24 Sep 2021 16:14:03 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id D5B571D45;
	Fri, 24 Sep 2021 19:13:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632500034;
	bh=6R5pLsxSY5FcfwTzMBSDDdzZ3mn1dn4MVcPqfmX5t3Q=;
	h=Date:To:CC:From:Subject;
	b=Ok0tT6XJwfNWkDpkDoaN8pc3gh8C9oRr695OwgBQvzb0l3G8XALpcIlVUDPzkYiyG
	 xpqjHWDSWnja9Txkd9bb5cTvEuMLBlZOMgI3jft2sAj50dBdE5x2iy+D/uMEP7P4Tv
	 cTcti++101fKXNdmoylijcwgvbFzh3zzBL6EJ6m4=
Received: from [192.168.211.101] (192.168.211.101) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 24 Sep 2021 19:13:54 +0300
Message-ID: <eb131ee0-3e89-da58-650c-5b84dd792a49@paragon-software.com>
Date: Fri, 24 Sep 2021 19:13:54 +0300
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
Subject: [PATCH 0/3] fs/ntfs3: Refactoring of xattr.c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.101]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Removed function, that already have been in kernel.
Changed locking policy to fix some potential bugs.
Changed code for readability.

Konstantin Komarov (3):
  fs/ntfs3: Use available posix_acl_release instead of
    ntfs_posix_acl_release
  fs/ntfs3: Remove locked argument in ntfs_set_ea
  fs/ntfs3: Refactoring of ntfs_set_ea

 fs/ntfs3/xattr.c | 69 ++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 37 deletions(-)

-- 
2.33.0

