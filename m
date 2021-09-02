Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B6A2FAE
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 15:41:13 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id s3so4347114ljp.11
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9bncv85/JJCCaREC35kjKL89O+ainDxXdQOs8Fi7i0=;
        b=OWUFbUhT0oofSMmrvEFc6NIXYk/HSsKtJtrGNZ4STbrpJMaiQLcCMMjTZ+HTRwGvPR
         xYiGyDPSddJvVoxs4ZFJKH7DFETpzTJMfn7v+xXZIYBSplg8JDfSmwcbBoDjaxeYKLy9
         E3Q1EmX6GHK/UjX+NDkbVRlZIVKF9uKoqfDpqnqsEd2p8UDn71H1PugdkcrP+ph73Nzw
         /iv1fnViiOv+NNoyO98Zm75WNc00CoR3Uyc9glyoDtb42j9dVvCfE6e1JUVrRjZ+E53h
         +IUlH0QYLkYuZ/3vuSryLm+hK3ajIfl+/juJNcuVv0aaKhdayUXQ4d06I2NXyObN4tJ3
         iVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9bncv85/JJCCaREC35kjKL89O+ainDxXdQOs8Fi7i0=;
        b=XkPP7tBIq+njJDquQJY5Y+l0PsWOaakI8acO+/w52xwW9m91UY6x6V9LwJeLAhl3u5
         fGocKfmzwYHT00j5y2IzEjuw9xDSNldWtYdod8EUd+vqx+KkZgAvbq+E3nnamNkEJQUM
         xi2VKTvGHrE9uV6iY6UXbo9XTSAPFheH/0ak9abp+eMiKCL7riS9HwvPlm2vQ2EX8Bry
         OHMOk0IaJ09vtj9JcE0ffk7aoOUL/47guCA/iv3tzMZQdYqNctzX1+j7mceVhBK2Fq7A
         gk9oQdGlOgK4SQhSN5nK3lHhMvFnxa5kvtnDUq0eXGB6rdDJ0lqXqjRtq3Y4RMFPFO+O
         LlvA==
X-Gm-Message-State: AOAM5327IoCnZ0LQzSqaaMCZ9G+qevlK4SJ6uONir2tMaTwveJDDsBBm
	OzJ+vzYHiXGI5OXdKa1cUbg=
X-Google-Smtp-Source: ABdhPJwt5RqLRFRoiLF0iWsD6NCFK14WaR63lDmRlTtIwMBnSqPofnHaoviREKu680dl1bK34xo0Og==
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr3172997ljb.62.1630597271616;
        Thu, 02 Sep 2021 08:41:11 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id 25sm258630ljw.31.2021.09.02.08.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:41:11 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH 2/3] fs/ntfs3: Make binary search to search smaller chunks in beginning
Date: Thu,  2 Sep 2021 18:40:49 +0300
Message-Id: <20210902154050.5075-3-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902154050.5075-1-kari.argillander@gmail.com>
References: <20210902154050.5075-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We could try to optimize algorithm to first fill just small table and
after that use bigger table all the way up to ARRAY_SIZE(offs). This
way we can use bigger search array, but not lose benefits with entry
count smaller < ARRAY_SIZE(offs).

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/index.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 8bac9d20e7e3..e336d5645628 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -8,6 +8,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/fs.h>
+#include <linux/kernel.h>
 #include <linux/nls.h>
 
 #include "debug.h"
@@ -680,8 +681,9 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 #ifdef NTFS3_INDEX_BINARY_SEARCH
 	struct NTFS_DE *found = NULL;
 	int min_idx = 0, mid_idx, max_idx = 0;
+	int table_size = 8;
 	int diff2;
-	u16 offs[64];
+	u16 offs[128];
 
 	if (end > 0x10000)
 		goto next;
@@ -701,7 +703,7 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 		off += e_size;
 
 		max_idx++;
-		if (max_idx < ARRAY_SIZE(offs))
+		if (max_idx < table_size)
 			goto fill_table;
 
 		max_idx--;
@@ -719,6 +721,7 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 				return NULL;
 
 			max_idx = 0;
+			table_size = min(table_size * 2, 128);
 			goto fill_table;
 		}
 	} else if (diff2 < 0) {
-- 
2.25.1

