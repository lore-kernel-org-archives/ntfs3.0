Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C52972
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 14:28:56 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id i28so16869624ljm.7
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NsN0bPPvCsrWyorA5YRODaEgcyng9oY+K6BTTNsB91c=;
        b=fusIBYP/pW7tKm3U0PWc7v6QwQe3e/OSgkUKCw/hVcNwUgj2exPqNqTSXtZW/0oBSz
         BItlN7i+OVHYOUqXjguwe/KLIa5a07xDMFrTgE/Lg8raJs5LB+oZ28LpmPWf53E7oH+j
         cXy+PXJgs4B0HSqKZ8huaLRqKv3+/ICM8e5/Us3h4qL0coekgO7fQloTefTJBcEaLXU9
         pG+i+y5yMThOCx7k3zAowYmm6B7LjJD2uQy8n9ljRO7SFXZlwMmfXLAqBpHTUWWG1ObF
         Xqnp3bMTfAhwOz682QHrimGn2eA8NMwmMSeH63J5jr0natNVP5kEX2w/KpSdtZGnEohR
         QrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NsN0bPPvCsrWyorA5YRODaEgcyng9oY+K6BTTNsB91c=;
        b=GoRCYWKWnwfct+iMT9+o05tqqa0YIby7WiISHwRhpPUEFZolk8JhExAN8nbqkFxQZl
         wbHBZPMbg1id+FHT+GRrrByre14EwSZH2VRAVVDw4sbbqsar9Xyp+FGjRRgjvbWo82Q4
         CF7hO1bPYOseyvdHw2fQ+jV/0/Y9mBI34LiDr/ZPYiHJqgNokcBtg7L/wUb634uul93i
         PVQvsaxMzFDaAut8rMoFlmD8Hd1zz73qKQeZINm8iqyJ8WX5FmKHWfEN1y/PSbyfDKcj
         Sap9Y4tF//V82V47LMPugT0uFi222lTA/9zExDnVbqCSCRgg7AjMDgNP7eAmpxjouq2Z
         MBjQ==
X-Gm-Message-State: AOAM532Z/dnQX63x3xojubJyjZUftEib/dm2sa+d7EcebtP95bbhTvIN
	124cGziRYgKrNakipy+ojq1FHgyNp6c=
X-Google-Smtp-Source: ABdhPJzsBMszE+ALzBtXa5jKhejAVyexEAWCCthHAZo0/XShvKYC+16avfq4O4pxB592jRpKBDg94w==
X-Received: by 2002:a2e:3e07:: with SMTP id l7mr14422972lja.318.1631024934626;
        Tue, 07 Sep 2021 07:28:54 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id l11sm1014251lfg.39.2021.09.07.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:28:54 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] fs/ntfs3: Use clamp/max macros instead of comparisons
Date: Tue,  7 Sep 2021 17:28:41 +0300
Message-Id: <20210907142842.133181-4-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907142842.133181-1-kari.argillander@gmail.com>
References: <20210907142842.133181-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can make code little more readable by using kernel macros clamp/max.

This were found with kernel included Coccinelle minmax script.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/fsntfs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 99d0a2799b0e..4a0a1aa085d5 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -8,6 +8,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/fs.h>
+#include <linux/kernel.h>
 #include <linux/nls.h>
 
 #include "debug.h"
@@ -420,11 +421,8 @@ int ntfs_look_for_free_space(struct ntfs_sb_info *sbi, CLST lcn, CLST len,
 	/* How many clusters to cat from zone. */
 	zlcn = wnd_zone_bit(wnd);
 	zlen2 = zlen >> 1;
-	ztrim = len > zlen ? zlen : (len > zlen2 ? len : zlen2);
-	new_zlen = zlen - ztrim;
-
-	if (new_zlen < NTFS_MIN_MFT_ZONE)
-		new_zlen = NTFS_MIN_MFT_ZONE;
+	ztrim = clamp_val(len, zlen2, zlen);
+	new_zlen = max_t(size_t, zlen - ztrim, NTFS_MIN_MFT_ZONE);
 
 	wnd_zone_set(wnd, zlcn, new_zlen);
 
-- 
2.25.1

