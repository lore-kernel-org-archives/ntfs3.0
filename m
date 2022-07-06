Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E557258B
	for <ntfs3@lists.linux.dev>; Wed,  6 Jul 2022 17:31:29 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B5F7E1D06;
	Wed,  6 Jul 2022 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1657128624;
	bh=TxFto+XyTzzpSGbGmxKAFRhYC4BH97NHqyyBDVSPC14=;
	h=Date:To:CC:From:Subject;
	b=TOFZ47Jv8S/zLdB944jKEvgNjZK9KpdRFOCxO0fRq1KgkVW3bsQAKBne5Dvz4SI7w
	 PHCwZpHnfn+7LL5gK8jvB3Vkp3HU27uRo8ttsiQQ4YEOqdFNGhqB3MX4mb0vOlpn8r
	 uMQdNcwaP2KCpTXO8Rml66BrUgHaxchfd5YAE4Co=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 6FC762133;
	Wed,  6 Jul 2022 17:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1657128686;
	bh=TxFto+XyTzzpSGbGmxKAFRhYC4BH97NHqyyBDVSPC14=;
	h=Date:To:CC:From:Subject;
	b=uV4GCvSLVBrIjnxduhw1q78x8XN27Sq7LdiktiX55UKoKVLD0vS+tlJnhckIbbo50
	 FFuE7Y57cZ9drf9mrz5hqY7bttGnqJpel8JftbvaAqmaAB/KLEg/0XX2FvIjcGQlE0
	 bGmwPfc5pq5bz714eF1eg9/ppjgMcoqNst+vBLKs=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 6 Jul 2022 20:31:26 +0300
Message-ID: <d578fcbe-e1f7-ffc7-2535-52eecb271a01@paragon-software.com>
Date: Wed, 6 Jul 2022 20:31:25 +0300
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
Subject: [PATCH 0/2] fs/ntfs3: Refactoring and improving logic in run_pack
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

2 patches:
- some comments and making function static;
- improving speed of run_pack by checking runs in advance

Konstantin Komarov (2):
   fs/ntfs3: Added comments to frecord functions
   fs/ntfs3: Check possible errors in run_pack in advance

  fs/ntfs3/bitmap.c  |  3 +--
  fs/ntfs3/frecord.c |  8 ++++----
  fs/ntfs3/ntfs_fs.h |  1 -
  fs/ntfs3/run.c     | 41 +++++++++++++++++++++++------------------
  4 files changed, 28 insertions(+), 25 deletions(-)

-- 
2.37.0

