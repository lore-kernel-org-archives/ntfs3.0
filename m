Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20825F994
	for <ntfs3@lists.linux.dev>; Fri,  3 Jul 2026 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783117417; cv=none; b=grW98brUOCe5ncAf8Er7feOdNqc5bw9ckZ8plf2g2L+2HAcksrkN6t4oi1n+A42nGrakivDdUzTMnRRGzMS4GVv6Se2SHRKtR6jyyZ0/kOgDQAeJbqnPeqzEKmio/CBgmLk4HYcmYFgFdvYu2WVdV1f+mNqaWY83hutUWa0df4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783117417; c=relaxed/simple;
	bh=2D3XGUlwVZW00eMlzle7gzXP64x8TCutNOJpjvlqbUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H90XYEf6pEvUQAYjCmeuwJCqa2ST4umZRiETLyZXeM5K1j07GZvtmAqfSUN2ltdThAVelLE51ZhNBYOykvGrjRC7SCjkeSfmroe5DXyDAYOz/kUCG/hoy8en386NoQnFdxpHJYQEI8CsnR5bds8Tmd+EBlB0sLPlU6K7j2rGe2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=C8x09QyP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="C8x09QyP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842358aaf36so512065b3a.2
        for <ntfs3@lists.linux.dev>; Fri, 03 Jul 2026 15:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783117416; x=1783722216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+vTkdbSXPjSdgLA8x1Ws1Zl8rwmKCRXfmB69wKCqSA=;
        b=C8x09QyPH6RWmZiN7ecAMlf+M7ILKEGWuK85RZV5S1CQjFQJx87BscWB0rRzemCQ89
         I4Nay/Thp6WuW5AZUQZLloDHIVh08bVr66cnNvHHWMQcuD0HETugbmDbPK3g4/4pD2z4
         lhEq7kbHmITqQwXKT2OGBvGnHYMoZj1IGlo24Ce0xgBxNyCsysWYbEzFTTh7QgJ5nbgm
         H5vxx3KC/D0TbdoTGA+JbBmpmKKRK2WrfAGWHksTL0kwg5FN2L8O4IrEbUx9jtmo4o+1
         3vEZmmj5PgrlrLxLZISGaSvgb00DbM3zjJpad6WmO/2vsVpFVdCsmmWVu4sMDfmoXMmf
         27oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783117416; x=1783722216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+vTkdbSXPjSdgLA8x1Ws1Zl8rwmKCRXfmB69wKCqSA=;
        b=pVVIjB8djpiFWxzl/liWsKMCgTVuBPoayNONanuhLVTtxyiSFULLqNcDSFJ7ZwJ/A1
         oOrVPv/GYGF8YV9sGcFDPwBAoeXc67AWvEKd5ti8VbVMrctr/FaxZzzKKNoqs5boSOxQ
         iTi2UictZq3tKUe/ZzzQrI5y9wqrMI4RChN/6pl/fMn27TDZmYtCLpAkt/TUrD6NdgFu
         XxOC72bR+h5phl8hbfk6dJtY7QViMP7sE5gHxsAyBxlhBo0Pc6jRZD28Q3p+08n6WQw+
         DAxk0cmfa+Nk5T3gJ75dzYM6KWlLzkQ5JUXvDCoMXfMPfQW7j73t45bsuJy4cckII95j
         GPvA==
X-Forwarded-Encrypted: i=1; AFNElJ+Dl9RMp/uogp51+hiYx3ungCaEpLIyYdCt8LewIDGIBZkcuguUlp8o6Ckd1PFjuYuhs5kx/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6kSEu3Jne8C73I2cwV6E4ArTqtG4aE7Y5fEH5XAUVsPmmTAxD
	whJSRmy6onRj0QaT+etE9eHsH0wgA2pNcxgu0fDOLHq9sTAXdT1uSTd3aQKkPRmiAQ==
X-Gm-Gg: AfdE7cmy+gvUhbo+U+83UuwEaf9sxnxIABHXQbnIaVZ/b3AWPmS0pG5XjJlRDj5JuKJ
	jFB56QP2RMGRYrR/DW2bIVYeC6kZt1eoV74pkGUmRpoQXbO46OH+9N72oi53iFSziQfa7Wjl6pZ
	7X5Zu2JodSxbE/Z2IGvHUrx6zVp8KkkgR95HoOTvTTY9sIYSQYAnP1Wtnjl16egq8dmdwchShkg
	szuydso9Bl3RGgSSz/w0luGlhnEunkk9wRjs20bpyED3djrs1giZLno65/0rBWsNAQ2YHalC/Kc
	8MPwEzhvPDmaSY+KgXAddRLdQh7G+PsFCz/a8W/7FMWoXflIMEwJXx84zPSSvCohuHQuh6ObZOn
	tVJe60vzqLreBJYoga3VS9/1MO0JMqlJVA91yJuKXKLdTFIPbU3JiR6hCWiAOH9g/V1i2WbNZ6Q
	==
X-Received: by 2002:a05:6a00:1894:b0:845:d286:1fb8 with SMTP id d2e1a72fcca58-847f6fb2c87mr990757b3a.54.1783117415764;
        Fri, 03 Jul 2026 15:23:35 -0700 (PDT)
Received: from p1.. ([2607:fb91:150e:5967:2305:366e:197d:e318])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b64faesm396027b3a.10.2026.07.03.15.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 15:23:35 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH ntfs3] fs/ntfs3: validate EA entry layout against ef->size in ntfs_read_ea
Date: Fri,  3 Jul 2026 15:23:33 -0700
Message-ID: <20260703222333.94030-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ntfs_read_ea(), the ef->size branch only checks that the declared
entry size fits the remaining buffer; unlike the zero-size branch it
never verifies that the entry's own name and value fit inside ef->size.
A crafted image can thus present an in-bounds ef->size with an arbitrary
elength, which find_ea()/ntfs_get_ea() later use as the memcpy length,
reading past the allocation and leaking adjacent heap memory:

  BUG: KASAN: slab-out-of-bounds in ntfs_get_ea (fs/ntfs3/xattr.c:302)
  Read of size 65535 at addr ffff888010770b0f by task exploit/142
   ...
   __asan_memcpy (mm/kasan/shadow.c:105)
   ntfs_get_ea (fs/ntfs3/xattr.c:302)
   ntfs_getxattr (fs/ntfs3/xattr.c:848)
   __vfs_getxattr (fs/xattr.c:446)
   vfs_getxattr (fs/xattr.c:479)
   do_getxattr (fs/xattr.c:808)
   filename_getxattr (fs/xattr.c:837)
   path_getxattrat (fs/xattr.c:876)
   do_syscall_64 (arch/x86/entry/syscall_64.c:94)
  ...
  The buggy address is located 15 bytes inside of
   allocated 20-byte region, cache kmalloc-32

Validate the name/value layout in the ef->size branch too, bounding it
against ef->size, as the zero-size branch validates it against the
buffer.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/ntfs3/xattr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 04814dd29375..259d7f53b77b 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -155,6 +155,11 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
 			ea_size = le32_to_cpu(ef->size);
 			if (ea_size > bytes)
 				goto out1;
+			if (bytes < offsetof(struct EA_FULL, name))
+				goto out1;
+			if (struct_size(ef, name, 1 + ef->name_len +
+					le16_to_cpu(ef->elength)) > ea_size)
+				goto out1;
 			continue;
 		}
 
-- 
2.43.0

