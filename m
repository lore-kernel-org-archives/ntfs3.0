Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E615CAF
	for <ntfs3@lists.linux.dev>; Sun,  4 Dec 2022 18:11:39 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id h10-20020a056e021b8a00b00302671bb5fdso10513943ili.21
        for <ntfs3@lists.linux.dev>; Sun, 04 Dec 2022 10:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXCYH2mqqFr5+Y/A/S4KKsqjDh0laoJCV+i9udr141s=;
        b=RSvmbH1Oj6Bt7uH/tlFJlEkxUJrGNHyFLPG3TCrlZesJM6av/tkPUIYNvVE9mt0ByW
         EqTLqiCsKYYirvmgCDzYxxiHxMvOcq27YBk6awG6dbKjXFywu0SPBUQ/aZmPyBJze8G8
         9Plal4dtrJDCEw5G7B4ar05BvlSDpAXRSnjQQ2tmsc1bkBpDRHQXcwc9fFteuZ3+GVYl
         OlxQhQrGjcZmcluAPdNWhTxV6DGE4GoSpHUXbJfb9yHWWosM/SkxhRsLwYs0/z4h5zYI
         XgtVLwNwMCBj6PlDMGOHBmvLyqQc+SgO+a+lRwCclwOc6SIm3H/1ekY1a4rjiWkxrvP0
         axEQ==
X-Gm-Message-State: ANoB5pmKwVVsAjhSjQ5kEnrucMofKIW4tF/Y0sNu7WA5MEcRyRnpLEVH
	L51rRoHpqtC6M4xoFDxaWAeubpXVI7nIsPTnoy7aEXS7NzRQ
X-Google-Smtp-Source: AA0mqf76H7rChQGyKf9Ic4JrGJR+vc0/c+Ri6eB8ZUPqyc9hJgTtCjre+AjPTJJ7P3iQzQDZ5H3tGhaso4BmzQPm8fhoMtglwv9x
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:6b03:0:b0:302:55d5:8808 with SMTP id
 g3-20020a926b03000000b0030255d58808mr26936130ilc.152.1670177498519; Sun, 04
 Dec 2022 10:11:38 -0800 (PST)
Date: Sun, 04 Dec 2022 10:11:38 -0800
In-Reply-To: <000000000000ea9fef05eb3621b6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000082e3a605ef0480b5@google.com>
Subject: Re: [syzbot] possible deadlock in attr_data_get_block
From: syzbot <syzbot+36bb70085ef6edc2ebb9@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    c2bf05db6c78 Merge tag 'i2c-for-6.1-rc8' of git://git.kern..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1090bfbd880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
dashboard link: https://syzkaller.appspot.com/bug?extid=36bb70085ef6edc2ebb9
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1031c6cb880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15392bd5880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4476d2eff1ae/disk-c2bf05db.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0f4a704ffc14/vmlinux-c2bf05db.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dfb09481a98b/bzImage-c2bf05db.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/9b8a62d1948c/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+36bb70085ef6edc2ebb9@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
======================================================
WARNING: possible circular locking dependency detected
6.1.0-rc7-syzkaller-00200-gc2bf05db6c78 #0 Not tainted
------------------------------------------------------
syz-executor598/3631 is trying to acquire lock:
ffff888072430860 (&ni->ni_lock/4){+.+.}-{3:3}, at: ni_lock fs/ntfs3/ntfs_fs.h:1108 [inline]
ffff888072430860 (&ni->ni_lock/4){+.+.}-{3:3}, at: attr_data_get_block+0x301/0x2370 fs/ntfs3/attrib.c:917

but task is already holding lock:
ffff888022a38898 (&mm->mmap_lock#2){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:87 [inline]
ffff888022a38898 (&mm->mmap_lock#2){++++}-{3:3}, at: vm_mmap_pgoff+0x14d/0x2b0 mm/util.c:518

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&mm->mmap_lock#2){++++}-{3:3}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       __might_fault+0xb2/0x110 mm/memory.c:5645
       _copy_to_user+0x26/0x130 lib/usercopy.c:29
       copy_to_user include/linux/uaccess.h:169 [inline]
       fiemap_fill_next_extent+0x22e/0x410 fs/ioctl.c:144
       ni_fiemap+0xf57/0x1130 fs/ntfs3/frecord.c:1934
       ntfs_fiemap+0x134/0x180 fs/ntfs3/file.c:1245
       ioctl_fiemap fs/ioctl.c:219 [inline]
       do_vfs_ioctl+0x187f/0x29a0 fs/ioctl.c:810
       __do_sys_ioctl fs/ioctl.c:868 [inline]
       __se_sys_ioctl+0x83/0x170 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&ni->ni_lock/4){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
       __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       __mutex_lock_common+0x1bd/0x26e0 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x17/0x20 kernel/locking/mutex.c:799
       ni_lock fs/ntfs3/ntfs_fs.h:1108 [inline]
       attr_data_get_block+0x301/0x2370 fs/ntfs3/attrib.c:917
       ntfs_file_mmap+0x48c/0x730 fs/ntfs3/file.c:387
       call_mmap include/linux/fs.h:2204 [inline]
       mmap_region+0xfe6/0x1e20 mm/mmap.c:2625
       do_mmap+0x8d9/0xf30 mm/mmap.c:1412
       vm_mmap_pgoff+0x19e/0x2b0 mm/util.c:520
       ksys_mmap_pgoff+0x48c/0x6d0 mm/mmap.c:1458
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&mm->mmap_lock#2);
                               lock(&ni->ni_lock/4);
                               lock(&mm->mmap_lock#2);
  lock(&ni->ni_lock/4);

 *** DEADLOCK ***

1 lock held by syz-executor598/3631:
 #0: ffff888022a38898 (&mm->mmap_lock#2){++++}-{3:3}, at: mmap_write_lock_killable include/linux/mmap_lock.h:87 [inline]
 #0: ffff888022a38898 (&mm->mmap_lock#2){++++}-{3:3}, at: vm_mmap_pgoff+0x14d/0x2b0 mm/util.c:518

stack backtrace:
CPU: 1 PID: 3631 Comm: syz-executor598 Not tainted 6.1.0-rc7-syzkaller-00200-gc2bf05db6c78 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 check_noncircular+0x2cc/0x390 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
 __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
 lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
 __mutex_lock_common+0x1bd/0x26e0 kernel/locking/mutex.c:603
 __mutex_lock kernel/locking/mutex.c:747 [inline]
 mutex_lock_nested+0x17/0x20 kernel/locking/mutex.c:799
 ni_lock fs/ntfs3/ntfs_fs.h:1108 [inline]
 attr_data_get_block+0x301/0x2370 fs/ntfs3/attrib.c:917
 ntfs_file_mmap+0x48c/0x730 fs/ntfs3/file.c:387
 call_mmap include/linux/fs.h:2204 [inline]
 mmap_region+0xfe6/0x1e20 mm/mmap.c:2625
 do_mmap+0x8d9/0xf30 mm/mmap.c:1412
 vm_mmap_pgoff+0x19e/0x2b0 mm/util.c:520
 ksys_mmap_pgoff+0x48c/0x6d0 mm/mmap.c:1458
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f250307bcf9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:

