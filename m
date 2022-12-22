Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9B15A8
	for <ntfs3@lists.linux.dev>; Thu, 22 Dec 2022 02:46:44 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id r25-20020a6bfc19000000b006e002cb217fso290109ioh.2
        for <ntfs3@lists.linux.dev>; Wed, 21 Dec 2022 18:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDDI/oL2Ke17uihTmFfkBMeQOhWJlHrip9oEuESCg5w=;
        b=rJhtNbvq6JW5llVkkLCTegwSaEb7eAGeKyALfXSFpZmGhqyc6JbBd7sfA96bDMl/jH
         QP6Hlq4tk4CtSBovuBvO+kUvAmBJw3VDWOXKXATmiezOiFPOwd5Cf4rsrpNK7M2lo8P9
         CFbpB9hXtZ3dvBSm3hRVVDZ43uzx9meT6wQrGV5n+M/kKmbHjQmlaf/iVkULSHthjj6h
         n5s57vCAwFGOsW+TLtVst79C2BuhFv5Hdz/2aoaOxczVIF386IoivTgA43g6jeAfsyYA
         vTyR2dFpDmBHqdjnmJsgx3RcPtsT8ZlBFrJ86Mwuk1UJGkKKJbAdnxFZxxbxkoRArCgm
         olOw==
X-Gm-Message-State: AFqh2koIlnt9pjs8cYe/i4TiZEINUskR1/haLZECfsf1H8mFrS97XlEt
	b8weYINEAuZHFvXxKrft2i93nmZrF5yIxgIqQqRftATIUfZc
X-Google-Smtp-Source: AMrXdXub4G4vWjai0NqHLLfmuFyUTLtFVBrj5YtPa02LsRS2KJP52iuoPbUYfCoJm2N3ghjoAn5C0T+w93GzTbQQW192huo7zfhS
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:501:b0:38a:cb79:54f9 with SMTP id
 i1-20020a056638050100b0038acb7954f9mr333604jar.99.1671677203922; Wed, 21 Dec
 2022 18:46:43 -0800 (PST)
Date: Wed, 21 Dec 2022 18:46:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000eb49a905f061ada5@google.com>
Subject: [syzbot] [vfs?] [ntfs3?] WARNING in do_symlinkat
From: syzbot <syzbot+e78eab0c1cf4649256ed@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    77856d911a8c Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10600abf880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f967143badd2fa39
dashboard link: https://syzkaller.appspot.com/bug?extid=e78eab0c1cf4649256ed
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16bddf1f880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b424d9203f5/disk-77856d91.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/47fd68051834/vmlinux-77856d91.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d3091f087a86/bzImage-77856d91.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/93766764f567/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e78eab0c1cf4649256ed@syzkaller.appspotmail.com

DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff88806d8a8a90, owner = 0x0, curr 0xffff888075533a80, list empty
WARNING: CPU: 1 PID: 5295 at kernel/locking/rwsem.c:1361 __up_write kernel/locking/rwsem.c:1360 [inline]
WARNING: CPU: 1 PID: 5295 at kernel/locking/rwsem.c:1361 up_write+0x4f9/0x580 kernel/locking/rwsem.c:1615
Modules linked in:
CPU: 1 PID: 5295 Comm: syz-executor.1 Not tainted 6.1.0-syzkaller-13031-g77856d911a8c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:__up_write kernel/locking/rwsem.c:1360 [inline]
RIP: 0010:up_write+0x4f9/0x580 kernel/locking/rwsem.c:1615
Code: c7 00 ac ed 8a 48 c7 c6 a0 ae ed 8a 48 8b 54 24 28 48 8b 4c 24 18 4d 89 e0 4c 8b 4c 24 30 31 c0 53 e8 9b 59 e8 ff 48 83 c4 08 <0f> 0b e9 6b fd ff ff 48 c7 c1 d8 83 96 8e 80 e1 07 80 c1 03 38 c1
RSP: 0018:ffffc9000496fd40 EFLAGS: 00010292
RAX: 161bb8d4b7118f00 RBX: ffffffff8aedace0 RCX: ffff888075533a80
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc9000496fe10 R08: ffffffff816f29ad R09: fffff5200092df61
R10: fffff5200092df61 R11: 1ffff9200092df60 R12: 0000000000000000
R13: ffff88806d8a8a90 R14: 1ffff9200092dfb0 R15: dffffc0000000000
FS:  00007ff7ee349700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020023000 CR3: 000000007cc18000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 inode_unlock include/linux/fs.h:761 [inline]
 done_path_create fs/namei.c:3857 [inline]
 do_symlinkat+0x242/0x5f0 fs/namei.c:4433
 __do_sys_symlinkat fs/namei.c:4447 [inline]
 __se_sys_symlinkat fs/namei.c:4444 [inline]
 __x64_sys_symlinkat+0x95/0xa0 fs/namei.c:4444
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff7ed68c0d9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff7ee349168 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007ff7ed7ac050 RCX: 00007ff7ed68c0d9
RDX: 0000000020000280 RSI: ffffffffffffff9c RDI: 00000000200004c0
RBP: 00007ff7ed6e7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffe963e7f2f R14: 00007ff7ee349300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
