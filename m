Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF530F53A
	for <ntfs3@lists.linux.dev>; Tue, 23 Sep 2025 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758609660; cv=none; b=nzc4FesNAu/ycMTELKt+5KHPgFKBh5gyJ5nw2UJqhYrcJwnDoRICiTzUFIUhYIlOChF9RrRFuQ2gMTrzW+w6Pf1vHldwQzsWmcYI/lf/ccmkhLEQeg25GYEMTiAyNrqap3i6+O63Q5ex8+AvP2QPx3o57ThV5xdsUetOGmf4vuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758609660; c=relaxed/simple;
	bh=eAnQ3leTSF8Ab9KgIwHZdQwYj5FPMkNUZRFEH4T1CzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vvb+i5FetL/Ta+CwLpB4UnDfxzWWjByJhyZYz9K8te4X/xkHh7e556C4gFv/WGe5SiVZ5K2NupVa8+kGGWpSNDXlZ8nGMm5aIcvtFjH98WDeYeKMV8d/FHO/2jmL5gNDJMtG10l8ERIWz1/nuk9/Bn9XZnz2haZ6I6Jy5SvTEKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRqSzSuU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRqSzSuU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso2070119a91.0
        for <ntfs3@lists.linux.dev>; Mon, 22 Sep 2025 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758609658; x=1759214458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nTw98tKK7P7tEgubOAzlpdmS6udUpljFE7G8gB7lBA=;
        b=FRqSzSuUHk6P99jplcwT2uLpY6nrgmFtmyjKMt4VboNlAwjoE7UZ5pZAd8j0fEwCMA
         Pmza0wIurfYXrzqxMxLLPcfuGD5euReGrx5ULvOC06sPsAbbrgAkLzzrXs/8h15Fz6be
         TDjP/PVM8XaQWgzDrR9jffw9zsMM2UY6udYSG1yLh/h0zYnXrZO72OFO33D8hdrpPFZn
         DMgVgKd79fYRD8iBGL2U0UiyiN5VT+q84tubaCmGUF/TeeoTCiUsSQi1iBohGEhg6c32
         9HRBre2ztpd3US9VQwONMcQyxjk4rXcPVa8YwRAvQe3wDU9VjpRsZMQJ1mnCB0JzW3uj
         MJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758609658; x=1759214458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nTw98tKK7P7tEgubOAzlpdmS6udUpljFE7G8gB7lBA=;
        b=pRIIDV96T0fNNDQoEiM0NdOUQSOCljiVXu65fxzn2RqedwNt2mm0LEO0dI97GMWG1G
         mtUsuqNbyfV5VIWhdvLQUkrcqFBuSRXcgwJzGjRrrxwaqJ3Wqq5voDfSa1PaO8t5rKsg
         2YFG9F/4h6YzvJXtexFLWvBNa0uaPy7QSq/6KNObO/RnboO4rgeRuHIC07Pj4jBUFqHI
         U4bRLcbKFCvXL8EG0T5jQqKrVtn/QSU+K3J46MtiMDkcVoGnUhxK+oxXslLSuEy4E5YA
         5BF9Cio0zzw6sK5A5Vz7abZW10rN3JKvf7Dl7lKX3HTn1CIaxwTQ2D3H8cTxSr5jK55n
         QGSQ==
X-Gm-Message-State: AOJu0YwhvaQ6TAlARd8ZkGRimhmwchW4pmGfRbsVOYb3dOwb5HH+hZYE
	GBPQP4zOyrLxG84Q/GMM+kgll52BibVA2NGueflMBq4sY4ZsleMGBMs8
X-Gm-Gg: ASbGncv/fZqbbGxCvgUyJHNtAlZ5XZLMsfpLdcu84y11DXtGaTq3AQLDIy/Wgz0JeQv
	Tk8LAvmEjgkdihbZQAYStnbYKu+H3IGwOFkAApKJI6qBfh7DyFx06moBCKIbOTiuLJ2ek3yK100
	Xv/H5FwAziPiiz6nL1yEqsf0ASS9JjQCuTy2+SAwp4V19UNgO4IYmbsafKZr1qPaIhDDIJJnepE
	Fg+yemszcezXEubQYY7Xll1k25XMXKZgqlfyIxd2UHPCKTtt4Gxm646TrP0GU7WDvAOgBgVQ7pW
	LVUgT8rOhs9qQKj70sPb99iP6+1u6H84imwDJKl8JFQF6g32iaLOm5qrt4IW8hCgUqoxH3EsqGT
	izRIeeWR/AuwkaukkIUsSLgzJovNR
X-Google-Smtp-Source: AGHT+IFK6RgS/JTJOAGBgBQ9nadK6aL449oMQckP6OC7pzz2TDJ4o81VHWX5cGBkkmJaH/3/4JAmvw==
X-Received: by 2002:a17:90a:ec84:b0:32e:8c14:5cd2 with SMTP id 98e67ed59e1d1-332a95e8f03mr1673948a91.28.1758609658420;
        Mon, 22 Sep 2025 23:40:58 -0700 (PDT)
Received: from y740.local ([2401:4900:1f31:8167:ea30:c04b:15e8:3036])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed268813bsm18141932a91.1.2025.09.22.23.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 23:40:57 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com,
	sidharthseela@gmail.com
Subject: [PATCH v1] ntfs3: Fix uninit buffer allocated by __getname()
Date: Tue, 23 Sep 2025 12:10:16 +0530
Message-ID: <20250923064015.178554-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix uninit errors caused after buffer allocation given to 'de'; by
initializing the buffer with zeroes. The fix was found by using KMSAN.

Reported-by: syzbot+332bd4e9d148f11a87dc@syzkaller.appspotmail.com
Fixes: 78ab59fee07f2 ("fs/ntfs3: Rework file operations")
Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>

--

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 37cbbee7fa58..6b14c13bda68 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1716,6 +1716,7 @@ int ntfs_link_inode(struct inode *inode, struct dentry *dentry)
 	de = __getname();
 	if (!de)
 		return -ENOMEM;
+	memset(de, 0, PATH_MAX);
 
 	/* Mark rw ntfs as dirty. It will be cleared at umount. */
 	ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);
-- 
2.47.3

