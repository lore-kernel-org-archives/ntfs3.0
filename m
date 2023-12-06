Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD33EA88
	for <ntfs3@lists.linux.dev>; Wed,  6 Dec 2023 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="SKOa+CHd"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 346BF1E1A;
	Wed,  6 Dec 2023 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1701875194;
	bh=5WNxqIEiVf5xBesOyM4G/OuoGM3roOgonpEjUNzMoQc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=SKOa+CHdhTDrT3JdA0I4GHvBuQyY1T0VvV9P7kGKydPxnb9m3t+8rtPN4g79s6Lwt
	 nT3xoGGzTdH0XsfnMSCfZnc21q3dm8plyc7QvNSfcNOYeCRijRrabXr/Meqx8jTC9w
	 xi4LFnvnnREfe4Bd80iBXzJ2WaMh/hFMKhNHYV+w=
Received: from [172.16.192.129] (192.168.211.144) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 6 Dec 2023 18:12:58 +0300
Message-ID: <3fbcb5a7-2b6f-44ae-8355-06461e7a1447@paragon-software.com>
Date: Wed, 6 Dec 2023 18:12:58 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/16] fs/ntfs3: Add file_modified
Content-Language: en-US
From: Konstantin Komarovc <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <00fd1558-fda5-421b-be43-7de69e32cb4e@paragon-software.com>
In-Reply-To: <00fd1558-fda5-421b-be43-7de69e32cb4e@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)


Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/file.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 5691f04e6751..bb80ce2eec2f 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -632,11 +632,17 @@ static long ntfs_fallocate(struct file *file, int 
mode, loff_t vbo, loff_t len)
                          &ni->file.run, i_size, &ni->i_valid,
                          true, NULL);
              ni_unlock(ni);
+            if (err)
+                goto out;
          } else if (new_size > i_size) {
              inode->i_size = new_size;
          }
      }

+    err = file_modified(file);
+    if (err)
+        goto out;
+
  out:
      if (map_locked)
          filemap_invalidate_unlock(mapping);
@@ -1040,6 +1046,7 @@ static ssize_t ntfs_file_write_iter(struct kiocb 
*iocb, struct iov_iter *from)
      struct address_space *mapping = file->f_mapping;
      struct inode *inode = mapping->host;
      ssize_t ret;
+    int err;
      struct ntfs_inode *ni = ntfs_i(inode);

      if (is_encrypted(ni)) {
@@ -1067,6 +1074,12 @@ static ssize_t ntfs_file_write_iter(struct kiocb 
*iocb, struct iov_iter *from)
      if (ret <= 0)
          goto out;

+    err = file_modified(iocb->ki_filp);
+    if (err) {
+        ret = err;
+        goto out;
+    }
+
      if (WARN_ON(ni->ni_flags & NI_FLAG_COMPRESSED_MASK)) {
          /* Should never be here, see ntfs_file_open(). */
          ret = -EOPNOTSUPP;
-- 
2.34.1

