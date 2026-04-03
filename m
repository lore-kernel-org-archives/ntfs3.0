Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2235A398
	for <ntfs3@lists.linux.dev>; Fri,  3 Apr 2026 17:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238628; cv=none; b=Fpx5bgDB1mEu+HqaBr8qq1myHVmAYv0VQbrT+KGpvpnipylmxN0dC4rn+fvhVaWMzgGvXnfIyGtLEtTaCIdWi7Xp5zGB9/vlsEyxsOAoXgdIhJkqQ5iBBrnSMpW4D8TIxyI9YmDUHiTt93MdlvxyGX1BqwIIgDZXeZDdQ+M1934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238628; c=relaxed/simple;
	bh=9HKASDNvg1Y+THED5oTEqW0AQlxTI/lwe1q3vfqGdK4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=eDvrLMy1hXuSQwGZ3AnYGQ/nnCPSZPMxR/EGO2WE+IA2KdNgib4iYhUa/Wy639DEiWsYYHqtKnaaqt7kAY4SCAc5I0CaEn5y1P1EXkyOYzibG2RmHQB6ADH2xQeq0egfU7EAtHU7CW8e1zhsDiJn/DkGoJQ4ELq3esxzrba1sS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-67dfa1ab0b1so7295501eaf.0
        for <ntfs3@lists.linux.dev>; Fri, 03 Apr 2026 10:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775238625; x=1775843425;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKha2lym59PwSDuULOcu6AgnFSn27LhR43qF1VGYOZ0=;
        b=mPRDinLUmJro2VQi02zY1eokJ6atpYxDY1fjGadNw8j3gUhlqRs7o+YRxid78j2j4A
         9Ejtk4Mi8te1yUtr+2mCfWrznNBV0J55UaPGxazRynjPySRg84PJAYTzeytMMBUWVWhL
         sftAW3DAzMYim/aGiVXl621e41SuCKyiMYwqhmKOj1zIoojPw/8xM45f2m479tCOKdZc
         ZpRgxw/x9nAV/ug44RhDrslrA94PSfherIlt5qXTlCkXA60cb0uDOWSuwuzrJ2fEdR6v
         dCkkI+bOHSIZopZkX9wbMzNO8PatTyTzgQf5oQEZp682P7bv1tMkSQWfSsWGJSv/IFy4
         D+/g==
X-Forwarded-Encrypted: i=1; AJvYcCXwc3GEokbAi/n100CpY4S+O/uMHCCkVm+caHDIXd7yaX3B/nyFPPL63BdB4l2Mk8FiJcsUGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ38MNrN8VyM5ofpxFVRWVNzl5r9zytvt4QOga6nzSKPyNckID
	lAM9eppGjRhGc+ioJT0gxjTBjT13FYkLjZdWiSIFyTC7RtXMBvmaqOTUS/mYOk7lPlI/ZQkkp91
	aQ4ACrKH/6WlSBNHiMhq8aGvImPOQG0xKwhXoHoiAUVGghyvxtqytauYlIIY=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:998:b0:67d:ea53:b9c8 with SMTP id
 006d021491bc7-6821d7479f1mr2169110eaf.18.1775238625467; Fri, 03 Apr 2026
 10:50:25 -0700 (PDT)
Date: Fri, 03 Apr 2026 10:50:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69cffde1.050a0220.182279.0017.GAE@google.com>
Subject: [syzbot] [ntfs3?] INFO: task hung in freeze_super (7)
From: syzbot <syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9147566d8016 Merge tag 'sched_ext-for-7.0-rc6-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=104799f6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45cb3c58fd963c27
dashboard link: https://syzkaller.appspot.com/bug?extid=5f6ca38579a76e303c1c
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1770e5da580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1e94b6070465/disk-9147566d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/17cff0253e7d/vmlinux-9147566d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/093d634539c7/bzImage-9147566d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/13739019b74d/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5f6ca38579a76e303c1c@syzkaller.appspotmail.com

INFO: task syz.0.27:6095 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_time[  319.060152][   T38] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.27        state:D stack:23808 pid:6095  tgid:6094  ppid:5930   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0x1553/0x5240 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0x164/0x360 kernel/sched/core.c:7008
 percpu_down_write+0x298/0x330 kernel/locking/percpu-rwsem.c:256
 sb_wait_write fs/super.c:1850 [inline]
 freeze_super+0x535/0x1190 fs/super.c:2114
 fs_bdev_freeze+0x1a3/0x310 fs/super.c:1542
 bdev_freeze+0xd8/0x220 block/bdev.c:314
 ntfs_force_shutdown fs/ntfs3/file.c:128 [inline]
 ntfs_ioctl_shutdown fs/ntfs3/file.c:146 [inline]
 ntfs_ioctl+0x53d/0x790 fs/ntfs3/file.c:170
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f156ecac819
RSP: 002b:00007f156e30e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f156ef25fa0 RCX: 00007f156ecac819
RDX: 00002000000001c0 RSI: 000000008004587d RDI: 0000000000000005
RBP: 00007f156ed42c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f156ef26038 R14: 00007f156ef25fa0 R15: 00007ffd1a50d098
 </TASK>
INFO: task syz.4.21:6103 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.21        state:D stack:24864 pid:6103  tgid:6099  ppid:5943   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0x1553/0x5240 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0x164/0x360 kernel/sched/core.c:7008
 percpu_down_write+0x298/0x330 kernel/locking/percpu-rwsem.c:256
 sb_wait_write fs/super.c:1850 [inline]
 freeze_super+0x535/0x1190 fs/super.c:2114
 fs_bdev_freeze+0x1a3/0x310 fs/super.c:1542
 bdev_freeze+0xd8/0x220 block/bdev.c:314
 ntfs_force_shutdown fs/ntfs3/file.c:128 [inline]
 ntfs_ioctl_shutdown fs/ntfs3/file.c:146 [inline]
 ntfs_ioctl+0x53d/0x790 fs/ntfs3/file.c:170
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdbab55c819
RSP: 002b:00007fdbaabb6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fdbab7d5fa0 RCX: 00007fdbab55c819
RDX: 00002000000001c0 RSI: 000000008004587d RDI: 0000000000000005
RBP: 00007fdbab5f2c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fdbab7d6038 R14: 00007fdbab7d5fa0 R15: 00007ffcf6319cd8
 </TASK>
INFO: task syz.1.34:6120 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.34        state:D stack:25152 pid:6120  tgid:6119  ppid:5933   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0x1553/0x5240 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0x164/0x360 kernel/sched/core.c:7008
 percpu_down_write+0x298/0x330 kernel/locking/percpu-rwsem.c:256
 sb_wait_write fs/super.c:1850 [inline]
 freeze_super+0x535/0x1190 fs/super.c:2114
 fs_bdev_freeze+0x1a3/0x310 fs/super.c:1542
 bdev_freeze+0xd8/0x220 block/bdev.c:314
 ntfs_force_shutdown fs/ntfs3/file.c:128 [inline]
 ntfs_ioctl_shutdown fs/ntfs3/file.c:146 [inline]
 ntfs_ioctl+0x53d/0x790 fs/ntfs3/file.c:170
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3da66dc819
RSP: 002b:00007f3da5d3e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f3da6955fa0 RCX: 00007f3da66dc819
RDX: 00002000000001c0 RSI: 000000008004587d RDI: 0000000000000005
RBP: 00007f3da6772c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f3da6956038 R14: 00007f3da6955fa0 R15: 00007ffc419a2278
 </TASK>
INFO: task syz.3.33:6122 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.33        state:D stack:25152 pid:6122  tgid:6121  ppid:5941   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0x1553/0x5240 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0x164/0x360 kernel/sched/core.c:7008
 percpu_down_write+0x298/0x330 kernel/locking/percpu-rwsem.c:256
 sb_wait_write fs/super.c:1850 [inline]
 freeze_super+0x535/0x1190 fs/super.c:2114
 fs_bdev_freeze+0x1a3/0x310 fs/super.c:1542
 bdev_freeze+0xd8/0x220 block/bdev.c:314
 ntfs_force_shutdown fs/ntfs3/file.c:128 [inline]
 ntfs_ioctl_shutdown fs/ntfs3/file.c:146 [inline]
 ntfs_ioctl+0x53d/0x790 fs/ntfs3/file.c:170
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa88583c819
RSP: 002b:00007fa884e9e028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa885ab5fa0 RCX: 00007fa88583c819
RDX: 00002000000001c0 RSI: 000000008004587d RDI: 0000000000000005
RBP: 00007fa8858d2c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa885ab6038 R14: 00007fa885ab5fa0 R15: 00007ffc67496b08
 </TASK>
INFO: task syz.2.37:6134 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.37        state:D stack:24928 pid:6134  tgid:6133  ppid:5937   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5298 [inline]
 __schedule+0x1553/0x5240 kernel/sched/core.c:6911
 __schedule_loop kernel/sched/core.c:6993 [inline]
 schedule+0x164/0x360 kernel/sched/core.c:7008
 percpu_down_write+0x298/0x330 kernel/locking/percpu-rwsem.c:256
 sb_wait_write fs/super.c:1850 [inline]
 freeze_super+0x535/0x1190 fs/super.c:2114
 fs_bdev_freeze+0x1a3/0x310 fs/super.c:1542
 bdev_freeze+0xd8/0x220 block/bdev.c:314
 ntfs_force_shutdown fs/ntfs3/file.c:128 [inline]
 ntfs_ioctl_shutdown fs/ntfs3/file.c:146 [inline]
 ntfs_ioctl+0x53d/0x790 fs/ntfs3/file.c:170
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbb6228c819
RSP: 002b:00007fbb618ee028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fbb62505fa0 RCX: 00007fbb6228c819
RDX: 00002000000001c0 RSI: 000000008004587d RDI: 0000000000000005
RBP: 00007fbb62322c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbb62506038 R14: 00007fbb62505fa0 R15: 00007ffe46c7d938
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/38:
 #0: ffffffff8ddcb9c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:312 [inline]
 #0: ffffffff8ddcb9c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:850 [inline]
 #0: ffffffff8ddcb9c0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
2 locks held by getty/5552:
 #0: ffff8880289d90a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc90003e8b2e0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x462/0x13c0 drivers/tty/n_tty.c:2211
2 locks held by syz.0.27/6095:
 #0: ffff888022458f10 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff88802ad46480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff88802ad46480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.0.27/6110:
2 locks held by syz.4.21/6103:
 #0: ffff888022455150 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff8880319d6480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff8880319d6480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.4.21/6113:
2 locks held by syz.1.34/6120:
 #0: ffff8880224581d0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff888035e7c480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff888035e7c480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
4 locks held by syz.1.34/6127:
2 locks held by syz.3.33/6122:
 #0: ffff888022455e90 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff888036956480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff888036956480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.3.33/6128:
2 locks held by syz.2.37/6134:
 #0: ffff888022456bd0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff8880386d0480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff8880386d0480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.2.37/6135:
2 locks held by syz.5.43/6282:
 #0: ffff888022454410 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff888029018480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff888029018480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.5.43/6285:
2 locks held by syz.8.41/6294:
 #0: ffff888022451c50 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff8880268e8480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff8880268e8480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.8.41/6302:
2 locks held by syz.9.42/6300:
 #0: ffff888022450f10 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff88803bab4480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff88803bab4480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.9.42/6308:
2 locks held by syz.7.46/6305:
 #0: ffff888022452990 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff88802ada4480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff88802ada4480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
4 locks held by syz.7.46/6309:
2 locks held by syz.6.47/6307:
 #0: ffff8880224536d0 (&bdev->bd_fsfreeze_mutex){+.+.}-{4:4}, at: bdev_freeze+0x2a/0x220 block/bdev.c:305
 #1: ffff88805fcbe480 (sb_writers#12){++++}-{0:0}, at: sb_wait_write fs/super.c:1850 [inline]
 #1: ffff88805fcbe480 (sb_writers#12){++++}-{0:0}, at: freeze_super+0x535/0x1190 fs/super.c:2114
3 locks held by syz.6.47/6311:
1 lock held by syz.1.253/6870:
2 locks held by syz.0.254/6874:
3 locks held by syz.2.255/6877:

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 38 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:161 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:346 [inline]
 watchdog+0xfd9/0x1030 kernel/hung_task.c:515
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 6311 Comm: syz.6.47 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
RIP: 0010:__lock_acquire+0xd4e/0x2cf0 kernel/locking/lockdep.c:-1
Code: ae a8 0b 00 00 41 8b 86 b0 0b 00 00 ff c0 41 89 86 b0 0b 00 00 83 f8 30 0f 83 51 18 00 00 3b 05 f0 1f b6 11 0f 87 a4 18 00 00 <bd> 01 00 00 00 e9 d4 06 00 00 41 83 fe 03 ba 02 00 00 00 41 0f 43
RSP: 0018:ffffc900050ef7a0 EFLAGS: 00000093
RAX: 0000000000000004 RBX: 0000000000047586 RCX: dbcc2cbf40afc457
RDX: 0000000039254800 RSI: 0000000098d7158f RDI: ffff888026179e80
RBP: dbcc2cbf40afc457 R08: ffffffff831455b5 R09: ffff88805ad08948
R10: dffffc0000000000 R11: ffffed100b5a111e R12: ffff88802617aab0
R13: ffff88802617aab0 R14: ffff888026179e80 R15: 0000000000000003
FS:  00007fb0549e56c0(0000) GS:ffff888126436000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000004340 CR3: 000000002a7ba000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 lock_acquire+0xf0/0x2e0 kernel/locking/lockdep.c:5868
 down_read+0x97/0x200 kernel/locking/rwsem.c:1537
 attr_data_get_block+0xc5/0x310 fs/ntfs3/attrib.c:964
 ntfs_compress_write+0x5a9/0x1c80 fs/ntfs3/file.c:1029
 ntfs_file_write_iter+0x517/0x990 fs/ntfs3/file.c:1275
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x629/0xba0 fs/read_write.c:688
 ksys_write+0x156/0x270 fs/read_write.c:740
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb0553ac819
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb0549e5028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fb055626090 RCX: 00007fb0553ac819
RDX: 0000000000000078 RSI: 0000200000004340 RDI: 0000000000000004
RBP: 00007fb055442c91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb055626128 R14: 00007fb055626090 R15: 00007fff2faa9a28
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
