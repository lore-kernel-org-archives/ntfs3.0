Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F483264EB
	for <ntfs3@lists.linux.dev>; Sun, 12 Jul 2026 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783869815; cv=none; b=Poir9+VgmlcBPejnuPqdKD2HqKvTnt8QSO7l7e0MtDUrjTudt7857dbY9q/YzAQFO/8pwYBGCaeELZwLbSXe4WpITLInW3wMGT4wKLkS+OGtb0MzZ6ysd/e91huy9tGPIOWb/nyTOhcJITOyPDIfpkXGd0eZIjpXec8+XqwVlrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783869815; c=relaxed/simple;
	bh=z/CtwGnaSVXk4MB1SCXucif6bS2RlD9Tb0ZFyMk44OM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lv9EGMAyfaRhTcFoyHJfe0b/EJDIsYNmc9+nggFdzPdUCUlN5DX4qULRDpT38+RTCM1wkECn2ADhWABt0XcY2yyXiOJkNGzIv3OVicCkY6XqTk5CEGdl34RXdic/kpXfCJ+lMoL22tMCTfvzF7lwazOJ3LvrPgjtfEDPcaL2FHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=Qfei3mV6; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="Qfei3mV6"
Received: from ubuntu-jammy.. (unknown [89.39.121.5])
	by mail.ispras.ru (Postfix) with ESMTPSA id B10AA406C744;
	Sun, 12 Jul 2026 15:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru B10AA406C744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1783869381;
	bh=CSwDdIxHbA1QeuSs9tx8NaoJ9awHeUtmGWpDT+bFRVo=;
	h=From:To:Cc:Subject:Date:From;
	b=Qfei3mV6QuvI+8ifVFr4IBf13X9GLK6KnJli8QUp8m148BivdcQKRwOoHeDWOwb8j
	 t4TxF8unGPau2XGErYM6DNywAqO6h9CQmSekOTCnXduo6dRyHNspYsB232aVe8UJaJ
	 +pjbggxTiTjrZM0F09tarpo/YNo44llE5fghGBOM=
From: Dmitry Morgun <d.morgun@ispras.ru>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Dmitry Morgun <d.morgun@ispras.ru>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] fs/ntfs3: check return values in indx_delete_entry()
Date: Sun, 12 Jul 2026 15:15:49 +0000
Message-Id: <20260712151549.1781-1-d.morgun@ispras.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the index tree collapses down to an empty root,
indx_delete_entry() calls attr_set_size() and ni_remove_attr() for
both ATTR_ALLOC and ATTR_BITMAP, but their return values are
overwritten by the following call without being checked.

In most other call sites of these functions the return value is
checked, so add the same checks here in case an error at this point
is meaningful.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Dmitry Morgun <d.morgun@ispras.ru>
---
 fs/ntfs3/index.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 5344b29b0..c730175d7 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -2619,18 +2619,28 @@ int indx_delete_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 
 		err = attr_set_size(ni, ATTR_ALLOC, in->name, in->name_len,
 				    &indx->alloc_run, 0, NULL, false);
+		if (err)
+			goto out;
+
 		if (in->name == I30_NAME)
 			i_size_write(&ni->vfs_inode, 0);
 
 		err = ni_remove_attr(ni, ATTR_ALLOC, in->name, in->name_len,
 				     false, NULL);
 		run_close(&indx->alloc_run);
+		if (err)
+			goto out;
 
 		err = attr_set_size(ni, ATTR_BITMAP, in->name, in->name_len,
 				    &indx->bitmap_run, 0, NULL, false);
+		if (err)
+			goto out;
+
 		err = ni_remove_attr(ni, ATTR_BITMAP, in->name, in->name_len,
 				     false, NULL);
 		run_close(&indx->bitmap_run);
+		if (err)
+			goto out;
 
 		root = indx_get_root(indx, ni, &attr, &mi);
 		if (!root) {
-- 
2.34.1

