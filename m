Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FEC21771B
	for <ntfs3@lists.linux.dev>; Tue,  8 Jul 2025 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961691; cv=none; b=tE73csuHU8uew/XNxt5AJWJfOLX3P9vtAjMk+mswgN7FEwYd18PZ8LAfH64njM5qLYWSRWlEr1XoCskF8cAxphDIwbZkC7IxUFPc/Hh8M/V9bEaxE07L9WCZ2BUeJs533F5eHjjDq3FkLuHcF6N3xxV9noIut1ZJMbXKHZmnPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961691; c=relaxed/simple;
	bh=5JmUo5wzYdhjJxAOdK8joBgBIJLjs1DAmnWDAuzwHGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IqE9tzTiWFt6CdFvTJfc37y4kz9qguTw105H1lGe5/p1nqzckY+u5rnhjS+BSLgRDLPAWhSJelkboHYG5vmCpom3oHqH0YBxrrPSX7w6LhMd9G+81qDG+2P7sP7oKUxH3cDLfoCMWrKeONNQKpChq3w0UPtU9LcjN7qmbWKMewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ce1AwGmR; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ce1AwGmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=u8
	qA80TU+qvZWZGpZXUYmlo1JufyjuXgNsy8o8OtuNQ=; b=Ce1AwGmRbvmVr5RitY
	0klvgv6YfNyQu7CSZM+c/cr8lc74x1gZa9BC70zSS3p8JCLc4H6JkFG4clyC8VC6
	kS5WSms0MFqE6gYyZDtNXb/oNVFBa9mvHCgs7aioHeRY40rUyFWXb8yyJBdFkPTy
	lF/dQWt5XineJqOfM2ynNMge0=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXcYxL0Gxot6ERAg--.61762S4;
	Tue, 08 Jul 2025 16:01:16 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Fix a resource leak bug in wnd_extend()
Date: Tue,  8 Jul 2025 16:01:13 +0800
Message-Id: <20250708080113.2870200-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCXcYxL0Gxot6ERAg--.61762S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4kXw15XrW8Kr1fKr1kGrg_yoWxAFX_Ga
	s7Ca48X3y5JFn8K3WkWr90vws7Xw4rK3WkGrZFvFyDta4DXa90qrsYyrs3twsYgay7uFWr
	Jr9aqrZak34fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRC38eUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkBmEbmhszu8vkAAAs5

Add put_bh() to decrease the refcount of 'bh' after the job
is finished, preventing a resource leak.

Fixes: 3f3b442b5ad2 ("fs/ntfs3: Add bitmap")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 fs/ntfs3/bitmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ntfs3/bitmap.c b/fs/ntfs3/bitmap.c
index 04107b950717..65d05e6a0566 100644
--- a/fs/ntfs3/bitmap.c
+++ b/fs/ntfs3/bitmap.c
@@ -1371,6 +1371,7 @@ int wnd_extend(struct wnd_bitmap *wnd, size_t new_bits)
 		mark_buffer_dirty(bh);
 		unlock_buffer(bh);
 		/* err = sync_dirty_buffer(bh); */
+		put_bh(bh);
 
 		b0 = 0;
 		bits -= op;
-- 
2.25.1

