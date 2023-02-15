Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090FB53AF
	for <ntfs3@lists.linux.dev>; Wed, 15 Feb 2023 13:38:05 +0000 (UTC)
Received: from relayfre-01.paragon-software.com (unknown [172.30.72.12])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 9B29A2147;
	Wed, 15 Feb 2023 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1676468033;
	bh=qABqCzWeJMd8lL3Bs/m2a0hwQR1+Gsb68tcyxZYiqqY=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=NeHGIHvjmMRxaOW43o4icEh3F5LwXYbTVz8PkfLcNfmyDFe/Bt2my8KiOd43MekOu
	 4OF8h0WyBmidpMbwVaE0+F4Pk5fsrOXF2fI2mBi4sl4KGL7OEqRieh2rbJfABGn1Om
	 UncOn4kcq2w/WhJyaPGf8/4FlXtE2tfnQAaYV3Ew=
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E9C2F1E70;
	Wed, 15 Feb 2023 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1676468283;
	bh=qABqCzWeJMd8lL3Bs/m2a0hwQR1+Gsb68tcyxZYiqqY=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=Nv7Dc7iPcqNQs8qB6kUQLqyB02zMfSvYFdF2EnIBuC4dF5t8n2xOm+bLgE2pqys6F
	 +Ktcj9H4TrhZTM9nUzEO4HIvcviPQgPNFIJJaABZShaXbhoThXy7GCwYP6gqQuV96O
	 8YI1lf+OhKYodotlKDPFCeuahN5qrhkFl8VIYIzk=
Received: from [192.168.211.36] (192.168.211.36) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Feb 2023 16:38:03 +0300
Message-ID: <9e0dd9a4-afa8-1137-7f8b-ccec26825aa1@paragon-software.com>
Date: Wed, 15 Feb 2023 17:38:02 +0400
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH 07/11] fs/ntfs3: Remove field sbi->used.bitmap.set_tail
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

This field is not used in driver.

Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
  fs/ntfs3/ntfs_fs.h | 1 -
  fs/ntfs3/super.c   | 2 --
  2 files changed, 3 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 73a639716b45..26957dbfe471 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -163,7 +163,6 @@ struct wnd_bitmap {
      size_t zone_bit;
      size_t zone_end;

-    bool set_tail; // Not necessary in driver.
      bool inited;
  };

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 10c019ef7da3..d7bec9b28a42 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1117,8 +1117,6 @@ static int ntfs_fill_super(struct super_block *sb, 
struct fs_context *fc)
          goto put_inode_out;
      }

-    /* Not necessary. */
-    sbi->used.bitmap.set_tail = true;
      err = wnd_init(&sbi->used.bitmap, sb, tt);
      if (err)
          goto put_inode_out;
-- 
2.34.1

