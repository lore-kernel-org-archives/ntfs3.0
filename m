Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670405;
	b=Ki/CHEugKtBc1MkcdFS/JwgvyF5fevy9tuYZr0bdZvVlT84mo5rBAuSVyZvHMG9Ac5rX
	 d5WUKbeus+zP2gpDdUXfSxLnwsluqW+frFHMEMdY58eICcO/NapgT2mFmvZu+QhMCx1l2
	 cxzgXcQLY3P3HBUuzILqE9ozxNJPl1x+aM+6vzpM+cYpxM2ZF9AZIFUJGKqxkgODZ7o63
	 CMjPBSNPoxY45hefzVluAvRHWWlwISUiU4Bz1kjHGLQj8ZYE2tMRYY/dj6nRtW56TsYrh
	 2xZVporzhX20bb3GspwC8crC593D6hmB1HJg+MzJjZutx2pQY1jgkCyO3hC+XUqIYTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670405;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4q3kUu9JIedyxJ4iVH9PzI9Cl+q0QeVcndIO9QpwHY0=;
	b=d/IJGhKS4RwTeQ6Cximbj/V/q7QMAu6ifBFM9pNSWP/23wiLirFTSiTRStNYGzLEk8Kc
	 4iCtEg8UjMP8duIVJfZiPrSroWI7VDD0BHfEFT/0SVr3DDpMLuSxrzU5yeR0RLN1JMm4W
	 IMQLsHhrMAOX3zjDDuIxrmRoACbJlPCJEPWR6AMT2AaPpsBXKKZz20VE6m1po+vcQb1Qr
	 d9zT5brf9DyGw5Ni/hNZBj+Lo70Xp6s4sc6JfIKsrfE+5VcNodylHZhj4Jp70iPpKY8b6
	 jwZQ0uyaiMPcYUYxjgvZZK4s8fDi4Ofar8frv7Oh0xIIGJUiuI4sUMhE7bG1XldpLFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MwwbkSDC;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945AE606A32E
	for <ntfs3@lists.linux.dev>; Sat, 14 Nov 2026 15:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945AE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=MwwbkSDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=MwwbkSDCAmjx4a1mauM2h6gz7ykse4J/DZ7Cjkv4Kcdj1bYuPoEJxkAWJOMBe9N/qeI5ABQyG6COZ
	 tSG+WeKc8XDEs++GpbWOp6JaN/AY3GIzH0Yd9VytVSVZsSmiYiU1cbIrg2gxhoslK0XJjVMMWditJT
	 hfk79h/6zP+Tt3sM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af87f34665-be0f7;
	Sat, 14 Nov 2026 23:33:21 +0800 (CST)
X-RM-TRANSID:2ee36af87f34665-be0f7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af87f3e6db-48513;
	Sat, 14 Nov 2026 23:33:21 +0800 (CST)
X-RM-TRANSID:2ee96af87f3e6db-48513
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: avoid freeing the primary MFT record during attribute list removal
Date: Sat, 14 Nov 2026 23:33:19 +0800
Message-ID: <20261114153319.658-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ni_try_remove_attr_list() keeps a backup copy of the primary MFT record
and, when moving an attribute out of a subrecord fails, restores it with
swap(mrec, ni->mi.mrec) and frees the buffer that ni->mi.mrec used to
point to.

ntfs_readdir() now drops ni_lock before walking the root index header
(commit 7a5aa6c45072), assuming that the header lives in the main record
whose lifetime is bound to the inode.  Background writeback does not
take i_rwsem: ni_write_inode() only needs ni_trylock(), which succeeds as
soon as ntfs_readdir() has released the lock.  If the attribute list is
dirty, writeback calls ni_try_remove_attr_list(), and the error path
above frees the record that the unlocked reader is walking:

  BUG: KASAN: slab-use-after-free in ntfs_read_hdr
  Read of size 2 at ...
  Freed by task ...:
   kfree
   ni_try_remove_attr_list
   ni_write_inode
   write_inode

Restore the primary record contents in place with memcpy() so that the
allocation stays alive for concurrent readers, and free only the backup
copy.

Reported-by: syzbot+7f14bc1da1f4da6518e5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7f14bc1da1f4da6518e5
Fixes: 7a5aa6c45072 ("ntfs3: release ni_lock before dir_emit in ntfs_readdir to fix deadlocks")
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
 fs/ntfs3/frecord.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 16ac847de..50c5d301b 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -755,8 +755,13 @@ static int ni_try_remove_attr_list(struct ntfs_inode *ni)
 	kfree(mrec);
 	return 0;
 out:
-	/* Restore primary record. */
-	swap(mrec, ni->mi.mrec);
+	/*
+	 * Restore the primary record contents in place.  ntfs_readdir() walks
+	 * the root index header after releasing ni_lock (see commit 7a5aa6c45072),
+	 * so a concurrent reader may still hold pointers into this buffer; swapping
+	 * it out and freeing it would leave that reader with freed memory.
+	 */
+	memcpy(ni->mi.mrec, mrec, sbi->record_size);
 	kfree(mrec);
 	return 0;
 }


