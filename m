Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A536F2DA75C
	for <ntfs3@lists.linux.dev>; Fri, 19 Jun 2026 01:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781831618; cv=none; b=WVqSgIzxgsxMB6Q0qI9folf0IsuoMSk+C1Ys84b2q1dlEDDgn97rNwazIzLWWN7RQwhzxTR0U0PDVUBM4C0eJqw4k6AxAdm/O/k5FWxItcRN/4lABING7L32sQTGTJR4v97NJ5B1xvfpp2fuxxkw5FL6bOLFnyGmEWd2uyN//QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781831618; c=relaxed/simple;
	bh=ELmGwLBhpnwoturQ4U46NJlf40mJjHBFHx/TM9mfUsA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cWL2CZlGE8i8ukoW/X8dmcdc7Ci2dEJKg5Uw09ia5qQ1onXvZoh1ge1Aj+FPn6JoP9Vb05AiF6Qz5UwLViXyIQVgVjtgrTT8NyPqf2Kdkca4CGDBz1c7+2HrLHa86q+Zst+TjJXfpQgxdpHez482PkWyyzHQYZ6vXRy9p6AlETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-48687df43c4so3342778b6e.0
        for <ntfs3@lists.linux.dev>; Thu, 18 Jun 2026 18:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781831615; x=1782436415;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gnlg/kKWYOYxCT/dyiem3m3JNwVdkaFx53N2xtwn2wo=;
        b=ptQW5NNR2AX3tdAoeXeE3Lp6nMyjhRP3l1FxPcMKQ7vRI31ejeVFvXLCyfShS5ZKHZ
         tiZA3y9J5kIk8LYxKEaYteC9BGE1qYUUf2f79WOBOVNVxh+ht/wiG3ekWxB0H5Zbf3A/
         hiKjrwP7p9qW0lHBwgqu4b7reqYvPvtLJIJKSh+Wb2hIz2koIzNSt++fjnp32ek63buM
         DkCbdeZFtGPKUIS/V2OrIrtUMY0CBt6kV5ITLaQF/IPpQJR8wVbf6gsPTGs3jEgbubx5
         yqmbgbQEEAqTUTnvUAVNTwkJ9rHg58RmxD7XFYYrG95UyLPjaoyVtaHCoOAXGHu4Kcxy
         VEww==
X-Forwarded-Encrypted: i=1; AFNElJ9RKcMvuml3uR6Cd9Gu0UP/M/PE0Lb45YReh5/BkItNlWECy+cSBRScinW7z01Aj8lCfh6KvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8Gpxm/lgc9E3EbE/LZJK9tNyGDaM6l32prgSGq1pkmjNgJY9b
	7N+/RoGAJW+YkP4/ewEiI2ZcJ5TWK9VbrvSv3ipe4RU09ng/AHRyVpGUt3coVfMfLFg268eMOFq
	yBvs1ZjpOV4S0qK4o6jYK3ksxl4kHA0u6wx7qDyR9EAzp3QwK83Pg0Z9KIEc=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1904:b0:482:ce40:ab58 with SMTP id
 5614622812f47-4896ac760c7mr1554344b6e.34.1781831615631; Thu, 18 Jun 2026
 18:13:35 -0700 (PDT)
Date: Thu, 18 Jun 2026 18:13:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a3497bf.6d5abbec.a50f.002a.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in ntfs_set_inode (2)
From: syzbot <syzbot+33e764e33338f7b46952@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2b07ea76fd28 Merge tag 'core-urgent-2026-06-13' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=158968ae580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e71d32f362d69e5f
dashboard link: https://syzkaller.appspot.com/bug?extid=33e764e33338f7b46952
compiler:       Debian clang version 22.1.6 (++20260514074242+fc4aad7b5db3-1~exp1~20260514074407.73), Debian LLD 22.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-2b07ea76.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/56a351e5a4b7/vmlinux-2b07ea76.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f139fd94ae0c/bzImage-2b07ea76.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33e764e33338f7b46952@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
ntfs3(loop0): Mark volume as dirty due to NTFS errors
==================================================================
BUG: KASAN: slab-use-after-free in ino_get fs/ntfs3/ntfs.h:192 [inline]
BUG: KASAN: slab-use-after-free in ntfs_set_inode+0x70/0x80 fs/ntfs3/inode.c:526
Read of size 4 at addr ffff888011c6ea38 by task syz.0.0/5330

CPU: 0 UID: 0 PID: 5330 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ino_get fs/ntfs3/ntfs.h:192 [inline]
 ntfs_set_inode+0x70/0x80 fs/ntfs3/inode.c:526
 inode_insert5+0x152/0x5d0 fs/inode.c:1328
 iget5_locked+0x66/0xa0 fs/inode.c:1385
 ntfs_iget5+0xc3/0x3760 fs/ntfs3/inode.c:535
 ntfs_dir_emit fs/ntfs3/dir.c:337 [inline]
 ntfs_read_hdr+0x783/0xc00 fs/ntfs3/dir.c:385
 ntfs_readdir+0x707/0xe80 fs/ntfs3/dir.c:504
 iterate_dir+0x2e2/0x4d0 fs/readdir.c:110
 __do_sys_getdents fs/readdir.c:319 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:304
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f22b4d9ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f22b5cbbfe8 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f22b5015fa0 RCX: 00007f22b4d9ce59
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 0000000000000005
RBP: 00007f22b4e32d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f22b5016038 R14: 00007f22b5015fa0 R15: 00007ffdae82b488
 </TASK>

Allocated by task 5330:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5296 [inline]
 __kmalloc_noprof+0x358/0x750 mm/slub.c:5308
 kmalloc_noprof include/linux/slab.h:954 [inline]
 mi_init+0x76/0xe0 fs/ntfs3/record.c:105
 ntfs_read_mft fs/ntfs3/inode.c:55 [inline]
 ntfs_iget5+0x33c/0x3760 fs/ntfs3/inode.c:542
 dir_search_u+0x1fd/0x2e0 fs/ntfs3/dir.c:265
 ntfs_lookup+0x100/0x1d0 fs/ntfs3/namei.c:85
 __lookup_slow+0x2b7/0x410 fs/namei.c:1915
 lookup_slow+0x53/0x70 fs/namei.c:1932
 walk_component fs/namei.c:2278 [inline]
 lookup_last fs/namei.c:2785 [inline]
 path_lookupat+0x3f5/0x8c0 fs/namei.c:2809
 filename_lookup+0x265/0x5d0 fs/namei.c:2838
 do_fchownat+0xfa/0x250 fs/open.c:800
 __do_sys_chown fs/open.c:824 [inline]
 __se_sys_chown fs/open.c:822 [inline]
 __x64_sys_chown+0x82/0xa0 fs/open.c:822
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 1059:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6251 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6566
 ni_try_remove_attr_list+0xd74/0xf10 fs/ntfs3/frecord.c:-1
 ni_write_inode+0x97a/0xfe0 fs/ntfs3/frecord.c:3191
 write_inode fs/fs-writeback.c:1584 [inline]
 __writeback_single_inode+0x6ac/0xf90 fs/fs-writeback.c:1827
 writeback_sb_inodes+0x9de/0x1b00 fs/fs-writeback.c:2056
 __writeback_inodes_wb+0x114/0x240 fs/fs-writeback.c:2132
 wb_writeback+0x42f/0xad0 fs/fs-writeback.c:2243
 wb_check_start_all fs/fs-writeback.c:2369 [inline]
 wb_do_writeback fs/fs-writeback.c:2395 [inline]
 wb_workfn+0x921/0xf10 fs/fs-writeback.c:2428
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3397
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3478
 kthread+0x389/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888011c6e800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 568 bytes inside of
 freed 1024-byte region [ffff888011c6e800, ffff888011c6ec00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11c6c
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801ac41dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801ac41dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000800080008 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5293, tgid 5293 (syz-executor), ts 81322451283, free_ts 33691380069
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x22d/0x280 mm/page_alloc.c:1853
 prep_new_page mm/page_alloc.c:1861 [inline]
 get_page_from_freelist+0x24ae/0x2530 mm/page_alloc.c:3941
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5221
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3467
 new_slab mm/slub.c:3525 [inline]
 refill_objects+0x336/0x3d0 mm/slub.c:7272
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x320/0x720 mm/slub.c:4652
 alloc_from_pcs mm/slub.c:4750 [inline]
 slab_alloc_node mm/slub.c:4884 [inline]
 __do_kmalloc_node mm/slub.c:5295 [inline]
 __kvmalloc_node_noprof+0x642/0x890 mm/slub.c:6833
 bucket_table_alloc lib/rhashtable.c:195 [inline]
 rhashtable_init_noprof+0x535/0xae0 lib/rhashtable.c:1108
 ipc_init_ids+0x7b/0x1f0 ipc/util.c:120
 msg_init_ns+0x121/0x180 ipc/msg.c:1320
 create_ipc_ns ipc/namespace.c:84 [inline]
 copy_ipcs+0x497/0x6c0 ipc/namespace.c:116
 create_new_namespaces+0x210/0x6b0 kernel/nsproxy.c:112
 unshare_nsproxy_namespaces+0x149/0x190 kernel/nsproxy.c:234
 ksys_unshare+0x57d/0xa00 kernel/fork.c:3242
 __do_sys_unshare kernel/fork.c:3316 [inline]
 __se_sys_unshare kernel/fork.c:3314 [inline]
 __x64_sys_unshare+0x38/0x50 kernel/fork.c:3314
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
page last free pid 4711 tgid 4711 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1397 [inline]
 __free_frozen_pages+0xc0d/0xd20 mm/page_alloc.c:2938
 __slab_free+0x274/0x2c0 mm/slub.c:5613
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4570 [inline]
 slab_alloc_node mm/slub.c:4899 [inline]
 kmem_cache_alloc_noprof+0x2b8/0x650 mm/slub.c:4906
 alloc_filename fs/namei.c:142 [inline]
 do_getname+0x2e/0x250 fs/namei.c:182
 class_filename_flags_constructor include/linux/fs.h:2555 [inline]
 do_readlinkat+0xc8/0x510 fs/stat.c:569
 __do_sys_readlink fs/stat.c:605 [inline]
 __se_sys_readlink fs/stat.c:602 [inline]
 __x64_sys_readlink+0x7f/0x90 fs/stat.c:602
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888011c6e900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888011c6e980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888011c6ea00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff888011c6ea80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888011c6eb00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
