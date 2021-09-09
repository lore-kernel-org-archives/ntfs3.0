Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C83FF0
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:10:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id c8so5429099lfi.3
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IudACyYdUqJ7gnt0VBJlepLQi1HYDs/W9JfdNcI6Qbw=;
        b=NEGi3nHWsfQg+1RLKfc0kywSDw4++RzTTs2UlUBBrdQ3VPzSjxiKHQ0j8p9JIjAydy
         iqFUV7kdLN7h2dYd+DI5Pv/uprCzhNmTayfGGNs8RXuCw8sN0uh2KYyqkjSnibLmCr09
         RgeWYLzfh3O+DB63OcsQ2ZTUQNiBXZiYx5T6sq7FlCpRjM4o6pYztOkFYGqru1EdDlvY
         76yafJ7u/yTPdNVc9g7RkBRbzAU+UAKbgpyfEwZjoC4K73YFExpxQrL0ZajdZaRiQ+xu
         dVhpXshnSR9xOg3gBQhvDTHFvic/5mIeN9GrPtUHL5KR9oquTNlAUILp2QB/LsXfPBYi
         odIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IudACyYdUqJ7gnt0VBJlepLQi1HYDs/W9JfdNcI6Qbw=;
        b=vp4NzjviKQcqyF5xGms8/le4SiUCVu8uNfsOPLsJA5GlguXdaQB4QgGhFzv+zr08lh
         NOyYCZ7ggeBW7p2DSUtDubMrDx9FTJk3GXBXxhCWhnyhknvwwQb9XkDzbLbBSKbI7ORW
         XhMttNWMubAxqbmoqRwBK5akY5ygX6FUkCo046kpALVh9dYqd4+Yomu2JpxTGW55agQr
         v7gBYpUkLz2F2/hLeqZtKXMkhT0F+f6/9Sxgd15TkfKOdc52dIpk9SwEatVsgKsFhLrX
         WMpQ5Spo454tH9cW5ZBLQZdIauVlzt6Jn99mAO3GfO/XQQt/bvGNGw1V36+jPen+z2fG
         fAzw==
X-Gm-Message-State: AOAM533DFsTCooZasebv9lzrsFNXkQI6ON+daWYb/kK0SBfsTlq9G9vp
	rL15eAWCz6e2doxkNiXrtVA=
X-Google-Smtp-Source: ABdhPJx8eDqX1tvtW/eN6WUxAqVJouZ5RSQZPsB2dAsBOIfznfCiN8DNeyZyOZL+ubLnLajOgtZrAw==
X-Received: by 2002:a05:6512:39c9:: with SMTP id k9mr819851lfu.351.1631211000536;
        Thu, 09 Sep 2021 11:10:00 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:10:00 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 06/11] fs/ntfs3: Use sb instead of sbi->sb in fill_super
Date: Thu,  9 Sep 2021 21:09:37 +0300
Message-Id: <20210909180942.8634-7-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909180942.8634-1-kari.argillander@gmail.com>
References: <20210909180942.8634-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sb instead of sbi->sb in fill_super. We have sb so why not use
it. Also makes code more readable.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 2eb1227bbf5a..efe12c45e421 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1012,7 +1012,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	iput(inode);
 
-	is_ro = sb_rdonly(sbi->sb);
+	is_ro = sb_rdonly(sb);
 
 	if (sbi->flags & NTFS_FLAGS_NEED_REPLAY) {
 		if (!is_ro) {
@@ -1103,7 +1103,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Not necessary. */
 	sbi->used.bitmap.set_tail = true;
-	err = wnd_init(&sbi->used.bitmap, sbi->sb, tt);
+	err = wnd_init(&sbi->used.bitmap, sb, tt);
 	if (err)
 		goto out;
 
@@ -1117,7 +1117,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* Load $AttrDef. */
 	ref.low = cpu_to_le32(MFT_REC_ATTR);
 	ref.seq = cpu_to_le16(MFT_REC_ATTR);
-	inode = ntfs_iget5(sbi->sb, &ref, &NAME_ATTRDEF);
+	inode = ntfs_iget5(sb, &ref, &NAME_ATTRDEF);
 	if (IS_ERR(inode)) {
 		ntfs_err(sb, "Failed to load $AttrDef -> %d", err);
 		return PTR_ERR(inode);
-- 
2.25.1

