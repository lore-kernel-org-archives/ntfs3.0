Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6E173
	for <ntfs3@lists.linux.dev>; Wed, 29 Sep 2021 16:35:47 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 23B81439;
	Wed, 29 Sep 2021 19:35:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632933344;
	bh=y6nA3GWCbrV+AJ5phsLcgeh14RzUjW20Sad0AwORUTc=;
	h=Date:To:CC:From:Subject;
	b=AhpB6B8J+eGE7340jiIeikVoLgAhUZHszkpgntE5jvth6TstCAoV49vo/JF6Us/IT
	 XHmxgFNEk2Ax83dJUYKbieev6CZfa+PRsNLYLihWMdgJjwFcgrA2fWZ/bWTPEiSfNd
	 uqv7RQZHWB8zs5yc4U9gYa7rpn912PhpBktrqzAA=
Received: from [192.168.211.131] (192.168.211.131) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 29 Sep 2021 19:35:43 +0300
Message-ID: <227c13e3-5a22-0cba-41eb-fcaf41940711@paragon-software.com>
Date: Wed, 29 Sep 2021 19:35:43 +0300
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
Subject: [PATCH] fs/ntfs3: Check for NULL if ATTR_EA_INFO is incorrect
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.131]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

This can be reason for reported panic.
Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/frecord.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 9a53f809576d..007602badd90 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3080,7 +3080,9 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
                        const struct EA_INFO *info;
 
                        info = resident_data_ex(attr, sizeof(struct EA_INFO));
-                       dup->ea_size = info->size_pack;
+                       /* If ATTR_EA_INFO exists 'info' can't be NULL. */
+                       if (info)
+                               dup->ea_size = info->size_pack;
                }
        }
 
-- 
2.33.0

