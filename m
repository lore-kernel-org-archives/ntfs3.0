Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2A017C8
	for <ntfs3@lists.linux.dev>; Sat, 30 Sep 2023 05:02:01 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5859e22c7daso1053754a12.1
        for <ntfs3@lists.linux.dev>; Fri, 29 Sep 2023 22:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696050121; x=1696654921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc3/lDJ0Y70q5wqO7T6IeDRSePuhtOmjFGCpqJDnCH4=;
        b=OCFjFJjfVsSvf+HQA80Lt11MZSy+Ap4PIP3ZBBjPjI7PRRqcHgGhAVmhHWLw3eLP/o
         lrhhPWWGklBvghk4TYqrzK1buQ9esDvMqB7posMHxxY9MYcYnTrgT+xiWAQ2jM4iD84I
         xwxxcbAGjXpIb3DxNdzIch/vcnYDhFzsX9kljFANW3OpDebkZ9YIhJvzj3J/Z71SGqrT
         jYnPgsFuF+a3AmJO8UzR1bHuYTUyVxEOLoATohqsIvtvZ0XCQ2wYGBmNBxFMMo/Lm403
         /Ny2YXNnE2y2TPanGUNGst6GYRD7G0Be3n7kgtUQ5ojihUVriccvYS87lrTrrvO9IYr1
         1JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696050121; x=1696654921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wc3/lDJ0Y70q5wqO7T6IeDRSePuhtOmjFGCpqJDnCH4=;
        b=UfH9fXeuZgIWWWa8gK8j/yo4u70xElyNqFZPFt55/kf2God9IVRSiSDNTOZobGd56/
         wpW/kqJthJb8/d8veoZ1CkJ2KJGHxTM7rHMIoq0ZKat9n1whNwLRGFcGBXw1qLFr5A2H
         vU/ryBZb9Vv93jWPvs+o0SxFWUpmDUgJEMfMcPQIIZvp5hKTDRxPIgpxWOotQRFDsbG8
         zdaIKZWY65yHFyYNDb2fg7DB8O2BL0it7gb2QcE87DFwOccZdUF8G+FEfiYUwVUkcW+Y
         d9oYJC7N9q1x7nJYhGsEw5o17XY/cFrMSCh2dO8NDMaSC/gzNbaLWfEMyKJIoy6Mr3vV
         2MPw==
X-Gm-Message-State: AOJu0YwuXeYTAYaA5x1PkpTJj5f4FGppT+etMfftwDRW+H5eNxFSkL1u
	uJXRLZtQybFbRIbisu4xYnQ=
X-Google-Smtp-Source: AGHT+IGwjxf7szTTsQLyPMtmx6D961AfPmaEk+HWKxuN9bQbxtvcTWtZao4yWyr/O0xKDGBTdR7a8g==
X-Received: by 2002:a05:6a20:1451:b0:15d:e68d:a855 with SMTP id a17-20020a056a20145100b0015de68da855mr6635638pzi.29.1696050121350;
        Fri, 29 Sep 2023 22:02:01 -0700 (PDT)
Received: from wedsonaf-dev.home.lan ([189.124.190.154])
        by smtp.googlemail.com with ESMTPSA id y10-20020a17090322ca00b001c322a41188sm392136plg.117.2023.09.29.22.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 22:02:01 -0700 (PDT)
From: Wedson Almeida Filho <wedsonaf@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Subject: [PATCH 19/29] ntfs3: move ntfs_xattr_handlers to .rodata
Date: Sat, 30 Sep 2023 02:00:23 -0300
Message-Id: <20230930050033.41174-20-wedsonaf@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230930050033.41174-1-wedsonaf@gmail.com>
References: <20230930050033.41174-1-wedsonaf@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wedson Almeida Filho <walmeida@microsoft.com>

This makes it harder for accidental or malicious changes to
ntfs_xattr_handlers at runtime.

Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
---
 fs/ntfs3/ntfs_fs.h | 2 +-
 fs/ntfs3/xattr.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 629403ede6e5..41c1538f8e51 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -872,7 +872,7 @@ int ntfs_init_acl(struct mnt_idmap *idmap, struct inode *inode,
 
 int ntfs_acl_chmod(struct mnt_idmap *idmap, struct dentry *dentry);
 ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size);
-extern const struct xattr_handler *ntfs_xattr_handlers[];
+extern const struct xattr_handler * const ntfs_xattr_handlers[];
 
 int ntfs_save_wsl_perm(struct inode *inode, __le16 *ea_size);
 void ntfs_get_wsl_perm(struct inode *inode);
diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 023f314e8950..a67ff036a251 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -1016,7 +1016,7 @@ static const struct xattr_handler ntfs_other_xattr_handler = {
 	.list	= ntfs_xattr_user_list,
 };
 
-const struct xattr_handler *ntfs_xattr_handlers[] = {
+const struct xattr_handler * const ntfs_xattr_handlers[] = {
 	&ntfs_other_xattr_handler,
 	NULL,
 };
-- 
2.34.1

