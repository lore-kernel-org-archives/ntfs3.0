Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6A4A1D
	for <ntfs3@lists.linux.dev>; Fri, 27 Dec 2024 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735268301; cv=none; b=Hkc6jqr2rH6nz766dKfj7dW2jX4Db1Yc7kf3wMC23+Af0+sSdw35YIgoUzH+m1X4QjoXCgmdG5ab8wxIhh/xNrFrcXqH1A+RnWu86UmE1cEB+FTzYSX1DhsdBoBVl2l9L1tVxIkZlKaHBB9GkxQZ8K3eBMl6udhqTfpfz/x9Kpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735268301; c=relaxed/simple;
	bh=DBnyIXkDAicpt45rZpw1rfGI2jVA/KF9GbCkQQC7SeI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Qw9e3fc+4jNLcGGcJcwyA8QmRIvdVaYmqQnr7mDTgfwCQFw9KIzyhLoEZDa1FLVOp+knzaMxCen9KQycSUEOhl5F6ge25mpj8aBmv1f9so8NfN3UgmmGXddKvZi+qqr3OP81i6dS2MnBMDcFGdps1M8iCFUbb5mrI4kzmEkQ/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3a7de3ab182so134455555ab.1
        for <ntfs3@lists.linux.dev>; Thu, 26 Dec 2024 18:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735268299; x=1735873099;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/n2MyuxYc3/ELwEiaJyNcc11EPJRbhMvXT6DKJTKY4=;
        b=B+jZrbwEoLJpxf7M3p6bSFhjs9RBuwt9hp3FTnOU6Nagk0unfbNnkJR0Rz2l3eQEEz
         0FjzDehvgMQj0DL1EFqen7Wz0IJBXG1eTb9n0FitAJpIKRmOblYJnTm2hBh1NhKHp8IW
         daW2hKTAKL9PyUq6XqCwypqiskFrK7pmA4i+SjQbS4r5V4b21EtRNyd8/3AU24yWU8Jo
         3aMlzMHtn3zcZfn0bJeWlH4sHBMBWm/WeVjtT6wApSzl+zWU3+B/Uap+ZCWcvP0YbeTD
         jfg8vfB7TLHzCaxoccHSibiGgHhKhW4i+7XcxrDOh0ntcRTtjmgZVZAdTPyqX8EjDzOw
         keVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO8dBovuZxQlSILR3gK9NEDcADJVceb08iJHGMofDKQ8tz5cdAeaB/WdpJtvMWcrcgeFVPLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwl8DNlhMTVc49yPf04qjykuh0U2jGVbfhGzBDP24aBSe+w9sx
	aqahRkgE3Sp5rt6/szMgOE3HgviaL5OAP26G3eUybMHSlIfrmFqfNjl51LeAtNkVeC6clWALa5o
	F0Z5SC85QDPcCJFKgo9u1J6QDsjWd+zew8i0m3adfl7lsvoTsxO4nF14=
X-Google-Smtp-Source: AGHT+IG0kb/+up1ojZeuFo9vYYBKbHKn/s3ficcMhwG4tsJrJmbTQdAwYNoktgWQmRJItbWLsmY3zjfXYzSAo7LFXRKJNJSfXN0K
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e5:b0:3a7:a3a4:2cb3 with SMTP id
 e9e14a558f8ab-3c2d533f4a2mr190963885ab.15.1735268298956; Thu, 26 Dec 2024
 18:58:18 -0800 (PST)
Date: Thu, 26 Dec 2024 18:58:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676e17ca.050a0220.2f3838.0479.GAE@google.com>
Subject: [syzbot] [ntfs3?] kernel panic: stack is corrupted in debug_object_activate
From: syzbot <syzbot+352ebcaffdbde4edf230@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d6ef8b40d075 Merge tag 'sound-6.13-rc5' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1617dadf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d269ef41b9262400
dashboard link: https://syzkaller.appspot.com/bug?extid=352ebcaffdbde4edf230
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-d6ef8b40.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/38a9784dd46d/vmlinux-d6ef8b40.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8d1728b3051d/bzImage-d6ef8b40.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+352ebcaffdbde4edf230@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (2048) and media sector size (512).
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: debug_object_activate+0x57e/0x580
CPU: 0 UID: 0 PID: 5315 Comm: syz.0.0 Not tainted 6.13.0-rc4-syzkaller-00054-gd6ef8b40d075 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 panic+0x349/0x880 kernel/panic.c:354
 __stack_chk_fail+0x15/0x20 kernel/panic.c:836
 debug_object_activate+0x57e/0x580
 debug_rcu_head_queue kernel/rcu/rcu.h:224 [inline]
 __call_rcu_common kernel/rcu/tree.c:3071 [inline]
 call_rcu+0x97/0xa70 kernel/rcu/tree.c:3190
 destroy_inode fs/inode.c:391 [inline]
 evict+0x836/0x9a0 fs/inode.c:827
 ntfs_fill_super+0x3e27/0x4730 fs/ntfs3/super.c:1472
 get_tree_bdev_flags+0x48c/0x5c0 fs/super.c:1636
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3507
 do_mount fs/namespace.c:3847 [inline]
 __do_sys_mount fs/namespace.c:4057 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4034
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffa6f9874ca
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffa70727e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffa70727ef0 RCX: 00007ffa6f9874ca
RDX: 0000000020000000 RSI: 00000000200000c0 RDI: 00007ffa70727eb0
RBP: 0000000020000000 R08: 00007ffa70727ef0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000200000c0
R13: 00007ffa70727eb0 R14: 000000000001f336 R15: 0000000020000100
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


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
