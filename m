Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB176242D67
	for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768676356; cv=none; b=Nf/z2Ag2B/8Y7sL7hf0xAFdFR/OGSxYjRKz4M45LgpMZcW2bhoJ5q9jD2gcZgSc1Z2lJtod7rnoX5Csoenh7tOHbmkXKZJz7D6J3q0jW02cDWFxRbr/U+AozPEk1dLm5PTNNajZ8iswBennfqduFO/EA4B7BmtCOeYADUm4uOQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768676356; c=relaxed/simple;
	bh=oEuW/QLl6h804oriTctKWM2AkhAEUaiwfgMyD8azYw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ooFyHoY1zv8rNLDX3nuyjv8FC4huLDeGFWz8uWJ78dM0MkX/qhlAho996jJrEWPq2e0JZLdPhAp8UEzp4aQKuSiXutAxNrPg5flIenE9F+k/ZRlTuVxYYkUWI8+Kbxz8GtV00tCkXnL9LCHQ6Z75dv4sIDaHKUrdenYiA7VlkNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEIYDNUa; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEIYDNUa"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7cfd6f321b5so1796255a34.2
        for <ntfs3@lists.linux.dev>; Sat, 17 Jan 2026 10:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768676353; x=1769281153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJZfCNDTWwJxFhoFMagUMWswNzWJPKtcKs8+XIrwaVo=;
        b=DEIYDNUafFkJ3oK6hlXTVfWAMQ5HhZWuB0SSS9ZhqwUkg/txaFPIazkGy7CuhvNPY9
         CTNt4mTXhEcTZia8BMM135GVrqpPxQwI6q4abjCYmoICtuWbGYhDT48B9n/NTWONx2fF
         abTZzGrVzaZw/ELssF68n+mDBE8zCwHQsevHb0Ui72iWi4H5rBJhsiHw53ik3MWnZFdv
         8kV6zomp7j1lWwIbXTZZE7DdgW3yLsRtfguSnL4eS/V/CvS41XTugTUejGryg55q3oAV
         q3kBymvWpIkCJGUUZnFWw+r+f7zModB4oL1/xjlbCwu0n/DONjBPgIwVs2MZusK2nTHh
         2Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768676353; x=1769281153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJZfCNDTWwJxFhoFMagUMWswNzWJPKtcKs8+XIrwaVo=;
        b=VT4KynKDOtZDl0LvNx5poj+STqoQ7CPjjTofV1zvAyrJaUM0PBOmEvYAAdOUopauxS
         qbWH3mR1oSIb7RT+2ecCXve6Bi4q2nU0b7NBnrx3aFuN0zFrVYQvitBpspGiXo5hb4HN
         YaiwijH7UUKf52IPsw29grpb8v4AwB/McNVX9ny87Ot7e7vXjXt4/P2GRUdVycnXSbq/
         lwiLwLUI0mZF1zG84JDqGBiChJxxwmgq0RdMrKW2rA7OfjGuc+rzL0SsAZTU+sKGw6wg
         t3VKEMMb+GRCp8mTZF5yvhEViL7aO9f3GqXoN6KrQrZO/4g/I2d5RrL6HfEne7OcVz5s
         y8wg==
X-Gm-Message-State: AOJu0YzWe6Myzlm9m+yInBj9bmnM9YU0PnFOrnxU/S4rqzZw6vv24nX7
	RcSEO80zJm6SG0VsPeWKho9PyQfCxtwnB8eKdiyh5SSKW+5L84C7otN1
X-Gm-Gg: AY/fxX57JRgbyoPeygQrLjBxHUgS98s0OdAbPR2Sk+b7+TqUmNqX9IVD6pc0M0RpHvt
	DaPjZNcQ0lW488L39Oxodo73c/9CWOj8G4ssbq+tOMRvOYR8GkMuvA8j8EJfWlAkUGiS7OiC6rn
	ObUnjJ169vs6Q+krEiluBV+SGA68vYMiidLQnFRRz/g8CGpTChBbTCGISIikUS+dY2xYVcWO8Na
	o+GYx5Nk8wvYfLP4J/D44vA2vTBo4e7UidcSaEvIFcQdPnRcDQAH7wUZ7hiAVJYQ5le8gpGgq4A
	Zss1uI7S8/0cCeZqGEdwP75Cjj2sor2HWVy4QaY/URZ0k/1x3e9dCWIJouNxHCg3x8FyQRWVILT
	czf2fxJToNzhX+pAI1FnwmDds78+51yPKc2LdA2fSZpeB+rMdInA1TXLrPk5xN9SGqRSF3O+Joz
	EfsIuVWslY7TnKf01h5GwU8E7hOj6AEH6M
X-Received: by 2002:a05:6830:82e4:b0:7cf:d0b4:bab7 with SMTP id 46e09a7af769-7cfdee8f50emr4258117a34.34.1768676353553;
        Sat, 17 Jan 2026 10:59:13 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf2b5aaesm4016486a34.31.2026.01.17.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 10:59:13 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-kernel@vger.kernel.org
Cc: ntfs3@lists.linux.dev,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] fs/ntfs3: Fix memory and resource leak in indx_find_sort
Date: Sat, 17 Jan 2026 18:59:11 +0000
Message-Id: <20260117185911.39415-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function indx_find_sort() incorrectly uses kfree(n) to cleanup the
'struct indx_node' instance in error paths.

The 'struct indx_node' is a container that manages internal allocations
(n->index) and holds a reference to a buffer head (n->nb). Using kfree()
directly on the node pointer only frees the container itself, resulting
in a memory leak of the index buffer and a resource leak of the buffer
head reference.

This patch replaces the incorrect kfree(n) calls with the specialized
helper put_indx_node(n), which correctly releases the internal resources
and the buffer head, consistent with other functions like indx_find_raw().

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 fs/ntfs3/index.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 7157cfd70fdc..c598b4b2f454 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1248,7 +1248,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		    sizeof(struct NTFS_DE) + sizeof(u64)) {
 			if (n) {
 				fnd_pop(fnd);
-				kfree(n);
+				put_indx_node(n);
 			}
 			return -EINVAL;
 		}
@@ -1261,7 +1261,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Try next level. */
 		e = hdr_first_de(&n->index->ihdr);
 		if (!e) {
-			kfree(n);
+			put_indx_node(n);
 			return -EINVAL;
 		}
 
@@ -1281,7 +1281,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Pop one level. */
 		if (n) {
 			fnd_pop(fnd);
-			kfree(n);
+			put_indx_node(n);
 		}
 
 		level = fnd->level;
-- 
2.25.1

