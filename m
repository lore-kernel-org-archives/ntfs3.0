Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F4803
	for <ntfs3@lists.linux.dev>; Mon,  3 Jul 2023 07:25:11 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 4FC781D74;
	Mon,  3 Jul 2023 07:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1688368798;
	bh=HNQF4HBbkbbtfs/+y+hwwE6jqL+QQ9MoDuKoaujlRVA=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=hOGcwcG1jbJ4se1vlTg/W5WaRKGWc44Bq9SzAw5Jb9TxByG1vGa3Mr+Iwd5Ly5i1B
	 VbZuU0TYKlIOIwqTe6c9wx+0Em4Ug+UbOJQCEOesR9KWgDJo1zr/d3WKzDBMyFI6WV
	 BSWaDR92yG1LPRDrgP2xQTjvWGpnMaU/ea6jfyk0=
Received: from [192.168.211.138] (192.168.211.138) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 3 Jul 2023 10:25:09 +0300
Message-ID: <55b51679-e500-353c-d670-74e2f7697155@paragon-software.com>
Date: Mon, 3 Jul 2023 11:25:08 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH 2/8] fs/ntfs3: Write immediately updated ntfs state
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>
References: <e41f6717-7c70-edf2-2d3a-8034840d14c5@paragon-software.com>
In-Reply-To: <e41f6717-7c70-edf2-2d3a-8034840d14c5@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.211.138]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/fsntfs.c | 13 +++----------
  1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 33afee0f5559..edb51dc12f65 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -983,18 +983,11 @@ int ntfs_set_state(struct ntfs_sb_info *sbi, enum 
NTFS_DIRTY_FLAGS dirty)
      if (err)
          return err;

-    mark_inode_dirty(&ni->vfs_inode);
+    mark_inode_dirty_sync(&ni->vfs_inode);
      /* verify(!ntfs_update_mftmirr()); */

-    /*
-     * If we used wait=1, sync_inode_metadata waits for the io for the
-     * inode to finish. It hangs when media is removed.
-     * So wait=0 is sent down to sync_inode_metadata
-     * and filemap_fdatawrite is used for the data blocks.
-     */
-    err = sync_inode_metadata(&ni->vfs_inode, 0);
-    if (!err)
-        err = filemap_fdatawrite(ni->vfs_inode.i_mapping);
+    /* write mft record on disk. */
+    err = _ni_write_inode(&ni->vfs_inode, 1);

      return err;
  }
-- 
2.34.1


