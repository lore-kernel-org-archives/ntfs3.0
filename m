Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F27F4
	for <ntfs3@lists.linux.dev>; Mon, 20 Feb 2023 06:32:29 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id DE1851D3F;
	Mon, 20 Feb 2023 06:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1676874488;
	bh=YtXxZ6e5RLyaBmSaXafOMars1uaos3f4mgep2CPSeUg=;
	h=Date:To:CC:From:Subject;
	b=u7g0ARmwjwMj+BrUnDHQHYScdnAKxkHcDoIuM8/l0sq0TGUvtf55cvGSbGxGxkfUl
	 lLN9gyOdwkhB8es6fmxcw+FuoZX1M78QQ3kxLzbl9giqeaXM1ETMq1ZuPSH04UXHJT
	 IkXjgJ8BFbxJDL9dadnp/eADPac2HQMQ64+ZkyUk=
Received: from [192.168.211.142] (192.168.211.142) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 20 Feb 2023 09:32:20 +0300
Message-ID: <5de3e85e-3c8e-cc80-c825-481ac9f94f9a@paragon-software.com>
Date: Mon, 20 Feb 2023 10:32:20 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: <ntfs3@lists.linux.dev>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, Dan Carpenter <error27@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: [PATCH] fs/ntfs3: Fix root inode checking
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.211.142]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

Separate checking inode->i_op and inode itself.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202302162319.bDJOuyfy-lkp@intel.com/
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/super.c | 11 ++++++++++-
  1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index e0f78b306f15..5158dd31fd97 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1347,12 +1347,21 @@ static int ntfs_fill_super(struct super_block 
*sb, struct fs_context *fc)
      ref.low = cpu_to_le32(MFT_REC_ROOT);
      ref.seq = cpu_to_le16(MFT_REC_ROOT);
      inode = ntfs_iget5(sb, &ref, &NAME_ROOT);
-    if (IS_ERR(inode) || !inode->i_op) {
+    if (IS_ERR(inode)) {
          err = PTR_ERR(inode);
          ntfs_err(sb, "Failed to load root (%d).", err);
          goto out;
      }

+    /*
+     * Final check. Looks like this case should never occurs.
+     */
+    if (!inode->i_op) {
+        err = -EINVAL;
+        ntfs_err(sb, "Failed to load root (%d).", err);
+        goto put_inode_out;
+    }
+
      sb->s_root = d_make_root(inode);
      if (!sb->s_root) {
          err = -ENOMEM;
-- 
2.34.1

