Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3731422DD
	for <ntfs3@lists.linux.dev>; Fri,  1 Aug 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063319; cv=none; b=kCZLr7e6rAYvxd2NBRb0POglmYBuFTrC5rqFaJun/iB2ufr41hUqAvfjaj28sghJrtKBkfw2ebBxbbWbZgXO/PoMpgkU2jU2kqCie+7/YSwjOOGqe/JJXN3EqXzCqscEa2vjROuFQce2u+WbhY3yhrbagwaBL56gaHBqb2VNH0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063319; c=relaxed/simple;
	bh=uQegwU6gmnobSMuKyKCgIR3tJ5tk37H66VCbg8Tzgog=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rjrh8yA+pJ7RR2IwZCSiELgeVTXnYZHoiTPYeQzchSGm/ZOm1+WdOeh77vq9rxdlchAzNxlk54Xv6EtQ/4kFg3y+s7BwcZGesrG3HVj2eY1h5hJH71n9qpD0OlQbyutp49c8meXKbPUl9XUd1DtABah7sO/RAzcggxbV+vj1wzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3e40058db50so17979695ab.1
        for <ntfs3@lists.linux.dev>; Fri, 01 Aug 2025 08:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754063316; x=1754668116;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2nDTLvG5qxnLCZh8EmAMKLCBF4/f/vIBMI7w1Zwn74=;
        b=S8nMs38s7D3NZKr2kgRwDELJE0JLtSPta9ej6CxL5T3lu7RtWGs1PomPLI+kFaDWPW
         bH8msGK2dH6pZ8/guqd6hf42zK632TU5u7LT6yDIan+zAcXEASxZVMm3bsifZ4+ZXNuw
         RH5vTF26f5OQq3sbuK6CGbys95JRpZWbsHMM1Zfb95y//EsrBjWZmZja3IdunG3t3Wqc
         om5tAuDL/icVeiYsi8fq34AYUb1hQht0sfXG5b1BQUn8EUFg0jIvVw7ewEzPdeb/MMl4
         gs/+PkOaerPe3k50ECDbxSRVQpZCFbeonCQ2djGgIcfQwB0mxGxSUn9gHY/lGa9ggF9g
         nbug==
X-Forwarded-Encrypted: i=1; AJvYcCUpbVJzOitQN48r22uyZEnXpWSyncqlxyjN5LRhtQeatwpUFKlMn0tOpA0JW0WOaV/h3HXhkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6PBhEliHJKt4D+/7iTZ5k022PMJ0fBtW8QKH4WHWiw+q7Q/uu
	fv2VygIu2NcztT1hneR/WSmIiiFks69TuRCMXpwzPi6hjKYWgRHRAECh6FMGW8ZSvlkvq0yAKcf
	Grje6B2cYXka6UAbU5HW6YMN+jWa1Ov+qJNn84LFNIN6w/z+kq/FhDZAhf78=
X-Google-Smtp-Source: AGHT+IF0vZgdyXlk2goJN01mO99yv8YuxLvX2zb3xWR7pWnXBeUCHYOY7NkgwZ32KIxodpUJGcXrOKZdjnJM0JmoP/4fQzadjTzF
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4504:b0:3e3:ca77:9e6e with SMTP id
 e9e14a558f8ab-3e3f628f3e1mr166444545ab.17.1754063315765; Fri, 01 Aug 2025
 08:48:35 -0700 (PDT)
Date: Fri, 01 Aug 2025 08:48:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <688ce1d3.a00a0220.26d0e1.0072.GAE@google.com>
Subject: [syzbot] [ntfs3?] general protection fault in inode_insert5
From: syzbot <syzbot+117f64a14c2a41e45fae@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    260f6f4fda93 Merge tag 'drm-next-2025-07-30' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=141d2f82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb7581d3fb1bb0d7
dashboard link: https://syzkaller.appspot.com/bug?extid=117f64a14c2a41e45fae
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125ad9bc580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1fce1d4d56ce/disk-260f6f4f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/01688cdba884/vmlinux-260f6f4f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/eba9b2f77e6a/bzImage-260f6f4f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/55f62cc62791/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+117f64a14c2a41e45fae@syzkaller.appspotmail.com

loop1: detected capacity change from 0 to 4096
BUG: unable to handle page fault for address: ffffffffffffff81
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD d5ab067 P4D d5ab067 PUD d5ad067 PMD 0 
Oops: Oops: 0002 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 7587 Comm: syz.1.738 Tainted: G        W           6.16.0-syzkaller-08685-g260f6f4fda93 #0 PREEMPT_{RT,(full)} 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
RIP: 0010:spin_lock include/linux/spinlock_rt.h:44 [inline]
RIP: 0010:inode_sb_list_add fs/inode.c:628 [inline]
RIP: 0010:inode_insert5+0x2c6/0x4d0 fs/inode.c:1322
Code: f7 00 00 00 48 8b 44 24 10 80 3c 28 00 74 08 48 89 df e8 2d bd ec ff 4c 8b 23 49 8d bc 24 40 0b 00 00 48 89 3c 24 e8 29 b3 c0 <08> 49 81 c4 c0 0b 00 00 4c 89 e3 48 c1 eb 03 80 3c 2b 00 74 08 4c
RSP: 0018:ffffc900084cf628 EFLAGS: 00010246
RAX: 698bb2b8262d1d00 RBX: ffff88805a41eed8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8b61e260 RDI: 00000000ffffffff
RBP: dffffc0000000000 R08: 0000000000000000 R09: ffffffff8af10c9b
R10: dffffc0000000000 R11: fffffbfff1df4787 R12: ffff88814bc80000
R13: ffff88805a41f060 R14: ffff88805a41f0a0 R15: 1ffff1100b483e14
FS:  00007f159f40e6c0(0000) GS:ffff888126c1e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffff81 CR3: 00000000113c0000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 iget5_locked+0x66/0xa0 fs/inode.c:1358
 ntfs_iget5+0xc1/0x37c0 fs/ntfs3/inode.c:533
 ntfs_fill_super+0x3927/0x40b0 fs/ntfs3/super.c:1519
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1692
 vfs_get_tree+0x8f/0x2b0 fs/super.c:1815
 do_new_mount+0x2a2/0x9e0 fs/namespace.c:3805
 do_mount fs/namespace.c:4133 [inline]
 __do_sys_mount fs/namespace.c:4344 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4321
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f15a01a030a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f159f40de68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f159f40def0 RCX: 00007f15a01a030a
RDX: 0000200000000080 RSI: 000020000001f740 RDI: 00007f159f40deb0
RBP: 0000200000000080 R08: 00007f159f40def0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000020000001f740
R13: 00007f159f40deb0 R14: 000000000001f771 R15: 0000200000000100
 </TASK>
Modules linked in:
CR2: ffffffffffffff81
---[ end trace 0000000000000000 ]---
RIP: 0010:spin_lock include/linux/spinlock_rt.h:44 [inline]
RIP: 0010:inode_sb_list_add fs/inode.c:628 [inline]
RIP: 0010:inode_insert5+0x2c6/0x4d0 fs/inode.c:1322
Code: f7 00 00 00 48 8b 44 24 10 80 3c 28 00 74 08 48 89 df e8 2d bd ec ff 4c 8b 23 49 8d bc 24 40 0b 00 00 48 89 3c 24 e8 29 b3 c0 <08> 49 81 c4 c0 0b 00 00 4c 89 e3 48 c1 eb 03 80 3c 2b 00 74 08 4c
RSP: 0018:ffffc900084cf628 EFLAGS: 00010246
RAX: 698bb2b8262d1d00 RBX: ffff88805a41eed8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8b61e260 RDI: 00000000ffffffff
RBP: dffffc0000000000 R08: 0000000000000000 R09: ffffffff8af10c9b
R10: dffffc0000000000 R11: fffffbfff1df4787 R12: ffff88814bc80000
R13: ffff88805a41f060 R14: ffff88805a41f0a0 R15: 1ffff1100b483e14
FS:  00007f159f40e6c0(0000) GS:ffff888126c1e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffff81 CR3: 00000000113c0000 CR4: 00000000003526f0


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
