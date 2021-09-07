Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53C572
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 15:36:28 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id d16so17240032ljq.4
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 08:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IBOhrHMY/c1tfwUMPdU4gIC4AvL9Y2ZEu59nLM3Bis=;
        b=ecuY4YKKqY9hcXGVgcr5eF6494AIrirQii9krUItCo+qkAgsKVoph54s8t7Iy2wKDI
         ciFIB303/DuMBw8wqrCNcV2J0fZae4BNrYGctK33CNJpwEUdhP54Kgo4DwsmNbILVCgB
         g81DUJ3/Bbx6psqZeKu2zgxOJrJmGxEFi06NLa64SKUulTWhAHX9Qnfe4opfekArtskT
         zQJD2csRnZ4vRs3HqVmhtp4yHYGOLHm4ey/9julIymM1sk+No2FYfDGSEP8unMCHHsXr
         3BXhx+y241cMSZiyz0im/U96+dd7gEnA+oJHq2IB/DAkwHKIzXNYo//8B+C4wt7TZle6
         3xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IBOhrHMY/c1tfwUMPdU4gIC4AvL9Y2ZEu59nLM3Bis=;
        b=pLziq5gKRMl1rik2a6chuQSeL/L+4A2Z0h6cVk6/p/6S1WSlgLIVFq3cgdD1+1QpiJ
         bIowLGBANeBZgyKaSQYx/rIaAstAVxkRwafCWkoKzREbg2DbM0G9JB3HSqQnC6wlUehd
         TBrS5bJuuo6yqbdSft0J1h9cOzVTvqpnrSBlCpOkgzhv9sN44hU1G61KXCxcFH1TRoyB
         nnHH2qgKmXnwvS6M4ZQWNchYdBcokExFfIUqaE3VCf+mhY1Slo+BRE2Vjk7vTefUVinQ
         URtvAb8X5UZXHIhkxqtpvidAIWyNsxUk6fQGQSTo2FKBdx2b6eDZBEdhh9go3i7ypwDU
         Nr5w==
X-Gm-Message-State: AOAM530uj3I34igP1rOCjidygaF91ZPs8nfetQn87IC+VcgIxUsi94Tv
	SJtO53/aAOofDgp3BszR+64=
X-Google-Smtp-Source: ABdhPJwpmkQPafKAJkRMMmr+44q6bqHZjG8USn5+w+wAveGGiMn9+GDaA6WHOcgJotZAMY4rGoeKmw==
X-Received: by 2002:a2e:9dcb:: with SMTP id x11mr15667575ljj.137.1631028986922;
        Tue, 07 Sep 2021 08:36:26 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id p14sm1484458lji.56.2021.09.07.08.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 08:36:26 -0700 (PDT)
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
Subject: [PATCH v4 8/9] fs/ntfs3: Rename mount option no_acs_rules > (no)acsrules
Date: Tue,  7 Sep 2021 18:35:56 +0300
Message-Id: <20210907153557.144391-9-kari.argillander@gmail.com>
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

Rename mount option no_acs_rules to (no)acsrules. This allow us to use
possibility to mount with options noaclrules or aclrules.

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
index ded706474825..7b6afe452197 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -73,7 +73,7 @@ prealloc		Preallocate space for files excessively when file size is
 			increasing on writes. Decreases fragmentation in case of
 			parallel write operations to different files.
 
-no_acs_rules		"No access rules" mount option sets access rights for
+noacsrules		"No access rules" mount option sets access rights for
 			files/folders to 777 and owner/group to root. This mount
 			option absorbs all other permissions:
 			- permissions change for files/folders will be reported
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index fef57141b161..0743d806c567 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -737,7 +737,7 @@ int ntfs3_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 	umode_t mode = inode->i_mode;
 	int err;
 
-	if (sbi->options->no_acs_rules) {
+	if (sbi->options->noacsrules) {
 		/* "No access rules" - Force any changes of time etc. */
 		attr->ia_valid |= ATTR_FORCE;
 		/* and disable for editing some attributes. */
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index aa18f12b7096..15bab48bc1ad 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -70,7 +70,7 @@ struct ntfs_mount_options {
 		showmeta : 1, /* Show meta files. */
 		nohidden : 1, /* Do not show hidden files. */
 		force : 1, /* Rw mount dirty volume. */
-		no_acs_rules : 1, /*Exclude acs rules. */
+		noacsrules : 1, /*Exclude acs rules. */
 		prealloc : 1 /* Preallocate space when file is growing. */
 		;
 };
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 503e2e23f711..0690e7e4f00d 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -228,7 +228,7 @@ enum Opt {
 	Opt_acl,
 	Opt_iocharset,
 	Opt_prealloc,
-	Opt_no_acs_rules,
+	Opt_noacsrules,
 	Opt_err,
 };
 
@@ -246,7 +246,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
 	fsparam_flag_no("acl",			Opt_acl),
 	fsparam_flag_no("showmeta",		Opt_showmeta),
 	fsparam_flag_no("prealloc",		Opt_prealloc),
-	fsparam_flag("no_acs_rules",		Opt_no_acs_rules),
+	fsparam_flag_no("acsrules",		Opt_noacsrules),
 	fsparam_string("iocharset",		Opt_iocharset),
 
 	__fsparam(fs_param_is_string,
@@ -358,8 +358,8 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 	case Opt_prealloc:
 		opts->prealloc = result.negated ? 0 : 1;
 		break;
-	case Opt_no_acs_rules:
-		opts->no_acs_rules = 1;
+	case Opt_noacsrules:
+		opts->noacsrules = result.negated ? 1 : 0;
 		break;
 	default:
 		/* Should not be here unless we forget add case. */
@@ -547,8 +547,8 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 		seq_puts(m, ",nohidden");
 	if (opts->force)
 		seq_puts(m, ",force");
-	if (opts->no_acs_rules)
-		seq_puts(m, ",no_acs_rules");
+	if (opts->noacsrules)
+		seq_puts(m, ",noacsrules");
 	if (opts->prealloc)
 		seq_puts(m, ",prealloc");
 	if (sb->s_flags & SB_POSIXACL)
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index ac4b37bf8832..6f88cb77a17f 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -769,7 +769,7 @@ int ntfs_acl_chmod(struct user_namespace *mnt_userns, struct inode *inode)
 int ntfs_permission(struct user_namespace *mnt_userns, struct inode *inode,
 		    int mask)
 {
-	if (ntfs_sb(inode->i_sb)->options->no_acs_rules) {
+	if (ntfs_sb(inode->i_sb)->options->noacsrules) {
 		/* "No access rules" mode - Allow all changes. */
 		return 0;
 	}
-- 
2.25.1

