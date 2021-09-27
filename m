Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BC63FCC
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 15:46:19 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id B2740820E8;
	Mon, 27 Sep 2021 18:46:17 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632757577;
	bh=NZiieUg67Jcn8Z9LRxeMObN8UOVIM8Yfq/fco7QwMXw=;
	h=Date:To:CC:From:Subject;
	b=O7P1qsBcuwdooTh5TFRUBqLNhvRfk/UyieUJDGOnNu5K+C2Dnq/vADNSDhwTbmd8P
	 /xYkOMHBVGVDQq1JxIUHo66oiCKngPHI59jPKJ/PciZ/0BPH3HOv1MctqneZrprRCs
	 Ubu8m1NTXohfMkod8dNn+bItPs+YQNSJMCWV2T50=
Received: from [192.168.211.27] (192.168.211.27) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 27 Sep 2021 18:46:17 +0300
Message-ID: <16cbff75-f705-37cb-ad3f-43d433352f6b@paragon-software.com>
Date: Mon, 27 Sep 2021 18:46:16 +0300
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
Subject: [PATCH 0/3] fs/ntfs3: Refactoring of super.c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.27]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Fix memory leak in ntfs_discard.
Reject mount so we won't corrupt fs.
Refactor ntfs_init_from_boot function.

Konstantin Komarov (3):
  fs/ntfs3: Fix memory leak if fill_super failed
  fs/ntfs3: Reject mount if boot's cluster size < media sector size
  fs/ntfs3: Refactoring of ntfs_init_from_boot

 fs/ntfs3/ntfs_fs.h |  2 --
 fs/ntfs3/super.c   | 36 +++++++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.33.0

