Received: from out203-205-251-36.mail.qq.com (out203-205-251-36.mail.qq.com [203.205.251.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3782C5661
	for <ntfs3@lists.linux.dev>; Sun,  2 Jun 2024 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.251.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717322612; cv=none; b=k8jI37qW6NyKawLppSCpNUEW5jJM7qQPqAoRh3tuVnkO0jIENcaZeJ5tqpBl98oRGfmZOlHOzI5UOnbcK/46H7q3Xo5Fp6NpFkUMYG0tsBAeNlyHmFLtwjeiTuhybmOMxgodzPqHG1oLGas3sS+yKAzOIGicCzdEAV24+RUf7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717322612; c=relaxed/simple;
	bh=94oYn28sQMThSshDbznH0NXY+/CnYNyP4bnXq2olcDk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=VDhw4SAt3RjYlVtPUV0lY1xaWciPiV94AXm3D1NBe+Z+hEdAfQiTJdt/yDiH7AWAqzUV1GxbvLFpJpTWpbyXUM1waPbRoihJsHILkZuMMFr6xvXpDq0xrFCq1vX3vG+G7Nk126qc71/ZjZx/pItQPn8+6pZDYm2z6F3De4p99d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=L6O1UC1M; arc=none smtp.client-ip=203.205.251.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="L6O1UC1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1717322591; bh=yAGaiayGKFE1lZ7KHZ0iKdH2nu2needeaNKQWb5vLMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L6O1UC1MseGj59HKt8QYQJ7njh/3UHgQ6bbW5gJecdPoid22iohtajtvOATK8tzsv
	 Qq7zz8E6YRnVLDsx+ih/IcPLFX3A8PrnURIrfI1EYXnlm2VxKWxRmE0qizlyNXnuAu
	 ai0Dx6A+7bTj4DlxMthkfOrT3KWSOU0Sfv0NTDt0=
Received: from pek-lxu-l1.wrs.com ([111.198.228.153])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id E352E24B; Sun, 02 Jun 2024 17:56:53 +0800
X-QQ-mid: xmsmtpt1717322213tn7qbsm37
Message-ID: <tencent_706EA97643BAE446F774577CA6D6536A0305@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMmapMNs4lAv6xsi5CZUvaxRTgDCnQpuxpUhHgwEi1dv+P3x72iO2i
	 LjqWnzgBB0bGwr4vQJo2P58jK7IvrUD3ZGLdzHoznl65zQyNZnR6bUGbFhnkxsyZiDVqLObZ21m5
	 Pms/pqYoXeoJZY0ub0vG6vzUX4yPZl+9i/GNAN0l7VBJb+KCZMwTOLwZojDBM8yZ8VKfQNMyNKyk
	 jLo/iOv/OahfzPX5kzLm21SH/xJEBwWu/pHOTD0f6u6NV8bUDv84hwhvMbsC+l9wbgfoiWZx5YC1
	 /l8hkbngeid7iKGV0pLxsI83ha1jN3/DlKV0XopX/PO0J/dOg5rRVRvyzcU7j/XwxMttNpfsrWVE
	 7AdEH0Vqy4qz5IqcKn/Dc9VGyxgN2ZEM/U0LPdE1eHUk+v8ylM8LRBkILwqCB3QzzwUBJZz8EHEo
	 lJM4dNz9v6FMClC0s3/1HE4VzyiDrrwjmACDwdc5OKXLj8yYnQHVmYgL1oyEV32ojzrptg+JDx/Q
	 dGug62LLL3iu9d2JPOyVeK8Q4wiXFuyEcmKeQmDK7AXvhDvAhDY0hikIKT6Yes8itxYsRR7W75QW
	 lu2qlhawXpDr+tRD8yIKyOpejqph9PsCPOB8t6XWQxmSFJnAPp/xf99F+RASZwZ3fQ+AHdWAz5T1
	 anPtmWzLh9IOBuNiO1EZJPpNR/JHZhLwK3DL5sgai3csWhQ/5AAiOalHROQRL9lGKZpsov5K6WRn
	 GSuYsQ5xo9BOOd+nn/u1yS5YyffqtuPHtzvcanq10EKAUa13l/J121mCfofqFlLa3FdnjjDBKDiI
	 QUrvJrUQSXb1BxsTB6GcuoZZPEYHLB1elYXAEXBhn0e+vbKQsxN6QNIE1Hyk3VqZ/IhJqiDhTjL1
	 vaVteTmfVMYrf/NvTGU0qnJ91LYCNTT6rAZ808YesXFil+M4ADlfz0SY96I2gdnU/oaXIKkaMh
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5d34cc6474499a5ff516@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fs/ntfs3: dealing with situations where dir_search_u may return null
Date: Sun,  2 Jun 2024 17:56:54 +0800
X-OQ-MSGID: <20240602095653.1544037-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <000000000000f386f90616fea5ef@google.com>
References: <000000000000f386f90616fea5ef@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If hdr_find_e() fails to find an entry in the index buffer, dir_search_u() maybe
return NULL.
Therefore, it is necessary to add relevant judgment conditions in ntfs_lookup().

Reported-and-tested-by: syzbot+5d34cc6474499a5ff516@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/ntfs3/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index 084d19d78397..293c37171d97 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -93,7 +93,7 @@ static struct dentry *ntfs_lookup(struct inode *dir, struct dentry *dentry,
 	 * If the MFT record of ntfs inode is not a base record, inode->i_op can be NULL.
 	 * This causes null pointer dereference in d_splice_alias().
 	 */
-	if (!IS_ERR_OR_NULL(inode) && !inode->i_op) {
+	if (IS_ERR_OR_NULL(inode) || !inode->i_op) {
 		iput(inode);
 		inode = ERR_PTR(-EINVAL);
 	}
-- 
2.43.0

