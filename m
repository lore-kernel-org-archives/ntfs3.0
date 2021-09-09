Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840753FF2
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:10:03 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id c8so5429201lfi.3
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NV/0xR4Wd5a8K3rGYu9nrf5FiDiBhhqYO1ip2WBYO/k=;
        b=D99cnNWLNyWiHSzCZ/jqvfEKRd5jra/f2uqsXAKoIwEJMIeEYimgEDnOBUTzPfGqRm
         iLKM9aZCogvKt7kH4V1FGjCt2eGm4j7FC55Ftz1u8znjTv6PjdIcg2F7TVwpQMsSklHM
         r5LqrbKFmYXusz/wEFDsaog7sur6mTCVW7oCCymehSb/4rU7DsRfytt9X9lyKcz02OxG
         68JWS/DQxNrq8eKNGxP653mEnzcqQlH5HKBqvkyh0ZQRCHiaGa0In4shUGPw+3AGEOOq
         rz34r1ox3fthZk7u7xa72cLqL+lkiFNal27qkIS959BCUvPXnk1ZjPjm9NLnObS2Yrxg
         3EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NV/0xR4Wd5a8K3rGYu9nrf5FiDiBhhqYO1ip2WBYO/k=;
        b=aClufOvj2j7PLWPR8TrIWUqWl8Wb48HTnAJHZQajBZqFBYZwX346QPubVO0/6DfmTS
         tb1OVUSw9Y6UK6xkgN86im9aMT0FDFVtspvoWGQBS+45mbcYo5h99riR4rWv060Z938d
         YJigeFChZMrmldcRGTVXfzLPuc3otXJTbazlPqd8/URRGHyR9n9Q+krgZYqduigas3MO
         QwSRco8QR2EIHNM+/w275GOfsipjiwrZB9d50QhwdgkG3cED3Z6iU8OhagN9Yk1gtiyg
         CVi6O6GR5d4H1tKEB6BJpG+F4JgqyTPC0R1OzpnzLdCbSjQJCA7IXjL3ZvKhbo2ymdUt
         0Y1g==
X-Gm-Message-State: AOAM530SFSoIbJOEVYJzsIWs2xhSiV63A+pZZ3RVZDlZVLH4SgNSkAVa
	xtYTugtB3QYD8P83bk51REA=
X-Google-Smtp-Source: ABdhPJzHoasyLk7GBFtx/ys/kNkLvNtfD0V582eAnm7zAjnnIfnmUObZDODDXUbt/cufc2vFzODknQ==
X-Received: by 2002:ac2:592f:: with SMTP id v15mr822084lfi.73.1631211001745;
        Thu, 09 Sep 2021 11:10:01 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:10:01 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 07/11] fs/ntfs3: Remove tmp var is_ro in ntfs_fill_super
Date: Thu,  9 Sep 2021 21:09:38 +0300
Message-Id: <20210909180942.8634-8-kari.argillander@gmail.com>
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

We only use this in two places so we do not really need it. Also
wrapper sb_rdonly() is pretty self explanatory. This will make little
bit easier to read this super long variable list in the beginning of
ntfs_fill_super().

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index efe12c45e421..8022149f6b88 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -889,7 +889,6 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	struct ATTR_DEF_ENTRY *t;
 	u16 *upcase;
 	u16 *shared;
-	bool is_ro;
 	struct MFT_REF ref;
 
 	ref.high = 0;
@@ -1012,16 +1011,14 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	iput(inode);
 
-	is_ro = sb_rdonly(sb);
-
 	if (sbi->flags & NTFS_FLAGS_NEED_REPLAY) {
-		if (!is_ro) {
+		if (!sb_rdonly(sb)) {
 			ntfs_warn(sb,
 				  "failed to replay log file. Can't mount rw!");
 			return -EINVAL;
 		}
 	} else if (sbi->volume.flags & VOLUME_FLAG_DIRTY) {
-		if (!is_ro && !sbi->options->force) {
+		if (!sb_rdonly(sb) && !sbi->options->force) {
 			ntfs_warn(
 				sb,
 				"volume is dirty and \"force\" flag is not set!");
-- 
2.25.1

