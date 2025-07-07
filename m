Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75891E51EF
	for <ntfs3@lists.linux.dev>; Mon,  7 Jul 2025 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892472; cv=none; b=QTGP30Y8luNvCBF1MYTK5m2a2/cyEbuyf+nQ188akGzgTlWQq2aes8Q4DUSueozhkcQeN2CjnhgfADqskoqeESWluGmMhsLBhgjjg+IVDhyrIzUabPcmBh8LPVvBd1frYPFjGl6EafUQG9YwvkxG+C9ATZ7qYpNzqsOpKWTIBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892472; c=relaxed/simple;
	bh=kz6g0RZrjv0pS76XcYVs4XWiln5FXU1dNiOYnrZOlWI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l7W5ouf/9W1ew/D2+6oZ9aphjBY1C8qCfQBz3R09r/QGsn0PtTD/GYY13/aCEJ6TKjHxpxjrnjS1ufa7larvckiePJmw2Z6HXEoC9f5Z6eo4egUXAQErrW29f8x8jqqrHSZdTs8VVxVHZbK2vuahdQiFQHh7pnvV5j/u/A8/H2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=KIwHVVF7; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="KIwHVVF7"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 6094C2F4;
	Mon,  7 Jul 2025 12:46:44 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=KIwHVVF7;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id CB98E1FDF;
	Mon,  7 Jul 2025 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1751892468;
	bh=4ORtnEo8Lo5/TecHN3+QL+myt9NI3UgcjwgBg3qFVm0=;
	h=From:To:CC:Subject:Date;
	b=KIwHVVF7Yk2JiCCLxBvLIn3Y0FxiJRpSZTEvjUQazfMGwFPcN7nAKjtbFqzqjEjtn
	 osEfC0xkMKCfLt1apfo4OGv94XsWeS09ZngfIv7UGXVMYz6LY6SLhPkeUCEP7gohuQ
	 LnHQ3MrYfArbSGQuqkPiHEvdqZ/n64d7Vk7h00aY=
Received: from localhost.localdomain (172.30.20.165) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 7 Jul 2025 15:47:47 +0300
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
To: <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	<syzbot+a5d1c9dfa91705cd2f6d@syzkaller.appspotmail.com>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>
Subject: [PATCH] Revert "fs/ntfs3: Replace inode_trylock with inode_lock"
Date: Mon, 7 Jul 2025 14:47:38 +0200
Message-ID: <20250707124738.6764-1-almaz.alexandrovich@paragon-software.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

This reverts commit 69505fe98f198ee813898cbcaf6770949636430b.

Make lock acquiring conditional to avoid the deadlock.

Fixes: 69505fe98f19 ("fs/ntfs3: Replace inode_trylock with inode_lock")
Reported-by: syzbot+a5d1c9dfa91705cd2f6d@syzkaller.appspotmail.com
Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
---
 fs/ntfs3/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 65fb27d1e17c..2e321b84a1ed 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -322,7 +322,10 @@ static int ntfs_file_mmap(struct file *file, struct vm_area_struct *vma)
 		}
 
 		if (ni->i_valid < to) {
-			inode_lock(inode);
+			if (!inode_trylock(inode)) {
+				err = -EAGAIN;
+				goto out;
+			}
 			err = ntfs_extend_initialized_size(file, ni,
 							   ni->i_valid, to);
 			inode_unlock(inode);
-- 
2.43.0

