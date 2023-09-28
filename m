Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A78BFF
	for <ntfs3@lists.linux.dev>; Thu, 28 Sep 2023 12:39:39 +0000 (UTC)
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-1e122a7b3f3so80011fac.3
        for <ntfs3@lists.linux.dev>; Thu, 28 Sep 2023 05:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904779; x=1696509579;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jevz1aHUBwU4uRYvTUoYpDv/bvWb4GE53HcLNdy3s4g=;
        b=wY00y7xm0EIB2KloHuGzcCbbePYWsIMIQpAEe+PhQlbg5wW7ikkep1LHFvBkyUrY7M
         ekUzRHW036goipj0xv3hAt24pq74Go6ob7ON9FDPivpBg5IgnqXWz5PW6juHIfMUoI5S
         4kkZFGL4jRBFVbUKPnNbusEg57dZEJ7fNSNPIzv6o3pnAt3b5D8fd/+IdNqZTgsbiZ4C
         +d4JX6gRBdMwRqxV/4k2HbaIPE/ZuiXw5DeWtp02lCbYB+o7U+mTeYcU0J7xIhu7Tiax
         Ai38AgHMJR6aYlYkiIVtjZCxgeXA8pAEuKQCz55dgyyVliBKCu8qRcLYLp7mga+5mRpZ
         BztQ==
X-Gm-Message-State: AOJu0YyDZyPfhi8Id+nlJnET6EMatwN5GsSZ3x7XZBCYz+MmbdM0Ve6p
	sFQ2DHTjkKa4kpEVq3Y9zu2giMI9rUG1NAojT3aRIMI30pMc
X-Google-Smtp-Source: AGHT+IF+tGoV4uxaTQ/zdwl2ZaJnmdjSs2bcHo8WJKEiSAZD6jmIQM5TVx8AfijNJMuib4JYzCqihL+K1SwZ+Qmbj3BVNPUMJ0Z7
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:c784:b0:1e1:509:417a with SMTP id
 dy4-20020a056870c78400b001e10509417amr439319oab.3.1695904779351; Thu, 28 Sep
 2023 05:39:39 -0700 (PDT)
Date: Thu, 28 Sep 2023 05:39:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f2412406066a99fc@google.com>
Subject: [syzbot] [ntfs3?] WARNING in pivot_root
From: syzbot <syzbot+8f6bf34e4614f7c14d20@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, brauner@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    940fcc189c51 Add linux-next specific files for 20230921
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=177ba9ea680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f140ae6e669ac24
dashboard link: https://syzkaller.appspot.com/bug?extid=8f6bf34e4614f7c14d20
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16bf6c66680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b8921b235c24/disk-940fcc18.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c80a9f6bcdd4/vmlinux-940fcc18.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ed10a4df6950/bzImage-940fcc18.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f85df51588c9/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f6bf34e4614f7c14d20@syzkaller.appspotmail.com

DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff888065021950, owner = 0x0, curr 0xffff888014bf5940, list empty
WARNING: CPU: 1 PID: 12010 at kernel/locking/rwsem.c:1369 __up_write kernel/locking/rwsem.c:1369 [inline]
WARNING: CPU: 1 PID: 12010 at kernel/locking/rwsem.c:1369 up_write+0x458/0x510 kernel/locking/rwsem.c:1632
Modules linked in:
CPU: 1 PID: 12010 Comm: syz-executor.5 Not tainted 6.6.0-rc2-next-20230921-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023
RIP: 0010:__up_write kernel/locking/rwsem.c:1369 [inline]
RIP: 0010:up_write+0x458/0x510 kernel/locking/rwsem.c:1632
Code: c1 ea 03 80 3c 02 00 75 50 48 8b 13 4d 89 f1 41 55 4d 89 f8 4c 89 e1 48 c7 c6 a0 a1 8c 8a 48 c7 c7 c0 a0 8c 8a e8 58 c2 e6 ff <0f> 0b 5a e9 aa fc ff ff 48 89 ef e8 a8 62 77 00 e9 17 fd ff ff 48
RSP: 0018:ffffc9000a427db0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff888065021950 RCX: 0000000000000000
RDX: ffff888014bf5940 RSI: ffffffff814e0c56 RDI: 0000000000000001
RBP: ffff888065021958 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 205d303130323154 R12: ffff888065021950
R13: ffffffff8a8ca000 R14: ffff888014bf5940 R15: 0000000000000000
FS:  00007fd662a136c0(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6bf48c8390 CR3: 000000007377a000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 inode_unlock include/linux/fs.h:807 [inline]
 unlock_mount fs/namespace.c:2510 [inline]
 __do_sys_pivot_root+0x11f9/0x1660 fs/namespace.c:4254
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:81
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fd661c7cae9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd662a130c8 EFLAGS: 00000246 ORIG_RAX: 000000000000009b
RAX: ffffffffffffffda RBX: 00007fd661d9c050 RCX: 00007fd661c7cae9
RDX: 0000000000000000 RSI: 0000000020000040 RDI: 0000000020000000
RBP: 00007fd661cc847a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007fd661d9c050 R15: 00007ffc9588c7b8
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
