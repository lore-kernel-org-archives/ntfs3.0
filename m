Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E27B31F981
	for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781720554; cv=none; b=i2ZSYSdbKDVyvJTsCB+P2c3WQtZlefdz2Ys3hLk2bCnHZJMJiehqzX9Yicof/TrDjEsi40pZ4EApoFAx1zHgigSZsCNA9DMQFfGftoHuBV17DXwK/z4mkm3A+ELwM2HIesVZpx0i8ZGH2KdJ461WdY9np0Xpl8tozKqVkBiU5PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781720554; c=relaxed/simple;
	bh=6sdE2u3a7PaY23VBTCo48M0TQj6v7j4d4lV8PoXwQAk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lnJU6aEp5L2VyW8yCBd0XagEsU6E+RkPebWMDKb5hlXKt4HO/fIOuRfUIZ6fM3HuGmEHiSnHt1xn2Mdhog9SYnjAHBH9sh2d0ZyqrreIDaeNE0O5FOmlyezW/TRH3NYtJvhQ7h9taUucKoWsaHR0L3taYTU+icl8HHVWjRmsd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SV9MhoAP; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SV9MhoAP"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304f590dd91so139357eec.0
        for <ntfs3@lists.linux.dev>; Wed, 17 Jun 2026 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781720552; x=1782325352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uU8WLfL9ol8T2I+wsG/JnY3QPzDW69qfeYGIA3+5jro=;
        b=SV9MhoAP/6jSk6iVeS2hl8ThOazL1Y642xYfxJoPkiah/txxcKQtnKKRiVFvUeHzyJ
         jKizRd9UXnF7uuh1PJr6IJky+yCsjNOKVwbuJqQ5MQK3mYx/IznWPWd3/UltEjdTVNOs
         RnaF46drGU394wt8bJNRbAh+8fpRo4Ja6uU/OtCLGQK4ASSgKupOzEXZuZPllKlkQp5y
         mE26Aqgoxk0YfpshpKIJ78AtPefr0RuzSY/nhOHO7s51ejulyP1e6r8l3l4EPPy/tZ/D
         evOyZ9XranvXBLtF+nRwZc8RPcB/VR3NvciTCJSZISdMcLPkYbaoHhA7q3X19KowSXxv
         UjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781720552; x=1782325352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU8WLfL9ol8T2I+wsG/JnY3QPzDW69qfeYGIA3+5jro=;
        b=GEukiTBfU5mQLa1b8P9tq3YVxAvA5GCGct23aabSjjGA8KSRb8klTx22W4WCQ7+Fu5
         7/TV2d2cA98BTllYjKWcvG7GPustIdaKIufueeP1EkyyJyMbEzu4XF2QCOnUGtFX0jsO
         crMsIrrnwDT4c3fMyI8h5JUKfTkQHxbMsAykvTNHhlgZCO8CtmsxtnvaqGY6RaF2umSy
         KDSu9z5mqzx6PAMlBR0aIoUBtA6rfYNLKs/0eukJJWyWsD9oTHAyej3EsIIxJZboqKND
         isfDhIzUDNJvgXuzG/9HvqmRLXeYwDy3HccfvIMvnI1leucZSShlnQMGYDWLDnuVEvsp
         tJ6w==
X-Forwarded-Encrypted: i=1; AFNElJ+58duhrMNU278wDjd9WJ6AqxVuwGKwFyRqkg+0U3xCvLvE71hFdakWSXye5SmWv9tohJtsWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvCCo4NBl9c2Fe3EvBhCabXclGVdoQE0j42HCif/+gfyeDb7G2
	kE2SxvVhNo0qxrFoXeyS8z8tgST70jpWT/xNEpAd0FQ338LRj4nJI4mE
X-Gm-Gg: AfdE7cmnQ95aeTSrUYh5+mNKK6hDAU43u3Wy8b0wsEdl7lODUHHrlh0XAfwHUbEXKij
	VaiJbQTbucZV1pkXZM01gbU1HGfufiY8fbpeG58pxbEanOX/CR2OsE9o9crc7ZmYthwPO1Huk8f
	43/6PM5vPyAvdBmEBe/WgeepEaWsGfWrw2z+De+t860DGHi8ktAGtjKMqei5Hh8N7/mzubztoal
	4/Z8TRwsNlx87aj/7AxDqDrDzJiEhbqCqASR+LBnjMlelIbVD1Kgwcel8ly4VC45NcVVTxZ2DM/
	+FRhuTq3xesmQQjO1+fWs116lrL4//DiS49QbHgx9woLAd4tO7cfNFHj3N7ZbJuvyLd2np6FLgb
	pzRhCRd66qwgDR7DbKwYR/cgAgPyhKycdxIVCGtEL57zbO5QAQdYXGgiijH8atVPjjv2CwsXtne
	tbruvYiA8QiR+jbjwLU0dgc2D2Q5x4T9hU
X-Received: by 2002:a05:7300:2209:b0:304:acc:f079 with SMTP id 5a478bee46e88-30bca09e535mr2706232eec.27.1781720552504;
        Wed, 17 Jun 2026 11:22:32 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1886:6b7a:3e78:272c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd23401ecsm3160992eec.25.2026.06.17.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:22:32 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs3: initialize err in attr_wof_frame_info
Date: Thu, 18 Jun 2026 02:22:27 +0800
Message-ID: <20260617182227.965603-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attr_wof_frame_info() may reuse a cached offsets folio. In that case the
loop can fill the output offsets without calling attr_load_runs_range()
or ntfs_read_run(), leaving err uninitialized before the common return
path. Initialize err to 0 for the successful cached path.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index e61c5bf7e27e4..c654b3cc1e91f 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1516,7 +1516,7 @@ int attr_wof_frame_info(struct ntfs_inode *ni, struct ATTRIB *attr,
 	u8 bytes_per_off;
 	char *addr;
 	struct folio *folio;
-	int i, err;
+	int i, err = 0;
 	__le32 *off32;
 	__le64 *off64;
 
-- 
2.51.0

