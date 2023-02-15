Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC7753AF
	for <ntfs3@lists.linux.dev>; Wed, 15 Feb 2023 13:37:25 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id D63352147;
	Wed, 15 Feb 2023 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1676467992;
	bh=s+jnBTb+FEAmnBEVyyEk7i0waZIXU0NPfdQERDIaNfE=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=ndKFZlp5o5+usKaaciH36JgPDyMsCNQzIeMorpXuUXxrHaeCrx5tuzcEccSGTQwZr
	 8N7sIMjEzZ0wshdQifn3gEbFbZRBqU+RiYSZZgTxpp5qBmEqS+GrRb/6y4p8ZUQJJr
	 el3CtPeW4mvu41Zlz/1+woYx27WOLOdtnDxaaXsE=
Received: from [192.168.211.36] (192.168.211.36) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Feb 2023 16:37:22 +0300
Message-ID: <3f4de192-d3f3-f2b3-2b05-8c1c027d1d8c@paragon-software.com>
Date: Wed, 15 Feb 2023 17:37:22 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH 06/11] fs/ntfs3: Undo critial modificatins to keep directory
 consistency
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>
References: <d7c91201-5e09-5c06-3283-7887f5a5b7f1@paragon-software.com>
In-Reply-To: <d7c91201-5e09-5c06-3283-7887f5a5b7f1@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.211.36]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Affect xfstest 320.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/index.c | 30 ++++++++++++++++++++----------
  1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 9fefeac5fe7e..5d1ec0124137 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1778,10 +1778,11 @@ indx_insert_into_buffer(struct ntfs_index *indx, 
struct ntfs_inode *ni,
      struct indx_node *n1 = fnd->nodes[level];
      struct INDEX_HDR *hdr1 = &n1->index->ihdr;
      struct INDEX_HDR *hdr2;
-    u32 to_copy, used;
+    u32 to_copy, used, used1;
      CLST new_vbn;
      __le64 t_vbn, *sub_vbn;
      u16 sp_size;
+    void *hdr1_saved = NULL;

      /* Try the most easy case. */
      e = fnd->level - 1 == level ? fnd->de[level] : NULL;
@@ -1814,6 +1815,13 @@ indx_insert_into_buffer(struct ntfs_index *indx, 
struct ntfs_inode *ni,
          return -ENOMEM;
      memcpy(up_e, sp, sp_size);

+    used1 = le32_to_cpu(hdr1->used);
+    hdr1_saved = kmemdup(hdr1, used1, GFP_NOFS);
+    if (!hdr1_saved) {
+        err = -ENOMEM;
+        goto out;
+    }
+
      if (!hdr1->flags) {
          up_e->flags |= NTFS_IE_HAS_SUBNODES;
          up_e->size = cpu_to_le16(sp_size + sizeof(u64));
@@ -1846,7 +1854,7 @@ indx_insert_into_buffer(struct ntfs_index *indx, 
struct ntfs_inode *ni,
      hdr_insert_head(hdr2, de_t, to_copy);

      /* Remove all entries (sp including) from hdr1. */
-    used = le32_to_cpu(hdr1->used) - to_copy - sp_size;
+    used = used1 - to_copy - sp_size;
      memmove(de_t, Add2Ptr(sp, sp_size), used - le32_to_cpu(hdr1->de_off));
      hdr1->used = cpu_to_le32(used);

@@ -1876,8 +1884,6 @@ indx_insert_into_buffer(struct ntfs_index *indx, 
struct ntfs_inode *ni,
      if (!level) {
          /* Insert in root. */
          err = indx_insert_into_root(indx, ni, up_e, NULL, ctx, fnd, 0);
-        if (err)
-            goto out;
      } else {
          /*
           * The target buffer's parent is another index buffer.
@@ -1885,12 +1891,20 @@ indx_insert_into_buffer(struct ntfs_index *indx, 
struct ntfs_inode *ni,
           */
          err = indx_insert_into_buffer(indx, ni, root, up_e, ctx,
                            level - 1, fnd);
-        if (err)
-            goto out;
+    }
+
+    if (err) {
+        /*
+         * Undo critical operations.
+         */
+        indx_mark_free(indx, ni, new_vbn >> indx->idx2vbn_bits);
+        memcpy(hdr1, hdr1_saved, used1);
+        indx_write(indx, ni, n1, 0);
      }

  out:
      kfree(up_e);
+    kfree(hdr1_saved);

      return err;
  }
@@ -1949,16 +1963,12 @@ int indx_insert_entry(struct ntfs_index *indx, 
struct ntfs_inode *ni,
           */
          err = indx_insert_into_root(indx, ni, new_de, fnd->root_de, ctx,
                          fnd, undo);
-        if (err)
-            goto out;
      } else {
          /*
           * Found a leaf buffer, so we'll insert the new entry into it.
           */
          err = indx_insert_into_buffer(indx, ni, root, new_de, ctx,
                            fnd->level - 1, fnd);
-        if (err)
-            goto out;
      }

  out:
-- 
2.34.1

