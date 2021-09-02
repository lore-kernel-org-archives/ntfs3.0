Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D32FB3
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:43 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id y6so4594431lje.2
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=++Rs4f7JOpOPm4iAntpiRan10mluJYx8iHbdWicWw8M=;
        b=lEC14+y5MiLjkIUDIA2aZUjMbnz6dvZO52nHKgNzDkFETP2iVyZoFwQsjB5NmqvRre
         n6F9tnkjgSSrpe8PyAp1MhNtSJVTOYPLAPkVADGjN+EuP4Iordj3bk4ZdXBHvEgDlhBy
         FPCipU6dZst3qjlckJ5jEAfwqqbgl09Dac9q2mxDzOL+Om1mc1buwUETYz3ojLIng0w4
         tSIDuoO9c7SEyZXxiPXbVkOUoIEnopTao8lDPqfx8zPO2yZXswF5+ur/qzrva3E11+gU
         DDanPcPZb9L8EMxOOLJMw6L98ZmTbKRHRQ9NsRJ/L60LVe0bP56Tcs405Ii/Kn9FMjIa
         yrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=++Rs4f7JOpOPm4iAntpiRan10mluJYx8iHbdWicWw8M=;
        b=GYuxZFjDr0ir1m2S07phW/rKVYj9+ptDbx1AOz6jOdRROJIPHQKxfsx7F+xY1WQRQV
         mitdjhbPtUgiWgadMZXuOUY4EFX/veqDcfKYBIRVrVE8hukvCgHAt5J7sbv9Qhy9aG21
         TqXK2wwlIUiXjr1GzPNnqTqSP8IOkzVZrs8Ijq2E83DnLQ2wcMwhPjOawiktY4hiX5I1
         pUj/u9wVo+yfoFJ7tpqRv3Q2T5G0zqv0qko3bJY/HhiSbpvAxSnmjLsLFUQqIP0QAVBJ
         Na3f/59+Li6TY7ZGM1mMhKup+KkVp0VPFgD9fhh0spARZAVQvO/4jMyd2FU5FYpi6qef
         yKbw==
X-Gm-Message-State: AOAM530pKkOdSKO9dQbjuc5qFA3DQYXzZy34MLKoaEYj4JA3EQWtc6cZ
	TmSckdSeAvDVBPNfcF9CAucCRWpnDTuaLQ==
X-Google-Smtp-Source: ABdhPJycVEvJnZNItacO3IVPlGR0gX+Jltw3xrnwKv+ySkTFpTK5XwaxRfCPnp7nXAJnTG4ocW2T2w==
X-Received: by 2002:a05:651c:1029:: with SMTP id w9mr3312741ljm.202.1630599342193;
        Thu, 02 Sep 2021 09:15:42 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:41 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] fs/ntfs3: Change right headers to bitfunc.c
Date: Thu,  2 Sep 2021 19:15:25 +0300
Message-Id: <20210902161528.6262-6-kari.argillander@gmail.com>
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

