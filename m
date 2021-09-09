Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C553FE1
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 10:58:15 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 626C21D37;
	Thu,  9 Sep 2021 13:58:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1631185080;
	bh=fFhI2jZqVUvYHRUsDIGDkYy9fTbmvFt7gL2uySKNajk=;
	h=Date:To:CC:From:Subject;
	b=Zt/T/iUm11rNcXrIFJXskphS5o1q4VE4MjbiHzgoS9VxcTLeMGSm4kxKVvVZ8w/t3
	 PX6RT3Q43QuVKDAXWqETApmvhgmyuj24aV0Q8zD8uzsaWTj4csjs2rVIwpCSXR3M/q
	 6pFQKfZtprsYiXKlVc8XvWvdU+Jpm2Al8/uwNewY=
Received: from [192.168.211.46] (192.168.211.46) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 9 Sep 2021 13:58:00 +0300
Message-ID: <732a18ee-20ea-3e53-056c-8a4d496e5522@paragon-software.com>
Date: Thu, 9 Sep 2021 13:57:59 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH 1/3] fs/ntfs3: Fix insertion of attr in ni_ins_attr_ext
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.46]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Do not try to insert attribute if there is no room in record.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/frecord.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 938b12d56ca6..5dd7b7a7c5e0 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -956,6 +956,10 @@ static int ni_ins_attr_ext(struct ntfs_inode *ni, struct ATTR_LIST_ENTRY *le,
 			continue;
 		}
 
+		/* Do not try to insert this attribute if there is no room in record. */
+		if (le32_to_cpu(mi->mrec->used) + asize > sbi->record_size)
+			continue;
+
 		/* Try to insert attribute into this subrecord. */
 		attr = ni_ins_new_attr(ni, mi, le, type, name, name_len, asize,
 				       name_off, svcn, ins_le);
-- 
2.28.0
