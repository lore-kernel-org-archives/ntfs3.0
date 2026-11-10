Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336116;
	b=wzHwUXgvLxc1YrZIIfQbh2plCddVTMDDyZG6IAus0i0c/qofMME4wv6MiasHwOZ3n1sj
	 Vlfzxnp+2nZhOIYoWRBSfdy4prFriGfkHSbWxs4E2IbR+qkNZSjQAZ0WRFgloeo+JSyGt
	 DrnF+MSPPhFwhuGLOpY+i4piQ3Vfse7Z4NKIPnigh906wDFZjL3IioERBxRfCQRU/FAHF
	 61NA6bB/CYhT1fQqeK/JnR/QqAg6ejACdcbLJGOd0B4HYUrYQuR5N2+YI5jSamEaeKK0w
	 0sXObo53/t1T78CccN+VO91xFec/EWbX3+bOGWl1jPZsX4kd4Pr+wnoSOf3mDx3keCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336116;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=8wcorGQR2HiBVbL9to1uyCRJ7JujFQe4DI/FxRdi+rw=;
	b=HaU3a+6lvJ9VjhIMan3FOha+NcLge5X8ULzXAjmaMorfRsghQxV+PtWa64xak+vG0vY4
	 yQAWlHFlfCwDibiOMKb8bcKDDIgbqpmcdyqIMYhbudLyqKML+AUnr+jx3sa0nYX++Y2oz
	 i7h1LK7KhfR2wPiFe0f62MR4vcVxLHEp5JSwUOiIEi5kRvyKw15bDSMJcR/7X35zQD27k
	 Pp8pPisTys0/tdUeczAeZNG75/nY8v2kmqSGMmIkEEA27B3z4iawqNbR7Ou9i9+5g64jI
	 q0P7mWuKPXgPcEvEeW6SagamiONe61WyDtT7ghyca6JiJ4COlAmwakTGJVgsvc+JwbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B370606A905
	for <ntfs3@lists.linux.dev>; Tue, 10 Nov 2026 18:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B370606A905
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2d1eb484aso2993637b6e.2
        for <ntfs3@lists.linux.dev>; Tue, 10 Nov 2026 10:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336115; x=1794940915;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wcorGQR2HiBVbL9to1uyCRJ7JujFQe4DI/FxRdi+rw=;
        b=KcMXlUozi6tgcKVS2lems3i2ilgHIVBYLiUBojso1uHV8LRkaZDkiB3MwThkB87Vv+
         K7IXmMgX4fFOEu2T+8Bk5p9dZdWCGIp2HqCTj69NEdfbPSfdJJWeYllu/lk7CLxxEVan
         4YSMZBWun97pyhz7gKW1qI5rg4mBTnJWUV28ivkYWStELiJnSbAb47ARKxBa0BHDtR0T
         /V6sukwP1Hp/u2WiGexjXK4XJrg0YTQCtVihcwCdUJDUikzq1v2gsC3zVVH7PvQOr1Sj
         qdnoGE9ZVzaFwveGzsZhRBj5N23pq025Etm3lJcy1a9Cw5UmGVpFQ/0ZWAbLfwv3fbZg
         r3Mg==
X-Forwarded-Encrypted: i=1; AL+hErE9QOVkFHYmalqxsc7zZTrD9yAmetJKnpvaz5587/Ogjk7GTi4HJ//lAjKSkGjZc861OUbxiA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/YeQJn8nugtMrKB+A3FhIdhwnidSRbWdN5qNykNLl+8+ummLZA
	itPcwl50y5/Dzm7k++9S+7CNXuMkoAgo4UhXF+OH4RF1agn1klXleNvtFKexP+fsVV6paDoJtn2
	i+uQnS2B7nR5QW5dK5Bv5TvmUNtE3Al+W3h7ywLece4jX9OqQGFa2jlw7DKc=
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1f4:b0:54e:31cd:dcd2 with SMTP id
 5614622812f47-5683cd3d902mr3434677b6e.44.1794336115099; Tue, 10 Nov 2026
 10:41:55 -0800 (PST)
Date: Tue, 10 Nov 2026 10:41:55 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af36573.c2a1e073.10a5a1.1171.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in ntfs_iget5_flags
From: syzbot <syzbot+62769d828b0914efeb09@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7475ea8b5861 Linux 7.4-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11634ebe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
dashboard link: https://syzkaller.appspot.com/bug?extid=62769d828b0914efeb09
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-7475ea8b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d9e65074cbc3/vmlinux-7475ea8b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5b6a12c6fb21/bzImage-7475ea8b.xz

AI-generated root cause summary:
A slab use-after-free occurs in the ntfs3 filesystem due to a synchronization
flaw between directory enumeration and background writeback. In
fs/ntfs3/dir.c:ntfs_readdir(), ni_lock(ni) is released before invoking
ntfs_read_hdr() under the assumption that root->ihdr inside the primary MFT
record buffer (ni->mi.mrec) has an immutable lifetime bound to the inode under
shared i_rwsem. However, background writeback (ni_write_inode() ->
ni_try_remove_attr_list() in fs/ntfs3/frecord.c) only acquires ni_trylock(ni)
without taking i_rwsem, and on failure executes swap(mrec, ni->mi.mrec) and
kfree(mrec), freeing the original ni->mi.mrec buffer. Consequently,
ntfs_read_hdr() continues iterating over entries within the freed buffer,
passing &e->ref to ntfs_dir_emit() and ntfs_iget5_flags(), resulting in a
use-after-free read at ref->seq.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=62769d828b0914efeb09

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62769d828b0914efeb09@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in ntfs_read_mft fs/ntfs3/inode.c:86 [inline]
BUG: KASAN: slab-use-after-free in ntfs_iget5_flags+0x441a/0x4780 fs/ntfs3/inode.c:735
Read of size 2 at addr ffff88805403523e by task syz.0.0/5348

CPU: 0 UID: 0 PID: 5348 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ntfs_read_mft fs/ntfs3/inode.c:86 [inline]
 ntfs_iget5_flags+0x441a/0x4780 fs/ntfs3/inode.c:735
 ntfs_iget5 fs/ntfs3/ntfs_fs.h:804 [inline]
 ntfs_dir_emit fs/ntfs3/dir.c:396 [inline]
 ntfs_read_hdr+0x793/0xc10 fs/ntfs3/dir.c:444
 ntfs_readdir+0x68c/0xf00 fs/ntfs3/dir.c:573
 iterate_dir+0x3db/0x880 fs/readdir.c:114
 __do_sys_getdents fs/readdir.c:324 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:309
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0f0ad9fb19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0f071f4fe8 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f0f0b026090 RCX: 00007f0f0ad9fb19
RDX: 00000000000000b8 RSI: 0000200000023900 RDI: 0000000000000004
RBP: 00007f0f0ae37b70 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f0f0b026128 R14: 00007f0f0b026090 R15: 00007ffe5a93e948
 </TASK>

Allocated by task 5347:
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

Freed by task 13:
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

The buggy address belongs to the object at ffff888054035000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 574 bytes inside of
 freed 1024-byte region [ffff888054035000, ffff888054035400)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x54034
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4fff00000000040(head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000040 ffff88801c841dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 04fff00000000040 ffff88801c841dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 04fff00000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5347, tgid 5346 (syz.0.0), ts 105458573353
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x2224/0x2290 mm/page_alloc.c:3940
 __alloc_frozen_pages_noprof+0x1fe/0x410 mm/page_alloc.c:5464
 alloc_slab_page mm/slub.c:3384 [inline]
 allocate_slab+0x7d/0x5e0 mm/slub.c:3499
 new_slab mm/slub.c:3550 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7539
 refill_sheaf mm/slub.c:2917 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4811
 alloc_from_pcs mm/slub.c:4887 [inline]
 slab_alloc_node mm/slub.c:5021 [inline]
 __do_kmalloc_node mm/slub.c:5530 [inline]
 __kmalloc_noprof+0x476/0x710 mm/slub.c:5556
 _kmalloc_noprof include/linux/slab.h:995 [inline]
 mi_init+0x76/0xe0 fs/ntfs3/record.c:105
 ntfs_read_mft fs/ntfs3/inode.c:61 [inline]
 ntfs_iget5_flags+0x67e/0x4780 fs/ntfs3/inode.c:735
 ntfs_iget5 fs/ntfs3/ntfs_fs.h:804 [inline]
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
page last free pid 5347 tgid 5346 ts 105440119943 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1403 [inline]
 __free_frozen_pages+0xc97/0xd90 mm/page_alloc.c:2957
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
 ntfs_iget5 fs/ntfs3/ntfs_fs.h:804 [inline]
 ntfs_fill_super+0x38e3/0x49c0 fs/ntfs3/super.c:1594
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
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888054035100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888054035180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888054035200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff888054035280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888054035300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
