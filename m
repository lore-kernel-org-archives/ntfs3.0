Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06FA7F
	for <ntfs3@lists.linux.dev>; Tue, 18 Oct 2022 05:47:36 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id x6-20020a056e021bc600b002fc96f780e7so11455960ilv.10
        for <ntfs3@lists.linux.dev>; Mon, 17 Oct 2022 22:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5RWKL6E59jXIZh5I5QUrj54OM3FP+n27bSvMixJX6UU=;
        b=mHqCWVlVEsCqPCgEaA5ZMBjS+I/yqvwxu2MrMRbnHJMRayoRr5sV7hWYjeJjyVTSl4
         r2OdMoKEDu5OWg0AtZ/RtqowGaR+VKwBRbpkpIM3HrH/KnPXiOdJYtVL+72mxh2TcR6C
         OoJ19wWL4DEx+XmLMQ2WrhuEnhG8o3trBjHn0FlcxFb+xZgrhX96lpGChssa0HdMWt8I
         dKrWEvOMXezRXSYECQB/Jl5hXZp2F7tdPCuH/ZeUuc1VBUse4ZwUnn2LaOrawRPZ/omQ
         72oZ0KOeYaryeBJfWCg5yIR1mTlBRdiajK5PtknvyvPfR61pdT2LpFb3Ux8PDhG/FTl0
         pjmQ==
X-Gm-Message-State: ACrzQf2qNlL0/b9zoXQgpaeV4LJ+unGW4rdXk4AhsGLfZUN9YZhHfL3q
	gBA+t7YYoLHqAaVk36EvYnkd5vbpj7sax4ULO9KxkDODkC4v
X-Google-Smtp-Source: AMsMyM4g4yQ9U1rQtfBwx+R20DT85xZG0v+wEYVInknVxczrQQ+AjCJ3rRvxMWzKjLb3upFPv/EQq/enBXypkF0WtAOmKhCqplA8
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aaa:b0:2fa:542c:7538 with SMTP id
 l10-20020a056e021aaa00b002fa542c7538mr999515ilv.260.1666072055889; Mon, 17
 Oct 2022 22:47:35 -0700 (PDT)
Date: Mon, 17 Oct 2022 22:47:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000fc50405eb48a1be@google.com>
Subject: [syzbot] possible deadlock in ni_fiemap
From: syzbot <syzbot+c300ab283ba3bc072439@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=131e9506880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a4a45d2d827c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=c300ab283ba3bc072439
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8e91bc79312/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1cb3fb3b77e/vmlinux-bbed346d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c300ab283ba3bc072439@syzkaller.appspotmail.com

ntfs3: loop2: Different NTFS' sector size (1024) and media sector size (512)
ntfs3: loop2: Mark volume as dirty due to NTFS errors
======================================================
WARNING: possible circular locking dependency detected
6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0 Not tainted
------------------------------------------------------
syz-executor.2/17350 is trying to acquire lock:
ffff0000c79fb598 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x54/0xb4 mm/memory.c:5576

but task is already holding lock:
ffff000113418898 (&ni->file.run_lock#3){++++}-{3:3}, at: ni_fiemap+0x158/0x620 fs/ntfs3/frecord.c:1947

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ni->file.run_lock#3){++++}-{3:3}:
       down_read+0x5c/0x78 kernel/locking/rwsem.c:1499
       attr_data_get_block+0x84/0xa54 fs/ntfs3/attrib.c:899
       ntfs_extend_initialized_size+0x108/0x334 fs/ntfs3/file.c:125
       ntfs_file_mmap+0x290/0x2e4 fs/ntfs3/file.c:403
       call_mmap include/linux/fs.h:2192 [inline]
       mmap_region+0x7fc/0xc14 mm/mmap.c:1752
       do_mmap+0x644/0x97c mm/mmap.c:1540
       vm_mmap_pgoff+0xe8/0x1d0 mm/util.c:552
       ksys_mmap_pgoff+0x1cc/0x278 mm/mmap.c:1586
       __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
       __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
       __arm64_sys_mmap+0x58/0x6c arch/arm64/kernel/sys.c:21
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
       el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3095 [inline]
       check_prevs_add kernel/locking/lockdep.c:3214 [inline]
       validate_chain kernel/locking/lockdep.c:3829 [inline]
       __lock_acquire+0x1530/0x30a4 kernel/locking/lockdep.c:5053
       lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
       __might_fault+0x7c/0xb4 mm/memory.c:5577
       _copy_to_user include/linux/uaccess.h:134 [inline]
       copy_to_user include/linux/uaccess.h:160 [inline]
       fiemap_fill_next_extent+0xc4/0x1f8 fs/ioctl.c:144
       ni_fiemap+0x4cc/0x620 fs/ntfs3/frecord.c:2051
       ntfs_fiemap+0x9c/0xdc fs/ntfs3/file.c:1245
       ioctl_fiemap fs/ioctl.c:219 [inline]
       do_vfs_ioctl+0x10f0/0x16a4 fs/ioctl.c:810
       __do_sys_ioctl fs/ioctl.c:868 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __arm64_sys_ioctl+0x98/0x140 fs/ioctl.c:856
       __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
       invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
       el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
       do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
       el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
       el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ni->file.run_lock#3);
                               lock(&mm->mmap_lock);
                               lock(&ni->file.run_lock#3);
  lock(&mm->mmap_lock);

 *** DEADLOCK ***

2 locks held by syz-executor.2/17350:
 #0: ffff0001134187e8 (&ni->ni_lock/4){+.+.}-{3:3}, at: ni_lock fs/ntfs3/ntfs_fs.h:1108 [inline]
 #0: ffff0001134187e8 (&ni->ni_lock/4){+.+.}-{3:3}, at: ntfs_fiemap+0x88/0xdc fs/ntfs3/file.c:1243
 #1: ffff000113418898 (&ni->file.run_lock#3){++++}-{3:3}, at: ni_fiemap+0x158/0x620 fs/ntfs3/frecord.c:1947

stack backtrace:
CPU: 1 PID: 17350 Comm: syz-executor.2 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 print_circular_bug+0x2c4/0x2c8 kernel/locking/lockdep.c:2053
 check_noncircular+0x14c/0x154 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3095 [inline]
 check_prevs_add kernel/locking/lockdep.c:3214 [inline]
 validate_chain kernel/locking/lockdep.c:3829 [inline]
 __lock_acquire+0x1530/0x30a4 kernel/locking/lockdep.c:5053
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 __might_fault+0x7c/0xb4 mm/memory.c:5577
 _copy_to_user include/linux/uaccess.h:134 [inline]
 copy_to_user include/linux/uaccess.h:160 [inline]
 fiemap_fill_next_extent+0xc4/0x1f8 fs/ioctl.c:144
 ni_fiemap+0x4cc/0x620 fs/ntfs3/frecord.c:2051
 ntfs_fiemap+0x9c/0xdc fs/ntfs3/file.c:1245
 ioctl_fiemap fs/ioctl.c:219 [inline]
 do_vfs_ioctl+0x10f0/0x16a4 fs/ioctl.c:810
 __do_sys_ioctl fs/ioctl.c:868 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __arm64_sys_ioctl+0x98/0x140 fs/ioctl.c:856
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
