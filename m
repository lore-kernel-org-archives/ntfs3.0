Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F2F221DAD
	for <ntfs3@lists.linux.dev>; Tue, 16 Sep 2025 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758002144; cv=none; b=dhl+nWiEOdLUXe1zj4nrUEC0mMnmWsUT8+E9sVZmdnbZqxPnJDM4zYDAm7tzDR0NlLb3+dxyAEsUS1bFW3GdI/c99xdZrn2pKM1oynsYWbtMhOKOAa/Fg/6KSzYbpuSiIvTzufEOy8WJlKx+to848fsmQP1ky8N+RCRmFxPilKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758002144; c=relaxed/simple;
	bh=xYqCJllinRn0MLo7pZOcu4gqkGCWlrIG1TzY5lNJ2LQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=VA6lcVsMdC0l8lpopVrUmSDT5yQf0tHh7Qpcjtre3Jw966T1VNOQcaF58M6wfOeRssFiAdDRpuzKXDNf59Dk7En+b0EVrLpp9XSZG4YF12yZqJxmMkEuEJPew7+pJ9eYqe78AWPyfx1kDCgNO0r3n5JiSDpiuFCMK/oQkP8AbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=FGmj7Dwi; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="FGmj7Dwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1758001816; bh=T3AhLaJ8qJBfl7C5sirtq6x0AwabGpDncnErYrWhRdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FGmj7DwiSdo2r+bxLgopTsK6nYjMJ1WS3LwtKcgL0PT6v+hqcNdpbht7S9Iqre6ym
	 3NCrucksmYtheCGC117SyB71NvHXRE8itTbrql83PEqXjC50RFQb2amt11kJEHmdr5
	 Uvb+KhoFvIHyT+2D+Tkaiaf90jbRL4lgc1t7Whhk=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.230.220])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C8D8F894; Tue, 16 Sep 2025 13:50:13 +0800
X-QQ-mid: xmsmtpt1758001813trr6cbrx7
Message-ID: <tencent_F24B651BC22523BA92BB5A337D9E2A1B5F08@qq.com>
X-QQ-XMAILINFO: MBjwNRQMz5zUBVcZIEPTfGYHvvjGV39sWvIvVtX9mdH+xuNa2KFvWAGegYlo+B
	 uCNLLhcJLt2ZLxW27Zl6vOBgjw9lwL/H2UOIYPquOohvtVG9C00bkxE/9YQmckocarmdi9AW/C6U
	 7U3we8AZrUhTN27k7TvUruw7Y+GJRL6bfOGARTP4lqBIBr4CnbKVV2OVnbjYUlJOEDv0oWhTQ8b9
	 j6BJFgf4w9gSxTSAEMk72Tgv5h3zAd3fjTMnlXilSwxA/le6zsxQXf+69opINcBbM9HDICt9KaQx
	 FJtIOIaBb2h+8uXxzt6z/WYwhBTK7xUcl2VhXeULBIBNnmCDzTscpiuw0Qj6B4YfSPfq2BqK73kJ
	 ztHZW4Tv3iBNKjLloxMo2zjJ/0Tct+j4lcAiTbaognaIp8OAkHm+yZ+a0PHGfZgr613NcyR8uEzt
	 6RHan2LCo41brcI2CkcLEE5REUPMw0sh9JgXeZ1WydIQ54NXRQPUOAWQe8AtRWU40GF07qFyQbVA
	 S99c3J38sHnpTNYeK/Yn+3jdVLK3ruBZbeGt4jgojIcdgDmNkgYnp88CwPfMYSXkieV3bqUT6Xn+
	 FwrSkxCB21pvhXDrXLJlW0C8OZBtqaIRtNWJHzRMfKlq7DMpqUDce665sJwbcMpjPBW3lWsoxU9N
	 4KGiMVKZx8KRwWDpYUxILNGsvRuFiHBdipWJ8SPbDZ9P5JOVfajQ3pKO+foCy7fqOvXOpDACJdfn
	 U8ZSh34jL1cBFdVhQV7Qu78ftvR9DJ21WsmURF3EGda7zNhht5uJJ/Y82sEHcy9wCopeJrRJycQZ
	 3v6irdn7Mwd645bHyCrUV984K4+067tQv0QiyGhSlZeIqDBTe+Ud68o90bQz7jlgWraDajHXwOmq
	 uRw6VCtXcTzC0Gc97vVZ3VOJXVWdTLZ3RvvD9bxUY9nowNlZqYAszyFLeo8x/sRN3lKaWUQT2HJT
	 gDQIyzkFX9aQtOUhLJ78Uvu0YSNRFlKJHAWrtTJJrDbs/5kMJ0GSYT6z5PZI/7
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+bdeb22a4b9a09ab9aa45@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	penguin-kernel@I-love.SAKURA.ne.jp,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH Next] ntfs3: init run lock for extend inode
Date: Tue, 16 Sep 2025 13:50:13 +0800
X-OQ-MSGID: <20250916055012.3289167-2-eadavis@qq.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <68c8583d.050a0220.2ff435.03a1.GAE@google.com>
References: <68c8583d.050a0220.2ff435.03a1.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After setting the inode mode of $Extend to a regular file, executing the
truncate system call will enter the do_truncate() routine, causing the
run_lock uninitialized error reported by syzbot.

Prior to patch 4e8011ffec79, if the inode mode of $Extend was not set to
a regular file, the do_truncate() routine would not be entered.

Add the run_lock initialization when loading $Extend.

syzbot reported:
INFO: trying to register non-static key.
Call Trace:
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0x105/0x320 kernel/locking/lockdep.c:1299
 __lock_acquire+0x99/0xd20 kernel/locking/lockdep.c:5112
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 down_write+0x96/0x1f0 kernel/locking/rwsem.c:1590
 ntfs_set_size+0x140/0x200 fs/ntfs3/inode.c:860
 ntfs_extend+0x1d9/0x970 fs/ntfs3/file.c:387
 ntfs_setattr+0x2e8/0xbe0 fs/ntfs3/file.c:808

Fixes: 4e8011ffec79 ("ntfs3: pretend $Extend records as regular files")
Reported-by: syzbot+bdeb22a4b9a09ab9aa45@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bdeb22a4b9a09ab9aa45
Tested-by: syzbot+bdeb22a4b9a09ab9aa45@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/inode.c | 1 +
 1 file changed, 1 insertion(+)

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


