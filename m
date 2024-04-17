Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEF13D299
	for <ntfs3@lists.linux.dev>; Wed, 17 Apr 2024 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713359294; cv=none; b=b+X1avV6DqaL/C8kOrSDN7d9DqphqCU/LXWOyfcwj4gmB8moqhaIsPmeZmR2S+c23wJrQ9+p4Bv2nTkykzNaNNC/jBC/2zzZPpuPhDYhEGRLg4ewH7K0n0yU3sdHQ4MMflDm5oqd6sh/sAQKa2gIIPHQuOdkzKjOSPiXWdCcNus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713359294; c=relaxed/simple;
	bh=zB4pDB+1MwPVDU5eslMh2SAruBxdLfRVPm21RrqBJOk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=IMp0xG+R8XmENreHIW0TTaZZS1AAIUk1e01Nrwr85P5p9+2CzbhfnDLbQn1Nutp5fCeezhn3Z0TTQbIN7tGIxKp91srfiIOLjy5an4ZhQ6cnIxoEF8gTCtPPspJkmRyIOQfaLuUdzFf3J6DWYo/mXYyEoTKz2GyzGO2jibYTzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=ZSxgI9cI; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="ZSxgI9cI"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5F0522126;
	Wed, 17 Apr 2024 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1713358839;
	bh=faaEBEoPf/qjweIscSis0xJmfoKEHMCDLYFkHEvEXk4=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=ZSxgI9cIaMLzufguDdMhDaTI3J8+HnDoz4+5IjcR3oUp9M5HhLKFny1SPVrrgY70A
	 oSVN3Y35fsiaKKwq0I5inOGCPBuwWF8M5dpypn05UDn0Kyz006FzeeaV9ONqdU2jdp
	 AMEJOf/gkEJEBdF+DsuvEGpGetrLxfKsuXZj8gm8=
Received: from [192.168.211.39] (192.168.211.39) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 17 Apr 2024 16:08:08 +0300
Message-ID: <de201466-f50e-4a99-a483-9374661e480d@paragon-software.com>
Date: Wed, 17 Apr 2024 16:08:07 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/11] fs/ntfs3: Always make file nonresident if fallocate
 (xfstest 438)
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>
References: <6c99c1bd-448d-4301-8404-50df34e8df8e@paragon-software.com>
Content-Language: en-US
In-Reply-To: <6c99c1bd-448d-4301-8404-50df34e8df8e@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/attrib.c  | 32 ++++++++++++++++++++++++++++++++
  fs/ntfs3/file.c    |  9 +++++++++
  fs/ntfs3/ntfs_fs.h |  1 +
  3 files changed, 42 insertions(+)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 7aadf5010999..aedae36b91d0 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -2558,3 +2558,35 @@ int attr_insert_range(struct ntfs_inode *ni, u64 
vbo, u64 bytes)

      goto out;
  }
+
+/*
+ * attr_force_nonresident
+ *
+ * Convert default data attribute into non resident form.
+ */
+int attr_force_nonresident(struct ntfs_inode *ni)
+{
+    int err;
+    struct ATTRIB *attr;
+    struct ATTR_LIST_ENTRY *le = NULL;
+    struct mft_inode *mi;
+
+    attr = ni_find_attr(ni, NULL, &le, ATTR_DATA, NULL, 0, NULL, &mi);
+    if (!attr) {
+        ntfs_bad_inode(&ni->vfs_inode, "no data attribute");
+        return -ENOENT;
+    }
+
+    if (attr->non_res) {
+        /* Already non resident. */
+        return 0;
+    }
+
+    down_write(&ni->file.run_lock);
+    err = attr_make_nonresident(ni, attr, le, mi,
+                    le32_to_cpu(attr->res.data_size),
+                    &ni->file.run, &attr, NULL);
+    up_write(&ni->file.run_lock);
+
+    return err;
+}
\ No newline at end of file
diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 5418662c80d8..fce8ea098d60 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -578,6 +578,15 @@ static long ntfs_fallocate(struct file *file, int 
mode, loff_t vbo, loff_t len)
          /* Check new size. */
          u8 cluster_bits = sbi->cluster_bits;

+        /* Be sure file is non resident. */
+        if (is_resident(ni)) {
+            ni_lock(ni);
+            err = attr_force_nonresident(ni);
+            ni_unlock(ni);
+            if (err)
+                goto out;
+        }
+
          /* generic/213: expected -ENOSPC instead of -EFBIG. */
          if (!is_supported_holes) {
              loff_t to_alloc = new_size - inode_get_bytes(inode);
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 3db6a61f61dc..00dec0ec5648 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -452,6 +452,7 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST 
frame, size_t compr_size,
  int attr_collapse_range(struct ntfs_inode *ni, u64 vbo, u64 bytes);
  int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes);
  int attr_punch_hole(struct ntfs_inode *ni, u64 vbo, u64 bytes, u32 
*frame_size);
+int attr_force_nonresident(struct ntfs_inode *ni);

  /* Functions from attrlist.c */
  void al_destroy(struct ntfs_inode *ni);
-- 
2.34.1

