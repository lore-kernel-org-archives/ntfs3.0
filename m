Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5252F1EF0B0
	for <ntfs3@lists.linux.dev>; Sun, 18 Jan 2026 19:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768762915; cv=none; b=pPo3JJRm6wuy0tOSa05A73Nbt5E8iyTaUBZrfamd+qnHRObDq5lriSybOx1vNoTURXNi51EGIpBMoAYyB9sXR5DbGiEAriTz42SHn6nSZ+s2cT6ZQ/Fzd1unboZDurZe6Bmq2wKlamdBMTIKDIl8WlksXgaecAxRhwyWPjstvbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768762915; c=relaxed/simple;
	bh=nMNE6iEfpLstIa10M3kB5FyebBEQOg86SBYePsQerOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vp0MTjfrdAy0qNWpoXRS/jFKY/xzJtr46PFMroSdTukebBpn1/UF1y0Xpt+wWUA8TK7EZNHvW6hEX0tz66VCbQ/zhOJvGUb1qO+RcG98kxoHPKJPlzS3BZ2wruoWtMjtrvkDENlKb7ISbbE1omjLnxkjX/Gxrdv64PFQORwJqBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMnnOo/l; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMnnOo/l"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-404308dd5d6so1516111fac.1
        for <ntfs3@lists.linux.dev>; Sun, 18 Jan 2026 11:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768762913; x=1769367713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNjMslMWG3mKls0Rz/DOZ4WWtAb1rKfHE/u7ZXd1FlU=;
        b=gMnnOo/lW+t2j87XPdTkGkfgMjLkPeV8NV3+dirB1L6C+xnR9YFV6iXmAFFV9/ygn3
         GIORJ1FAvZ48h+yDh2FtcX4oGEuVlhKFFnrqMUln7Lu/+5B0U4vt4DNrT/WZ8JKGtOoG
         07pYoVtFwAcJ0wyClBifK1Z6e7PZbOh9ehAwTUbYnajkOIfwpiyZ+NAtGiImcp6p27Gb
         4UHy21hDAEiWICgBjq5hx5FmrA34FwI5Gze3YM0yjpVNYjdtKCH1Ohakghv/xKMatUDH
         S2RVYFw9eIT2cxtaCn34Ff/zvhPti00qIHji+XtlM0C9ZXGpH8R4MipnBe08o2stB3Tc
         3OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768762913; x=1769367713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNjMslMWG3mKls0Rz/DOZ4WWtAb1rKfHE/u7ZXd1FlU=;
        b=cxEz/YwgqbLUzZRnsfs1Q5PIeLvikHiA84i9S3TsFZ9kavH8JbLAmsfv01zalC/n4J
         uOHOkMUKvPDkVs0yWNAJKYHyIAd9Nqa5twMZVDsFjDQsyM7rTRzoLzUsz5F9L7FD+I7y
         ZKErPCyoymwehDxNIbv9bQxSHCp3awjZCrrYh83Kxa0bFSxI9YjguJ45EpGtBj9bhvSQ
         UMI3F/H+xyRyYl/+OZRcWXvUZaYOUGs4TMctQe2f6oqi7gQiGvkIHwTLIQrg5cX89tE+
         dKDNXglrg6kbEZ8Scw5+ANO/ncbtuR0Q8cMJoy+gGfNCyViRMQY2VA5OjROCq3Qz/Lnl
         4vAw==
X-Forwarded-Encrypted: i=1; AJvYcCV2QzIfjGI8hyywM/2cB0vOvxhBJi92TM8P5gboQwAoXnlLdvq1jrdnttyvEAhXziYF6lA6Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJyjZtwbIknCKKHFjg8YlV16SF1Q4hrGgw6HFhLcEgkUBsUOD+
	/20cnrs8vNM+AA7EXtIozTNreTomNf0iHgfuO8iekoI9nTMzDcKV6XW6
X-Gm-Gg: AY/fxX7baH0hmrKHJRvg4O54QFtZrKeimjGSkOTlhGboPS6UbyuWgSWaVJ7bGoIP8Qm
	eklGV/LJOLDB+APwJrgRo/CojG2o0i73psdw3YuJOxlISH29LKGPfTL72U4RV/J9U0xvZytWmF8
	wwaYGNi4G6HG5jsBmwrqR+SSAIKg3U0ZI17zc92/Dc4ERUR+ksgieBTzHaHODEjauBccFcx0SkD
	7y0h+knjZPv4w+QjFOVbEeqdIK3ZnQxlqgvzA9yS3xPapjlccbx73C5fnnCQTlFrhTz4cEgrHf+
	Ste7g76HK4oUBXo4hbNX/0sQk/QVg2Ygc6vyMgP7IhsuJADpA69SOM06sFywW74/xPX4jND/ibZ
	+gIOct5aX8Lc8QXAA9UAS9H+vKyhcfzueE2//Ac0ymYLcwhzRwT0vphHmgp5p1HPR1JG9I0U2YB
	f0ioy7ZFNfWjWuvjk563tU5m9f6r+Pxn5IUmH4BFJIL/I=
X-Received: by 2002:a05:6871:3319:b0:2e8:f5d6:2247 with SMTP id 586e51a60fabf-4044cfc720cmr4766960fac.32.1768762908380;
        Sun, 18 Jan 2026 11:01:48 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bd14883sm5530224fac.12.2026.01.18.11.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 11:01:47 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: markus.elfring@web.de
Cc: almaz.alexandrovich@paragon-software.com,
	jiashengjiangcool@gmail.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2] fs/ntfs3: Fix infinite loop in hdr_find_split due to zero-sized entry
Date: Sun, 18 Jan 2026 19:01:45 +0000
Message-Id: <20260118190145.41997-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <65bf90b1-8806-4f8c-b7e7-d90193d28e88@web.de>
References: <65bf90b1-8806-4f8c-b7e7-d90193d28e88@web.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hdr_find_split iterates over index entries to calculate a
split point. The loop increments the offset 'o' by 'esize', which is
derived directly from the on-disk 'e->size' field.

If a corrupted or malicious filesystem image contains an index entry
with a size of 0, the variable 'o' will fail to advance. This results
in an infinite loop if the condition 'o < used_2' remains true, causing
a kernel hang (Denial of Service).

This patch adds a sanity check to ensure 'esize' is at least the size
of the NTFS_DE structure, consistent with validation logic in sibling
functions like hdr_find_e.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Add a Fixes tag.
---
 fs/ntfs3/index.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 7157cfd70fdc..da6927e6d360 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -577,6 +577,9 @@ static const struct NTFS_DE *hdr_find_split(const struct INDEX_HDR *hdr)
 			return p;
 
 		esize = le16_to_cpu(e->size);
+
+		if (esize < sizeof(struct NTFS_DE))
+			return NULL;
 	}
 
 	return e;
-- 
2.25.1

