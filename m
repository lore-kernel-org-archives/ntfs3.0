Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A331F957
	for <ntfs3@lists.linux.dev>; Sun,  1 Sep 2024 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725222509; cv=none; b=gfL6/CtcAOmfWRPHLDmAi3RFNketT2NWlEKwwMPMYilbTU4RbCqD9y2OaC8GZgKychbc2eqRP7Xsm3PXdcjtlhUGsMc9rtOmPXa4CDtmNJ2QLOoDnh4AEdekq4nh1YI8emx6EEMyMMx5vrpQPofK5UxPVSFAZjX5h7fnln6j6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725222509; c=relaxed/simple;
	bh=7EBJOvDTmCgNvh7cUGo5j28NKL1Nz2qMatEEIuHnw0U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H2SHQgzAdQ/q9O6GVXuyDGqOYM27gKb50oQdisvdDyhQHelj0MzQDcEtIz2RVe7R/NNRjbTx1VWDf+YjXx9iHQ1c4cVydwidPjzJVzSmxLuq6v2jsZmXNt56rPpLuKSyI3nDjcdTt9Qrcvg7ns+SsJubX3/6NFXM/RnpuXEd3C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-82a3754a02bso200668139f.0
        for <ntfs3@lists.linux.dev>; Sun, 01 Sep 2024 13:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725222507; x=1725827307;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWnPjTUWwWec2L8dOHWnX8tBqet94rg3TyCYQg7utpA=;
        b=IwYpDBGwKo+AAZV4mjhU8/rsk6FAtJJoL0jwKv/YvpXggrpriWhELrcYdtJ5uULXXw
         le8T5p1dgjKCfRoopX2nRC4pcuta2lzToMz44f6ieqqiaCIIlY3nQ74oN2MILr6x3FGE
         OAz2gnNIZZQ4cWETBzmm8SRW7Gv+4OfRkgKczIPSmKGZYDvpLCwPc3GIuckSvOGs7x0m
         hKvo0+LU79T66csikjChDQ341Vr4N4HaBRsJm1E7JW/Cixau8LTrwBjmw2kvicmg4pS/
         eljqLXYdzoJ811w6VeUxLcQO6+V4Oe0fkjPGnAfTHfgtQ6kps3ItY80Ffon+5n6cVa5w
         5QoA==
X-Forwarded-Encrypted: i=1; AJvYcCXmOlhKt81+X54bgWfLXtJIwFSb9dUaVw4uAUf/YWTZKiL/iGmp2ifLx1Ut4m27seeg7jDeoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD3vnDAgfMhZc6l4sZtGzYwOTh3Xhw8uC3BesvttzgZTkXrrfm
	smOCv/615KqVP9xKTB8v02cdRC8uYpLlA7+yjFY0zq/m6dO4y+WahY2hVrWcSYiL6lofJjPZxL1
	ltydCTGxmY/aZrK+2uX504jTp2bYcWe1DyAdEBVENxMvYe99lPAVsqN8=
X-Google-Smtp-Source: AGHT+IGEaa370Q+UzeojF0tIUd3ekWHpQvuZXhMcpI/ygBMzEQJ2dBhpNWfoxJFvl0Ji5ulxSk2PEEkznkEU2RJptY7VYorV4yrO
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:14c2:b0:81b:d4:3802 with SMTP id
 ca18e2360f4ac-82a2611839amr68123839f.0.1725222507196; Sun, 01 Sep 2024
 13:28:27 -0700 (PDT)
Date: Sun, 01 Sep 2024 13:28:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b3424a062114aaa3@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in ntfs_read_bh
From: syzbot <syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    431c1646e1f8 Linux 6.11-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=137426eb980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=35c699864e165c51
dashboard link: https://syzkaller.appspot.com/bug?extid=7a2ba6b7b66340cff225
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ab3219cb5e8/disk-431c1646.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/82e6779c1851/vmlinux-431c1646.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d5d4a104ce36/bzImage-431c1646.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7a2ba6b7b66340cff225@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ntfs_fix_post_read fs/ntfs3/fsntfs.c:180 [inline]
BUG: KMSAN: uninit-value in ntfs_read_bh+0x1eb/0xde0 fs/ntfs3/fsntfs.c:1317
 ntfs_fix_post_read fs/ntfs3/fsntfs.c:180 [inline]
 ntfs_read_bh+0x1eb/0xde0 fs/ntfs3/fsntfs.c:1317
 indx_read+0x44e/0x17b0 fs/ntfs3/index.c:1067
 indx_find+0xd12/0x1440 fs/ntfs3/index.c:1181
 indx_update_dup+0x607/0xf80 fs/ntfs3/index.c:2666
 ni_update_parent+0x12de/0x14b0 fs/ntfs3/frecord.c:3301
 ni_write_inode+0x1cf4/0x1de0 fs/ntfs3/frecord.c:3392
 ntfs3_write_inode+0x94/0xb0 fs/ntfs3/inode.c:1052
 write_inode fs/fs-writeback.c:1497 [inline]
 __writeback_single_inode+0x849/0x12c0 fs/fs-writeback.c:1716
 writeback_sb_inodes+0xc95/0x1e00 fs/fs-writeback.c:1947
 wb_writeback+0x4df/0xea0 fs/fs-writeback.c:2127
 wb_do_writeback fs/fs-writeback.c:2274 [inline]
 wb_workfn+0x40b/0x1940 fs/fs-writeback.c:2314
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xae0/0x1c40 kernel/workqueue.c:3312
 worker_thread+0xea7/0x14d0 kernel/workqueue.c:3389
 kthread+0x3e2/0x540 kernel/kthread.c:389
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Uninit was stored to memory at:
 ntfs_read_run_nb+0x786/0x1070 fs/ntfs3/fsntfs.c:1252
 ntfs_read_bh+0x64/0xde0 fs/ntfs3/fsntfs.c:1313
 indx_read+0x44e/0x17b0 fs/ntfs3/index.c:1067
 indx_find+0xd12/0x1440 fs/ntfs3/index.c:1181
 indx_update_dup+0x607/0xf80 fs/ntfs3/index.c:2666
 ni_update_parent+0x12de/0x14b0 fs/ntfs3/frecord.c:3301
 ni_write_inode+0x1cf4/0x1de0 fs/ntfs3/frecord.c:3392
 ntfs3_write_inode+0x94/0xb0 fs/ntfs3/inode.c:1052
 write_inode fs/fs-writeback.c:1497 [inline]
 __writeback_single_inode+0x849/0x12c0 fs/fs-writeback.c:1716
 writeback_sb_inodes+0xc95/0x1e00 fs/fs-writeback.c:1947
 wb_writeback+0x4df/0xea0 fs/fs-writeback.c:2127
 wb_do_writeback fs/fs-writeback.c:2274 [inline]
 wb_workfn+0x40b/0x1940 fs/fs-writeback.c:2314
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xae0/0x1c40 kernel/workqueue.c:3312
 worker_thread+0xea7/0x14d0 kernel/workqueue.c:3389
 kthread+0x3e2/0x540 kernel/kthread.c:389
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Uninit was created at:
 __alloc_pages_noprof+0x9d6/0xe70 mm/page_alloc.c:4718
 alloc_pages_mpol_noprof+0x299/0x990 mm/mempolicy.c:2263
 alloc_pages_noprof mm/mempolicy.c:2343 [inline]
 folio_alloc_noprof+0x1db/0x310 mm/mempolicy.c:2350
 filemap_alloc_folio_noprof+0xa6/0x440 mm/filemap.c:1008
 __filemap_get_folio+0xa05/0x14b0 mm/filemap.c:1950
 grow_dev_folio fs/buffer.c:1047 [inline]
 grow_buffers fs/buffer.c:1113 [inline]
 __getblk_slow fs/buffer.c:1139 [inline]
 bdev_getblk+0x2c9/0xab0 fs/buffer.c:1441
 __getblk include/linux/buffer_head.h:381 [inline]
 sb_getblk include/linux/buffer_head.h:387 [inline]
 ntfs_get_bh+0x605/0x1190 fs/ntfs3/fsntfs.c:1365
 indx_new+0x1bc/0x780 fs/ntfs3/index.c:955
 indx_insert_into_root+0x2fd1/0x37d0 fs/ntfs3/index.c:1723
 indx_insert_entry+0xe1d/0xee0 fs/ntfs3/index.c:1982
 ntfs_create_inode+0x4391/0x4df0 fs/ntfs3/inode.c:1689
 ntfs_mkdir+0x56/0x70 fs/ntfs3/namei.c:207
 vfs_mkdir+0x4a0/0x780 fs/namei.c:4210
 do_mkdirat+0x529/0x810 fs/namei.c:4233
 __do_sys_mkdirat fs/namei.c:4248 [inline]
 __se_sys_mkdirat fs/namei.c:4246 [inline]
 __x64_sys_mkdirat+0xc6/0x120 fs/namei.c:4246
 x64_sys_call+0x3a81/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:259
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 2918 Comm: kworker/u8:9 Not tainted 6.11.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Workqueue: writeback wb_workfn (flush-7:4)
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
