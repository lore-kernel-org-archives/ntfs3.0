Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E1293C6C
	for <ntfs3@lists.linux.dev>; Tue, 24 Jun 2025 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791092; cv=none; b=ZNJaQsjd8mBWpGHEP/RiRkQfzPmUdL5nJnKwSblCbpIbfArUUTkPDhB77w0cvCtSdJqfkti8igfZmSz0ABjjsMduq2kUexo42Ba3qfU2FRk2IfXqwMsj3kv6j7ALNlforNxxsBnQdfVQaLB1Ch4WEL0ITt5MPBhL8ve8DH60fG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791092; c=relaxed/simple;
	bh=MUF325R0oiGozTf+4Yo2iE1fnbJVyBm5y8AwePbAnhY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RtnKI5NMhoFpfN96wVM0wSGm5H1pWs/FPce/pIeI/WjkbC3cuBbQUH/durbdx1ZUm50bCtKtAb2O0ODzmC7ZoVi7DS3ja8sJLeuI8mvsBg/y0F8JUBw6Zjncb1BWDFYDg1ebSiPbAt9QbvGfX9YvYRw9H++h6YStF4RxnyY/7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddbd339f3dso8995555ab.0
        for <ntfs3@lists.linux.dev>; Tue, 24 Jun 2025 11:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791089; x=1751395889;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8aq2ifguR0kuoI6ywnkw0QcPiAtx251brKiwRhhGl8=;
        b=eRAk35t/tdgjkfiEDn75zK0G3+7F7n1RXKtw9Iot5iza+huXa1w+jasta2fAwPZXl0
         fgZBvv2ls/v8Ws1DNMC3/EwSzuWijSDWJ0fULwUub9PtczVaBj2ZGJrsIKrlkQow5fHv
         ULiFh5F18359tU6A6kA32Nt2py971QfPolGOQW8VHNIe49KThRZxAqKqlikJ55E9hivy
         nlaAMvZyVEkUIpAiezLRlSa9Fz4uNbLeoH3/iCyZvMJLiGudnn1eHmQqwN4Cwj0HOXEq
         h6yyAr9+gSEvQdSjUxx5hPYCi1w5qH6u+derFFeuLfLl92krZhqQR0Ksdtjbas6UKjIq
         aKYw==
X-Forwarded-Encrypted: i=1; AJvYcCVGoqBd3xCehG9bqMtMOQIlVzt/8h+XjvzFSjFiqqoBbawZPnSIPGavMrntjmZFyOeney78wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWm7GjdeEQIv4Vw4z60XJKVIAYnYrrpka4klQ5k9whoQiQ0UPV
	y0vwtf9Fxc9o2mOh8wx9zPLm4Fy5U/Dqib124U/qu0CjCx0fi9qYGFzmY7IEN8sisxaWCXNJXg4
	zDWvXxxLHt4tkNYOxAkW64MqQopdGJzX/Eb+dcRDQhK5uKFSIY0PPHHnK338=
X-Google-Smtp-Source: AGHT+IGvxAnUmk3h+KAd3NNTOuEsKsfc9m5sYSufImUReBuHqVbFpJ2yLD061yEgsMyhKCu34rTYSMwqZ4bK/XxgVOKsvP/iP6HI
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fcc:b0:3dd:f1bb:da0b with SMTP id
 e9e14a558f8ab-3df328a4b96mr2311195ab.7.1750791089420; Tue, 24 Jun 2025
 11:51:29 -0700 (PDT)
Date: Tue, 24 Jun 2025 11:51:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685af3b1.a00a0220.2e5631.0090.GAE@google.com>
Subject: [syzbot] [ntfs3?] possible deadlock in ntfs_file_mmap_prepare
From: syzbot <syzbot+a5d1c9dfa91705cd2f6d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5d4809e25903 Add linux-next specific files for 20250620
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17c65b0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
dashboard link: https://syzkaller.appspot.com/bug?extid=a5d1c9dfa91705cd2f6d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1776a182580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17762dd4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/16492bf6b788/disk-5d4809e2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7be284ded1de/vmlinux-5d4809e2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/467d717f0d9c/bzImage-5d4809e2.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/6f34591c3e45/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/d137199587c7/mount_3.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a5d1c9dfa91705cd2f6d@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc2-next-20250620-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor414/5843 is trying to acquire lock:
ffff8880739bcd08 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:869 [inline]
ffff8880739bcd08 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: ntfs_file_mmap_prepare+0x599/0x770 fs/ntfs3/file.c:314

but task is already holding lock:
ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_pgoff+0x1bd/0x4c0 mm/util.c:577

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&mm->mmap_lock){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       gup_fast_fallback+0x22e/0x2270 mm/gup.c:3366
       iov_iter_extract_user_pages lib/iov_iter.c:1846 [inline]
       iov_iter_extract_pages+0x35a/0x5e0 lib/iov_iter.c:1909
       dio_refill_pages fs/direct-io.c:172 [inline]
       dio_get_page fs/direct-io.c:213 [inline]
       do_direct_IO fs/direct-io.c:915 [inline]
       __blockdev_direct_IO+0x1166/0x3490 fs/direct-io.c:1243
       blockdev_direct_IO include/linux/fs.h:3497 [inline]
       ntfs_direct_IO+0x20b/0x410 fs/ntfs3/inode.c:813
       generic_file_read_iter+0x319/0x510 mm/filemap.c:2881
       do_iter_readv_writev+0x56b/0x7f0 fs/read_write.c:-1
       vfs_readv+0x253/0x850 fs/read_write.c:1018
       do_preadv fs/read_write.c:1132 [inline]
       __do_sys_preadv2 fs/read_write.c:1191 [inline]
       __se_sys_preadv2+0x179/0x290 fs/read_write.c:1182
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
       inode_lock include/linux/fs.h:869 [inline]
       ntfs_file_mmap_prepare+0x599/0x770 fs/ntfs3/file.c:314
       vfs_mmap_prepare include/linux/fs.h:2294 [inline]
       call_mmap_prepare mm/vma.c:2585 [inline]
       __mmap_region mm/vma.c:2657 [inline]
       mmap_region+0xb4a/0x2080 mm/vma.c:2746
       do_mmap+0xc45/0x10d0 mm/mmap.c:561
       vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
       ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&mm->mmap_lock);
                               lock(&sb->s_type->i_mutex_key#15);
                               lock(&mm->mmap_lock);
  lock(&sb->s_type->i_mutex_key#15);

 *** DEADLOCK ***

1 lock held by syz-executor414/5843:
 #0: ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
 #0: ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_pgoff+0x1bd/0x4c0 mm/util.c:577

stack backtrace:
CPU: 1 UID: 0 PID: 5843 Comm: syz-executor414 Not tainted 6.16.0-rc2-next-20250620-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2046
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2178
 check_prev_add kernel/locking/lockdep.c:3168 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
 down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
 inode_lock include/linux/fs.h:869 [inline]
 ntfs_file_mmap_prepare+0x599/0x770 fs/ntfs3/file.c:314
 vfs_mmap_prepare include/linux/fs.h:2294 [inline]
 call_mmap_prepare mm/vma.c:2585 [inline]
 __mmap_region mm/vma.c:2657 [inline]
 mmap_region+0xb4a/0x2080 mm/vma.c:2746
 do_mmap+0xc45/0x10d0 mm/mmap.c:561
 vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
 ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd3b0279469
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0b2f7dd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 0000200000000080 RCX: 00007fd3b0279469
RDX: 000000000000000e RSI: 0000000000001000 RDI: 0000200000001000
RBP: 00002000000000c0 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000011 R11: 0000000000000246 R12: 0031656c69662f2e
R13: 0000200000000040 R14: 431bde82d7b634db R15: 00007fff0b2f7e40
 </TASK>


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
