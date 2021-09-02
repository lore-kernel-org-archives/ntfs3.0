Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2EE2FAF
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:39 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id d16so4572172ljq.4
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ob2HCfLbexy1luGulrKway4plF2/kkuH1W1saHNOCQo=;
        b=pBCxKSVw9Ji4JYB5OCdXI+l/dHNLz3ePATOIic0bMy2s5V1v1K7+nJuX+gJ9McOrFL
         +y40utIyAcTazzv0nwWgFvKYak5VSSfbWPc06wD6eDnYR7S+0DtOsUj90gmrjUevQeRR
         NxKzJzah5fFZXFgLTek90NBWN5ppDC3qHVGU/nK9BwnoEh+GFmpDexeEhwu6BfOJAEkA
         rKVyQJ+fqhXNXlgomeR326ZuS7nWIkQRwHLm7lBDC2W7iZfZZtO/1EI+RF3PW2bPtGQk
         YGDKuNEZtnarz69TTUHP7456py1We+6cUXuMVf0vvnvm4yovuQmogJlXiGRF5a/epk8C
         SEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ob2HCfLbexy1luGulrKway4plF2/kkuH1W1saHNOCQo=;
        b=MtgNhSc1aiMn5bNWs8C8hnsE8DWbxxsezQYggaZjN8QysNWBPN8AlxnTfU6ax48ax8
         evHBwW/OYsEmaOpK45TWzDVSDZ/gmXp19MKEKhC+vISPkU+fBkku7qkAMYY8FTN2qaub
         xHWc3q08e7u9Uea5ldltf5VdriPuVDLC16OFGzUIXxBNjNeVJGys1R1yhptbdKBR8AeM
         v8On96DfXk9Vntk8nIXZxOhKLTjp2uPRR8+357GHIsoLGtgz20mbdhxiaUzbEF1iiT6p
         lG4xhX+MDKr7XZK9PW1P+5y08PjDnNUH6vN1s4WvEheFNcq9W57rTSifcANhJ3jDr5eK
         Fevg==
X-Gm-Message-State: AOAM532bzXjuX9q10SCJD7J9zeNkqd5wVY6RxAHxusa3JCqyCyw9ZbaL
	fdmzb3o5n77xQ/3Kw4AxCSc=
X-Google-Smtp-Source: ABdhPJyUWIfCl011zCkaBs+2pmSQuInn2PxqJd8IYtR8wyl/+dBK3vvWaVV6Tp6YsYo9hRx1az3E+w==
X-Received: by 2002:a05:651c:98c:: with SMTP id b12mr3248586ljq.83.1630599338250;
        Thu, 02 Sep 2021 09:15:38 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:37 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] fs/ntfs3: Add missing header files to ntfs.h
Date: Thu,  2 Sep 2021 19:15:22 +0300
Message-Id: <20210902161528.6262-3-kari.argillander@gmail.com>
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
index 6bb3e595263b..695b684bce20 100644
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

