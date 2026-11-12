Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794457108;
	b=QBoDo9XyDqRHY3hMcejC7DND91f8wOvwCXayDl1GQ2Y0fAVS9hQFD9Iq4vfSQ1SpDxox
	 UX5RKGi9pVthLC0L8ZImmImrsTEwJOHfkqS7+KPv+WUTTE5mAW0dKYpaKsEd67a+QqNx4
	 ip1TA0aZk3QFikiaXiKk5MoP/6eybufFYUjMQ6D70UWZpQC8ICjv7NR2g85x1sF9qnTeJ
	 bYaZyGpmHnjtCpfW1YAyEQ/za6vwT3dXSrAybpSfZP6eU6uLnwSj1/YuSbbcoFUxq2AO5
	 jc0F3DCjQQ8ZnrduQn1uk+EWqGsJnF4HDnbcvQ9OsmzgF4vaxebOVjd9+ndop/V6XEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457108;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=k4HE90bYZv4XR8k3ShuBdFdLtlc06sKmYlxgX4yc6BQ=;
	b=K09kMrMgDVvQcQX3UcX0bgookL5zuZxsBDU5yeJo4Wn+/esshi9vKFBeCnrdTnlRZ45W
	 6fnxSgs504nMqe8tl+7mXWb0PK4WGEPaHxZsICya2PUswR59lZWMHlAXrd4RGjJHOK2GY
	 +zDqNgaHMwjiKIIoOpEqSUnbAPQGTPKG4J5nbyukKgWpmUB4GARaBwtxTB1h2nChxGhgL
	 2hntFuZi/beJbFysTHWQRa2HwvQqHI18b0RC1LRn0oZXx4CCtEi62z/Bm8zRe8FFfw0Ri
	 2DNKK+V3re2cvPFO/fYzHO9arQOw5LYLhhUlCoT8fGtK6qyYw423KoOoK2rXwugLSDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF26A606A331
	for <ntfs3@lists.linux.dev>; Thu, 12 Nov 2026 04:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF26A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b597558c4cso4493822b6e.1
        for <ntfs3@lists.linux.dev>; Wed, 11 Nov 2026 20:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794457107; x=1795061907;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4HE90bYZv4XR8k3ShuBdFdLtlc06sKmYlxgX4yc6BQ=;
        b=1h3F8vDXaZ5ZHNRTW/CfVbN5u/iWyDbe93lxvjQvB3mD/SB2RI25WglUio8qIH9aiU
         9hVeWe6qjDzMT7tpy50uG/hUdOc/ZbuxrhCw7bF/XpKKGGc/NdhWSobYXdb++DTCpqNV
         m23nOxFPqkoqYENM9E9ZL9LYFNVimeygxQCAE9a7kvpUU2c5LYcE1nwYxd5zjwhA6/Jq
         b9Yv9sGkyuzoAFrAx/SmNhzAQ97sivBB7cc7MX8fhe8xKKL5jCbtFDKdmIiOa5fMja/F
         jHVDirrEvWCw4g9mHWO63p160C+Jbq2v5s2W5qHhKBW8JtJbV5BoPVtf0I1l3BGMo3o+
         ZVDA==
X-Forwarded-Encrypted: i=1; AL+hErFvfBcJWyxiMX8XMwZQmuwXF0cUHj/h796RBy039XLdaC1qlknN87qZRTioGVWudiS+XMBhTg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9NcHUYQvDkmYzZ/wcj1++1iFMJoySLZizUJg7ekqiL55OE7dar
	1eIB8sNMdqyYx+r5AXhVdbRAIWn9ZCcnTiiO/0Yth0c0q7lJdoJGeGSM7Y2f7F2xGtvFtDQJD+X
	jHNe/okkR5UmhcJzavnNROVbqbhZkdaZyhcTCgqFlHjfxD5WG7dpPY/MP1ak=
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:8806:b0:539:4d53:170e with SMTP id
 5614622812f47-56bf68b47a3mr2484129b6e.43.1794457106985; Wed, 11 Nov 2026
 20:18:26 -0800 (PST)
Date: Wed, 11 Nov 2026 20:18:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af53e12.6d8d289a.8382.0004.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in ntfs_read_hdr (2)
From: syzbot <syzbot+7f14bc1da1f4da6518e5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    067c5c24cef2 Merge tag 'page_alloc-for-7.4-rc2' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12f45155580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
dashboard link: https://syzkaller.appspot.com/bug?extid=7f14bc1da1f4da6518e5
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-067c5c24.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e180e707408c/vmlinux-067c5c24.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3ca866fdd4ef/bzImage-067c5c24.xz

AI-generated root cause summary:
A slab-use-after-free occurs in ntfs_read_hdr() because ntfs_readdir() unlocks
ni_lock before calling ntfs_read_hdr() with a pointer to root->ihdr located
inside the MFT record buffer (ni->mi.mrec). The directory code erroneously
assumed that holding shared i_rwsem was sufficient to keep the record buffer
stable. However, background writeback (ni_write_inode()) does not take i_rwsem
and only checks ni_trylock(), so it concurrently runs ni_try_remove_attr_list()
on the inode. In ni_try_remove_attr_list(), the error recovery path restores the
primary record via swap(mrec, ni->mi.mrec) followed by kfree(mrec), freeing the
original MFT record buffer while ntfs_read_hdr() is actively traversing entries
within it.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=7f14bc1da1f4da6518e5

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7f14bc1da1f4da6518e5@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
ntfs3(loop0): Mark volume as dirty due to NTFS errors
==================================================================
BUG: KASAN: slab-use-after-free in ntfs_read_hdr+0x8f2/0xc10 fs/ntfs3/dir.c:427
Read of size 2 at addr ffff888014a9faa0 by task syz.0.0/5342

CPU: 0 UID: 0 PID: 5342 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ntfs_read_hdr+0x8f2/0xc10 fs/ntfs3/dir.c:427
 ntfs_readdir+0x68c/0xf00 fs/ntfs3/dir.c:573
 iterate_dir+0x3db/0x880 fs/readdir.c:114
 __do_sys_getdents fs/readdir.c:324 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:309
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f52ac5a8f19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f52a89f4fe8 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f52ac825fa0 RCX: 00007f52ac5a8f19
RDX: 00000000000000b8 RSI: 00002000000452c0 RDI: 0000000000000005
RBP: 00007f52ac637f6d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f52ac826038 R14: 00007f52ac825fa0 R15: 00007ffee86c7a08
 </TASK>

Allocated by task 5342:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:409 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:426
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5531 [inline]
 __kmalloc_noprof+0x366/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 mi_init+0x76/0xe0 fs/ntfs3/record.c:105
 ntfs_read_mft fs/ntfs3/inode.c:61 [inline]
 ntfs_iget5_flags+0x67e/0x4780 fs/ntfs3/inode.c:735
 dir_search_flags+0x2d7/0x560 fs/ntfs3/dir.c:318
 ntfs_lookup+0x1d9/0x450 fs/ntfs3/namei.c:96
 __lookup_slow+0x1fb/0x2f0 fs/namei.c:1925
 lookup_slow+0x59/0x80 fs/namei.c:1942
 walk_component fs/namei.c:2288 [inline]
 lookup_last fs/namei.c:2795 [inline]
 path_lookupat+0x3f5/0x8c0 fs/namei.c:2819
 filename_lookup+0x265/0x5d0 fs/namei.c:2848
 do_fchownat+0xfa/0x250 fs/open.c:849
 __do_sys_chown fs/open.c:873 [inline]
 __se_sys_chown fs/open.c:871 [inline]
 __x64_sys_chown+0x82/0xa0 fs/open.c:871
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 78:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:264 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:296
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2780 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6923
 ni_try_remove_attr_list+0xda6/0xf40 fs/ntfs3/frecord.c:-1
 ni_write_inode+0xbf1/0x1200 fs/ntfs3/frecord.c:3266
 write_inode fs/fs-writeback.c:1629 [inline]
 __writeback_single_inode+0x69d/0x1220 fs/fs-writeback.c:1872
 writeback_sb_inodes+0x9de/0x1af0 fs/fs-writeback.c:2120
 __writeback_inodes_wb+0x114/0x250 fs/fs-writeback.c:2196
 wb_writeback+0x42f/0xad0 fs/fs-writeback.c:2307
 wb_check_start_all fs/fs-writeback.c:2433 [inline]
 wb_do_writeback fs/fs-writeback.c:2480 [inline]
 wb_workfn+0x980/0x10f0 fs/fs-writeback.c:2518
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888014a9f800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 672 bytes inside of
 freed 1024-byte region [ffff888014a9f800, ffff888014a9fc00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14a9c
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c841dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801c841dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x252800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_THISNODE), pid 5342, tgid 5341 (syz.0.0), ts 95348393709
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1860
 prep_new_page mm/page_alloc.c:1868 [inline]
 get_page_from_freelist+0x225d/0x22e0 mm/page_alloc.c:3950
 __alloc_frozen_pages_noprof+0x211/0x450 mm/page_alloc.c:5492
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 ___slab_alloc+0x16a/0x960 mm/slub.c:4605
 slab_alloc_node mm/slub.c:5024 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_flags_noprof+0x33c/0x790 mm/slub.c:5719
 _kmalloc_flags_noprof mm/slab.h:55 [inline]
 alloc_slab_obj_exts+0x5c/0x180 mm/slub.c:2218
 __memcg_slab_post_alloc_hook+0x5f0/0xdb0 mm/memcontrol.c:3713
 memcg_slab_post_alloc_hook mm/slub.c:2549 [inline]
 slab_post_alloc_hook mm/slub.c:4739 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_node_track_caller_noprof+0x515/0x720 mm/slub.c:5662
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x42/0x100 mm/util.c:84
 alloc_vfsmnt+0x193/0x510 fs/namespace.c:329
 vfs_create_mount+0x68/0x310 fs/namespace.c:1267
 fc_mount fs/namespace.c:1285 [inline]
 do_new_mount_fc fs/namespace.c:3910 [inline]
 do_new_mount+0x3a6/0xb00 fs/namespace.c:3986
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4565 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4542
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5342 tgid 5341 ts 95315765400 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0xd1a/0xe10 mm/page_alloc.c:2958
 stack_depot_save_flags+0x41e/0x810 lib/stackdepot.c:735
 kasan_save_stack mm/kasan/common.c:58 [inline]
 kasan_save_track+0x4f/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:351 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:377
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4720 [inline]
 slab_alloc_node mm/slub.c:5033 [inline]
 kmem_cache_alloc_lru_noprof+0x29e/0x5f0 mm/slub.c:5066
 ntfs_alloc_inode+0x28/0x80 fs/ntfs3/super.c:681
 alloc_inode+0x6a/0x1b0 fs/inode.c:338
 iget5_locked+0x4a/0xa0 fs/inode.c:1391
 ntfs_iget5_flags+0x19a/0x4780 fs/ntfs3/inode.c:710
 ntfs_iget5 fs/ntfs3/ntfs_fs.h:805 [inline]
 ntfs_extend_init+0xff/0x510 fs/ntfs3/fsntfs.c:230
 ntfs_fill_super+0x44a0/0x49c0 fs/ntfs3/super.c:1742
 get_tree_bdev_flags+0x436/0x500 fs/super.c:1821
 vfs_get_tree+0x92/0x2a0 fs/super.c:1881
 fc_mount fs/namespace.c:1282 [inline]
 do_new_mount_fc fs/namespace.c:3910 [inline]
 do_new_mount+0x325/0xb00 fs/namespace.c:3986
 do_mount fs/namespace.c:4350 [inline]
 __do_sys_mount fs/namespace.c:4565 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4542
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89

Memory state around the buggy address:
 ffff888014a9f980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888014a9fa00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888014a9fa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff888014a9fb00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888014a9fb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
