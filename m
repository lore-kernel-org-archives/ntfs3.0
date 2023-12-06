Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7B63EA71
	for <ntfs3@lists.linux.dev>; Wed,  6 Dec 2023 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="b9ns4krg"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 860301D0B;
	Wed,  6 Dec 2023 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1701875302;
	bh=nuQ7oyEDVSuk9DOyuMG/cLB7BA1E7v6X/Af9iud7LTk=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=b9ns4krgsqsEKFEpkwSUxPt90w7J8llYZPi9MyON8+FjGR7kqRSI3r83ZLpiL8lua
	 ljtibIPMsXBzU9i7KmTZE+TYjrZbhXEUlTTPX1RmZnUNPjnPkSSmcbBBJ+/dCgQp0e
	 QeHhsteLuAYXMv33bEAa0QG5/Ze27T+lmW+bHQoM=
Received: from [172.16.192.129] (192.168.211.144) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 6 Dec 2023 18:14:46 +0300
Message-ID: <8babdfbc-5be7-428d-9c23-ca8ed66f7ec5@paragon-software.com>
Date: Wed, 6 Dec 2023 18:14:46 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 16/16] fs/ntfs3: Fix c/mtime typo
Content-Language: en-US
From: Konstantin Komarovc <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <00fd1558-fda5-421b-be43-7de69e32cb4e@paragon-software.com>
In-Reply-To: <00fd1558-fda5-421b-be43-7de69e32cb4e@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)


Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/frecord.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 8744ba36d422..6ff4f70ba077 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3291,7 +3291,7 @@ int ni_write_inode(struct inode *inode, int sync, 
const char *hint)
              modified = true;
          }

-        ts = inode_get_mtime(inode);
+        ts = inode_get_ctime(inode);
          dup.c_time = kernel2nt(&ts);
          if (std->c_time != dup.c_time) {
              std->c_time = dup.c_time;
-- 
2.34.1

