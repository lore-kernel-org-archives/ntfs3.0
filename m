Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6BB186E5F
	for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420434; cv=none; b=t0wW+7oPsvcfe6Ukyt4fystQ3V1gfSjNLrPL5tAfbXdnGFg4tHFRs3BptJWCplQmmwLVAB+F5zWLRZqFysTsTor7Uzl7lKaKqIjImhrKr9jGr6X96i4xDguU4hX825hBOWYUqIL0zQd5NUpT3tD+1+e/0aW0+JiN3wVo/dgwujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420434; c=relaxed/simple;
	bh=wz72NYHjcZxJeGiawhkYwpKxexrJV0qHcEFIFR/lH3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sIsw8WGmEAjYhSYB5AdRG0fcR89VU1ZJ0TmiJSc2iC/5KT8gN86md0BYD0JTwmOY5B0lceRwadA49yamjz+PPexMVXKOy/7/jO2xidflPqA4ImizXWS8CRATU4TIstJjmOHYTvdZYkPjmo3KrNehGRZsBni5j4B41fCbPgcpbV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdPAnF0J; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdPAnF0J"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-201e64607a5so14450395ad.2
        for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724420432; x=1725025232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=grxP+nIGud6o+HrmUnVvRBQHIxNSN7qIxCzexC6yUco=;
        b=GdPAnF0JzmqsY7v9vn6RUAJBqZ+2aX0XGOQ3HLy0lk+pgoE+Z9XL1YwvK09Em4qlww
         VgeNBI2/EwhstmSfjvkl3vOnygYAVfv0wI3NZApUiwrdmKbbzav0aa+V9qHlekwm1u/Q
         qKjDjOzvYsWWXcXes2c+FsQ7l0MA+ncLOvYEYJeQZAOolDan5dGBECt4pHd7lK9Jg/Hz
         p6lsPaVOjRqEJjKnjwchYPtjeH09qvfyLVRR8ggj+iZUcRymmEPvq9CbU3RUOdsh4Jpi
         xikfLJGWrJwZY0zbX/CHo94ZH10BUxYy8Js+MY6MjyCJmEqyYnOzAG2LzW5Iwc62btAe
         cLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724420432; x=1725025232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grxP+nIGud6o+HrmUnVvRBQHIxNSN7qIxCzexC6yUco=;
        b=eZk3mtRGy1kMfEDWCp3craNKe7kP//kljErS5HOHga1B8NJ8uHifgvKWO1/efIhIPf
         suV/VtT46Y4pynRCmkvb0qczDIkP4IId/TT0NgSK2+KW94TYedpYHx0UC6yRBr6Icp+N
         M+1Zt2ZZ39FVQY13wLT7VMAtnOvNk4fjt0Bcmcy5F8cOw+FAo1U5rAUTbYSspF/GbmUZ
         W18kd/9K6YSysi+27wLckuQOzis7HjIh+TLgEIYjlVlnfVoMNKiNa4Ln6nV5yx7vVTQv
         b6k/jgGmmgZsoW+cbF73pds2HlnMCz1o3u0+uny4ScNyhha6rybwS28nxCS91E5aDB2w
         +3aA==
X-Forwarded-Encrypted: i=1; AJvYcCW6toijqubacwJiVeUsPt6Muq2TxaSALmfX0TfiIJ1OsbCKox4S01CuZpamTMiZLEmS8cgAig==@lists.linux.dev
X-Gm-Message-State: AOJu0YypqcE1dNFjFqxXX6Op43uZNN6Vxonvkrlb641LcGPF/uabvFl4
	vbQHJh+bjgp5SgFHUn67X4H24Gy56vPmhySyRXv1vY0q7Pm0Cgyn
X-Google-Smtp-Source: AGHT+IH3QNdeufMaRopFHVmIdX1RvoY7wCaw6eDd6tnPYYpCqDy5JxI4Xr1RE21C2j6+3xuj7PmOlw==
X-Received: by 2002:a17:902:db0d:b0:1fc:6740:3ce6 with SMTP id d9443c01a7336-2039e46cbedmr21756765ad.20.1724420431608;
        Fri, 23 Aug 2024 06:40:31 -0700 (PDT)
Received: from localhost.localdomain ([47.76.200.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557f093sm28343285ad.63.2024.08.23.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:40:31 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: lizhi.xu@windriver.com,
	syzbot+a426cde6dee8c2884b0b@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] ntfs3: Add bounds checking to mi_enum_attr()
Date: Fri, 23 Aug 2024 21:39:44 +0800
Message-Id: <20240823133944.211852-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added bounds checking to make sure that every attr don't stray beyond
valid memory region.

Signed-off-by: lei lu <llfamsec@gmail.com>
---
 fs/ntfs3/record.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 6aa3a9d44df1..973e2a371bc2 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -223,28 +223,19 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 		prev_type = 0;
 		attr = Add2Ptr(rec, off);
 	} else {
-		/* Check if input attr inside record. */
+		/*
+		 * We don't need to check previous attr here. There is
+		 * a bounds checking in the previous round.
+		 */
 		off = PtrOffset(rec, attr);
-		if (off >= used)
-			return NULL;
 
 		asize = le32_to_cpu(attr->size);
-		if (asize < SIZEOF_RESIDENT) {
-			/* Impossible 'cause we should not return such attribute. */
-			return NULL;
-		}
-
-		/* Overflow check. */
-		if (off + asize < off)
-			return NULL;
 
 		prev_type = le32_to_cpu(attr->type);
 		attr = Add2Ptr(attr, asize);
 		off += asize;
 	}
 
-	asize = le32_to_cpu(attr->size);
-
 	/* Can we use the first field (attr->type). */
 	if (off + 8 > used) {
 		static_assert(ALIGN(sizeof(enum ATTR_TYPE), 8) == 8);
@@ -265,6 +256,12 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 	if (t32 < prev_type)
 		return NULL;
 
+	asize = le32_to_cpu(attr->size);
+	if (asize < SIZEOF_RESIDENT) {
+		/* Impossible 'cause we should not return such attribute. */
+		return NULL;
+	}
+
 	/* Check overflow and boundary. */
 	if (off + asize < off || off + asize > used)
 		return NULL;
-- 
2.34.1

