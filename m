Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B563C8
	for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 20:13:46 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id g11-20020a6be60b000000b006e2c707e565so4668192ioh.14
        for <ntfs3@lists.linux.dev>; Tue, 27 Dec 2022 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJzU91V+2caAyK9xQGuPXZk4ZLFFV8aPHDjR8GkZScc=;
        b=fIJC9/kk4JJuOllILSWmKSCuvCo21gscH5yxzkynpLdWnOOlDufggjOH1qjM8yJjsH
         Gtu0UN3714dFD2GEEAT4vOLgaCXqiSS6Qd7++1kSLABAp8pocrBiSgpotDEgLZxQSmqY
         aE10EegnI0ES3EW877n3v0EGRwfW4OYtPNE4keE0ZvnpYlhEHT1ERxoP3LHrItbKevIT
         b5dXwyMexTM3vVbbGq3RbKtrowcQ1jZVCxw6XsOua2Omgm9ruSwqKMoB5xPZUTUKziGq
         rLjYCX3KJrSEcilAQytzePGyc5IBGJlsRx1TWjEKWbBH4VlMBkjcitVHFwu2+cT9Al9q
         ifNQ==
X-Gm-Message-State: AFqh2kqA+tGqc+Tx34GAjYfAq8/StgJz1nOybNFFydXvwIkXu0f+n3uk
	2bVWj6Ye5TfkAS0B1U91E/U0UALIVHtL8fuo6nUTsduoc1zQ
X-Google-Smtp-Source: AMrXdXsvTZu9GiWOGwn+s+ah4rOIU7VaQs1NzVOvhW6auU7h1mGH1U1ycI1BxtRkni8/D4jAl3JdnMw3YTBzR/qtWZGLJnWOWhSM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:13c1:b0:39d:72ab:a7c5 with SMTP id
 i1-20020a05663813c100b0039d72aba7c5mr2026740jaj.247.1672172025679; Tue, 27
 Dec 2022 12:13:45 -0800 (PST)
Date: Tue, 27 Dec 2022 12:13:45 -0800
In-Reply-To: <000000000000eb49a905f061ada5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009813d705f0d4e3e5@google.com>
Subject: Re: [syzbot] [vfs?] [ntfs3?] WARNING in do_symlinkat
From: syzbot <syzbot+e78eab0c1cf4649256ed@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    1b929c02afd3 Linux 6.2-rc1
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11625c6c480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=68e0be42c8ee4bb4
dashboard link: https://syzkaller.appspot.com/bug?extid=e78eab0c1cf4649256ed
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11621288480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148ad5a8480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2d8c5072480f/disk-1b929c02.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46687f1395db/vmlinux-1b929c02.xz
kernel image: https://storage.googleapis.com/syzbot-assets/26f1afa5ec00/bzImage-1b929c02.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6ad275e8bd72/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e78eab0c1cf4649256ed@syzkaller.appspotmail.com

WARNING: CPU: 1 PID: 6646 at kernel/locking/rwsem.c:1361 __up_write kernel/locking/rwsem.c:1360 [inline]
WARNING: CPU: 1 PID: 6646 at kernel/locking/rwsem.c:1361 up_write+0x4f9/0x580 kernel/locking/rwsem.c:1615
Modules linked in:
CPU: 1 PID: 6646 Comm: syz-executor272 Not tainted 6.2.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:__up_write kernel/locking/rwsem.c:1360 [inline]
RIP: 0010:up_write+0x4f9/0x580 kernel/locking/rwsem.c:1615
Code: c7 e0 ab ed 8a 48 c7 c6 80 ae ed 8a 48 8b 54 24 28 48 8b 4c 24 18 4d 89 e0 4c 8b 4c 24 30 31 c0 53 e8 9b 59 e8 ff 48 83 c4 08 <0f> 0b e9 6b fd ff ff 48 c7 c1 18 9c 96 8e 80 e1 07 80 c1 03 38 c1
RSP: 0018:ffffc9000b807d40 EFLAGS: 00010292
RAX: 298a0fb209e0d400 RBX: ffffffff8aedacc0 RCX: ffff88801965d7c0
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc9000b807e10 R08: ffffffff816f2c9d R09: fffff52001700f61
R10: fffff52001700f61 R11: 1ffff92001700f60 R12: 0000000000000000
R13: ffff88806f2036d0 R14: 1ffff92001700fb0 R15: dffffc0000000000
FS:  00007f7a51ed8700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff0eaf7c5c CR3: 000000007721d000 CR4: 00000000003506e0
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
RIP: 0033:0x7f7a5a151049
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7a51ed82f8 EFLAGS: 00000246 ORIG_RAX: 000000000000010a
RAX: ffffffffffffffda RBX: 00007f7a5a1f5790 RCX: 00007f7a5a151049
RDX: 0000000020000280 RSI: 00000000ffffff9c RDI: 00000000200004c0
RBP: 00007f7a5a1c1fb8 R08: 00007f7a51ed8700 R09: 0000000000000000
R10: 00007f7a51ed8700 R11: 0000000000000246 R12: 00007f7a5a1a2640
R13: 00007f7a5a1c1eb8 R14: 0030656c69662f2e R15: 00007f7a5a1f5798
 </TASK>

