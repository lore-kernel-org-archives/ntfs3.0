Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1FC1D1308
	for <ntfs3@lists.linux.dev>; Fri,  8 Nov 2024 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731051506; cv=none; b=XdDZcZZtZrdCM63+eIXfvwcWjd2AobXiTF5ZW3YEEOcbyPSHNkzo5JW5t021tSU0BzqevyodntlAPV+3kSzT7tq309ArkwR6rdfukmSB/gLRStI2qA84/Z5oronhYBd5DMItG82piSnytIp2ApWwacuVbmPtAegcLBIeHDCddT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731051506; c=relaxed/simple;
	bh=XA3YutDlsteCXOj7lAEKcn8lJH/n6R8v8oPAMzv/0yQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=O/37HGJjGpNyLqMgD1Ter8/4n24mpAY4p9oBjEzR769+zNzRfG8xJRShT5fzGhz8/+k+OGS1bKW6t+jk1kamjfC7hMgMFA9zbrSQx9tSsLgb3qGLaMNLtYj+R8J+ZqjQ9yFA1AoLHN4/fKb6qe6GwPyji8timo7EcpVMFPi9AQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83aaedba7b5so217577439f.0
        for <ntfs3@lists.linux.dev>; Thu, 07 Nov 2024 23:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731051504; x=1731656304;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU5RRIBS+hCjtr95d03rnjZEZvv+SRN27jYx8sROZEc=;
        b=G/GnIqHhNWg3bv2Yzqb0cgOG6gxl6HwgtZU/suQkVb2WxAjAOZiFdhyUCs7i9OjA49
         fxzTCRk+zp4WRc9Am/uNq28PiQa2RqhceWWxJhH6b/h5vJ4LLcxTJtr1TWNVHCrf9iG9
         DTb21S3C6dYjFh42g1PFuQupBOi/O/kuJhElMXWi7WTiHorEPe3n7IXZQUdp8VDWuJuw
         2JN+y2F+lYTz05GtF2WLvQgm9PbskmC5sfiOuN9hPitrRfjTRhIZw216vwX7H800/lA6
         lDDB2E00iddTM4NdCT8QGqyvVahAaNyi/zoS6rJqhArQhdcNwhURrYp8apZBZdxSJkas
         HI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnrPoDIGup93Co3AfVk0WJjTBitWTw61sBpOEcaQvlGyYwarUByyeiapFMvAICOSsLs4ZWKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZwsMZ8UkGxxYYlL2HTOmUqLADeuIhUwboMUfqwgRHpLysTGyx
	ftdME6e2pDG1zJpz2EpQ1w+bi6AFAbNESn9JR/ZvQoCl8My/J9SmxbNxmXo702BctVXR0DfQw5w
	cBM7OnCJd7Ahrhk9Xrcyju+Xke9n5JoKiepgmUVAVLGCKWfqgqyQyvWo=
X-Google-Smtp-Source: AGHT+IF6tj7Uz4k188SrwIDR1TxnnPKnK+tqsRpi2/fUC9IxSY58PuZcDPymaBk0Ei4GzIS/6DNHT6H3e6p1fXukstW5IUvA/Oed
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3a87:b0:3a4:e8cc:2aaa with SMTP id
 e9e14a558f8ab-3a6f1a07897mr26508475ab.10.1731051504167; Thu, 07 Nov 2024
 23:38:24 -0800 (PST)
Date: Thu, 07 Nov 2024 23:38:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672dbff0.050a0220.69327.0002.GAE@google.com>
Subject: [syzbot] [ntfs3?] possible deadlock in mark_as_free_ex (2)
From: syzbot <syzbot+8df514c431bd240c5644@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    74741a050b79 Add linux-next specific files for 20241107
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11f6035f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d3ef0574c9dc8b00
dashboard link: https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8993ea1d09da/disk-74741a05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dab7bc3c6e88/vmlinux-74741a05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fda543ad532f/bzImage-74741a05.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8df514c431bd240c5644@syzkaller.appspotmail.com

loop3: detected capacity change from 0 to 4096
======================================================
WARNING: possible circular locking dependency detected
6.12.0-rc6-next-20241107-syzkaller #0 Not tainted
------------------------------------------------------
syz.3.1671/10772 is trying to acquire lock:
ffff88803034a270 (&wnd->rw_lock){++++}-{4:4}, at: mark_as_free_ex+0x3e/0x390 fs/ntfs3/fsntfs.c:2484

but task is already holding lock:
ffff888069fc0908 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_truncate fs/ntfs3/file.c:505 [inline]
ffff888069fc0908 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_setattr+0x6d3/0xb80 fs/ntfs3/file.c:824

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ni->file.run_lock#2){++++}-{4:4}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       down_read+0xb1/0xa40 kernel/locking/rwsem.c:1524
       run_unpack_ex+0x55e/0x9e0 fs/ntfs3/run.c:1119
       ntfs_read_mft fs/ntfs3/inode.c:401 [inline]
       ntfs_iget5+0x1f9a/0x37b0 fs/ntfs3/inode.c:537
       ntfs_dir_emit fs/ntfs3/dir.c:335 [inline]
       ntfs_read_hdr+0x700/0xb80 fs/ntfs3/dir.c:383
       ntfs_readdir+0x91f/0xf00 fs/ntfs3/dir.c:494
       iterate_dir+0x571/0x800 fs/readdir.c:108
       __do_sys_getdents fs/readdir.c:322 [inline]
       __se_sys_getdents+0x1fd/0x4e0 fs/readdir.c:308
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&wnd->rw_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
       __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5226
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       down_write_nested+0xa2/0x220 kernel/locking/rwsem.c:1693
       mark_as_free_ex+0x3e/0x390 fs/ntfs3/fsntfs.c:2484
       run_deallocate_ex+0x244/0x5f0 fs/ntfs3/attrib.c:122
       attr_set_size+0x168d/0x4300 fs/ntfs3/attrib.c:753
       ntfs_truncate fs/ntfs3/file.c:506 [inline]
       ntfs_setattr+0x7a4/0xb80 fs/ntfs3/file.c:824
       notify_change+0xbca/0xe90 fs/attr.c:552
       do_truncate+0x220/0x310 fs/open.c:65
       handle_truncate fs/namei.c:3449 [inline]
       do_open fs/namei.c:3832 [inline]
       path_openat+0x2e1e/0x3590 fs/namei.c:3987
       do_filp_open+0x27f/0x4e0 fs/namei.c:4014
       do_sys_openat2+0x13e/0x1d0 fs/open.c:1402
       do_sys_open fs/open.c:1417 [inline]
       __do_sys_creat fs/open.c:1495 [inline]
       __se_sys_creat fs/open.c:1489 [inline]
       __x64_sys_creat+0x123/0x170 fs/open.c:1489
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ni->file.run_lock#2);
                               lock(&wnd->rw_lock);
                               lock(&ni->file.run_lock#2);
  lock(&wnd->rw_lock);

 *** DEADLOCK ***

4 locks held by syz.3.1671/10772:
 #0: ffff88803034c420 (sb_writers#22){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:515
 #1: ffff888069fc0af0 (&sb->s_type->i_mutex_key#35){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:817 [inline]
 #1: ffff888069fc0af0 (&sb->s_type->i_mutex_key#35){+.+.}-{4:4}, at: do_truncate+0x20c/0x310 fs/open.c:63
 #2: ffff888069fc0858 (&ni->ni_lock#2/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1110 [inline]
 #2: ffff888069fc0858 (&ni->ni_lock#2/5){+.+.}-{4:4}, at: ntfs_truncate fs/ntfs3/file.c:503 [inline]
 #2: ffff888069fc0858 (&ni->ni_lock#2/5){+.+.}-{4:4}, at: ntfs_setattr+0x6bf/0xb80 fs/ntfs3/file.c:824
 #3: ffff888069fc0908 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_truncate fs/ntfs3/file.c:505 [inline]
 #3: ffff888069fc0908 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_setattr+0x6d3/0xb80 fs/ntfs3/file.c:824

stack backtrace:
CPU: 0 UID: 0 PID: 10772 Comm: syz.3.1671 Not tainted 6.12.0-rc6-next-20241107-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2074
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5226
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
 down_write_nested+0xa2/0x220 kernel/locking/rwsem.c:1693
 mark_as_free_ex+0x3e/0x390 fs/ntfs3/fsntfs.c:2484
 run_deallocate_ex+0x244/0x5f0 fs/ntfs3/attrib.c:122
 attr_set_size+0x168d/0x4300 fs/ntfs3/attrib.c:753
 ntfs_truncate fs/ntfs3/file.c:506 [inline]
 ntfs_setattr+0x7a4/0xb80 fs/ntfs3/file.c:824
 notify_change+0xbca/0xe90 fs/attr.c:552
 do_truncate+0x220/0x310 fs/open.c:65
 handle_truncate fs/namei.c:3449 [inline]
 do_open fs/namei.c:3832 [inline]
 path_openat+0x2e1e/0x3590 fs/namei.c:3987
 do_filp_open+0x27f/0x4e0 fs/namei.c:4014
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_creat fs/open.c:1495 [inline]
 __se_sys_creat fs/open.c:1489 [inline]
 __x64_sys_creat+0x123/0x170 fs/open.c:1489
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fca7137e719
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fca720ea038 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007fca71535f80 RCX: 00007fca7137e719
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000020002440
RBP: 00007fca713f139e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fca71535f80 R15: 00007fffe9ba7408
 </TASK>


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
