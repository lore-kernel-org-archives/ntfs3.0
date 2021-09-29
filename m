Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD6B173
	for <ntfs3@lists.linux.dev>; Wed, 29 Sep 2021 16:38:31 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 76B81439;
	Wed, 29 Sep 2021 19:38:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1632933509;
	bh=MOpyRoXmge+JfHU9g9lKQjhfkbKwMhFfVOywlLhqglg=;
	h=Date:To:CC:From:Subject;
	b=NHuYb3m3ZCD9OoE1y2sc/3H5FC9wv6WcXGBNrq3nJaxJEPgzAe2ZjAyp3Gc7TnrN2
	 Ke1BXY6cRvhzmUYnhZfxj1zf/DUa3u86m52D+tyWYrhtR9uYZ6Bbw2Sn6vjDeo1CjK
	 zNT/Cat4fJMwR2gqxqFKqrAajRuHL5f0w4bAXQLc=
Received: from [192.168.211.131] (192.168.211.131) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 29 Sep 2021 19:38:29 +0300
Message-ID: <e6161f84-fe87-d8b3-6e02-d3811152c0d0@paragon-software.com>
Date: Wed, 29 Sep 2021 19:38:28 +0300
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
Subject: [PATCH v2] fs/ntfs3: Forbid FALLOC_FL_PUNCH_HOLE for normal files
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.131]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

FALLOC_FL_PUNCH_HOLE isn't allowed with normal files.
Filesystem must remember info about hole, but for normal file
we can only zero it and forget.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Now xfstests generic/016 generic/021 generic/022 pass.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/file.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 5fb3508e5422..43b1451bff53 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -587,8 +587,11 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
                truncate_pagecache(inode, vbo_down);
 
                if (!is_sparsed(ni) && !is_compressed(ni)) {
-                       /* Normal file. */
-                       err = ntfs_zero_range(inode, vbo, end);
+                       /*
+                        * Normal file, can't make hole.
+                        * TODO: Try to find way to save info about hole.
+                        */
+                       err = -EOPNOTSUPP;
                        goto out;
                }
 
-- 
2.33.0

