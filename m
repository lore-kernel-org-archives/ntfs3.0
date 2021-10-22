Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E4A2C8B
	for <ntfs3@lists.linux.dev>; Fri, 22 Oct 2021 15:54:41 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 967B9120;
	Fri, 22 Oct 2021 18:54:32 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1634918072;
	bh=KjXp0HECCDmxLZTX1hu71cOXhB6Xk/q6EuXO/P1++88=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=k5rtf73AEE7Pb5/aiNeJRqvV3QG07RDbPvBIGmlZiihq5jN+S1KRh1vs7JNEsYd7z
	 kmkSSk9inUQQnM3+vXRzhR0G++q/5lY4/QISEe+pq4sxJwmknN4cpAjhOqopLz/Dq6
	 YlkoNyA0x+aMTdgvnUarGEYI1Znw0+jDtCLfem6c=
Received: from [192.168.211.69] (192.168.211.69) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 22 Oct 2021 18:54:32 +0300
Message-ID: <aaf41f35-b702-b391-1cff-de4688b3bb65@paragon-software.com>
Date: Fri, 22 Oct 2021 18:54:31 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option prealloc
 enabled
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
In-Reply-To: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.69]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

If size of file was reduced, we still kept allocated blocks.
This commit makes ntfs3 work as other fs like btrfs.
https://bugzilla.kernel.org/show_bug.cgi?id=214719
Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")

Reported-by: Ganapathi Kamath
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 43b1451bff53..3ac0482c6880 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -494,7 +494,7 @@ static int ntfs_truncate(struct inode *inode, loff_t new_size)
 
 	down_write(&ni->file.run_lock);
 	err = attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->file.run, new_size,
-			    &new_valid, true, NULL);
+			    &new_valid, ni->mi.sbi->options->prealloc, NULL);
 	up_write(&ni->file.run_lock);
 
 	if (new_valid < ni->i_valid)
-- 
2.33.0


