Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046128EB
	for <ntfs3@lists.linux.dev>; Sat,  1 Oct 2022 13:47:42 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id b9-20020a6be709000000b006a469cf388eso4409322ioh.19
        for <ntfs3@lists.linux.dev>; Sat, 01 Oct 2022 06:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=oInPToETubw9qbmsXHkOW3CaEdCf6DsdV1dMZyMcoKg=;
        b=KGuwr1Vt/Lenvrfk1/3TyPuLFQotg0RjwrCTCTEaYiqjhbgq1Sp+g4CoeyDSUBHdSl
         vj5/V2R2lGyQtM9b7fJx+oKEX2CbmnU8ooE6w82TE5/idO27S9AWCgT2Y80oel6VHD7Q
         1cOvjGNB1gcNUTyuJsCc/C26dA1hG6mtJEq+K89kXzFYd5BxjOux7jdns6dGORrc/fPc
         FD+XvG2nHaCFoV0aeykGckDDg1XRuskm1Ly3iUuovVNLcVL+Ni5ZE7AZKYut2Wgsgjds
         F57NQfpEBwC6Cjv2+RBf+eZOBBqAqgkgqqTMuyandssdaHvqT9V6uAuzscJf6AwMnA8j
         GBYQ==
X-Gm-Message-State: ACrzQf3J+Vepy+Ea1u55MlFL+PbXWgcZyuVELhY6Q488A+itFVRDjzkz
	e8y3X75fYz3NstEKHE1JUb7UI7vN5i5wI0vbNVagtrvPJ90C
X-Google-Smtp-Source: AMsMyM6dEEMT24PJiUpYG6t0WOlEY3BpzI9WR6Ch0ZXhaOWHVQv7CFkbnnClHn4UPNbdJdfJoOg99D0cok3Roh8J6z54jGSmTbx1
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b8a:b0:2f9:7d5d:e476 with SMTP id
 h10-20020a056e021b8a00b002f97d5de476mr1718699ili.183.1664632061619; Sat, 01
 Oct 2022 06:47:41 -0700 (PDT)
Date: Sat, 01 Oct 2022 06:47:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b6f58d05e9f95a0c@google.com>
Subject: [syzbot] possible deadlock in mi_read
From: syzbot <syzbot+bc7ca0ae4591cb2550f9@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=111f3904880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aae2d21e7dd80684
dashboard link: https://syzkaller.appspot.com/bug?extid=bc7ca0ae4591cb2550f9
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a49000880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14ace23f080000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/11078f50b80b/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/398e5f1e6c84/vmlinux-bbed346d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bc7ca0ae4591cb2550f9@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3: loop0: Different NTFS' sector size (1024) and media sector size (512)
============================================
WARNING: possible recursive locking detected
6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0 Not tainted
--------------------------------------------
syz-executor243/3030 is trying to acquire lock:
ffff0000caa09ca0 (&ni->ni_lock/4){+.+.}-{3:3}, at: ni_lock fs/ntfs3/ntfs_fs.h:1108 [inline]
ffff0000caa09ca0 (&ni->ni_lock/4){+.+.}-{3:3}, at: mi_read+0x140/0x274 fs/ntfs3/record.c:148

but task is already holding lock:
ffff0000caa0d3e0 (&ni->ni_lock/4){+.+.}-{3:3}, at: ntfs_lookup+0x84/0xe8 fs/ntfs/namei.c:111

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&ni->ni_lock/4);
  lock(&ni->ni_lock/4);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by syz-executor243/3030:
 #0: ffff0000caa0d680 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: inode_lock_shared include/linux/fs.h:766 [inline]
 #0: ffff0000caa0d680 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: lookup_slow+0x34/0x68 fs/namei.c:1701
 #1: ffff0000caa0d3e0 (&ni->ni_lock/4){+.+.}-{3:3}, at: ntfs_lookup+0x84/0xe8 fs/ntfs/namei.c:111

stack backtrace:
CPU: 1 PID: 3030 Comm: syz-executor243 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 __lock_acquire+0x808/0x30a4
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 __mutex_lock_common+0xd4/0xca8 kernel/locking/mutex.c:603
 __mutex_lock kernel/locking/mutex.c:747 [inline]
 mutex_lock_nested+0x38/0x44 kernel/locking/mutex.c:799
 ni_lock fs/ntfs3/ntfs_fs.h:1108 [inline]
 mi_read+0x140/0x274 fs/ntfs3/record.c:148
 ntfs_read_mft fs/ntfs3/inode.c:69 [inline]
 ntfs_iget5+0x15c/0x138c fs/ntfs3/inode.c:501
 dir_search_u+0x18c/0x1e0 fs/ntfs3/dir.c:264
 ntfs_lookup+0x94/0xe8 fs/ntfs/namei.c:111
 __lookup_slow+0x14c/0x204 fs/namei.c:1685
 lookup_slow+0x44/0x68 fs/namei.c:1702
 walk_component+0x178/0x1b0 fs/namei.c:1993
 lookup_last fs/namei.c:2450 [inline]
 path_lookupat+0xc4/0x208 fs/namei.c:2474
 filename_lookup+0xf8/0x264 fs/namei.c:2503
 user_path_at_empty+0x5c/0x114 fs/namei.c:2876
 user_path_at include/linux/namei.h:57 [inline]
 __do_sys_open_tree fs/namespace.c:2537 [inline]
 __se_sys_open_tree fs/namespace.c:2504 [inline]
 __arm64_sys_open_tree+0x130/0x4a4 fs/namespace.c:2504
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
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
