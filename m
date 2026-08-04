Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309C33E7159
	for <ntfs3@lists.linux.dev>; Tue,  4 Aug 2026 01:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785805660; cv=none; b=bvw0eZE+lD865Ic5XHoSZ5rTfdTIpaG/SwXv7aPhaIMVGbqVSV8VzC1ai6Zgw4Cc6nGjLoH3m4gNvXmZAzD8GHHoLjovuKdabDbPIEgGjSRaBIVUYaiAoYc/t5Sqc93h9y7Ua5IE6raVeL1VyYc9DC4jokFvRPCsF2psQ7pTIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785805660; c=relaxed/simple;
	bh=3Say5Cc/hfN4Fdsr2289buZEPIs2NEkr5jVQiL4nNSc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=irq3pIiW9DX90vy8ndHKMdKqBriSCl+8fJ8YP09x6ZvfdO4GZRLVH6CCMUJCfB+/YPeidjFPrhD7NEyN31n0PLO8AIi78ntZKO+/AbsqRJUPxP/nl5k3cz77Z3ky9fcVycjf6zIy2r72RiD3Aok5/5kqOJv6zUqL8YwmLoN4TVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-495b8120909so5604579b6e.1
        for <ntfs3@lists.linux.dev>; Mon, 03 Aug 2026 18:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785805657; x=1786410457;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysSgN4GaUmAmn/XdQHVvsBAdf5yWvdmUH3QlkSn5RhE=;
        b=S+kI2t5myF5bnGDBcWkiHEYshYoa0w0+EWrmJM9bu/SWJI5rsL7fVLaC3DMrD0eyvR
         fSu+xu3qCq5xfzYeE/olNMVlWfYsQkgFU3sq7DHdZjbic/H6XZhe9n7MFSN9kAlm7/TB
         pJ4qizHO6JxNg7tXGAClTZGcj6n4ks9aO8hseB8MczfVoL8xmMjSOFN6L8qrwNn6pD9X
         3BPGvvAGSUZC+KkinjQXafgEADs1OROxxeauD3X81EJ4NjSI7UX9osMpan3KmPs0PHCE
         eYLD+GRqprxJIXDXTBKFwLFDd6hIaHij7ArHG2DgTEZo432FFeWdO2L9uhKRGpeOJtjm
         iJQw==
X-Forwarded-Encrypted: i=1; AHgh+RpJJqXuzSWZopPwrzPDh06CNiLohiZoYBeluwRwIrXFphQXzkncnZMpZPgpOdHssq2MC/al4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRHjRMn2mtVtLfO5mMw/ZheSMq0/sZLk5D3h48Jnb8AFSV6cuo
	0IE5uvnQktQGZePd+qzdqX3Hp9YA7oR/RbT7ELfzNCCoKBoiZsrki4zpu7vXKDR38kMx/gmlPi7
	bDaTHcQfjr03ZjJFDFkWdPlrMjgEgJ92e/ZUR76qqurCKht/2Cc1133eQalA=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250a:b0:495:feaa:9e39 with SMTP id
 5614622812f47-4af5e03c5fdmr18627750b6e.6.1785805657086; Mon, 03 Aug 2026
 18:07:37 -0700 (PDT)
Date: Mon, 03 Aug 2026 18:07:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a713b59.9511d2ce.1fc5b9.032f.GAE@google.com>
Subject: [syzbot] [ntfs3?] KASAN: slab-use-after-free Read in attr_set_size_ex
From: syzbot <syzbot+2e386579af3ad9319a5b@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0131b508c0e2 Merge tag 'ntfs-for-7.2-rc6' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=141394c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=2e386579af3ad9319a5b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0c726c97610c/disk-0131b508.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/054495aca287/vmlinux-0131b508.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a11b49533ef4/bzImage-0131b508.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2e386579af3ad9319a5b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in attr_set_size_ex+0x2e14/0x2e70 fs/ntfs3/attrib.c:451
Read of size 2 at addr ffff88802a872bdc by task syz.1.298/8028

CPU: 1 UID: 0 PID: 8028 Comm: syz.1.298 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 attr_set_size_ex+0x2e14/0x2e70 fs/ntfs3/attrib.c:451
 attr_set_size fs/ntfs3/ntfs_fs.h:466 [inline]
 ntfs_set_size+0x1e1/0x270 fs/ntfs3/inode.c:701
 ntfs_file_write_iter+0x4e3/0xab0 fs/ntfs3/file.c:1268
 iter_file_splice_write+0xa36/0x1240 fs/splice.c:736
 do_splice_from fs/splice.c:936 [inline]
 direct_splice_actor+0x104/0x160 fs/splice.c:1159
 splice_direct_to_actor+0x586/0xcc0 fs/splice.c:1103
 do_splice_direct_actor fs/splice.c:1202 [inline]
 do_splice_direct+0x19b/0x2a0 fs/splice.c:1228
 do_sendfile+0x540/0x7e0 fs/read_write.c:1371
 __do_sys_sendfile64 fs/read_write.c:1432 [inline]
 __se_sys_sendfile64+0x144/0x1a0 fs/read_write.c:1418
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd797f5e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd7961b6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fd7981e5fa0 RCX: 00007fd797f5e019
RDX: 0000000000000000 RSI: 0000000000000007 RDI: 0000000000000006
RBP: 00007fd797ff500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000020fffe82 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fd7981e6038 R14: 00007fd7981e5fa0 R15: 00007ffeb63a81a8
 </TASK>

Allocated by task 8028:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x57f/0x7c0 mm/slub.c:5471
 kmemdup_noprof+0x2b/0x70 mm/util.c:138
 kmemdup_noprof include/linux/fortify-string.h:715 [inline]
 ntfs_fill_super+0x1e2/0x45d0 fs/ntfs3/super.c:1273
 get_tree_bdev_flags+0x430/0x4f0 fs/super.c:1640
 vfs_get_tree+0x92/0x2a0 fs/super.c:1700
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3765 [inline]
 do_new_mount+0x319/0xdc0 fs/namespace.c:3841
 do_mount fs/namespace.c:4174 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 8040:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x6c0 mm/slub.c:6692
 put_fs_context+0x123/0xb00 fs/fs_context.c:498
 do_remount fs/namespace.c:3419 [inline]
 path_mount+0xef9/0x1040 fs/namespace.c:4153
 do_mount fs/namespace.c:4174 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount+0x31d/0x420 fs/namespace.c:4367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802a872bc0
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 28 bytes inside of
 freed 32-byte region [ffff88802a872bc0, ffff88802a872be0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2a872
flags: 0x80000000000000(node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000000 ffff88813ffb2780 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4949, tgid 4949 (S01syslogd), ts 31763015621, free_ts 31761933864
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x262a/0x26a0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __kmalloc_cache_noprof+0x468/0x6b0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 slab_free_hook mm/slub.c:2629 [inline]
 slab_free mm/slub.c:6377 [inline]
 kmem_cache_free+0x156/0x6c0 mm/slub.c:6504
 tear_down_vmas+0x312/0x520 mm/mmap.c:1262
 exit_mmap+0x4ca/0x9f0 mm/mmap.c:1320
 __mmput+0xcb/0x3d0 kernel/fork.c:1187
 exec_mm_put_old fs/exec.c:916 [inline]
 setup_new_exec+0x30d/0x360 fs/exec.c:1353
 load_elf_binary+0xbd6/0x2970 fs/binfmt_elf.c:1024
 search_binary_handler fs/exec.c:1694 [inline]
 exec_binprm fs/exec.c:1726 [inline]
 bprm_execve+0x926/0x14b0 fs/exec.c:1778
 do_execveat_common+0x4f4/0x670 fs/exec.c:1876
 __do_sys_execve fs/exec.c:1949 [inline]
 __se_sys_execve fs/exec.c:1943 [inline]
 __x64_sys_execve+0x97/0xc0 fs/exec.c:1943
page last free pid 4949 tgid 4949 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
 tlb_batch_list_free mm/mmu_gather.c:161 [inline]
 tlb_finish_mmu+0x13e/0x220 mm/mmu_gather.c:552
 exit_mmap+0x4b2/0x9f0 mm/mmap.c:1313
 __mmput+0xcb/0x3d0 kernel/fork.c:1187
 exec_mm_put_old fs/exec.c:916 [inline]
 setup_new_exec+0x30d/0x360 fs/exec.c:1353
 load_elf_binary+0xbd6/0x2970 fs/binfmt_elf.c:1024
 search_binary_handler fs/exec.c:1694 [inline]
 exec_binprm fs/exec.c:1726 [inline]
 bprm_execve+0x926/0x14b0 fs/exec.c:1778
 do_execveat_common+0x4f4/0x670 fs/exec.c:1876
 __do_sys_execve fs/exec.c:1949 [inline]
 __se_sys_execve fs/exec.c:1943 [inline]
 __x64_sys_execve+0x97/0xc0 fs/exec.c:1943
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802a872a80: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88802a872b00: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
>ffff88802a872b80: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
                                                    ^
 ffff88802a872c00: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
 ffff88802a872c80: fa fb fb fb fc fc fc fc 00 00 00 00 fc fc fc fc
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
