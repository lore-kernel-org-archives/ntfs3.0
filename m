Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694C2DB7B8
	for <ntfs3@lists.linux.dev>; Thu, 27 Aug 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823845; cv=none; b=eYb/0rS/8rdqpcqyiEl8S0bGBVdggV1b1BFtqTO2kodFcp7lMgwY08ncyGqT4+WW+/2HFJ3TZRFAbkytwTJ2+lACPBMmuJ1bmCejFoO1BlgjUNI5JrqTQdacOiBr7X5MxRMHpAK/b78460jlZD1kFDFkWnEpH0Ot5lSLf9wW40c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823845; c=relaxed/simple;
	bh=+/S5JdccxRXxb1Tws1/ESquT7DfOnvAO0+7CCZj3fjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYjmxYig4tmZybrugyBxwxKouVjJgR0VxBp9vD6P4ydfLZdJKH1ltFhQIC+MxuCu03/R8GTpcay0Xl80+067EWxIVSYEEGBuI7gnr0g8+TXvOXzYYhc7V/KuKC4H0W9F6VpJTGs2ehZFAzzZz2MNDoL92saewn5LTC+tW9mNwnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ufQ17rKx; arc=none smtp.client-ip=202.108.3.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ufQ17rKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787823841;
	bh=SxUaRcD6PsFyAO3d5Jd9la0pXzi8eGzLdE8LTLuL1/A=;
	h=From:Subject:Date:Message-ID;
	b=ufQ17rKx67JZS1sUfqLZrQ8mLGZvPO43jD6Tqb50Qf6UviltyRdgHvTErY9uEBjWx
	 j6deEqHK3T37DDWw9yIFV+GVCaIFV//93uUAHMih2vngnEpxrt0porzF7Jh5V7SJtI
	 uyfEPOCrDrSWdh2sRgkFJZWAybdj1yLkxvNhonjs=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6A9006CE00005EF7; Thu, 27 Aug 2026 17:43:47 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8287396815987
X-SMAIL-UIID: 709DCF60E8174745ABCBBA26089F6AF7-20260827-174347-1
From: Edward Adam Davis <eadavis@sina.com>
To: eadavis@sina.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] fs/ntfs3: Refine the ni cleanup
Date: Thu, 27 Aug 2026 17:43:40 +0800
Message-ID: <20260827094340.174628-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827081556.168390-1-eadavis@sina.com>
References: <20260827081556.168390-1-eadavis@sina.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failure to create a new inode triggered an issue [1] during inode
reclamation because ni->base had not been initialized.

Initialize ni->base earlier to ensure it can be reclaimed correctly.

[1]
KASAN: null-ptr-deref in range [0x0000000000000210-0x0000000000000217]
RIP: 0010:run_close fs/ntfs3/ntfs_fs.h:1034 [inline]
Call Trace:
 ni_clear+0x5d/0x630 fs/ntfs3/frecord.c:110
 evict+0x624/0xb50 fs/inode.c:822
 ntfs_new_inode+0x8c/0x120 fs/ntfs3/fsntfs.c:1719
 ntfs_create_inode+0x6e7/0x3420 fs/ntfs3/inode.c:1520
 ntfs_mkdir+0x37/0x50 fs/ntfs3/namei.c:234

Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
Reported-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
Tested-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: unify email addresses

 fs/ntfs3/fsntfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 97c04ab2763a..e439ba59d999 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1700,6 +1700,7 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
 		return ERR_PTR(-ENOMEM);
 
 	ni = ntfs_i(inode);
+	ni->base = ni;
 
 	err = mi_format_new(&ni->mi, sbi, rno, flag, false);
 	if (err)
@@ -1711,8 +1712,6 @@ struct ntfs_inode *ntfs_new_inode(struct ntfs_sb_info *sbi, CLST rno,
 		goto out;
 	}
 
-	ni->base = ni;
-
 out:
 	if (err) {
 		make_bad_inode(inode);
-- 
2.43.0

