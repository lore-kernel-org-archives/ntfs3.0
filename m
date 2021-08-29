Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422772
	for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 09:56:57 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id l18so20048992lji.12
        for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 02:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0dAQLkYIlRiJK9IfureASYoNzBsPTMv+O08xyy3NXM=;
        b=nGOSyCLQIFlWIQ/Lc/mTiZ92PGZp+bmcaZZrQrxA5y5ObxD4l06ZoPBKJ7dD2clMjw
         iNJeBoahyaTfrXiBd3m6Y62rVnP1BDL+Ay52y3GWDfN5NDYno0bzPo2DLiM//4ITHsae
         ZTuGfyEkOrA5UjzpNcgi2/doDujxH6FNvZuMkonGwJvqTnlapCjEPYuZc7ZiL9FnYtmh
         0vNlxrzqGaxpc2My9csZ/leU0MCy4o43UonG/M9RLzy4V6FzjBL4Ity5Rp0gcAexSaJ9
         gsBZkLdm+RIH9O4zxM/voVE6C6hfEVX7cUJ1ZDBc2OwWEQHgJhVddg7bAQSIuL5/C5Cp
         hDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0dAQLkYIlRiJK9IfureASYoNzBsPTMv+O08xyy3NXM=;
        b=S70OoYm7tFp0v89+NLAL+dcXCd54HWfqcB3UulBjxddhZAZ3pZ5YA9CeLA2dUCIgx4
         UpbpVMvalLBvZku9qbAAtQa3m0/OvYzUIxG1t5Wt2yHtRhL2bMB3i2JuYdKZWH7JVvy0
         LfRxEUvN7FlpLer2Sygt+2mdC4VBh+4upDoFaC33jSYl2l1fSfMuW2iWLGtW0LVZ5MwL
         HzYcbaeoKbTDmVmYAbniWXdN55twsON0lRANCY3qpL+2neX+lUi4r76peLsXV6vBmjCj
         EF8/JQ/er/9k2Lli9YzCdo+C5ujmx7J2+wGWcHAKsyLjHBs+0hCqIGxMut6S34LVJ0E2
         Yd2Q==
X-Gm-Message-State: AOAM532YvOj8eAE3Z1AAGtFm8iC55YgmWty2+Es4Z+sjL7enF0g/qJgc
	bQF6pNgYYoKw6rkKZDbiehE=
X-Google-Smtp-Source: ABdhPJyAqy1EFURVwVmMWuDazMXwGx/Mut8Do0gXgICIvI9X8r9bCzixcBEaLtH7W9BJ62DWUM4Q6w==
X-Received: by 2002:a05:651c:1af:: with SMTP id c15mr15377950ljn.194.1630231016161;
        Sun, 29 Aug 2021 02:56:56 -0700 (PDT)
Received: from localhost.localdomain (37-33-245-172.bb.dnainternet.fi. [37.33.245.172])
        by smtp.gmail.com with ESMTPSA id d6sm1090521lfi.57.2021.08.29.02.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:56:55 -0700 (PDT)
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
Subject: [PATCH v3 8/9] fs/ntfs3: Rename mount option no_acl_rules > (no)acl_rules
Date: Sun, 29 Aug 2021 12:56:13 +0300
Message-Id: <20210829095614.50021-9-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829095614.50021-1-kari.argillander@gmail.com>
References: <20210829095614.50021-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename mount option no_acl_rules to noacl_rules. This allow us to use
possibility to mount with options noacl_rules or acl_rules.

Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 Documentation/filesystems/ntfs3.rst |  2 +-
 fs/ntfs3/file.c                     |  2 +-
 fs/ntfs3/ntfs_fs.h                  |  2 +-
 fs/ntfs3/super.c                    | 12 ++++++------
 fs/ntfs3/xattr.c                    |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index ded706474825..bdc9dd5a9185 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -73,7 +73,7 @@ prealloc		Preallocate space for files excessively when file size is
 			increasing on writes. Decreases fragmentation in case of
 			parallel write operations to different files.
 
-no_acs_rules		"No access rules" mount option sets access rights for
+noacs_rules		"No access rules" mount option sets access rights for
 			files/folders to 777 and owner/group to root. This mount
 			option absorbs all other permissions:
 			- permissions change for files/folders will be reported
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index c79e4aff7a19..4c9ff7fcf0b1 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -743,7 +743,7 @@ int ntfs3_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 	umode_t mode = inode->i_mode;
 	int err;
 
-	if (sbi->options->no_acs_rules) {
+	if (sbi->options->noacs_rules) {
 		/* "no access rules" - force any changes of time etc. */
 		attr->ia_valid |= ATTR_FORCE;
 		/* and disable for editing some attributes */
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 45d6f4f91222..5df55bc733bd 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -70,7 +70,7 @@ struct ntfs_mount_options {
 		showmeta : 1, /*show meta files*/
 		nohidden : 1, /*do not show hidden files*/
 		force : 1, /*rw mount dirty volume*/
-		no_acs_rules : 1, /*exclude acs rules*/
+		noacs_rules : 1, /*exclude acs rules*/
 		prealloc : 1 /*preallocate space when file is growing*/
 		;
 };
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index e5c319604c4d..d7408b4f6813 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -221,7 +221,7 @@ enum Opt {
 	Opt_acl,
 	Opt_iocharset,
 	Opt_prealloc,
-	Opt_no_acs_rules,
+	Opt_noacs_rules,
 	Opt_err,
 };
 
@@ -239,7 +239,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("acl",			Opt_acl),
 	fsparam_flag_no("showmeta",		Opt_showmeta),
 	fsparam_flag_no("prealloc",		Opt_prealloc),
-	fsparam_flag("no_acs_rules",		Opt_no_acs_rules),
+	fsparam_flag_no("acs_rules",		Opt_noacs_rules),
 	fsparam_string("iocharset",		Opt_iocharset),
 
 	__fsparam(fs_param_is_string,
@@ -351,8 +351,8 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 	case Opt_prealloc:
 		opts->prealloc = result.negated ? 0 : 1;
 		break;
-	case Opt_no_acs_rules:
-		opts->no_acs_rules = 1;
+	case Opt_noacs_rules:
+		opts->noacs_rules = result.negated ? 1 : 0;
 		break;
 	default:
 		/* Should not be here unless we forget add case. */
@@ -538,8 +538,8 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 		seq_puts(m, ",nohidden");
 	if (opts->force)
 		seq_puts(m, ",force");
-	if (opts->no_acs_rules)
-		seq_puts(m, ",no_acs_rules");
+	if (opts->noacs_rules)
+		seq_puts(m, ",noacs_rules");
 	if (opts->prealloc)
 		seq_puts(m, ",prealloc");
 	if (sb->s_flags & SB_POSIXACL)
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index a17d48735b99..4b37ed239579 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -774,7 +774,7 @@ int ntfs_acl_chmod(struct user_namespace *mnt_userns, struct inode *inode)
 int ntfs_permission(struct user_namespace *mnt_userns, struct inode *inode,
 		    int mask)
 {
-	if (ntfs_sb(inode->i_sb)->options->no_acs_rules) {
+	if (ntfs_sb(inode->i_sb)->options->noacs_rules) {
 		/* "no access rules" mode - allow all changes */
 		return 0;
 	}
-- 
2.25.1

