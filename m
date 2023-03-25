Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E928EB
	for <ntfs3@lists.linux.dev>; Sat, 25 Mar 2023 13:41:51 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id i17-20020a056e020d9100b00325a80f683cso2980390ilj.22
        for <ntfs3@lists.linux.dev>; Sat, 25 Mar 2023 06:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679751710;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ixifmir7ualllnwN46FhGK6UkJX1AD6Gkf3lIcbzhSQ=;
        b=bxmH3LTCVMhbBbqw7CfJmG1K89yORcV4gTP6u4lGec+x7uNToleX3qBdlj5mmmWQFn
         YteJQJf81Wz3k0c6pJMcO0vCOe4T36yu8vmk9ucLVK+rRVs1w8MKFUy8gRwCn5lv66g+
         7YbkoPCU4PBGOas5jmL32MYGY0kUNBFulEpKxJrY3w5inQ9ozx1u/dnHTVSOpIJYRRAE
         1LpF/nbhCNKIFlIKdyzpg1qgthSAA/yRYntLU6a8EKuLfRn07B/9oONwU86EHMR48bzf
         xjYWS42az+TT83siy1jtSHQ7vW06OTWVCmwzwu6OHZKpDvJb8RinD2mLG32vTYf6yRe3
         h6Mg==
X-Gm-Message-State: AO0yUKWCjaW4aYmX4Vy4shLYlj7Yvxadpf3DOMju9THjgCuzt+/OevcA
	tEQ9sSt4CdQSW3MPRHzxKlnSnWRm+01oQvFZLhhEtXrkDVK6
X-Google-Smtp-Source: AK7set80ynXrN1yvTOZK3lcRrM71sUr1hmFzudml79RxjjkBoqaEKJjHFC0FcyzvbvhRO20HngARnfv4jIyxANdNzEjDj4GeBukD
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a5e:9901:0:b0:753:cd5:abde with SMTP id
 t1-20020a5e9901000000b007530cd5abdemr2508825ioj.4.1679751710442; Sat, 25 Mar
 2023 06:41:50 -0700 (PDT)
Date: Sat, 25 Mar 2023 06:41:50 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000030b7e05f7b9ac32@google.com>
Subject: [syzbot] [ntfs3?] WARNING in attr_data_get_block (2)
From: syzbot <syzbot+a98f21ebda0a437b04d7@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    17214b70a159 Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17331931c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d40f6d44826f6cf7
dashboard link: https://syzkaller.appspot.com/bug?extid=a98f21ebda0a437b04d7
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d166fda7fbbd/disk-17214b70.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0c16461022b9/vmlinux-17214b70.xz
kernel image: https://storage.googleapis.com/syzbot-assets/53e9e40da8bb/bzImage-17214b70.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a98f21ebda0a437b04d7@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 24195 at fs/ntfs3/attrib.c:1060 attr_data_get_block+0x1926/0x2da0
Modules linked in:
CPU: 0 PID: 24195 Comm: syz-executor.2 Not tainted 6.3.0-rc3-syzkaller-00012-g17214b70a159 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
RIP: 0010:attr_data_get_block+0x1926/0x2da0 fs/ntfs3/attrib.c:1060
Code: 80 e1 07 80 c1 03 38 c1 0f 8c 48 ff ff ff 48 8d bc 24 e0 01 00 00 e8 19 5b 1b ff 48 8b 54 24 58 e9 31 ff ff ff e8 9a a9 c5 fe <0f> 0b bb ea ff ff ff e9 11 fa ff ff e8 89 a9 c5 fe e9 0f f9 ff ff
RSP: 0018:ffffc9002245fac0 EFLAGS: 00010293
RAX: ffffffff82c4c386 RBX: 00000000ffffffff RCX: ffff88801f029d40
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 00000000ffffffff
RBP: ffffc9002245fd28 R08: ffffffff82c4be5f R09: fffffbfff205c062
R10: 0000000000000000 R11: dffffc0000000001 R12: 1ffff9200448bf78
R13: 0000000000000032 R14: ffff88803fd81760 R15: dffffc0000000000
FS:  00007f61ad5ea700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4db29fe800 CR3: 000000002fb69000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ntfs_fallocate+0xca4/0x1190 fs/ntfs3/file.c:614
 vfs_fallocate+0x54b/0x6b0 fs/open.c:324
 ksys_fallocate fs/open.c:347 [inline]
 __do_sys_fallocate fs/open.c:355 [inline]
 __se_sys_fallocate fs/open.c:353 [inline]
 __x64_sys_fallocate+0xbd/0x100 fs/open.c:353
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f61ac88c0f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f61ad5ea168 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f61ac9ac120 RCX: 00007f61ac88c0f9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
RBP: 00007f61ac8e7b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000ff8000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc8413a04f R14: 00007f61ad5ea300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
