Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4B1E7C2E
	for <ntfs3@lists.linux.dev>; Mon, 15 Sep 2025 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942597; cv=none; b=jABno8gDRL9tafmJ9NuXGdIJWNqeKkzf8AUfQTbL4n6UB2iNIMmu53Ciu8TsnaNnblSDjaTfE5hRZqJgrdrBef2s0MX8+BmrmE5jn8BKZI3n8qHUsOagXsj0Ql1fwuUGKBR/DMDtVC+PK/dp0cnWWoOpyiKXIvA1SM1MYoPwWhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942597; c=relaxed/simple;
	bh=5JmUo5wzYdhjJxAOdK8joBgBIJLjs1DAmnWDAuzwHGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O2a01Fx1ovbk4GRdmj6iqf0UU0DLkyxFaxqXV9J1FGda0rE71wvQkc1qZPV+iF8eLLQOPva4x+fQ+94IMeMpMllVy9xSw87ru7klgfBTV2FDNkkRLuwTy2FlnguIEDwceT9del8p1g8TMOzjcvjMmWkYCdWRNr6SMhFCrFhhFLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UqXRCsen; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UqXRCsen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=u8
	qA80TU+qvZWZGpZXUYmlo1JufyjuXgNsy8o8OtuNQ=; b=UqXRCsen4uouXLYJ+z
	1WqEpLJW0Zb64BVdCQe9hF3QBvTYb/WSH9U3ZlULMw1qYE6a2l54oO3zbdBDCD0H
	X47TmEmnoMGCJrNcR6mIRvmegNNO9urGa2fe78BQ+LTd09J00e7gqJHahYWD4HUE
	SyItiOtDncSg/bGwR33IQiEwo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXqX49E8hoEW5WDA--.46102S4;
	Mon, 15 Sep 2025 21:23:10 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] fs/ntfs3: Fix a resource leak bug in wnd_extend()
Date: Mon, 15 Sep 2025 21:23:07 +0800
Message-Id: <20250915132307.183674-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCXqX49E8hoEW5WDA--.46102S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4kXw15XrW8Kr1fKr1kGrg_yoWxAFX_Ga
	s7Ca48X3y5JFn8K3WkWr90vws7Xw4rK3WkGrZFvFyDta4DXa90qrsYyrs3twsYgay7uFWr
	Jr9aqrZak34fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRAAwIUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBEgfJbmjIEfcqUQAAsP

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

