Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD04E1BC
	for <ntfs3@lists.linux.dev>; Sat, 24 Feb 2024 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708782610; cv=none; b=LyIzMDdVilppOA5vt0DNOR53K8hocxUuaZfWye2GVRkr91MHSeLDCUEm18VqH4vEBwmH1UkTGsY7MEO4IJtpU6KZ8mwf/a6YnWqp6+0T5PbTr5kfM57emsn4GP/qtKPVRaOTJuBVvQga8kHQaiy5VETdGojTH+sBboJqOQwQxdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708782610; c=relaxed/simple;
	bh=SC68QRObN3rZto0vm71oNtq2r60WxPc8SvKlqbdxyb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rzyWezZREgZJ6BTYZO42Y6xKPJjhnPs28fvg68p0VTCALYaCkrfly8fu+coRFWkk8ad8lIYNWK4A61dEL+8GEax6A0+JqfFeccrgHKjI+VPvQjOW9AR4diMrabYd72uQ7Cl1a1aljn/2GcVjKiMpnF+uQby9f7oI808ZoOiPO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nEN+r/Mz; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nEN+r/Mz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708782607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JSm+Ir7WRkiulBopfOJkhQ6MG0eswa+pECgZqNpCfq4=;
	b=nEN+r/MzdqMbGgZ+spbwl3fekXWSnzE4u45vmFB9GcdFDRuPKn5LarV4Tgrm3Do2UFAo7h
	I/NrN/obH1evP/noF2aS0FKNXd+/ghElmI34+LuBkxZlTly6bWeR0yHF00pV6PjvZbLXlf
	4LZm/MBrBxT2zAiay+gXI+lPZzvikNo=
From: chengming.zhou@linux.dev
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	Xiongwei.Song@windriver.com,
	chengming.zhou@linux.dev,
	Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH] ntfs3: remove SLAB_MEM_SPREAD flag usage
Date: Sat, 24 Feb 2024 13:50:01 +0000
Message-Id: <20240224135001.829831-1-chengming.zhou@linux.dev>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Chengming Zhou <zhouchengming@bytedance.com>

The SLAB_MEM_SPREAD flag is already a no-op as of 6.8-rc1, remove
its usage so we can delete it from slab. No functional change.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index cef5467fd928..9df7c20d066f 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1825,7 +1825,7 @@ static int __init init_ntfs_fs(void)
 
 	ntfs_inode_cachep = kmem_cache_create(
 		"ntfs_inode_cache", sizeof(struct ntfs_inode), 0,
-		(SLAB_RECLAIM_ACCOUNT | SLAB_MEM_SPREAD | SLAB_ACCOUNT),
+		(SLAB_RECLAIM_ACCOUNT | SLAB_ACCOUNT),
 		init_once);
 	if (!ntfs_inode_cachep) {
 		err = -ENOMEM;
-- 
2.40.1

