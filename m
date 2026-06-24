Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC850215075
	for <ntfs3@lists.linux.dev>; Wed, 24 Jun 2026 03:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272677; cv=none; b=TAQ/Jx52PVHf1FkyCeMy1X97SqveXOpydQfI20mE0ATAWh6yAjHzdaGMOP4nmWnxKvH2DKRiytv/QRjsom2NFOVztccHcrx06eJLyhA3zI4VT5cT49Ur7+MAMsZDcQ/ZIkj1JdTAXeYLY/RHo5Grv4a81eIzg8V8fOHtNXrgGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272677; c=relaxed/simple;
	bh=q25iHf+CTLzOTtX70p4T5EsLMPiZX1/QhXL5i3mo6es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WODwkfqHBeL1Smb3LB+Jm3z3vSOJfgS1rAuoerQVYjujdGonMDm6EZ8cMrQ90fu6hkML0/sE2GO10cPcOHW8trJlQ8IpPZlmBXOVHL21dXNZBYRWn7po0TVORLFSrRmHhh0Yk0R80HdOUcLlEPW0WJdIgMiiJrfwUWi60DhNWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJp/2GBg; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJp/2GBg"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37de8c6a2b6so4906a91.0
        for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 20:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782272676; x=1782877476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jot/AQTs3wic1cTjRFa2JPwvqng3r+y2tF1TTKTrEdE=;
        b=gJp/2GBgtRktTyxXubyJ9UiYga+4VYa2sETlLqkhJ0ySW2JQRNqmyszWTCXh0A+VWC
         PBmAJSpmNEmSyabt8QjKG8eI3hNTAaXLgd8osc3REsCYdvH4LNL3MGCL+rEU/EMRJo6J
         a0sweNYqyrYZ/cQIUgOJVpoEFvP6GjvxuOodxD+6n219gr8TpvUQBSZ2o6OL+BV5Shm9
         z2CHHyQDksH8SlqboaeQtPTyfPj6GmA5Igt7Fd1CXq9cTleboMCyDQ6SgteDMwGw3sPU
         D0EM8l0hbaKBZcVLSQDENB4wKDdTCFUTNhHVYOTRHRDXKxscRIQat5EzTjwrk/kwxPnT
         XM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782272676; x=1782877476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jot/AQTs3wic1cTjRFa2JPwvqng3r+y2tF1TTKTrEdE=;
        b=Kvtq34K2mMOfve65txdQlTQexuTMKucb/Q8QqrwFXfwr+uH8Ah5NlucdAeR3FkTfJi
         dr5UQbGOfjeJbe1ks9+1K6kVhz63dkZ5SWUXNKgYK9LhuB8w7nzaTfp7IvRPPupGsaWH
         limY8GfafOEaSzUYK1pur0d7uc44r6bY6/NrJpI3usRaQXXINY7tdrKE7lFagTdbXgy+
         IFH5OShCu+S9XBW2pxsYU82tbJlZ5+wQZqYUgK3XSB74A9Z+kSMJsFN8nAqVNxIvIVSd
         06aZnjbvAU3rh1D99FU/lvXqsOEAqoTiq0b2XAN/J58XhnjfPugHOEmVMt964kLZtxz3
         yuvw==
X-Gm-Message-State: AOJu0YxkzxBUDP/7zp6BDz3bP+sCqwPoW3DgrOjDz5G5xeOavAVMGKCM
	9bKeNEUa4QPg1cWdR5Bu5CQXaYf9Gxye4JiwKkDftoBKOVS0NeS6hjOV
X-Gm-Gg: AfdE7cn92Ad8h6L8iJPdl7vTNawYctzA5LJCXsaAIbUSTo3rLIBG0S/2MEc5YLiXxT7
	EGk4A+CywWQX7b8OulV/lwc+I1e2Zt4JcfuBV+ZburAypdbhW+lZJiRPlfLIwqUlb0dheGfZd/A
	J07AemrYJKj0eVpK+LrfcSxcnCQfuoGGYg+1UAV6nlQZgm6cvVBgktw4MrSuKkvzHBUtHRY6CfJ
	0e6Q3AirTtn3APblBSD9rASyZtCpVEtNSi3be8MPi/Exu5hlPwic0eTw8whgbxXAj3yji79uyVu
	K8DM05OfN2mrfJOLUj7WvUlCXMJsKKeHIU+vKGhqx7v/HiuRs1a7WkHvQGZKEcWzm+zaFa3jqpo
	nEAPTCpqsz9LbXABTyd/6BumE1OojTmMhxqvsfN0urWcrirdjZCmfqQytJqkF98qSj5HTMgmpM6
	uUqXpHh4OP9wJmF5GzowsYxD/fOJ0fbuqj5Q==
X-Received: by 2002:a05:6a21:6e97:b0:3b4:b259:6965 with SMTP id adf61e73a8af0-3bd2d099307mr1922286637.11.1782272675940;
        Tue, 23 Jun 2026 20:44:35 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc326c487sm11233637a12.12.2026.06.23.20.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 20:44:35 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v5] fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
Date: Wed, 24 Jun 2026 11:44:30 +0800
Message-ID: <20260624034430.58214-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <71e5333c-bb8a-4886-bfa1-e1b4cb8ea451@paragon-software.com>
References: <71e5333c-bb8a-4886-bfa1-e1b4cb8ea451@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mi_enum_attr(), the start/end VCN validation for non-resident
attributes is:

	if (svcn > evcn + 1) goto out;

When evcn is U64_MAX the "evcn + 1" expression wraps to 0 and any svcn
passes the check. For evcn values close to U64_MAX (but not equal to it)
the right-hand side is still a meaningless near-wrap upper bound, so a
malformed on-disk attribute with svcn == 0 and evcn near U64_MAX can pass
mi_enum_attr() unrejected.

VCN (virtual cluster number) is a cluster index, so any valid evcn is
bounded by the volume's total cluster count, which ntfs3 holds in
sbi->used.bitmap.nbits (set up in ntfs_init_from_boot() before any caller
of mi_enum_attr() runs). Reject evcn values that fall outside this range.

However, an empty non-resident attribute (no allocated clusters) is
legitimately encoded with svcn == 0 and evcn == -1 (U64_MAX), e.g. via
attr->nres.evcn = cpu_to_le64((u64)vcn - 1) with vcn == 0. That sentinel
must keep passing, so exclude evcn == U64_MAX from the range check. The
existing "svcn > evcn + 1" test still tolerates the sentinel ("0 > 0" is
false) and continues to require svcn == 0 for it, while the range check
rejects every other out-of-range evcn and thereby also defuses the
"evcn + 1" wraparound.

svcn does not need its own bound: once evcn < nbits, "svcn > evcn + 1"
implies svcn <= nbits.

Fixes: 013ff63b6494 ("fs/ntfs3: Add more attributes checks in mi_enum_attr()")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/ntfs3/record.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 32bdb034c2a3..d6ca4ac35a45 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -202,7 +202,7 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 	u32 used = le32_to_cpu(rec->used);
 	u32 t32, off, asize, prev_type;
 	u16 t16;
-	u64 data_size, alloc_size, tot_size;
+	u64 svcn, evcn, data_size, alloc_size, tot_size;
 
 	if (!attr) {
 		u32 total = le32_to_cpu(rec->total);
@@ -310,8 +310,22 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 	if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
 		goto out;
 
-	/* Check start/end vcn. */
-	if (le64_to_cpu(attr->nres.svcn) > le64_to_cpu(attr->nres.evcn) + 1)
+	/*
+	 * Check start/end vcn.  svcn == 0 with evcn == -1 (U64_MAX) is the
+	 * sentinel for an empty non-resident attribute (no allocated
+	 * clusters) and must be accepted: "svcn > evcn + 1" tolerates it,
+	 * since "(u64)-1 + 1" is 0 and "0 > 0" is false.
+	 *
+	 * For a non-empty attribute evcn is a cluster index and must lie
+	 * within the volume (sbi->used.bitmap.nbits, set up in
+	 * ntfs_init_from_boot() before any caller of mi_enum_attr() runs).
+	 * Bounding evcn also prevents a malformed value close to U64_MAX
+	 * from slipping through the near-wrap "evcn + 1" upper bound.
+	 */
+	svcn = le64_to_cpu(attr->nres.svcn);
+	evcn = le64_to_cpu(attr->nres.evcn);
+	if (svcn > evcn + 1 ||
+	    (evcn != U64_MAX && evcn >= mi->sbi->used.bitmap.nbits))
 		goto out;
 
 	data_size = le64_to_cpu(attr->nres.data_size);
-- 
2.43.0

