Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AD63DD879
	for <ntfs3@lists.linux.dev>; Thu, 20 Aug 2026 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216816; cv=none; b=kGVw2gmRjNlmjQ0BVCJVAGWwkH10aYG2xYY6K8absUm3ljw0z8atnfHr8vrT0WZmLHNiqMGLR9BmvxmScL0KuQA6G8281pKYmw2v0AnRdVInmD5hvH1efW+ZqVqYFZDbv2KGsMTMGomLtjuDxLPZGuxxb+A9PMG4vByXO41/Buw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216816; c=relaxed/simple;
	bh=+IL4wbv74qFenbTgX7qYFcnfF+40cGsRn+Ujo8vRI/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orDYbOmhFqHvBPCEoJGYdPafmnItk21XronAj8xJt45tvu9sYliL/zHCzxxypADDkIm9nF7wnq8Wfv309vSksPjUBz4scFCxNCI13Xt0zHfHrzJzywUAo1oo1GmPsRNrIcgz+543iX6DNsEba7ZlrK/PRDEwCiVHPdJHY10dQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UzTtX4/+; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UzTtX4/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=tC
	vmRUjaZXMsQNbw9VGNSXcVV+yZ6GD/EQLcsG9+HzE=; b=UzTtX4/+mrIH+O4x7T
	T92uCdKVjGl34SX+XkZlkizQebaxdNhzlvWff80vRpGF1T1ydCgYwmejDVirnlJ6
	PiaZCWHd5G6+cAjNp7vlvJzvMH6pDwyIkmZCOFfkBNLo0HBMx6wZkOF/U+zYfIHG
	skgGlqhhYLchysq7fTcjoy1RM=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAHFld6w4ZqIRluPA--.45482S7;
	Thu, 20 Aug 2026 17:06:30 +0800 (CST)
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
Subject: [PATCH v4 5/7] ntfs3: add allocation tracepoints
Date: Thu, 20 Aug 2026 17:05:02 +0800
Message-ID: <20260820090504.950475-6-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820090504.950475-1-liubaolin12138@163.com>
References: <20260820090504.950475-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHFld6w4ZqIRluPA--.45482S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr15AFy5ZF48Gr4xJFW5Jrb_yoWrKw4fpF
	1DAFy3Ww48JrZFkwsavw18tw45uay8ur4UKry3Wry2yrn2qFn7tr4DtryqvFyvkrnYkrnI
	gFyq93s8W3WUWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRBMKZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwRZSHWqGw5YrLAAA3m

From: Baolin Liu <liubaolin@kylinos.cn>

Add ntfs3 tracepoints for allocation operations.

This adds trace events for attr_allocate_clusters(),
attr_set_size_ex(), and attr_data_get_block() to help
observe cluster allocation, size changes, and block
mapping activity.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs3/attrib.c            | 12 ++++++
 include/trace/events/ntfs3.h | 78 ++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index c621a4c582f9..8c4a14a87721 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -13,6 +13,7 @@
 #include "debug.h"
 #include "ntfs.h"
 #include "ntfs_fs.h"
+#include <trace/events/ntfs3.h>
 
 /*
  * You can set external NTFS_MIN_LOG2_OF_CLUMP/NTFS_MAX_LOG2_OF_CLUMP to manage
@@ -167,6 +168,8 @@ int attr_allocate_clusters(struct ntfs_sb_info *sbi, struct runs_tree *run,
 	CLST flen, vcn0 = vcn, pre = pre_alloc ? *pre_alloc : 0;
 	size_t cnt = run->count;
 
+	trace_ntfs3_attr_allocate_clusters(sbi->sb, vcn, lcn, len, opt);
+
 	for (;;) {
 		err = ntfs_look_for_free_space(sbi, lcn, len + pre, &lcn, &flen,
 					       opt);
@@ -462,6 +465,12 @@ int attr_set_size_ex(struct ntfs_inode *ni, enum ATTR_TYPE type,
 		goto bad_inode;
 	}
 
+	trace_ntfs3_attr_set_size_ex(&ni->vfs_inode, le32_to_cpu(type),
+				     attr_b->non_res ?
+					     le64_to_cpu(attr_b->nres.data_size) :
+					     le32_to_cpu(attr_b->res.data_size),
+				     new_size, keep_prealloc, no_da);
+
 	if (!attr_b->non_res) {
 		err = attr_set_size_res(ni, attr_b, le_b, mi_b, new_size, run,
 					&attr_b);
@@ -960,6 +969,9 @@ int attr_data_get_block(struct ntfs_inode *ni, CLST vcn, CLST clen, CLST *lcn,
 	if (res)
 		*res = NULL;
 
+	trace_ntfs3_attr_data_get_block(&ni->vfs_inode, vcn, clen, new, zero,
+					no_da);
+
 	/* Try to find in cache. */
 	down_read(&ni->file.run_lock);
 	if (run_lookup_entry_da(&ni->file.run, !no_da ? &ni->file.run_da : NULL,
diff --git a/include/trace/events/ntfs3.h b/include/trace/events/ntfs3.h
index 4ac05ed29e49..e39765bc062f 100644
--- a/include/trace/events/ntfs3.h
+++ b/include/trace/events/ntfs3.h
@@ -223,6 +223,84 @@ TRACE_EVENT(ntfs3_indx_delete_entry,
 		  __entry->ino, __entry->type, __entry->key_len)
 );
 
+TRACE_EVENT(ntfs3_attr_allocate_clusters,
+	TP_PROTO(struct super_block *sb, u64 vcn, u64 lcn, u64 len, u32 opt),
+	TP_ARGS(sb, vcn, lcn, len, opt),
+	TP_STRUCT__entry(
+		__field(u64, vcn)
+		__field(u64, lcn)
+		__field(u64, len)
+		__field(dev_t, dev)
+		__field(u32, opt)
+	),
+	TP_fast_assign(
+		__entry->vcn = vcn;
+		__entry->lcn = lcn;
+		__entry->len = len;
+		__entry->dev = sb->s_dev;
+		__entry->opt = opt;
+	),
+	TP_printk("dev=(%d,%d) vcn=%llu lcn=%llu len=%llu opt=0x%x",
+		  MAJOR(__entry->dev), MINOR(__entry->dev),
+		  __entry->vcn, __entry->lcn, __entry->len, __entry->opt)
+);
+
+TRACE_EVENT(ntfs3_attr_set_size_ex,
+	TP_PROTO(struct inode *inode, u32 type, u64 old_size, u64 new_size,
+		 bool keep_prealloc, bool no_da),
+	TP_ARGS(inode, type, old_size, new_size, keep_prealloc, no_da),
+	TP_STRUCT__entry(
+		__field(u64, old_size)
+		__field(u64, new_size)
+		__field(unsigned long, ino)
+		__field(dev_t, dev)
+		__field(u32, type)
+		__field(bool, keep_prealloc)
+		__field(bool, no_da)
+	),
+	TP_fast_assign(
+		__entry->old_size = old_size;
+		__entry->new_size = new_size;
+		__entry->ino = inode->i_ino;
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->type = type;
+		__entry->keep_prealloc = keep_prealloc;
+		__entry->no_da = no_da;
+	),
+	TP_printk("dev=(%d,%d) ino=%lu type=0x%x old_size=%llu new_size=%llu keep_prealloc=%d no_da=%d",
+		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->ino,
+		  __entry->type, __entry->old_size, __entry->new_size,
+		  __entry->keep_prealloc, __entry->no_da)
+);
+
+TRACE_EVENT(ntfs3_attr_data_get_block,
+	TP_PROTO(struct inode *inode, u64 vcn, u64 clen, bool *new,
+		 bool zero, bool no_da),
+	TP_ARGS(inode, vcn, clen, new, zero, no_da),
+	TP_STRUCT__entry(
+		__field(u64, vcn)
+		__field(u64, clen)
+		__field(unsigned long, ino)
+		__field(dev_t, dev)
+		__field(bool, create)
+		__field(bool, zero)
+		__field(bool, no_da)
+	),
+	TP_fast_assign(
+		__entry->vcn = vcn;
+		__entry->clen = clen;
+		__entry->ino = inode->i_ino;
+		__entry->dev = inode->i_sb->s_dev;
+		__entry->create = !!new;
+		__entry->zero = zero;
+		__entry->no_da = no_da;
+	),
+	TP_printk("dev=(%d,%d) ino=%lu vcn=%llu clen=%llu create=%d zero=%d no_da=%d",
+		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->ino,
+		  __entry->vcn, __entry->clen, __entry->create,
+		  __entry->zero, __entry->no_da)
+);
+
 #endif /* _TRACE_NTFS3_H */
 
 #include <trace/define_trace.h>
-- 
2.51.0

