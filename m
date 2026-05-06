Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B91A4A2E3A;
	Wed,  6 May 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087352; cv=none; b=C8moG9YPGVjC/piqjaQbfbrNA8BSYcCY+HMdMpqIU5h96zsJ450frmzijUhOOSOWh/iiRCDGOuB5fgiJoIA1EvV3hY9gNigDDWpBlqfGLAMwG91gXb0/rpqfEE4iHUoXTcWBvakerG8vguXSJG9nO0O4j4IlYvxKSYYwquErYwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087352; c=relaxed/simple;
	bh=pfNqtF+Vx1PHthr9gYtDgqA+iiEl2gKnfDuYEM9oLpg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uoiwaBQtci8d3E7O+gzuLGktkHiPimVVrRmPwGL0NMtgBKL2W1R+obLbGBNyi0cHYvcFgQW83ykL+MOEDXkcasIQ4XM8e4PqQJEll8d9Qifv6Co9r6Ljfm6cTjYqxMX2m2o0iyL0zKONvWEOHEMqDRlYjcPKxezF0LkBjTLrSnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BsNvRZyl; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BsNvRZyl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gdNpcB+VHHZQMY35VUuBmV8gEDLDeYbE/Mgcj60aXzk=; b=BsNvRZylOpKiIV/XgGBcobFduQ
	rJ608DJiVjowhyHKf1zCV5upmYL8y5ztmrzcKiOeVNZ/DqJg4pORipbS92tEmPH1LpuVcPYlDH8m6
	j/Y2KytyXjabl3F7A0Uf2c/9zgyXZ+OyTja0dicwe5IbbteaKeOX4HjlE+QnmfPqCXyQcjm7VpL1S
	Q/3kIzgBUy1rljsWvQQePu5eaGZVGWV7X9iLXFQ+Pb48qN+7CPpNtWvEhWpeDtJI57i/jP2/YOIJQ
	6fU8uFNnJ//GJ2DoorjcmNbtk3jbVwx2cfw2F42sdnE00OckPuunutTikqghwb3ORg5YpMztFVxbW
	rsJB53VA==;
Received: from [138.117.126.15] (helo=toolbx)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wKfjw-006znj-UK; Wed, 06 May 2026 19:08:52 +0200
From: Helen Koike <koike@igalia.com>
To: almaz.alexandrovich@paragon-software.com,
	eadavis@qq.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	koike@igalia.com,
	kernel-dev@igalia.com
Subject: [PATCH] fs/ntfs3: call _ntfs_bad_inode() when failing to rename
Date: Wed,  6 May 2026 14:08:22 -0300
Message-ID: <20260506170842.532401-1-koike@igalia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is safe to call _ntfs_bad_inode on live inodes since:
  commit 519b078998ce ("fs/ntfs3: Exclude call make_bad_inode for live nodes.")

The WARN_ON was added when it wasn't safe by:
  commit d99208b91933 ("fs/ntfs3: cancle set bad inode after removing name fails")

Replace the WARN_ON with a call to _ntfs_bad_inode() to prevent further
operations on the inconsistent inode.

Reported-by: syzbot+4d8e30dbafb5c1260479@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4d8e30dbafb5c1260479
Fixes: 519b078998ce ("fs/ntfs3: Exclude call make_bad_inode for live nodes.")
Signed-off-by: Helen Koike <koike@igalia.com>
---
 fs/ntfs3/frecord.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 7b035da63c12..78eb065c7e43 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2800,8 +2800,8 @@ int ni_rename(struct ntfs_inode *dir_ni, struct ntfs_inode *new_dir_ni,
 	err = ni_add_name(new_dir_ni, ni, new_de);
 	if (!err) {
 		err = ni_remove_name(dir_ni, ni, de, &de2, &undo);
-		WARN_ON(err &&
-			ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo));
+		if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo))
+			_ntfs_bad_inode(&ni->vfs_inode);
 	}
 
 	/*
-- 
2.53.0

