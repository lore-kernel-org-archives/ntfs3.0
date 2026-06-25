Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5928C009
	for <ntfs3@lists.linux.dev>; Thu, 25 Jun 2026 03:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782357581; cv=none; b=DmzGiHPpwsrNMyR0GEo2R60BMOAeNFl7Qm644KoLTrg+GQuwdDpZ87KibZitCKnrhgsCwg00BDYgfQbTvUtHpFPogy2K4Q12XZTIkVRsg1FM35KdekGrRQVSck8BglRHLWJ55SecvUl4lVkh6r0ho5UUXPaTFCKWbUtnH/rNb7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782357581; c=relaxed/simple;
	bh=ocAdWgVVI9eKE6+SQhdNnJ3AljxoIAnRJT4HyGiFT4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fDnzRgdlJkBtrTmkE3+EzASDjO8pPz62KsiK3CEy1N9vE1P+bTYiqIs0p58gt4d+5NsUNtcIQeiQCQm0ree87gPF2csmjYYwPPIoDav08a75nsNd7UOGdSUwFqlLP8WVtcn618XUCTPhy64bThdur0G7KRDIT6gonx91jOJ1Kwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/6f2oVw; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/6f2oVw"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13986d61b4eso1434975c88.0
        for <ntfs3@lists.linux.dev>; Wed, 24 Jun 2026 20:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782357579; x=1782962379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uY5fzMvXX5YHwz0Ydg9UGDt+EYXOYezLqMeVC2OApGU=;
        b=p/6f2oVwYswfKUCccwSJmzu/ubvPes3ZqPlLQ+sfns11S9jnh7FirwSuiM8cEtMfBh
         b/J19GZqsh9HSuwfbFNmYJ0zEAtXm1sr6Lab0ITbSDCAQxyCJiEocNoikME8Bpeu7/AI
         RNpW8S6PbXvHolX5sNwLDke7pCp9KEFU+dqejzsJF6tVDAM+5ikUhsoj6o3jrdiZAw3t
         gT+Zk7+lcSukxHh9u1a2VFFPo/MOtLzYZbrpFAsqDaeyYZCzPfhX/RIYcDVaWjJZdktX
         TlWoFSdvz+T2DzgRxUYvWl5qrU4y0Six2GfSPREEarzOypxxXQL5LH4gFS0M0nZdA13O
         oW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782357579; x=1782962379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY5fzMvXX5YHwz0Ydg9UGDt+EYXOYezLqMeVC2OApGU=;
        b=tU5lr+cEJlKGKvXd1TKb0W+6g+I+RSqZ+Fkzkqhje9oSxJiFBNrCodwWDEn3OSdJUs
         G3WN7K3YL7hNIUjNlM1A3ErOqDkK9fia467T1RRbVeyZP7xetcYbTs3lIuPY1eT0P7aV
         UWGg+4gtNZrSHuo+4u6Ot+lhf56LyR6jXa84SBWvzxR59l/oP5ddtocRp0sMD0gLnySU
         gLsixo0dEEMjfcPdPebTFzMTvgT4R63Fx5BJyDv2Y+NEZ+VwClduuO2hKeriUCzqbYb/
         m7akBZiEGeuRgHv3eBqUKwdddhEL+fPGT5oMZcswGwHf+gT9+06eCimMJvjfBtYd9Me1
         bBwg==
X-Gm-Message-State: AOJu0Yws2RrhZCq19xZxTV0sbO9UlG/OzmgxaHASZT5J0VCnCeOz7rsm
	pJ1JLg2P+x1nLhZ7RARZn7OwJo2v87CCIXAh2vYRdp7IPxg+cTzJeVO/
X-Gm-Gg: AfdE7cnwEc3sNMm856th1/C1KMtbkLzXO/VhaDYhdqWid7klqas65P+p4gpbSSOcQUc
	GMVpR2MSgEk/AsIozMas3ibVMlvjD/V5ll86b5FuHalg1EjUgSGHeTqtQDv5b3jHVbqO758pD0J
	yVNIIh9dyc0ZdHS/1xRr4EVVpqS2v+mV1RoeF1Sbdf9IpH5i5kUOqoQMIYfbua5lnQ5U3vffsrB
	fZ3iYzPfQL/QJOQQabpMPd9xJL6JJMpApmPZK+vmVG1CwvDrZv7og0ibXjR0G19Y2x9WwbgcLpN
	8u3MHR7THnIAC9TKAgi3t9DdWZyWzTN2BH9SW0OALTARydwHh/azb/aaWjMal1BMURwimA89L6M
	TAt7VRDJq6cY8e+V1yMh3UV2tpEYxHBbrOxix8Y4+ipMgBjn1Wm9Pi9w6ZdY/RsKQw/vEJAN7av
	bmAsoArb8KBkD9doflLjzYpdnz2UUG58oEoY9qdie3
X-Received: by 2002:a05:7300:7c17:b0:30b:f73f:ff6e with SMTP id 5a478bee46e88-30c84b87a74mr872898eec.11.1782357578976;
        Wed, 24 Jun 2026 20:19:38 -0700 (PDT)
Received: from localhost.localdomain ([192.197.201.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c6c2sm3454343eec.10.2026.06.24.20.19.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 20:19:38 -0700 (PDT)
From: hewei-gikaku <skyexpoc@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	HE WEI <skyexpoc@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] fs/ntfs3: fix slab-out-of-bounds write in ni_create_attr_list()
Date: Thu, 25 Jun 2026 12:19:30 +0900
Message-ID: <20260625031932.9412-1-skyexpoc@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: HE WEI (ギカク) <skyexpoc@gmail.com>

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
Cc: stable@vger.kernel.org
Signed-off-by: HE WEI (ギカク) <skyexpoc@gmail.com>
---
v2:
 - Add Cc: stable@vger.kernel.org: this is an attacker-controlled on-disk
   image heap out-of-bounds write and should be backported.
 - No functional change from v1; widening Cc (linux-fsdevel, VFS) for
   review, as the v1 posting received no response.
 - Drop a redundant self Reported-by.

v1: https://lore.kernel.org/all/20260610002929.51765-1-skyexpoc@gmail.com/
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
