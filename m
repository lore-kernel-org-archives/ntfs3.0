Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D684E2F80
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 15:48:02 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 00113120;
	Mon, 27 Sep 2021 18:48:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632757681;
	bh=Y0JHdIH45Xa9ZCUoh5TKDqkYQ3fHtemZz6rs2gmTyBg=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=pM/9bFBVv4P9BQNLjaHj7HHcF2EQ2PXoEv6R5DngqlW6VvoQ3mv3ThX3Wchk5bpwZ
	 Vdnm5gAMBdMM88gUW24SdwahrdMefUotcNqPMODHhSEawxCDuLq7E7jkudj2jA8BEW
	 3eSz3BeRlmT95kfmWHSC1yWNZFgEnt7OnvFJnrj8=
Received: from [192.168.211.27] (192.168.211.27) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 27 Sep 2021 18:48:00 +0300
Message-ID: <6036b141-56e2-0d08-b9ff-641c3451f45a@paragon-software.com>
Date: Mon, 27 Sep 2021 18:48:00 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: [PATCH 2/3] fs/ntfs3: Reject mount if boot's cluster size < media
 sector size
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <16cbff75-f705-37cb-ad3f-43d433352f6b@paragon-software.com>
In-Reply-To: <16cbff75-f705-37cb-ad3f-43d433352f6b@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.27]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

If we continue to work in this case, then we can corrupt fs.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 7099d9b1f3aa..193f9a98f6ab 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -763,9 +763,14 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	sbi->mft.lbo = mlcn << sbi->cluster_bits;
 	sbi->mft.lbo2 = mlcn2 << sbi->cluster_bits;
 
+	/* Compare boot's cluster and sector. */
 	if (sbi->cluster_size < sbi->sector_size)
 		goto out;
 
+	/* Compare boot's cluster and media sector. */
+	if (sbi->cluster_size < sector_size)
+		goto out; /* No way to use ntfs_get_block in this case. */
+
 	sbi->cluster_mask = sbi->cluster_size - 1;
 	sbi->cluster_mask_inv = ~(u64)sbi->cluster_mask;
 	sbi->record_size = record_size = boot->record_size < 0
-- 
2.33.0


