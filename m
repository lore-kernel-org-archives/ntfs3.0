Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993592CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:49:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j2-20020a1c2302000000b0032ca9b0a057so471868wmj.3
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t/+7b324nlifMvXfU05OLeJb/Wd8pyz5UZsBF+6/IFs=;
        b=CTT8e7k/0H0biLjxj9VX/3/f1BmXrYL/7EBxrMeleGc6lJMmDJADJfWR48XuqyHL8q
         cMoiHj43Exxds9T1SUXKf32QrgCnLTZWcqJxWGt9w/CpxZTLNICZJivt3BirjhFdZ0Sc
         +FY0IP4/ZUjogksmPb8sR8mHkjzuxe9YXeJP9mNyaNl0qYys9/MY9OH0HgGdjXnDmTF7
         zLNy76Q0u8dbMmPWp13EBdfAKG0Nt6KkQoypqFlNTaAxn5YaEKxd4fMCgx4pcXBCih1I
         wI2iKwPy1/rfAs1Co18uia64g0J1okLZ0vpjRhP7vf7XuQu19JntPN2jUNNkjP1jcnDR
         TnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t/+7b324nlifMvXfU05OLeJb/Wd8pyz5UZsBF+6/IFs=;
        b=RCdCXn4HgxBFsEqLOaE/MQ/VAmuyIu/OhwZ+pbCJKdBsO2d+tMkQE9zOFYEYdFMkZO
         scgvEEmO8L9qrliK2R0Do0lHXwg3Z13XuEDlQZ0Q7MNyKoQOg2yh64Jk4dLtrx0D4bd3
         4+mMHcQ7s4+PMxDiZ3qZBtnkORKRjuZGnjjHVM0WIYZ0jCIDcAJ+oNGGCRiH0dwK5i4B
         FfnBmsvu6axP8sq3kXW3MD2UM7Quz16TYm9rlKc7eHDAZrE//vYapFLOrs8gb2cAUMcs
         6KWALQI8Af3fhx8RhcDq3F00sFUHmmZ3NWX1g1UhGxSVxcjM5vHONBKy1ec+snh77Zq8
         tNCA==
X-Gm-Message-State: AOAM532Cfzsp004IvYh4GcG5FcmNO8Z9iVUNrPsxWWwjmpBA9Zsv8RaA
	Rbn/fIwNFHX+TwumD9j8DvwtvWmJxL0=
X-Google-Smtp-Source: ABdhPJxDnolTS/Y3xgkAVEwNi09due/ZyDmKuYwMsYDs3dKhMzEWz5t4DgpA4gxcIVOpy8RHuNJceA==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr1092310wmb.105.1635281374078;
        Tue, 26 Oct 2021 13:49:34 -0700 (PDT)
Received: from localhost.localdomain (h17-ipv4-77-240-224.mynet.it. [77.240.224.17])
        by smtp.gmail.com with ESMTPSA id f9sm9549775wrx.31.2021.10.26.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:49:33 -0700 (PDT)
From: Enrico Mioso <mrkiko.rs@gmail.com>
To: ntfs3@lists.linux.dev
Cc: Enrico Mioso <mrkiko.rs@gmail.com>
Subject: [PATCH] fs/ntfs3: clarify emitted log message when marking volumes as dirty
Date: Tue, 26 Oct 2021 22:49:22 +0200
Message-Id: <20211026204922.126100-1-mrkiko.rs@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are actually marking the volume as dirty. Reflect this in the message.

Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>
---
 fs/ntfs3/fsntfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index abe74dc9ce31..08802d7ca078 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -933,7 +933,7 @@ int ntfs_set_state(struct ntfs_sb_info *sbi, enum NTFS_DIRTY_FLAGS dirty)
 
 	switch (dirty) {
 	case NTFS_DIRTY_ERROR:
-		ntfs_notice(sbi->sb, "Mark volume as dirty due to NTFS errors");
+		ntfs_notice(sbi->sb, "Marking volume as dirty due to NTFS errors");
 		sbi->volume.real_dirty = true;
 		fallthrough;
 	case NTFS_DIRTY_DIRTY:
-- 
2.33.1

