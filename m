Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066F25D208
	for <ntfs3@lists.linux.dev>; Tue,  2 Dec 2025 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764673314; cv=none; b=B/oKDszZQnibuD603cBJwjTpHohMF8IqJISJCJy0aEsaJ7ZogpjywK0ESN7NzhHh2ywRrlZSZG/WYYlYJ6Gjpp4UEbRezTuS+KBfAdOqo2ZrW5qrhrvT6cZ5I4uerV90dOKt81suB2jOSrFIDniIs78Lu9mhcvop3nuU3OjqA9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764673314; c=relaxed/simple;
	bh=KSK/DnFTxMt4CXWdw7WpUlm58huTuochBw+YyHG7Xws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YipRIcLdTcZ4l6pQFXEq4ePjVw6QQdfce/YZpuxb/LreWICOz1UhvSiAn3KiGfsXEiiH3j8FcjuSRFJCSeRTHIptZUAxy/Q/lulgfyp1Kx1HfaALnM95/7Y0TDchlLL3G4HJ2LYQtHUENdXBCHT2vnMR7EqzbXNFVpYYQGahzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4PTiHsx; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4PTiHsx"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso5110315a91.3
        for <ntfs3@lists.linux.dev>; Tue, 02 Dec 2025 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764673312; x=1765278112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsASYmb2vMOkKd3Wj83tvfKA8A5xOvIsAFN5KI+UOYc=;
        b=E4PTiHsxtrO8Hu5cPqlAbQAJbOz0naRBPqY/iPEvKva5P/TN8qPKqqwH6xNWrmLqIf
         ff9S8oSzSJBcPWKNvPK+D+KCqJhzAN2/rdDt0hqlHq1DHM7/YsxQzU9NprbH8wmXk19h
         k6ZiWHGo4OH1Jmqi6Sg61cYf5M6jYewIJfzUeqXFuYigbFZZOBBXPmVzGSe4v+9NR7JP
         rqMUkWIs/0k2ok0OAxXqkorHj0LE2ucfM+ljqaWEQ54shFH+Iy5Ow6uuCLJmINAd5w7J
         U2svfB2Qbib1Fs2RBsPWo2skJe/WuUmagYNpNQF9JZYZqcz37VAko8AnNWeUZDj1iQGB
         HoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673312; x=1765278112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsASYmb2vMOkKd3Wj83tvfKA8A5xOvIsAFN5KI+UOYc=;
        b=YOO/PQEBJdf79hmghDBp53vDML84XlGNHkV05C2eux7ubZrpsg+9oOzqnoTaRBTSTz
         FRg+XqgL0eAaLi0zEM17+V/EQFTNMl1e3jGNfBV92R70uPVC0mBVOhN3Td2S8T2LakMT
         5QLem6oZiB+eUogwrU0hXd2Zgu9Fl8qU/XnzLSXQ+JdiblaeltLILYb0Jz+nQp4rr9o9
         EnElUF6oIHa/TC0I7JPrmeTBOKkGTqiZ2xMThw3WlFOJX3DxoWtI8DLsD8NNe7TsmAtT
         Tf0CkG+6xfrNi34+hvpOwI7IXgkG9q2LO41D+K8bAL/OpKrg+clHTQ/hfU+2Ufit8QzE
         2fuQ==
X-Gm-Message-State: AOJu0YyMdXtskY7Kk2fxZWO1h3l4B4nRx3YAolIBCesNroEomqSSTkhx
	a/tcMbI3wswuGcHMYdD1ednXvznD5rvgruqQBHNREXZgstT5eCqgxC1YXIFezg==
X-Gm-Gg: ASbGnctkSJayWsvzYBwYCOLQN0gAeHpGWbKBKTb0xppe+qQLMg3Lg511djcOfgVgNcY
	uP2sOR0jWYGOqfStcok6ewky8HKdaGGrrnlMsm4KXCWYTf7k2M+hMnKQ84H1+iF1nBhK8zX9yeV
	RUJzSZ7XPlfrzmlquRPmCs86e99GJ/RMgU06muA3uS9jqKw3pI0bzSCHiSHNZiCz3K6ZbMgeq2r
	RA3fNoOvtPGLbNZ/DQACMInmPWrPCyjCv2L+8Qc0boHvZMUtqh6664waDrqoTZFF5BtpR+hd29R
	oMDtqtlI4PysR6ATbPW5DRtF/tGlohQKqU2g6Q77Y3+85MLkzWKef8AaBdyB0avdmn6nzRvUCpx
	dNQlU+W4CnJ1TKRU6Wqjw0U46c+8MwfpyXwsjpcLBVMaQxgsss6CAN5FjMM3AFDczrweE2zflcQ
	MCRQ==
X-Google-Smtp-Source: AGHT+IHxC0PR1yfM2U9StSl5GJj6C8ZHWSYzDiwXzJXB71gZqdXQeyWIDgccVHU5QnCjsqnZx7vtxQ==
X-Received: by 2002:a17:90b:2ccc:b0:340:299f:130d with SMTP id 98e67ed59e1d1-34733e60971mr39946087a91.13.1764673312120;
        Tue, 02 Dec 2025 03:01:52 -0800 (PST)
Received: from OSVS.. ([183.101.168.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b74b8f1sm16239372a91.14.2025.12.02.03.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:01:51 -0800 (PST)
From: Jaehun Gou <p22gone@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jaehun Gou <p22gone@gmail.com>,
	Seunghun Han <kkamagui@gmail.com>,
	Jihoon Kwon <kjh010315@gmail.com>
Subject: [PATCH] fs: ntfs3: fix infinite loop triggered by zero-sized ATTR_LIST
Date: Tue,  2 Dec 2025 20:01:46 +0900
Message-ID: <20251202110146.1886202-1-p22gone@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We found an infinite loop bug in the ntfs3 file system that can lead to a
Denial-of-Service (DoS) condition.

A malformed NTFS image can cause an infinite loop when an ATTR_LIST attribute
indicates a zero data size while the driver allocates memory for it.

When ntfs_load_attr_list() processes a resident ATTR_LIST with data_size set
to zero, it still allocates memory because of al_aligned(0). This creates an
inconsistent state where ni->attr_list.size is zero, but ni->attr_list.le is
non-null. This causes ni_enum_attr_ex to incorrectly assume that no attribute
list exists and enumerates only the primary MFT record. When it finds
ATTR_LIST, the code reloads it and restarts the enumeration, repeating
indefinitely. The mount operation never completes, hanging the kernel thread.

This patch adds validation to ensure that data_size is non-zero before memory
allocation. When a zero-sized ATTR_LIST is detected, the function returns
-EINVAL, preventing a DoS vulnerability.

Co-developed-by: Seunghun Han <kkamagui@gmail.com>
Signed-off-by: Seunghun Han <kkamagui@gmail.com>
Co-developed-by: Jihoon Kwon <kjh010315@gmail.com>
Signed-off-by: Jihoon Kwon <kjh010315@gmail.com>
Signed-off-by: Jaehun Gou <p22gone@gmail.com>
---
 fs/ntfs3/attrlist.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ntfs3/attrlist.c b/fs/ntfs3/attrlist.c
index a4d74bed74fa..098bd7e8c3d6 100644
--- a/fs/ntfs3/attrlist.c
+++ b/fs/ntfs3/attrlist.c
@@ -52,6 +52,11 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 
 	if (!attr->non_res) {
 		lsize = le32_to_cpu(attr->res.data_size);
+		if (!lsize) {
+			err = -EINVAL;
+			goto out;
+		}
+
 		/* attr is resident: lsize < record_size (1K or 4K) */
 		le = kvmalloc(al_aligned(lsize), GFP_KERNEL);
 		if (!le) {
@@ -66,6 +71,10 @@ int ntfs_load_attr_list(struct ntfs_inode *ni, struct ATTRIB *attr)
 		u16 run_off = le16_to_cpu(attr->nres.run_off);
 
 		lsize = le64_to_cpu(attr->nres.data_size);
+		if (!lsize) {
+			err = -EINVAL;
+			goto out;
+		}
 
 		run_init(&ni->attr_list.run);
 
-- 
2.43.0

