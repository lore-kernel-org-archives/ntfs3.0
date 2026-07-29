Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD938657E
	for <ntfs3@lists.linux.dev>; Wed, 29 Jul 2026 06:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307787; cv=none; b=JKJRrz+CYfHvcnyV6NFCRria70XCfMz2at7FgKXxnukokkoQlNcfW9lEGWTliJsY1AcBcancENVItbnPcKsYq3P+2nASZ9qLw7Val40ANzbh4ft+VmBQj61aCmRwdI8Mvaq9anv1eDCPXv94OmP+MZWq6Gpg+FRhYkph0UnSlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307787; c=relaxed/simple;
	bh=D89/QlyBuShRoJ0uKwe1rCwd+Ewox0W2UDkxj0PMOSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q+W+XVW415hpXpq7HEqN4aSd17PL0SWoLLmb1y1lvoHIboqUkk0/2/ks2rG2SG5CcTvRmyzrjDZVxEEfB5yhzJK9TnuHZlJsHb1zFabJxM6PTJE1eUFSsXGK3BAbPNDfMByj+57elGSLCpBE5Q+vmrh9daA3xJ8mUaWZapZ1BT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cRXOE6L5; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cRXOE6L5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ua
	f8sKhaogPDNExvJ19HID1mZwmtp5l1RWbyLfg0i2o=; b=cRXOE6L5xuLpTvut3C
	AIgR2k0oELjrJNiq7a76VFdp78kLF5r/1WSz2q15ubT6R74Jyi9/jNPhz7DFA2od
	5bDW1pMfoUBmBSqU2piF25E5ycLmialAoHlJRgcNQB70NCB0PbBj80eUAOEtSXHU
	spMx5xEpQnA9B67MtCeK2og+w=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wB3vux9omlqDfrjMA--.47339S2;
	Wed, 29 Jul 2026 14:49:35 +0800 (CST)
From: dayou5941@163.com
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	liyouhong <liyouhong@kylinos.cn>
Subject: [PATCH] fs/ntfs3: fix ntfs_fnd leak when compare function is missing
Date: Wed, 29 Jul 2026 14:49:32 +0800
Message-Id: <20260729064932.1104576-1-dayou5941@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3vux9omlqDfrjMA--.47339S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4rAFWkCryxGF4xZr47urg_yoW8Gw1xpF
	WDGryvkF4xtry7uan3Ka1kCF1S9w4fKrWDtw48J3W3Aw4SyF4ktF4UKr10vF1FyayfuFy8
	WF4Yy3WY9a4UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um1v-UUUUU=
X-CM-SenderInfo: 5gd103ivzuiqqrwthudrp/xtbC3h+8a2ppon+FIQAA3s

From: liyouhong <liyouhong@kylinos.cn>

indx_insert_entry(), indx_delete_entry() and indx_update_dup() take a
finder via fnd_get() before calling get_cmp_func().  If no compare
function is available they return -EINVAL and never release the finder.

Jump to the existing out path so fnd_put() still runs.

Fixes: 3a2141b2f1c3 ("fs/ntfs3: resolve compare function in public index APIs")
Signed-off-by: liyouhong <liyouhong@kylinos.cn>
---
 fs/ntfs3/index.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 2b439ac04356..8e3cf28b5257 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -2048,7 +2048,8 @@ int indx_insert_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 	cmp = get_cmp_func(root);
 	if (unlikely(!cmp)) {
 		WARN_ON_ONCE(1);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out;
 	}
 
 	if (fnd_is_empty(fnd)) {
@@ -2406,7 +2407,8 @@ int indx_delete_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 	cmp = get_cmp_func(root);
 	if (unlikely(!cmp)) {
 		WARN_ON_ONCE(1);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out;
 	}
 
 	/* Locate the entry to remove. */
@@ -2787,7 +2789,8 @@ int indx_update_dup(struct ntfs_inode *ni, struct ntfs_sb_info *sbi,
 	cmp = get_cmp_func(root);
 	if (unlikely(!cmp)) {
 		WARN_ON_ONCE(1);
-		return -EINVAL;
+		err = -EINVAL;
+		goto out;
 	}
 
 	/* Find entry in directory. */
-- 
2.25.1

