Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16A72
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 15:36:21 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id y6so17246503lje.2
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 08:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OHuhtZ/zqVhWYfOx8LjsJO6P40iCzJqotJXfGUPKwnc=;
        b=B0F59id0u0nQtOm/ocn6TOkyxUaIoHlZF8W4Kgpux2eNqZR102GqOYBo1PtrOp/oHe
         75CzGemW4B6iq/Z/6ypGu8xRBajPa5wuU9sE2lD1iBiyKnSmXSfRH9sjoUviGgRM8Mf/
         jn2s3PlkTaM++9Fl6Wx8qm4xT/2h3coJ+Gmx0wkFuZQh4CbWw9FET8TAv9hMJ/x2z0q5
         b2qhyraivB3dg0qqlOdaxH/w8yZ5Kjr1r6N8gbM2cPAXi1Dn83sxIc8GBMaXhUOUMxUI
         kppITuXWhZWGoLB0GY64Y4kcUFk4jvvRSLVrnOdR1EC7yTBvOlfs+2JkhjpFupXpQDFa
         2nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHuhtZ/zqVhWYfOx8LjsJO6P40iCzJqotJXfGUPKwnc=;
        b=OQ9aEkt1aw3nF3HccU/ABNRS4RVD7v3ALGiTpOvacxHOLhQYRU4kOZbV6be/XHGKpl
         iwowclQb48B8ocVyMV7A7zFlKiPGYoEtPA1h9t+LqdXu2BA7KHOxwjPHkNtimLAq+5+a
         nvJItqpUFWpYRwHWWgtpHPKRAqarSif+/rfkZFC8849ZEktiqNkAKnrsySqEILqV1Wa8
         ERPvV0429yfRRuUaqAfzgkrPo8apAGMnTllP+88liNLZRl/N2qU9V8WOKngqmWg1gDvK
         eXZ9Wt89qUq4qNyGdpKRMyhyZRRX88haM1sLFudeq/ZyqhNyqULCyCP+Z/nd5QAYuNly
         pFBQ==
X-Gm-Message-State: AOAM53184DzWzWaxGxZIVFJ1mqUGJ4Y769YGcci5KncDdYCD7xIvUUel
	5tH/+QUBr1BTRowRyXegkuPCfvuqCoSlOQ==
X-Google-Smtp-Source: ABdhPJxIaHNrWfDtCM7EkmVxUJdKBYe5MzWlSTR6eQZpDWxOt0nYpNX0gUqMRMVAUaMVi6UJW9ldcw==
X-Received: by 2002:a2e:8810:: with SMTP id x16mr15537678ljh.410.1631028978113;
        Tue, 07 Sep 2021 08:36:18 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id p14sm1484458lji.56.2021.09.07.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 08:36:17 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v4 5/9] fs/ntfs3: Init spi more in init_fs_context than fill_super
Date: Tue,  7 Sep 2021 18:35:53 +0300
Message-Id: <20210907153557.144391-6-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907153557.144391-1-kari.argillander@gmail.com>
References: <20210907153557.144391-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_fs_context() is meant to initialize s_fs_info (spi). Move spi
initializing code there which we can initialize before fill_super().

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index befa78d3cb26..420cd1409170 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -887,7 +887,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	const struct VOLUME_INFO *info;
 	u32 idx, done, bytes;
 	struct ATTR_DEF_ENTRY *t;
-	u16 *upcase = NULL;
+	u16 *upcase;
 	u16 *shared;
 	bool is_ro;
 	struct MFT_REF ref;
@@ -902,9 +902,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_time_gran = NTFS_TIME_GRAN; // 100 nsec
 	sb->s_xattr = ntfs_xattr_handlers;
 
-	ratelimit_state_init(&sbi->msg_ratelimit, DEFAULT_RATELIMIT_INTERVAL,
-			     DEFAULT_RATELIMIT_BURST);
-
 	sbi->options->nls = ntfs_load_nls(sbi->options->nls_name);
 	if (IS_ERR(sbi->options->nls)) {
 		sbi->options->nls = NULL;
@@ -934,12 +931,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_maxbytes = 0xFFFFFFFFull << sbi->cluster_bits;
 #endif
 
-	mutex_init(&sbi->compress.mtx_lznt);
-#ifdef CONFIG_NTFS3_LZX_XPRESS
-	mutex_init(&sbi->compress.mtx_xpress);
-	mutex_init(&sbi->compress.mtx_lzx);
-#endif
-
 	/*
 	 * Load $Volume. This should be done before $LogFile
 	 * 'cause 'sbi->volume.ni' is used 'ntfs_set_state'.
@@ -1224,11 +1215,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto out;
 	}
 
-	sbi->upcase = upcase = kvmalloc(0x10000 * sizeof(short), GFP_KERNEL);
-	if (!upcase) {
-		err = -ENOMEM;
-		goto out;
-	}
+	upcase = sbi->upcase;
 
 	for (idx = 0; idx < (0x10000 * sizeof(short) >> PAGE_SHIFT); idx++) {
 		const __le16 *src;
@@ -1440,10 +1427,21 @@ static int ntfs_init_fs_context(struct fs_context *fc)
 		goto ok;
 
 	sbi = kzalloc(sizeof(struct ntfs_sb_info), GFP_NOFS);
-	if (!sbi) {
-		kfree(opts);
-		return -ENOMEM;
-	}
+	if (!sbi)
+		goto free_opts;
+
+	sbi->upcase = kvmalloc(0x10000 * sizeof(short), GFP_KERNEL);
+	if (!sbi->upcase)
+		goto free_sbi;
+
+	ratelimit_state_init(&sbi->msg_ratelimit, DEFAULT_RATELIMIT_INTERVAL,
+			     DEFAULT_RATELIMIT_BURST);
+
+	mutex_init(&sbi->compress.mtx_lznt);
+#ifdef CONFIG_NTFS3_LZX_XPRESS
+	mutex_init(&sbi->compress.mtx_xpress);
+	mutex_init(&sbi->compress.mtx_lzx);
+#endif
 
 	sbi->options = opts;
 	fc->s_fs_info = sbi;
@@ -1452,6 +1450,11 @@ static int ntfs_init_fs_context(struct fs_context *fc)
 	fc->ops = &ntfs_context_ops;
 
 	return 0;
+free_opts:
+	kfree(opts);
+free_sbi:
+	kfree(sbi);
+	return -ENOMEM;
 }
 
 // clang-format off
-- 
2.25.1

