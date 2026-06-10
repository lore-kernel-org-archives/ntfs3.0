Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2C218E025
	for <ntfs3@lists.linux.dev>; Wed, 10 Jun 2026 00:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781051380; cv=none; b=C0zd4mh+ZcCgdmGG/MTfe1PQMhcmuJ3kXn95mQxaB7JcnggpWnFgQUshbimx1mH0dAB/Y07Li/ZSMHRGIyfPratKKUkpq1YkgPRtC6OWQEfFtzziIUWpqPVOFxY9iekgp/Id2Hv3bpk9AuFpx2kkUkjEQbT4Bu/Y2eXyFcuT2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781051380; c=relaxed/simple;
	bh=2nFN7WTPpACmN91W8QFAjENpO78Wy2RwChAJNyg7Oho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=AVDDotj8eWnabXfU8tu9x69SMLKH9Dy54a/DFJ5cl1r/gEuuvvuSHgo9tZjJb99LRMZ5QMtkp2i5TLfouHLZjfXStCg9CXVxHzjCovdfMbcT+GUM2IaXD2vz5YHzVeL9dBEKs5gJ1zwovyLQeYAg7FmVxODw3QD2TbfVcKUZj4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5TOZLI8; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5TOZLI8"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13809223fd4so5856355c88.1
        for <ntfs3@lists.linux.dev>; Tue, 09 Jun 2026 17:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781051378; x=1781656178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEGoHkIiRTyrd/uDCPxv8ZbYjS+OjpBwa+mjTRIZIf0=;
        b=f5TOZLI8Kx5+uSCfcc4xK9dUMI42LbwBaBuM6LWmJsoO0vamAhKiEMV4ORmgzopmdQ
         UoiqaW8+asLPC0kSpZt///fqlcjsPZ+ni7HIy96LGKyiDbNA0Gw2Kolc6jsn18NxHgSO
         I9slZwctQN+C1dEM0h2YTdmqEDqnCop+uzsw62s98Y9PtwQJoRmq5NtXZCKMB03Epm6+
         8MNWYIxpLZ7G8zdXiF3gMsZJ7dolHvl0wg8gb+SuVrbMYm2agoqcBi71hybeoyBRXiyi
         l3KVU80maCibhpnlrXp8P4HQusENxtFRtDaDcpL2gOesobWryEg54i6JA1Bk+ykzfT0e
         PqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781051378; x=1781656178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEGoHkIiRTyrd/uDCPxv8ZbYjS+OjpBwa+mjTRIZIf0=;
        b=Yyc1gX6Dxw/Xf/DE+C/iNHZOufSL5Uiw0gitAAOBYzaqoZe+Fa7ZiciUGQMFDXDlWi
         rn3pp5FFYWUyreKYUzQMUPnLGHzxH1swARtnUApPOuaCD4ZN54gokywswuCFsK3fTVOm
         tDOhaZavBeqIm6GcPbhHzQHi/YaBUdA+bKMRlGdXQPwL1chFdjbDaOCqBnGT2NcK3c3I
         Y8b+azsBx39AgXijB1y63Jb2sznsAe4BurS36vczjSg+CqCFQ/b+9XiMKcBuEB9usN9J
         3ohlBIjatmDtdD+ns4pXK0lEzI2iXiHpkLTBtOl4ktTdg5hKMGbfx2mtjceAMLCeKtkh
         4u7g==
X-Forwarded-Encrypted: i=1; AFNElJ/ud3qsRiQAKBel/qDoB+K/GL0yTLuAL1TY7sbXo9qOwWyPUqQmlYxVtUiVGzTwAAw9KbxVsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+qxyVPSfIpk5J0nWusruhwVQDgqKJy0A0Yf0VIH4q8bO0LmMB
	LUfx/JTSXyFnDqHJiIaSHkOboqaqNK18RBcl2rphPx4cE1YCuNMXZGkA
X-Gm-Gg: Acq92OEQLYZpX1kFaILdlw4iPwdHUmwDEUH+/YCvmUFhzTcP7Y0tNT8SHtH86NAPcvZ
	3/FsBAs9HS6sfOo+r0D6cTvZAGU/zsYB7OeBYvxASiIwO4/FUP0S+kzt587jAcJiSD6yP1gs6yX
	OYSWJY5OybjzTV9KFEHf7WeoLJBeuB1iOK0AV3G5JRg0MYvei5Q21hk5lBE91O8e75yB5pJPKIY
	sF95t31fuWhdlXJB0PzNSH6Rpxb3mKQs0m6Go6NQQ1hTXImFeUr6XOcqWq6k1EcBTyWnuo2O8HH
	aMx/2yuNCi+RbUhpYCMILhOwSm996rOy11bymItxNw3Km57CpKgZ+PTuuV7HsWcnimK7gsQLiXH
	1aWzkbczArFycIx1v0eDP6lylKGCd3Pmt0NYbAg1549o7sQgYJvBcnG+SvRSbooXDMela8bFM5Z
	Q4WHx4jSSzRdoz9urRiM/UtzURlN/oI68V4WEKbm5i1sgZUDXyFIX7CORgtcVagV4=
X-Received: by 2002:a05:7301:2923:b0:2d8:7302:d3d with SMTP id 5a478bee46e88-3077b38bab4mr13330783eec.8.1781051378221;
        Tue, 09 Jun 2026 17:29:38 -0700 (PDT)
Received: from localhost.localdomain ([192.197.201.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm21605199eec.10.2026.06.09.17.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 17:29:37 -0700 (PDT)
From: hewei-gikaku <skyexpoc@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?HE=20WEI=EF=BC=88=E3=82=AE=E3=82=AB=E3=82=AF=EF=BC=89?= <skyexpoc@gmail.com>
Subject: [PATCH] fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()
Date: Wed, 10 Jun 2026 09:29:29 +0900
Message-Id: <20260610002929.51765-1-skyexpoc@gmail.com>
X-Mailer: git-send-email 2.16.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: HE WEI（ギカク） <skyexpoc@gmail.com>

ni_create_attr_list() allocates a fixed buffer of al_aligned(record_size)
(== record_size) bytes and then walks every attribute of the primary MFT
record, writing one ATTR_LIST_ENTRY per attribute and advancing the cursor
by le_size(name_len), with no check against the end of the buffer; the
total size is only computed after the loop.

A minimum-size resident attribute occupies SIZEOF_RESIDENT (0x18 = 24)
bytes on disk, but an unnamed attribute expands to le_size(0) (0x20 = 32)
bytes in the list.  Because the number of attributes in a record is not
bounded (mi_enum_attr() accepts arbitrarily many equal-type, nameless
minimum-size attributes), a crafted record packed with such attributes
produces a list larger than record_size and overflows the heap buffer.

This is reachable from a crafted, loop-mounted NTFS image: opening the file
and adding an attribute (e.g. via setxattr) drives ntfs_set_ea() ->
ni_insert_resident() -> ni_insert_attr() -> ni_ins_attr_ext() ->
ni_create_attr_list().

  BUG: KASAN: slab-out-of-bounds in ni_create_attr_list+0xc48/0x1058
  Write of size 4 at addr ffff000008984c00 by task setfattr/345
   ni_create_attr_list+0xc48/0x1058
   ni_ins_attr_ext+0x510/0x7c0
   ni_insert_attr+0x3f8/0x70c
   ni_insert_resident+0xc8/0x3b0
   ntfs_set_ea+0x66c/0xd28
   ntfs_setxattr+0x4d8/0x5b0
   __arm64_sys_setxattr+0xa4/0x124
  Allocated by task 345:
   ni_create_attr_list+0x188/0x1058
  The buggy address belongs to the cache kmalloc-1k of size 1024
  (the write lands at object+1024).

Size the buffer from the actual attributes instead of assuming a single
record_size is always enough.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Reported-by: HE WEI（ギカク） <skyexpoc@gmail.com>
Signed-off-by: HE WEI（ギカク） <skyexpoc@gmail.com>
---
 fs/ntfs3/frecord.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 2e901d073fe9..6488d7a415c0 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -768,10 +768,23 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	rs = sbi->record_size;
 
 	/*
-	 * Skip estimating exact memory requirement.
-	 * Looks like one record_size is always enough.
+	 * Compute the exact size of the attribute list.  Each attribute in the
+	 * record yields one ATTR_LIST_ENTRY of le_size(name_len) bytes.  The
+	 * minimum on-disk attribute is SIZEOF_RESIDENT (0x18) bytes, but an
+	 * unnamed one expands to le_size(0) (0x20) here, so a record crafted
+	 * with many such attributes needs more than a single record_size; the
+	 * previous fixed kzalloc(record_size) could therefore be overflowed by
+	 * an attacker-controlled record.
 	 */
-	le = kzalloc(al_aligned(rs), GFP_NOFS);
+	lsize = 0;
+	attr = NULL;
+	while ((attr = mi_enum_attr(ni, &ni->mi, attr)))
+		lsize += le_size(attr->name_len);
+
+	if (!lsize)
+		return -EINVAL;
+
+	le = kzalloc(al_aligned(lsize), GFP_NOFS);
 	if (!le)
 		return -ENOMEM;
 
@@ -781,7 +794,6 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	attr = NULL;
 	nb = 0;
 	free_b = 0;
-	attr = NULL;
 
 	for (; (attr = mi_enum_attr(ni, &ni->mi, attr)); le = Add2Ptr(le, sz)) {
 		sz = le_size(attr->name_len);
-- 
2.43.0
