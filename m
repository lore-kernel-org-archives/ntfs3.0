Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ACE6D13
	for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 19:39:27 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id y34so43482427lfa.8
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6354OG+8/r7z+Sh1NXFncFEfnvHG3iqSsWKERHJBAYk=;
        b=ppkqjmj7fZjJlRw8+9/JcSSdsaD+nmi9q/yUQyEwYRDYUaau8gQkpkq8ERBelcPAs8
         QmhKm8bLcjTMHWHiabN7iWSvvyiha49Is3V7rqMMtuqujY+g+A0VV3U5ILG+9iRqzKj7
         ZK109xaV5xVCLb1E+yKYssGmgoD4IweenAdGb5tHVUc+YFjRuDg6QozVb0RDsumXqECo
         BbQaDtOTIQ/GPd4gS32w+YS+P+3J/6pGTj9wM5baC0+Wx8fiAp9kLmV6FcWOjV6yPsT9
         Z4yx8uPsOBUCDgK8YW4JPQKk0qOxvPMPAV2j6Xn7IQAhemB3Q4xWlqC/qIFaspRM7zTu
         kmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6354OG+8/r7z+Sh1NXFncFEfnvHG3iqSsWKERHJBAYk=;
        b=Ho18bEfruVRDPCrEvKdSmGMeFSHOZCZKZzlEEe2UBrguZFZU3v6foj/0IgvN0szZQ/
         5E5oSTyc8y7Pq0aq8x/cJ4XA/2LZPqnAneWy+tAb1pz1b9D5rf5GQt7ty1pGGoCto6Ec
         F75QMcqEL0XTOCH8ADFq4ZSApyA5E9SFx0sfAVQuXdRuTQbyAI+5MwL2Lgz9BT7x3y7f
         rmAGWqxMIgQ3UKwYQ2zyGq7RpX7Qk1C2rhMGdAXIbtBiI95CCTqxU89VLAwDLtNJQE7Z
         jSxI6Ud6qr1CiKddH8xGSvyilmgY9kn+B6Y95a+AfpxhKUBzInwjUz7CiDgthSS2HqV2
         CEOw==
X-Gm-Message-State: AOAM530YT9OQHWZIvT2/kQUXP1mRk7UqieFByYgkxbr4cusT6ogRIGLt
	N8qOBFhtq2GG/LGz4sXEwWJnpJNCCAbWCumX
X-Google-Smtp-Source: ABdhPJzrTeLQM00GE0MvodLlN4ciqivDSDY+Z0BUDCSBKp9ujwdhalRsRKg0P5jkoj1wDWGB2hME0A==
X-Received: by 2002:a19:f713:: with SMTP id z19mr3613798lfe.238.1629229166083;
        Tue, 17 Aug 2021 12:39:26 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id o28sm99697lfg.238.2021.08.17.12.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 12:39:25 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fs/ntfs3: Use kcalloc/kmalloc_array over kzalloc/kmalloc
Date: Tue, 17 Aug 2021 22:38:15 +0300
Message-Id: <20210817193815.307182-4-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817193815.307182-1-kari.argillander@gmail.com>
References: <20210817193815.307182-1-kari.argillander@gmail.com>
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
index 8d27c520bec5..e0f7992484c3 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -900,7 +900,7 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 		return -EOPNOTSUPP;
 	}
 
-	pages = kmalloc(pages_per_frame * sizeof(struct page *), GFP_NOFS);
+	pages = kcalloc(pages_per_frame, sizeof(struct page *), GFP_NOFS);
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

