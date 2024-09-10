Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A717C22F
	for <ntfs3@lists.linux.dev>; Tue, 10 Sep 2024 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953255; cv=none; b=j9DqIBAQ1VDS1xi/UMz+dMLVeNEFZNhuqdyjKJGoaw4cJJBY5d7sjL1epkJ8jx4tl2NdS6IpJCmW7i+tJLvxx5Qr2lL5xh9wmsC7lzuT9sO7Uea5iubKaoFF3o4icWOunFtgO0bAP+1hH69z9O3mlRhf1v8ri0BPNXucEmrd4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953255; c=relaxed/simple;
	bh=xHp27Dl5rFoaVGhUHo6nRu+Kc8ifNyYXpBdJfUc/Yn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Un/wj87UYhMeTBTLYRwebhN7oCFLhM8P/JpV2GQB9N4B2dc2xu+4leLh1yee94+35WQLxq+pELjdwHLm9JacvXIZT+fHv9s3MnAz17edpYyM9c+8K79fBD0vLa2EIwGkowlpMUXB2Ruqu5ilYW6myRkmDNfYA1aLX1wt/nXLBv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ePd/uRZe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePd/uRZe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso9687655e9.2
        for <ntfs3@lists.linux.dev>; Tue, 10 Sep 2024 00:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725953251; x=1726558051; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=imHMW4srmvxlkZw05ahiPZKsauky+pygFs/tY2Ct9A8=;
        b=ePd/uRZeRj4jf6VmjaUuYbq2j5TPzdeZPAtEohd5CvC7jjP5JwBzY6LWQq8l+35/3w
         SUlIAZO9xz2w9XKAw/kbZG1lyd5Cg2HWUN67LAlf8AvvIjf5QCt2DHC7o9PJhrlxsUq2
         q+bXAfzV1a0jhjH4ZGkIZphshqBowKSdAhfNAfkXp0KU56xgP6nQSAe2bSxVm/41AsM1
         mTMaNo2oUxywFSrGoo9KKnzBkueReNjWgCoWYaYCAVd6GkELDvj/63N2d+I7s6UqpIKP
         cyHHJUsveIFi8JJy/cV5wjF2qcodC5GcMLpsLUpQfot5nBvE0jV64QY5Ak1B8GaGHzRv
         +4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725953251; x=1726558051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imHMW4srmvxlkZw05ahiPZKsauky+pygFs/tY2Ct9A8=;
        b=lJACmgZ0bSUA5fbPS+jzsFHjOzzRwINlwnRJmF+zC3BPkRhzP0FnL/G21vrntUJEKB
         PBbmbH4nhgDVGw2+YK8i+COY4HynAr4jB2Xb+M1Hx4HHpVzLq/nCw3zqurhMrcM2ZwUP
         SeVxrqJgvIs6EdYx6L796w0Jp88BDseM+c1Ieg/UHRte0YE/l4e1ynPzEP1gsXxwjUXL
         B2KgRXDh0yF5UxU8pzNbMUM+CaoBYYLgUSs+4QXUlNUeIVtS2/9SF1YigJA2j+b4+Kaa
         YcFTKTI4sZwoKxiy//a7ckVAlvj7EBXtgRwM7gPyzeVrxztI5KW6Sfeiwiw4vSQ3Ziv7
         ZQ6g==
X-Gm-Message-State: AOJu0Ywdvq/FWVOEc/stv6hGPlA0IfFPg27I+p5GIHfSaoV+4b5u/1Om
	V0bQ597xbWkICimfKauEaq7gRCM8vF+voRxc9qzrIZ8A//Z/C2isgaC/YJSGMlw=
X-Google-Smtp-Source: AGHT+IGoJxhSFCZbyl7tqtAC8eWbUuCuNeiK6sk/bYCSGEBjaxZfva9+5Us1debP3cR6vVuVBeMXzw==
X-Received: by 2002:a05:600c:1f09:b0:42c:b8cc:205a with SMTP id 5b1f17b1804b1-42cb8cc232emr37553905e9.32.1725953251538;
        Tue, 10 Sep 2024 00:27:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb1cf939asm86495265e9.19.2024.09.10.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 00:27:30 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:27:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	lei lu <llfamsec@gmail.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: remove duplicate check on "asize"
Message-ID: <15fc9478-cf00-42b6-820a-87a2d62f2766@stanley.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Commit 556bdf27c2dd ("ntfs3: Add bounds checking to mi_enum_attr()")
added a new check directly after "asize" is assigned so this check
is duplicative.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/record.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 427c71be0f08..0f400366231d 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -268,10 +268,6 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 
 	/* Check size of attribute. */
 	if (!attr->non_res) {
-		/* Check resident fields. */
-		if (asize < SIZEOF_RESIDENT)
-			return NULL;
-
 		t16 = le16_to_cpu(attr->res.data_off);
 		if (t16 > asize)
 			return NULL;
-- 
2.45.2

