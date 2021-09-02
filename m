Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE812FAE
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:46 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id h1so4556540ljl.9
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yD0wYPOfkCihQvCi3sBoNx5SD2s8GvDXW1YwkxFjNE4=;
        b=psuXoDYMDt7deUWU+DIXMOj9Rr+6zWXUXTkV/p1mEGv8yiEBOXswrnOZLjJlU07mhK
         XGYBuR66NNgUYjYUX1gnAQ6zqtFtEnu9RO9TruiAjmDsJfhRjXnz8K9cJFg9Ub87d64x
         1Peb+PMh/V1zqn7QelAOEynZpKURGrkEF+SajvFDgop3fXcGDK29K+VBGctv7lc4TLad
         u+3OSIh+z2jdZeKIdEOb2LNweg/L63hsTwLE3YJbd07y9OnQahEwKRkGl2HQBft2Qg80
         b7JbKZBHlSYyAhQuP0171NMp5rChbeWfsOF7fXoGantAqswyP6P0zrQEP6FY98GgcQG4
         wGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yD0wYPOfkCihQvCi3sBoNx5SD2s8GvDXW1YwkxFjNE4=;
        b=VU/uWailHQRDJoMzWugBWTDCivvojHTegVqb1eUzHEA4ooEDJEEdWQzrkZavkBZJNT
         gmoAuh/nJmyXs3xoQmEi+UI5VD1EczT3Gy3WeC5jwALS70SpghFJXJVVhYLe1jN8iKDR
         we+k84nSGIBe+AcJiDmCxU648OAAjUtVaXIyM1vJVHMXwHhx0/PoaU8m2yFzbmOlJp7u
         pNXvneZpj4Xk4C4q5F/wjej4PG29nsoLdHKs7LBjVy4KX//TF2GLXwY4HcflOB0CsjWm
         bDwUJ7A5wSc+Uu3QsMDCGNagt8Tff7n0+CSfVpXEUT2TjRru7GCh/0HgxJ7T9c9Yevr6
         abcg==
X-Gm-Message-State: AOAM532Vx8IpIrcCehlLOtkSjwZqLDUKrXJDfjmGiVqWER1+B6kpcyve
	trmBCll0Iz0YgtkAEs1B614=
X-Google-Smtp-Source: ABdhPJyfIb1UjdWimZm/DvPrUeIY+IX5OPMh6IAb6Q3YN9CyrkfB6UkYION52d38omQkCSYDQZF/+g==
X-Received: by 2002:a2e:9ac7:: with SMTP id p7mr3328258ljj.72.1630599345191;
        Thu, 02 Sep 2021 09:15:45 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:44 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] fs/ntfs3: Change right headers to lznt.c
Date: Thu,  2 Sep 2021 19:15:27 +0300
Message-Id: <20210902161528.6262-8-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902161528.6262-1-kari.argillander@gmail.com>
References: <20210902161528.6262-1-kari.argillander@gmail.com>
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
index f1f691a67cc4..12ba42518efe 100644
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

