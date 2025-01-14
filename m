Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980E01E489
	for <ntfs3@lists.linux.dev>; Tue, 14 Jan 2025 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858785; cv=none; b=Y9m+TPh33UYH8orTOLa1Q0M4Y0l7DAWVo9Hai6QQ9J4fgF5ikwQTVoOOiz/zcJuSo9TLRYH80uN+kyjFYMQ6xRdxLiPO0CXyFkxyMfwXUxmcQQIxkLt2G02rZky8UbT2eYPHvKrqIFsRViTPN/GAyUTAsCy3AeUGxIzn//9f/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858785; c=relaxed/simple;
	bh=4wq0zAy0Ucq8UZ9GgQabCqlQtfJBRA8aMsgjbKLGArI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kHm0TLdsxSZqb+NjMBrU9ffiCLaHsY+ct4Pk47i7ibnMsleC4w+vUGGljBLYGaNLeY46r9Fe/nHV5Jvt+/RlMs35xokNudma3enmi2h/B25ka0G8l3oULWmIWke4pIt+iaeGMN2TYcmz33kB5IBLe2qWQ0L2/jQ+TqeyVLegegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ce6817ccd8so17427985ab.3
        for <ntfs3@lists.linux.dev>; Tue, 14 Jan 2025 04:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858782; x=1737463582;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJiMd8hRE0/eAkA52Xs8bYzBK3kzL1VUaPtlzv6Q924=;
        b=vMOBKhmDwh9zDjAZ0U6RPh7lDIrqDP31IEzyCokfd0g2IPi/XBubEDvm4V/ucMs0WG
         LlspTQU54iPkkVgfisEo1JMY3dGZMRv8IP7cSTpS6PTwWI8loIv37SKpWq1EEe+c3zkW
         GHbypDYSLTCyGGJQZe7tzFZRkjDmN0UlQMi591SqjpmQyAJvbrNwSBlmm3UYWg4dIO5h
         duXUGydMcC5fJCu5tLEVxTt5otxTlec9YWVNowvnMZkch6OKidxwDI0UOpE6nPpkV00I
         7f5IIH1q3eKv23FgXalEPdWRaeHhTRg2sberdcNL+9fXg0vbMq9S6ha//PMEFSpKW1lY
         4AaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnY1M//FRcW/+OVuEi8qA1r0tII/6tf7md2QsBtPrwl1Y08fVfW5i4UwJojmsv6MfphZGHOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZmhxczdvjtRAkogs3Uer3nJdjkGHzE8U/+qz36UlmiB100FMf
	xmLKfX6zHUaZg8QYdXAH82vfna9FSMie+mFzSclNyDr3uEhcI/dyvgycFAnn2Hn3waXipY6Mala
	MmSSNrFd60M4nSKl155S7ucKUtGrNhD2dpYmi+ek2F7kmkS4RshtGFo0=
X-Google-Smtp-Source: AGHT+IHWQ6iu1z6WGQd1K9jiymoCudwroFmi0Hw0UpJBxDHGBFIrCVcx6p8sDcEa3arLXPFYXZyR/L+Yb155eLIhWUkRTZTEcoC4
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2144:b0:3ce:7f8a:8548 with SMTP id
 e9e14a558f8ab-3ce7f8a86b5mr4360115ab.12.1736858782715; Tue, 14 Jan 2025
 04:46:22 -0800 (PST)
Date: Tue, 14 Jan 2025 04:46:22 -0800
In-Reply-To: <672dbfef.050a0220.69327.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67865c9e.050a0220.216c54.0077.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_look_for_free_space
From: syzbot <syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c45323b7560e Merge tag 'mm-hotfixes-stable-2025-01-13-00-0..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11732a18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aadf89e2f6db86cc
dashboard link: https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16825bc4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/32d07cc6940f/disk-c45323b7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8e06bc34aa34/vmlinux-c45323b7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0b63902920e8/bzImage-c45323b7.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/66d38d2d76ad/mount_1.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/386eda454648/mount_6.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com

loop3: detected capacity change from 0 to 4096
ntfs3(loop3): Different NTFS sector size (1024) and media sector size (512).
======================================================
WARNING: possible circular locking dependency detected
6.13.0-rc7-syzkaller-00019-gc45323b7560e #0 Not tainted
------------------------------------------------------
syz.3.19/6137 is trying to acquire lock:
ffff8880325ba270 (&wnd->rw_lock){++++}-{4:4}, at: ntfs_look_for_free_space+0x100/0x690 fs/ntfs3/fsntfs.c:362

but task is already holding lock:
ffff88805a99bc70 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_extend_mft+0x160/0x4b0 fs/ntfs3/fsntfs.c:511

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
       iterate_dir+0x573/0x800 fs/readdir.c:108
       __do_sys_getdents64 fs/readdir.c:403 [inline]
       __se_sys_getdents64+0x1e2/0x4b0 fs/readdir.c:389
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
       ntfs_look_for_free_space+0x100/0x690 fs/ntfs3/fsntfs.c:362
       attr_allocate_clusters+0x1d6/0x990 fs/ntfs3/attrib.c:159
       attr_set_size+0x2053/0x4300 fs/ntfs3/attrib.c:574
       ntfs_extend_mft+0x188/0x4b0 fs/ntfs3/fsntfs.c:512
       ntfs_look_free_mft+0x77c/0x10c0 fs/ntfs3/fsntfs.c:709
       ntfs_create_inode+0x581/0x3760 fs/ntfs3/inode.c:1305
       ntfs_create+0x3d/0x50 fs/ntfs3/namei.c:110
       lookup_open fs/namei.c:3649 [inline]
       open_last_lookups fs/namei.c:3748 [inline]
       path_openat+0x1c05/0x3590 fs/namei.c:3984
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

5 locks held by syz.3.19/6137:
 #0: ffff8880325bc420 (sb_writers#13){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:516
 #1: ffff88805a845bb8 (&type->i_mutex_dir_key#10){++++}-{4:4}, at: inode_lock include/linux/fs.h:818 [inline]
 #1: ffff88805a845bb8 (&type->i_mutex_dir_key#10){++++}-{4:4}, at: open_last_lookups fs/namei.c:3745 [inline]
 #1: ffff88805a845bb8 (&type->i_mutex_dir_key#10){++++}-{4:4}, at: path_openat+0x89a/0x3590 fs/namei.c:3984
 #2: ffff88805a845920 (&ni->ni_lock/6){+.+.}-{4:4}, at: ni_lock_dir fs/ntfs3/ntfs_fs.h:1115 [inline]
 #2: ffff88805a845920 (&ni->ni_lock/6){+.+.}-{4:4}, at: ntfs_create_inode+0x215/0x3760 fs/ntfs3/inode.c:1219
 #3: ffff8880325ba128 (&wnd->rw_lock/1){+.+.}-{4:4}, at: ntfs_look_free_mft+0x1e5/0x10c0 fs/ntfs3/fsntfs.c:571
 #4: ffff88805a99bc70 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_extend_mft+0x160/0x4b0 fs/ntfs3/fsntfs.c:511

stack backtrace:
CPU: 0 UID: 0 PID: 6137 Comm: syz.3.19 Not tainted 6.13.0-rc7-syzkaller-00019-gc45323b7560e #0
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
 ntfs_look_for_free_space+0x100/0x690 fs/ntfs3/fsntfs.c:362
 attr_allocate_clusters+0x1d6/0x990 fs/ntfs3/attrib.c:159
 attr_set_size+0x2053/0x4300 fs/ntfs3/attrib.c:574
 ntfs_extend_mft+0x188/0x4b0 fs/ntfs3/fsntfs.c:512
 ntfs_look_free_mft+0x77c/0x10c0 fs/ntfs3/fsntfs.c:709
 ntfs_create_inode+0x581/0x3760 fs/ntfs3/inode.c:1305
 ntfs_create+0x3d/0x50 fs/ntfs3/namei.c:110
 lookup_open fs/namei.c:3649 [inline]
 open_last_lookups fs/namei.c:3748 [inline]
 path_openat+0x1c05/0x3590 fs/namei.c:3984
 do_filp_open+0x27f/0x4e0 fs/namei.c:4014
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_creat fs/open.c:1495 [inline]
 __se_sys_creat fs/open.c:1489 [inline]
 __x64_sys_creat+0x123/0x170 fs/open.c:1489
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f07c8f85d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f07c9de6038 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007f07c9175fa0 RCX: 00007f07c8f85d29
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000020000240
RBP: 00007f07c9001b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f07c9175fa0 R15: 00007fff8eee1d18
 </TASK>
ntfs3(loop3): ino=0, attr_set_size


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
