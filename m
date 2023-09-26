Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4891518E1B
	for <ntfs3@lists.linux.dev>; Tue, 26 Sep 2023 09:57:16 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D74CD21BC;
	Tue, 26 Sep 2023 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1695721883;
	bh=bm/OuTb2k1SKktIcvNOfnXcU6zkoYgiSC7bYVh+F8wM=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=LFKbUDezPewix3D97fm/Cu+G0YjuJU15KhAJ0g5GOkGfyPwZk35Rq51MGSp46698H
	 ftYL9HxtU9bsc6ixQLJ/8BR9nwgZ0+V1O/VHVo5M65Vh4B2dDDGK0CXf+oaBCqT5dx
	 E8AN+uc2Kx/Hz5PGxBz1iEuf606qJPfzRRHM2PT0=
Received: from [172.16.192.129] (192.168.211.137) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 26 Sep 2023 12:57:13 +0300
Message-ID: <a1170a72-0dc1-4092-bb22-7279dcdf3c0a@paragon-software.com>
Date: Tue, 26 Sep 2023 12:57:13 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/8] fs/ntfs3: Fix possible NULL-ptr-deref in
 ni_readpage_cmpr()
Content-Language: en-US
From: Konstantin Komarovc <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <7c217d7d-6ee4-4603-b5f1-ebe7b68cf430@paragon-software.com>
In-Reply-To: <7c217d7d-6ee4-4603-b5f1-ebe7b68cf430@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.211.137]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)


Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/frecord.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index d49fbb22bd5e..dad976a68985 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2148,7 +2148,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct 
page *page)

      for (i = 0; i < pages_per_frame; i++) {
          pg = pages[i];
-        if (i == idx)
+        if (i == idx || !pg)
              continue;
          unlock_page(pg);
          put_page(pg);
-- 
2.34.1

