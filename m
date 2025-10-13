Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AF830BB92
	for <ntfs3@lists.linux.dev>; Mon, 13 Oct 2025 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392712; cv=none; b=RcqtegsRh/Dfc6UjGXmqffPm9ztslefFfU4Lh2lDJpKubgRnI+oxmVREG3H6zxw27z2mzhQCzXctDQ0YEOEJXaEFn9vGD9FZPz7RxmkDVwml40OPv+1hYRQqdYrB/ONjSJYUvOFe6KEyrUVvgNpU1Djq2Jq6orur5NNVxYctO1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392712; c=relaxed/simple;
	bh=xYR1cr52kQQufQfo25Bxws0bHZtfajWTALkcUi0xEHY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jMpYR1PjVVss+NVg0FpWrV4uesFeYxfoX5vo6rhJ/xQUqancWg2uMCSFoEA1nhm8vTlL0+MrZKwtQbu+/uKbarq6fvAI5l3Sk8BTT7miW5LEs9jGJ2A55q/e0d+Rcll8svbVPlhITJA7P4bTa6ynJcWO9U3+60KZMbwYD1VmjR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-42486b1d287so288791145ab.0
        for <ntfs3@lists.linux.dev>; Mon, 13 Oct 2025 14:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392710; x=1760997510;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNYnOF2toKvDc+pMjKc346NI04mI9Vp1mPOn0DYXGL0=;
        b=RQc1qgzyJVsH2u2U1QxwypnORm3rqkR0yt1HCM0xxqIac9tJ4w2v9gLO6iMqk0Bx4v
         mLAIz/NpAj7+2HhlX1X8l/d3vOnnjNvRoO8535IUAK7Zs6fx3Gp0NpM768LoFGDOK6cW
         +dyyHahr3HDfefxPO/4GhoXzHGqH39LlZfH60W2BoU9y6qQeb57QWviBy7QIklsIzcqL
         jLpHlOiU/6IU5HFkivqYBSaNhbm2ZKUcjN8/Br6FEPWpFGncrLPykZGq76rl1n3mtHw1
         1pA3YLRhI2BT2OKbWmw5JxD8yheyUmaQyPgMIcf28pojPbumEWmH5cyF0Jh4SQ+46gdK
         DU5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGkhbJp0Rgz6CR9GDIutNIst1J5V3+Hhg5PX2er+ixe9eBIrBP2jiA5p2mwkJlxWZY7Jn6LA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5Emo/zw5sAncCgoPfsZh545RzJTZ7MXIJoU33u7z+HJN3BOYi
	ZX+38DBmmcxIIH/cYZnKVTvb3ZDXqvbqJbPULRcctzLjJLUkpa4GLvZV7geMTvCfyISvF5q8g5p
	GTkyiukmhWi2tej2HD9QAjVM+sDxj7iQ7ahwRXaCvbCQYKEahAJnBdlIWBEg=
X-Google-Smtp-Source: AGHT+IEBbNALp1FlGwEKkJPeo4cr0Eehr10Z3I+7rD1TX53Le6d1qEyweONPbP84/2i3R25Fn5RCV9ZOam0yMZ1JnCBh30XZOMzR
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b24:b0:42f:8b0f:bad2 with SMTP id
 e9e14a558f8ab-42f8b0fbfdemr269298995ab.10.1760392710054; Mon, 13 Oct 2025
 14:58:30 -0700 (PDT)
Date: Mon, 13 Oct 2025 14:58:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ed7606.a70a0220.b3ac9.001f.GAE@google.com>
Subject: [syzbot] [ntfs3?] INFO: trying to register non-static key in ntfs_setattr
From: syzbot <syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, penguin-kernel@I-love.SAKURA.ne.jp, 
	penguin-kernel@i-love.sakura.ne.jp, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    98906f9d850e Merge tag 'rtc-6.18' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=179e3304580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=af9170887d81dea1
dashboard link: https://syzkaller.appspot.com/bug?extid=3e58a7dc1a8c00243999
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f4e542580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e5e9e2580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1c918547df44/disk-98906f9d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/df9f47b0003d/vmlinux-98906f9d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/65c9f6594bf8/bzImage-98906f9d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3d759f242cbe/mount_0.gz

The issue was bisected to:

commit 4e8011ffec79717e5fdac43a7e79faf811a384b7
Author: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date:   Tue Sep 2 10:43:24 2025 +0000

    ntfs3: pretend $Extend records as regular files

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=101de542580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=121de542580000
console output: https://syzkaller.appspot.com/x/log.txt?x=141de542580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3e58a7dc1a8c00243999@syzkaller.appspotmail.com
Fixes: 4e8011ffec79 ("ntfs3: pretend $Extend records as regular files")

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (4096) and media sector size (512).
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 6070 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0x105/0x320 kernel/locking/lockdep.c:1299
 __lock_acquire+0x99/0xd20 kernel/locking/lockdep.c:5112
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 down_write+0x3a/0x50 kernel/locking/rwsem.c:1590
 ntfs_truncate fs/ntfs3/file.c:483 [inline]
 ntfs_setattr+0x70e/0xbe0 fs/ntfs3/file.c:806
 notify_change+0xc18/0xf60 fs/attr.c:546
 do_truncate+0x1a4/0x220 fs/open.c:68
 vfs_truncate+0x493/0x520 fs/open.c:118
 do_sys_truncate+0xdb/0x190 fs/open.c:141
 __do_sys_truncate fs/open.c:153 [inline]
 __se_sys_truncate fs/open.c:151 [inline]
 __x64_sys_truncate+0x5b/0x70 fs/open.c:151
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcea7abeec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd3bd27e48 EFLAGS: 00000246 ORIG_RAX: 000000000000004c
RAX: ffffffffffffffda RBX: 00007fcea7d15fa0 RCX: 00007fcea7abeec9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00002000000013c0
RBP: 00007fcea7b41f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fcea7d15fa0 R14: 00007fcea7d15fa0 R15: 0000000000000002
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
