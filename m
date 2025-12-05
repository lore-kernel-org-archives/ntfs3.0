Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA21DA0E1
	for <ntfs3@lists.linux.dev>; Fri,  5 Dec 2025 05:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764911073; cv=none; b=Ql+0VqY6ey23vq+qBwsU3iLYmnq5H3d0yLKf55MuWtj9eU9hjGX/VFkwEAm/d8zCcRegHMmvTslm8wYIOaK4Hko4Z7cWRh3sBOcOF58B1ian2wf2Q+zntycyzLzE6KcogVqrdwyw/VgxyXRwXY9gGnUw5CYUSo+Syp5Vhu2Epsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764911073; c=relaxed/simple;
	bh=vaVyu7jBNiomFKafMkK7zbDiMUrw7tHa51bDqBmKQR8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MkQznd8S+dtdOQqzOVMtiRCJz+UyXAx1ODpPFO3lzCDFuizGgHpW3vbYhxEZsckn3XrIgx3OAWESyXWAnBzuFGPCIjCVTvhMD7i9I7mmVci4fegH1G3CVHVvFmxDJB/1wYsHI1mpr7M6W2daFyOfGuKX2WDCHNch3uDK+REzheM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-450178eaf86so1475417b6e.0
        for <ntfs3@lists.linux.dev>; Thu, 04 Dec 2025 21:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764911070; x=1765515870;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNABmkET0hXgnygMPrA3BSW9u51xJmVqd0tj8YkmZ5Q=;
        b=tlVVRwTTu+E5vTFnbPH36rkGfCwJjgtYF5aeJslFwjYYukW0JU8dStQijnm70zMede
         tWDHMoOeLapzJy4YBNdZTcTIhZ123Vwv/hfZHaYzZXvc5r6v3bRjBjsAjuLwZJdlWMRb
         0vrwkGMK952bSXOUA2bWsC8zhsYADXsg12egXj/R6ehLnxPK3wlMiRRS6DnvEee2VuSO
         Wf4fqADhifdYt0nEBpAcijcOPqCfNnFmbZjtOEuW+Uj5pjb7OV+RunxU1iB5pTKylqqj
         5vU1MyS/LFcSxJ5oGMoeujvPZka/avNoy7j3Da9yn/54z/Xd8fyGbgrcAQdryPRA9BL0
         o+yw==
X-Forwarded-Encrypted: i=1; AJvYcCViMj0fZ53Guy4vwJltdFbW7DGVjIGA42Dcfll1q/yZ8eRRuzzrZ/WXFYd4JVQr8pE7CsN6uA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Jj9NpE7RgDmUf1YZtb5xWk7T0FfJ9WunwWQqVdKiHypkiA7F
	uzL4AawcY7/oJn4JzNNKK+Fw8bPcgKbrQAGU//aM4m5Ben8m4LsSSM6yUpKb3Ysbkr278Z0cI0k
	/W2WsXNaXRtvIeZ4LlwPUd9JWZA2dF11rdPfcrAU83eeCuTKZ8KQQr1req38=
X-Google-Smtp-Source: AGHT+IHooY9bjpMRbhfv1twf5NiWdeYTb5iFz2hCgxY98c8H8PIxU/2dE8i/StmhcAoXcla+eXpKXh3OIM52JuQtJQ9yKh28nyLY
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:150c:b0:450:c456:10e3 with SMTP id
 5614622812f47-4536e41a2d8mr4652711b6e.25.1764911070713; Thu, 04 Dec 2025
 21:04:30 -0800 (PST)
Date: Thu, 04 Dec 2025 21:04:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <693267de.a70a0220.2ea503.00f1.GAE@google.com>
Subject: [syzbot] [ntfs3?] INFO: task hung in ntfs_fallocate
From: syzbot <syzbot+3829f3f96d42c57315fe@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e69c7c175115 Merge tag 'timers_urgent_for_v6.18_rc8' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1307fcb4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=38a0c4cddc846161
dashboard link: https://syzkaller.appspot.com/bug?extid=3829f3f96d42c57315fe
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15d398c2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1087fcb4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6d374e193929/disk-e69c7c17.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5e61aaf1a0ff/vmlinux-e69c7c17.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7d8dde90ff2c/bzImage-e69c7c17.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/1f2972cab40a/mount_0.gz

Bisection is inconclusive: the first bad commit could be any of:

1997cdc3e727 fs/ntfs3: Use variable length array instead of fixed size
c935c6687886 fs/ntfs3: Redesign ntfs_create_inode to return error code instead of inode

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13df58c2580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3829f3f96d42c57315fe@syzkaller.appspotmail.com

INFO: task syz.0.17:6089 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.17        state:D stack:29224 pid:6089  tgid:6083  ppid:6000   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x16f3/0x4c20 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7307
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1e04/0x25e0 kernel/locking/rtmutex.c:1760
 rt_mutex_slowlock+0xb5/0x160 kernel/locking/rtmutex.c:1800
 __rt_mutex_lock kernel/locking/rtmutex.c:1815 [inline]
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:980 [inline]
 ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
 vfs_fallocate+0x672/0x7f0 fs/open.c:342
 ksys_fallocate fs/open.c:366 [inline]
 __do_sys_fallocate fs/open.c:371 [inline]
 __se_sys_fallocate fs/open.c:369 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:369
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbb943cf749
RSP: 002b:00007fbb93a15038 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007fbb94626090 RCX: 00007fbb943cf749
RDX: 0000000000000923 RSI: 0000000000000000 RDI: 0000000000000005
RBP: 00007fbb94453f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000008000c66 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbb94626128 R14: 00007fbb94626090 R15: 00007fff784f6d78
 </TASK>

Showing all locks held in the system:
4 locks held by kworker/u8:2/37:
1 lock held by khungtaskd/39:
 #0: ffffffff8d5aa880 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8d5aa880 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff8d5aa880 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
2 locks held by kworker/u8:8/1179:
2 locks held by getty/5560:
 #0: ffff88823bf780a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc90003e832e0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x444/0x1400 drivers/tty/n_tty.c:2222
3 locks held by syz.0.17/6084:
2 locks held by syz.0.17/6089:
 #0: ffff8880362c0480 (sb_writers#12){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3113 [inline]
 #0: ffff8880362c0480 (sb_writers#12){.+.+}-{0:0}, at: vfs_fallocate+0x5f9/0x7f0 fs/open.c:341
 #1: ffff88804155f6f8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #1: ffff88804155f6f8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
2 locks held by syz.1.18/6165:
2 locks held by syz.1.18/6166:
 #0: ffff88803c8a2480 (sb_writers#12){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3113 [inline]
 #0: ffff88803c8a2480 (sb_writers#12){.+.+}-{0:0}, at: vfs_fallocate+0x5f9/0x7f0 fs/open.c:341
 #1: ffff8880551def48 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #1: ffff8880551def48 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
3 locks held by syz.2.19/6190:
2 locks held by syz.2.19/6191:
 #0: ffff888037542480 (sb_writers#12){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3113 [inline]
 #0: ffff888037542480 (sb_writers#12){.+.+}-{0:0}, at: vfs_fallocate+0x5f9/0x7f0 fs/open.c:341
 #1: ffff8880550c4128 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #1: ffff8880550c4128 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
2 locks held by syz.3.20/6222:
2 locks held by syz.3.20/6223:
 #0: ffff8880522d4480 (sb_writers#12){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3113 [inline]
 #0: ffff8880522d4480 (sb_writers#12){.+.+}-{0:0}, at: vfs_fallocate+0x5f9/0x7f0 fs/open.c:341
 #1: ffff8880551d9ab8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #1: ffff8880551d9ab8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
2 locks held by syz.4.21/6254:
2 locks held by syz.4.21/6255:
 #0: ffff88803a092480 (sb_writers#12){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3113 [inline]
 #0: ffff88803a092480 (sb_writers#12){.+.+}-{0:0}, at: vfs_fallocate+0x5f9/0x7f0 fs/open.c:341
 #1: ffff888055180b58 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #1: ffff888055180b58 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
3 locks held by syz.5.22/6285:
2 locks held by syz.5.22/6286:
 #0: ffff88814dc12480 (sb_writers#12){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3113 [inline]
 #0: ffff88814dc12480 (sb_writers#12){.+.+}-{0:0}, at: vfs_fallocate+0x5f9/0x7f0 fs/open.c:341
 #1: ffff8880550c2a18 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #1: ffff8880550c2a18 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
2 locks held by syz.6.24/6327:
2 locks held by syz.6.24/6328:
 #0: ffff88802ef2c480 (sb_writers#12){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3113 [inline]
 #0: ffff88802ef2c480 (sb_writers#12){.+.+}-{0:0}, at: vfs_fallocate+0x5f9/0x7f0 fs/open.c:341
 #1: ffff8880552d6798 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #1: ffff8880552d6798 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: ntfs_fallocate+0x2f1/0x10b0 fs/ntfs3/file.c:560
2 locks held by syz-executor/6330:
 #0: ffffffff8ed670b0 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8ed670b0 (&ops->srcu#2){.+.+}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff8ed670b0 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x23/0x250 net/core/rtnetlink.c:570
 #1: ffffffff8e863d78 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff8e863d78 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:341 [inline]
 #1: ffffffff8e863d78 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0x8e9/0x1c80 net/core/rtnetlink.c:4064

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 39 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:332 [inline]
 watchdog+0xf60/0xfa0 kernel/hung_task.c:495
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 6222 Comm: syz.3.20 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:lookup_chain_cache kernel/locking/lockdep.c:3801 [inline]
RIP: 0010:lookup_chain_cache_add kernel/locking/lockdep.c:3821 [inline]
RIP: 0010:validate_chain+0xa4/0x2140 kernel/locking/lockdep.c:3876
Code: c6 2c 87 e6 8c e8 9c d0 e6 ff 90 0f 0b 90 90 90 48 bb eb 83 b5 80 46 86 c8 61 49 0f af df 48 c1 eb 2d 48 8b 04 dd 40 63 66 92 <48> 85 c0 0f 94 c1 48 83 c0 f8 0f 94 c2 08 ca 0f 84 24 01 00 00 e8
RSP: 0018:ffffc900041ff578 EFLAGS: 00000802
RAX: ffffffff92cbbdd8 RBX: 000000000006a55e RCX: 0000000000040000
RDX: 0000000000000000 RSI: ffff888025f047b0 RDI: ffff888025f03c00
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff82fe95af
R10: dffffc0000000000 R11: ffffed100aa3b309 R12: 0000000000000000
R13: ffff888025f04760 R14: ffff888025f047b0 R15: 4ed7cc28fbe4c237
FS:  00007efc548166c0(0000) GS:ffff888126df4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcf91b0da8 CR3: 00000000348e6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 down_read+0x97/0x1f0 kernel/locking/rwsem.c:1537
 attr_data_get_block+0x10f/0x1ec0 fs/ntfs3/attrib.c:906
 ntfs_compress_write+0x59b/0x1c10 fs/ntfs3/file.c:1009
 ntfs_file_write_iter+0x4cf/0x870 fs/ntfs3/file.c:1252
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x5d5/0xb40 fs/read_write.c:686
 ksys_pwrite64 fs/read_write.c:793 [inline]
 __do_sys_pwrite64 fs/read_write.c:801 [inline]
 __se_sys_pwrite64 fs/read_write.c:798 [inline]
 __x64_sys_pwrite64+0x196/0x220 fs/read_write.c:798
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efc551af749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007efc54816038 EFLAGS: 00000246 ORIG_RAX: 0000000000000012
RAX: ffffffffffffffda RBX: 00007efc55405fa0 RCX: 00007efc551af749
RDX: 000000000000fdef RSI: 0000200000000140 RDI: 0000000000000006
RBP: 00007efc55233f91 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000fecc R11: 0000000000000246 R12: 0000000000000000
R13: 00007efc55406038 R14: 00007efc55405fa0 R15: 00007fff8ce48068
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
