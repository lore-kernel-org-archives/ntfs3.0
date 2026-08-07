Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B144233938
	for <ntfs3@lists.linux.dev>; Fri,  7 Aug 2026 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064673; cv=none; b=O7Lsn2n6QHMURHQPWrZD8+pFI7GpsrdVYPt8/Uk0Bk3bImRMD1pqxG/LO/9M7QLoIK0QDZrSza8o1Ca22B6JJDaMcsn7123ZOqQvOjTpZJpQ7LElIP8m3GUpgvNdahvrxKAZVHNFDk4GZg5E5l3fLP1mZcSqrVNHbFxfInSLK6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064673; c=relaxed/simple;
	bh=Bu2vSu3DwMTZYlUvJN1sp50MCL0Vfz9Lx4mxay5YC6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNHUxKrKq+Wy8euN9JAXXPaGxc4QGdsAh8PRhCjz5P7l+pcO1WY9TzmWrSUc31pFk/bWCfe58yub6sb28QHhN/1JcsweBISmmEXrgePdIxdDX0FcQgmnE5yEtG7VCeLzg8lVpN3rODh/pGIEWN/q5sQyYGCMMMCNRBL0Uz5l0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gqhU6lIr; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gqhU6lIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mE
	8FbL0Y9igfRnF4YHueX6o/QSzO9T6fzQHIuuBtbcw=; b=gqhU6lIrUTKKWuc17O
	imYFDDgiYKMJlYJ4ayc7rOGt8rMmmBf5oIjBHHOebtQPo7PL1GqHs5VYL3K6J/xt
	bxuGj82Pby7b2mauuoH2nqLIU3I26oO1uJh59F48I4txow8OV43Pp5mdtStyPUK2
	Kkd4uA6eIrB4BXCvlbgoe2bNk=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAnpYn9LnVqp7BkOQ--.32974S5;
	Fri, 07 Aug 2026 09:04:09 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 v3 3/7] ntfs3: add create inode tracepoint
Date: Fri,  7 Aug 2026 09:03:50 +0800
Message-ID: <20260807010354.2277156-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260807010354.2277156-1-liubaolin12138@163.com>
References: <20260807010354.2277156-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnpYn9LnVqp7BkOQ--.32974S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr45GFykJF1rCrWrCrWfXwb_yoW8CryUpF
	nrAFs3Gws7J347KwsavF4UXFySvay8Gr4DJFyUu34xArnaqFn7trsFgw1DZ3Z5ArWFy343
	WFnI9ry5Cr12qw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRYXdbUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwQrFkGp1LwppFAAA3Z

From: Baolin Liu <liubaolin@kylinos.cn>

Add an ntfs3 tracepoint for inode creation.

This adds a trace event for ntfs_create_inode() to help
observe inode creation activity.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs3/inode.c             |  3 +++
 include/trace/events/ntfs3.h | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index c43101cc064d..2bc4ce2ee8d8 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -17,6 +17,7 @@
 #include "debug.h"
 #include "ntfs.h"
 #include "ntfs_fs.h"
+#include <trace/events/ntfs3.h>
 
 /*
  * ntfs_read_mft - Read record and parse MFT.
@@ -1206,6 +1207,8 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 	/* New file will be resident or non resident. */
 	const bool new_file_resident = 1;
 
+	trace_ntfs3_create_inode(dir, dentry);
+
 	if (!fnd)
 		ni_lock_dir(dir_ni);
 
diff --git a/include/trace/events/ntfs3.h b/include/trace/events/ntfs3.h
index a1e4bdb6ec59..67a2bde0266d 100644
--- a/include/trace/events/ntfs3.h
+++ b/include/trace/events/ntfs3.h
@@ -124,6 +124,24 @@ TRACE_EVENT(ntfs3_rename,
 		  __get_str(old_name), __get_str(new_name))
 );
 
+TRACE_EVENT(ntfs3_create_inode,
+	TP_PROTO(struct inode *dir, struct dentry *dentry),
+	TP_ARGS(dir, dentry),
+	TP_STRUCT__entry(
+		__field(unsigned long, parent_ino)
+		__field(dev_t, dev)
+		__string(name, dentry->d_name.name)
+	),
+	TP_fast_assign(
+		__entry->parent_ino = dir->i_ino;
+		__entry->dev = dir->i_sb->s_dev;
+		__assign_str(name);
+	),
+	TP_printk("dev=(%d,%d) parent=%lu name=%s",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		  __entry->parent_ino, __get_str(name))
+);
+
 #endif /* _TRACE_NTFS3_H */
 
 #include <trace/define_trace.h>
-- 
2.51.0

