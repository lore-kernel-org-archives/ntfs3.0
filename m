Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A81F79CC
	for <ntfs3@lists.linux.dev>; Thu, 26 Jan 2023 23:55:49 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id u1-20020a5d8181000000b006ee29a8c421so1854015ion.19
        for <ntfs3@lists.linux.dev>; Thu, 26 Jan 2023 15:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/mHGqHnlLOZDTRc/j4sUoCCFZeovVeLFLkYmFL04bs=;
        b=F8hN66dEPa5V0w4RtiEQAc7lPC28zn4E/WhHmwG/zQqcHYrLZqZwkpqxj+GqmrQCzX
         iEN2Ae9zzjmLFzGti0FdH+3HHTMySEeP4vLg8hEPtR4YvUMm62hXGQ3AuCBnIXHkMjgS
         oWSvqnD8FmShISUs8oIAiueZjwr5Lewe1YYOWyeyMXyMfeceEMVQyLCWUVBvSafgSBpf
         yGEuwssplcQldv7n2dVTP8sO30pBImBMZY3Wegw6XsXgocmzY+X9uFgPpbtjfwsTaE5H
         KpvvqC3J6v3N4eRcO3RVROYmss5MAhnVv0l3ykEQlzr53jyHphP3OLq4+roTXTz1MKC3
         csxA==
X-Gm-Message-State: AO0yUKXugDqADTZ8qGuaVvZFVBQdFg3b+gpVmExbtV4HcYeGExLFMRoG
	J8koBROrN860J+NxnHuA9C8Oo6MWLvJq5et5Y0+QM2ahC5Ce
X-Google-Smtp-Source: AK7set9LBHt3fobyke2L4mqXoPyEh5AZP1qBIHcmqh7Kn/LIAqBVKBO/uUeMDncENlcv9Dsh1RMVweA+aSyUuFoW9XxIAiLNtqJI
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:bd0d:0:b0:310:b103:a416 with SMTP id
 c13-20020a92bd0d000000b00310b103a416mr730073ile.12.1674777348318; Thu, 26 Jan
 2023 15:55:48 -0800 (PST)
Date: Thu, 26 Jan 2023 15:55:48 -0800
In-Reply-To: <000000000000a0d7f305eecfcbb9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ecacda05f3337c03@google.com>
Subject: Re: [syzbot] [vfs?] [ntfs3?] WARNING in path_openat
From: syzbot <syzbot+be8872fcb764bf9fea73@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    7c46948a6e9c Merge tag 'fs.fuse.acl.v6.2-rc6' of git://git..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=109c0b8e480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c8d5c2ee6c2bd4b8
dashboard link: https://syzkaller.appspot.com/bug?extid=be8872fcb764bf9fea73
compiler:       Debian clang version 13.0.1-6~deb11u1, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17346ee1480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149c16cd480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cc51645b6401/disk-7c46948a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/be036b5604a3/vmlinux-7c46948a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/274f5abf2c8f/bzImage-7c46948a.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/afb5c6b7a19b/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+be8872fcb764bf9fea73@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff88807104ea70, owner = 0x0, curr 0xffff8880196757c0, list empty
WARNING: CPU: 0 PID: 7935 at kernel/locking/rwsem.c:1361 __up_write kernel/locking/rwsem.c:1360 [inline]
WARNING: CPU: 0 PID: 7935 at kernel/locking/rwsem.c:1361 up_write+0x4f9/0x580 kernel/locking/rwsem.c:1615
Modules linked in:
CPU: 0 PID: 7935 Comm: syz-executor316 Not tainted 6.2.0-rc5-syzkaller-00047-g7c46948a6e9c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/12/2023
RIP: 0010:__up_write kernel/locking/rwsem.c:1360 [inline]
RIP: 0010:up_write+0x4f9/0x580 kernel/locking/rwsem.c:1615
Code: c7 00 ad ed 8a 48 c7 c6 a0 af ed 8a 48 8b 54 24 28 48 8b 4c 24 18 4d 89 e0 4c 8b 4c 24 30 31 c0 53 e8 9b 5a e8 ff 48 83 c4 08 <0f> 0b e9 6b fd ff ff 48 c7 c1 18 cb 96 8e 80 e1 07 80 c1 03 38 c1
RSP: 0018:ffffc9000b7cf860 EFLAGS: 00010296
RAX: 4643b7f86e564100 RBX: ffffffff8aedade0 RCX: ffff8880196757c0
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc9000b7cf930 R08: ffffffff816f2b8d R09: fffff520016f9ec5
R10: fffff520016f9ec5 R11: 1ffff920016f9ec4 R12: 0000000000000000
R13: ffff88807104ea70 R14: 1ffff920016f9f14 R15: dffffc0000000000
FS:  00007ff043008700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000561cee05f058 CR3: 0000000021d9a000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 inode_unlock include/linux/fs.h:761 [inline]
 open_last_lookups fs/namei.c:3485 [inline]
 path_openat+0x14ff/0x2dd0 fs/namei.c:3711
 do_filp_open+0x264/0x4f0 fs/namei.c:3741
 do_sys_openat2+0x124/0x4e0 fs/open.c:1310
 do_sys_open fs/open.c:1326 [inline]
 __do_sys_creat fs/open.c:1402 [inline]
 __se_sys_creat fs/open.c:1396 [inline]
 __x64_sys_creat+0x11f/0x160 fs/open.c:1396
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff04b2814a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 d1 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff0430082f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007ff04b326790 RCX: 00007ff04b2814a9
RDX: 00007ff04b2814a9 RSI: 0000000000000106 RDI: 0000000020000200
RBP: 00007ff04b2f2c88 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000020000600
R13: 0030656c69662f2e R14: 0000000020000b80 R15: 00007ff04b326798
 </TASK>

