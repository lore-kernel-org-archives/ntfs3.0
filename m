Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E047923EAB4;
	Sun, 30 Aug 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788080428; cv=none; b=BZxfNRyJE6RmCWZVBvXGBOokUvZPCh0PMMGj54qxV4j+9ERZUHE5pyjRVZ6jFICUHglzstUch7lLpvCKY0TS20/2c50JMtg7hjZxEzuUD+qhIvouLbAxqNPZUcukMdnbwA1olHhqPG8C1hnr/+kQJPGlYIgbQkwyQ2woYIIEyfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788080428; c=relaxed/simple;
	bh=kcleF2EmfN9Rj8HJQfYttqIKkrSNZFiBeAy0VMm+zpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tp9Q+PSc0O5o7AYLTykzJ2hihn5AX4q9OfpBkShkwQOYNxUbaeTDUxVADryhz3nv+BYX292u3E5sNYkC7H59CnCfqv3CS+ixT63cIP2rZqMXEsR4fk0InPBDEJ2twIjsRJcqNPJ/Pm/RGuEvi1+P8HUq3aw4UkWBRQoSxySDGxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tT5e7Bxy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tT5e7Bxy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6878FC2BCC7;
	Sun, 30 Aug 2026 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788080427;
	bh=kcleF2EmfN9Rj8HJQfYttqIKkrSNZFiBeAy0VMm+zpM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tT5e7BxyCEv//zYdZu4jFfOi6dxd4tpb2uni7nyM2Yiyvu7yLP0Y/Mhh8QHzKiZod
	 0sfzgYpXGxIHab2fJv0d9ID5AV0F+l5BjTqZjwX9KBqMptshS173ZGCvcC52cxqD8P
	 8hR4bgeE/JKIdg3453KqmxgF5ug0vpmSfVqo+I2EWS0K+J3RPY2vF1OHtCX2qP7rpb
	 qNJh2e+PFy6eDpF0wjaKuCBoz/vMQ0F+cZnQbz4I2bilnerqmPd36zWCC1sXyN84YS
	 CXzdUk/4/WPmoLVV2dfRNxzT23UaHLLed7L/PDSdOzMrPNvzZO/rf5J1/WcMwbDFZz
	 uiUHaYMU66DHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455B7C61DD9;
	Sun, 30 Aug 2026 09:00:27 +0000 (UTC)
From: Alon Shakevsky via B4 Relay <devnull+shakevsky.berkeley.edu@kernel.org>
Date: Sun, 30 Aug 2026 08:59:41 +0000
Subject: [PATCH] ntfs3: fix INSERT_RANGE for resident data
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-ntfs3-submission-v1-v1-1-08f61d390cd2@berkeley.edu>
X-B4-Tracking: v=1; b=H4sIAPzwk2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC2MD3byStGJj3eLSpNzMYpBi3TJDXUsjo0TDxDQjI1MDYyWgzoKi1LT
 MCrCp0bG1tQBZb6o+ZQAAAA==
X-Change-ID: 20260830-ntfs3-submission-v1-922a1af22503
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788080426; l=5177;
 i=shakevsky@berkeley.edu; s=20260829; h=from:subject:message-id;
 bh=pGlbQ/ekefG5GvysW3lyBdsViq83oasBwnZLQT7+l98=;
 b=YcPXHYyqboxJBcv6XOjxgfhvZmOgZzEPmHPM21MveJGjldQcBwK7Z9ZE+j2RNR+RIg4QB4q2z
 qa7trNr0dkDAYOQiqd6grhGzz64DT76NDAPGviYXFFpMA++9dSblZ0n
X-Developer-Key: i=shakevsky@berkeley.edu; a=ed25519;
 pk=yWZAM5+fHWudgjDI2F4zjbrSoHRSkvQ4pqpdyFWJUis=
X-Endpoint-Received: by B4 Relay for shakevsky@berkeley.edu/20260829 with
 auth_id=987
X-Original-From: Alon Shakevsky <shakevsky@berkeley.edu>
Reply-To: shakevsky@berkeley.edu

From: Alon Shakevsky <shakevsky@berkeley.edu>

attr_insert_range() grows a resident data attribute before creating the
hole. It then moves data with:

  memmove(data + bytes, data, bytes);

The move starts at offset zero and copies the insertion length. It should
start at vbo and copy the bytes between vbo and the old end of the value. A
valid insertion can therefore write past the MFT record allocation. KASAN
reports a slab out-of-bounds write in attr_insert_range().

attr_set_size() also sets i_size to the expanded size. The resident path
adds the insertion length again after the copy. If attr_set_size() converts
the value to nonresident storage, attr_insert_range() shifts the cluster
mapping using the expanded size and then adds the length again. Both paths
grow the file twice. The conversion path also leaves the original data at
its old offset.

An unprivileged user who can create files on a writable NTFS3 mount can
reach the resident path by marking a file sparse while it is empty, writing
resident data, and calling FALLOC_FL_INSERT_RANGE.

Before resizing a resident value, check whether the expanded value will fit
in its MFT record. If it fits, move the data from vbo, clear the new range,
and keep the size set by attr_set_size(). Otherwise, return
E_NTFS_NONRESIDENT so ntfs_fallocate() converts the original value before
retrying the insertion.

The new conversion path can fail while writing the cached data through its
new mapping. Update i_blocks and mark the inode dirty in
attr_force_nonresident() so the converted attribute does not leave stale
inode accounting.

Fixes: aa30eccb24e5 ("fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE) implementation")
Cc: stable@vger.kernel.org
Assisted-by: Antiproof:GPT-5.6-Sol
Signed-off-by: Alon Shakevsky <shakevsky@berkeley.edu>
---
 fs/ntfs3/attrib.c | 42 ++++++++++++++++++++++++------------------
 fs/ntfs3/file.c   | 17 +++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206ffa..a16e0c259ab1 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -2589,35 +2589,37 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
 	down_write(&ni->file.run_lock);
 
 	if (!attr_b->non_res) {
+		char *data;
+		u32 used = le32_to_cpu(mi_b->mrec->used);
+		u64 dsize;
+
+		dsize = ALIGN(data_size + bytes, 8) - ALIGN(data_size, 8);
+		if (used + dsize > sbi->max_bytes_per_attr) {
+			err = E_NTFS_NONRESIDENT;
+			goto out;
+		}
+
 		err = attr_set_size(ni, ATTR_DATA, ni->file.ads.name,
 				    ni->file.ads.len, run, data_size + bytes,
 				    NULL, false);
+		if (err)
+			goto out;
 
 		le_b = NULL;
 		attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA,
 				      ni->file.ads.name, ni->file.ads.len, NULL,
 				      &mi_b);
-		if (!attr_b) {
+		if (!attr_b || attr_b->non_res) {
 			err = -EINVAL;
 			goto bad_inode;
 		}
 
-		if (err)
-			goto out;
-
-		if (!attr_b->non_res) {
-			/* Still resident. */
-			char *data = Add2Ptr(attr_b,
-					     le16_to_cpu(attr_b->res.data_off));
-
-			memmove(data + bytes, data, bytes);
-			memset(data, 0, bytes);
-			goto done;
-		}
-
-		/* Resident file becomes nonresident. */
-		data_size = le64_to_cpu(attr_b->nres.data_size);
-		alloc_size = le64_to_cpu(attr_b->nres.alloc_size);
+		data = resident_data(attr_b);
+		memmove(data + vbo + bytes, data + vbo, data_size - vbo);
+		memset(data + vbo, 0, bytes);
+		if (vbo <= ni->i_valid)
+			ni->i_valid += bytes;
+		goto out;
 	}
 
 	/*
@@ -2716,7 +2718,6 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
 		attr_b->nres.valid_size = cpu_to_le64(ni->i_valid);
 	mi_b->dirty = true;
 
-done:
 	i_size_write(&ni->vfs_inode, ni->vfs_inode.i_size + bytes);
 	ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
 	mark_inode_dirty(&ni->vfs_inode);
@@ -2807,6 +2808,11 @@ int attr_force_nonresident(struct ntfs_inode *ni)
 				    le32_to_cpu(attr->res.data_size),
 				    &ni->file.run, &attr, NULL);
 	up_write(&ni->file.run_lock);
+	if (!err) {
+		inode_set_bytes(&ni->vfs_inode, attr_ondisk_size(attr));
+		ni->ni_flags |= NI_FLAG_UPDATE_PARENT;
+		mark_inode_dirty(&ni->vfs_inode);
+	}
 
 	return err;
 }
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 2abf334bfa0c..e11b17f14087 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -617,6 +617,23 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
 		ni_lock(ni);
 		err = attr_insert_range(ni, vbo, len);
 		ni_unlock(ni);
+		if (err == E_NTFS_NONRESIDENT) {
+			ni_lock(ni);
+			err = attr_force_nonresident(ni);
+			ni_unlock(ni);
+			if (err)
+				goto out;
+
+			err = filemap_write_and_wait_range(mapping, vbo_down,
+							   LLONG_MAX);
+			if (err)
+				goto out;
+			truncate_pagecache(inode, vbo_down);
+
+			ni_lock(ni);
+			err = attr_insert_range(ni, vbo, len);
+			ni_unlock(ni);
+		}
 		if (err)
 			goto out;
 	} else {

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
change-id: 20260830-ntfs3-submission-v1-922a1af22503

Best regards,
--  
Alon Shakevsky <shakevsky@berkeley.edu>


