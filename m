Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797712B70
	for <ntfs3@lists.linux.dev>; Tue, 26 Sep 2023 09:55:04 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 2C14521B2;
	Tue, 26 Sep 2023 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1695721752;
	bh=kAFpjOH/j+mFhP/dbJ+h064bbKIbyxWjdj14UYWkif4=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=sf7vwL7pD4XmCvSSu1u+/Qs9dywy2OUuIS41mzq8+6cDl7HRW58DdJE/pGbXdxG7W
	 8esrH546aBgfPm0c16uslwljvDC00HdawiqaakDlhlt6Lk1gGiaAgMwwUPVFNVKE/I
	 ePGBBbv0r3b4HuOvkrncANp+eXRa5IeymtUbLlmM=
Received: from [172.16.192.129] (192.168.211.137) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 26 Sep 2023 12:55:02 +0300
Message-ID: <48fb5955-7d88-4133-8c85-47eb53248825@paragon-software.com>
Date: Tue, 26 Sep 2023 12:55:02 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/8] fs/ntfs3: Use inode_set_ctime_to_ts instead of
 inode_set_ctime
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
  fs/ntfs3/inode.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index eb2ed0701495..2f76dc055c1f 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -170,8 +170,8 @@ static struct inode *ntfs_read_mft(struct inode *inode,
          nt2kernel(std5->cr_time, &ni->i_crtime);
  #endif
          nt2kernel(std5->a_time, &inode->i_atime);
-        ctime = inode_get_ctime(inode);
          nt2kernel(std5->c_time, &ctime);
+        inode_set_ctime_to_ts(inode, ctime);
          nt2kernel(std5->m_time, &inode->i_mtime);

          ni->std_fa = std5->fa;
-- 
2.34.1

