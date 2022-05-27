Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A80185D
	for <ntfs3@lists.linux.dev>; Fri, 27 May 2022 14:15:32 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 419F22628;
	Fri, 27 May 2022 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1653660896;
	bh=67MOUGxu0l15uGeKsZwN2GwiXwDwoeIuJxDyF86Rp9U=;
	h=Date:To:CC:From:Subject;
	b=amn5GupqaKheBOh3foRQJg0q+Q1T9FL43e+1OorHlIYvnwEKZdYfJz2IRiwsJMNy8
	 krwm/TM5NwgnZBeB6neVxrONgK2rSWyKsPPtBGyVmniLxknEDEcRe3AaTLUjy8T877
	 bnVvNzxeRT7j5f9M7Q2gNAN+7Q7n1NhL2OAORC8g=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E352D220D;
	Fri, 27 May 2022 14:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1653660923;
	bh=67MOUGxu0l15uGeKsZwN2GwiXwDwoeIuJxDyF86Rp9U=;
	h=Date:To:CC:From:Subject;
	b=l00AhmcIDSaUNE9GoTj82KzDDZAvSu7h9onySYWhTC/m6KqTtvQGRPIxrYhDdIOCh
	 uXcrk0VPAUB0wgUJJchpz9pZRNcxjKbw9MXq7dIJbxbKY/sACZkRp1OhFvWC01t6nS
	 3Cb4tQPCoBRxA9qy+gjbKHL8voDTmoY0y6IDW0QI=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 27 May 2022 17:15:23 +0300
Message-ID: <75a1215a-eda2-d0dc-b962-0334356eef7c@paragon-software.com>
Date: Fri, 27 May 2022 17:15:23 +0300
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
From: Almaz Alexandrovich <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 0/3] fs/ntfs3: Refactoring and bugfix
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

There are 3 commits.
First - to improve code readability.
Second - bugfix for xfstest (fixing wrong logic).
Third - restructuring function logic so
we can restore inode in some error cases.

Konstantin Komarov (3):
   fs/ntfs3: Refactoring of indx_find function
   fs/ntfs3: Fix double free on remount
   fs/ntfs3: Refactor ni_try_remove_attr_list function

  fs/ntfs3/frecord.c | 49 ++++++++++++++++++++++++++++++++++------------
  fs/ntfs3/index.c   | 20 ++++++-------------
  fs/ntfs3/record.c  |  5 ++---
  fs/ntfs3/super.c   |  8 ++++----
  4 files changed, 49 insertions(+), 33 deletions(-)

-- 
2.36.1

