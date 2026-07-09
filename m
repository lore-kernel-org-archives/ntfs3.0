Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16951282F22
	for <ntfs3@lists.linux.dev>; Thu,  9 Jul 2026 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581553; cv=none; b=ABGi1icUnRtmfObbsyhxXyYyTiYIJe+MfJD6gNVLcn6jjduS/pUAgJC0dJTNdSuzsPFs6pO9SaG6cAEntbXcJ/7qgEqI9JB1VAEwwm8eArFG3BnSpwzvJx76Acu8qZOAhT9Gdgw1IYACqz8HHFPUAR/adLuYyKRN1RpOgBlQNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581553; c=relaxed/simple;
	bh=QgNbY/0vo2hE5nVjXOBEjwRv1SKoopp4vlHjRvJp3Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WfMjDucs5MeszBTWrnCuaNNh3gGYcem4EAYMN2DMEPMrwDsdQIO6RDuri6JQQGTvldXPM4CJ08aOVatWtjQSAQ610clVnFWr5I6TVX1Xsr5GAZ0peY//yT9PDjInNG+fXt22x0shiiJEH4KcaFRDGE8l3RtFM6pMXJurNRajM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ujut4t7o; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ujut4t7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=O/
	tnBFvORjN4wpd0Sd2Gk2QW03Q3mJutoP3YafSV96w=; b=Ujut4t7osrR3oZmY9x
	EqH3kVGwmVIEJ8e+l8/O/4SmJOjbplbs7nwlP3XlVdEsHFW21QqQIWu5Ocu4uzEe
	0MtXf7TOt2GOn8CjKTmFB+/URGZefNaAzgsUz++Igo0CFx+Okv4V78uLeIvZuAHt
	qrY8eqIWFYEZg+2iHnV5NlhC0=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCn4qBdS09qEr31Ig--.41791S2;
	Thu, 09 Jul 2026 15:18:55 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liubaolin12138@163.com,
	liubaolin12138@gmail.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH] fs/ntfs3: return -ERANGE for short xattr buffers
Date: Thu,  9 Jul 2026 15:18:49 +0800
Message-ID: <20260709071849.2558133-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCn4qBdS09qEr31Ig--.41791S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7GFyDWw1Uuw45uFyrAF1rXrb_yoW8JrWxpF
	ZYka18JF4kZFyYqFyqyr4qv3yfuF93GFyUGrZFkw1fZrn8twnavay5K340yry2qa4DZw1D
	Gryv9ry7Jr13Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirOzxUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwh9YI2pPS19jWwAA3v

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs3 currently returns -ENODATA when the xattr exists
but the user buffer is too small.
Return -ERANGE instead.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs3/xattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 9743a63a152e..0a19668e970d 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -781,7 +781,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		if (!buffer) {
 			err = sizeof(u8);
 		} else if (size < sizeof(u8)) {
-			err = -ENODATA;
+			err = -ERANGE;
 		} else {
 			err = sizeof(u8);
 			*(u8 *)buffer = le32_to_cpu(ni->std_fa);
@@ -795,7 +795,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		if (!buffer) {
 			err = sizeof(u32);
 		} else if (size < sizeof(u32)) {
-			err = -ENODATA;
+			err = -ERANGE;
 		} else {
 			err = sizeof(u32);
 			*(u32 *)buffer = le32_to_cpu(ni->std_fa);
@@ -835,7 +835,7 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
 		if (!buffer) {
 			err = sd_size;
 		} else if (size < sd_size) {
-			err = -ENODATA;
+			err = -ERANGE;
 		} else {
 			err = sd_size;
 			memcpy(buffer, sd, sd_size);
-- 
2.51.0

