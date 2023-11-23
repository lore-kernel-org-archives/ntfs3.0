Received: from mail-pj1-f80.google.com (mail-pj1-f80.google.com [209.85.216.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB93FB35
	for <ntfs3@lists.linux.dev>; Thu, 23 Nov 2023 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pj1-f80.google.com with SMTP id 98e67ed59e1d1-28513eccb01so2114316a91.1
        for <ntfs3@lists.linux.dev>; Thu, 23 Nov 2023 09:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759186; x=1701363986;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yf11zIw9U1hiIYNefzB8bU+cyfTgmWMokVCBDmAj/ig=;
        b=AmA5OAaxvSa0Uxeg3xaA2wHFJMgTdXqjFm8yMrifbYOxATWtuhMkigxVMfLoMEt7Xe
         j41qMvwzSJiqxmXrBPCcEyHNg36p1mmb12Wzo+C6k+PFkgJcrvipbptc9U1e1sRaGpGA
         odQs3QVZWQwFMl/mGLlbNk6L+U6+jBI1zZAs75cQPiNqHpT+3I4eURr+nIp1kqkvgIsC
         99xohHgIlhdykKwJ941ZW7YN7IyOWlBM19Vvrg7TAN4ENH9VaelyfP5VzFkyeYnP7pSj
         lu9kaTk87SbQTQwNS4/Yn/zFia41MkCMxueOnkYKUOT9DngbyqiM2Qj9N41uNV9sjfAM
         apIw==
X-Gm-Message-State: AOJu0YxkzCv4HRB80FhMZfXJBaive8oFpBorz1k5ZHQ5nZYyMN55zpW2
	jrh3ZnhUANDvx1xypMUIQ/upxCsa1/ftQDAQAhB5p0KdyoZC
X-Google-Smtp-Source: AGHT+IFaW8lUP9iGdpM+V8LEdM2TkTQRYLAg8rSW6D5JBfiJHnbvXaMthVVsXAcs2MxWDZvsTXddYbcGvOx6c4/HRWVcUCElTkx0
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:90b:3547:b0:27d:3322:68aa with SMTP id
 lt7-20020a17090b354700b0027d332268aamr789618pjb.2.1700759183501; Thu, 23 Nov
 2023 09:06:23 -0800 (PST)
Date: Thu, 23 Nov 2023 09:06:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb2f84060ad4da7f@google.com>
Subject: [syzbot] [ntfs3?] WARNING in indx_insert_into_buffer
From: syzbot <syzbot+c5b339d16ffa61fd512d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    037266a5f723 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16fa37b7680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=af04b7c4d36966d8
dashboard link: https://syzkaller.appspot.com/bug?extid=c5b339d16ffa61fd512d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b86f2f680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116b289f680000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-037266a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3611d88a1ea6/vmlinux-037266a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92866a30a4f7/bzImage-037266a5.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/083e689d86f3/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c5b339d16ffa61fd512d@syzkaller.appspotmail.com

R13: 0000000000000021 R14: 431bde82d7b634db R15: 00007ffc52cb10d0
 </TASK>
------------[ cut here ]------------
memcpy: detected field-spanning write (size 3960) of single field "hdr1" at fs/ntfs3/index.c:1912 (size 16)
WARNING: CPU: 2 PID: 5214 at fs/ntfs3/index.c:1912 indx_insert_into_buffer.isra.0+0xfb5/0x1280 fs/ntfs3/index.c:1912
Modules linked in:
CPU: 2 PID: 5214 Comm: syz-executor117 Not tainted 6.7.0-rc1-syzkaller-00344-g037266a5f723 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:indx_insert_into_buffer.isra.0+0xfb5/0x1280 fs/ntfs3/index.c:1912
Code: c1 ca c1 fe c6 05 a3 cb 3d 0c 01 90 48 8b 74 24 70 b9 10 00 00 00 48 c7 c2 80 cf 03 8b 48 c7 c7 e0 cf 03 8b e8 8c e9 87 fe 90 <0f> 0b 90 90 e9 1b fe ff ff 48 c7 44 24 68 00 00 00 00 31 db e9 10
RSP: 0018:ffffc900035c76e8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 00000000fffffff4 RCX: ffffffff814ca799
RDX: ffff8880287393c0 RSI: ffffffff814ca7a6 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000005 R12: ffff888021065c00
R13: ffff8880143ecc20 R14: ffff888029712800 R15: ffff888018fae018
FS:  0000555556341380(0000) GS:ffff88806b800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd80dde5e00 CR3: 0000000026243000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 indx_insert_entry+0x1a5/0x460 fs/ntfs3/index.c:1981
 ni_add_name+0x4d9/0x820 fs/ntfs3/frecord.c:3055
 ni_rename+0xa1/0x1a0 fs/ntfs3/frecord.c:3087
 ntfs_rename+0x91f/0xec0 fs/ntfs3/namei.c:322
 vfs_rename+0x13e0/0x1c30 fs/namei.c:4844
 do_renameat2+0xc3c/0xdc0 fs/namei.c:4996
 __do_sys_rename fs/namei.c:5042 [inline]
 __se_sys_rename fs/namei.c:5040 [inline]
 __x64_sys_rename+0x81/0xa0 fs/namei.c:5040
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x40/0x110 arch/x86/entry/common.c:82
 entry_SYSCALL_64_after_hwframe+0x63/0x6b
RIP: 0033:0x7fd8160252a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc52cb1068 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007ffc52cb1090 RCX: 00007fd8160252a9
RDX: 00007fd816024370 RSI: 0000000020000a40 RDI: 0000000020000300
RBP: 0000000000000002 R08: 00007ffc52cb0e06 R09: 00007ffc52cb10b0
R10: 0000000000000002 R11: 0000000000000246 R12: 00007ffc52cb108c
R13: 0000000000000021 R14: 431bde82d7b634db R15: 00007ffc52cb10d0
 </TASK>


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
