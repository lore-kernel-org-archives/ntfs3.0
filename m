Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A3213774D
	for <ntfs3@lists.linux.dev>; Sun,  5 Oct 2025 23:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759707027; cv=none; b=XE+fF8PNSjVA0QlfGxEzQU4qlNetBYU1h3S6pwN0IKc3Byr8FXSCy2NrC5FQtP64LZZo6v6e8Ec5x/Fb3dpujenaXI/KBY2lqmYYyUpIC47gz0QSF+R/bt3KRW//NoQUPXoy2t18uD16h5deEpol0f1PhADV99ENGLj3ASdtKuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759707027; c=relaxed/simple;
	bh=75ERC6mVlcP+0s7urdWwm4NONtCuHEvmI1LGy4VtD1I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=njp2/L0nUlmSePRpNTmj901vf3GQeZZ/1bTWXrF92kFbX3zSso9831u/eVTiMCSkjDKqpO6Sc5EQkbF3OqHskNzozUZNmZLxDjhf0W75Hma9q5sg1yxSell3cGp4iq6s6kOWHvbaEEo4lyaufNJhzPvX5rx+7h1XmKLXZHNm8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-91e1d4d0976so1132237239f.2
        for <ntfs3@lists.linux.dev>; Sun, 05 Oct 2025 16:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759707025; x=1760311825;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trZlZImbmcaAhlE8sigTqJv3T3ChaC7LfmvwDqEqkS0=;
        b=kbxYWt3cLpusYgrCS3cKAnfJ/eo5iqF3d8B0yRhJWl7rRYY06rAHsvVu1ElPEg9yxp
         JNRptLVryiH/b3V6+ehb1GEzb7hAIFx2SJaw0Q35D4qgbQlCFFi8mhAwTqF+eGMhCmG+
         vx5mVolHIp7RNqJmRXI7YqVj5aUZUJv5B8mGBFhi5duYJZb+6cH/Y9cjRmCFGlpK0Dev
         kQDqx7/GmissgBJhK2gS8mummTW1WMMWkB9mTth34ni5tIx9//CaqFQVQBYNvy3A5YcT
         30pm9ls0yz7M7+swyUQCh8Yk7FAS21AxFUmxKRT4ZGIYWmwweot0JxNZMA7PVFb4NvV+
         kJNA==
X-Forwarded-Encrypted: i=1; AJvYcCW5pHLSXVa0Iu2vvHoRVzkPXPFzm7eFlTx2YIMrxAgiKijz+BGvIOZjZahoMy0KuV4bzxWbXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjNqMP9ERQNS0q2p+1zxb+xE41D2y+yq41w7k/GZGdtUPbh2Yj
	hD1bnuy+zJF+DXFnkhLkVdyS0NJrRqtawo/8cAR50cVNXygGKb8/H0NIF/DlD/LTh2whMAi9PRw
	4pksyVfmfGhkZdLuneOl0kua5X7p2vVpjg62ePyEEFWI1TOK2wDuRVrcS8q4=
X-Google-Smtp-Source: AGHT+IEJffKj5NbuytLavLNmtzhrY1Xa4KENymvle9KZlbxZ/n7Iib8GRsIT0u3bDAZXwx3KxV/fX+YlUekbZvrx+NzB6I04ugWQ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ef:b0:427:1de5:e10f with SMTP id
 e9e14a558f8ab-42e7ad9c5e9mr141692915ab.22.1759707025190; Sun, 05 Oct 2025
 16:30:25 -0700 (PDT)
Date: Sun, 05 Oct 2025 16:30:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e2ff91.050a0220.2c17c1.003a.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in indx_insert_into_buffer (3)
From: syzbot <syzbot+3a1878433bc1cb97b42a@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6093a688a07d Merge tag 'char-misc-6.18-rc1' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13962458580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e654219ed2546322
dashboard link: https://syzkaller.appspot.com/bug?extid=3a1878433bc1cb97b42a
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=104b692f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17962458580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/660883fc9bdb/disk-6093a688.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/29f543ec9187/vmlinux-6093a688.xz
kernel image: https://storage.googleapis.com/syzbot-assets/456918818f89/bzImage-6093a688.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/dc6369359d19/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3a1878433bc1cb97b42a@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
------------[ cut here ]------------
memcpy: detected field-spanning write (size 3656) of single field "hdr1" at fs/ntfs3/index.c:1927 (size 16)
WARNING: CPU: 0 PID: 6065 at fs/ntfs3/index.c:1927 indx_insert_into_buffer.isra.0+0x1041/0x12a0 fs/ntfs3/index.c:1927
Modules linked in:
CPU: 0 UID: 0 PID: 6065 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
RIP: 0010:indx_insert_into_buffer.isra.0+0x1041/0x12a0 fs/ntfs3/index.c:1927
Code: b5 ed a3 fe c6 05 52 41 31 0d 01 90 48 8b 74 24 68 b9 10 00 00 00 48 c7 c2 20 53 a7 8b 48 c7 c7 80 53 a7 8b e8 a0 74 62 fe 90 <0f> 0b 90 90 e9 df fd ff ff e8 71 6d 0b ff e9 4d f4 ff ff e8 67 6d
RSP: 0018:ffffc900039af748 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 00000000ffffffe4 RCX: ffffffff81799b88
RDX: ffff88802ed50000 RSI: ffffffff81799b95 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffff888146f46800
R13: ffff888069637800 R14: 0000000000000e48 R15: ffff88807ae74018
FS:  0000555563ff7500(0000) GS:ffff888124e6a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fdbd7fd4286 CR3: 0000000069517000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 indx_insert_entry+0x1a0/0x460 fs/ntfs3/index.c:1996
 ni_add_name+0x4dd/0x820 fs/ntfs3/frecord.c:2995
 ni_rename+0x98/0x170 fs/ntfs3/frecord.c:3026
 ntfs_rename+0xab9/0xf00 fs/ntfs3/namei.c:332
 vfs_rename+0xfa3/0x2290 fs/namei.c:5216
 do_renameat2+0x7d8/0xc20 fs/namei.c:5364
 __do_sys_rename fs/namei.c:5411 [inline]
 __se_sys_rename fs/namei.c:5409 [inline]
 __x64_sys_rename+0x7d/0xa0 fs/namei.c:5409
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f780118eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcbf706748 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007f78013e5fa0 RCX: 00007f780118eec9
RDX: 0000000000000000 RSI: 0000200000000f40 RDI: 00002000000003c0
RBP: 00007f7801211f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f78013e5fa0 R14: 00007f78013e5fa0 R15: 0000000000000002
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
