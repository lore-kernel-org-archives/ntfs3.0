Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC5364E88
	for <ntfs3@lists.linux.dev>; Mon, 23 Feb 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847789; cv=none; b=HRU8SvqiT4Mgs8ws/vSZgvIB1eMs5Bj1MFHIMyaA4zN0Kbo0IWZn5K7+1m5s9eUYno1VZYsqTH5SXit97Y7GLIuqgFmBUlOHyXSGRsER56gfuqe87ELjXwT5V9MY4PTy4lKebhWRZcIsRd9nSmD5YOJsPL53r9ORJO/23aAvn2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847789; c=relaxed/simple;
	bh=6Ia6VCShM6zzdP+XuTgyLmPwnvM3zKsEwiVe8TQr/5c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jS0a9aYrRfksxEeJq3yTrRmCEfRhUC2jUNfeELLRYyuPUnXErAZCrDg8QjTV5D2QxvJWCxUoUfrWxomyLUd7Oo/GJWPW/UE6KQOxCgOIQ9Kt8X8/gYRScr1PXP6n3KXYCSnl9p6IyT1XyzCBFV/3AII5FZkKxRsKG6LVud9/eUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-40ea48ccbd2so14309822fac.3
        for <ntfs3@lists.linux.dev>; Mon, 23 Feb 2026 03:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771847787; x=1772452587;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uw9xuxJextOFxLva+oppEd4d/3TepxRPQw3dGBKGEBg=;
        b=gA3/3f5NCFEsvkUu1pNo1IYHGxJcbNuFbH/YcfYMxwSxgq0Jmb5bpnNhF89soDk7gR
         9r7/d25RyLSpmHPm7zpoHodoDi/G7tm+C9XyWFE1muA1SUP1X3HidFKYjrDoFiFifzz1
         y4GK6Y7BW0YEkIBdAsl/L2GOpk7AkTIh5EmYes4/EnkqmZOql0WYd+0DZGjM+vvwnuRQ
         /rGhDf3ZMECLbVW9GC7QyhmIEVjc/s9awyp/shfXPw/H7YJEepZuT7BGJaAxrNNkc2tr
         hW99rorBXesIRlnpkr18+uDc5ScABTcdLQWN00yZ52K1dLAP5yAZPFVu18qp0R7Le2D1
         XW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMpa+ZZ2rBuFkRjYTt2H5rRRmacPIo5bU7cOdbtB6NLqRRawAbBYs6ubA6/lkXf3Gm4qDGlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMUNFTh0HWu2oBeII9vchG1seRXhAvhDZx4pNjHauY2kv2edjA
	xa7LBL0XyT7g9Rb5Iv6tmLhlJLb380UZvDDfGNj7E5D1BGm0lxxg1y1sN9Wi3r4tpGV4nA+rli5
	ZwDsi4Mf0cTJEqaT6DG35CMB4zpFzuMP3OVnphqvJ5A5+3fQf7aJaml6q+sY=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c82:b0:662:f8a9:9f7 with SMTP id
 006d021491bc7-679c44d0e46mr4209287eaf.37.1771847787279; Mon, 23 Feb 2026
 03:56:27 -0800 (PST)
Date: Mon, 23 Feb 2026 03:56:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <699c406b.050a0220.1876f9.0002.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in attr_data_get_block_locked
From: syzbot <syzbot+c1e9aedbd913fadad617@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    956b9cbd7f15 Merge tag 'kbuild-fixes-7.0-1' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=148bb15a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=65722f41f7edc17e
dashboard link: https://syzkaller.appspot.com/bug?extid=c1e9aedbd913fadad617
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f61ffa580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15833b3a580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-956b9cbd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f0b3757a15ed/vmlinux-956b9cbd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c564e8613b4e/bzImage-956b9cbd.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/30f6900c6fc3/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c1e9aedbd913fadad617@syzkaller.appspotmail.com

------------[ cut here ]------------
1
WARNING: fs/ntfs3/attrib.c:1222 at attr_data_get_block_locked+0x174a/0x22a0 fs/ntfs3/attrib.c:1222, CPU#0: syz.0.17/5462
Modules linked in:
CPU: 0 UID: 0 PID: 5462 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:attr_data_get_block_locked+0x174a/0x22a0 fs/ntfs3/attrib.c:1222
Code: 89 ee 49 89 d6 e8 d6 19 a6 fe 4d 89 f2 44 89 ac 24 bc 00 00 00 45 29 ea 73 1e e8 01 18 a6 fe e9 47 f9 ff ff e8 f7 17 a6 fe 90 <0f> 0b 90 41 bf ea ff ff ff e9 d6 fa ff ff 48 b8 00 00 00 00 00 fc
RSP: 0018:ffffc900049079c0 EFLAGS: 00010293
RAX: ffffffff831f83a9 RBX: 00000000ffffffff RCX: ffff888000ea0000
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 00000000ffffffff
RBP: ffffc90004907be8 R08: 0000000000000000 R09: 1ffff11002487041
R10: dffffc0000000000 R11: ffffed1002487042 R12: 0000000000000002
R13: dffffc0000000000 R14: 0000000000002000 R15: 0000000000000007
FS:  000055558ba85500(0000) GS:ffff88808ca5b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd19d7909c0 CR3: 0000000012819000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 attr_data_get_block+0x250/0x310 fs/ntfs3/attrib.c:982
 ntfs_fallocate+0xfac/0x1220 fs/ntfs3/file.c:677
 vfs_fallocate+0x669/0x7e0 fs/open.c:340
 ksys_fallocate fs/open.c:364 [inline]
 __do_sys_fallocate fs/open.c:369 [inline]
 __se_sys_fallocate fs/open.c:367 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1e3d39c629
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffbfb65448 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f1e3d615fa0 RCX: 00007f1e3d39c629
RDX: 0000000000007351 RSI: 0000000000000000 RDI: 0000000000000006
RBP: 00007f1e3d432b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000008001 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1e3d615fac R14: 00007f1e3d615fa0 R15: 00007f1e3d615fa0
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
