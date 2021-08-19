Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B862173
	for <ntfs3@lists.linux.dev>; Thu, 19 Aug 2021 00:27:09 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z2so8673106lft.1
        for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 17:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tfj//FhhyfKeVdQKBClWYDezrF9aDmSu69DJf1xq7P8=;
        b=thVoF9ouc3UABUSLBdo0ij9UzOTBrj3X8W/FHCdoHzz88ZfvvTe97dyzMhmdyk3zNM
         YImGEfe57iO6S49EtR0cfXdhqFrgWWYqQmYDX3D8hmLv5LebdvUH8Qx0Bq7svVTPjMEr
         pkNMZlH/Vj2uLfoTjGlpCAT28VTwKPzBJoMIDY8KhzpdhDa08sVqtcwWDCzP2rxU/gbM
         MDOSGMVm+J3WIzn3U4LWpkhgCcj5mC1D3jxhcee6NjaRCCyGJKm836UfipILfxkpEpAE
         CzYURShrAPoo4Dzs/qQw4dcpFLaJsI1TCdJBveoGnYRkuKymyFGZvitzqGMpbkUlLqpp
         wHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tfj//FhhyfKeVdQKBClWYDezrF9aDmSu69DJf1xq7P8=;
        b=JcPF+4pclu/oEkq8cRT2QbuTuDhNgCTGbtu0LwEBh0T5DdqsJO3fnKwX00w69gLhBI
         f7nCLE1azxhvyxAf7bEFCaSD3fmYMioNmksyyw8fvD63UeD/YA12+DJQlntKq3tYM/Mh
         OaMKa6Z4dYGYdA0pqb7D27A9GsHXcSNSol+bqOxLe4PSjXD2v11mq0zxBJdSx5VsXxVY
         kHVXf9dfLxszzVn5mwcRMuM53mYGQNqMZS84MjsVFXEDKG4Tk7t2+IMAlH3gJvtcWV56
         PGNW2XpPdFGmqP+VlrsPlJ2Wptk7c2OZGMmG/UDMF3CC9KojnlLHOQDAif/+heIJ+EwP
         rp1A==
X-Gm-Message-State: AOAM530aHW5J5BFYR5GhOYHpxhcA8qfjCKpgQ281fRMT6WZOd62ubT/B
	2pKnjwrPdMcwboptCaPhbZU=
X-Google-Smtp-Source: ABdhPJwT3+v+7NqeseVFVx9AsF7XLv/dX5uKdtVC+OFkf26i730dxctkKj3zsuC8pyWlV0/5AnxgyA==
X-Received: by 2002:ac2:58d4:: with SMTP id u20mr8007445lfo.157.1629332827385;
        Wed, 18 Aug 2021 17:27:07 -0700 (PDT)
Received: from kari-VirtualBox.telewell.oy (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id l14sm125907lji.106.2021.08.18.17.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 17:27:07 -0700 (PDT)
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>
Cc: Kari Argillander <kari.argillander@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [PATCH v2 1/6] fs/ntfs3: Remove unnecesarry mount option noatime
Date: Thu, 19 Aug 2021 03:26:28 +0300
Message-Id: <20210819002633.689831-2-kari.argillander@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819002633.689831-1-kari.argillander@gmail.com>
References: <20210819002633.689831-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecesarry mount option noatime because this will be handled
by VFS. Our option parser will never get opt like this.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 Documentation/filesystems/ntfs3.rst | 4 ----
 fs/ntfs3/super.c                    | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
index ffe9ea0c1499..af7158de6fde 100644
--- a/Documentation/filesystems/ntfs3.rst
+++ b/Documentation/filesystems/ntfs3.rst
@@ -85,10 +85,6 @@ acl			Support POSIX ACLs (Access Control Lists). Effective if
 			supported by Kernel. Not to be confused with NTFS ACLs.
 			The option specified as acl enables support for POSIX ACLs.
 
-noatime			All files and directories will not update their last access
-			time attribute if a partition is mounted with this parameter.
-			This option can speed up file system operation.
-
 ===============================================================================
 
 ToDo list
diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 6be13e256c1a..081ac875a61a 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -215,7 +215,6 @@ enum Opt {
 	Opt_nohidden,
 	Opt_showmeta,
 	Opt_acl,
-	Opt_noatime,
 	Opt_nls,
 	Opt_prealloc,
 	Opt_no_acs_rules,
@@ -234,7 +233,6 @@ static const match_table_t ntfs_tokens = {
 	{ Opt_sparse, "sparse" },
 	{ Opt_nohidden, "nohidden" },
 	{ Opt_acl, "acl" },
-	{ Opt_noatime, "noatime" },
 	{ Opt_showmeta, "showmeta" },
 	{ Opt_nls, "nls=%s" },
 	{ Opt_prealloc, "prealloc" },
@@ -325,9 +323,6 @@ static noinline int ntfs_parse_options(struct super_block *sb, char *options,
 			ntfs_err(sb, "support for ACL not compiled in!");
 			return -EINVAL;
 #endif
-		case Opt_noatime:
-			sb->s_flags |= SB_NOATIME;
-			break;
 		case Opt_showmeta:
 			opts->showmeta = 1;
 			break;
@@ -574,8 +569,6 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
 		seq_puts(m, ",prealloc");
 	if (sb->s_flags & SB_POSIXACL)
 		seq_puts(m, ",acl");
-	if (sb->s_flags & SB_NOATIME)
-		seq_puts(m, ",noatime");
 
 	return 0;
 }
-- 
2.25.1

