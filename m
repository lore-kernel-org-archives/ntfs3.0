Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0573FC2
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 14:15:09 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id l10so4624876lfg.4
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eOuXnASyI2WtXKZIGPGikBs28mgrhh5PKaySunE0Iuc=;
        b=h6hZX6BNledGIbqIuMUSHSrf+46C4OmsSwKZtqdjyBJKaRWbKCM42lSZV++DSEjOdO
         OIu5hIjv27BcaQjIOTbXGe80mjggT/+owSvjs8SbxC9hLGCUA17zwB+GV/DiWpz4fHqg
         wk7qkG4Le7t+66gwGCao5YvSpEoRV4eNw91DL5TuQf1sX7FbwLhcgKybBYxcc/zyd0u3
         Pb3QKVx8bnBbkXnSvadPLk4Bzt2LraDwlqnTGx/P8uc78WV0XUM/3KuB9260pD7Q2AoM
         Zpd3HJ7x1MHuGLaz1+Y0GqMa+0gmdFcl47NYxKLV1CSlNidYUiBFEdbDmRYlvwE4/xno
         j/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eOuXnASyI2WtXKZIGPGikBs28mgrhh5PKaySunE0Iuc=;
        b=KYOXLelB+o0HkzyDquotYiEimvwpW4RJ/9U+S7Wlt4C8u91zO/xxAGXXnfSeeoaiYH
         N/yRt3+xPIeoEGZoQVJkGnDasGQ6lxft/ojmptauYohLFzCPeH2RECr+uwHQGoCl02QL
         J58fn0vTtcvel7NrDED4q7MLiNhLhN5fQbUWeSoRxYQAvWW8RGC1qH23aCIOvIdZ5PG9
         wKrVdE2gsGcq3VChi9yyKEihVqJ1hDCYpYft0PfOv9YutIjRZIeafgI11jDquZqnUAUa
         l7dmWuLFzkzh8Rg44rSc+3A9ztwEgVw1tWAIrlSjmiUmIsJCYDRD6WIbMeTSMKxaa+ND
         t7ow==
X-Gm-Message-State: AOAM532SZqIExAi3LyU+V9b58f56vbhG/wZl52XNbPOEoLgm/d6q7pCU
	Q4pWYhAZwobz7vwZ3MzlSpnPhglzoEkfUQ==
X-Google-Smtp-Source: ABdhPJz8zMVwYXFvfmlvM4RLbszLY0Q1wDSj1EdFK+pcD3hpkptb3tQYCOYc8zYKKM+6fDdaPJvWSA==
X-Received: by 2002:a05:6512:1094:: with SMTP id j20mr21738730lfg.197.1630419307373;
        Tue, 31 Aug 2021 07:15:07 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i30sm2202187ljb.48.2021.08.31.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:15:06 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] fs/ntfs3: Change right headers to upcase.c
Date: Tue, 31 Aug 2021 17:14:32 +0300
Message-Id: <20210831141434.975175-6-kari.argillander@gmail.com>
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
index eb65bbd939e8..eb815609fd0b 100644
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

