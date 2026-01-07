Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D802848BA
	for <ntfs3@lists.linux.dev>; Wed,  7 Jan 2026 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771490; cv=none; b=t7RxTF8zblL5/lVPBtrggGWMvlzmg+3cdyKbA/plSc9fQp0B2Y29VVG+cEUwNCrJwrs+UJ0ONjwNQkCxVvQSiA5G95a2xBFRGqkc8tSU03F5dxc+fvcg6p37dldFZ6cuGGHLFD3wDebsNxE/H0zPkzMLNXc7iJkz0BXiXIwoONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771490; c=relaxed/simple;
	bh=MTPMVvXUa/M3zwhmJUT8/ZdE1VwbpEWTUDMeXd/NEbw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aRfIK/AFN28i6zsFju1TlPq3z03YJBXIM4FfJbjEDEXWr3xgbrEkNx5FrH9IvEIbP5d6jm5EaXc8iCfCX13TR/dH1y6p84RgNPhR2DYSFYenr9+V08nQbOjwwDEfFQca6FcGnri8WnUAtLlWWoLtWeLE/AIxfaFwFBlvK77tgU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mht5kngv; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mht5kngv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767771483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GRPMgsrUQ7Ow/V2nUgNghG4HqhRTPmD+dsCI1mKYKuI=;
	b=Mht5kngvv+4m8Be1cYHXsLwlHCkS/F0NaZrSgQm2uUcvSvsSU9Cpowzscaar7Mvzk79XiP
	Vpjz1NnTsqezlG1c+618uUeQ0kidHrstBnto800CxGA/lgadeiHSN6C9G79H0KEdMBCE/p
	aBzeAL/9xeI/bETn5loaPR+U91KOl0o=
From: sunliming@linux.dev
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] fs/ntfs3: make ntfs_writeback_ops static
Date: Wed,  7 Jan 2026 15:37:09 +0800
Message-Id: <20260107073709.106071-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: sunliming <sunliming@kylinos.cn>

Fix below sparse warnings:
fs/ntfs3/inode.c:972:34: sparse: sparse: symbol 'ntfs_writeback_ops' was not declared.
Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601061424.nbKLNwC5-lkp@intel.com/
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 fs/ntfs3/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index b969ad7c3258..636aa77e20e4 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -969,7 +969,7 @@ static ssize_t ntfs_writeback_range(struct iomap_writepage_ctx *wpc,
 }
 
 
-const struct iomap_writeback_ops ntfs_writeback_ops = {
+static const struct iomap_writeback_ops ntfs_writeback_ops = {
 	.writeback_range = ntfs_writeback_range,
 	.writeback_submit = iomap_ioend_writeback_submit,
 };
-- 
2.25.1

