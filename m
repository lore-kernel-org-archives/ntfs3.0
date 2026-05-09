Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E79383C6E
	for <ntfs3@lists.linux.dev>; Sat,  9 May 2026 23:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778370790; cv=none; b=WCwP/Ki3ovXlNM8wTqocLf/TPMUuEOrs/RUn135WGEcmrqKIWm2kdahqcdXVfbQjY/+DLJWIsEuKyMrYRwwHToL10BT6s+7Q2IclWkUIJnxo2rKcRxaHUoXDs4wO4P9X3Y79zi8Od4AWcZjtAKGa6JWJ3hbn8MsaUkLTUIjAT+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778370790; c=relaxed/simple;
	bh=CQLoY+LY/NNDrILnxsCehh8h8uCiW0ClxhX+PDVHPM0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OkcQPB/YpR2SKVODzZ6zHbNM/NABvYNxSa/vbILONWQDCuFlm5MMuP2ihfHHqfrSuJHF3LY81csEgXblV3SQG7K+vLogjQXgUpmJrIT5MEk13+oDmlQnxROOLnawidDBmivpSrin5nMCkLAh9QmcCPLVbiDYWtqOKBvdaV58vww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQxqvECU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQxqvECU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso6009145e9.0
        for <ntfs3@lists.linux.dev>; Sat, 09 May 2026 16:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778370787; x=1778975587; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+++qTKQ/UpP+Bja1ypEFmkBeIFNHUF32EtoWxZo7MA=;
        b=XQxqvECUUyEGnbgWESmfmBOxIq+36haj4AaLCEG90pr68imrsmbKlxe9mLdnJyMqCc
         SpBnbUn6XcFm7H2kh5j28uHBxJTwralpm9/1qiJ/VVAlB3ayrJZp7nGLG0v1OITit9HV
         YN+uDyOkeoYENVkdQ1mS1H7xpzryyhmnGROSIxuMto8e1I9qmaY9rHmgGmZxoGxIP2RJ
         Z3C8lQUhWE8pqteAJ3YCfcNbRt2qGjWvvLAQpIexi+gLt1goCtQOcxEbgMhm1QO9LIWz
         bYY5vp/QiIun1+ei/kfdFuTniZ6SVsu7pOyIfcq9JIfNLIIC2LXRTkrZ6fUl+Dr/NpAe
         emHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778370787; x=1778975587;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+++qTKQ/UpP+Bja1ypEFmkBeIFNHUF32EtoWxZo7MA=;
        b=TvbC80vVxRvFL658uQEfP24NMi/YE+o2i0FOWg+S5TrOx/1kg0lIgmkN3LOxcCuafO
         vIOuNH577LTuLE6Oe054TdR2NKMa4S7eJlpCRN/YCqZNTV5m1HAfaqqtT5tFbFMMI43m
         HRsiSkElH1iv2YKFHcd8QMBPfSBFXstiiwo+zEZMOvRta54OaWNR/N7pVxAv53pG7v7T
         d9bP9JACW4aZUNSD4/fkuHZl4XvLdwgoA6tGQGtoppXYfk6mkZWYcoCLoZRdcRhCRYxk
         ucnVgQUx5HPg9ovcyRexZqRnn0SflORAZWX4rL2TiP0ecsi1lVCFy8UiLs0m8oZJsI6e
         f3rQ==
X-Gm-Message-State: AOJu0YwjP6j25JfSnKFB/SZ4n51ADL3DQDVdAF1emsInZ4LWiIh7M5/e
	+FvWdPjMeVT3NSmWil++IHKGA9payi6bbAja4JHmboIDyUHkqQscQrQp82NjpCko
X-Gm-Gg: Acq92OG/TO4c1qXL2IezEYfm0kg6Bgb3GcI4EF6/zG2bA3zDfgEe7UHNk8VdcFAwU6U
	HbTK3FZFh6RCU0GyPd7BY4v8BrqWHu8JRDTeQrDWwfPt7t0ipTMxduWHV7Vahm/thVmIU7/oO1N
	+Ifv0ryBnDc+/jH8bY1Unx4MPbjzAZ3njqKpxmxj1tINrndRDue+zj//PxjTkksA23bZd7SsE61
	xRC315DoLTeQwabiXSydppn8bXf70Kw/oxju2QD99zOI4p7jdyP6OdEc4IODw9VlN6T7vpgPJzc
	i8DDhvK3A4TbbBgca9zMkF3ePLJyembTYffQqHAQ/MFHhfPsS3dgVELGXUN0uOtLkJgBLad/JYP
	5bqYLQrXUn0nTXkJFpvw0JqzUlllG0n3ei5zFmUWkHrqfRk6aOHopZVvU9/daLmSbwuhl/51NWS
	eDs99aiH6z1FjCCV4GC1Ob+Lkn1s/Mt+zbjQauhInX3xqAVUWfEuWC85CK3UTxgI+fexPziELmM
	XxH6vbjrKy2Sy3x1tmSKDwtPrTAYw==
X-Received: by 2002:a05:600c:a111:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-48e51f46d1bmr208379425e9.27.1778370787264;
        Sat, 09 May 2026 16:53:07 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:a405:b300:e2a1:1a24:245d:ce04? ([2a02:2f04:a405:b300:e2a1:1a24:245d:ce04])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm14403001f8f.2.2026.05.09.16.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 16:53:06 -0700 (PDT)
Message-ID: <d1fb7b33-15e2-475b-a739-4d61c0ae58cd@gmail.com>
Date: Sun, 10 May 2026 02:53:04 +0300
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
Subject: [PATCH v2] ntfs3: Allocate iomap inline_data using alloc_page
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
V2: fix mail formatting

 fs/ntfs3/attrib.c | 9 ++++++---
 fs/ntfs3/inode.c  | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e61c5bf7e27e..f72848d077b9 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1042,10 +1042,13 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 		*lcn = RESIDENT_LCN;
 		*len = data_size;
 		if (res && data_size) {
-			*res = kmemdup(resident_data(attr_b), data_size,
-				       GFP_KERNEL);
-			if (!*res)
+			void *page = alloc_page(GFP_KERNEL);
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

