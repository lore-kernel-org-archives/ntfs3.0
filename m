Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC82A34
	for <ntfs3@lists.linux.dev>; Mon,  3 Jul 2023 07:27:55 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3066D1D21;
	Mon,  3 Jul 2023 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1688368962;
	bh=q5eMVDMl8OohS/5+a1OTXjwPDE7CVMtEf2hDSqPpYdc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=RjkVAo7NwjKBmWEMvIlJsB79izFMwGHGw2m5t2MLac2t2fLRc9GuLr0ri2b88NDIf
	 hH8hwrRf88DIOVYe57oacRxXKLbO4OITZPNsbEmre3dkirQEhKAP3ewdj6gXk1mvGs
	 1W4Yk/9Wnnl1BzrR4wVnCieGQvtG1qTiiZLXRwIg=
Received: from [192.168.211.138] (192.168.211.138) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 3 Jul 2023 10:27:53 +0300
Message-ID: <23596b4e-1a38-d944-3bba-de7d528c7bf6@paragon-software.com>
Date: Mon, 3 Jul 2023 11:27:52 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH 7/8] fs/ntfs3: fix deadlock in mark_as_free_ex
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


Reported-by: syzbot+e94d98936a0ed08bde43@syzkaller.appspotmail.com
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/fsntfs.c | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index edb51dc12f65..fbfe21dbb425 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2454,10 +2454,12 @@ void mark_as_free_ex(struct ntfs_sb_info *sbi, 
CLST lcn, CLST len, bool trim)
  {
      CLST end, i, zone_len, zlen;
      struct wnd_bitmap *wnd = &sbi->used.bitmap;
+    bool dirty = false;

      down_write_nested(&wnd->rw_lock, BITMAP_MUTEX_CLUSTERS);
      if (!wnd_is_used(wnd, lcn, len)) {
-        ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
+        /* mark volume as dirty out of wnd->rw_lock */
+        dirty = true;

          end = lcn + len;
          len = 0;
@@ -2511,6 +2513,8 @@ void mark_as_free_ex(struct ntfs_sb_info *sbi, 
CLST lcn, CLST len, bool trim)

  out:
      up_write(&wnd->rw_lock);
+    if (dirty)
+        ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
  }

  /*
-- 
2.34.1


