Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921D306B31
	for <ntfs3@lists.linux.dev>; Wed,  6 May 2026 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054161; cv=none; b=avArG6KHOOBzaxyOib/O0IsKJK6zj33TgQ5qIFmFW3vz9iUh14AHkJfXBwGyvYtzJ4ulBMdEJu74R2tp/RMFwOZiZrTCe8evFr3aicnTTnZROsCw0KeAFppsPUJ0VwxgvDUvC8brgZbtk8NP6DiumZLruog0mMFINB3HofUGqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054161; c=relaxed/simple;
	bh=Zn/HSxgx9qZwQ5YGcGoKI6Qy28bsewtR+Ggg1f8p6C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1QaQo0NKwN5OldJV+gqUTmqkuwahNuDbcHro0+fv4kvh2mt8UevAzx0Ws33HGpU16PND3xz1wOOLg6rv3XkT5gPFasQ59hmdMm+SyCU+LDaAyhXmbN3GJhtoWAmOlw7HGbGzAd/SCaEUpG74/xu5kSa+zxti5yHg77MuGko8CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suHX924S; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suHX924S"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so4407240b3a.1
        for <ntfs3@lists.linux.dev>; Wed, 06 May 2026 00:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778054160; x=1778658960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/svLyhDt4LmrmppOf0GneXzDZZYkFPlrB5biDFWZro=;
        b=suHX924S0B6hlvstfovNGDYWl3EdtbVR86IDP4NUmQS4fDxq9rjgP8cOJrefgk52a1
         w9STgB6dHa9pXE7Q0cHZwDlhc5QRhkrhIDxKZp0HAhbdpTS3olydLB0svRW1iCTAk/zS
         F4+MDA7yBG1uiyb+vrQcejiy82PfsdUy1DCGONGrW8w051z10lGHj15sqxdo0UqEI+u7
         YMAyHU8NMFhiT6CZ2O2nhYe4qTb6T04fwOslNONmtgEv7AAdx5H6WGKm+pT6hS5IDql4
         LXI3ckk9DsS0nKEex4of7mnjdMAP2zXEcWwDJjhvVvVuM6Klt20F8p00hNRYxMA8t3tR
         8nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778054160; x=1778658960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/svLyhDt4LmrmppOf0GneXzDZZYkFPlrB5biDFWZro=;
        b=cGXumJ4388oaqZF4Qo3glba8aGuhY/psEAkWQR+y5tofZBy2kE/UywuN5FH7t7GvEl
         JsBZZN+abwW0cPf3Oe3hu/DokYsMwgy5qaOQXaeQ9f6fWq0xCN8Ez9qeYxAlld03zlQL
         uQchJHvFb/wdKpI5+78dtRThjhsDTTgdhSNyAtZrzmgU8094iDTZ3ID82TYdukIMFmIe
         lMWMvHHw+tF86bbIs9NGrq8zUP6Fw8j1MLhYP+RdKKtPQuUm9CssMnYTR4R0ismH358D
         Fm0OfEgSod4JuTxkYCZwmCL1QODRtpsCkuMG5nCSBjLeg5majYc4VpE9MVN0UhExc/z3
         HMfQ==
X-Gm-Message-State: AOJu0YxOPn8epWzSRZoxRsHBkj5Usy4gBDeykOCbJyhw8OuRPYbbEXa3
	dL6LW9kcEIKufTj3nWcmmQmu2M2IEx6LSCETuhoRhRiwg8Fm2hnBOo7E
X-Gm-Gg: AeBDiev8oLNqauNukvvOCB18nyT/G6OEjfQ8KcIfWZ8vGnyhxI+ODYC0LKp7xWr8Fv7
	FFQcBZpSoQDh81gl9qItdihOhu8ylz59KBT33rgb8BugCW8lhdNC3558rZDuQ/uVwmgRHalwhhg
	P5WSs1sGcBzmN9xkpWCJeEsRgq8K1JvcMyXb+kN5k9dPsTVb1g7Z0CPVAkp7a+ainsrwlI0y79z
	jI0ffzpPwaECWY+6dZB8XfRT4a8XXb0UnUVEkBzTJZUCUKgmY2vXocI51cJqwnRqkAqmfkAukgZ
	+6dFjTAljad67uTJ8mkFFmhJsgEno1B5wPtaEJjtINGKphTAqazVFsXhwdDtrjqARvBKcZy7syZ
	Jtru5xtpW43qFZvqGRduVxFeJwORbhCQvcc+hE/5hpVjpZZ1+jRiAWaXI8Na0XrXiqwaNzg0wQP
	hUQLu+42uF7KA8j3xdWf757r2OmK9ecRwx+hkUHLnAGjl4JWrqV2xN5/nYeQ==
X-Received: by 2002:a05:6a00:10d2:b0:82d:603f:f3a with SMTP id d2e1a72fcca58-83a5df4b0c2mr2178592b3a.24.1778054159720;
        Wed, 06 May 2026 00:55:59 -0700 (PDT)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c10sm4421502b3a.37.2026.05.06.00.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 00:55:58 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] fs/ntfs3: fix syncing wrong inode on DIRSYNC cross-directory rename
Date: Wed,  6 May 2026 15:55:54 +0800
Message-ID: <20260506075554.7469-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422152010.205694-1-zhanxusheng@xiaomi.com>
References: <20260422152010.205694-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ntfs3_rename(), when IS_DIRSYNC(new_dir) is true, the code syncs
the renamed file inode instead of the target directory new_dir:
    if (IS_DIRSYNC(new_dir))
        ntfs_sync_inode(inode);      /* should be new_dir */

DIRSYNC requires that directory metadata changes are written to disk
synchronously.  Since new_dir was modified (a new directory entry was
added), it is new_dir that must be synced to satisfy the guarantee,
not the renamed file itself.

This bug has existed since the initial ntfs3 implementation and was
carried through the refactoring in commit 78ab59fee07f
("fs/ntfs3: Rework file operations").

Fix by syncing new_dir instead of inode.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v2:
 - Cc ntfs3@lists.linux.dev (was missing in v1, see
   https://lore.kernel.org/all/20260422152010.205694-1-zhanxusheng@xiaomi.com/).
 - Add Cc: stable@vger.kernel.org; this is a data-persistence bug under
   DIRSYNC and affects all ntfs3 since 4342306f0f0d.
v1: https://lore.kernel.org/all/20260422152010.205694-1-zhanxusheng@xiaomi.com/
---
 fs/ntfs3/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index b2af8f695e60..64cde1a856f4 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -340,7 +340,7 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *dir,
 			ntfs_sync_inode(dir);
 
 		if (IS_DIRSYNC(new_dir))
-			ntfs_sync_inode(inode);
+			ntfs_sync_inode(new_dir);
 	}
 
 	if (dir_ni != new_dir_ni)
-- 
2.43.0

