Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827CFEC1
	for <ntfs3@lists.linux.dev>; Tue, 21 Jun 2022 11:49:23 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 8E20D1D46;
	Tue, 21 Jun 2022 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1655811796;
	bh=SsPWLRwZ+YtjxwDE4Qg+SPcCuy/4HJXnRFWKkUo025w=;
	h=Date:To:CC:From:Subject;
	b=JFy4EqOugen0mS5Y99vJW0JdHQeOS9A/KsYZWk/zJdISab/R+WRcZqOvIvp3D9aA2
	 u118eR9sqBpzm90KUvGCO3m7WL6v/rfp48ig/rUR/CiQnt30ofJM1m07SAr3kW5zTY
	 CLfP5QKYJpQDPh3EIiFGMx13Qg4hQpmSVhykoo9c=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 21 Jun 2022 14:44:05 +0300
Message-ID: <ab1c8348-acde-114f-eb66-0074045731a4@paragon-software.com>
Date: Tue, 21 Jun 2022 14:44:04 +0300
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
Subject: [PATCH 0/2] fs/ntfs3: FALLOC_FL_INSERT_RANGE support
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Added support for FALLOC_FL_INSERT_RANGE

Konstantin Komarov (2):
   fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE) implementation
   fs/ntfs3: Enable FALLOC_FL_INSERT_RANGE

  fs/ntfs3/attrib.c  | 176 +++++++++++++++++++++++++++++++++++++++++++++
  fs/ntfs3/file.c    |  97 ++++++++++++++-----------
  fs/ntfs3/ntfs_fs.h |   4 +-
  fs/ntfs3/run.c     |  43 +++++++++++
  4 files changed, 277 insertions(+), 43 deletions(-)

-- 
2.36.1

