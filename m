Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9289537BE6D
	for <ntfs3@lists.linux.dev>; Fri, 20 Mar 2026 22:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774047390; cv=none; b=acLOCCWRr/Xk7qMd5HxZt48Vx4hvTuhMpUBg2+yiC35dtkE5g4xJkoOm1fxq3Bw4/R/kW/Tw9ptIQU3BBIYUJTlzi3mQP9/io6yjbvPL+KkPzSKPtKyTX1hooq6YpKcts28puFW14s3CCZg27Ii0+KVLpfPYLJTwFgn5nvbXdcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774047390; c=relaxed/simple;
	bh=D86XXdQ5GPR6XTNos136618bB3pz9B1yi6lEnR3QRvc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lbxET+pR2ePGuro9fe5tW07uZ6rZEIOF+tKsFoN9dTVa9iRQluzO2RZvy0g2atAy+pdd8L9fbT9OrNZrwE1Aq/fgcPZ8XpEIgcizNZNA2Bzfh4oS5Z9qIzR/qkJ3CjZ84xgjngZZD6JIuUg45HOcYpIO7ADOp+PrZOskbZUSL+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-463ee33f9b2so7873877b6e.3
        for <ntfs3@lists.linux.dev>; Fri, 20 Mar 2026 15:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774047387; x=1774652187;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LH8QW4ALdNZBoFI/+Lkjaive+C+7Y/0oMYk4VOqADg=;
        b=Ir1enm5K9/wH2NB1EjSfAlw6PtsvwWB0Ug+xWfBg1dEk4K7fapykI8WSodLZS9ofgV
         vOz8G+xNZLHiaoKSSEiMwvxGKsCO/3MlqmQ9DQ8VAW7iTwZ+6c06GaczxowxhgR/aUIZ
         LqVaEmmsXFwIpqZjHo9CH0HMJuRX+jIfoJPRz8HOsbh2/jTTMaoL1Y62aL9BAqMYDr4G
         UOQ4L9Ma63EPNjR5AaXiRZyihwVGW8/h9x5b3tWOzm9JhMx7nCS6AEa+Go0w8+hjrsAr
         Uvc8c5Is/b/JI3dL9rM7Ql2UOrKCYLaOEqY7NuR0y7fJThqElk7T2S4xOwXgP2BhDs2H
         t6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVPl9FSVJjJgap/ZxdDloGIeLF0TUT1Q8HOQHOafJ6W9WBx4vfXniwiw2YW8lJPlKxxTb/lUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcm1Va74S5+BjWl784x8ROm1xmmQzzaeWKyrV6mFCkVntdzTuH
	09RN9saUvQn/8T/FYATQNGif4mWiLBPS0CZ4gVl785cNSDswuwPGyJ721LaU03kx6oBeNsSRzQt
	/X4TT23p8r8qsIiqsO6XQe0wdO/5w90gO78qeaXCcS9DKitwHLiFVxuUKe1g=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1392:b0:467:255a:7453 with SMTP id
 5614622812f47-467e5d9638fmr2543894b6e.14.1774047387599; Fri, 20 Mar 2026
 15:56:27 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:56:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69bdd09b.050a0220.3bf4de.0032.GAE@google.com>
Subject: [syzbot] [ntfs3?] memory leak in run_add_entry (2)
From: syzbot <syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0e4f8f1a3d08 Merge tag 'parisc-for-7.0-rc5' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=129f8cba580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5
dashboard link: https://syzkaller.appspot.com/bug?extid=7adcddaeeb860e5d3f2f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1716bada580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=169f8cba580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/022aea4aa8f7/disk-0e4f8f1a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2698fe956577/vmlinux-0e4f8f1a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/49c3df9c1f67/bzImage-0e4f8f1a.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f0d7b4f7d563/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7adcddaeeb860e5d3f2f@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88811e304200 (size 64):
  comm "syz.0.17", pid 6098, jiffies 4294950427
  hex dump (first 32 bytes):
    00 00 00 00 01 00 00 00 1e 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 692543f4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kvmalloc_node_noprof+0x53d/0x770 mm/slub.c:6752
    run_add_entry+0x108/0x730 fs/ntfs3/run.c:390
    attr_allocate_clusters+0x15a/0x450 fs/ntfs3/attrib.c:199
    indx_create_allocate fs/ntfs3/index.c:1449 [inline]
    indx_insert_into_root+0x575/0xb20 fs/ntfs3/index.c:1705
    indx_insert_entry+0x182/0x290 fs/ntfs3/index.c:1993
    ni_add_name+0x1ab/0x2e0 fs/ntfs3/frecord.c:2764
    ntfs_link_inode+0x95/0xc0 fs/ntfs3/inode.c:1794
    ntfs_link+0xb4/0x180 fs/ntfs3/namei.c:146
    vfs_link+0x270/0x5a0 fs/namei.c:5746
    filename_linkat+0x262/0x3c0 fs/namei.c:5814
    __do_sys_link fs/namei.c:5847 [inline]
    __se_sys_link fs/namei.c:5843 [inline]
    __x64_sys_link+0x4b/0x70 fs/namei.c:5843
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888105b7a380 (size 64):
  comm "syz.0.18", pid 6114, jiffies 4294950436
  hex dump (first 32 bytes):
    00 00 00 00 01 00 00 00 1e 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 692543f4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kvmalloc_node_noprof+0x53d/0x770 mm/slub.c:6752
    run_add_entry+0x108/0x730 fs/ntfs3/run.c:390
    attr_allocate_clusters+0x15a/0x450 fs/ntfs3/attrib.c:199
    indx_create_allocate fs/ntfs3/index.c:1449 [inline]
    indx_insert_into_root+0x575/0xb20 fs/ntfs3/index.c:1705
    indx_insert_entry+0x182/0x290 fs/ntfs3/index.c:1993
    ni_add_name+0x1ab/0x2e0 fs/ntfs3/frecord.c:2764
    ntfs_link_inode+0x95/0xc0 fs/ntfs3/inode.c:1794
    ntfs_link+0xb4/0x180 fs/ntfs3/namei.c:146
    vfs_link+0x270/0x5a0 fs/namei.c:5746
    filename_linkat+0x262/0x3c0 fs/namei.c:5814
    __do_sys_link fs/namei.c:5847 [inline]
    __se_sys_link fs/namei.c:5843 [inline]
    __x64_sys_link+0x4b/0x70 fs/namei.c:5843
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810ea19a40 (size 64):
  comm "syz.0.19", pid 6125, jiffies 4294950445
  hex dump (first 32 bytes):
    00 00 00 00 01 00 00 00 1e 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 692543f4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kvmalloc_node_noprof+0x53d/0x770 mm/slub.c:6752
    run_add_entry+0x108/0x730 fs/ntfs3/run.c:390
    attr_allocate_clusters+0x15a/0x450 fs/ntfs3/attrib.c:199
    indx_create_allocate fs/ntfs3/index.c:1449 [inline]
    indx_insert_into_root+0x575/0xb20 fs/ntfs3/index.c:1705
    indx_insert_entry+0x182/0x290 fs/ntfs3/index.c:1993
    ni_add_name+0x1ab/0x2e0 fs/ntfs3/frecord.c:2764
    ntfs_link_inode+0x95/0xc0 fs/ntfs3/inode.c:1794
    ntfs_link+0xb4/0x180 fs/ntfs3/namei.c:146
    vfs_link+0x270/0x5a0 fs/namei.c:5746
    filename_linkat+0x262/0x3c0 fs/namei.c:5814
    __do_sys_link fs/namei.c:5847 [inline]
    __se_sys_link fs/namei.c:5843 [inline]
    __x64_sys_link+0x4b/0x70 fs/namei.c:5843
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
