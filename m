Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7F72FAF
	for <ntfs3@lists.linux.dev>; Thu,  2 Sep 2021 16:15:41 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id f18so5444487lfk.12
        for <ntfs3@lists.linux.dev>; Thu, 02 Sep 2021 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6NUPPlGVIg641VNyfch/SHNe6LbpC9+97GZHbHZOmtE=;
        b=Cq+HKI5t8ztXnwTUmcz4mW9vC0YduW5fwIgc0kdk9QUDxWUmsC6PLN1oZCffa+olD8
         HpZ1UMCK+nynKzJ1ZYVyOifjOY7o8zFHCx7oNJvxtlNm2vUwNGQ3Fu8XFGv6SlvBl1pd
         nNdyA/9AJ4GkK8mlbveF84WlxrdtDESJvnygt4wJ1WozIDpIwpyyUiXfr7c1e2RXwKeU
         /7V74FXxmdD5Da/oQkuTORasoahkdmkQsYNMMVxzweL1umTT2g1mCxEc8UEHGcKHvUxC
         Qck5GwusZnEgd6pF8lPUYlvjl/9hWm9nDoInBSq6E9rzqCKXvaFnMrCOeSBOG0wW60sf
         kXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NUPPlGVIg641VNyfch/SHNe6LbpC9+97GZHbHZOmtE=;
        b=Kz55u1YfnzIlimAH0NGPsD1YlHSPzR9EV5rSJrhpmTT8kbOMRRw3rmbTdQRrkVabJi
         J98tD+ct8YC/aNMXO3pvf8+BxYX0IBgjgrL2E3MPnwC1i8g0BPNRevSO4xkyu6bgL+Y+
         rUrjtTrVMfN2ICuz82vTr/lU99D4eRBAWaDOZLp7Ms0c9iFDK/KlBANp8ATzM0mf4OgC
         1lYb9IuOTu2Xs88yAfxk8wlBC/RWMTvRoy3FLLbdWm5+S5YaB7mzkd5uIk+n3Ftg1IoW
         ub49ArWtSP/HRq3zgPctsx5ycFuUt9cvBXcuQMDR5Jq8Vl4YKxMvU6QJWr1vxWNjXVFo
         AHLg==
X-Gm-Message-State: AOAM5326AiHeenltEQAhdXIKFIQFGYiVZCUM3DDwrSopiH3/XBxv7cJX
	98kcG+keR+2oLxOtAKFF26TtzKgcSilyRQ==
X-Google-Smtp-Source: ABdhPJzy6EaEVYid/M8U/5VQgJ1TsS/F2nsU3a/HOPy81/PniZ9z8ig2LirjbACmRYLgTbtDAKeevg==
X-Received: by 2002:a05:6512:dc:: with SMTP id c28mr3178424lfp.251.1630599339663;
        Thu, 02 Sep 2021 09:15:39 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id m7sm267811ljj.58.2021.09.02.09.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:15:39 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] fs/ntfs3: Add missing headers and forward declarations to ntfs_fs.h
Date: Thu,  2 Sep 2021 19:15:23 +0300
Message-Id: <20210902161528.6262-4-kari.argillander@gmail.com>
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
index 97e682ebcfb9..149d60e29728 100644
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

