Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530514A619
	for <ntfs3@lists.linux.dev>; Mon,  1 Jun 2026 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344751; cv=none; b=IrhPf+zH20Or/Xh6D0O8VPBosuRwYknZM0s+oAsoXlacSinHBHuM272Kb0v/Fj1vRjIfwnDE1HwSr1qNtx5q8oqAoMFMBb24cDENLsS+OIicXl9TPGbkIt/UoyiCk1rfSQFjJl3QVJmn+MFVkTLiatpzeEJ+nSz4eN9B5qTcTN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344751; c=relaxed/simple;
	bh=wrmm7xq4SE56Yyuu3heuTrajDerVW1jtI42NrKuAWzQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Kg78t0RHk2DUEtSnxh/Z/U0FhzrKOGSYYurueq/YWJv0G0/X+jUEZdFV/aJbu+O3OhFy0bkyxte1kzFvnzhDijH7YJd5C224oPOkNnA91v5sYdNL7wMA3DeqMkkjXWwyQ4kZ4WMt2fzGZ9RgQYkB4PO8vmhgBrnWpoaUAI8lw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-43b7aa790e1so13721000fac.0
        for <ntfs3@lists.linux.dev>; Mon, 01 Jun 2026 13:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780344748; x=1780949548;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0iHOZK+uaiWX3bIe5dxVncfzUpjPmCGHQdWD35vIZY=;
        b=tIMoCzWb87R8A5a01JY/3MKDvveV7RIJkl1NgyAPP0X43xi2avorPoLzAnCV8a5LSI
         tr5kpflf26XbWcCRroWD3ypPxpd07WTMaRoz2XISKx0C0Ao+waqTWP+aPdtH8po/OFEI
         vVvIjIIpES6FF/hUYJxzTMzFxJXVZdFjaSn93QrfepGAp+T4KOoLWRg74h2OYVp3UMMW
         XNbu7hyyAkw2l2QFcSqOYgLlWQD6sGrKPXLByPmD0Hh2AD/k5Pp/ekfncEz3opbuWFn3
         +0MwtGpC5ctErm131vkTrmwzwcqmv54LYgVL5dJWN+aJ+YXfIHWFIKo4BRz1JE1Vkt5N
         mPjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/u7YbmGHW41Xspl5oH1zQ8+hrQ/xy1N3WdgX1RIoUmGeLuD6rDMXrcUEjCmL2JVD3Q4h7+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPf9Y4Ye22ZiVyEq7c+JqezvgiyPLpretsriH2QhP+SZ3gL6Hu
	kX9Z8mYFwZhbpJSorxj0UCGSUiYv/cKCnUQp/rymseX5P1D220szxn2Ur1z1tk+KSb8O2SEVSGP
	ubI0X5Xog60u/JuY0GOFFARctxKDaLJb8PYNrBZbM6lDoKCbWQsNiHKcvI4w=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1791:b0:696:8e8b:2097 with SMTP id
 006d021491bc7-69e102b59b0mr6638812eaf.21.1780344748532; Mon, 01 Jun 2026
 13:12:28 -0700 (PDT)
Date: Mon, 01 Jun 2026 13:12:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1de7ac.b43a32fa.142f43.0003.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in ntfs_read_hdr
From: syzbot <syzbot+233bcd55d51543e76e99@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    df685633c3db Merge tag 'rcu-fixes.v7.1-20260519a' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d17fba580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f195f6be48c12ec
dashboard link: https://syzkaller.appspot.com/bug?extid=233bcd55d51543e76e99
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-df685633.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0d8ce459af2e/vmlinux-df685633.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f8a4c255465/bzImage-df685633.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+233bcd55d51543e76e99@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
ntfs3(loop0): Mark volume as dirty due to NTFS errors
==================================================================
BUG: KASAN: slab-use-after-free in ntfs_read_hdr+0x938/0xc80 fs/ntfs3/dir.c:368
Read of size 2 at addr ffff888037a69300 by task syz.0.0/5321

CPU: 0 UID: 0 PID: 5321 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ntfs_read_hdr+0x938/0xc80 fs/ntfs3/dir.c:368
 ntfs_readdir+0x6f4/0xe40 fs/ntfs3/dir.c:504
 iterate_dir+0x399/0x570 fs/readdir.c:110
 __do_sys_getdents64 fs/readdir.c:399 [inline]
 __se_sys_getdents64+0xf1/0x280 fs/readdir.c:384
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f777759ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7778502fe8 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 00007f7777815fa0 RCX: 00007f777759ce59
RDX: 0000000000001020 RSI: 0000200000003cc0 RDI: 0000000000000004
RBP: 00007f7777632d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7777816038 R14: 00007f7777815fa0 R15: 00007ffd4e630e18
 </TASK>

Allocated by task 5321:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5295 [inline]
 __kmalloc_noprof+0x35c/0x760 mm/slub.c:5307
 kmalloc_noprof include/linux/slab.h:954 [inline]
 mi_init+0x76/0xe0 fs/ntfs3/record.c:105
 ntfs_read_mft fs/ntfs3/inode.c:55 [inline]
 ntfs_iget5+0x36a/0x38e0 fs/ntfs3/inode.c:542
 dir_search_u+0x1fd/0x2e0 fs/ntfs3/dir.c:265
 ntfs_lookup+0x100/0x1d0 fs/ntfs3/namei.c:85
 __lookup_slow+0x2b7/0x410 fs/namei.c:1915
 lookup_slow+0x53/0x70 fs/namei.c:1932
 walk_component fs/namei.c:2278 [inline]
 lookup_last fs/namei.c:2785 [inline]
 path_lookupat+0x3f5/0x8c0 fs/namei.c:2809
 filename_lookup+0x256/0x5d0 fs/namei.c:2838
 do_fchownat+0xfa/0x250 fs/open.c:800
 __do_sys_chown fs/open.c:824 [inline]
 __se_sys_chown fs/open.c:822 [inline]
 __x64_sys_chown+0x82/0xa0 fs/open.c:822
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 68:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6250 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6565
 ni_try_remove_attr_list+0xd78/0xf30 fs/ntfs3/frecord.c:-1
 ni_write_inode+0xa27/0xff0 fs/ntfs3/frecord.c:3191
 write_inode fs/fs-writeback.c:1584 [inline]
 __writeback_single_inode+0x75a/0x10e0 fs/fs-writeback.c:1827
 writeback_sb_inodes+0x979/0x19d0 fs/fs-writeback.c:2056
 __writeback_inodes_wb+0x111/0x240 fs/fs-writeback.c:2132
 wb_writeback+0x459/0xb00 fs/fs-writeback.c:2243
 wb_check_start_all fs/fs-writeback.c:2369 [inline]
 wb_do_writeback fs/fs-writeback.c:2395 [inline]
 wb_workfn+0x921/0xf10 fs/fs-writeback.c:2428
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3397
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3478
 kthread+0x389/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888037a69000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 768 bytes inside of
 freed 1024-byte region [ffff888037a69000, ffff888037a69400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x37a68
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000040 ffff88801ac41dc0 dead000000000122 0000000000000000
raw: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 04fff00000000040 ffff88801ac41dc0 dead000000000122 0000000000000000
head: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 04fff00000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5321, tgid 5320 (syz.0.0), ts 85676669454, free_ts 85638163486
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x22d/0x280 mm/page_alloc.c:1858
 prep_new_page mm/page_alloc.c:1866 [inline]
 get_page_from_freelist+0x24ba/0x2540 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5226
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3467
 new_slab mm/slub.c:3525 [inline]
 refill_objects+0x339/0x3d0 mm/slub.c:7271
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x321/0x720 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 __do_kmalloc_node mm/slub.c:5294 [inline]
 __kmalloc_noprof+0x474/0x760 mm/slub.c:5307
 kmalloc_noprof include/linux/slab.h:954 [inline]
 mi_init+0x76/0xe0 fs/ntfs3/record.c:105
 ntfs_read_mft fs/ntfs3/inode.c:55 [inline]
 ntfs_iget5+0x36a/0x38e0 fs/ntfs3/inode.c:542
 dir_search_u+0x1fd/0x2e0 fs/ntfs3/dir.c:265
 ntfs_extend_init+0x247/0x500 fs/ntfs3/fsntfs.c:250
 ntfs_fill_super+0x41ec/0x4580 fs/ntfs3/super.c:1661
 get_tree_bdev_flags+0x431/0x4f0 fs/super.c:1694
 vfs_get_tree+0x92/0x2a0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3758 [inline]
 do_new_mount+0x341/0xd30 fs/namespace.c:3834
 do_mount fs/namespace.c:4167 [inline]
 __do_sys_mount fs/namespace.c:4383 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4360
page last free pid 5321 tgid 5320 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0xbc7/0xd30 mm/page_alloc.c:2943
 stack_depot_save_flags+0x40e/0x810 lib/stackdepot.c:735
 kasan_save_stack mm/kasan/common.c:58 [inline]
 kasan_save_track+0x4f/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4569 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 kmem_cache_alloc_lru_noprof+0x2b8/0x640 mm/slub.c:4917
 ntfs_alloc_inode+0x28/0x80 fs/ntfs3/super.c:631
 alloc_inode+0x6a/0x1b0 fs/inode.c:345
 iget5_locked+0x4a/0xa0 fs/inode.c:1382
 ntfs_iget5+0xc1/0x38e0 fs/ntfs3/inode.c:535
 ntfs_fill_super+0x3e5a/0x4580 fs/ntfs3/super.c:1615
 get_tree_bdev_flags+0x431/0x4f0 fs/super.c:1694
 vfs_get_tree+0x92/0x2a0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3758 [inline]
 do_new_mount+0x341/0xd30 fs/namespace.c:3834
 do_mount fs/namespace.c:4167 [inline]
 __do_sys_mount fs/namespace.c:4383 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4360
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888037a69200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888037a69280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888037a69300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888037a69380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888037a69400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
