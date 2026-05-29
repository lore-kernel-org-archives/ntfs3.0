Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB0D3A63F2
	for <ntfs3@lists.linux.dev>; Fri, 29 May 2026 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780092211; cv=none; b=i0TUxmXEuAjx1jwG2+/ngfWnznGAslnSarweIxhGFRougzWmZOvesTx641L0u2uQpfCW5OuCWcrSYZc35wtRqh3uNQslWnxxxiFaOBDrOKLhq8hxj3bMmgXf0soLgE8gT4Qw4n7dAGZGqNgiSJzitEDzzZbALFvuV1OuShQATBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780092211; c=relaxed/simple;
	bh=pqz3PAf8Qlp/I2JeoBy4a7vjqh2JqNkrYFX1VLsK9g8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rpN0gYT2W2oeI2bNK3GhAD8pgTjD1IPxSlv6mm1YN0GgVqZdo7BZRSHcMFPZfZMQfIUPqVg4Z85KoHZMEDwCBBL8dNNZioiSS3LYblC0nHfs2lWGLCRqOYS4Vq+AJXH5EGDHSENTkLWANw3CLun30GTanNgBsumARdPWavxPrd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-69d6c45e2aeso3671184eaf.2
        for <ntfs3@lists.linux.dev>; Fri, 29 May 2026 15:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780092208; x=1780697008;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g3QZ4LDNogZyvvjKpF+1JgfzLiOgydLe1QkXvFibWnU=;
        b=iotwTBInRKg3kFTn7JswGzswAVcfjzFKHihetHccI4Wps+4GfmG6g/VF4AW1Dfot9h
         XSxo0T6osSGk9kZck0UVm2jtGXRo4I2lycylmsvjvmtA/9piFRkWYR0G5JttwqLWclar
         9STpSIQRw9ERqX6Wrtn2sBI8MKsyN91ds/XkdQRmvFSBXeyty75KGt/pyN3RXLk2Y4ax
         +anMXvkD7AKu3iHZGRqp83xD06UUdvtMiIRBbIy90WnNp14ZIOFYRZWbLDH2x068vvMr
         LhsqbFbbLjasUfMJPFg/5XgvyygH6LkxVlRCkQXtuk3TfXbxsmK73s6Kx1mwrsMOJKqH
         pxFA==
X-Forwarded-Encrypted: i=1; AFNElJ8NdEFmtzFl9nmN7E8Qvn1ird2iXu+EfkC2n8wYneREcYGKXqaZxDnc3V2Nfw5zztDdtb3HkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxefKeEqqfAqfUDL8RwCEvpTOuHkIiOxPtsf+HGCIFY8/VqztCf
	xyteRAw+ZP8rf4aBv5zNpgu+0pcQn1fkBCs7MFKz6PFkgIjOByzdEvdFg/rCIoHeWZ0kcSpxN9g
	RztA2qr/8JX/oRFEkFEmLvKouBA3wgjvcB1zazBG+9KsG/SvIRiz0whl4nRk=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1351:b0:69d:9c7d:3346 with SMTP id
 006d021491bc7-69e102a809bmr748095eaf.12.1780092208616; Fri, 29 May 2026
 15:03:28 -0700 (PDT)
Date: Fri, 29 May 2026 15:03:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1a0d30.0a9e871e.332604.0008.GAE@google.com>
Subject: [syzbot] [ntfs3?] INFO: task hung in attr_data_get_block (2)
From: syzbot <syzbot+ca081116e9150ecfe495@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d60ec36cab33 Merge tag 'mm-hotfixes-stable-2026-05-25-16-2..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=148deda6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6200d9adbee6a664
dashboard link: https://syzkaller.appspot.com/bug?extid=ca081116e9150ecfe495
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110b4da6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/69826ca0b031/disk-d60ec36c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/388e56b2f77c/vmlinux-d60ec36c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d637d763a451/bzImage-d60ec36c.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/ecf7e117711f/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/f5a1010f1495/mount_7.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ca081116e9150ecfe495@syzkaller.appspotmail.com

INFO: task syz.3.191:6522 blocked in I/O wait for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kerne[  576.688556][   T37] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.191       state:D stack:23608 pid:6522  tgid:6520  ppid:5792   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5388 [inline]
 __schedule+0x16ec/0x5620 kernel/sched/core.c:7189
 __schedule_loop kernel/sched/core.c:7268 [inline]
 schedule+0x164/0x360 kernel/sched/core.c:7283
 io_schedule+0x7f/0xd0 kernel/sched/core.c:8110
 folio_wait_bit_common+0x6dd/0xbc0 mm/filemap.c:1324
 __folio_lock mm/filemap.c:1705 [inline]
 folio_lock include/linux/pagemap.h:1159 [inline]
 __filemap_get_folio_mpol+0x16d/0xa50 mm/filemap.c:1960
 __filemap_get_folio include/linux/pagemap.h:763 [inline]
 attr_make_nonresident+0x87e/0xbc0 fs/ntfs3/attrib.c:322
 attr_set_size_res fs/ntfs3/attrib.c:401 [inline]
 attr_set_size_ex+0x20db/0x2e50 fs/ntfs3/attrib.c:466
 attr_set_size fs/ntfs3/ntfs_fs.h:463 [inline]
 ntfs_set_size+0x169/0x240 fs/ntfs3/inode.c:699
 ntfs_extend+0x13e/0x540 fs/ntfs3/file.c:370
 ntfs_setattr+0x2eb/0x9a0 fs/ntfs3/file.c:753
 notify_change+0xc18/0xf60 fs/attr.c:556
 do_truncate+0x1c2/0x250 fs/open.c:68
 vfs_truncate+0x4b7/0x540 fs/open.c:118
 ksys_truncate+0xf3/0x1c0 fs/open.c:142
 __do_sys_truncate fs/open.c:154 [inline]
 __se_sys_truncate fs/open.c:152 [inline]
 __x64_sys_truncate+0x5b/0x70 fs/open.c:152
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0x560 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8aaa04ce59
RSP: 002b:00007f8aa96ae028 EFLAGS: 00000246 ORIG_RAX: 000000000000004c
RAX: ffffffffffffffda RBX: 00007f8aaa2c5fa0 RCX: 00007f8aaa04ce59
RDX: 0000000000000000 RSI: 0000000000008da6 RDI: 0000200000000940
RBP: 00007f8aaa0e2d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8aaa2c6038 R14: 00007f8aaa2c5fa0 R15: 00007ffe497fe3d8
 </TASK>
INFO: task syz.3.191:6530 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.191       state:D stack:22160 pid:6530  tgid:6520  ppid:5792   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5388 [inline]
 __schedule+0x16ec/0x5620 kernel/sched/core.c:7189
 __schedule_loop kernel/sched/core.c:7268 [inline]
 rt_mutex_schedule+0x76/0xf0 kernel/sched/core.c:7564
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1662 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1739 [inline]
 __rt_mutex_slowlock_locked+0x1f28/0x2550 kernel/locking/rtmutex.c:1779
 __rwbase_read_lock+0xc3/0x180 kernel/locking/rwbase_rt.c:114
 rwbase_read_lock kernel/locking/rwbase_rt.c:147 [inline]
 __down_read kernel/locking/rwsem.c:1496 [inline]
 down_read+0x132/0x200 kernel/locking/rwsem.c:1570
 attr_data_get_block+0xc5/0x310 fs/ntfs3/attrib.c:964
 ntfs_iomap_begin+0x55b/0xfd0 fs/ntfs3/inode.c:774
 iomap_iter+0x600/0xf90 fs/iomap/iter.c:110
 iomap_read_folio+0x361/0x680 fs/iomap/buffered-io.c:600
 ntfs_read_folio+0x3f0/0x4b0 fs/ntfs3/inode.c:653
 filemap_read_folio+0x137/0x3b0 mm/filemap.c:2502
 filemap_create_folio mm/filemap.c:2640 [inline]
 filemap_get_pages+0xc4e/0x1e70 mm/filemap.c:2702
 filemap_read+0x44a/0x1240 mm/filemap.c:2806
 __kernel_read+0x50d/0x9c0 fs/read_write.c:532
 integrity_kernel_read+0x89/0xd0 security/integrity/iint.c:28
 ima_calc_file_hash_tfm security/integrity/ima/ima_crypto.c:222 [inline]
 ima_calc_file_hash+0x452/0x870 security/integrity/ima/ima_crypto.c:280
 ima_collect_measurement+0x523/0x9d0 security/integrity/ima/ima_api.c:300
 process_measurement+0x12d9/0x1c90 security/integrity/ima/ima_main.c:425
 ima_file_check+0xe1/0x130 security/integrity/ima/ima_main.c:685
 security_file_post_open+0xb3/0x260 security/security.c:2755
 do_open fs/namei.c:4701 [inline]
 path_openat+0x2e88/0x38a0 fs/namei.c:4858
 do_file_open+0x23e/0x4a0 fs/namei.c:4887
 do_sys_openat2+0x113/0x200 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0x560 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8aaa04ce59
RSP: 002b:00007f8aa966c028 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f8aaa2c6180 RCX: 00007f8aaa04ce59
RDX: 0000000000000042 RSI: 0000200000000040 RDI: ffffffffffffff9c
RBP: 00007f8aaa0e2d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8aaa2c6218 R14: 00007f8aaa2c6180 R15: 00007ffe497fe3d8
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/37:
 #0: ffffffff8dfc80c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffffffff8dfc80c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:838 [inline]
 #0: ffffffff8dfc80c0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
2 locks held by kworker/1:2/821:
2 locks held by getty/5350:
 #0: ffff8880294be0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc90003cb62e0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x462/0x13a0 drivers/tty/n_tty.c:2211
1 lock held by syz-executor/5783:
 #0: ffff88805a6da480 (sb_writers#5){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:493
1 lock held by udevd/5884:
 #0: ffff888025b44480 (sb_writers#5){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:493
4 locks held by udevd/6066:
1 lock held by udevd/6089:
 #0: ffff888025b44480 (sb_writers#5){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:493
6 locks held by kworker/u8:11/6125:
4 locks held by syz.3.191/6522:
 #0: ffff88803fc8a480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:493
 #1: ffff888045ffb8d0 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: inode_lock_killable include/linux/fs.h:1034 [inline]
 #1: ffff888045ffb8d0 (&sb->s_type->i_mutex_key#24){+.+.}-{4:4}, at: do_truncate+0x18f/0x250 fs/open.c:63
 #2: ffff888045ffb618 (&ni->ni_lock/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1212 [inline]
 #2: ffff888045ffb618 (&ni->ni_lock/5){+.+.}-{4:4}, at: ntfs_set_size+0x134/0x240 fs/ntfs3/inode.c:696
 #3: ffff888045ffb6b8 (&ni->file.run_lock#3){++++}-{4:4}, at: ntfs_set_size+0x143/0x240 fs/ntfs3/inode.c:697
3 locks held by syz.3.191/6530:
 #0: ffff88802d48e558 (&ima_iint_mutex_key[depth]){+.+.}-{4:4}, at: process_measurement+0x7fd/0x1c90 security/integrity/ima/ima_main.c:319
 #1: ffff888045ffbaa0 (mapping.invalidate_lock#3){++++}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1094 [inline]
 #1: ffff888045ffbaa0 (mapping.invalidate_lock#3){++++}-{4:4}, at: filemap_create_folio mm/filemap.c:2631 [inline]
 #1: ffff888045ffbaa0 (mapping.invalidate_lock#3){++++}-{4:4}, at: filemap_get_pages+0xb39/0x1e70 mm/filemap.c:2702
 #2: ffff888045ffb6b8 (&ni->file.run_lock#3){++++}-{4:4}, at: attr_data_get_block+0xc5/0x310 fs/ntfs3/attrib.c:964
1 lock held by udevd/6655:
 #0: ffff888025b44480 (sb_writers#5){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:493
5 locks held by udevd/6658:
1 lock held by syz.4.832/8056:
1 lock held by syz.0.835/8065:

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 37 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xfd3/0x1030 kernel/hung_task.c:561
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 821 Comm: kworker/1:2 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Workqueue: events_power_efficient wg_ratelimiter_gc_entries
RIP: 0010:reacquire_held_locks+0xbf/0x190 kernel/locking/lockdep.c:5386
Code: 77 af fd 02 85 c0 74 1c 83 3d f0 8b e8 0d 00 75 13 48 8d 3d 63 ab eb 0d 48 c7 c6 b3 b7 71 8d 67 48 0f b9 3a 90 31 c0 4c 89 e7 <8b> 70 58 41 8b 46 fc 89 c2 c1 ea 0f 83 e2 01 89 c1 c1 e9 10 83 e1
RSP: 0000:ffffc9000536f9b8 EFLAGS: 00000002
RAX: ffffffff9313cbc8 RBX: ffffc9000536fa0c RCX: ffffc9000536fa0c
RDX: 0000000000000003 RSI: 0000000000000004 RDI: ffffffff8dfc80c0
RBP: 00000000ffffffff R08: ffffffff8b1fd920 R09: ffffffff8dfc80c0
R10: dffffc0000000000 R11: fffffbfff1f1223f R12: 0000000000000003
R13: 0000000000000003 R14: ffff888025fb8c94 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888126270000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3589994000 CR3: 000000005ba8c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __lock_release kernel/locking/lockdep.c:5574 [inline]
 lock_release+0x199/0x3c0 kernel/locking/lockdep.c:5889
 rt_spin_unlock+0x29/0x200 kernel/locking/spinlock_rt.c:80
 spin_unlock include/linux/spinlock_rt.h:109 [inline]
 wg_ratelimiter_gc_entries+0x3a8/0x480 drivers/net/wireguard/ratelimiter.c:76
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3397
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3478
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
