Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A452B185934
	for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418333; cv=none; b=LjaAgx7aLoZ8Pi8thYXDJrtmS/G4y4461P+6n7N8IXm7J2XDO7MXndEo16PPMmNIUsnO5fjPdk9uW6EajDBeeFaPckPT6aprmNDOuQ5HTA0LYGfYVuia1wl+g/UPoqDONtoCaI0VyV9tcrdgTJI6XxiS56EBDLW+lh3Fkxa5FVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418333; c=relaxed/simple;
	bh=g6nc9uA4QJJY1KmtvD7N4qKTFyl2UxFmLi857CSTypg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hJ2jsU4687VKdEDpVUK2feclABChk+Qqio81/O5vmoDE53g+eU80kASNbgxpdwUVy+iF3e4hU41RbV3TjfZnmScPdEf3E5cvOSFFG0a0JbpeuhoKuJe43O3Y3EEmNs6CpHbC2C7Ck+wXDracEI84/GksY7xOZpEtZtu+bm1+9aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POj54KS4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POj54KS4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2020e83eca1so19279665ad.2
        for <ntfs3@lists.linux.dev>; Fri, 23 Aug 2024 06:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724418330; x=1725023130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=549hMfXgiCK2D+X6EGNL6jk5Pqp6M3llnFrmlTC4sZI=;
        b=POj54KS44BdcZTj6rldUc9PSVSFgMHY9B/2bS8uakZ2rCK4YQKQm0Wb78qROhiKoQV
         ordG9irUqkbzfwBpbguoXPrHKGqbj1IcTzTu1QphIO9VWWBC/WKc5BjDv2nxjafgRLLB
         jAFrcuu3LCQsY9nXwgNegfPkKDtd83/P86v8nnNMSqHeyeMdR6E/ly7tC9uBFkIubxj4
         +qcRTg7NKSiD8TyJVo3fgq7F0A7TNrpMOYpjMajHbuvIMGLYRfVKNof6VT24BvICLogP
         GVf+Ot/bt4cyn35U4YGYYV2NtbXE8bb94y1AC+0G4hAs4xf+WFTevY7TSY9lSkb+ILzP
         bc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418330; x=1725023130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=549hMfXgiCK2D+X6EGNL6jk5Pqp6M3llnFrmlTC4sZI=;
        b=tfBwq1RA4LydTQ+tEzOPqjjv+7Qo7LXTXTBdffygtDhY75cDjt++YhyjJlcO2MdlIy
         fML9kLH/ZN81l+91OAUyUmDOCdVno4OklV7jrFqLfOAzA1iDL0+Bd7BLVQx2vpaRt021
         i4LntK20ojOGiaP91MlbXQGlLitvMJBU/X7xLnitN/rtbxdjiGHstZyLf/RHZTxpDEzX
         HM8XCW6KfbppaWpzuLBbMKznjDvqfTx62dlbBrFwcM+wCxL8H0nXUBIPtnItYWF6nu3i
         WOzChN11ARRyHl0kBfFVO8W7MsfKP2lBQSkKxTIXOM3XLgS86vEa/LGLPybv1ivM0LT9
         CXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNLaLkhhsBXjqZYDXrAxcLbCqV2Q0nQScYY6tCZAlieTF3Zsh1UPl7FPercZAyOrhZ16MWHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyO/bJXQ5VjFo60hwxlBv6GsBp73t/c31HmSAqZnWIKW6xJZzd
	dAulKuLTLB5gSaGPAUcnsnKuZkF6getQpv3zeQBlM3xnuUxIenUt
X-Google-Smtp-Source: AGHT+IFxn3wIw5rzXYVl+uPY05i8Ae17lddrDIFNCX8VpJsdkQevfkb0VTHZH+6ZmMrIQr6+yQSQxw==
X-Received: by 2002:a17:902:dac9:b0:202:3296:eec1 with SMTP id d9443c01a7336-2039e4ca94dmr22873895ad.36.1724418329584;
        Fri, 23 Aug 2024 06:05:29 -0700 (PDT)
Received: from localhost.localdomain ([47.76.200.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855ddaeesm27933965ad.124.2024.08.23.06.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:05:29 -0700 (PDT)
From: lei lu <llfamsec@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: lizhi.xu@windriver.com,
	syzbot+a426cde6dee8c2884b0b@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] ntfs3: Add bounds checking to mi_enum_attr()
Date: Fri, 23 Aug 2024 21:05:03 +0800
Message-Id: <20240823130503.177723-1-llfamsec@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added bounds checking to make sure that every attr don't stray beyond valid
memory region.

Signed-off-by: lei lu <llfamsec@gmail.com>
---
 fs/ntfs3/record.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index 6aa3a9d44df1..d47ca8ca270b 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -223,34 +223,35 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
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
 		return NULL;
 	}
 
+	asize = le32_to_cpu(attr->size);
+	if (asize < SIZEOF_RESIDENT) {
+		/* Impossible 'cause we should not return such attribute. */
+		return NULL;
+	}
+
+	/* Check overflow and boundary. */
+	if (off + asize < off || off + asize > used)
+		return NULL;
+
 	if (attr->type == ATTR_END) {
 		/* End of enumeration. */
 		return NULL;
@@ -265,10 +266,6 @@ struct ATTRIB *mi_enum_attr(struct mft_inode *mi, struct ATTRIB *attr)
 	if (t32 < prev_type)
 		return NULL;
 
-	/* Check overflow and boundary. */
-	if (off + asize < off || off + asize > used)
-		return NULL;
-
 	/* Check size of attribute. */
 	if (!attr->non_res) {
 		/* Check resident fields. */
-- 
2.34.1

