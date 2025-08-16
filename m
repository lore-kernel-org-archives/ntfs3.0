Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C741A704B
	for <ntfs3@lists.linux.dev>; Sat, 16 Aug 2025 03:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755313775; cv=none; b=S6Wn/NY2XLLWABzolxbvibQMgJRyJ34nXTD62A+A4rnV8iqWFgZcRfJC085gNWgp2tEZNNDfCjwZaXsCa6pu98HE0qs2FgwZt1kdqysos4M5ZgUAKa6T3Q5YSZsEh7HKthe8CS4+Z7KU2eZIFS5kEBLWqBtwKhFBxh8debQ5r6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755313775; c=relaxed/simple;
	bh=6rpvt4bu7koVNHJAw0YNVn3GgDvYic0XfD/q4xFRCuU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uYtLbpmrNqQI3cfQzcoe3ls3L3JM55PJLfsbj9JZJ5TMgHkTcwmwWvaDiG/9BMsFaZPSdmtDba664OoIPjy9E4NihJOSXhsxcmPAM6e5RiMadScFAFgqlX4poo8GZScVyatz8Bbqm5+fpsSJXnp8b3CH/r4Tc9it0kz/6i80lbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3e5700b4c7cso29938165ab.3
        for <ntfs3@lists.linux.dev>; Fri, 15 Aug 2025 20:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755313773; x=1755918573;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lvwxMDxmPvJqu07t+jWtNAWLFvXutLPx1UGrWnx1WU=;
        b=l55vRw0cLbhZaFvxGvWAK5VNsGY8qKbojuPgvhwx51wv+AoMcxn62YHR485tf7coAM
         8QVn3pL/tWBcAUEw2WOxrJSDfXcAtlq1zA8VF4OYNcWTFjg9gadhFGc5ewXm6EH/RU/I
         gs+lJo44pBQJ+CNa60xOjuT2j/Bp1DCIXQB5Ws+JKWfg7DOR2iLeVjLpG42Fr8c18hP8
         Bq29PB0NFH7Zzt+FuAmSG37TB9tV9WSY5AlMyQIc2mG0mzBuvR1O7XnpK8xjTpRSk8+7
         kWuIsqLNJWyyJRTO+ePW06YKiwLFSZgkT/wuGYtkhUsyqZnNszRZUJxPYl63mRAY3TG/
         P21Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFs+mdC5oDfeLJr3bUAxAWEQAUUJDEk4UKUJ7QIdCMysnW+d8Bk+GiLoZCj48i9H/O/4A2Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiJf5L72giElr18TjUvencl06m59xauB9nq5bqjt8f60iHtqZp
	b+c/iCC6zqqMqJqP3gjeuu5BM5orK56VqTcAcLfJ3XabdLEulOQUQwHCHwVzTGE4Ry3z77B2Cof
	mg3ExKm9Nt/3ewCf72yGLJE+Mg/72kUTlmC9cdqWHEdbAU+QCnlD/9AW667Y=
X-Google-Smtp-Source: AGHT+IEBP3Nl/weGxoqY4beA1FVfIV6qmF0N1Hphxg7bfoIEr7I4y2Qvk0D3XZwFwbO8XjqL2fhcKoI9qv5Ag6RKTGq3eVhoOa6W
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154c:b0:3e5:4002:e820 with SMTP id
 e9e14a558f8ab-3e5837fadc0mr31965635ab.6.1755313773252; Fri, 15 Aug 2025
 20:09:33 -0700 (PDT)
Date: Fri, 15 Aug 2025 20:09:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <689ff66d.050a0220.e29e5.0036.GAE@google.com>
Subject: [syzbot] [ntfs3?] kernel panic: stack is corrupted in debug_object_active_state
From: syzbot <syzbot+56728135217003dc6f7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ee94b00c1a64 Merge tag 'block-6.17-20250815' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=178a0442580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=98e114f4eb77e551
dashboard link: https://syzkaller.appspot.com/bug?extid=56728135217003dc6f7d
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=118d2234580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d3a276780499/disk-ee94b00c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9d0179cf0059/vmlinux-ee94b00c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/93f6f92d9369/bzImage-ee94b00c.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/a81e1292f715/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+56728135217003dc6f7d@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (2048) and media sector size (512).
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: debug_object_active_state+0x204/0x260 lib/debugobjects.c:-1
CPU: 0 UID: 0 PID: 10513 Comm: syz.0.2210 Tainted: G        W           6.17.0-rc1-syzkaller-00165-gee94b00c1a64 #0 PREEMPT_{RT,(full)} 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x99/0x250 lib/dump_stack.c:120
 vpanic+0x281/0x750 kernel/panic.c:430
 panic+0xb9/0xc0 kernel/panic.c:566
 __stack_chk_fail+0x26/0x30 kernel/panic.c:929
 debug_object_active_state+0x204/0x260 lib/debugobjects.c:-1
 debug_rcu_head_queue kernel/rcu/rcu.h:237 [inline]
 __call_rcu_common kernel/rcu/tree.c:3108 [inline]
 call_rcu+0xc3/0x9c0 kernel/rcu/tree.c:3243
 __destroy_inode+0x2da/0x670 fs/inode.c:371
 destroy_inode fs/inode.c:394 [inline]
 evict+0x797/0x9c0 fs/inode.c:834
 ntfs_fill_super+0x38fa/0x40b0 fs/ntfs3/super.c:1514
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1692
 vfs_get_tree+0x8f/0x2b0 fs/super.c:1815
 do_new_mount+0x2a2/0x9e0 fs/namespace.c:3805
 do_mount fs/namespace.c:4133 [inline]
 __do_sys_mount fs/namespace.c:4344 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4321
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f622eac038a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f622e12de68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f622e12def0 RCX: 00007f622eac038a
RDX: 000020000001f380 RSI: 000020000001f3c0 RDI: 00007f622e12deb0
RBP: 000020000001f380 R08: 00007f622e12def0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000020000001f3c0
R13: 00007f622e12deb0 R14: 000000000001f34c R15: 000020000001f400
 </TASK>
Kernel Offset: disabled


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
