Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700DD2FAF
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 14:15:10 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id m28so8619755lfj.6
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s8Ss3Cr4xHNtME0xOZmgxfT13qzdeDxtIo8mhtTPRdQ=;
        b=b1hAro+dRhhRTXDxtIMj73PUK/ldlNQJXp1ccCu3fLVFaK0T+HCmd8CbglRRjqo/1h
         PTuTGjbb6dnB+fKdBL1ZtycdDNCB0Fp+w2QpcxtnuMfvLiTLut3+h2jac1mIKL0uIb35
         t01YafrSMv63QK2aSgb0HK8ga23k4CuoBAAvbOaaEtdUx2D4gxY/GMxRkqeq19NT3BXl
         eXPFkIrar1FfILFiXiP2EjoVmssiTX4ilNQqrwd3I10SlvhRj1De1D0LbRTVhlMdtViP
         nOziC4LFkeIAm0gRFlGW9TM/ElEFmjLez1L6aH6U0TDdy3Cs3/FEzbEqndIvk4tM9oF8
         Tlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s8Ss3Cr4xHNtME0xOZmgxfT13qzdeDxtIo8mhtTPRdQ=;
        b=exjzxRPWkJGh3/mAsri4iWq76t7UuZkkNlI4+io5n89aXHooJVsf6qqMGMzwFUpLuv
         pTCtc8XLICDE+z8jSGn9a2JUXk6Ik8nfKfNf6Bg1fo2hG9YalDrTvY6gdr/x+l4XB3pY
         gUpXw2fozNhYBkMaRhc/v+cvb8UobDnSEOwMsRGy2NhUuPaZL8KKW+QIHVhxW0DrEzFU
         W4MV8LVa1lJGPK+aoZhfl6ZyErZmCNtfX0ulg7pO2Cyobb8+xEQ4KddotwtgWS5sFEet
         9xiR/PNxps1wg6hd/K5004r9y6bNBPWQG/EgKv1UojroaZradWLTeUcVajk+jODqhsyt
         OOMQ==
X-Gm-Message-State: AOAM532mb4IHUMHkTZUQG53ob5rARCbSAB475ER9ibJQrx0h4ASb/6h+
	5VG8V31G0WOSyGgtLdPYivH2CxmV1x3Xjw==
X-Google-Smtp-Source: ABdhPJzB7RfkQrcxwyQlc6PNN00NVi/fJI2Se5eJPpbeOqidinXCHrTFgfQ1uyIPFaf2ijaH5sQJ1w==
X-Received: by 2002:a05:6512:5d4:: with SMTP id o20mr3226924lfo.238.1630419308572;
        Tue, 31 Aug 2021 07:15:08 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i30sm2202187ljb.48.2021.08.31.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:15:08 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] fs/ntfs3: Change right headers to lznt.c
Date: Tue, 31 Aug 2021 17:14:33 +0300
Message-Id: <20210831141434.975175-7-kari.argillander@gmail.com>
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

There is lot of headers which we do not need in this file. Delete them
and add what we really need. Here is list which identify why we need
this header.

<linux/kernel.h> // min()
<linux/slab.h> // kzalloc()
<linux/stddef.h> // offsetof()
<linux/string.h> // memcpy(), memset()
<linux/types.h> // u8, size_t, etc.

"debug.h" // PtrOffset()

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/lznt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/lznt.c b/fs/ntfs3/lznt.c
index 3acf0d9f0b15..0bd3dd61d784 100644
--- a/fs/ntfs3/lznt.c
+++ b/fs/ntfs3/lznt.c
@@ -5,13 +5,13 @@
  *
  */
 
-#include <linux/blkdev.h>
-#include <linux/buffer_head.h>
-#include <linux/fs.h>
-#include <linux/nls.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/types.h>
 
 #include "debug.h"
-#include "ntfs.h"
 #include "ntfs_fs.h"
 
 // clang-format off
-- 
2.25.1

