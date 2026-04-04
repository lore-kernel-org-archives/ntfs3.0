Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A1280318
	for <ntfs3@lists.linux.dev>; Sat,  4 Apr 2026 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316745; cv=none; b=XP68PYK7LRGnkLV7B/RQlHUUdM5syfEexR8mYvGs4iU2elIZ/XNSonKLebo12xTgipLS/3N4Y/UPYt7kc1KTY8tso0k6a1c0/6mgs2g0NplPVM6SSU/Ziz4170OvuJOz3EvJm6Sv9Z5sMhbWFOehFGSqTyiKp2+IWDMwhlilo5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316745; c=relaxed/simple;
	bh=K0Rv3do97vQH6+h73JJKlFvZhoa1z8XdurtnrxwcwQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K3rCx3+ThOVy9ZzO7L1Uq8rtw4TOiMo/hdAFRM3yQ8EmQb2rvQ8/KQhWSbwC5rGpuKxYZ/AXETSN9U9wDmVOAXmJt++QwbNhEFm5y0Nv2FHAHsk+10KVUqOc8tvp6zSrr25Q8nBsuCaPKnjRh+wnTL9vijhdcfHiI9A7dkjWD6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5BittBC; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5BittBC"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1821983a91.0
        for <ntfs3@lists.linux.dev>; Sat, 04 Apr 2026 08:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775316744; x=1775921544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsgNYGTYCqhAsQQh/h4UshxxcYRAvETUXuPdpkNTJE4=;
        b=H5BittBCvThcAKo0fKG3sRufwDQBnSnbnSb41xtxjZ6GD999dnMFdqTW0T9pRBXsFR
         x0ZK20ZTCvtu7qHNYZ0xFpWKiM7Mx/fnu6Wu793TC+1pprWfUkB3d6lWQvWhCCR9o5DF
         KLkIluOpCjzHk2Z+zxUhw6pVaE6Sn1MXnSP6FIQjXEdCEqC9KKQHRK15SCmH+fdduAvP
         0RMXQx4ZECut8+9TgwzyggmtP5r9bfAT2rMq0kI6PTwR/78MpSZxDL4F3TDzFceq32g6
         E6BgUvZSRuOkc6J4VwQj4nSTi9F4Cl/Y4HVodC2I+WS++6RpOVzKy6Lg7E5kGvAeCvo1
         1Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775316744; x=1775921544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsgNYGTYCqhAsQQh/h4UshxxcYRAvETUXuPdpkNTJE4=;
        b=Ix8gJ2J1O0CCTDh0CXIWwGqS8lLBIs6Pg3/Qo5vgatDGxnEDES3zTT4IjMyPEOyDfS
         kECuhIEFv9BPw1Fex7bYh2hD+iM5LDyCLL1eG+ESNmcvpUKEDg5EF/r2XreEwPr80Oqy
         SiLZu4VhXw1LY6JpvBnfMPul2Kd2tCnsyZ1BZQREUV/7BMxhEsIipREUW7ncVitNtkdn
         FcaEJOFCykRdyXHrVXfHS7waoCIGBh0X5CD5BPIvKcgfk9ROTTAibBdxqO9o4Gotqr6T
         Agln845JsnKewzLRfANzpEbhRvGUGgqsBXh4sDv1gk+UgR5fCMc44A+pud/+IgBeCZiC
         /67Q==
X-Gm-Message-State: AOJu0Yw8kRM9ZxRLxsfN+UfH52pgtic5Zcz9toF+UWQ/Q6haHv6E+cHE
	LHmc6h69Ve5nYpxCQHra03OOeMkfMbI6PjAZVm3lPoQHB6/mX1Ogchkf
X-Gm-Gg: AeBDiesJpfwmShIgWayc1wLp0JPWgsFf3OVgWe35P/Q11JWpxJtPjky5NQ8JrS3DXHo
	dPU5olW+nCxo6S8Sj7UXLZDJdcv882VtHeCHxFGG3Ddq6/EaJwrKA+Hk6oXxFgn1SP1B33sy2Ju
	H5QD4WS1hRKGk15JvY23hiq+gxHnx1p6NGggNy/UKZLXPuCXz28ovpwn9bhDxpKb+42UwtLLvqy
	o/4awwR44A3fxiTt+iKVoJNghfRQbwCloqxvhWKOYsX2cxtivwN33J0zYc85MB0AmP3c8mST/1c
	E8RBJsdDI/UufMWjgiho72F9o9dzwDAMCg7b/OJpgiD4c7JpNKiuEmzzhMjhsqFdCprPNTXrFav
	yFanrJAQfLQ3kNgBoSFisNAkrbSpNzSqJxN+Mad39hy/QwcilRpQIgYtjzttHlY1HQnA/iAMpNB
	YL6UzZFlSFpChSaq9X2gXAb/DVFIMZmNLYM00VeN3pYWeEsLIFBtl5PKldkSBBBXU5n+GG449g6
	hcNwks=
X-Received: by 2002:a17:90b:48c6:b0:35d:a22b:80cb with SMTP id 98e67ed59e1d1-35de68ec484mr5939194a91.16.1775316743944;
        Sat, 04 Apr 2026 08:32:23 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:d481:74d0:f27a:b799])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e360bsm8143603a91.3.2026.04.04.08.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 08:32:23 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
Subject: [PATCH] ntfs3: fix deadlock in ntfs_force_shutdown
Date: Sat,  4 Apr 2026 21:02:13 +0530
Message-ID: <20260404153213.365836-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_force_shutdown() calls bdev_freeze() which internally calls
freeze_super(). freeze_super() calls sb_wait_write() which waits
for all active sb_writers holders to finish.

However active writers (ntfs_compress_write) can be stuck waiting
for ni->file.run_lock while holding the sb_writers read lock
acquired via file_start_write() in the VFS layer. This creates
a deadlock where freeze_super() waits for writers that can never
complete because they are blocked on run_lock contention.

Fix by removing bdev_freeze/bdev_thaw entirely. The shutdown bit
NTFS_FLAGS_SHUTDOWN_BIT is already checked at entry of all ntfs3
write paths (file.c, inode.c, namei.c, frecord.c, fsntfs.c,
super.c, xattr.c) and causes them to return errors immediately,
making further writes impossible without risking a deadlock.

Reported-by: syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5f6ca38579a76e303c1c
Tested-by: syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com
Fixes: ae91dfe38966 ("fs/ntfs3: implement NTFS3_IOC_SHUTDOWN ioctl")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ntfs3/file.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 7eecf1e01f74..cbbc7d81875f 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -118,18 +118,12 @@ static int ntfs_ioctl_set_volume_label(struct ntfs_sb_info *sbi, u8 __user *buf)
  */
 static int ntfs_force_shutdown(struct super_block *sb, u32 flags)
 {
-	int err;
 	struct ntfs_sb_info *sbi = sb->s_fs_info;
 
 	if (unlikely(ntfs3_forced_shutdown(sb)))
 		return 0;
 
-	/* No additional options yet (flags). */
-	err = bdev_freeze(sb->s_bdev);
-	if (err)
-		return err;
 	set_bit(NTFS_FLAGS_SHUTDOWN_BIT, &sbi->flags);
-	bdev_thaw(sb->s_bdev);
 	return 0;
 }
 
-- 
2.43.0

