Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFB017BCA
	for <ntfs3@lists.linux.dev>; Wed, 17 Dec 2025 00:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765932389; cv=none; b=ByUEINokzoFx22s9u9FtS6ceVQ5TFifbMff6YPaz4sEGr+BiYeGw0WtMaZ83ORkfS8xDJRLECCxmkcr8i1F9pTg57kTYaM7HC/pZtqH/icYgDLZBsVQxc0PRbRkg5XT30xPisVqeXDECOlrNemLqgZ2sOu6mv3zkz5jFTWfRAKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765932389; c=relaxed/simple;
	bh=fBpJPL9vn2UYD8EB3tTPJIyHtSflIXOaYQ06EELvz0g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jBNOho8KeN2S05OUPELUaLbnLXnsYkF7IesN8dDGjKDghW1ex/CHjja6Stw4WX4gG7NLA8qg73mf2g5lEkJ7p7FyvZ0pndfmHs74ktpsw1LAFLPguvb/NaFaVw5mX8KDKx+3Co3Bm2EDEfdtlefTKJ37qr+Qwkj3RdmCAyH5JTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4512e9f2f82so7256679b6e.3
        for <ntfs3@lists.linux.dev>; Tue, 16 Dec 2025 16:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765932386; x=1766537186;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKJ50DzI+hXXFbrupJzxfHfASyUsLEqIHKJ9AXjpf84=;
        b=db8oNw8rpGcT9rnJw8inUatJlyU2R/LWgV3XHOfjQVOhOZAC0A3vZb0k6FLkyqvU0n
         r3OFd0fIjvZLl/dT23eqz8xGMUYnPf70XQRF0+aJfOKC7PZifq/GN/yYEy6uvcawYMfn
         +ODQqAqIWeeGpsiH/Bd0wapeS8aM1bthRy9wwsnXyDYYif7QrO2jX+Yhuz96NEbFSrLd
         B3NhAKRO+tS52Fo4z+wKeCCgkXS6pXdNLwNavQWpJquGYfkvZ/YwR0OrD4Rp5YNw1aWv
         8fxmutvw5AkESqIehF/1L7bSdCNlobHKsSvwOyvQorVi6APa/2kTtxBIpdBwwwZphj1o
         ekvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX851OyutU9raLDEHFKCC3XbqdFNrgJvW9p+1zplEXywYyMam5p2RC90WrXNvxWV+u8wh7/9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0gHG+t33tf4N5euytsqK6icsdU4swp9ts2+1ArAvQZkqUDs5W
	7BPiXiVoH1OlHmmS6fWbZc8+mF/ODouH9Ww41TnrNV6r1MYONKlvz6wla7eWkeIMtj9jiS7akVy
	rFLuQwTJHlzsN5YjglEZ9JaDfOxQ+Babohegvm9yxTkzshFmIc2rcxemXuzg=
X-Google-Smtp-Source: AGHT+IEsq/0S1L84SaFUCLskmgs8rC3F0vxnRdTw7TFoTrqG81uToozPXk0ko78S26Nl6tQCKA7LP0ilEwawaSulEP3zRewLs00R
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f003:b0:65b:3d3a:c1da with SMTP id
 006d021491bc7-65b455fcd69mr7937528eaf.22.1765932386617; Tue, 16 Dec 2025
 16:46:26 -0800 (PST)
Date: Tue, 16 Dec 2025 16:46:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6941fd62.a70a0220.207337.0021.GAE@google.com>
Subject: [syzbot] [ntfs3?] INFO: task hung in ni_readpage_cmpr (3)
From: syzbot <syzbot+5af33dd272b913b65880@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a5663c04bb6 Add linux-next specific files for 20251215
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1424ad92580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a94030c847137a18
dashboard link: https://syzkaller.appspot.com/bug?extid=5af33dd272b913b65880
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1558b9c2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14895b14580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/893a2318f286/disk-4a5663c0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/463a87b4b88f/vmlinux-4a5663c0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f56cdb6e8801/bzImage-4a5663c0.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e8c6f647a59e/mount_0.gz

The issue was bisected to:

commit f35590ee26f5722bfe12cdff14396c4c057a8f74
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Tue Oct 14 17:36:17 2025 +0000

    fs/ntfs3: remove ntfs_bio_pages and use page cache for compressed I/O

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1048ab0a580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1248ab0a580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1448ab0a580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5af33dd272b913b65880@syzkaller.appspotmail.com
Fixes: f35590ee26f5 ("fs/ntfs3: remove ntfs_bio_pages and use page cache for compressed I/O")

INFO: task syz.0.17:6022 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.17        state:D stack:23456 pid:6022  tgid:6022  ppid:5940   task_flags:0x440140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5258 [inline]
 __schedule+0x150e/0x5070 kernel/sched/core.c:6866
 __schedule_loop kernel/sched/core.c:6948 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6963
 io_schedule+0x80/0xd0 kernel/sched/core.c:7792
 folio_wait_bit_common+0x6b0/0xb80 mm/filemap.c:1323
 __folio_lock mm/filemap.c:1699 [inline]
 folio_lock include/linux/pagemap.h:1159 [inline]
 __filemap_get_folio_mpol+0x13e/0xb00 mm/filemap.c:1954
 __filemap_get_folio include/linux/pagemap.h:763 [inline]
 ntfs_lock_new_page+0x30/0x7c0 fs/ntfs3/frecord.c:2028
 ni_readpage_cmpr+0x685/0x940 fs/ntfs3/frecord.c:2102
 ntfs_read_folio+0x18d/0x200 fs/ntfs3/inode.c:739
 read_pages+0x35d/0x580 mm/readahead.c:173
 page_cache_ra_unbounded+0x750/0x990 mm/readahead.c:302
 do_sync_mmap_readahead+0x394/0x870 mm/filemap.c:3360
 filemap_fault+0x6ac/0x1290 mm/filemap.c:3549
 __do_fault+0x138/0x390 mm/memory.c:5320
 do_read_fault mm/memory.c:5755 [inline]
 do_fault mm/memory.c:5889 [inline]
 do_pte_missing+0x2206/0x3330 mm/memory.c:4401
 handle_pte_fault mm/memory.c:6273 [inline]
 __handle_mm_fault mm/memory.c:6411 [inline]
 handle_mm_fault+0x1b26/0x32b0 mm/memory.c:6580
 do_user_addr_fault+0x764/0x1380 arch/x86/mm/fault.c:1387
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x82/0x100 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:618
RIP: 0010:rep_movs_alternative+0x4a/0x90 arch/x86/lib/copy_user_64.S:74
Code: 48 04 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 8b 06 48 89 07 48 83 c6 08 48 83 c7 08 83 e9 08 74 db 83 f9 08 73 e8 eb c5 <f3> a4 c3 cc cc cc cc 48 8b 06 48 89 07 48 8d 47 08 48 83 e0 f8 48
RSP: 0018:ffffc900038a7cf8 EFLAGS: 00050202
RAX: 00007ffffffff001 RBX: 0000000000000094 RCX: 0000000000000094
RDX: 0000000000000001 RSI: 00002000000036c0 RDI: ffffc900038a7d60
RBP: ffffc900038a7ea8 R08: ffffc900038a7df3 R09: 1ffff92000714fbe
R10: dffffc0000000000 R11: fffff52000714fbf R12: 1ffff92000714fa8
R13: 0000000000000094 R14: ffffc900038a7d60 R15: 00002000000036c0
 copy_user_generic arch/x86/include/asm/uaccess_64.h:126 [inline]
 raw_copy_from_user arch/x86/include/asm/uaccess_64.h:141 [inline]
 _inline_copy_from_user include/linux/uaccess.h:185 [inline]
 _copy_from_user+0x7a/0xb0 lib/usercopy.c:18
 copy_from_user include/linux/uaccess.h:223 [inline]
 copy_from_bpfptr_offset include/linux/bpfptr.h:53 [inline]
 copy_from_bpfptr include/linux/bpfptr.h:59 [inline]
 __sys_bpf+0x1e3/0x860 kernel/bpf/syscall.c:6137
 __do_sys_bpf kernel/bpf/syscall.c:6274 [inline]
 __se_sys_bpf kernel/bpf/syscall.c:6272 [inline]
 __x64_sys_bpf+0x7c/0x90 kernel/bpf/syscall.c:6272
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7d2f18f749
RSP: 002b:00007ffc38e4b368 EFLAGS: 00000246 ORIG_RAX: 0000000000000141
RAX: ffffffffffffffda RBX: 00007f7d2f3e5fa0 RCX: 00007f7d2f18f749
RDX: 0000000000000094 RSI: 00002000000036c0 RDI: 0000000000000005
RBP: 00007f7d2f213f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7d2f3e5fa0 R14: 00007f7d2f3e5fa0 R15: 0000000000000003
 </TASK>

Showing all locks held in the system:
1 lock held by rcu_exp_gp_kthr/18:
 #0: ffff8880b863a918 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:639
1 lock held by khungtaskd/31:
 #0: ffffffff8df41b20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8df41b20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff8df41b20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
3 locks held by kworker/0:2/106:
 #0: ffff88813fe55948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x841/0x15a0 kernel/workqueue.c:3254
 #1: ffffc90002707b80 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work+0x868/0x15a0 kernel/workqueue.c:3255
 #2: ffff88807d5b0240 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x1f7/0x3b0 drivers/net/netdevsim/fib.c:1490
2 locks held by kworker/u8:5/151:
 #0: ffff8880b863a918 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:639
 #1: ffff8880b8624588 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x53/0x880 kernel/sched/psi.c:933
2 locks held by getty/5585:
 #0: ffff88803466b0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x449/0x1460 drivers/tty/n_tty.c:2211
2 locks held by syz.0.17/6022:
 #0: ffff88805a50f270 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff88805a50f270 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff88805a50ee38 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff88805a50ee38 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.1.18/6051:
 #0: ffff88805a607270 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff88805a607270 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff88805a606e38 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff88805a606e38 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.2.19/6083:
 #0: ffff8880716da9a0 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff8880716da9a0 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff8880716da568 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff8880716da568 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.3.20/6104:
 #0: ffff8880717993c8 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff8880717993c8 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff888071798f90 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff888071798f90 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.4.21/6132:
 #0: ffff88805a5093c8 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff88805a5093c8 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff88805a508f90 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff88805a508f90 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.5.22/6163:
 #0: ffff8880716dc6c0 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff8880716dc6c0 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff8880716dc288 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff8880716dc288 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.6.23/6195:
 #0: ffff88805a7b13c8 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff88805a7b13c8 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff88805a7b0f90 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff88805a7b0f90 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
4 locks held by kworker/u8:15/6196:
2 locks held by syz.7.24/6225:
 #0: ffff88805a7b63e0 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff88805a7b63e0 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff88805a7b5fa8 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff88805a7b5fa8 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.8.25/6254:
 #0: ffff88805a608c80 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff88805a608c80 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff88805a608848 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff88805a608848 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by syz.9.26/6289:
 #0: ffff88805a60dc98 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: filemap_invalidate_lock_shared include/linux/fs.h:1092 [inline]
 #0: ffff88805a60dc98 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0x1cf/0x990 mm/readahead.c:233
 #1: ffff88805a60d860 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1127 [inline]
 #1: ffff88805a60d860 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_read_folio+0x180/0x200 fs/ntfs3/inode.c:738
2 locks held by dhcpcd/6290:
 #0: ffff88805b61c260 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1700 [inline]
 #0: ffff88805b61c260 (sk_lock-AF_PACKET){+.+.}-{0:0}, at: packet_do_bind+0x33/0xd30 net/packet/af_packet.c:3197
 #1: ffffffff8df47678 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:311 [inline]
 #1: ffffffff8df47678 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x2f6/0x730 kernel/rcu/tree_exp.h:956

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:346 [inline]
 watchdog+0xf95/0xfe0 kernel/hung_task.c:515
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:pv_native_safe_halt+0x13/0x20 arch/x86/kernel/paravirt.c:82
Code: cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d b3 70 0c 00 f3 0f 1e fa fb f4 <e9> 48 ee 02 00 cc cc cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc90000197de0 EFLAGS: 000002c6
RAX: db7ff23837f9f800 RBX: ffffffff8197928a RCX: db7ff23837f9f800
RDX: 0000000000000001 RSI: ffffffff8d793d57 RDI: ffffffff8bc08460
RBP: ffffc90000197f10 R08: ffff8880b87336db R09: 1ffff110170e66db
R10: dffffc0000000000 R11: ffffed10170e66dc R12: ffffffff8f822c70
R13: 1ffff110039dcb70 R14: 0000000000000001 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff888125f32000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000056496680a168 CR3: 0000000028dbe000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x13/0x20 arch/x86/kernel/process.c:767
 default_idle_call+0x73/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:191 [inline]
 do_idle+0x1ea/0x520 kernel/sched/idle.c:332
 cpu_startup_entry+0x44/0x60 kernel/sched/idle.c:430
 start_secondary+0x101/0x110 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x147
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
