Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17102D5406
	for <ntfs3@lists.linux.dev>; Tue, 15 Jul 2025 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573089; cv=none; b=JhSPPe13Mwe+xLc4aUR9Ge9CpRqfK+PHCSF87ULnbzAEdZ/JUwrmXBTDpUnJi9uLoNygPT6bKb53e+gvbnsLdA7+3UlHWVI5mn7T6+kCh/YbE5W4Qk8LLUuX7pgUgrI6XxsD3513torb7jEU4GK+ewuJUoLhe12Fme9Pb9oZODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573089; c=relaxed/simple;
	bh=5JmUo5wzYdhjJxAOdK8joBgBIJLjs1DAmnWDAuzwHGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rcTfkiokG6kioDYlTFE8FGBdETkk0NxBeC6+tStMc5wWSqBHEJtoTRsIV68GmSacH/kLMcooGJbBA9LcaKSOOOOzz0Z8n4TjoKpBYOUvkintMydEkSV2mCn/ADCe32ckCoGfPoF6oOxvsEmpRlFUl99bpwCwVK2nK4+SJp47SJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VXJeyH7l; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VXJeyH7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=u8
	qA80TU+qvZWZGpZXUYmlo1JufyjuXgNsy8o8OtuNQ=; b=VXJeyH7l+HAqfoFXH4
	ZZHhhrbQMXSc11RP+HyWPHp4RUlDNhS3dBTK5gLxdHSfbJexHKwmr8grlxKiE/e2
	UWilmY1kkPmBBIBKxNgxqzFIPYd9QLCpDNEMCbyDDdXP2o+czNN7tP/9vCNhJgW4
	rUoQ59079UIXyd+hgO40cB2tc=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnvIiaJHZoeDTJEw--.28310S4;
	Tue, 15 Jul 2025 17:51:23 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] fs/ntfs3: Fix a resource leak bug in wnd_extend()
Date: Tue, 15 Jul 2025 17:51:20 +0800
Message-Id: <20250715095120.3267468-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnvIiaJHZoeDTJEw--.28310S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4kXw15XrW8Kr1fKr1kGrg_yoWxAFX_Ga
	s7Ca48X3y5JFn8K3WkWr90vws7Xw4rK3WkGrZFvFyDta4DXa90qrsYyrs3twsYgay7uFWr
	Jr9aqrZak34fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJ5r7JUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBEgCLbmh2IJ5yzQAAso

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

