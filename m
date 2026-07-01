Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDC3644A3
	for <ntfs3@lists.linux.dev>; Wed,  1 Jul 2026 06:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886500; cv=none; b=fqpR8qNEvBSvps96SLzom7nsf8e+qU6a+iPNKR2opc4Sy1aUF1qBzl6uo8epHkAPwLRPO1jhgA97GuynR2J6ILZe3dfXq4W1+oOX8qIt7KaFvAFqtRFS7Zro7PG5kUaeY5UHquPHSEQk8j6vWwxlP3s1dY4oY6xr2n8IkgH18os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886500; c=relaxed/simple;
	bh=GJP98EV+veTFe7WjANhIl1B3X3ddxB1txLcb7zkZCp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VVKr6yJapJ69xdOCA4mxt5In4CPeRq4T4cTIxxxd0MObN8bDbNGJ7/WU0/REr/paXpOtUOgu7P/jEZOvp6sceLPgKpVvIch76q3ZAY+igDuwmyf176cbztisQTlC/kbDwtNz1X83c3YcDCWCe5EhJ3go5wl4aL9eR4RnLVqEoV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBMWju2H; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBMWju2H"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8894387780so97579a12.2
        for <ntfs3@lists.linux.dev>; Tue, 30 Jun 2026 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782886498; x=1783491298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5v0WCYn33jqasEb5VZCoGdVULHWHEhVL1UfeqcpOV+g=;
        b=CBMWju2HTucNctX6iJuQOkePI1vzvrt13NnD8eSHnC7QlrdMopgaIbc2Z8tRcMY6P7
         CvkqmvnL/jfSG4a1dVBLbuPnznw0CiJurpu1GsanLXq31FQf07bgYqlwpkX0uU4xzkjL
         5bKpzWs9piQzvsaTH1JJ+puDHfnR4wfqkQTfIWxYDu0UqGi2ffumapgP2kIGPxX1OyGJ
         FOWA/D9RrUbZF34Nj6VUDFjZl4F/OW2B6NynSuWvKY1+4Nxya1NE74DjiTdIe18tUU0U
         pdnSCduKp0LEOqzwR/eXxCyzepM03gkWbJvPO0KNgkGS7GnfoJ+gRVSJL5IDyWGNYrGm
         bFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886498; x=1783491298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5v0WCYn33jqasEb5VZCoGdVULHWHEhVL1UfeqcpOV+g=;
        b=k3VeB7UN1/DlOrdG4n0paEirSNcrjuZ7x2+GvGoDJiiBTGX7oX73SpSi3tGJ2hiVuK
         1ShvqMnCvVWOzR75uv9ivMS4xo+OdBtYTEoOppOubr1Unh9YaeACTWlhzADD4177q1id
         4D/njVl3dZj/KwWWExPgP7xHnMH+V/qfV5VmOW2gQ1UcAFyXyGPF+Ev422kmdoKTTg+3
         Fvdv1DFNL/8I1W54N1Ojy8A2wboio/3yOGSmkkpK9BVeoCoNOFCTQ1HbY31nrJII3rgS
         kmkEkcbWFBYNPdyg5VIi0xpscDV9ldxAQN7azv7i5VAsd9Y3Ht45Qn+bKsnU6oqGo7u4
         YWxg==
X-Gm-Message-State: AOJu0YxzBdt2fOYRRlbxGFY09EJMFm2bkn9GoqlPGc6bkZYcCISkSADL
	raEFeJuLjbSipDOJE4CYrmLmxp34Xhxnis95YbTwEUw1jz4IXKucW7b9
X-Gm-Gg: AfdE7cmqntKnVGpA68tUGttTdFLEUM9/SzKg0xc07DEQp0HQknFqutw+qtzafFnz8oP
	t3kb6v2i+9VZCDnFSiWTjArDMUkJtFZg4PLNFLrnYL0kSbd1IXArDHYv33jHzSvswQYaT3g0rWq
	WSXC8/OMK5oNmRRztmLNJStkR/B79n0xTyB2ZpKZOvXQdOI0f2noPbnJC1awN7zUyud1UzvJ3No
	ZF316072rhn2A7BR6Bygc6jrFe66mmauS/iiHN3isTL44O5QDfPMg1rg5oINR+UnFIGHqRYc83w
	MftQFpYP9BkpVnJF18EyCdK34EsKUjyWdyOFvOQVWh+PPiEwL4qxVCtF2zzUHglnZ4WMbysAyLV
	8GN+pVXuMngjISogod4V9c62D/p29koSZ9FZjq5qJHNWc7W6mDqMvHcX5LvWdVlbppnII/I/P7D
	iVmY+JPZcGq/c5rejBSe7i+o6Dd1+GxhJC8w==
X-Received: by 2002:a05:6a21:60c6:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3bfed448c38mr382611637.43.1782886498436;
        Tue, 30 Jun 2026 23:14:58 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bc011254bsm2681873a12.24.2026.06.30.23.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:14:57 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: fix valid_size not being updated in attr_allocate_frame()
Date: Wed,  1 Jul 2026 14:14:51 +0800
Message-ID: <20260701061451.385659-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the end of attr_allocate_frame() the on-disk valid_size is meant to be
updated to the value passed in via @new_valid:

        valid_size = le64_to_cpu(attr_b->nres.valid_size);
        if (new_valid != valid_size) {
                attr_b->nres.valid_size = cpu_to_le64(valid_size);
                mi_b->dirty = true;
        }

but it writes back the old valid_size that was just read instead of
new_valid, so the field is never actually changed even though the record
is marked dirty -- the intended update is a no-op.

In practice ni_update_parent(), called from ni_write_inode(), re-derives
nres.valid_size from ni->i_valid on inode write-back, which normally masks
this, so the visible impact is limited.  The assignment here is still
wrong though; store @new_valid as intended.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index c621a4c582f9..d6801482feb2 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1977,7 +1977,7 @@ int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
 
 		valid_size = le64_to_cpu(attr_b->nres.valid_size);
 		if (new_valid != valid_size) {
-			attr_b->nres.valid_size = cpu_to_le64(valid_size);
+			attr_b->nres.valid_size = cpu_to_le64(new_valid);
 			mi_b->dirty = true;
 		}
 	}
-- 
2.43.0

