Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85C22FAF
	for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 14:15:05 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id b4so38794886lfo.13
        for <ntfs3@lists.linux.dev>; Tue, 31 Aug 2021 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k0VPE2oBIT4XXr0WSgIMYofrB1J1TyHP1ldvCdNXeu0=;
        b=hg60LYdDgiunYjiUgUnVQYc8wFxUswdeZmkPB7Pm51eOA1dO0HsNbnP0xxnnV1QmJD
         OTUz3vyXddjL4N2FmxkaTaYwiTfqeFeTQaYhf5Yq5bf5dQjF/d2lwhinEUZORB10W+Yk
         3NhzXldAbrhljQM/qky+5gAHSv6pn/engfcwslDjqREEmwle5TIWYMWUADbjBJHkWvgU
         n+UdMa/jdhR5dFoDnighDdUsnpU5eqaC0SqAKGmODkZfLaUkcJ8go5v4d7CEv+vG/9Gf
         LFWnZA/kth34vVzl0tWEtzL+Qqv3M5uhbxCnX0zbQ8y9cziiWyOJUgENKMh2ghI09DQr
         osqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k0VPE2oBIT4XXr0WSgIMYofrB1J1TyHP1ldvCdNXeu0=;
        b=KMRAYue4AQD8CGRxAaMfiY26otiRSK4MQQy8z1FBxZLTqXpar6rvc+dgWsxPIIzcOX
         9debtVP31y7thSFCZRjweyvbI+C9TnXwV73jJH2gBT2aMDl7EH911mGwUfExIPVTm5ja
         sVQkJT3UXSGpItKeen3z95WVDuvUSerTNBwp0UuvgMLtlVKj1+qbjwT4cMP9NavjzGZ7
         fTyLGAyDjT3bw7D3/WlvvYckxHYjnDY7wBARv16ikmtzv+MSSsfYB+naFjCOVxcBw1CG
         c6enA15KpGNrYTeh16XJkN6UE3deIP1bGyClRrdgu6ANmU8ZS9s96sY7T2GfNvL9BFQR
         wolA==
X-Gm-Message-State: AOAM533OcceON6oJw68JVjJsLhjPmhWAlpHuTbRcaU8gfRwB0hGANR/S
	cXJUo2DfkPBK1lKlREVCUNK8bcwx1u8aig==
X-Google-Smtp-Source: ABdhPJxOR4Bu9kUNy1lqLNEH+W9dQTfzr53uBIN5gQWmA77BMwSLjzTVnAJqq1k3i7WDJIu1h2Ly/g==
X-Received: by 2002:ac2:5b9e:: with SMTP id o30mr21242688lfn.400.1630419303631;
        Tue, 31 Aug 2021 07:15:03 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i30sm2202187ljb.48.2021.08.31.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:15:03 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] fs/ntfs3: Add missing headers and forward declarations to ntfs_fs.h
Date: Tue, 31 Aug 2021 17:14:29 +0300
Message-Id: <20210831141434.975175-3-kari.argillander@gmail.com>
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

We do not have headers at all in this file. We should have them so that
not every .c file needs to include all of the stuff which this file need
for building. This way we can remove some headers from other files and
get better picture what is needed. This can save some compilation time.
And this can help if we sometimes want to separate this one big header.

Also use forward declarations for structs and enums when it not included
straight with include and it is used in function declarations input.
This will prevent possible compiler warning:
  xxx declared inside parameter list will not be visible
  outside of this definition or declaration

Here is list which I made when parsing this. There is not necessarily
all example from this header file, but this just proofs we need it.

<linux/blkdev.h> SECTOR_SHIFT
<linux/buffer_head.h> sb_bread(), put_bh
<linux/cleancache.h> put_page()
<linux/fs.h> struct inode (Just struct ntfs_inode need it)
<linux/highmem.h> kunmap(), kmap()
<linux/kernel.h> cpu_to_leXX() ALIGN
<linux/mm.h> kvfree()
<linux/mutex.h> struct mutex, mutex_(un/try)lock()
<linux/page-flags.h> PageError()
<linux/pagemap.h> read_mapping_page()
<linux/rbtree.h> struct rb_root
<linux/rwsem.h> struct rw_semaphore
<linux/slab.h> krfree(), kzalloc()
<linux/string.h> memset()
<linux/time64.h> struct timespec64
<linux/types.h> uXX, __leXX
<linux/uidgid.h> kuid_t, kgid_t
<asm/div64.h> do_div()
<asm/page.h> PAGE_SIZE

"debug.h" ntfs_err() (Just one entry. Maybe we can drop this)
"ntfs.h" Do you even ask?

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/ntfs_fs.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 64ef92e16363..a39055cf9822 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -9,6 +9,37 @@
 #ifndef _LINUX_NTFS3_NTFS_FS_H
 #define _LINUX_NTFS3_NTFS_FS_H
 
+#include <linux/blkdev.h>
+#include <linux/buffer_head.h>
+#include <linux/cleancache.h>
+#include <linux/fs.h>
+#include <linux/highmem.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/page-flags.h>
+#include <linux/pagemap.h>
+#include <linux/rbtree.h>
+#include <linux/rwsem.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/time64.h>
+#include <linux/types.h>
+#include <linux/uidgid.h>
+#include <asm/div64.h>
+#include <asm/page.h>
+
+#include "debug.h"
+#include "ntfs.h"
+
+struct dentry;
+struct fiemap_extent_info;
+struct user_namespace;
+struct page;
+struct writeback_control;
+enum utf16_endian;
+
+
 #define MINUS_ONE_T			((size_t)(-1))
 /* Biggest MFT / smallest cluster */
 #define MAXIMUM_BYTES_PER_MFT		4096
-- 
2.25.1

