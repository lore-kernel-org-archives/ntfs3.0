Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1B275AF5
	for <ntfs3@lists.linux.dev>; Mon,  8 Dec 2025 08:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765181004; cv=none; b=eZXfZMt+bVIB4QhsJFnVvpywuEIKYtqh/9wn7Gijuu4ENeuI/XOUt7UL5LMYI4Qzmz1Adp1P2PJqt0NT6zFu5PdFdwbnaB8i2Zd3YeT1owELZVOAdlMma6BsahNP5yH7Kd6q9nwrCErPcbz87aFoLcOp89MISRoMoFm4RCo1Avw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765181004; c=relaxed/simple;
	bh=g1gSpnkYvN156G/5CaWvJDsX0EuQoFTiiejopRSRZP8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pj1W/QR3KCv08HDDuWODQL9mL8EsRS5+Tfja9yrjlPcj6HAf80xXSF79ve3w3rN3MCv2emHoiuHivyclrco7TpN5legJheK3tGys7U+vDGOgY+nGf/Fq4XMxZi0YHWmDmwkNPFAEeImiOCIxMnWn3oibJfpUMPI2K36B7uyJu6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6574ff2be86so4784784eaf.0
        for <ntfs3@lists.linux.dev>; Mon, 08 Dec 2025 00:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181001; x=1765785801;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OMF7MwxITN8IqOzeI7Z+qVf2dT5ENMU6TgIGzY8C1w=;
        b=AiYUrP7nqy6VYSTnioeGcJ0NGlnefT1kFu6Qf5n2xd8LqmJVraHwYZafMaHLwjcpYq
         7wBaAJTdKsVUyJV2aELmK2EKacTM0mLQ8SJZN/pc3uD9+bF/LY2AJ+RbpnOB/zfmYC9H
         Eo9JYRBkST4Q2gmaHl3rWjNoN8cyhUbo4AA8tCRhxdoOstKPelmZVqK/LTMAzmuGWHpm
         FpvBGzlJx8QOSG9x55j6oa7+6sGxFvbtfHNRCmpvujfne/Q+wSBb+FjMLaD6ZrdWpJe/
         GfGUY4JoVMhtjsjFoV/q2T1beHTzT3AyVwtC43afkUj7gUduJIXzXscOonPsgEtLW3vi
         hPGA==
X-Forwarded-Encrypted: i=1; AJvYcCXMfps+SxryOAIQpt/4JQZ+AuUEXzqxlqJLQYwGK6NzucEVrSlaq7uWyUkW6DG6YGM70A825A==@lists.linux.dev
X-Gm-Message-State: AOJu0YykvHeSRhcLZF/1xiUBMpnvRJYjDcnrNPE576aeRfycSatL4wU9
	IoEN4VWHGz5Wol6+uLDIRCdPoD1TRtol4eIXfBO1Fi0U5R3dbsongtQWsLyCIJnGgnZfQpAzi6f
	FDSduvLb3FMNNj8zlaoYcb2HCvsOklH5+5iZIyYaMtoGBQdOaBEn6TdlGiyQ=
X-Google-Smtp-Source: AGHT+IEemnX0rwd99mRyv2hEAdxqRrCX3YaE7vOBBXvsPNR5z9UdzBHT/+de6+vt6cD+JGjRzrq9Xiv9htMZkO7BWa1TrHv1B4+3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8c3:b0:659:9a49:8f70 with SMTP id
 006d021491bc7-6599a96106fmr2807296eaf.53.1765181001660; Mon, 08 Dec 2025
 00:03:21 -0800 (PST)
Date: Mon, 08 Dec 2025 00:03:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69368649.a70a0220.38f243.0092.GAE@google.com>
Subject: [syzbot] [ntfs3?] memory leak in ntfs_init_fs_context (2)
From: syzbot <syzbot+23aee7afc440fe803545@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    37bb2e7217b0 Merge tag 'staging-6.19-rc1' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1776d21a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69400c231dedfdcf
dashboard link: https://syzkaller.appspot.com/bug?extid=23aee7afc440fe803545
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122ae6c2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=114c0a1a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b58f82601351/disk-37bb2e72.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/df36cf8947a4/vmlinux-37bb2e72.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8dbeda3b28aa/bzImage-37bb2e72.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/9248e307ba7d/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+23aee7afc440fe803545@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888112e78cc0 (size 32):
  comm "syz.0.17", pid 6088, jiffies 4294942706
  hex dump (first 32 bytes):
    80 7c 6b 27 81 88 ff ff 00 00 00 00 00 00 00 00  .|k'............
    00 00 00 00 00 00 00 00 fe ff fe ff 5b 04 00 00  ............[...
  backtrace (crc c20f03ab):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4953 [inline]
    slab_alloc_node mm/slub.c:5258 [inline]
    __kmalloc_cache_noprof+0x3b2/0x570 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    __ntfs_init_fs_context fs/ntfs3/super.c:1804 [inline]
    ntfs_init_fs_context+0x26/0x1c0 fs/ntfs3/super.c:1855
    alloc_fs_context+0x2a0/0x6e0 fs/fs_context.c:315
    do_new_mount fs/namespace.c:3692 [inline]
    path_mount+0x93f/0x1320 fs/namespace.c:4022
    do_mount fs/namespace.c:4035 [inline]
    __do_sys_mount fs/namespace.c:4224 [inline]
    __se_sys_mount fs/namespace.c:4201 [inline]
    __x64_sys_mount+0x1a2/0x1e0 fs/namespace.c:4201
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881276b7c80 (size 8):
  comm "syz.0.17", pid 6088, jiffies 4294942706
  hex dump (first 8 bytes):
    63 70 39 34 39 00 00 00                          cp949...
  backtrace (crc 48fb887b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4953 [inline]
    slab_alloc_node mm/slub.c:5258 [inline]
    __do_kmalloc_node mm/slub.c:5651 [inline]
    __kmalloc_node_track_caller_noprof+0x3af/0x670 mm/slub.c:5759
    __kmemdup_nul mm/util.c:64 [inline]
    kmemdup_nul+0x49/0xb0 mm/util.c:194
    vfs_parse_fs_qstr+0x76/0xe0 fs/fs_context.c:181
    vfs_parse_fs_string include/linux/fs_context.h:142 [inline]
    vfs_parse_monolithic_sep+0x100/0x150 fs/fs_context.c:227
    do_new_mount fs/namespace.c:3708 [inline]
    path_mount+0x566/0x1320 fs/namespace.c:4022
    do_mount fs/namespace.c:4035 [inline]
    __do_sys_mount fs/namespace.c:4224 [inline]
    __se_sys_mount fs/namespace.c:4201 [inline]
    __x64_sys_mount+0x1a2/0x1e0 fs/namespace.c:4201
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888112e78bc0 (size 32):
  comm "syz.0.18", pid 6096, jiffies 4294942711
  hex dump (first 32 bytes):
    a8 7c 6b 27 81 88 ff ff 00 00 00 00 00 00 00 00  .|k'............
    00 00 00 00 00 00 00 00 fe ff fe ff 5b 04 00 00  ............[...
  backtrace (crc 1ba9ea2d):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4953 [inline]
    slab_alloc_node mm/slub.c:5258 [inline]
    __kmalloc_cache_noprof+0x3b2/0x570 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    __ntfs_init_fs_context fs/ntfs3/super.c:1804 [inline]
    ntfs_init_fs_context+0x26/0x1c0 fs/ntfs3/super.c:1855
    alloc_fs_context+0x2a0/0x6e0 fs/fs_context.c:315
    do_new_mount fs/namespace.c:3692 [inline]
    path_mount+0x93f/0x1320 fs/namespace.c:4022
    do_mount fs/namespace.c:4035 [inline]
    __do_sys_mount fs/namespace.c:4224 [inline]
    __se_sys_mount fs/namespace.c:4201 [inline]
    __x64_sys_mount+0x1a2/0x1e0 fs/namespace.c:4201
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881276b7ca8 (size 8):
  comm "syz.0.18", pid 6096, jiffies 4294942711
  hex dump (first 8 bytes):
    63 70 39 34 39 00 00 00                          cp949...
  backtrace (crc 48fb887b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4953 [inline]
    slab_alloc_node mm/slub.c:5258 [inline]
    __do_kmalloc_node mm/slub.c:5651 [inline]
    __kmalloc_node_track_caller_noprof+0x3af/0x670 mm/slub.c:5759
    __kmemdup_nul mm/util.c:64 [inline]
    kmemdup_nul+0x49/0xb0 mm/util.c:194
    vfs_parse_fs_qstr+0x76/0xe0 fs/fs_context.c:181
    vfs_parse_fs_string include/linux/fs_context.h:142 [inline]
    vfs_parse_monolithic_sep+0x100/0x150 fs/fs_context.c:227
    do_new_mount fs/namespace.c:3708 [inline]
    path_mount+0x566/0x1320 fs/namespace.c:4022
    do_mount fs/namespace.c:4035 [inline]
    __do_sys_mount fs/namespace.c:4224 [inline]
    __se_sys_mount fs/namespace.c:4201 [inline]
    __x64_sys_mount+0x1a2/0x1e0 fs/namespace.c:4201
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888126bfaaa0 (size 32):
  comm "syz.0.19", pid 6099, jiffies 4294942715
  hex dump (first 32 bytes):
    c8 7c 6b 27 81 88 ff ff 00 00 00 00 00 00 00 00  .|k'............
    00 00 00 00 00 00 00 00 fe ff fe ff 5b 04 00 00  ............[...
  backtrace (crc 547e8c5b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4953 [inline]
    slab_alloc_node mm/slub.c:5258 [inline]
    __kmalloc_cache_noprof+0x3b2/0x570 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    __ntfs_init_fs_context fs/ntfs3/super.c:1804 [inline]
    ntfs_init_fs_context+0x26/0x1c0 fs/ntfs3/super.c:1855
    alloc_fs_context+0x2a0/0x6e0 fs/fs_context.c:315
    do_new_mount fs/namespace.c:3692 [inline]
    path_mount+0x93f/0x1320 fs/namespace.c:4022
    do_mount fs/namespace.c:4035 [inline]
    __do_sys_mount fs/namespace.c:4224 [inline]
    __se_sys_mount fs/namespace.c:4201 [inline]
    __x64_sys_mount+0x1a2/0x1e0 fs/namespace.c:4201
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881276b7cc8 (size 8):
  comm "syz.0.19", pid 6099, jiffies 4294942715
  hex dump (first 8 bytes):
    63 70 39 34 39 00 00 00                          cp949...
  backtrace (crc 48fb887b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4953 [inline]
    slab_alloc_node mm/slub.c:5258 [inline]
    __do_kmalloc_node mm/slub.c:5651 [inline]
    __kmalloc_node_track_caller_noprof+0x3af/0x670 mm/slub.c:5759
    __kmemdup_nul mm/util.c:64 [inline]
    kmemdup_nul+0x49/0xb0 mm/util.c:194
    vfs_parse_fs_qstr+0x76/0xe0 fs/fs_context.c:181
    vfs_parse_fs_string include/linux/fs_context.h:142 [inline]
    vfs_parse_monolithic_sep+0x100/0x150 fs/fs_context.c:227
    do_new_mount fs/namespace.c:3708 [inline]
    path_mount+0x566/0x1320 fs/namespace.c:4022
    do_mount fs/namespace.c:4035 [inline]
    __do_sys_mount fs/namespace.c:4224 [inline]
    __se_sys_mount fs/namespace.c:4201 [inline]
    __x64_sys_mount+0x1a2/0x1e0 fs/namespace.c:4201
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88811b2eace0 (size 32):
  comm "syz.0.20", pid 6128, jiffies 4294943265
  hex dump (first 32 bytes):
    80 7a 6b 27 81 88 ff ff 00 00 00 00 00 00 00 00  .zk'............
    00 00 00 00 00 00 00 00 fe ff fe ff 5b 04 00 00  ............[...
  backtrace (crc e45f714d):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4953 [inline]
    slab_alloc_node mm/slub.c:5258 [inline]
    __kmalloc_cache_noprof+0x3b2/0x570 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    __ntfs_init_fs_context fs/ntfs3/super.c:1804 [inline]
    ntfs_init_fs_context+0x26/0x1c0 fs/ntfs3/super.c:1855
    alloc_fs_context+0x2a0/0x6e0 fs/fs_context.c:315
    do_new_mount fs/namespace.c:3692 [inline]
    path_mount+0x93f/0x1320 fs/namespace.c:4022
    do_mount fs/namespace.c:4035 [inline]
    __do_sys_mount fs/namespace.c:4224 [inline]
    __se_sys_mount fs/namespace.c:4201 [inline]
    __x64_sys_mount+0x1a2/0x1e0 fs/namespace.c:4201
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
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
