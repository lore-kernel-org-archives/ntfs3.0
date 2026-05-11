Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DFB3D6479
	for <ntfs3@lists.linux.dev>; Mon, 11 May 2026 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519950; cv=none; b=uIo2B5KXisQ2Wg+4uVpgrmGnWajFL098yGV7gokRr5Jml84SwO0oxCALeDGcGh+V/BF+cdXFkgP2lUzrcpRTtGOkArGyq6xSzqmVCfzSWGllxKdq0FbNjHGPByFYH9hnrVpVieQO+wSbMnDamI0WbgnnMxTUCHy6hYLX7tUpsho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519950; c=relaxed/simple;
	bh=zaR2jVq6IFi9mbvaeshZVhZzW+4wk7HanSdPaJAwk0M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=rOEHBMWvjgQtX7hycVutuZtCoiYNRnVffo2CKA03X6DxglrTS/77HNX4rajZ9jcozp/0SjdXSgfYMkD/gMZ+sLvCWiDOPZugaZH7r5jmfl6mXQrstq7IX5o+8txLPRFpYh/I0jb+WL5ePmygiSdTdWxA0uR2TpCVzHDin/95TAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9nc1pVW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9nc1pVW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so28503735e9.3
        for <ntfs3@lists.linux.dev>; Mon, 11 May 2026 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519947; x=1779124747; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5YGkfJg6n4KiA/WQT6VRxvR8ouMJ6VVP5WZQs3IwGM=;
        b=I9nc1pVW59wO+E8EFZ45wt+7VNnILW1mwxCYRbC2ePolq4yIun33wV2xNVpfMMsl1S
         tqGR4JmkSJOYs4nh07ENir1CZnOSrgynOOv4h14rUS8qRBfwN6GGRH3vxGvLlPZ3hLBC
         oXf8im8sFl8Yue9fGBW6Y3VrrjvqnoVgWFhQXH8ELarIGxBFgQhJPls126QyiMxWthDo
         qb0z5h7Ogao7uBHuvJgHAHNFNDuJRl6KM0ym4dmuzEmjw0HhsSObNPIJgO8fagoqchyH
         Itpjvo8zkuWgM5dvZTEmJKZzW106E9Pir1FVEfHgFRXDABWP9NWEpLiuX0FaReY3JE9c
         zj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519947; x=1779124747;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5YGkfJg6n4KiA/WQT6VRxvR8ouMJ6VVP5WZQs3IwGM=;
        b=A/CiUGOibSObl21+Wsqv4e2BvwE1RYAF85uASK6Ze0p/5fwHKhiVZSaIzwl0CFwrEq
         kU4NCQ7A0tnUJOsNPGuFe/N95rWhBKnG7J+yBGzC+L+PUO2dqyK6G6akdekYbR/1t6KF
         gu6PrGTR0d/a9LZDS9kNoUblrhzMEUoFFDAs8Y7E7WUSpnHIH5eftVfnBliA8gXH8Soe
         zxO1ni6+FFbgdoYloSZTX5HBkIPMJYkl4cME3c3q1vzfIiQ74eHzY5GPM3v6izQxwfs5
         u9vDCbaXtuYhTAbCrgkC6O98jrD/qPqApvrJCzttxK9Zf7ZqW5BDfVBpFvj35kmzrhjE
         fivA==
X-Gm-Message-State: AOJu0YyTDjKr/tJf36ZlNr9M3bo0Pm8pU55nFUxp4j2SNtJp7TPB/7GG
	03yuPiIMj2dxR6vuo0Xhzxo2I2q/F1q00tEFve5hENNU8EphukzLYQ1rPi7nydNu
X-Gm-Gg: Acq92OHLmbnSvQ1aKAEr3hCB0I2XxjWyRVEyE5XJZ0DULiblpgy4boSoF7NvUGm9x11
	rXh6qgbqW5WfW1ujpEl5XVMtri7fvuGcIMiDYqSp4jDi3SKyU618NzkbGhwi5izYM/xut5vD7Os
	uyZDZiiW3wAabigzMjjMPCzwwT2TRwR+rN/ixidR64yCV1anPCgfcOVnolvKZUUPtZseasQSZYs
	xcvroSaZxRPAOO2S9FU4e5yQJpV8eDjNyIMsmv0CXB5t8uBK5bB/lo7edJYAl+XHfHpu89epJO8
	QhKAPlFtKDmUvh26LRKujBg45cGup9n31KAaO0pPVZBsQFMWFzV4irtk+rq56gfgzEywvMfgEj6
	/PSz95e+i68h7WLlYTfvc5I0JS4CyGaKMU/ABQDH8KWdocD+AJfsLjcZm8yYAFNnIZHbpBP90Us
	7JD+P8bnZUkYfOR4I5vLrOPpwtk5FK0l/8IyjQxLXa2agsCk+7Aic=
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd4d with SMTP id 5b1f17b1804b1-48e8741ffa3mr41691975e9.18.1778519946896;
        Mon, 11 May 2026 10:19:06 -0700 (PDT)
Received: from [192.168.0.112] ([5.12.125.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm26325902f8f.34.2026.05.11.10.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 10:19:06 -0700 (PDT)
Message-ID: <d3fd7e93-748c-4e51-ace9-a0f0a8346045@gmail.com>
Date: Mon, 11 May 2026 20:19:04 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: almaz.alexandrovich@paragon-software.com, m.brodschi@gmail.com
From: Mihai Brodschi <m.brodschi@gmail.com>
Subject: [PATCH v3] ntfs3: Allocate iomap inline_data using alloc_page
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This fixes a BUG reported in iomap_write_end_inline:
iomap_inline_data_valid checks that the inline_data fits within
a page. If the inline_data is allocated with kmemdup there's no
guarantee that it's page-aligned, so the check sometimes fails.
Allocate it with alloc_page to ensure it's page-aligned.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221446
Signed-off-by: Mihai Brodschi <m.brodschi@gmail.com>
Fixes: 099ef9a ("fs/ntfs3: implement iomap-based file operations")
---
V3: fix variable declaration
V2: fix mail formatting

 fs/ntfs3/attrib.c | 10 +++++++---
 fs/ntfs3/inode.c  |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e61c5bf7e27e..ff0bf4575948 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1004,6 +1004,7 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 	struct ATTRIB *attr, *attr_b;
 	struct ATTR_LIST_ENTRY *le, *le_b;
 	struct mft_inode *mi, *mi_b;
+	struct page *page;
 	CLST hint, svcn, to_alloc, evcn1, next_svcn, asize, end, vcn0;
 	CLST alloc, evcn;
 	unsigned fr;
@@ -1042,10 +1043,13 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 		*lcn = RESIDENT_LCN;
 		*len = data_size;
 		if (res && data_size) {
-			*res = kmemdup(resident_data(attr_b), data_size,
-				       GFP_KERNEL);
-			if (!*res)
+			page = alloc_page(GFP_KERNEL);
+			if (!page) {
 				err = -ENOMEM;
+			} else {
+				*res = page_address(page);
+				memcpy(*res, resident_data(attr_b), data_size);
+			}
 		}
 		goto out;
 	}
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 42af1abe17f8..031f85fd53d4 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -801,7 +801,7 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 
 	if (lcn == RESIDENT_LCN) {
 		if (offset >= clen) {
-			kfree(res);
+			__free_page(virt_to_page(res));
 			if (flags & IOMAP_REPORT) {
 				/* special code for report. */
 				return -ENOENT;
@@ -921,7 +921,7 @@ static int ntfs_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 
 out:
 	if (iomap->type == IOMAP_INLINE) {
-		kfree(iomap->private);
+		__free_page(virt_to_page(iomap->private));
 		iomap->private = NULL;
 	}
 
-- 
2.53.0

