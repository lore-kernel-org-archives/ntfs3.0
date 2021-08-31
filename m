Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4892FAF
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 14:15:03 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id s10so14011366lfr.11
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8yMkLlmv5/TYkf4BDKhvB3k+BZ2DNbH/dnmnkTPG5Eg=;
        b=XsZpAJGok0L+zUBAAOe8pQGLHuB/oIBExrj8p4hgDbzRt2hfGoXeE7NQIjBGpWlHJs
         qbePsxD2CcfrVSRP5eXRrB4E2cuYEZH67KsWFz6kjQAMHm258eYuUr+FY1YYFmi1sKkc
         MDOaehjucKby4J0LOI1qPcE8aI5fN228pkNuzuHLRboTVF0xLYToNd68ctOKoibKp7Ru
         l766sf+9zN56hG64LbskSAkGYjxoCf302Cb6KnoyvtOtIs/1IoqnxNFNj1auxNHwCmCx
         unaGpTmd+Ik5lsrBtEZAr9CfsknQDyjQA2lf+Ko6rsu4dhE7UmbLb+P0a4aRo61Cxiky
         0Dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8yMkLlmv5/TYkf4BDKhvB3k+BZ2DNbH/dnmnkTPG5Eg=;
        b=iZXx14MtlpEY+XAhMjFzMhp2zBnz4I5wFZXArmaethgJyFScuWTHV5AsBFNv1ojNLH
         E76GYa751ttAOt5KNc9sMvWnyvP6WAC6H1dtEkn1chVpcEGgkeoTSMunansLL9Ax4nrx
         IOxwhr92nh8GCCLd4pfEoeizGXLzEBE76ELpUZmQmM8B6P9P79xnRu/nIhsYuC1zTiPR
         RVLN+JfQvGWpz4PT/YXOGE2Mw0k31BrKTvlwV6YZKtOzBOlOyjip+nIaT97bPuJ+yhiQ
         Jou4xOJuE35rIMjZPCKNdj7c5UHumEpSXe9IGC4NfLeDzmSyxrXKl8jkZFyDm/8oYCTL
         JvXA==
X-Gm-Message-State: AOAM532U3HrZNHF1jI0QYO0TENpPp1sBHHAvQSfRV3BQgEPXUyLfomFa
	PquvIZOndbI59wUZNaJ4H5c=
X-Google-Smtp-Source: ABdhPJykUHnWUDIBgYZvJaPTGXq3+KuNzmIMelooQlqR/YD7HGBAPnL7Eq7v/3+gLktwbD6mjKvXsg==
X-Received: by 2002:ac2:5d65:: with SMTP id h5mr23049324lft.477.1630419301206;
        Tue, 31 Aug 2021 07:15:01 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i30sm2202187ljb.48.2021.08.31.07.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:15:00 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] fs/ntfs3: Add missing header files to ntfs.h
Date: Tue, 31 Aug 2021 17:14:28 +0300
Message-Id: <20210831141434.975175-2-kari.argillander@gmail.com>
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

We do not have header files at all in this file. Add following headers
and there is also explanation which for it was added. Note that
explanation might not be complete, but it just proofs it is needed.

<linux/blkdev.h> // SECTOR_SHIFT
<linux/build_bug.h> // static_assert()
<linux/kernel.h> // cpu_to_le64, cpu_to_le32, ALIGN
<linux/stddef.h> // offsetof()
<linux/string.h> // memcmp()
<linux/types.h> //__le32, __le16

"debug.h" // PtrOffset(), Add2Ptr()

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/ntfs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 0fd7bffb98d4..778be353ffe6 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -10,6 +10,15 @@
 #ifndef _LINUX_NTFS3_NTFS_H
 #define _LINUX_NTFS3_NTFS_H
 
+#include <linux/blkdev.h>
+#include <linux/build_bug.h>
+#include <linux/kernel.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "debug.h"
+
 /* TODO: Check 4K MFT record and 512 bytes cluster. */
 
 /* Activate this define to use binary search in indexes. */
-- 
2.25.1

