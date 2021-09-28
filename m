Received: from relaydlg-01.paragon-software.com (relaydlg-01.paragon-software.com [81.5.88.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6429CA
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 17:26:02 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 70A3C821A0;
	Tue, 28 Sep 2021 20:26:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632849960;
	bh=qvcqL2FG70khkZ51nwyvBDfwfec88Co6gUQWcIUcQ84=;
	h=Date:To:CC:From:Subject;
	b=RocjXS3sXc9QhKnzyvnkqougWUjdqK0HBXA12+MtidnZ+5ZluG+suzly50YZMmXVa
	 uINnhryhIqCsN7nio8NiPJ0rvtx7/hL3jokl5Rki+iLcF8t/BAuHTOkfqxTQU145kp
	 yyVKCxoTSkxRZ7H3Gef23Kx4igxHQWQTOecfyqZk=
Received: from [192.168.211.85] (192.168.211.85) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 28 Sep 2021 20:25:59 +0300
Message-ID: <fad6f129-c53f-d751-be43-c403b1031449@paragon-software.com>
Date: Tue, 28 Sep 2021 20:25:58 +0300
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
Subject: [PATCH] fs/ntfs3: Forbid FALLOC_FL_PUNCH_HOLE for normal files
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.85]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

FALLOC_FL_PUNCH_HOLE isn't allowed with normal files.
Fixes xfstest generic/016 021 022

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 5fb3508e5422..02ca665baa5f 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -587,8 +587,8 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
 		truncate_pagecache(inode, vbo_down);
 
 		if (!is_sparsed(ni) && !is_compressed(ni)) {
-			/* Normal file. */
-			err = ntfs_zero_range(inode, vbo, end);
+			/* Normal file, can't make hole. */
+			err = -EOPNOTSUPP;
 			goto out;
 		}
 
-- 
2.33.0

