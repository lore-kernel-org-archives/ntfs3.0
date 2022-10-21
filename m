Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242D7E
	for <ntfs3@lists.linux.dev>; Fri, 21 Oct 2022 16:53:03 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 734F32201;
	Fri, 21 Oct 2022 16:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1666371028;
	bh=d0P/O+Kp+C+ez1qFGFR5y9BK+bKwVlzJw6ae9PLolSM=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=AYfjMIA9L2KLwAun2Hkba60Oxx3kY9AoQZHIVEE56wUtfe7sM0KRRd6pr11wUCluk
	 /+7UAeTeQQX0SJWuDlDvgTuHFhYAm26ykejFtbm5eu5X5VE6eqSOwGiBKSUZIxDVcZ
	 1NxDhZxhZ2AE+UcowsS6lWhn9rJxCOB5MdpByo4c=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 21 Oct 2022 19:53:01 +0300
Message-ID: <118f7c57-2b66-6ac6-f2e8-f1eccff97ea5@paragon-software.com>
Date: Fri, 21 Oct 2022 19:53:01 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 4/4] fs/ntfs3: Simplify ntfs_update_mftmirr function
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <9a7d08c2-e503-ac1d-1621-20369c073530@paragon-software.com>
In-Reply-To: <9a7d08c2-e503-ac1d-1621-20369c073530@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Make err assignment in one place.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/fsntfs.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 99dc2a287eab..3fe2de74eeaf 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -801,7 +801,6 @@ void ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
  	if (!(sbi->flags & NTFS_FLAGS_MFTMIRR))
  		return;
  
-	err = 0;
  	bytes = sbi->mft.recs_mirr << sbi->record_bits;
  	block1 = sbi->mft.lbo >> sb->s_blocksize_bits;
  	block2 = sbi->mft.lbo2 >> sb->s_blocksize_bits;
@@ -831,8 +830,7 @@ void ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
  		put_bh(bh1);
  		bh1 = NULL;
  
-		if (wait)
-			err = sync_dirty_buffer(bh2);
+		err = wait ? sync_dirty_buffer(bh2) : 0;
  
  		put_bh(bh2);
  		if (err)
-- 
2.37.0


