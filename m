Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37473F8EDA
	for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 11:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092675; cv=none; b=KiNaysLEm/IpNtKmnaEMNf1zwewWpLMnkFXdgWXxuun3D59N3sXs9X02mwDKTn1upPl1TqSek4NedA+dS8erDT9uSwaCMcnqH5TCrUroNlnW5TS3Retx0wQT4OtUeBXkgLCvoZSdyyWQeRpzuuKJqpzLLcGu2yychjN0X/xSpew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092675; c=relaxed/simple;
	bh=E1gf/cK0eXaYUala4re8eqJWzK8pok2qz6inJc5Q9b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hf6qF/v8GtVX+at8lrvcA0cEi+lCD2SXe4uy+tg4tflhjSke49jMewAAwLkVVjQOF/J9Q6PMJco4YxsOS4hMb/s/uAfWM8TNOeETisNKfAV6sOwZu+/3Ok9B/my35g18e6PGoFwx8lQvWi5jn1BYWU7/q+K24Wg4MKpVGKTBrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuG3GLtB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuG3GLtB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so44528265ad.1
        for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781092674; x=1781697474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WI6Jo9PJbir9yuEY2m2j5zC+fMIlRWudCHlrzG9V0QY=;
        b=UuG3GLtBeGyYQts1d0JSeWr9ZoXwVi9lfiEQJVnS0aUV2affUldmNmkjZWOwEu9/vn
         RO1TwdwsL4/fXNdNCvDR5+kmxmyhmUHzpPPND+ybJBsa+Tbl9xyq0980XZ06lMoYl6xp
         Gf5eV4G2Y7zeuukw8LhKM4VCK9uYwOWWCHn60NgjJLK698TVykqEw85o6y1lo9QujhNt
         J1K9/ZdAuy2U8t+inyR9MaeES8HskJo6KLMZIYE5c+h77mXqeq2M/cN4fAq/36TmgJRB
         rPdkR9a8Ca82MB0pl6Uxj5iLCBpsJ+vhVsnZ2IwVIjr2VNGg43KNMeInZT0vZ8gIxsgW
         PpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092674; x=1781697474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI6Jo9PJbir9yuEY2m2j5zC+fMIlRWudCHlrzG9V0QY=;
        b=W5/G/VaI9yRJDyiD8nXNx6rBvC2JGkRovqNNQE2gqcpAN4+cNxp0BSDmUdwkHMv8rF
         gKfJxxkAmp7zfZrgbnk9Gth8Mu2rg8NHNnGm+4wF+5yjYfNDS36H8CM5jqw2n/QaYLJ4
         O0L8beO6LU7yn8bqq2vChzaPzFGK4v9ABjnHf+Y7KmO5/ytLvabi7RGEZLllnhSUSQ4U
         DigHZ17uJiBEEVX8y4qgCs6TlaYeTjycXV3DOzsx6QNUifnn7lbdftgNmf3ELDmnD7dJ
         Tkx0pBQD5C8sBFZ6s/XxYxprHAZhQfdY+GOXNd8MjDXj1MWq91q5nOahJkei2I72+VIr
         H4+g==
X-Gm-Message-State: AOJu0YzmL6fNZ4sSvHKeLH/q+nJIX4w9bzleky7nqb3jH4qzC+2tvdEt
	YNDFuo2qlFgd6tXye1BN0+n7q06mVuU5fdsPFBcxQ1efAjk5gXYaGM2o
X-Gm-Gg: Acq92OEaL08p44iyLj9hxShX9XIA26+Yj1ig/jCWyINr+Agi6zJf0I0qzouB4QOXqN3
	SyVS9/s1+SBqvV6sGqvXjHyo/LLcDjM7ZjYs7ifmMvCSX0jz/j/viKzeyU7Sn/UfnTcCbW6jdVD
	8bAf5Q6RrsKCWrtBE1IN2pMGNYnx5WHFCPNU2xwoHZmvhZye4VmxgMbdKgA2YPHumZJVCWi0aK8
	zAyW/CRaKTrXt8qzUiK/gk1qMAYHr4yFhWm9EGiBFvhP6BcSlciA0XT04FtMa9xIfBb4pqqtKI7
	9+0DRphQ4oveyUGmek1q9UcYWQE5ZEXq62QO6Ix/PvgsNKXXCmpqws1DueKoIwJUZdxwDdmZvRS
	D8INR3361rQADed8XlQBqHbE3IXvREpPlhvXQ+LPyN7WXJU1QRYiPNW4/jr95nArHksIVw7vk+b
	2lGtUluHmY+avxvk4g7Ho/7Q6z9+Kr9fYYzgW3IeSx986aqqUjcubDiaaHIgQPlJP9mnWWNYWEk
	mdU1QyrKNeN9CiJ7qdyyhF24dGEC+rFCQ==
X-Received: by 2002:a17:903:22d2:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2c2a1cb92f6mr82753155ad.37.1781092674045;
        Wed, 10 Jun 2026 04:57:54 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d240sm258026025ad.58.2026.06.10.04.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:57:53 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Wu <weiming3@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init
Date: Wed, 10 Jun 2026 19:57:25 +0800
Message-ID: <20260610115724.1813176-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weiming Wu <weiming3@asu.edu>

ntfs_reparse_init() and ntfs_objid_init() parse the index root of the
$Extend/$Reparse and $Extend/$ObjId metafiles (the INDEX_ROOT attributes
named $R and $O). They read its type and rule fields through
resident_data(), which does not check that the resident attribute is
large enough to hold them.

mi_enum_attr() accepts a resident attribute with data_off == asize and
data_size == 0. For such an attribute placed last in its MFT record,
resident_data() returns a pointer to the end of the record_size buffer,
so reading root->type / root->rule reads past the allocation.

Use resident_data_ex(attr, sizeof(struct INDEX_ROOT)) and bail out when
it returns NULL, as ntfs_security_init() already does for $SDH / $SII.

The attribute is only parsed while mounting a crafted image, so this
needs CAP_SYS_ADMIN.

 BUG: KASAN: slab-out-of-bounds in ntfs_reparse_init (fs/ntfs3/fsntfs.c:2306)
 Read of size 4 at addr ffff88801219dc00 by task mount
  ntfs_reparse_init (fs/ntfs3/fsntfs.c:2306)
  ntfs_fill_super (fs/ntfs3/super.c:1604)
  get_tree_bdev_flags (fs/super.c:1703)
  vfs_get_tree (fs/super.c:1758)
  path_mount (fs/namespace.c:4131)
  __x64_sys_mount (fs/namespace.c:4360)

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/fsntfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index d0434756029b6..42493a2da24ef 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2302,8 +2302,8 @@ int ntfs_reparse_init(struct ntfs_sb_info *sbi)
 		goto out;
 	}
 
-	root_r = resident_data(attr);
-	if (root_r->type != ATTR_ZERO ||
+	root_r = resident_data_ex(attr, sizeof(struct INDEX_ROOT));
+	if (!root_r || root_r->type != ATTR_ZERO ||
 	    root_r->rule != NTFS_COLLATION_TYPE_UINTS) {
 		err = -EINVAL;
 		goto out;
@@ -2340,8 +2340,8 @@ int ntfs_objid_init(struct ntfs_sb_info *sbi)
 		goto out;
 	}
 
-	root = resident_data(attr);
-	if (root->type != ATTR_ZERO ||
+	root = resident_data_ex(attr, sizeof(struct INDEX_ROOT));
+	if (!root || root->type != ATTR_ZERO ||
 	    root->rule != NTFS_COLLATION_TYPE_UINTS) {
 		err = -EINVAL;
 		goto out;
-- 
2.43.0

