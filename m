Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497E72
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 10:38:10 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id i9so12688655lfg.10
        for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NfJatabbDRuLjub7mFadaE4bzboEivABMiAWlTI3GXI=;
        b=FRcS1yQ12WU7K0ZrS2Mhi1L27mX8U82kp/YGBiFsbIYoKjAefR8yXpjynkLeKOfHYb
         U0FrZU0SQuNc0RxvrQ1up2dlos0z2hheRmKN2oWXX0r5zmlrIC3Fvvo1qSvEm2eM1IjR
         tAFI+qqwks7gCwE0pOb6EvnmY7D0A1MWSazaarkx1NPPhdX3dZ7AMdznWSiHHTnqB57S
         2eWJDIIe/5hrQbpmLGVxU7O8cYSKi7GXwq2jevYN1eaoHBVwC7lrcXIGFWa36l4cn/cf
         3/fFmlE69w09gXSJ/6xTtjGbH13yE5833d1l3vrCGzNhownB42FmTIfNtBKjnoPep9iY
         ILHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NfJatabbDRuLjub7mFadaE4bzboEivABMiAWlTI3GXI=;
        b=YmLb5nM452L5xjeHjmIodzUxtoGVVnxWni2h+XVgmZx0gF/ugtgOdC3FhE2f0UHAGw
         cAvz3gIGLGQ92rESHNBndhPSMn2p7zO+6pJk4sOEpRB/S/830LlGxIaPndnuxSS8BKgL
         7I+noLJm2jLUUIlfkDRd1+MenpbMPukhvAQLHhTyyZ2BSTUD9jrc2b55CgmIvv78Mv06
         MWtuWyA5qde0MzoaJzcwUT+oLBFuoA+gk8vxM5dv2Gldtjv6izaYMNZHxKGJYo1MNHIO
         koWAcXsESXVI42LUWayezDhYM7SjoMGarVPtIZIVwnfXjK7LEH0DoENiHGPyXZeBUfsQ
         wsxQ==
X-Gm-Message-State: AOAM532e453fOrYv3MQ0E16rCtqNnRdNTmjO4gn9Yz5L1Ll35vxetpRE
	mAXYVT1FYEl8rXmn9DkNjOY=
X-Google-Smtp-Source: ABdhPJzs6220+8j1LIoVUYyvXJU+Edf3AwZGR/I89cb68hlCM2Bx8p3TwSGwCvE0yxT4Bgq0Mf12BA==
X-Received: by 2002:a05:6512:3f16:: with SMTP id y22mr10805648lfa.356.1629110288803;
        Mon, 16 Aug 2021 03:38:08 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id l6sm1136044ljj.40.2021.08.16.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:38:08 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Use linux/log2 is_power_of_2 function
Date: Mon, 16 Aug 2021 13:37:32 +0300
Message-Id: <20210816103732.177207-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not need our own implementation for this function in this
driver. It is much better to use generic one.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/ntfs_fs.h | 5 -----
 fs/ntfs3/run.c     | 3 ++-
 fs/ntfs3/super.c   | 9 +++++----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 0c3ac89c3115..c8ea6dd38c21 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -972,11 +972,6 @@ static inline struct buffer_head *ntfs_bread(struct super_block *sb,
 	return NULL;
 }
 
-static inline bool is_power_of2(size_t v)
-{
-	return v && !(v & (v - 1));
-}
-
 static inline struct ntfs_inode *ntfs_i(struct inode *inode)
 {
 	return container_of(inode, struct ntfs_inode, vfs_inode);
diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index 5cdf6efe67e0..ce6bff3568df 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -9,6 +9,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/fs.h>
+#include <linux/log2.h>
 #include <linux/nls.h>
 
 #include "debug.h"
@@ -376,7 +377,7 @@ bool run_add_entry(struct runs_tree *run, CLST vcn, CLST lcn, CLST len,
 			if (!used) {
 				bytes = 64;
 			} else if (used <= 16 * PAGE_SIZE) {
-				if (is_power_of2(run->allocated))
+				if (is_power_of_2(run->allocated))
 					bytes = run->allocated << 1;
 				else
 					bytes = (size_t)1
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 6be13e256c1a..c1b7127f5e61 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -29,6 +29,7 @@
 #include <linux/exportfs.h>
 #include <linux/fs.h>
 #include <linux/iversion.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/nls.h>
 #include <linux/parser.h>
@@ -735,13 +736,13 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 
 	boot_sector_size = (u32)boot->bytes_per_sector[1] << 8;
 	if (boot->bytes_per_sector[0] || boot_sector_size < SECTOR_SIZE ||
-	    !is_power_of2(boot_sector_size)) {
+	    !is_power_of_2(boot_sector_size)) {
 		goto out;
 	}
 
 	/* cluster size: 512, 1K, 2K, 4K, ... 2M */
 	sct_per_clst = true_sectors_per_clst(boot);
-	if (!is_power_of2(sct_per_clst))
+	if (!is_power_of_2(sct_per_clst))
 		goto out;
 
 	mlcn = le64_to_cpu(boot->mft_clst);
@@ -757,14 +758,14 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 	/* Check MFT record size */
 	if ((boot->record_size < 0 &&
 	     SECTOR_SIZE > (2U << (-boot->record_size))) ||
-	    (boot->record_size >= 0 && !is_power_of2(boot->record_size))) {
+	    (boot->record_size >= 0 && !is_power_of_2(boot->record_size))) {
 		goto out;
 	}
 
 	/* Check index record size */
 	if ((boot->index_size < 0 &&
 	     SECTOR_SIZE > (2U << (-boot->index_size))) ||
-	    (boot->index_size >= 0 && !is_power_of2(boot->index_size))) {
+	    (boot->index_size >= 0 && !is_power_of_2(boot->index_size))) {
 		goto out;
 	}
 
-- 
2.30.2

