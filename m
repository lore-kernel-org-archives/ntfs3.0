Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA91347FC0
	for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712993; cv=none; b=aRgmP4U4lsMmTKQIEfy7AAy12h92KkL/AiwA+2Na2wMZvroQ0DTBAC9wUAZ30PWRsq2R1s0Pian4Eh72DOf0fdy/X0W8SczDzTZb/QxsoktEkThAyWibCguOYjA9iJto7Ri2IeMK9jfkEzwTs7XYTRpK/OFYWOGAW6dEG+/HS18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712993; c=relaxed/simple;
	bh=nl0QsIP3W6TQLtbHKs8yFo1gsvcd272qWN34a/SBZO8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Td+QrHiLp+dcUi2mqgqxD879wczFUu5nFY3hgTbPVmXoa+5AnRvCRd8llesz6c8jZWyBs2N4TIWKrxQONAgMdUgeHUyCgUT2WrxqK6ZlbHi/QPlAfCyzWLzIdhGK7tCcLBIaYFRUXeDo87qHj7e1d5T2a+ZihagS9oy5Isrum0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4eb0b989f0eso2012643b6e.0
        for <ntfs3@lists.linux.dev>; Tue, 29 Sep 2026 13:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790712990; x=1791317790;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HC9Mk7tqxMwDAfvVbboAeqH7KbTgvsLbGh6CjiIBOv8=;
        b=IinELHNpqlbdDsZRoxq83GxTMP4oIzV8axZpWNGdbibYwSXJ/KyXfbVVb+eKtA7LbO
         uq4E3HfVrMwGpLcKwSB/9xklqYFxcb8lxCKvHJ8fq9IPCsgr7iOuznKFahehqQ3vW9Zc
         sDvavrl05j1x8B3jSw3EFGMA+83trWZ/eLX47qc8/kI6f8tBxQZPeTIsk8HcW3kxwRnx
         wKagkuDoYSPBG70Cobu6aFR+/ETMu1AKEqfOr6M00zmrcyrNx9f3YGZyTBdz0rZrB/75
         PR0aV4Q/d/YQK+H9PtfVSVXq8rwNMIKevV9b3xGv9Jk84ctdYU6mni9KYVAETJ5qY5b4
         TJlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEpcNVE3Xdszz9Um/+I1RM1hmLDTPFXOB7D9RsuM7x5LSAENtRVTSkaf/hKwaMa1I52o6noA==@lists.linux.dev
X-Gm-Message-State: AFuF++kOSRpqNnkki6Pna3iGMwSGC38szyEtNEHrpJBzPaZIRrx5c94z
	V6Ab55WcNWRfSMnEyUATesEyowGGDz8G+SpZLpBiUgIntB4J2tUYbFpxyNleCyXm2et5gkmDOF/
	qH0uDMlDV+oqT70suLVL6hkdGvXy/fTwASs01llCOt2zfXtvNDkZrpoeqzRg=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f52:b0:4e5:a74e:d6b8 with SMTP id
 5614622812f47-4edd274cf37mr3419743b6e.6.1790712990555; Tue, 29 Sep 2026
 13:16:30 -0700 (PDT)
Date: Tue, 29 Sep 2026 13:16:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abc1c9e.00649fcc.35d151.00e6.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in truncate_setsize
From: syzbot <syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    165768bb7026 Merge tag 'firewire-fixes-7.3-rc5' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=167bd205580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b924f079099ba6e
dashboard link: https://syzkaller.appspot.com/bug?extid=0e70362e1726b5a7502e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-165768bb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8937d1c35787/vmlinux-165768bb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/04f73e6326ff/bzImage-165768bb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com

ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
ntfs3(loop0): failed to read volume at offset 0x46c00
------------[ cut here ]------------
ifs_is_fully_uptodate(folio, ifs) != folio_test_uptodate(folio)
WARNING: fs/iomap/buffered-io.c:295 at ifs_free+0x344/0x400 fs/iomap/buffered-io.c:294, CPU#0: syz.0.0/5321
Modules linked in:
CPU: 0 UID: 0 PID: 5321 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:ifs_free+0x344/0x400 fs/iomap/buffered-io.c:294
Code: 41 5f 5d e9 be 47 bc ff e8 e9 9b 56 ff 90 0f 0b 90 e9 d8 fe ff ff e8 db 9b 56 ff 90 0f 0b 90 e9 12 ff ff ff e8 cd 9b 56 ff 90 <0f> 0b 90 eb c7 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 0e fe ff ff
RSP: 0018:ffffc9000e557498 EFLAGS: 00010287
RAX: ffffffff82715143 RBX: 0000000000000008 RCX: 0000000000100000
RDX: ffffc90020802000 RSI: 0000000000000f7c RDI: 0000000000000f7d
RBP: 000000008271cf01 R08: ffffea00004e4607 R09: 1ffffd400009c8c0
R10: dffffc0000000000 R11: fffff9400009c8c1 R12: ffff888036fe1cc4
R13: ffff888036fe1c80 R14: ffffea00004e4600 R15: 0000000000000000
FS:  00007f2c7aed96c0(0000) GS:ffff88808c2bf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2c7a1d58e0 CR3: 0000000012a58000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 folio_invalidate mm/truncate.c:140 [inline]
 truncate_cleanup_folio+0xcb/0x190 mm/truncate.c:160
 truncate_inode_pages_range+0x2c1/0xd80 mm/truncate.c:404
 truncate_inode_pages mm/truncate.c:485 [inline]
 truncate_pagecache mm/truncate.c:798 [inline]
 truncate_setsize+0xcf/0xf0 mm/truncate.c:823
 ntfs_setattr+0x267/0x590 fs/ntfs3/file.c:739
 notify_change+0xbba/0xea0 fs/attr.c:556
 do_truncate+0x1c2/0x250 fs/open.c:68
 handle_truncate fs/namei.c:4300 [inline]
 do_open fs/namei.c:4841 [inline]
 path_openat+0x15b5/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2c79f9e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2c7aed8fe8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f2c7a226090 RCX: 00007f2c79f9e159
RDX: 0000000000109342 RSI: 0000200000000040 RDI: ffffffffffffff9c
RBP: 00007f2c7a03506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2c7a226128 R14: 00007f2c7a226090 R15: 00007ffe6ba73cd8
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
