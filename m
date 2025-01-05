Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CDA17FE
	for <ntfs3@lists.linux.dev>; Sun,  5 Jan 2025 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736076925; cv=none; b=lAhOk/+/+CJE+yfsbVEzno9UYcM5ZkaOfhtozs8IfpdhE+ZqJsvIbtaHiEbeiq5RWh/abtH5M+wQEexe9tv/8uTUiNhP+VmlwgFhtDy7mcZkIVNGvGWBexiVj6H5CH6VL2QD38iZ49CNJH8Hs7/+xK9SiEfn3xwEr5aZpT9oMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736076925; c=relaxed/simple;
	bh=DUudvDp6psNU6xKZcNiYWUc2cQvVBMUbiHOHLlKt5dE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Vzh/O4dhAZ1aBh6eXLsIiARex/03EPRYYah1koKQAX/7bDSGCAiP8bVmC+kvdwdgWPkKkGEbhOFqpHQKqQzTCWR7fXyh0wX4sqkbuzitHnGvJI7R/AFC1nI+jn4/P72rC4XbArH1hphGR2WGbxTOnPyh/NNZd4uX5EDZ7nzxr4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-84730592e44so1130926139f.3
        for <ntfs3@lists.linux.dev>; Sun, 05 Jan 2025 03:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736076922; x=1736681722;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKe/J2QFmM9TIMdWq8tAycPiDbAMH2VDna9/TyK3Ruw=;
        b=fc98WgJ/s5P47+Fz1MoQCleURIeWrcvyRMFPoSPOmlxNVTFefxhN/d+uVKDUQWkTpl
         ugghl39iGLAqhB996BQdGr3nAyrPPazVrUa8u1ql03CehfBTa7x7lcx5A7/GvWl9atuZ
         VKAH+NMBuJDiYK+hhPtqoxbHMAJ9WWem2+L1W0M/ASBT85aiJjCm8f0OGc/DI/5ann24
         Y59cIvPleFKxAU8OyTYNvd/wSj/TIIGS7ptDxEpTy+4AHahBffvUZSqvFQPRzJ2CGjvv
         e9XfCaR4OX0GsvDxTDg9mAjxTVfjdR/ON6/vCuOzjM6WnXuYvZnxOZE6od8jj3OBJN7+
         8bcg==
X-Forwarded-Encrypted: i=1; AJvYcCXfQ6la3UGkymGKwwWKwHXH5ChrSBa+i7Qrw1iTIY82a9THEZOVQ19qPynir8OsNn42h2f1GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6EMQcxPHIBbmZfJ1K7BBszNUK/JwSijnyD4U3pcJxuGnqvEld
	jhFm9GcXbNNgZGbjg2YWNZb1cqeYEOHJg8UURJETtwL+0imrkwMM1BoXU0KvJfFqEILXTvbK8Fu
	clgTcXhT34onGiXT5G9sCHJrKLyIheRaqKQAeXXuZdPQFQU9lYsnuciI=
X-Google-Smtp-Source: AGHT+IFH3HRhbPcXFOk6UbMoRepvqiCC4q6eK2JedXik/mdKqpCXmhNGa1mTFvkUcK4dF6M82b9VH7GJrIKipTTXYLU7eXq95sFI
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca5:b0:3a7:81c6:be7e with SMTP id
 e9e14a558f8ab-3c2d2d510c9mr415367255ab.13.1736076922487; Sun, 05 Jan 2025
 03:35:22 -0800 (PST)
Date: Sun, 05 Jan 2025 03:35:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677a6e7a.050a0220.380ff0.0011.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: out-of-bounds Read in __wait_on_bit
From: syzbot <syzbot+339240205a3fd334f686@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ab75170520d4 Merge tag 'linux-watchdog-6.13-rc6' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=120604b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1c541fa8af5c9cc7
dashboard link: https://syzkaller.appspot.com/bug?extid=339240205a3fd334f686
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-ab751705.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/81d0d11be3bd/vmlinux-ab751705.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f076be686f8/bzImage-ab751705.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+339240205a3fd334f686@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
overlayfs: upper fs does not support tmpfile.
overlayfs: upper fs does not support RENAME_WHITEOUT.
IPv6: sit1: Disabled Multicast RS
==================================================================
BUG: KASAN: out-of-bounds in __wait_on_bit+0xdf/0x2f0 kernel/sched/wait_bit.c:50
Read of size 8 at addr ffffc9000d1a5920 by task syz.0.0/5316

CPU: 0 UID: 0 PID: 5316 Comm: syz.0.0 Not tainted 6.13.0-rc5-syzkaller-00163-gab75170520d4 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 __wait_on_bit+0xdf/0x2f0 kernel/sched/wait_bit.c:50
 out_of_line_wait_on_bit+0x1d5/0x260 kernel/sched/wait_bit.c:64
 wait_on_bit_io include/linux/wait_bit.h:105 [inline]
 __wait_on_buffer fs/buffer.c:123 [inline]
 wait_on_buffer include/linux/buffer_head.h:414 [inline]
 __sync_dirty_buffer+0x2f7/0x390 fs/buffer.c:2858
 ntfs_write_bh+0x5f7/0x7c0 fs/ntfs3/fsntfs.c:1481
 mi_write+0x9b/0x1e0 fs/ntfs3/record.c:397
 indx_update_dup+0x69a/0x860 fs/ntfs3/index.c:2699
 ni_update_parent+0xa18/0xdd0 fs/ntfs3/frecord.c:3224
 ni_write_inode+0xd9f/0x1020 fs/ntfs3/frecord.c:3315
 write_inode fs/fs-writeback.c:1525 [inline]
 __writeback_single_inode+0x708/0x10d0 fs/fs-writeback.c:1745
 writeback_single_inode+0x1f3/0x660 fs/fs-writeback.c:1801
 sync_inode_metadata+0xc4/0x120 fs/fs-writeback.c:2871
 __generic_file_fsync+0x134/0x1a0 fs/libfs.c:1543
 generic_file_fsync+0x70/0xf0 fs/libfs.c:1573
 ovl_sync_file+0x3a/0x50 fs/overlayfs/copy_up.c:254
 ovl_copy_up_metadata+0xac1/0xef0 fs/overlayfs/copy_up.c:724
 ovl_copy_up_workdir fs/overlayfs/copy_up.c:816 [inline]
 ovl_do_copy_up fs/overlayfs/copy_up.c:1001 [inline]
 ovl_copy_up_one fs/overlayfs/copy_up.c:1202 [inline]
 ovl_copy_up_flags+0x2099/0x46f0 fs/overlayfs/copy_up.c:1257
 ovl_open+0x139/0x310 fs/overlayfs/file.c:211
 do_dentry_open+0xbe1/0x1b70 fs/open.c:945
 vfs_open+0x3e/0x330 fs/open.c:1075
 dentry_open+0x61/0xa0 fs/open.c:1098
 ima_calc_file_hash+0x16b/0x1b30 security/integrity/ima/ima_crypto.c:553
 ima_collect_measurement+0x520/0xb10 security/integrity/ima/ima_api.c:293
 process_measurement+0x1351/0x1fb0 security/integrity/ima/ima_main.c:372
 ima_file_check+0xd9/0x120 security/integrity/ima/ima_main.c:572
 security_file_post_open+0xb9/0x280 security/security.c:3121
 do_open fs/namei.c:3830 [inline]
 path_openat+0x2ccd/0x3590 fs/namei.c:3987
 do_filp_open+0x27f/0x4e0 fs/namei.c:4014
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1428
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9433585d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9434384038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f9433775fa0 RCX: 00007f9433585d29
RDX: 0000000000000083 RSI: 0000000020000000 RDI: ffffffffffffff9c
RBP: 00007f9433601b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f9433775fa0 R15: 00007ffecfac9528
 </TASK>

The buggy address belongs to stack of task syz.0.0/5316
 and is located at offset 32 in frame:
 out_of_line_wait_on_bit+0x0/0x260

This frame has 1 object:
 [32, 96) 'wq_entry'

The buggy address belongs to the virtual mapping at
 [ffffc9000d1a0000, ffffc9000d1a9000) created by:
 copy_process+0x5d1/0x3d50 kernel/fork.c:2224

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff8880367700d8 pfn:0x36770
memcg:ffff88801e21f582
flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: ffff8880367700d8 0000000000000000 00000001ffffffff ffff88801e21f582
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_ZERO), pid 5315, tgid 5315 (syz.0.0), ts 67454609265, free_ts 67065166284
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x292/0x710 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2269
 vm_area_alloc_pages mm/vmalloc.c:3591 [inline]
 __vmalloc_area_node mm/vmalloc.c:3669 [inline]
 __vmalloc_node_range_noprof+0x9c9/0x1380 mm/vmalloc.c:3846
 alloc_thread_stack_node kernel/fork.c:314 [inline]
 dup_task_struct+0x444/0x8c0 kernel/fork.c:1116
 copy_process+0x5d1/0x3d50 kernel/fork.c:2224
 kernel_clone+0x226/0x8e0 kernel/fork.c:2806
 __do_sys_clone3 kernel/fork.c:3110 [inline]
 __se_sys_clone3+0x2d8/0x360 kernel/fork.c:3089
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 5300 tgid 5300 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0xd3f/0x1010 mm/page_alloc.c:2659
 __slab_free+0x2c2/0x380 mm/slub.c:4524
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4119 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 __kmalloc_cache_noprof+0x1d9/0x390 mm/slub.c:4324
 kmalloc_noprof include/linux/slab.h:901 [inline]
 netdevice_queue_work drivers/infiniband/core/roce_gid_mgmt.c:664 [inline]
 netdevice_event+0x37d/0x950 drivers/infiniband/core/roce_gid_mgmt.c:823
 notifier_call_chain+0x1a5/0x3f0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2034 [inline]
 call_netdevice_notifiers net/core/dev.c:2048 [inline]
 dev_set_mac_address+0x3d9/0x510 net/core/dev.c:9214
 dev_set_mac_address_user+0x31/0x50 net/core/dev.c:9228
 do_setlink+0x74b/0x4210 net/core/rtnetlink.c:3064
 rtnl_changelink net/core/rtnetlink.c:3723 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3875 [inline]
 rtnl_newlink+0x1bb6/0x2210 net/core/rtnetlink.c:4012
 rtnetlink_rcv_msg+0x791/0xcf0 net/core/rtnetlink.c:6922
 netlink_rcv_skb+0x1e3/0x430 net/netlink/af_netlink.c:2542
 netlink_unicast_kernel net/netlink/af_netlink.c:1321 [inline]
 netlink_unicast+0x7f6/0x990 net/netlink/af_netlink.c:1347
 netlink_sendmsg+0x8e4/0xcb0 net/netlink/af_netlink.c:1891

Memory state around the buggy address:
 ffffc9000d1a5800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000d1a5880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc9000d1a5900: f1 f1 f1 f1 00 00 00 00 00 00 00 00 f3 f3 f3 f3
                                  ^
 ffffc9000d1a5980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000d1a5a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
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
