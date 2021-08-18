Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE66D13
	for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 01:07:16 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id s3so1899169ljp.11
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 18:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tMEOQb478MirVZ4PNVB8KP4GAWyRowJiqiV9ITepmh8=;
        b=a/mKBpuC+uzUwqMhGIIeCuzlyvBxzuKUtXdHFRJmcEaV0BpWRusszfsY1ZsH9LJCwn
         QCVjz+Yk2SBz/V9YWMprKbPXMoF4fwWIx8rGLGKTN2kj1gj5tJj9B1ijlmb17Rtyy2Lp
         OQJZVfCdH1/C5zJQkp7nWYAGW7Opc87+USiRqGDKo9pXXrtnt7pYKOGEO4WvAiVjJQJ/
         VN7OZ/C3URaacU7DVAnpsq8VD+iR0Rb+Oa89FDKXyn8WUKo8jBVAZhMq/jgV5Rn0xN44
         qRWO7ih5s9d0FUYwh1bZpz7UgYUsclvz+mt+FNw/jLW6ELm6JieCIOYv1K44FDlqJh9h
         V2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tMEOQb478MirVZ4PNVB8KP4GAWyRowJiqiV9ITepmh8=;
        b=OPqqvGj0k5L28Q11bjAs37jxka2GvmwoN7j9Xt2B9y6zYQUEBzZy2k8FTCecjH12EN
         ATrVNYwkQIwbNeMGf6ofrEeULJk4G/Zs/3FO5HoxZbTJOJzT7uzcJwlIe551QXDM2qcA
         8Z8Io+X74369TW3+6prs3yxv51atrpJ35maSuiFUX2RwMGw3QjWxdHw96RNgqK8tzc/7
         jPCB0gDVRbckC8Id3n5waDsbYOLdaenGyXMYqMkSMT52sOdSPc5U5eC/AlOK7Itgg2kH
         VSntyRg3+jYp2q+XF/aX2WMvYr8UZCWJs1iWNnSPa6Nuz7Xn1fr48mwhsfOvxGmasSr7
         bWrg==
X-Gm-Message-State: AOAM533Z/ukQND3/ZJw3draA63S83JbLSwHSOlzDrLu5I05rYg0rbJ2a
	AQfB2YXv0Ce+bk6bxHtrMEZdF6zIpdjtBmWY
X-Google-Smtp-Source: ABdhPJz4kjAEUt3AFXvHpYee1s2XOWemkmy4SkEZxfoCVKR6CwwpYKoKD4y1dKMuMWu629xn9UUsGQ==
X-Received: by 2002:a2e:bb8f:: with SMTP id y15mr5524661lje.148.1629248834555;
        Tue, 17 Aug 2021 18:07:14 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id j4sm400245ljh.120.2021.08.17.18.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 18:07:14 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>
Subject: [PATCH v3 3/3] fs/ntfs3: Use kcalloc/kmalloc_array over kzalloc/kmalloc
Date: Wed, 18 Aug 2021 04:06:49 +0300
Message-Id: <20210818010649.412912-4-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818010649.412912-1-kari.argillander@gmail.com>
References: <20210818010649.412912-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kcalloc/kmalloc_array over kzalloc/kmalloc when we allocate array.
Checkpatch found these after we did not use our own defined allocation
wrappers.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/bitmap.c  | 2 +-
 fs/ntfs3/file.c    | 2 +-
 fs/ntfs3/frecord.c | 7 +++----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index d502bba323d0..2de05062c78b 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -683,7 +683,7 @@ int wnd_init(struct wnd_bitmap *wnd, struct super_block *sb, size_t nbits)
 	if (!wnd->bits_last)
 		wnd->bits_last = wbits;
 
-	wnd->free_bits = kzalloc(wnd->nwnd * sizeof(u16), GFP_NOFS);
+	wnd->free_bits = kcalloc(wnd->nwnd, sizeof(u16), GFP_NOFS);
 	if (!wnd->free_bits)
 		return -ENOMEM;
 
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 8d27c520bec5..6687f3c67450 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -900,7 +900,7 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 		return -EOPNOTSUPP;
 	}
 
-	pages = kmalloc(pages_per_frame * sizeof(struct page *), GFP_NOFS);
+	pages = kmalloc_array(pages_per_frame, sizeof(struct page *), GFP_NOFS);
 	if (!pages)
 		return -ENOMEM;
 
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 33c6b40d8ca7..98bca9f9d8d1 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2050,7 +2050,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct page *page)
 	idx = (vbo - frame_vbo) >> PAGE_SHIFT;
 
 	pages_per_frame = frame_size >> PAGE_SHIFT;
-	pages = kzalloc(pages_per_frame * sizeof(struct page *), GFP_NOFS);
+	pages = kcalloc(pages_per_frame, sizeof(struct page *), GFP_NOFS);
 	if (!pages) {
 		err = -ENOMEM;
 		goto out;
@@ -2133,7 +2133,7 @@ int ni_decompress_file(struct ntfs_inode *ni)
 	frame_bits = ni_ext_compress_bits(ni);
 	frame_size = 1u << frame_bits;
 	pages_per_frame = frame_size >> PAGE_SHIFT;
-	pages = kzalloc(pages_per_frame * sizeof(struct page *), GFP_NOFS);
+	pages = kcalloc(pages_per_frame, sizeof(struct page *), GFP_NOFS);
 	if (!pages) {
 		err = -ENOMEM;
 		goto out;
@@ -2705,8 +2705,7 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
 		goto out;
 	}
 
-	pages_disk = kzalloc(pages_per_frame * sizeof(struct page *),
-			     GFP_NOFS);
+	pages_disk = kcalloc(pages_per_frame, sizeof(struct page *), GFP_NOFS);
 	if (!pages_disk) {
 		err = -ENOMEM;
 		goto out;
-- 
2.25.1

