Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1E529CA
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 17:16:30 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id D6C7F81FE6;
	Tue, 28 Sep 2021 20:16:22 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632849382;
	bh=q9FQW1NyPX+/PEIXZoUtfUROqa82bC7XxrBaUVEa47g=;
	h=Date:To:CC:From:Subject;
	b=Jn1HIwncXV3i6cPUwtI4YlFT5xHagzc+ohiRu/AKMhvQcqH6j8xiU+xdW+x3xCZFv
	 7vn0Rgc/SsFBA19DWM1kcnpM5MGOQz+W5duFqUHtYDs77IW6exfr7C0CEXiFJy1vB5
	 OpOV6NnZinexR4bStw6PDfJ69+u47eD1/mK+wwvs=
Received: from [192.168.211.85] (192.168.211.85) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 28 Sep 2021 20:16:22 +0300
Message-ID: <a7c2e6d3-68a1-25f7-232e-935ae9e5f6c8@paragon-software.com>
Date: Tue, 28 Sep 2021 20:16:20 +0300
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
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<kari.argillander@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH v2 0/3] fs/ntfs3: Refactoring of super.c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.85]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Fix memory leak in ntfs_discard.
Reject mount so we won't corrupt fs.
Refactor ntfs_init_from_boot function.

v2:
  Fixed wrong patch 1/3.
  Merged two changes to the same piece of code.

Konstantin Komarov (3):
  fs/ntfs3: Fix memory leak if fill_super failed
  fs/ntfs3: Reject mount if boot's cluster size < media sector size
  fs/ntfs3: Refactoring of ntfs_init_from_boot

 fs/ntfs3/ntfs_fs.h |  2 --
 fs/ntfs3/super.c   | 36 +++++++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 13 deletions(-)

-- 
2.33.0

