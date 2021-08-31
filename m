Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79683FC2
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 14:15:07 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id b4so38795143lfo.13
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=++Rs4f7JOpOPm4iAntpiRan10mluJYx8iHbdWicWw8M=;
        b=h5NwXmOzJteq0gWLVmZfN3WIEEch2492GbeIThQE3oUIjKC2vZAFkPFJ1jkAaKeAHH
         DJI3KdnkQFaupKRfAsBJ7WxnFUCoFvYfyW+mVowGq/8ReMcVz718tDSOg7uxOO1FtQ9G
         3IardJ2Lf+wdMJibTKFsuJdIvylE/+UppdKBjh5VD+ptaTTua2m/P8qaM9qZKtIlxiKV
         J9m51HnK98oR9gHmxxe/2wmlaDt/7JUQqBXNqy6JBkp9rFfbVFBPzy+pPpKXLG5tThvO
         5R7yOFINcvDtlcaGEH4S6ELh+2PF19uewAycoujvsN8fhZ5NnjNj5NjuDYAm2hyAqxJs
         t4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=++Rs4f7JOpOPm4iAntpiRan10mluJYx8iHbdWicWw8M=;
        b=FZeEqx2156B+VjnL8fAetkihZ4Zcl0QE73hnDWhtvJBKKdInlq7rkcdQJq1ga0rXJ8
         ZMcu3w+YuMP1/zQpIvZfLVRpJp/YlKRdCbhZMntzkwbQcPcjRg9FgBF5MMRndewkkHwv
         yos8tflJmH5cT9V+7oy+Kml6WQ2slkrx+lq3KeQh1bF7CvumE1dQVa4+qngPutiMnI2p
         aVu9JYcsG/TwOzDWXmoIryVlOvsHWsUboJKYOBEibfG2yjkxQTHezufmCkc3q+8C5MmK
         lTNR2plPq8IcRWOYW9w9Eva4buglcK2DiOuZbqcSG453y2gQKDFP79dBe3MFAKSjaq15
         qzIg==
X-Gm-Message-State: AOAM5331Fpw1uhuapN5qb1emaPPSprowV41BNwoN+DIluGFQie9fQ4uW
	2GyhhsmMkaO/kTbAnglQzS8=
X-Google-Smtp-Source: ABdhPJxttmC1NGeHO7CLnQY2WziC1mG5M97QGaW7ORzJW8lZQktRMuK+c7acbG0/YNPi7q2D0tY3TA==
X-Received: by 2002:a05:6512:2307:: with SMTP id o7mr18775362lfu.352.1630419306081;
        Tue, 31 Aug 2021 07:15:06 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i30sm2202187ljb.48.2021.08.31.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:15:05 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] fs/ntfs3: Change right headers to bitfunc.c
Date: Tue, 31 Aug 2021 17:14:31 +0300
Message-Id: <20210831141434.975175-5-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831141434.975175-1-kari.argillander@gmail.com>
References: <20210831141434.975175-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We only need linux/types.h for types like u8 etc. So we can remove rest
and help compiler a little bit.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/bitfunc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fs/ntfs3/bitfunc.c b/fs/ntfs3/bitfunc.c
index ce304d40b5e1..bf10e2da5c6e 100644
--- a/fs/ntfs3/bitfunc.c
+++ b/fs/ntfs3/bitfunc.c
@@ -5,13 +5,8 @@
  *
  */
 
-#include <linux/blkdev.h>
-#include <linux/buffer_head.h>
-#include <linux/fs.h>
-#include <linux/nls.h>
+#include <linux/types.h>
 
-#include "debug.h"
-#include "ntfs.h"
 #include "ntfs_fs.h"
 
 #define BITS_IN_SIZE_T (sizeof(size_t) * 8)
-- 
2.25.1

