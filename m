Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB64872
	for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 09:56:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id o10so24500737lfr.11
        for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGO9p+zPOp044oimW3cPMiovpARyFCGNR8oIPi8AZPU=;
        b=iBRgBpa916zJw8hbi24LiAh9/Hu8m47Nx6o4pD2LlpkIF9aQ20gMPj9aGBwVKFWA6s
         TOypUug1FWRmfJ+zy6F66Q2NzhA5r4uTzogjczATXBXb1StrEgnfQ57khKTPSxpUeDXP
         LyF5CjDBBny0MI+fgdJEiy9d0vHPizWW0MKDV6m4n6n1vEGmRPKoXPJcczx+LTGGdMHK
         w3hFynuvjM3XItFYn7AGGMno261glDZa1aYy0mTObKKSPNogvtEsb55uinMf78ncFRHZ
         Fl3IruujPZGbrg6QHSeUYJWDGwRlYPKVeXpZMwBOcBlfKsJCcofh49+E0WWS66iVC+eE
         bSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGO9p+zPOp044oimW3cPMiovpARyFCGNR8oIPi8AZPU=;
        b=bdvDobCTLTs+S9ATekSi7/njLJcmbFvIFbhwyhbIRJOvJ6Jx/pO6+CPGC0mTy+2rKh
         TVFAvyMn2LwmI6zxkfFVEtY173VwAbDvVGuJrZRAa97z0wdo7hRb3sx9EUQY7ghRve5F
         zReRd3vmKIa3dENHoyKrDCjxRfc5z9zJxWFwdjUCTw72Og0PqqecCUFY8/g46i6y95Bs
         5GfJ3h6qeXgcowtM4Xk+fgbdx6faY0lg/ofAa7SyQYYRYkoGgx+H7yaid5p2rCHuizt3
         T+eewuneMO8LNuBzkvflgbt8T5KsW4OsReNyqYnAmf2/52fNzOGAHpdsRVBjcBM3jJ/C
         wxjA==
X-Gm-Message-State: AOAM530UszonWzfblXyboV0RZLKwSToRo9AsLe08GcCZMZSiXwwBJNLU
	3y6uYS1Jutv5qBv+PQS17pQ=
X-Google-Smtp-Source: ABdhPJxOSCcWhZDxEOrrYu3IkI+msRTPX1/R7tSg5QfgUJ47bXKNWWftop/khiWZU5RKKIBZQOaiTA==
X-Received: by 2002:a05:6512:234d:: with SMTP id p13mr13276912lfu.461.1630231017923;
        Sun, 29 Aug 2021 02:56:57 -0700 (PDT)
Received: from localhost.localdomain (37-33-245-172.bb.dnainternet.fi. [37.33.245.172])
        by smtp.gmail.com with ESMTPSA id d6sm1090521lfi.57.2021.08.29.02.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:56:57 -0700 (PDT)
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
Subject: [PATCH v3 9/9] fs/ntfs3: Show uid/gid always in show_options()
Date: Sun, 29 Aug 2021 12:56:14 +0300
Message-Id: <20210829095614.50021-10-kari.argillander@gmail.com>
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

Show options should show option according documentation when some value
is not default or when ever coder wants. Uid/gid are problematic because
it is hard to know which are defaults. In file system there is many
different implementation for this problem.

Some file systems show uid/gid when they are different than root, some
when user has set them and some show them always. There is also problem
that what if root uid/gid change. This code just choose to show them
always. This way we do not need to think this any more.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 fs/ntfs3/ntfs_fs.h | 23 ++++++++++-------------
 fs/ntfs3/super.c   | 12 ++++--------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 5df55bc733bd..a3a7d10de7cb 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -60,19 +60,16 @@ struct ntfs_mount_options {
 	u16 fs_fmask_inv;
 	u16 fs_dmask_inv;
 
-	unsigned uid : 1, /* uid was set */
-		gid : 1, /* gid was set */
-		fmask : 1, /* fmask was set */
-		dmask : 1, /*dmask was set*/
-		sys_immutable : 1, /* immutable system files */
-		discard : 1, /* issue discard requests on deletions */
-		sparse : 1, /*create sparse files*/
-		showmeta : 1, /*show meta files*/
-		nohidden : 1, /*do not show hidden files*/
-		force : 1, /*rw mount dirty volume*/
-		noacs_rules : 1, /*exclude acs rules*/
-		prealloc : 1 /*preallocate space when file is growing*/
-		;
+	unsigned fmask : 1; /* fmask was set */
+	unsigned dmask : 1; /*dmask was set*/
+	unsigned sys_immutable : 1; /* immutable system files */
+	unsigned discard : 1; /* issue discard requests on deletions */
+	unsigned sparse : 1; /*create sparse files*/
+	unsigned showmeta : 1; /*show meta files*/
+	unsigned nohidden : 1; /*do not show hidden files*/
+	unsigned force : 1; /*rw mount dirty volume*/
+	unsigned noacs_rules : 1; /*exclude acs rules*/
+	unsigned prealloc : 1; /*preallocate space when file is growing*/
 };
 
 /* special value to unpack and deallocate*/
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index d7408b4f6813..d28fab6c2297 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -287,13 +287,11 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
 		opts->fs_uid = make_kuid(current_user_ns(), result.uint_32);
 		if (!uid_valid(opts->fs_uid))
 			return invalf(fc, "ntfs3: Invalid value for uid.");
-		opts->uid = 1;
 		break;
 	case Opt_gid:
 		opts->fs_gid = make_kgid(current_user_ns(), result.uint_32);
 		if (!gid_valid(opts->fs_gid))
 			return invalf(fc, "ntfs3: Invalid value for gid.");
-		opts->gid = 1;
 		break;
 	case Opt_umask:
 		if (result.uint_32 & ~07777)
@@ -512,12 +510,10 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 	struct ntfs_mount_options *opts = sbi->options;
 	struct user_namespace *user_ns = seq_user_ns(m);
 
-	if (opts->uid)
-		seq_printf(m, ",uid=%u",
-			   from_kuid_munged(user_ns, opts->fs_uid));
-	if (opts->gid)
-		seq_printf(m, ",gid=%u",
-			   from_kgid_munged(user_ns, opts->fs_gid));
+	seq_printf(m, ",uid=%u",
+		  from_kuid_munged(user_ns, opts->fs_uid));
+	seq_printf(m, ",gid=%u",
+		  from_kgid_munged(user_ns, opts->fs_gid));
 	if (opts->fmask)
 		seq_printf(m, ",fmask=%04o", ~opts->fs_fmask_inv);
 	if (opts->dmask)
-- 
2.25.1

