Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=182.48.54.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616325;
	b=GKh9RGEE8hHW6AP2LtSHSNaT1sLQr7t35J5qiEAwqLEM34ketDrfC56krOQZRoJ1OEig
	 dlxVkCqtIqyrPUC0QqLwIzD8ywRX6VjFaceH1vA7KH8JGgMZ+O4GClTcfRV1aKuW617cx
	 O0KSZ0AT25mPMwdhKBtfn+kqwS4w9OO3p/WYxCwhkkz9MLmfLFDd0JKLonImxpgQA/Bzl
	 nFTaXOqFedW9HuWnqtSGbK1DldmbQo9b9UGc+EC4JFsqctVYSH5KqUeMNhQB6ceo15U1L
	 3VMtaloUO8UjghRMxIj384LsDG9+G6mVLzyrpo5M6BPiDYq5JpFv3YQn+x3LPirPQtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616325;
	h=DMARC-Filter:Received:From:Date:To:Cc:Subject:Message-ID;
	bh=/u0VjsxyPMAOJR7Q0uAek0+O26RmbI4zuyFPBC98RLU=;
	b=H8ag+pLXszF9zKAVJd9HRtEy1QRcwa2BVvvAeSbPg8O6FTMiW4CPppNXZIoiL9Doi1q7
	 FxIgDQwD7WV+mwWNINHpbPUzZaW5X/36Xu08AN7ths7fVuLphQNIecljES9G8Mq7RI8Ve
	 t1T7ithwJ9UvjYiJHvZWpOPDvaG328nvGpLfud+kwDcm0o/XTpr8YiJbk/47YVcoo848T
	 Y8cHwJpg2gjd7DkoLFjqtFEgsY/4BKf9cdnEAUIWlbsJZVPI3KlMXJjlZkBk6pzrL6Shg
	 AkC/JkWoY7q1YfkjMRs0ogqPBBnQdj5EDDvNu6wveYLJszIQuEOnmrocmOioe3+IcpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=snowrabbit.org;
	spf=pass smtp.mailfrom=snowrabbit.org;
	arc=none smtp.remote-ip=182.48.54.220
Received: from bambi.snowrabbit.org (bambi.snowrabbit.org [182.48.54.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CFB606A329
	for <ntfs3@lists.linux.dev>; Wed, 25 Nov 2026 14:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89CFB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=snowrabbit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snowrabbit.org
Received: by bambi.snowrabbit.org (Postfix, from userid 3001)
	id DD70CC9300; Wed, 25 Nov 2026 23:18:43 +0900 (JST)
From: Showta Ishizaki <zakinko@snowrabbit.org>
Date: Wed, 25 Nov 2026 23:18:20 +0900
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
    linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Showta Ishizaki <zakinko@snowrabbit.org>
Subject: [PATCH] fs/ntfs3: keep the reparse tag of a long symlink in the parent
Message-ID: <20261125-ntfs3-02-v1@snowrabbit.org>
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list

readdir() returns DT_REG for a symlink with a long target once the
symlink itself has been changed:

  # ln -s $(printf 'a%.0s' $(seq 200)) l
  # touch -h l

After a remount l is a symlink for lstat() and a regular file for
readdir().  ntfs3 keeps the reparse data of such a symlink non-resident,
and ni_update_parent() takes the tag only from resident data, so it
writes 0 over the tag in the parent.

Read the tag from disk when the data is non-resident.

I tried targets of 10, 100, 200, 500 and 1000 bytes.  Without the patch
touch -h made the last three DT_REG, and with it all five stay DT_LNK,
also after chown -h and a rename.

Signed-off-by: Showta Ishizaki <zakinko@snowrabbit.org>
---
 fs/ntfs3/frecord.c | 45 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 16ac847..14b9006 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3039,6 +3039,36 @@ int ni_write_parents(struct ntfs_inode *ni, int sync)
 	return err;
 }
 
+/*
+ * ni_reparse_tag - Return the tag of the reparse point in @attr.
+ *
+ * The tag is the first field of the reparse data (MS-FSCC 2.1.2.2).
+ * ntfs_create_inode() keeps the reparse data of a long symlink
+ * non-resident, so it may have to be read from disk.  Returns 0 if it
+ * cannot be read.
+ */
+static __le32 ni_reparse_tag(struct ntfs_inode *ni, struct ATTRIB *attr)
+{
+	const struct REPARSE_POINT *rp;
+	struct runs_tree run;
+	__le32 tag;
+
+	if (!attr->non_res) {
+		rp = resident_data_ex(attr, sizeof(struct REPARSE_POINT));
+		return rp ? rp->ReparseTag : 0;
+	}
+
+	if (le64_to_cpu(attr->nres.data_size) < sizeof(tag))
+		return 0;
+
+	run_init(&run);
+	if (attr_load_runs_vcn(ni, ATTR_REPARSE, NULL, 0, &run, 0) ||
+	    ntfs_read_run_nb(ni->mi.sbi, &run, 0, &tag, sizeof(tag), NULL))
+		tag = 0;
+	run_close(&run);
+	return tag;
+}
+
 /*
  * ni_update_parent
  *
@@ -3098,15 +3128,12 @@ static bool ni_update_parent(struct ntfs_inode *ni, struct NTFS_DUP_INFO *dup,
 		attr = ni_find_attr(ni, NULL, NULL, ATTR_REPARSE, NULL, 0, NULL,
 				    NULL);
 
-		if (attr) {
-			const struct REPARSE_POINT *rp;
-
-			rp = resident_data_ex(attr,
-					      sizeof(struct REPARSE_POINT));
-			/* If ATTR_REPARSE exists 'rp' can't be NULL. */
-			if (rp)
-				dup->extend_data = rp->ReparseTag;
-		}
+		/*
+		 * Reading only resident data here used to leave extend_data 0
+		 * for a long symlink, and readdir then reported it as DT_REG.
+		 */
+		if (attr)
+			dup->extend_data = ni_reparse_tag(ni, attr);
 	} else if (ni->ni_flags & NI_FLAG_EA) {
 		attr = ni_find_attr(ni, attr, &le, ATTR_EA_INFO, NULL, 0, NULL,
 				    NULL);
-- 
2.54.0 (Apple Git-157)

