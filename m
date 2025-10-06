Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC66212574
	for <ntfs3@lists.linux.dev>; Mon,  6 Oct 2025 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759790349; cv=none; b=AHBAWOjQch+K694GhqeDwrtJf3wP7kgM6QKnKe1KpkJAt5YFd2TbL38yURB1jYHTi03FEi6fpv9Hiv5DAlN+EhBWLhcZ6VQKzYAjUrduU+vkifsZBKrE3JTntYcoUL939blGDEa5kWSJLYmJ3IgNYwr/oSFH+g0eTRNJPL4aFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759790349; c=relaxed/simple;
	bh=476qFSj3sr1jIr2YGzC22ubQeJw0gVOQ7vtxudlpjmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SvoXpY92RJP1MuQzsdHRsqudkd2qWPDNOznLThHun7C8A3Qg6QqZzh4tz738FdcqTAXfS1E2cUVZ88imKvy6f9bkbf+oy31hxCXiNLDBoS+5je9mp9Ayi70wS5/OTROCbEdN9Tumtp45OzgWxZjLTqxmjXYoBFpEP6JBlyknPs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0dvCQb8; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0dvCQb8"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b523fb676efso4720706a12.3
        for <ntfs3@lists.linux.dev>; Mon, 06 Oct 2025 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759790347; x=1760395147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epHNuGWjtr5JgO8lZyH/Ct6cqyHhs3SVgqyLVnQj8Gc=;
        b=b0dvCQb8ryoJBvufyQ2ODF5y1rJ6Vh+/7Vr+8CoJ0oA8lHWoKNZA3FdfQ+6MG2hiDB
         PcgYS485yZj1c1Xm82qaksQU+L0yY6dl2eqXklpJbuqI+7CxH2r3uYeozHOTZFii1npC
         RtJNhDA3VybAs4omidlzGn2CjOJyHOPbFGQmIuY8+V4Id+MhrmGTA/hYpM/WWS5fgbv3
         NK5HgbDCAoVfBKZ/4vy1hcdJpT4wIA8j5lPK1ih7v3bO2pR4K4aW9E8ncCUrwGyPnjNm
         4T3a0uzQ4NyeX9LSxhfi62Z7RBlG30oTi7RC2q8mbh2NE6BUi4L44718GHtUlS5MKSqS
         QVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759790347; x=1760395147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epHNuGWjtr5JgO8lZyH/Ct6cqyHhs3SVgqyLVnQj8Gc=;
        b=F1fuUUaMBkjBpN8MiNNtWvzd/j4c+uGQcNNRQVC6boPpX0BbE/BFBEFxYu/cbS8Fq2
         RofnJd98GLKENqncQgJPFGNDljnPEi/Xvmdoo9n7OPDd8JHTN7r7eZLJTwY3rVnSjVZG
         YGnjaDc912vm4SzSelIAVT+X9o4d/XidaXYa1rb1ijPfay9EXMpgxrBbQgmqCXsP1Q57
         R7sjRc59BhdBUWkadBeTOxyto0uFy+B3fTdCS111eL9gkr75YEM41QXrw1SMZSKk5tAy
         PpPTtIJ62rBs+nI69GH5Sr0UVWo1J9ZAQejzmh1ijmALeoICldjG5YQDyON0H97TT8S2
         RHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIc9+589V5dXGSfPHFXhsWNYgVu+Hy4LKm0mhcXsqLuqd1I6u/WFNzAKh74tPnA7deygP5zg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5ZbKQVd1UCDPgCFkby7X7Y7j4UbbwLde3VxTCpdB3SvN7JoOr
	kmHB2xrcMd0jKpossFP4XVid7rzW9SpbKY1TW0nwU5cewA69BI2E/zE5em+6FcmD
X-Gm-Gg: ASbGnct2GO7BsHYlrK+pCk4ZscO2eDbemAn+WLsejHudIBzvQdzY0L9nDxoS5rAXAbQ
	xdC7fBGq0UK/tinKAzDD6a0VpSxzAbJH7cy0BuWGxlvsggUucjE41+KI/wtyIFT7HPMtGfmuf0S
	Bh6XDziEHWcm15oGyCx2S/mIxNy9ppOc4YjV9NjK0YQn3bRFuNb5/JjP8TgHqTNMlPBcA2iLGm6
	D37P9CrSBCeaoucJi98mnnx5j1qc7XkMHxmfHs4Z/gs9wYDRnPa3ntaBWzoBTOb2ZXKNbOaFA3Z
	fBA6jBGm6C7dLrKXvB3B7XOj7T4MNY4ZHabnvUhuotscxbHD4adnzOLK9jX4KINTGu309qHYDne
	qBEN0p6sJNSk9Pm2DlgipzYvgygF8Cj1vDJxq5ASLPg==
X-Google-Smtp-Source: AGHT+IF6xREOFF7VwHOye2oqD0t5qCm6RdBUaVqYPSYZgYjGI++60wK2ctzYcgxahLhIk9GjvsroCg==
X-Received: by 2002:a17:902:f78c:b0:25c:8005:3efb with SMTP id d9443c01a7336-28e9a6fd985mr177313305ad.54.1759790346635;
        Mon, 06 Oct 2025 15:39:06 -0700 (PDT)
Received: from fedora ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b87dcsm143480895ad.90.2025.10.06.15.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:39:06 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>,
	syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: fix KMSAN uninit-value in ni_create_attr_list
Date: Tue,  7 Oct 2025 04:08:04 +0530
Message-ID: <20251006223805.139206-1-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The call to kmalloc() to allocate the attribute list buffer is given a
size of al_aligned(rs). This size can be larger than the data
subsequently copied into the buffer, leaving trailing bytes uninitialized.

This can trigger a KMSAN "uninit-value" warning if that memory is
later accessed.

Fix this by using kzalloc() instead, which ensures the entire
allocated buffer is zero-initialized, preventing the warning.

Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
The following syzbot test commands were used to verify the fix against
both linux-next and a specific mainline commit. Both kernels were
configured with CONFIG_KMSAN=y, and no KMSAN warnings were observed
with the patch applied.

An attempt to test against the latest mainline tip failed due to an
unrelated boot failure in the SCSI subsystem (KMSAN: use-after-free in
scsi_get_vpd_buf). Therefore, testing was done on the last known-good
mainline commit below.

For mainline commit 9b0d551bcc05 ("Merge tag 'pull-misc' of..."):
#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9b0d551bcc05

For the linux-next branch:
#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 8f9fe1d7a690..4fe8da7fc034 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -767,7 +767,7 @@ int ni_create_attr_list(struct ntfs_inode *ni)
 	 * Skip estimating exact memory requirement.
 	 * Looks like one record_size is always enough.
 	 */
-	le = kmalloc(al_aligned(rs), GFP_NOFS);
+	le = kzalloc(al_aligned(rs), GFP_NOFS);
 	if (!le)
 		return -ENOMEM;
 
-- 
2.51.0

