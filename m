Received: from mail-oa1-f77.google.com (mail-oa1-f77.google.com [209.85.160.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A046265CA6
	for <ntfs3@lists.linux.dev>; Mon, 19 Jan 2026 21:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768859784; cv=none; b=BP8f7pmA2ec/GB2hcONoFY12TbzpW3IzfJUnovKYYGqpwrQ43WS0iheB+yQTLHnE0s4HqwGYMVv8r8ipT00PRu0Qhu7YXWNsGBZHuQFsVM3X2WnRQtMgKOU2k/EwTibTwNczP2G+1qO0MvqTYUJRYRgiT9cuNBvJrBDx0FnXk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768859784; c=relaxed/simple;
	bh=Kn6jNejF8TfF6gx4Fxyxjr9GOrAQlqgV30WqNjSqXns=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=u1Cj1VqlSZs98+vFltqiKSRCf2qACfvXfMldHz3Aak7n0GSY5dK1aHPdv9SiVJPEVMzv1r7bQBjHqcfSwz37kry3L+blcPxlIZGUEMQcf/SMAQ8/6hKuLR2UAgi8kGiJ7bS27eQIx77gvuRaKaAOPXAb8XsTGfgoXLSZvoBCmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f77.google.com with SMTP id 586e51a60fabf-4081db82094so2150822fac.0
        for <ntfs3@lists.linux.dev>; Mon, 19 Jan 2026 13:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768859782; x=1769464582;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jp/Lfz677VBj1js+mMXnM+kqqap/0pn0kBaukZd5Tbo=;
        b=V3UqH3Bz8mxqUF2EMnaiTSKEAUIlOpBie817TycF+KoZcE2655OJg3D9cmN/7+VkZV
         TU1+u6ts1341EQ1dPCAPsPb3fvQziloB4dxsWFUd1d7T/qjS6EurDRVfbf1ODWI0Cz9e
         Gwa+ZfY4Pr5Wr4j/p0q2P/EBzFrUjF9p6ZifimQ3Dsxvm83sr0zDndsMTpUv6g6XCQdS
         O9l5Y/Mt+Td5Je2AlYXjplO5XkCEGU2qG/Njq2eO1+jrBsWKKH6GspaBUy23D1zBD2SF
         yEFAKqhx9+qNkBqf70Ui8ApwJsayim1h+HxMG2GE/ohfqvCATm0forhLyvMmkKJxnYIz
         2ZMg==
X-Forwarded-Encrypted: i=1; AJvYcCUnhWgqQaiYm8S+z1ipuLr6NXtorhsx2KKuH283SgOfI4XLtAhougdmiPYX9uOFtAATH+qv6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXZdrhHXZ2wcslCzaUc6O/JuE2klaXtQq5irdmXk96+4ZEtPWu
	2Y6p8ShJ8OrhatsdiHQ4eyRSK9FvB+i5s2O4+dQF0tQQasiXFA9mBuSJBiom1O7bnmP7ANFeY9k
	uVwo1jmpkSoGN/32TlqonsZXw5D24hjMFFftW0PIh5Z3PaEMgbthaTjl4ApE=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4dfc:b0:659:9a49:8f50 with SMTP id
 006d021491bc7-6611796e390mr5635303eaf.21.1768859782049; Mon, 19 Jan 2026
 13:56:22 -0800 (PST)
Date: Mon, 19 Jan 2026 13:56:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696ea886.a70a0220.34546f.04b8.GAE@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in ntfs_read_hdr (4)
From: syzbot <syzbot+2472d48b2d3b2a23a570@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    944aacb68baf Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12df639a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=46b5f80a6e7aaa5c
dashboard link: https://syzkaller.appspot.com/bug?extid=2472d48b2d3b2a23a570
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/03220b1ed649/disk-944aacb6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fd271cb09457/vmlinux-944aacb6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dec6d1fd9015/bzImage-944aacb6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2472d48b2d3b2a23a570@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ntfs_dir_emit fs/ntfs3/dir.c:335 [inline]
BUG: KMSAN: uninit-value in ntfs_read_hdr+0xfcc/0x13e0 fs/ntfs3/dir.c:384
 ntfs_dir_emit fs/ntfs3/dir.c:335 [inline]
 ntfs_read_hdr+0xfcc/0x13e0 fs/ntfs3/dir.c:384
 ntfs_readdir+0xf21/0x1a30 fs/ntfs3/dir.c:495
 iterate_dir+0x452/0x620 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0x17e/0x550 fs/readdir.c:396
 __x64_sys_getdents64+0x97/0xe0 fs/readdir.c:396
 x64_sys_call+0x3cef/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:218
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd3/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_read_run_nb+0x7cf/0x1810 fs/ntfs3/fsntfs.c:1232
 ntfs_read_bh+0x6a/0xc00 fs/ntfs3/fsntfs.c:1293
 indx_read+0x450/0x1840 fs/ntfs3/index.c:1067
 ntfs_readdir+0xddf/0x1a30 fs/ntfs3/dir.c:490
 iterate_dir+0x452/0x620 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:410 [inline]
 __se_sys_getdents64+0x17e/0x550 fs/readdir.c:396
 __x64_sys_getdents64+0x97/0xe0 fs/readdir.c:396
 x64_sys_call+0x3cef/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:218
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd3/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_write_bh+0x6ae/0xe90 fs/ntfs3/fsntfs.c:1437
 indx_write fs/ntfs3/index.c:1027 [inline]
 indx_delete_entry+0x27cc/0x8890 fs/ntfs3/index.c:2347
 ni_remove_name+0x33d/0xdb0 fs/ntfs3/frecord.c:2805
 ni_rename+0x170/0x220 fs/ntfs3/frecord.c:2965
 ntfs_rename+0xdd2/0x1290 fs/ntfs3/namei.c:332
 vfs_rename+0x2138/0x2640 fs/namei.c:5938
 do_renameat2+0xb7f/0x15a0 fs/namei.c:6056
 __do_sys_rename fs/namei.c:6099 [inline]
 __se_sys_rename fs/namei.c:6097 [inline]
 __x64_sys_rename+0xd7/0x140 fs/namei.c:6097
 x64_sys_call+0x2c5/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd3/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_read_run_nb+0x7cf/0x1810 fs/ntfs3/fsntfs.c:1232
 ntfs_read_bh+0x6a/0xc00 fs/ntfs3/fsntfs.c:1293
 indx_read+0x450/0x1840 fs/ntfs3/index.c:1067
 indx_find+0xa80/0x1510 fs/ntfs3/index.c:1179
 indx_delete_entry+0x11bd/0x8890 fs/ntfs3/index.c:2311
 ni_remove_name+0x33d/0xdb0 fs/ntfs3/frecord.c:2805
 ni_rename+0x170/0x220 fs/ntfs3/frecord.c:2965
 ntfs_rename+0xdd2/0x1290 fs/ntfs3/namei.c:332
 vfs_rename+0x2138/0x2640 fs/namei.c:5938
 do_renameat2+0xb7f/0x15a0 fs/namei.c:6056
 __do_sys_rename fs/namei.c:6099 [inline]
 __se_sys_rename fs/namei.c:6097 [inline]
 __x64_sys_rename+0xd7/0x140 fs/namei.c:6097
 x64_sys_call+0x2c5/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd3/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_write_bh+0x6ae/0xe90 fs/ntfs3/fsntfs.c:1437
 indx_write fs/ntfs3/index.c:1027 [inline]
 indx_insert_into_buffer+0x287/0x2010 fs/ntfs3/index.c:1819
 indx_insert_entry+0xcde/0x1050 fs/ntfs3/index.c:1997
 ni_add_name+0xef7/0x11e0 fs/ntfs3/frecord.c:2931
 ni_rename+0x97/0x220 fs/ntfs3/frecord.c:2962
 ntfs_rename+0xdd2/0x1290 fs/ntfs3/namei.c:332
 vfs_rename+0x2138/0x2640 fs/namei.c:5938
 do_renameat2+0xb7f/0x15a0 fs/namei.c:6056
 __do_sys_rename fs/namei.c:6099 [inline]
 __se_sys_rename fs/namei.c:6097 [inline]
 __x64_sys_rename+0xd7/0x140 fs/namei.c:6097
 x64_sys_call+0x2c5/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd3/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 hdr_insert_de+0x4c8/0x550 fs/ntfs3/index.c:838
 indx_insert_into_buffer+0x1b6/0x2010 fs/ntfs3/index.c:1815
 indx_insert_entry+0xcde/0x1050 fs/ntfs3/index.c:1997
 ni_add_name+0xef7/0x11e0 fs/ntfs3/frecord.c:2931
 ni_rename+0x97/0x220 fs/ntfs3/frecord.c:2962
 ntfs_rename+0xdd2/0x1290 fs/ntfs3/namei.c:332
 vfs_rename+0x2138/0x2640 fs/namei.c:5938
 do_renameat2+0xb7f/0x15a0 fs/namei.c:6056
 __do_sys_rename fs/namei.c:6099 [inline]
 __se_sys_rename fs/namei.c:6097 [inline]
 __x64_sys_rename+0xd7/0x140 fs/namei.c:6097
 x64_sys_call+0x2c5/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd3/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4960 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 kmem_cache_alloc_noprof+0x970/0x1750 mm/slub.c:5270
 ntfs_rename+0x874/0x1290 fs/ntfs3/namei.c:307
 vfs_rename+0x2138/0x2640 fs/namei.c:5938
 do_renameat2+0xb7f/0x15a0 fs/namei.c:6056
 __do_sys_rename fs/namei.c:6099 [inline]
 __se_sys_rename fs/namei.c:6097 [inline]
 __x64_sys_rename+0xd7/0x140 fs/namei.c:6097
 x64_sys_call+0x2c5/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd3/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 14265 Comm: syz-executor Tainted: G             L      syzkaller #0 PREEMPT(none) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
=====================================================


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
