Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1528469E
	for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764406925; cv=none; b=QXPSy8JJrX5o2ayMB2+rPiPeim2FEEXD1ESa3DfQpGy08TMiUZEEMC3rSeLD1pixUXnBrIRxG4GtX5lPKsHWPT9evSFVgW9+KEaCYF3SzxQA489Qybstyd8QX6yNn86bJiw8gThh6oVnjsnF87VVKQB846nwWv8PcjTtHpPv13o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764406925; c=relaxed/simple;
	bh=Hfn+I4xKib6YHUNH+g6fjmCyECLvbavw8yPYoNL/5CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rntlOcI1lV0aJxx3bq8WThUQRJJB+RPyAaC6Sqto+YTxcAVur1MIpkZnAVVZpKhPG3KSARLk8L61h4KCX3nlBsJCdyebDl2WBMiycJExGRwt0EM2dnm73E1qfYdp/YGcz+lx9XdQ0w84uN8y6RCD8+C2/IFGVmrJc+44I1uvVQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfIc55w+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfIc55w+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso2967984b3a.2
        for <ntfs3@lists.linux.dev>; Sat, 29 Nov 2025 01:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764406923; x=1765011723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdyx9mvaY+8x+eK9XImqi9TsYLR1v6CaCbGe/GD/N5s=;
        b=ZfIc55w+a51cFLAUC4IJD5VNeR61k2Y8R+MLZZDmnhO6vkW920NBIORavsHlIyehub
         GlXK2e1DFIz0Rd5vLqV3GBeIhzo4btZ1aekgoSQkZZB26o3DDQvxeue/L2uL/2knKTzP
         ov1dyj1Y+4mB0mObpHfrFNwEmGOBjxthq1eix6nNWqX/OiIFr3x3MGJlRhtHASlfNXsa
         myB6y2KS1yq+ZhXMHescMbPOhKmqyVbTFxC0N1QmTkUOJvw2Yj0TviFtBiyjRSRuOrD+
         tcpp3m0gdGYFm5b06y4ermKEP+u36Ox/glrXbqkDKQLFGHh7a7iMgw7ZWJJBvm7TxRqr
         WKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764406923; x=1765011723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdyx9mvaY+8x+eK9XImqi9TsYLR1v6CaCbGe/GD/N5s=;
        b=aVvHI9AyVJxwdhAf/4hgch1RYWXCN9TJVZSZLpFGKngILGODLdEduBYKu2BiYb086M
         75q8h7F89cxj9L1+qmqPEUW/+9tCfZNgrQ9cWfCgxqp3jlP6TNCdwCDyibrxkT9rDzUO
         p1rrCbt0fbJSan1LqB6tO8ohQKgdTgR/AZw+Snm65G76e6wSxXpsr4B3skovhGwaJE7y
         XzCXOCgfu3n3XfjdeoAq3rYap8lUNL217m1uQwK7inNfcW/qkx6SyXOmbWc1LTuEqeqs
         wkJEtNIMojGS0yJ8rU5YAT13UY1WR1ouYPkPOhTSYsWVgc5OWaoaEmKHW470s3tJUF+D
         alIA==
X-Forwarded-Encrypted: i=1; AJvYcCWBZr50j5dZBfHEI7egWi2nHzMuJYX+ORrZUy1NM/gcYolIpklScDQD8f3CHrIGuHl+uFUEsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxnVbyWSWb2+MebAOuNTLFxAG2BlbvUWhF9w6CUjmQjDD6pHKz
	MJkD0KLwwyRG04ha1F9DJw3ycdYBsGz8EzkZBsnMIjz+zC4tBK6W1kxv
X-Gm-Gg: ASbGncuqu2quNySpC4uYwqbawFlCLqexfP16gQ7idBjk7KmvklCXWbIcEa4VFYxSXtO
	lGUTF7VXiqMcnr1wsPYKGEIAtUHXkNkFkJOLsD+AKNLqbuqJ9ywpS0aVRJPKpBAkwx/oyCSNFIn
	dUCu9kYzyC0P4L1MkcIBqKexJXfY7KgGneHuzowlhZKKYNan+Bd+kzHEPL0ufUgxqK4m10sroK5
	+2S5S92QbedfLWUPJJEmM++DiW0oocb5yWv/KnySwyp++YmMUXLw0WOTNMR2o+ivZjhFLyO981w
	XnW1RU5YtMwk4oVShTE0XJS+HD9oC3NY0O8KD509Kj1V2/xOHsK9MMFVflg6uvA8yTiuCkuJo5D
	OQZw9ki4dNilFQfua82oiAlB57fWRkGHyz6TFyuYtHnPHR2da/K1tgN0RFzvI52oJaMOKRy0DiP
	joVBEUpa9szNglBuSI2vjUT7pnh/eteVorDmaj
X-Google-Smtp-Source: AGHT+IH/QH6JeY8zEnnFSEp2edvSj4WvW2OiftF5ahPSC2LjhfBX3UeSnFliqzhG5QTteUkJDEx/bA==
X-Received: by 2002:a05:7022:ebc2:b0:119:e56b:957d with SMTP id a92af1059eb24-11c9d6127f9mr19966464c88.2.1764406923339;
        Sat, 29 Nov 2025 01:02:03 -0800 (PST)
Received: from localhost.localdomain ([104.128.72.44])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm28114394c88.0.2025.11.29.01.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:02:03 -0800 (PST)
From: zhangshida <starzhangzsd@gmail.com>
X-Google-Original-From: zhangshida <zhangshida@kylinos.cn>
To: Johannes.Thumshirn@wdc.com,
	hch@infradead.org,
	agruenba@redhat.com,
	ming.lei@redhat.com,
	hsiangkao@linux.alibaba.com,
	csander@purestorage.com
Cc: linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	nvdimm@lists.linux.dev,
	virtualization@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com
Subject: [PATCH v3 6/9] block: Replace the repetitive bio chaining code patterns
Date: Sat, 29 Nov 2025 17:01:19 +0800
Message-Id: <20251129090122.2457896-7-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251129090122.2457896-1-zhangshida@kylinos.cn>
References: <20251129090122.2457896-1-zhangshida@kylinos.cn>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shida Zhang <zhangshida@kylinos.cn>

Replace duplicate bio chaining logic with the common
bio_chain_and_submit helper function.

Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 fs/squashfs/block.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index a05e3793f93..5818e473255 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -126,8 +126,7 @@ static int squashfs_bio_read_cached(struct bio *fullbio,
 			if (bio) {
 				bio_trim(bio, start_idx * PAGE_SECTORS,
 					 (end_idx - start_idx) * PAGE_SECTORS);
-				bio_chain(bio, new);
-				submit_bio(bio);
+				bio_chain_and_submit(bio, new);
 			}
 
 			bio = new;
-- 
2.34.1

