Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426336E
	for <ntfs3@lists.linux.dev>; Wed,  5 Oct 2022 07:05:35 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id y10-20020a5d914a000000b00688fa7b2252so10485203ioq.0
        for <ntfs3@lists.linux.dev>; Wed, 05 Oct 2022 00:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=c6S/9q5ksui85qM6iwFvwIQlmoGAhi/sn5XBEr1wsRw=;
        b=Ps5X+/RzgEiF/u7mDFWT2+VTJTPD+2PC0FjzimSxFruWJwn7zAkEr4vbuj9V9dwyEu
         DrupH6GpwdOYlQquOTT8JmsNU/UttvY8W6nNurD4shBpyfw7o/1/9mOpIUH6k1UgPRWs
         JIIlD/IGZMD7+MpibDQSouP3dBzFvbhUbMu/Ob9ZoEDyPmjlXNryLxHjnObyjKIAZd67
         WGLPWURuih2krAT3QOlkh4EqLruFv+oDFtf4Ib/hiSRGVnijuYaxPj/aglwF/cB2P/cR
         ZXzjoz6vltBO6JmLv3mllCGAremphDZutVYGsII+Iy4VnWbGHoewODZ3Q5QumgVWXxW9
         8O7w==
X-Gm-Message-State: ACrzQf0x2+NyKdndoOBwh2xHYdJXbrG9SZXBIV6b6phRjMq45WMPCgBo
	rsuBxiVpfM157OsrxzSYFj0+ecwUvLw8IHXJQk4SiqFbsXmM
X-Google-Smtp-Source: AMsMyM6pwUgiQq/JGG90QLfghqt7RZ+LW4fBvuzv87ab3VHbnnw9qwdfzXdTupeDLeyaHG4TcKK0HtxOuKozmjLRPDy1p2V5nfS3
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19c9:b0:2f9:bcab:7b7c with SMTP id
 r9-20020a056e0219c900b002f9bcab7b7cmr6735513ill.251.1664953534880; Wed, 05
 Oct 2022 00:05:34 -0700 (PDT)
Date: Wed, 05 Oct 2022 00:05:34 -0700
In-Reply-To: <00000000000067a9d105ea0b6304@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000003a4b505ea4434cb@google.com>
Subject: Re: [syzbot] WARNING in ntfs_fill_super
From: syzbot <syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, kari.argillander@gmail.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	penguin-kernel@I-love.SAKURA.ne.jp, syzkaller-bugs@googlegroups.com, 
	trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0326074ff465 Merge tag 'net-next-6.1' of git://git.kernel...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1079eb04880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d323d85b1f8a4ed7
dashboard link: https://syzkaller.appspot.com/bug?extid=33f3faaa0c08744f7d40
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=106b6db8880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13004fea880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c40d70ae7512/disk-0326074f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3603ce065271/vmlinux-0326074f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/760fceba2d95/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3: loop0: Different NTFS' sector size (1024) and media sector size (512)
------------[ cut here ]------------
WARNING: CPU: 0 PID: 3608 at mm/page_alloc.c:5525 __alloc_pages+0x30a/0x560 mm/page_alloc.c:5525
Modules linked in:
CPU: 0 PID: 3608 Comm: syz-executor137 Not tainted 6.0.0-syzkaller-02734-g0326074ff465 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
RIP: 0010:__alloc_pages+0x30a/0x560 mm/page_alloc.c:5525
Code: 5c 24 04 0f 85 f3 00 00 00 44 89 e1 81 e1 7f ff ff ff a9 00 00 04 00 41 0f 44 cc 41 89 cc e9 e3 00 00 00 c6 05 7e 7d 2a 0c 01 <0f> 0b 83 fb 0a 0f 86 c8 fd ff ff 31 db 48 c7 44 24 20 0e 36 e0 45
RSP: 0018:ffffc90003c5f8e0 EFLAGS: 00010246
RAX: ffffc90003c5f940 RBX: 000000000000000c RCX: 0000000000000000
RDX: 0000000000000028 RSI: 0000000000000000 RDI: ffffc90003c5f968
RBP: ffffc90003c5f9f0 R08: dffffc0000000000 R09: ffffc90003c5f940
R10: fffff5200078bf2d R11: 1ffff9200078bf28 R12: 0000000000040c40
R13: 1ffff9200078bf24 R14: dffffc0000000000 R15: 1ffff9200078bf20
FS:  00005555562f1300(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd6b4b4000 CR3: 000000007376f000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kmalloc_order+0x41/0x140 mm/slab_common.c:933
 kmalloc_order_trace+0x15/0x70 mm/slab_common.c:949
 kmalloc_large include/linux/slab.h:529 [inline]
 __kmalloc+0x26e/0x370 mm/slub.c:4418
 kmalloc include/linux/slab.h:605 [inline]
 ntfs_fill_super+0x351b/0x42a0 fs/ntfs3/super.c:1144
 get_tree_bdev+0x400/0x620 fs/super.c:1323
 vfs_get_tree+0x88/0x270 fs/super.c:1530
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f4211ce22aa
Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd6b4b3898 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f4211ce22aa
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffd6b4b38b0
RBP: 00007ffd6b4b38b0 R08: 00007ffd6b4b38f0 R09: 00005555562f12c0
R10: 0000000000000000 R11: 0000000000000286 R12: 0000000000000004
R13: 00007ffd6b4b38f0 R14: 000000000000010d R15: 0000000020001b38
 </TASK>

