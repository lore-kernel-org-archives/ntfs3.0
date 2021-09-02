Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EED2FAE
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:45 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id m4so4555233ljq.8
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRjALdNftKwsFYvx9ZiWNuXDnI9NRb0x5Ps0A/eOJkA=;
        b=jEdXJS6PrnxcHfDViOiiKABde/kpu80rb5ToVqNkw1rDmaJy8LTH1vNtQUqoFJzgoo
         OBXITno1gA+u2Zi8kQ4VEbM4EsHTu2RiRO4gigDZqDfBGmXUyNO3yeR/TCQmTJnMw/8G
         Yk2LpmLIzC81coFE73nh0c0wjCgdG04Kk/4nTpp71CTFTF93bWYGhq6dNWAlf1WcicIr
         UnFwUqKFhrL2t3+0y0ZoswnxRmWPc6pb78tJF97Eo2DH2gT/xrvHf53eahoffcvtxBvb
         pCrgF4lgSUDHAnSIR4ZLDTt+QTXCmPZ0daOk/KKcntoMJ/lIgOi+mXg5eIeQ7xe/ARqT
         DbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRjALdNftKwsFYvx9ZiWNuXDnI9NRb0x5Ps0A/eOJkA=;
        b=C01tBtVe0akP3Bxhjf4M8gN1/LldBF09fnFr/TYz82K4gMw5d3zVe4NWuykNxFwbzJ
         vxH3KqbCQJ8qQtKABUmMp5GfK+ShPjc1EBHCdMQ3PMK+4J6xVUjSTsh9nQr4Tl3fP06S
         AIDTNzZfN0ZktsLzSKpsHylke64uNGL2hSoB4SJmD6+C8Ak1wrVlGARw6rFZBKj5/69v
         d8tygv9BTasT4l2JmDOvxMQ3cvEIpoakQchpD081DHCJACdl8Sq3I4sS2+BVMI1QMnSA
         3quV8612fnq07n9co4t1iyHdz4GeVvr4IfFUKdN7HFHn6uG6mmNYRKhmMEUjfq9LZ5UD
         PeNg==
X-Gm-Message-State: AOAM530A8+whPEFGYM10IH+9aU3SAdTG5Yv/k9BffjNTFf7XD7PrMVYe
	X449q/fBT5AZNVrQK6E23UGtS2vOFAupjA==
X-Google-Smtp-Source: ABdhPJwykbAvXHcdsJhqJFLi7/hPfjvDFHuvL/zBpPcIp7PcPrMtYXOSBtgLJDjrmvy9UYtDov2sPQ==
X-Received: by 2002:a2e:a28d:: with SMTP id k13mr3046297lja.446.1630599344084;
        Thu, 02 Sep 2021 09:15:44 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:43 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] fs/ntfs3: Change right headers to upcase.c
Date: Thu,  2 Sep 2021 19:15:26 +0300
Message-Id: <20210902161528.6262-7-kari.argillander@gmail.com>
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

There is no headers. They will be included through ntfs_fs.c, but that
is not right thing to do. Let's include headers what this file need
straight away.

types.h is needed for __le16, u8 etc.
kernel.h is needed for le16_to_cpu()

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/upcase.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/upcase.c b/fs/ntfs3/upcase.c
index bbeba778237e..b5e8256fd710 100644
--- a/fs/ntfs3/upcase.c
+++ b/fs/ntfs3/upcase.c
@@ -5,13 +5,9 @@
  *
  */
 
-#include <linux/blkdev.h>
-#include <linux/buffer_head.h>
-#include <linux/module.h>
-#include <linux/nls.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
 
-#include "debug.h"
-#include "ntfs.h"
 #include "ntfs_fs.h"
 
 static inline u16 upcase_unicode_char(const u16 *upcase, u16 chr)
-- 
2.25.1

