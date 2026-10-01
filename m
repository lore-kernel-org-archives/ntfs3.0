Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005444F562
	for <ntfs3@lists.linux.dev>; Thu,  1 Oct 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855181; cv=none; b=i2KxI1W+Fw1Nb60E/4sdWihPgZYdJO7eyIQmdY5oyMg97Q+DdAEXZTZB08z9s9/wvnZwRbp0HFdBvHwmwu7W5QZqXv9qu3xuqXJS1tKXX1+boRk7tXU/IQ3iUSymB/39yS51OaLq2vwY4oOFiG1hxiH5L++O6ek8ekvtUDercuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855181; c=relaxed/simple;
	bh=LN8QcLtCX6SykiPQKkcd8/SyWoTAU5OsH71yki5xIY0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgMbMXzCUJGqn3kgfVex/p/c9lZQHDdUN4bANt4q3mgusKR/7UBkwE+8ZH+xYMUaBATXBG+jthn1Fz4THwc81O35d+WiqdtYy8/YDeVfbqNuhzH6AZjUQgRrD4vMTHV1Ya/qBR0OMb+1wN7fLO+Y58dyabBPCymvXcXST7RHegw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=It79fky4; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="It79fky4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1790855173; x=1822391173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Q38dVRhc60HYlyW/0L+Or4oggdXSaGMh1FRI7qkKNY=;
  b=It79fky4OTZVtUiv7o0Rd7YN4D9kbzO2QldjEHyTWpU641IK3JFpf1R4
   NUAYqCLsf0o+ChG4224Mm9fZaWxT6Pizdp1xCTut+9b73NuAvUqwnl+Ub
   EBJazgHXjEZMX4ykgd9QRU90eGQeL3YHOOk0uPT03qqQfIepKHzEIPpGB
   EKX0vY/LlR9kNBtOyKz6k5JRl0sPyqM8o457T0Qv5+iy6ubHigV8XD7LU
   8V6zMJXMshDPKcmUf6q7pTHoR3EjyTtFT2umxfKuRrWG4YcAH9zKDh/XN
   rOw0vOz9oB0oHf+uWX9+yHEKWqcClqn2dsx0Y4tYHWagqFNN/MqXZBTWl
   A==;
X-CSE-ConnectionGUID: JU7MV+5rT86Z/0GW0EHebA==
X-CSE-MsgGUID: 0Kw6MSdeQ6qxCHcXVo/mzQ==
X-IronPort-AV: E=Sophos;i="6.27,134,1787011200"; 
   d="scan'208";a="30033439"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:46:05 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:28676]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.164:2525] with esmtp (Farcaster)
 id 50e4a8d4-c1d2-40cd-be46-af8e17b0bbd6; Thu, 1 Oct 2026 11:46:05 +0000 (UTC)
X-Farcaster-Flow-ID: 50e4a8d4-c1d2-40cd-be46-af8e17b0bbd6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 1 Oct 2026 11:46:05 +0000
Received: from dev-dsk-nagornyi-2b-f14a9408.us-west-2.amazon.com
 (10.153.215.117) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 1 Oct 2026
 11:46:05 +0000
From: Nikita Nagornyi <nagornyi@amazon.de>
To: <stable@vger.kernel.org>, Konstantin Komarov
	<almaz.alexandrovich@paragon-software.com>, <ntfs3@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?HE=20WEI=EF=BC=88=E3=82=AE=E3=82=AB=E3=82=AF=EF=BC=89?=
	<skyexpoc@gmail.com>
Subject: [PATCH 6.1.y 4/4] fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()
Date: Thu, 1 Oct 2026 11:45:49 +0000
Message-ID: <20261001114549.162469-5-nagornyi@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261001114549.162469-1-nagornyi@amazon.de>
References: <20261001114549.162469-1-nagornyi@amazon.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: HE WEI（ギカク） <skyexpoc@gmail.com>

[ Upstream commit 7c4841e2a62794a3bab7c1ff0540580f387e377f ]

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
Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

[ Backport to 6.1.y: 6.1.y's ni_create_attr_list() uses a `goto out` cleanup
  convention rather than upstream's early returns, so the new `return` error
  paths were rewritten as `err = ...; goto out`. ]

Signed-off-by: Nikita Nagornyi <nagornyi@amazon.de>
(cherry picked from commit 7c4841e2a62794a3bab7c1ff0540580f387e377f)
---
 fs/ntfs3/frecord.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index c9d0947651c4..5c544d24f9c3 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -816,10 +816,25 @@ int ni_create_attr_list(struct ntfs_inode *ni)
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
+	if (!lsize) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	le = kzalloc(al_aligned(lsize), GFP_NOFS);
 	if (!le) {
 		err = -ENOMEM;
 		goto out;
@@ -831,7 +846,6 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	attr = NULL;
 	nb = 0;
 	free_b = 0;
-	attr = NULL;

 	for (; (attr = mi_enum_attr(ni, &ni->mi, attr)); le = Add2Ptr(le, sz)) {
 		sz = le_size(attr->name_len);
--
2.50.1

