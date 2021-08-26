Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F93FC4
	for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 21:44:49 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r9so9929471lfn.3
        for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5u2sLPCG764dlCtKjjjtNZELRgckudXyv4A0JZ99TCE=;
        b=SfSEYa4ceYcMZE2vD2nszV8PMEFaES6s3jdiDsBWEOpmGo+FrCEN0M8B+rDxByMSjY
         u3wY9gpsHVakFG6pfrUv0HgbObKjGFR5fL/8BR9sxZMq4+C6b75Zc2ZOLqhd1diABJJ8
         XRB8xZLCFloO4wzEddwaY5cifBFXRY3B8KZfvGRZQHsrUtyzR+FA7xFwBY+69KQLiYUR
         Izx1vG6OcsiTzeWNfvbY972w3tYk9FFUfkj/6E8naor0bI9agoGlb51jE6Z9GieTORDs
         QpzAXB/vPUMSCGcTHYGqK5uSEDnK+O0s1A33Che0Ioxkk0do8Kc8BMnJtGSwmLUYi4by
         9hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5u2sLPCG764dlCtKjjjtNZELRgckudXyv4A0JZ99TCE=;
        b=SnCXlxiVZ2S6ea8ECx/NyGE9ckKpfyN57fAmw6NK1yYICY6K7Vw2h3EZRWbD1uefn+
         +Gx9g+ETWrah8a5QECf+Lcq6sl//KXFeKmtpPh862pfolV97kEFkLnxv/Flc/WrbnBjb
         Dd0F3irnoLJERuQZRy391S11HG/doG5n4I3AwVVxG2mqEMtVCnIzXTtj2hFcpyqO0Zct
         BX8DxyZIN6JgpAxM0aKSorWsXo7+sA3iQqDzMd/sbzLjvcD/q2/oCAMxGpbDGqxRdfJJ
         ZoErtnsz0z4C2m60ED4oj6Kob7Z+mCQ91aiscVdpOzWNhJjK9Jk5gH0Rgp/ITVq4cR4G
         49FA==
X-Gm-Message-State: AOAM532hpuljHnl6oWicaRwyLqMQHUooPUwxKBN2mI8fEA9l/huo01qJ
	zgdIpkypsmVzNgNO+vjH+fU=
X-Google-Smtp-Source: ABdhPJwwz38b8mBJebUOlQXwkwCI9+afKCegro4gLYqgnO51PBRpZEotn+1jI+/9sAUNWuU8yycVQw==
X-Received: by 2002:a05:6512:21a:: with SMTP id a26mr4140030lfo.223.1630014288041;
        Thu, 26 Aug 2021 14:44:48 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id 23sm417724lfp.47.2021.08.26.14.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 14:44:47 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] fs/ntfs3: Remove GPL boilerplates from decompress lib files
Date: Fri, 27 Aug 2021 00:44:41 +0300
Message-Id: <20210826214441.1614837-1-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Files already have SDPX identifier so no reason to keep boilerplates in
these files anymore.

CC: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
This is probably ok to you Eric just wanted to make sure and be polite.
---
 fs/ntfs3/lib/decompress_common.c | 13 -------------
 fs/ntfs3/lib/decompress_common.h | 14 --------------
 fs/ntfs3/lib/lzx_decompress.c    | 13 -------------
 fs/ntfs3/lib/xpress_decompress.c | 13 -------------
 4 files changed, 53 deletions(-)

diff --git a/fs/ntfs3/lib/decompress_common.c b/fs/ntfs3/lib/decompress_common.c
index 83c9e93aea77..09e9e6544946 100644
--- a/fs/ntfs3/lib/decompress_common.c
+++ b/fs/ntfs3/lib/decompress_common.c
@@ -3,19 +3,6 @@
  * decompress_common.c - Code shared by the XPRESS and LZX decompressors
  *
  * Copyright (C) 2015 Eric Biggers
- *
- * This program is free software: you can redistribute it and/or modify it under
- * the terms of the GNU General Public License as published by the Free Software
- * Foundation, either version 2 of the License, or (at your option) any later
- * version.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
- * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
- * details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "decompress_common.h"
diff --git a/fs/ntfs3/lib/decompress_common.h b/fs/ntfs3/lib/decompress_common.h
index 66297f398403..2d70ae42f1b5 100644
--- a/fs/ntfs3/lib/decompress_common.h
+++ b/fs/ntfs3/lib/decompress_common.h
@@ -1,22 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-
 /*
  * decompress_common.h - Code shared by the XPRESS and LZX decompressors
  *
  * Copyright (C) 2015 Eric Biggers
- *
- * This program is free software: you can redistribute it and/or modify it under
- * the terms of the GNU General Public License as published by the Free Software
- * Foundation, either version 2 of the License, or (at your option) any later
- * version.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
- * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
- * details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <linux/string.h>
diff --git a/fs/ntfs3/lib/lzx_decompress.c b/fs/ntfs3/lib/lzx_decompress.c
index 77a381a693d1..6b16f07073c1 100644
--- a/fs/ntfs3/lib/lzx_decompress.c
+++ b/fs/ntfs3/lib/lzx_decompress.c
@@ -6,19 +6,6 @@
  * this is the only size used in System Compression.
  *
  * Copyright (C) 2015 Eric Biggers
- *
- * This program is free software: you can redistribute it and/or modify it under
- * the terms of the GNU General Public License as published by the Free Software
- * Foundation, either version 2 of the License, or (at your option) any later
- * version.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
- * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
- * details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "decompress_common.h"
diff --git a/fs/ntfs3/lib/xpress_decompress.c b/fs/ntfs3/lib/xpress_decompress.c
index 3d98f36a981e..769c6d3dde67 100644
--- a/fs/ntfs3/lib/xpress_decompress.c
+++ b/fs/ntfs3/lib/xpress_decompress.c
@@ -5,19 +5,6 @@
  * based on the code from wimlib.
  *
  * Copyright (C) 2015 Eric Biggers
- *
- * This program is free software: you can redistribute it and/or modify it under
- * the terms of the GNU General Public License as published by the Free Software
- * Foundation, either version 2 of the License, or (at your option) any later
- * version.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
- * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
- * details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "decompress_common.h"
-- 
2.30.2

