Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D453D3984A
	for <ntfs3@lists.linux.dev>; Mon, 12 Feb 2024 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707738231; cv=none; b=KZi4de3bjZUIN6S9S28VS9EP5KnAepR+If2NrM8DII/OkxuUea2F4oGuMVVoro2Sf/v0dSm1i666EVPvrrVwCufNoU2P0WyMrUJHt7Xkp8aOJxtAW5/49UOG+xT0pBceq6bpWvuCMW+YdBivPzt8NcHEsnlcDB59rdppE6PV9Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707738231; c=relaxed/simple;
	bh=WWCY8TDoimv/wkmildyvrGmdlzFkM/c16PoBudXe0i0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AK+wlv7QI00bZztfPqS3h0zaRkTzb+xs7gBRmoejbjYkozY26mJIyCUTqPwP3pBzt9vc+xou+7n85rzuJV2C4b0YUy52N4s7R8kW6A3OIxP64sXVqlGxLQRnaiir9Q5qJHJeR8pqq3Up7TbvoYQDFoHICdB24iNyesptDbVS8i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fgQhUWmN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fgQhUWmN"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3cc8f0c97fso51300366b.0
        for <ntfs3@lists.linux.dev>; Mon, 12 Feb 2024 03:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1707738227; x=1708343027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0gAmGbUXjHOQ4ZEgMrhCaz+UWFqY0y+vvz1dd+QPBo=;
        b=fgQhUWmNHolQwhYWc++TT7c0Begc+jL1d8XCkqlLHu9qamnMNsyq2TdZ8AgX2riA3I
         GnEr7K9XNE8hosdTtjJe1kL25XNHS02FLPmky+k3zR4hTsqcoG3PNikqQHvk2ME5n15/
         XoZc1Jo/GI1kB2MtkZOe+NulqLctbDPsgYtPTa79Xrce8Ku/oYFFUafquZz6nV+RL4QV
         SNIaLyoU76xUOvT7HnJaPzaBauBBO2VrrUxlOjeH9ktfRowU8Y9JJGyekOjI8UWTSz/X
         JyRDtT/2IzuYoydituwu3+MzUzhVT7SFPS2fq1Lv0VmnlyuHYXsGmAyGEug+Pvm0iCu5
         DZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707738227; x=1708343027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0gAmGbUXjHOQ4ZEgMrhCaz+UWFqY0y+vvz1dd+QPBo=;
        b=TnGin8AxQ88TtKrEACMpqwty5dInDrDuQrBe5hgwKp0VGC1DLelbkSdFVyEGE+Eu5D
         +Woz2LqWtbRtdatQ7+8ehpY6Ey4MdQIKEkV4X4obokQKLLl13hJsZCiJcZnUWjtYrKZC
         m2fifpTZcBIxffnZrhs1MHrAR6pv4DbhUdMfgEPdqG5Es9fgU7fSEBV3U6kQzZKA06JI
         C6ei9fVNEGRB7DzzYhvvvga2M/FDUkSGbG8VA4k6ZMJngD9yJCasCnXhTzfvLBruG0d5
         JM8GrzPYOXNADZS93bulRK4spgQ+2JdY2Ee3PVzSyJC9GQ+clIr6xZY4NtU/45S8sa4B
         VgnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsihfVnLW9fDvL3kyI6aECSphpXJSz5Fa6vwZORWdA0JqtFgoJFpPf0X2DKyVgEYg55zXGzxAO+JhaI4e/PlF3wk66RdU=
X-Gm-Message-State: AOJu0YyF/pWkZiOh0aZ5iGtKavIdLTwf+IOTtTpLY5Cp0WCg8Y1SujAu
	jr3yDc1o9iXQE9cZD3mPkJIVnzMVTnujbuiaG++0Yk6Kv7Ey6RVk5ZFt4J7/8ho=
X-Google-Smtp-Source: AGHT+IFWN/ZOM7xCIbOxOrVUCMxIGoaKfGaNR5vMYb7mH8o/3KbZ1faElyK06++7UX9t1+PrSTIzFg==
X-Received: by 2002:a17:906:4ed4:b0:a3c:881d:8a8e with SMTP id i20-20020a1709064ed400b00a3c881d8a8emr2365360ejv.64.1707738227019;
        Mon, 12 Feb 2024 03:43:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVUxD49mn9Ht8/gvF0UKj7Yi1UxX79cnV5cETqd6PEE+/Ww6q833Uw7pjWnIdyIKNO2nQqikshCl+cJWYLNYsQeookXvppAeok/uP92E0AxjBEsT400RhngsINtHoah0LJ418=
Received: from raven.blarg.de (p200300dc6f267100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f26:7100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906370d00b00a3c66ac5146sm122119ejc.120.2024.02.12.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 03:43:46 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/ntfs3/frecord: don't define i_size if NTFS3_LZX_XPRESS is disabled
Date: Mon, 12 Feb 2024 12:43:41 +0100
Message-Id: <20240212114341.1736547-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes compiler warning:

 fs/ntfs3/frecord.c: In function 'ni_read_frame':
 fs/ntfs3/frecord.c:2460:16: error: unused variable 'i_size' [-Werror=unused-variable]
  2460 |         loff_t i_size = i_size_read(&ni->vfs_inode);
       |                ^~~~~~

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ntfs3/frecord.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 3b42938a9d3b..5cac06d27bf1 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -2457,7 +2457,9 @@ int ni_read_frame(struct ntfs_inode *ni, u64 frame_vbo, struct page **pages,
 	struct ATTR_LIST_ENTRY *le = NULL;
 	struct runs_tree *run = &ni->file.run;
 	u64 valid_size = ni->i_valid;
+#ifdef CONFIG_NTFS3_LZX_XPRESS
 	loff_t i_size = i_size_read(&ni->vfs_inode);
+#endif
 	u64 vbo_disk;
 	size_t unc_size;
 	u32 frame_size, i, npages_disk, ondisk_size;
-- 
2.39.2

