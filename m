Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483DD3FDE
	for <ntfs3@lists.linux.dev>; Tue,  7 Sep 2021 15:36:30 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id t19so20285370lfe.13
        for <ntfs3@lists.linux.dev>; Tue, 07 Sep 2021 08:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ylxb5RZ+eMJvrKhxMzlFWiAiShFTuT1l3TN+viEp6UY=;
        b=bTiYvWMbHeuqnhR0ZZ7sF/A3QNiMGYrTuIy1x4pDCfq3Hy57eWQFfLIzLCjvMbOCh9
         y8KHuUa2g3U32Rt49yN2OuzEpXFWKEokWQYVW71+8okQuJCVFh9G+xhkmllEgvUEgZa2
         e6bKeeb7t05489op6NF2PBSNmIXueAGSkYAJQGYlwQM27dNd7i9IeJFOWv/e+6hMHKrt
         adZHBIT71wUuJs6drLNSGmIIZiRMjYsgtGY2m6CT3DD/maxM0ZqsdScSXVXD6JnFXust
         Xc/qZ6AQ/VsKM/cmober/QfbUL2b+L8eEXnjHXP3iSvzrY2S21tDYZGMfmh5ZCyv0Cxs
         r8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ylxb5RZ+eMJvrKhxMzlFWiAiShFTuT1l3TN+viEp6UY=;
        b=K622SKGz+H8Hn1C1E8BeJHmYW+I+/KVjufauCQayL3JdJK1d2/C6PO2Dqk5J0XH6fG
         2xn2Pza3zP4pWAYqJYF2fZGWjJhNQxLvAzIXp8d7tbTr2cbprNhcTVTo3Wt/k3M6cHli
         /WTmloMDE4Y+3eYRTVf584IFlDYFjOnORIj3N9cjgVamJkJIL6pryEHjdTOD1YPuEsSp
         mlsLV/wV3c+MgKxSdcAHp2O8Gx+M1XSlTE7UftV9RScH75ZFwiWf1+8cPlUrHhZ3rQ7M
         dbKuDBTbzPMGfQuvvJ45/xuH0oCvTw6oXk1VuPVhS9u/jjIoTbTAx8kPhRqG8uTuTQKK
         F/4A==
X-Gm-Message-State: AOAM531GFPSNiEkALb8syNxMiTExA5b5sH3y5tryO7Y9hCRlw7LQri+W
	XkVYu7YaEtgavhbFKRwqK6Y=
X-Google-Smtp-Source: ABdhPJww8obqgjqp+QMqrJ/aiJi9o7nTCoVkSIvWmlT0cZSwVG8oFr0dlhrzE6CWhirxyPi5ckXNYA==
X-Received: by 2002:ac2:4906:: with SMTP id n6mr13046916lfi.381.1631028988446;
        Tue, 07 Sep 2021 08:36:28 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id p14sm1484458lji.56.2021.09.07.08.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 08:36:28 -0700 (PDT)
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
Subject: [PATCH v4 9/9] fs/ntfs3: Show uid/gid always in show_options()
Date: Tue,  7 Sep 2021 18:35:57 +0300
Message-Id: <20210907153557.144391-10-kari.argillander@gmail.com>
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
index 15bab48bc1ad..372cda697dd4 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -60,19 +60,16 @@ struct ntfs_mount_options {
 	u16 fs_fmask_inv;
 	u16 fs_dmask_inv;
 
-	unsigned uid : 1, /* uid was set. */
-		gid : 1, /* gid was set. */
-		fmask : 1, /* fmask was set. */
-		dmask : 1, /* dmask was set. */
-		sys_immutable : 1, /* Immutable system files. */
-		discard : 1, /* Issue discard requests on deletions. */
-		sparse : 1, /* Create sparse files. */
-		showmeta : 1, /* Show meta files. */
-		nohidden : 1, /* Do not show hidden files. */
-		force : 1, /* Rw mount dirty volume. */
-		noacsrules : 1, /*Exclude acs rules. */
-		prealloc : 1 /* Preallocate space when file is growing. */
-		;
+	unsigned fmask : 1; /* fmask was set. */
+	unsigned dmask : 1; /*dmask was set. */
+	unsigned sys_immutable : 1; /* Immutable system files. */
+	unsigned discard : 1; /* Issue discard requests on deletions. */
+	unsigned sparse : 1; /* Create sparse files. */
+	unsigned showmeta : 1; /* Show meta files. */
+	unsigned nohidden : 1; /* Do not show hidden files. */
+	unsigned force : 1; /* RW mount dirty volume. */
+	unsigned noacsrules : 1; /* Exclude acs rules. */
+	unsigned prealloc : 1; /* Preallocate space when file is growing. */
 };
 
 /* Special value to unpack and deallocate. */
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 0690e7e4f00d..3cba0b5e7ac7 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -294,13 +294,11 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
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
@@ -521,12 +519,10 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
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

