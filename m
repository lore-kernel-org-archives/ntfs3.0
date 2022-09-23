Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8443C05
	for <ntfs3@lists.linux.dev>; Fri, 23 Sep 2022 12:00:49 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C96892173;
	Fri, 23 Sep 2022 11:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1663934318;
	bh=nWecK01lWlm/+fHoFjSIP0puhvwdtsZ9P4N00vH53BU=;
	h=Date:To:CC:From:Subject;
	b=Wi67S3Us29uKLjNU2fF9bStc8sW3/Qg9pbpsfTE3wnDd1MOr6mHX2w5kulR4kZ1pM
	 VgHUxBfRDpcYiMZvk8RC0asedkSgb+7uXH7UFQGAUaYhBoZD6JpfDfuOmAMhL5UHOr
	 XCIFDA11wHKqHIwEKRhzqwRo97SGVEI2Eu0VLuBw=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id B70BFDD;
	Fri, 23 Sep 2022 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1663934447;
	bh=nWecK01lWlm/+fHoFjSIP0puhvwdtsZ9P4N00vH53BU=;
	h=Date:To:CC:From:Subject;
	b=pgOx/Q2CFvwOhsvvpXltsxnXSu6qMKR/+TojPK6s3GyrnoOg2mK8AFrFIMdV0hXco
	 ga/gVYsm3Ie/thLjTNmVPqR9y1UGRe4migiObIqCjMF66KUOR9IeL+F3cGrfJeg0s4
	 Asn1jNuvgr/3tPydXs75cJnhUiRP0RBub+hFH5BI=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 23 Sep 2022 15:00:47 +0300
Message-ID: <91c21f32-cc6f-2c2e-ebf7-d1d738090aef@paragon-software.com>
Date: Fri, 23 Sep 2022 15:00:46 +0300
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
CC: LKML <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/2] fs/ntfs3: Add option "nocase" and refactoring
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

[PATCH 0/2] fs/ntfs3: Add option "nocase" and refactoring

Added another option that may be useful to users.
I've noticed in fslog.c some linebreaks, that can be fixed with
renaming, so I've done it in second commit.

Konstantin Komarov (2):
   fs/ntfs3: Add option "nocase"
   fs/ntfs3: Rename variables and add comment

  fs/ntfs3/frecord.c |   1 +
  fs/ntfs3/fslog.c   |  24 ++++----
  fs/ntfs3/index.c   |   2 +-
  fs/ntfs3/namei.c   | 139 +++++++++++++++++++++++++++++++++++++++++++++
  fs/ntfs3/ntfs_fs.h |   4 ++
  fs/ntfs3/super.c   |   6 ++
  fs/ntfs3/upcase.c  |  12 ++++
  7 files changed, 174 insertions(+), 14 deletions(-)

-- 
2.37.0


