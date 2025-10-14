Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AEB3002C9
	for <ntfs3@lists.linux.dev>; Tue, 14 Oct 2025 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452792; cv=none; b=uuolMKPgJ16/PkvnzQNp0vYMX2rFCz/zE0HFETCN1UgPgSEOZ9yMt0FOhHLM0Ab9P1sCDn2HBkqs5JS1/12QWcimf3zFAKli9gxD0oH5MOaf+S6Dh2zIhRlxW2z2JGAum/jVpCLZT/SfmNiQQW4BoEZEc0kUqzedhWCn0wPloa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452792; c=relaxed/simple;
	bh=WIOkiYGxwBcs1eU4tW/avXuwBnMd3CcrRYCF0ppl228=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R0bsfmDhv5sRyLKl44jqHGsJuGyBOMuQPAF4D2xUsa0D6VF7uKyH9HRuAgvyshjmXFXsMOMm5nmrKxzbM2Ev9ifkRU5dRSYdcLcRQDCXHxbFkB0Nha4Sqx00f71alkIME3lw6m0Ms/ZAZfyxeHrJz+OuiWC4FfuGDwkEw2mv0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AinPMoMa; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AinPMoMa"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so5866059a91.0
        for <ntfs3@lists.linux.dev>; Tue, 14 Oct 2025 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760452790; x=1761057590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPkNQt7GNnutvvFwrtniwfY3OpeKDI+MEgUBsglPSrQ=;
        b=AinPMoMaWjijn6xMXwadAYaqL3JtSeRZ/saR/N7M49A94dQe3fszuXDQQuR9wvB6p6
         n1ooWegAxpLhELi4XU0Zr9E1C0OZsl85/vJpCI7ixtkO1/3+3UzGB+nWS+5cCtZ1dVFf
         ii/CJLTDVrv78DFJqPJHwHTYOaUoor+fwHQU58xLwxW9hZgpWopcl69L66sRtxZwwWHf
         slB8mjcfdgBCubFzZAslH8pOvNjqOH3HLUAgGxvTbz7JrXRKHC8bhxlYQ/RIcgVgkovy
         ZkT6IbsrGRnQSt0M3T8rwbCgQAGTS2bcvNWC2ZZp7GTDVCXewjrDxszS2rPFQU3nTQsm
         Wb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760452790; x=1761057590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPkNQt7GNnutvvFwrtniwfY3OpeKDI+MEgUBsglPSrQ=;
        b=Rj54MK8/2wisxPBDLm8UzQYfZ9skW2SoKwjbtiO1qgc13Z9cLNthTEh4Ce93qznOTL
         1KfaRAgYyG8wWksOL2KyQlBcJDOFJhHbql1QMjGfEaCOYBMA79ttmjI6R3fgWNM0c7O/
         DqjmZVTdVJr3V4dxNzrjcUKrIMGVcljAxcYNe9d9UPUFGPNVfdqCnloWhtDMIg7VKK20
         VJXkIbfd9zFZtp+mEx5T3rw38XUcFtokXLGG494pguT1XZ36qkbTHeZ8/4wWyjYevcgE
         iDdaonCNHncfB3ARyOQdm3nFCyBcqZEkBAcojUVvX0rYV6OI0tJ1eGY/nEvF5JdLIdf8
         9poA==
X-Forwarded-Encrypted: i=1; AJvYcCUgl+N/sd5Xzm9AKpNVa9MHVGo5GiEXwDrSWbUuCp8RtHfYVj1G3UYv8lPTRTThzSIuaqs6fA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFg8PSyK/P8cOJpz/3Tv+HybEMhNRW2/5B5NvR/twlu4G5LaGg
	c7X2en2C72pxS+nquZBELh3MeFawyh/0R7Zn0EGD/2oxVW+z2cji1Vk9
X-Gm-Gg: ASbGncvc0MO76Nw6Yy4JJmItEmLY00D/gqBCAgG3w2RXhJzXCyhrQTePnpBS1Q9dAwc
	+y/pTosSZRz5uUK1K2sDaCJdY+EiJW/Yb3fKmG0NSFF8B6lLSuoJBM6wXz+BPlpTYESCEwH49PC
	KdLkRoTRe4cq4Qe/b5h6Sdmd5gQBK1Gqh1AmQXTANlk0Sx39mCcz/Kv4BdorTGYNlv9BzeV5V07
	jc8W5lzQnpHWSk9cvrYtFDffgsh+HP/fOtpdFftIR+fvK4eYZYEWU3HXUqVfj22QjjJUSg2GUEY
	SajbIMAUN4eNJ2TQGd11YjCtOrBNNsmdk/S5hDT/xgGlbjJUeoSiMYwmhzelhWFD9iEpBm9Voul
	90UNHwkWEye4X9eWXXgoU01QwL0mIJ7bHT0aSmm3xwHoyzJ4nVjcFLupnWRyAP2zLbzrUNv0rbW
	L71FHZoHwi4SChmSW8/L7oCwNFyXbLWKFi
X-Google-Smtp-Source: AGHT+IFL7TRKOFtqiIwJDvYHBSN+yEIpm11+iedBhhUvsR1btr/qYb0D18VFXNkYpeXXESEmDsmcbA==
X-Received: by 2002:a17:90b:1651:b0:338:3156:fc43 with SMTP id 98e67ed59e1d1-33b51168e39mr40215981a91.11.1760452789966;
        Tue, 14 Oct 2025 07:39:49 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:6b4f:6ef8:4d88:7543])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5288eae7sm13432681a91.0.2025.10.14.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:39:49 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: penguin-kernel@I-love.SAKURA.ne.jp,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com
Subject: [PATCH] ntfs3: prevent operations on NTFS system files
Date: Tue, 14 Oct 2025 20:09:42 +0530
Message-ID: <20251014143942.643856-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4e8011ffec79 ("ntfs3: pretend $Extend records as regular files")
set the mode for $Extend records to S_IFREG to satisfy VFS requirements.
This made system metadata files appear as regular files, allowing
operations like truncate to be attempted on them.

NTFS system files (inode numbers below MFT_REC_FREE) should not have
their size modified by userspace as this can corrupt the filesystem.
Additionally, the run_lock was not initialized for $Extend records,
causing lockdep warnings when such operations were attempted.

Fix both issues by:
1. Initializing run_lock for $Extend records to prevent crashes
2. Blocking size-change operations on all NTFS system files to prevent
   filesystem corruption

Reported-by: syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com
Tested-by: syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 4e8011ffec79 ("ntfs3: pretend $Extend records as regular files")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ntfs3/file.c  | 6 +++++-
 fs/ntfs3/inode.c | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 4c90ec2fa2ea..c5b2bddb0cee 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -792,7 +792,11 @@ int ntfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 
 	if (ia_valid & ATTR_SIZE) {
 		loff_t newsize, oldsize;
-
+		/* Prevent size changes on NTFS system files */
+		if (ni->mi.rno < MFT_REC_FREE) {
+			err = -EPERM;
+			goto out;
+		}
 		if (WARN_ON(ni->ni_flags & NI_FLAG_COMPRESSED_MASK)) {
 			/* Should never be here, see ntfs_file_open(). */
 			err = -EOPNOTSUPP;
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 3959f23c487a..180cd984339b 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -472,6 +472,7 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 		/* Records in $Extend are not a files or general directories. */
 		inode->i_op = &ntfs_file_inode_operations;
 		mode = S_IFREG;
+		init_rwsem(&ni->file.run_lock);
 	} else {
 		err = -EINVAL;
 		goto out;
-- 
2.43.0

