Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F112E7F27
	for <ntfs3@lists.linux.dev>; Wed,  5 Nov 2025 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762377531; cv=none; b=J1cncDs0QM0Bkgd6xFIEsLuhrw71uyPfLtcvS0n/v0ScB8bS/lWkHMyCwYLjnbVznLjKD5p6qCfWztW3mnYSH5ImYjysV+n+duQK2zHGL4gueahMIjYZhIY5QkND7+3YLkjEj0XzIT2gkE/3/eg2+SFJ0GewWT2llvqgZnNdp+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762377531; c=relaxed/simple;
	bh=oPQYRyMF1pypwbrV2bfRFWBdMbkQqKT1Ffj4kqPzSb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZFE+2HRRaqTDLUo/akITGKlLVxkLIYYZNDuCsRTVhuPFr8X6gA5qarZ7cYNRCpPXxB4wo6jrjt4V17mqstIOA+z/zwzCR8ai8IKBqvxEtEc14XsBiN6amBYuyESQ38n3QTKlRkobT8bj0jTVDEwOjH+9nZCUcVX7tlH+mDoWOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1TZhgFc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1TZhgFc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63bdfd73e6eso2346308a12.0
        for <ntfs3@lists.linux.dev>; Wed, 05 Nov 2025 13:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762377526; x=1762982326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DF0sydupouCelQ7a8hDVtjvfRn0GwCGA2yXi7RlWEjc=;
        b=d1TZhgFcyo8ico1qOqp5i0BYEuANUKwPnnkP/UhUtJkksMbIo0j1eUaQDXEw8HPuS3
         H1A5LxPRIBpbwl86QIWkjQJVjfFm0uxm75xIePHI2HQc41gP5dgutM+Yamgd435sxggX
         LxNXNWoY3onU2GW/gvN9jg2YRQVvYwdm9iFi1P+Z1G8nkjRx1XUX66P1tGWo+t3ElrJ1
         cUtFSEaNP6FmBWKSuBC+lLR/nLDc5iRD0tELYMIEfOwcT0yHdk/P3yqM7MbQfzxx9qJA
         4GHRs5vfwp7nw4FbYXagNin5ZMLwA+q9Fh29dQMyyYpQ43p759MaomGqcHB7+ORQYTv8
         Y4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762377526; x=1762982326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF0sydupouCelQ7a8hDVtjvfRn0GwCGA2yXi7RlWEjc=;
        b=PKKyadSUoC3LWi6CGM718TmbrLvAQZCmBeymWWoHIGqTcgq79HUk2hb2D4d8nhQIz1
         cCI+xIo2owNqdtES5dtlefFkRj6oqbaC1usI6FnECUxcJ1pO2ajgJwBGplWnBTPcwg4s
         vbhQvAOWGa1daJMwATkWBT+DGGdKVOhNzyOjyaoicCwV+Q+vzN0xUB+Bz2IrJVb/Jh0m
         /5hGkcfDvRThtKI1scpxZqowpu9NHNyvmtDmGHvuXKI6Faw7cwJGPp9BWKqdjG1VRcLo
         s6o7vcr9zj3G7l5ddsf/9E6LGAv3264KhQzFBut1SFEJdzWVnzP5zjRkGa0IMJic5LpL
         6RhA==
X-Gm-Message-State: AOJu0Yz6jdyYianWNXj52PmPjELhcSy52FP08bmVvuWuBKeLfGgPINIX
	Z6mqynaUV9RRlLfDp0vpjaMznplbYV2mDhmSACkou77+otozNN50ie7A6dfGy1+h
X-Gm-Gg: ASbGnctkNjYYeJAFc0HXkLo0UREiUHy0BmkMnYgE79Fs5JmKMCrx3a9EGRkzUFie7bd
	O7gVAs5B/l9evYtdjxafBkRbP/2Vbil0bbjM8lI8CQZab75fYBPf8WyKBDUZhToT/ZVE2KfhDKz
	03So/3LvWpPMfz/G2MkUrQLU2W5+5mQTLFjTCREvhH8fX0qcDLfGJhSxqcQ69U7mUrpTWW7jXdA
	88uB3W3MI3uyCqKByfJpwKor1EHE54HFEPKjGfO+06zxjiVzzlBxlS9OILJZjxQaH2mdbzQrZJd
	gJnMtUaekGRmP6QswO7ISbzHO4sY2peALAcg71aC/Ot1a5/6EdY0iqUPOVSTKI/+HG4uf+bz6v7
	2gF0jmcYTX/nV2DwhogRW9cKOPFFEM0LeNCyjL4ilCZRMk29fKJTQp6GfCBb4V7atrBC5dci/7N
	+iIMJxy+lLfcTju4RyatExL1WSi3DAI8qdgJYhrBqg2U67apdKvszVVvx4RI0zoRS0NwmAzfxql
	/Y46yLtYvq7X00u5wC85MsuPZloN54=
X-Google-Smtp-Source: AGHT+IGiz9VN3EwGclfE2mM2roTXLFXItqHPPpfh2E0/oV854mv2wjZ6x4OeB6U7GyRrVN+rgMV2Yg==
X-Received: by 2002:a17:907:2d94:b0:b70:b161:b9a8 with SMTP id a640c23a62f3a-b72892ac5acmr90989366b.2.1762377525586;
        Wed, 05 Nov 2025 13:18:45 -0800 (PST)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728964480esm52226166b.38.2025.11.05.13.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:18:44 -0800 (PST)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>,
	syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com,
	syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
Subject: [PATCH linux-next] fs/ntfs3: Initialize allocated memory before use
Date: Wed,  5 Nov 2025 22:18:08 +0100
Message-Id: <20251105211808.260893-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reports: Multiple uninitialized values detected:

- KMSAN: uninit-value in ntfs_read_hdr (3)
- KMSAN: uninit-value in bcmp (3)

Memory is allocated by __getname(), which is a wrapper for
kmem_cache_alloc(). This memory is used before being properly
cleared. Change kmem_cache_alloc() to kmem_cache_zalloc() to
properly allocate and clear memory before use.

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Fixes: 78ab59fee07f ("fs/ntfs3: Rework file operations")
Tested-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
Reported-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=332bd4e9d148f11a87dc

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Fixes: 78ab59fee07f ("fs/ntfs3: Rework file operations")
Tested-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
Reported-by: syzbot+0399100e525dd9696764@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0399100e525dd9696764

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 fs/ntfs3/inode.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index ab61388f819c..13720baf079d 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1281,7 +1281,7 @@ int ntfs_create_inode(struct mnt_idmap *idmap, struct inode *dir,
 		fa |= FILE_ATTRIBUTE_READONLY;

 	/* Allocate PATH_MAX bytes. */
-	new_de = __getname();
+	new_de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
 	if (!new_de) {
 		err = -ENOMEM;
 		goto out1;
@@ -1723,10 +1723,9 @@ int ntfs_link_inode(struct inode *inode, struct dentry *dentry)
 	struct NTFS_DE *de;

 	/* Allocate PATH_MAX bytes. */
-	de = __getname();
+	de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
 	if (!de)
 		return -ENOMEM;
-	memset(de, 0, PATH_MAX);

 	/* Mark rw ntfs as dirty. It will be cleared at umount. */
 	ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);
@@ -1762,7 +1761,7 @@ int ntfs_unlink_inode(struct inode *dir, const struct dentry *dentry)
 		return -EINVAL;

 	/* Allocate PATH_MAX bytes. */
-	de = __getname();
+	de = kmem_cache_zalloc(names_cachep, GFP_KERNEL);
 	if (!de)
 		return -ENOMEM;

--
2.39.5

