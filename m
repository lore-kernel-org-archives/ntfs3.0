Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC473A7840
	for <ntfs3@lists.linux.dev>; Tue, 31 Mar 2026 11:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958126; cv=none; b=BW7o/YRnSNI/UYWM1gTDcnHlBTTbivY+zIOvINTiKsjVTLErJc0TshjirCCh3GMUHualllSePbR7Sa9m8K+wwSqQG3gQQZGFpk5emTPOCpJoS33Yi7E3I+G4lhzl0sykWLBNoUxSjN14ATgpWiIb1uGkf7ZMu9VTY3A6NYVOwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958126; c=relaxed/simple;
	bh=uA2PFbH5CHTAq5lKmdcyb0HHzLXLHqgL6Lw5ww+Ad98=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bF1RbeFtqW3oYPXrRcHBUbqLM/XogrbJ8I5rRH6nx+kSE7i82eLmpjZjJqX4OGy5CRFxSgwpbZ+05D1drg6lUSSHlIvQbCxnEx4Tbzprl6IOuHr+a/4RiUg71dnC0tHi/xQEZ2TwvK2/iT8EByRdKCkzKzNYw4i9ddNqp10a7Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-67e44358ce0so122763eaf.0
        for <ntfs3@lists.linux.dev>; Tue, 31 Mar 2026 04:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774958124; x=1775562924;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTxZlkTEdpK5cUfr8g7m/mQNsKESWoyqc4DADEwULKc=;
        b=kg2TwK2cjpQrju9Qwe2Awaa41wXzKQKNbfUtCvSww4mHHeANTnGWuMijWD8mVbjOqP
         oSV5ULjtRS9T/yI0xxEFAMva/XPzFI7CJI15b+8FPpAFo7YJZ3FuB5VpvGz1vNpbAFBt
         9dOI/wCqfW58ys/Xuv1wvlYD/vLJCLAiAbmfk8i/DjIYmqs2vW/2t2NSf7OJJkz2JMTN
         tvwPVB0aolkzvX2nsDRlr6dmMRZxfOxfKe66ACEacw1D4cxfMwkxmdTYK+S6adPYA4/Z
         RkJqSRpitaL1lajoev7ZHvN2nO0QwelKckdFLEKUIcEhlt37vEvZRl53v0sU4xdkOYgu
         P/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV34aIb5lJj7HuQtlMp+FHiylNa7OZ3tf1w9qnBfHDNxlVbJyewSLTmBMVSRLORi2FCKf805g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqjQenolZQ6qPQ4ShkBZkYHvwPcNfF2bluM06SLSD82AAXxEm8
	UI7Q7wDXZdSuWvzrHHnurM98ho6OHi0QHyUY+quekHRDLKrx7hUOu9KDvaxtVJfl2OQpkKjYMtU
	SvWiAwR+C5kz4cH+SnrMQ5Ji6XoAkv4UvPQBZzpH513NY7lH0msmEBg6CL/c=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c94:b0:67b:f775:e5fe with SMTP id
 006d021491bc7-67e187763eemr9178427eaf.65.1774958123927; Tue, 31 Mar 2026
 04:55:23 -0700 (PDT)
Date: Tue, 31 Mar 2026 04:55:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69cbb62b.050a0220.183828.0029.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in ntfs_iget5
From: syzbot <syzbot+4d48dcd9e88d37df77b3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c369299895a5 Linux 7.0-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e3acba580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45cb3c58fd963c27
dashboard link: https://syzkaller.appspot.com/bug?extid=4d48dcd9e88d37df77b3
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7f5079847db7/disk-c3692998.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1d7c2146cfd0/vmlinux-c3692998.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9f76a3d4f0fc/bzImage-c3692998.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4d48dcd9e88d37df77b3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in ntfs_iget5+0x33a3/0x38f0 fs/ntfs3/inode.c:542
Read of size 2 at addr ffff8880387ca84e by task syz.1.531/9287

CPU: 0 UID: 0 PID: 9287 Comm: syz.1.531 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ntfs_iget5+0x33a3/0x38f0 fs/ntfs3/inode.c:542
 ni_write_parents+0x240/0x440 fs/ntfs3/frecord.c:2945
 ntfs_file_fsync+0x161/0x260 fs/ntfs3/file.c:1504
 generic_write_sync+0x1b5/0x2a0 include/linux/fs.h:2640
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x629/0xba0 fs/read_write.c:688
 ksys_write+0x156/0x270 fs/read_write.c:740
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f931647c799
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f93146d6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f93166f5fa0 RCX: 00007f931647c799
RDX: 0000000000000030 RSI: 0000200000000100 RDI: 0000000000000004
RBP: 00007f9316512c99 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f93166f6038 R14: 00007f93166f5fa0 R15: 00007ffe30265088
 </TASK>

Allocated by task 9321:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5260 [inline]
 __kmalloc_noprof+0x3e7/0x7b0 mm/slub.c:5272
 kmalloc_noprof include/linux/slab.h:954 [inline]
 mi_init fs/ntfs3/record.c:105 [inline]
 mi_format_new+0xeb/0x610 fs/ntfs3/record.c:422
 ni_add_subrecord+0xd1/0x460 fs/ntfs3/frecord.c:323
 ntfs_look_free_mft+0x4e1/0xd70 fs/ntfs3/fsntfs.c:738
 ni_create_attr_list+0x94b/0x1450 fs/ntfs3/frecord.c:830
 ni_ins_attr_ext+0x461/0xba0 fs/ntfs3/frecord.c:928
 ni_insert_attr fs/ntfs3/frecord.c:1095 [inline]
 ni_insert_resident fs/ntfs3/frecord.c:1479 [inline]
 ni_add_name+0x6df/0xc90 fs/ntfs3/frecord.c:2756
 ni_rename+0x4a/0x100 fs/ntfs3/frecord.c:2795
 ntfs_rename+0x6ea/0xb40 fs/ntfs3/namei.c:331
 vfs_rename+0xa96/0xeb0 fs/namei.c:6026
 filename_renameat2+0x539/0x9c0 fs/namei.c:6144
 __do_sys_rename fs/namei.c:6188 [inline]
 __se_sys_rename+0x55/0x2c0 fs/namei.c:6184
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 9322:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2685 [inline]
 slab_free mm/slub.c:6165 [inline]
 kfree+0x1c1/0x6c0 mm/slub.c:6483
 mi_clear fs/ntfs3/ntfs_fs.h:1211 [inline]
 mi_put+0x118/0x190 fs/ntfs3/record.c:97
 ni_write_inode+0xc29/0xff0 fs/ntfs3/frecord.c:3218
 write_inode fs/fs-writeback.c:1582 [inline]
 __writeback_single_inode+0x75d/0x11a0 fs/fs-writeback.c:1813
 writeback_single_inode+0x488/0xd60 fs/fs-writeback.c:1869
 write_inode_now+0x1c2/0x290 fs/fs-writeback.c:2954
 ntfs_extend+0x34f/0x550 fs/ntfs3/file.c:393
 ntfs_file_write_iter+0x474/0x990 fs/ntfs3/file.c:1270
 iter_file_splice_write+0x9a6/0x10f0 fs/splice.c:736
 do_splice_from fs/splice.c:936 [inline]
 direct_splice_actor+0x104/0x160 fs/splice.c:1159
 splice_direct_to_actor+0x545/0xc80 fs/splice.c:1103
 do_splice_direct_actor fs/splice.c:1202 [inline]
 do_splice_direct+0x19b/0x2a0 fs/splice.c:1228
 do_sendfile+0x547/0x7e0 fs/read_write.c:1372
 __do_sys_sendfile64 fs/read_write.c:1433 [inline]
 __se_sys_sendfile64+0x144/0x1a0 fs/read_write.c:1419
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880387ca800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 78 bytes inside of
 freed 1024-byte region [ffff8880387ca800, ffff8880387cac00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x387c8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813fe19dc0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813fe19dc0 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000003 ffffea0000e1f201 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5803, tgid 5803 (syz-executor), ts 96795489094, free_ts 78150997867
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1889
 prep_new_page mm/page_alloc.c:1897 [inline]
 get_page_from_freelist+0x28bb/0x2950 mm/page_alloc.c:3962
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5250
 alloc_slab_page mm/slub.c:3292 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3481
 new_slab mm/slub.c:3539 [inline]
 refill_objects+0x334/0x3c0 mm/slub.c:7175
 refill_sheaf mm/slub.c:2812 [inline]
 __pcs_replace_empty_main+0x35c/0x710 mm/slub.c:4615
 alloc_from_pcs mm/slub.c:4717 [inline]
 slab_alloc_node mm/slub.c:4851 [inline]
 __kmalloc_cache_noprof+0x44e/0x690 mm/slub.c:5375
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 rxrpc_service_prealloc+0x9f/0x130 net/rxrpc/call_accept.c:167
 rxrpc_listen+0x1c8/0x370 net/rxrpc/af_rxrpc.c:236
 afs_open_socket+0x2fa/0x3f0 fs/afs/rxrpc.c:107
 afs_net_init+0x6ce/0x8f0 fs/afs/main.c:116
 ops_init+0x35c/0x5c0 net/core/net_namespace.c:137
 setup_net+0x118/0x340 net/core/net_namespace.c:446
 copy_net_ns+0x50e/0x730 net/core/net_namespace.c:581
 create_new_namespaces+0x3e7/0x6a0 kernel/nsproxy.c:130
 unshare_nsproxy_namespaces+0x11a/0x160 kernel/nsproxy.c:226
page last free pid 5742 tgid 5742 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0xfe3/0x1170 mm/page_alloc.c:2978
 __slab_free+0x24f/0x2a0 mm/slub.c:5573
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4538 [inline]
 slab_alloc_node mm/slub.c:4866 [inline]
 kmem_cache_alloc_noprof+0x33b/0x680 mm/slub.c:4873
 vm_area_dup+0x2b/0x670 mm/vma_init.c:123
 __split_vma+0x1e4/0xa30 mm/vma.c:513
 split_vma mm/vma.c:596 [inline]
 vma_modify+0xa49/0x1f00 mm/vma.c:1680
 vma_modify_flags+0x24b/0x330 mm/vma.c:1700
 mprotect_fixup+0x47a/0xa80 mm/mprotect.c:756
 do_mprotect_pkey+0x8ab/0xcd0 mm/mprotect.c:930
 __do_sys_mprotect mm/mprotect.c:951 [inline]
 __se_sys_mprotect mm/mprotect.c:948 [inline]
 __x64_sys_mprotect+0x80/0x90 mm/mprotect.c:948
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880387ca700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880387ca780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880387ca800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff8880387ca880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880387ca900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
