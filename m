Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EA323CB
	for <ntfs3@lists.linux.dev>; Fri, 29 Nov 2024 01:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732844607; cv=none; b=IG8qmmq2vxjGwLonj16zSltx4P3P9WznYt1GKB/9j5hMQXOzD9i3mKN9kSPqtZm83CsZrQYvXr5jSXz1H8a9gg9J2s1FauJ+Lc3zvB0YjmAYLwyy5eq/czKJn0fO7H3o6Y8yCwyQmjyhEv2pwoLw32rUKYvrhLDpSV43+pNC96E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732844607; c=relaxed/simple;
	bh=0NKPmTDYZprLLfqdTeAUES8TLuRt/vsuCncfqEDnlaI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=olhh2LW+FQOAKVmzE14zVZ/CkgDu1nvc4pvpozdUeCo3yZzj3yBniNaH61vP3U5ydJ2Osnf/XvpM31U8hAGhW9aZPgM/8TGAror/jWVsNQzLlndHfpPS5vplXZDkXLBBgn6HyGHg32k2ujPmIrYedUIm2rIWnMVP6JsDJqqFsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83e5dd390bfso172669439f.1
        for <ntfs3@lists.linux.dev>; Thu, 28 Nov 2024 17:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732844605; x=1733449405;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0BWQ+KcqFlyaJd8fHki+iJ7tnvWHKnq2RRqMdIul4I=;
        b=QkzLVO8X5CyisY8eLsEMeTbVWd74Y/BYA8Vq2vhpI+bfWlDLbLcO+z5svNc7YKDUw/
         oa8rWNGgHzfw/982C/nRzbHblGb3Y5/TPEPEMof3U4/pghb+Wpq2oYDlxXjE+UIAL0w5
         GllWCFtH03jGim32xSoXsymyr0dsQEaV8sEoInRDJIYCv9f9snrSOImzBsrzY6AK50vp
         GA61LSprzDGTSFrZnPyO0cFkqimg4V61O4v3Svm+DzUzS6H1qz4Cr4EW6oANBjaFbR9a
         8pgI3BVKjTjOeWbt+eajjjcM0G42o23QtHjWVYTtyxAfxtY9J68/wW7/qTzWj31+rWZv
         Z1OA==
X-Forwarded-Encrypted: i=1; AJvYcCXFrTf1xgX7rfXgw5imlmHpP3Le8Wt8ZaOKr9kMQ/2m11zAQw/e2VJBs55dEgO4uFPpR9VaMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyibXmbeiejBipfWUFaE/ZK6RJApGMVAdpajAQlPsgIKb83Z4+
	sm6GsiLop1XoxAa1f0FDh7VfvlPDcujO2jsNh4mVzYXXPGvGKbiq5HyxaOtQNCwO21T58EDTIcQ
	ugeqUySkbqadQQHyJwNl2o0/48ngizEFv9ltREyQdW27SiHL/Y3+4Foc=
X-Google-Smtp-Source: AGHT+IEt9sY/4RMTcRr6yzPXjiVfwL9QeLGqF/beJ9tbXk/S5MzOGPCQOYhG2w+bUwwY99id+5i6Vv+tfOulfVzB3bmtMpgt2Rzr
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b02:b0:3a7:9c57:8544 with SMTP id
 e9e14a558f8ab-3a7cbd23fa7mr39204855ab.7.1732844604980; Thu, 28 Nov 2024
 17:43:24 -0800 (PST)
Date: Thu, 28 Nov 2024 17:43:24 -0800
In-Reply-To: <672dbff0.050a0220.69327.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67491c3c.050a0220.253251.009d.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in mark_as_free_ex (2)
From: syzbot <syzbot+8df514c431bd240c5644@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    7af08b57bcb9 Merge tag 'trace-v6.13-2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1607cf78580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129a9798def93175
dashboard link: https://syzkaller.appspot.com/bug?extid=8df514c431bd240c5644
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136b33c0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f6e67f04bc76/disk-7af08b57.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/31932bddea1f/vmlinux-7af08b57.xz
kernel image: https://storage.googleapis.com/syzbot-assets/62707034e0dd/bzImage-7af08b57.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/8dd5f7e91d9f/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/732aad914e95/mount_3.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8df514c431bd240c5644@syzkaller.appspotmail.com

loop2: detected capacity change from 0 to 4096
======================================================
WARNING: possible circular locking dependency detected
6.12.0-syzkaller-10689-g7af08b57bcb9 #0 Not tainted
------------------------------------------------------
syz.2.134/6316 is trying to acquire lock:
ffff88807b844270 (&wnd->rw_lock){++++}-{4:4}, at: mark_as_free_ex+0x3e/0x390 fs/ntfs3/fsntfs.c:2484

but task is already holding lock:
ffff88805ac3adc0 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_truncate fs/ntfs3/file.c:505 [inline]
ffff88805ac3adc0 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_setattr+0x6d3/0xb80 fs/ntfs3/file.c:824

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ni->file.run_lock#2){++++}-{4:4}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       down_read+0xb1/0xa40 kernel/locking/rwsem.c:1524
       run_unpack_ex+0x55e/0x9e0 fs/ntfs3/run.c:1119
       ntfs_read_mft fs/ntfs3/inode.c:401 [inline]
       ntfs_iget5+0x1f9a/0x37b0 fs/ntfs3/inode.c:537
       dir_search_u+0x2fe/0x3a0 fs/ntfs3/dir.c:264
       ntfs_lookup+0x106/0x1f0 fs/ntfs3/namei.c:85
       lookup_one_qstr_excl+0x11f/0x260 fs/namei.c:1692
       do_renameat2+0x670/0x13f0 fs/namei.c:5165
       __do_sys_rename fs/namei.c:5271 [inline]
       __se_sys_rename fs/namei.c:5269 [inline]
       __x64_sys_rename+0x82/0x90 fs/namei.c:5269
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

4 locks held by syz.2.134/6316:
 #0: ffff88807b842420 (sb_writers#13){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:515
 #1: ffff88805ac3afa8 (&sb->s_type->i_mutex_key#22){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:818 [inline]
 #1: ffff88805ac3afa8 (&sb->s_type->i_mutex_key#22){+.+.}-{4:4}, at: do_truncate+0x20c/0x310 fs/open.c:63
 #2: ffff88805ac3ad10 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1110 [inline]
 #2: ffff88805ac3ad10 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_truncate fs/ntfs3/file.c:503 [inline]
 #2: ffff88805ac3ad10 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_setattr+0x6bf/0xb80 fs/ntfs3/file.c:824
 #3: ffff88805ac3adc0 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_truncate fs/ntfs3/file.c:505 [inline]
 #3: ffff88805ac3adc0 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_setattr+0x6d3/0xb80 fs/ntfs3/file.c:824

stack backtrace:
CPU: 1 UID: 0 PID: 6316 Comm: syz.2.134 Not tainted 6.12.0-syzkaller-10689-g7af08b57bcb9 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
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
RIP: 0033:0x7fb9f1980809
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb9f282a058 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007fb9f1b45fa0 RCX: 00007fb9f1980809
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000200002c0
RBP: 00007fb9f19f393e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fb9f1b45fa0 R15: 00007ffcedbec7c8
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
