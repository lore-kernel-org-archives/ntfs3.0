Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CCE5F542
	for <ntfs3@lists.linux.dev>; Wed,  6 Mar 2024 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718799; cv=none; b=hIdu8DoRIRVnISswCdvT9gKEMoxZ4e80yCOoxOTIGTvZ8IEw05EJlkwBuznso+bZb1uy/ZTQEARQM3lIlvPhzRFHRDB5SlvBTFKb5V4NoTAuODXPhsdr8hZJhwijSuDuma9RnzdbHCGY0w8Kldx9IgisVZOAF+xcMmPhQGcSv2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718799; c=relaxed/simple;
	bh=O4Ya01w3ccBDNQ+/0xW96wymqqnd1wQlCnhYRSg4u9o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CrNoaiqan1Ly2xWmvu0RVP7cl850xyl2Rc0MO0im/7tJCP8her9ahlIc630rDmuqE8LKJ6RxoH6bAVf7zvCV5BGklMEurz6y7hhFAJxCLQM5lHemdUO8KCihUDG10JGWL2hbtLPv4Fez10gNTSnzoZZNxz5bPDt1ILFDS5X8rqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c874fb2baaso84712239f.3
        for <ntfs3@lists.linux.dev>; Wed, 06 Mar 2024 01:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709718797; x=1710323597;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhfLzp65eQq35wLPALh58Ca9vODLvgy/RWN1o/HMmBg=;
        b=qPZGMksnyhXcEB+bTnhMDWa49m3d8Ry0c8+mt0la24ev8MwrjIjEOBdKrIc4oFGvc1
         /p3GLXku/FCTpggmyucMkR02GFBLCeV2JbTfjQAudgIjqPYjNVNGKrvSA568R4gYR7Lp
         mDM/gq61KAsKaG+oUXz2JEXvN2J/y7T4GGc3tZAlrJWf3EZODJ8zN8OfBJLTaQwpsL3n
         s2Oa9vOPgXGsZUsIqPDy56amggSI0lkYF/phHoc/2C8vlyk2hmsbJHTnSesFTdeTh3hA
         zrJUvbDaTuwQpmkLkArpRYpjs5M+wAxWEhFckKe0kSS3LMFZdic7QCyHrZOd0niZLiZY
         1sGg==
X-Forwarded-Encrypted: i=1; AJvYcCWxAL6OhGaOzOpeD9O51YsuJd5aPEcplZgw92xv6oUSWOETczdvueQUUR0ZVigrWaxW4uMU9p9dTBWff4KNugeLxv0rAco=
X-Gm-Message-State: AOJu0Yxu+Goirv9RnsOW6nXJVXZNGpR3Mtrvr5M1PF0TxEUzoCoGN91i
	QUxseiZL4kDWLATbKFA38YUC14Br9HlcpIz17h1tMINeVwkS3hupkAroEwtkgfXA87kldtd6XJS
	GCk11m0I7zob3/hrX/uOTHbAISjjn2K1RAIsdYJPMajN/k/UbBwm/Cuk=
X-Google-Smtp-Source: AGHT+IFXFVcXYnJAFFQu5rQVGzj9w4t0L5htpTeK+tL9/cE8nDd8KNsBkpTpZrboErOLuMKShOgK1K3J2BbmQCOK3O3K9x0rw9HV
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:13c4:b0:7c8:592a:e1ad with SMTP id
 o4-20020a05660213c400b007c8592ae1admr217825iov.2.1709718797175; Wed, 06 Mar
 2024 01:53:17 -0800 (PST)
Date: Wed, 06 Mar 2024 01:53:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009262af0612faed28@google.com>
Subject: [syzbot] [ntfs3?] WARNING: kmalloc bug in wnd_init
From: syzbot <syzbot+c6d94bedd910a8216d25@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    90d35da658da Linux 6.8-rc7
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1286d2b2180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=119d08814b43915b
dashboard link: https://syzkaller.appspot.com/bug?extid=c6d94bedd910a8216d25
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101d9fce180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15cdacfe180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/821deeb51f0a/disk-90d35da6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9a7d492f89d7/vmlinux-90d35da6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/78bfac3e2f5d/bzImage-90d35da6.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3f48906195d3/mount_0.gz

The issue was bisected to:

commit fc471e39e38fea6677017cbdd6d928088a59fc67
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Fri Jun 30 12:12:58 2023 +0000

    fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12bd9fce180000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11bd9fce180000
console output: https://syzkaller.appspot.com/x/log.txt?x=16bd9fce180000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c6d94bedd910a8216d25@syzkaller.appspotmail.com
Fixes: fc471e39e38f ("fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)")

loop0: detected capacity change from 0 to 4096
ntfs3: loop0: Different NTFS sector size (1024) and media sector size (512).
------------[ cut here ]------------
WARNING: CPU: 1 PID: 5055 at mm/util.c:632 kvmalloc_node+0x17a/0x190 mm/util.c:632
Modules linked in:
CPU: 1 PID: 5055 Comm: syz-executor362 Not tainted 6.8.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
RIP: 0010:kvmalloc_node+0x17a/0x190 mm/util.c:632
Code: cc 44 89 fe 81 e6 00 20 00 00 31 ff e8 bf 35 c0 ff 41 81 e7 00 20 00 00 74 0a e8 71 31 c0 ff e9 3b ff ff ff e8 67 31 c0 ff 90 <0f> 0b 90 e9 2d ff ff ff 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00
RSP: 0018:ffffc90003b1f8b8 EFLAGS: 00010293
RAX: ffffffff81d33ae9 RBX: 0003ffffffffff02 RCX: ffff888023469dc0
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff81d33ad1 R09: 00000000ffffffff
R10: ffffc90003b1f720 R11: fffff52000763ee9 R12: ffff88802394c0b0
R13: 0003ffffffffff02 R14: 00000000ffffffff R15: 0000000000000000
FS:  0000555556a6f380(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f980f795ed8 CR3: 000000001f008000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kvmalloc include/linux/slab.h:728 [inline]
 kvmalloc_array include/linux/slab.h:746 [inline]
 wnd_init+0x1f1/0x320 fs/ntfs3/bitmap.c:663
 ntfs_fill_super+0x3076/0x49c0 fs/ntfs3/super.c:1313
 get_tree_bdev+0x3f7/0x570 fs/super.c:1614
 vfs_get_tree+0x90/0x2a0 fs/super.c:1779
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_64+0xf9/0x240
 entry_SYSCALL_64_after_hwframe+0x6f/0x77
RIP: 0033:0x7f0e7ba728ba
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe03c98d68 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffe03c98d80 RCX: 00007f0e7ba728ba
RDX: 000000002001f800 RSI: 000000002001f840 RDI: 00007ffe03c98d80
RBP: 0000000000000004 R08: 00007ffe03c98dc0 R09: 000000000001f7ef
R10: 0000000000000000 R11: 0000000000000286 R12: 0000000000000000
R13: 00007ffe03c98dc0 R14: 0000000000000003 R15: 0000000000200000
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
