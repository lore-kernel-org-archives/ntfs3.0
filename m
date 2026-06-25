Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F74225416
	for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782360073; cv=none; b=M9wGoTQKZ/ZgtV7UWVvcpNVXQIVfJAqqsjILg4WPZ66Tujjj7+PhcNC50r5iFNY3lJuSGfOqEENj0jajxc0c8biXSg+ZMWzPPRSllVlSCYdW7vZ2z3E3X8G2tQJXkxgdwnTzsoDU/B0w1Wf4XUZ2hTArpnAkgjv7dGpUHjDkR90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782360073; c=relaxed/simple;
	bh=8lgjXnHC+R8rd6QvlTlcWKmTiAZkvg82N1eDc85A4Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IufUGqWWN+s1D+CcjzCMWzqfQrqFMY0I/k+/Pq4BUGhlqzVxILHze2IT3jpDVhUNJKBLdcvAZGKNmOcpZj4VBgJ49IEogI2hCLYb8JDz1RdfExog98aQVG1tqrsmcf974hOenZMk5uFuNQbyCGvdmpkuNvtKn3/FHmX6W+J/XFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK66AgEt; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK66AgEt"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30c6c8d7503so4014710eec.0
        for <ntfs3@lists.linux.dev>; Wed, 24 Jun 2026 21:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782360071; x=1782964871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvXshwkE2Fi1VZ/yJhFDR9Y1t/o2CZ9mT65d7Nkx+jo=;
        b=bK66AgEtDzE4199JRmYyYerFQTCkXrk2ykxMGcyoDMEVVnf7OHl8F+hvCH6L15MGKv
         gF2hy4lMfb5I+/WPRxrDjXmvjvp7nh6dMTL1vTzB2s4Ur+IDK/lFSgFKNMg46Gl43vEj
         lofE+F32DL93WrCX+/hVkbi5+j3/ZZQs6E3OMaitp09b/2guOeFyTaX3NlCHzx5IoJQ+
         X6vfCBpAOJWjPHGXw2P9iywucT/Slq8IblWScqEyLeX7f0ac6RsMizPRZva4MMMyuP8n
         jdAyjI8biGjZZ3LQcMp/0qceO8ctqt7UvI9DXg8lDK5avG7Ok/DJZUX6mJuLbN2qM4VI
         66Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782360071; x=1782964871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvXshwkE2Fi1VZ/yJhFDR9Y1t/o2CZ9mT65d7Nkx+jo=;
        b=DMj4yYxYc2G849mVZEVjDV/PQllZ4edRHNl9snBaBd9lnHatsQnI/X9MAg2Bpi3+GP
         VBl1sroYPOxCTgPTDTl5MO6hbzzwOXMPFn33POs8Z4EtnOU6MDAfZKfjtdgGNscBeamK
         nvFUUKcdg4gc0x+EbZXLSiRYIicOibsvj3WMW+vuJcK6dkqHgqDjtH14Rp3oZ4OTIlz/
         uElA4bcD6chdd9f8sQHOOWpwfznXeZcr/VyhnRweLUNzCGi5pf3vkwEZb3vCzCVypzAJ
         +2BsVkM7nXVtezsufAhm/Gb8QTm3AEIwQRjNbYMN2tY5xrIslc9ohUUPXrbUUWfUInFr
         9n2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9vjbXXLfrelvKG9ed+hFGNQ6HtbIiB0XVymYUw1JJ83DT8IM0rwkvqaB4vTSarYcgAiM6Pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YylTp4uqblWm5tHZmvJUQXRYhgzp2JgTNqg8vBn/tkLp39e1D/x
	TepwJaAAL8oElZdFm5Hus4ff6E4M1lcTY5e/5a1KCqPrulBm5qY8SbNz
X-Gm-Gg: AfdE7ckUfvfAECZrTlLt6VhuSpw6oBvbtEbgvUl16yrYlpUAb9JU8rlyNbs/2gyw44P
	4Gt9MZFQIu8OWwvgkGZOwWSR0zdg2e+mGMTvEHb/fb7LpWWg8qK3x9LpDIhfKgsaF3I4vsg30Ez
	YGDvqKoNeo0oGbcf+wC6M+129IKROURizFWxwZEsQ04JEBXIQmaGVzsV9BC1cBtgLB5NVCMtrYa
	aUM+JKesqMA/bjoQweXCSeBwHjdU7BuPz9lXAaIm1ofB1kxjfv54vvcA+AzRoHOzatcvcBA9By7
	ic7oVBb9xWBzMJkiqdLcFgWd2kE8/3JsLkSUUFGK16J7Fr8ZCdYAflpPwr2ZvC2EiWYyYYV+JKc
	xbhhv8DbOH5GFNixq6GRYp+MsRpjQueWDAQpWsWqWn+F/lwbDnxSiLGM8Yo6IeBPeBRhi+wWRTg
	LX8DVzcWAtfaydA/XEiryDPz24cYiwfRgNG7EzYeyKZgodjo8CaBmajd7Q7A==
X-Received: by 2002:a05:7300:1824:b0:2ea:5057:a304 with SMTP id 5a478bee46e88-30c84d9e27emr928042eec.2.1782360071356;
        Wed, 24 Jun 2026 21:01:11 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c9dafsm4627340eec.1.2026.06.24.21.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 21:01:10 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] fs/ntfs3: validate ef->size covers the record's name and value
Date: Wed, 24 Jun 2026 21:00:38 -0700
Message-ID: <20260625040036.996396-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an EA record has a non-zero ef->size, ntfs_read_ea() only checks
that the record fits in the remaining buffer (ea_size > bytes), not that
ef->size is large enough to hold the record's own name_len + 1 + elength.

A crafted image can pass validation with, e.g., ef->size = 24 but
elength = 0xffff. ntfs_get_ea() then trusts elength and copies it out of
the undersized record, reading past the kmalloc(info->size) allocation
and leaking heap memory to userspace via getxattr():

 BUG: KASAN: slab-out-of-bounds in ntfs_get_ea (fs/ntfs3/xattr.c:302)
 Read of size 65535 at addr ffff888100794550 by task exploit
  __asan_memcpy (mm/kasan/shadow.c:105)
  ntfs_get_ea (fs/ntfs3/xattr.c:302)
  ntfs_getxattr (fs/ntfs3/xattr.c:848)
  __vfs_getxattr (fs/xattr.c:441)
  vfs_getxattr (fs/xattr.c:474)
  do_getxattr (fs/xattr.c:800)
  path_getxattrat (fs/xattr.c:868)
  do_syscall_64 (arch/x86/entry/syscall_64.c:94)

 The buggy address is located 80 bytes inside of
  allocated 84-byte region in cache kmalloc-96

Compute the size the record needs and require ef->size to cover it.

Fixes: 0e8235d28f3a ("fs/ntfs3: Check fields while reading")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 fs/ntfs3/xattr.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 9eeac0ab2b71..9097ded7d7dc 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -146,26 +146,29 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
 	for (off = 0; off < size; off += ea_size) {
 		const struct EA_FULL *ef = Add2Ptr(ea_p, off);
 		u32 bytes = size - off;
+		size_t need;
 
 		/* Check if we can use field ea->size. */
 		if (bytes < sizeof(ef->size))
 			goto out1;
 
+		/* Check if we can use fields ef->name_len and ef->elength. */
+		if (bytes < offsetof(struct EA_FULL, name))
+			goto out1;
+
+		/* Size needed to hold this record's name and value. */
+		need = struct_size(ef, name,
+				   1 + ef->name_len + le16_to_cpu(ef->elength));
+
 		if (ef->size) {
 			ea_size = le32_to_cpu(ef->size);
-			if (ea_size > bytes)
+			/* ef->size must fit the list and cover the record. */
+			if (ea_size > bytes || ea_size < need)
 				goto out1;
 			continue;
 		}
 
-		/* Check if we can use fields ef->name_len and ef->elength. */
-		if (bytes < offsetof(struct EA_FULL, name))
-			goto out1;
-
-		ea_size = ALIGN(struct_size(ef, name,
-					    1 + ef->name_len +
-						    le16_to_cpu(ef->elength)),
-				4);
+		ea_size = ALIGN(need, 4);
 		if (ea_size > bytes)
 			goto out1;
 	}
-- 
2.43.0

