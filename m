Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A143FF2
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 18:09:59 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id c8so5428902lfi.3
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XToBbj0RLZIUqA/Q77X2jgrFy5XbrvR0CFc+NLRHUDM=;
        b=VGlo+77Pp0Rb7Pz2BYqkpTwmELbb0KZ8n+RBPOsdppOcuBh4bRP/W6oIp3NM1QPiOs
         uWtrPlPhiuEfBAKCcUTmzfIg5cffdM5mow1+Tjpf25p5a6UVEWh9ZLVdxW/h+kvabmKB
         QHVOf7ZEY8YZHe37MZX4KV5eMW/2dZkJ0UZKoqP4auEJRVCZ/VOrZJ8ZA1WgEFoO+Liz
         +cPQBqAKzwOpXIsFeTnjrVNXkbYaPz3yXgjO0yo6P0VSkq0eZ48LKwsyjYc0VB2urwjP
         jzIIPQbPvzofdXyt+/9WKVl4C3zahd3YEGzj5Lw0+BaFVLGK/+mf4NzXleGhYMF+FE5y
         iC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XToBbj0RLZIUqA/Q77X2jgrFy5XbrvR0CFc+NLRHUDM=;
        b=tpS+XNmUNs5fGgJtOWvAG4C9HAebtX0uoVqejt2gOUL+dXlAKPWbk/vCpHl9ZmZYPM
         DzqlylQiJJcaANXKbaitWf5XDpXerwoc0h/v4f9O0LcLDPA9NnPHX6vulAJpAkNNUhh/
         vBOFymKk8bY/NBOc6uKo2uC6fWqMvMHIuNXYbQzo/QMBB0QiiTo9TdN941lMOCkAdykK
         6PH38QZt/3+gGcoqubJxa8iZCNwbjGhSpFjstDwRU90vHfksXxBdkLrMW115EmNH9xQX
         LvKGPH2NO2En+V1/3rTZFS1ZUmmko+ku4WJc/j5KPLz45JFis3E7DsD7vyP5Kwm7Hmqn
         CPbQ==
X-Gm-Message-State: AOAM531JAoj1aAnXhnsQl1NHjrw04V+125rxoZtVcfb1Gk7FGsd4vcgK
	V/XW1EdQnJYUHfrF47pPNbA=
X-Google-Smtp-Source: ABdhPJwridSjsXJffDy5FbxpKUC6X3YV+BvAblYI/G4We0UWvB+VTAB0/wcWK+aAWRsg3Qlr5eUpAA==
X-Received: by 2002:a19:700c:: with SMTP id h12mr847185lfc.672.1631210997353;
        Thu, 09 Sep 2021 11:09:57 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u2sm270276lff.238.2021.09.09.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:09:57 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Kari Argillander <kari.argillander@gmail.com>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH 04/11] fs/ntfs3: Return straight without goto in fill_super
Date: Thu,  9 Sep 2021 21:09:35 +0300
Message-Id: <20210909180942.8634-5-kari.argillander@gmail.com>
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

In many places it is not needed to use goto out. We can just return
right away. This will make code little bit more cleaner as we won't
need to check error path.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/super.c | 56 ++++++++++++++----------------------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 793c064833c2..f3c3c2bea6ca 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -923,7 +923,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	err = ntfs_init_from_boot(sb, rq ? queue_logical_block_size(rq) : 512,
 				  bd_inode->i_size);
 	if (err)
-		goto out;
+		return err;
 
 #ifdef CONFIG_NTFS3_64BIT_CLUSTER
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
@@ -939,10 +939,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	ref.seq = cpu_to_le16(MFT_REC_VOL);
 	inode = ntfs_iget5(sb, &ref, &NAME_VOLUME);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load $Volume.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	ni = ntfs_i(inode);
@@ -990,10 +988,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	ref.seq = cpu_to_le16(MFT_REC_MIRR);
 	inode = ntfs_iget5(sb, &ref, &NAME_MIRROR);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load $MFTMirr.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	sbi->mft.recs_mirr =
@@ -1006,10 +1002,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	ref.seq = cpu_to_le16(MFT_REC_LOG);
 	inode = ntfs_iget5(sb, &ref, &NAME_LOGFILE);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load \x24LogFile.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	ni = ntfs_i(inode);
@@ -1027,16 +1021,14 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		if (!is_ro) {
 			ntfs_warn(sb,
 				  "failed to replay log file. Can't mount rw!");
-			err = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	} else if (sbi->volume.flags & VOLUME_FLAG_DIRTY) {
 		if (!is_ro && !sbi->options->force) {
 			ntfs_warn(
 				sb,
 				"volume is dirty and \"force\" flag is not set!");
-			err = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	}
 
@@ -1046,10 +1038,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	inode = ntfs_iget5(sb, &ref, &NAME_MFT);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load $MFT.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	ni = ntfs_i(inode);
@@ -1073,10 +1063,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	ref.seq = cpu_to_le16(MFT_REC_BADCLUST);
 	inode = ntfs_iget5(sb, &ref, &NAME_BADCLUS);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load $BadClus.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	ni = ntfs_i(inode);
@@ -1098,10 +1086,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	ref.seq = cpu_to_le16(MFT_REC_BITMAP);
 	inode = ntfs_iget5(sb, &ref, &NAME_BITMAP);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load $Bitmap.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	ni = ntfs_i(inode);
@@ -1131,17 +1117,15 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* Compute the MFT zone. */
 	err = ntfs_refresh_zone(sbi);
 	if (err)
-		goto out;
+		return err;
 
 	/* Load $AttrDef. */
 	ref.low = cpu_to_le32(MFT_REC_ATTR);
 	ref.seq = cpu_to_le16(MFT_REC_ATTR);
 	inode = ntfs_iget5(sbi->sb, &ref, &NAME_ATTRDEF);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load $AttrDef -> %d", err);
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	if (inode->i_size < sizeof(struct ATTR_DEF_ENTRY)) {
@@ -1202,10 +1186,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	ref.seq = cpu_to_le16(MFT_REC_UPCASE);
 	inode = ntfs_iget5(sb, &ref, &NAME_UPCASE);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load $UpCase.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	ni = ntfs_i(inode);
@@ -1251,7 +1233,7 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		/* Load $Secure. */
 		err = ntfs_security_init(sbi);
 		if (err)
-			goto out;
+			return err;
 
 		/* Load $Extend. */
 		err = ntfs_extend_init(sbi);
@@ -1275,26 +1257,20 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	ref.seq = cpu_to_le16(MFT_REC_ROOT);
 	inode = ntfs_iget5(sb, &ref, &NAME_ROOT);
 	if (IS_ERR(inode)) {
-		err = PTR_ERR(inode);
 		ntfs_err(sb, "Failed to load root.");
-		inode = NULL;
-		goto out;
+		return PTR_ERR(inode);
 	}
 
 	ni = ntfs_i(inode);
 
 	sb->s_root = d_make_root(inode);
-
-	if (!sb->s_root) {
-		err = -ENOMEM;
-		goto out;
-	}
+	if (!sb->s_root)
+		return -ENOMEM;
 
 	fc->fs_private = NULL;
 	fc->s_fs_info = NULL;
 
 	return 0;
-
 out:
 	iput(inode);
 	return err;
-- 
2.25.1

