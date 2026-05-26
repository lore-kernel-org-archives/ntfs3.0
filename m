Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E41DBB3A
	for <ntfs3@lists.linux.dev>; Tue, 26 May 2026 02:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763723; cv=none; b=RyuSQN8fHBLEYnCN4t9KNwi9nFGXOxODG6tDg7EOHi/2ZPuZDPkq9xkQl0EwVFtUawxlsRb4oTIkfXepFcEzyLD5cUHpO3WZ9ckUibE/yaEyNa4+xztOWrbzftZbxfESLgue3t490C48FXrkj8v5gcCRjWn5CQ94YG21jhTorS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763723; c=relaxed/simple;
	bh=kL6aSEuXmF6jtTKTPwr6lD0pSiR0U1yuehlcEzD02rg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=E6qzEKkb4GBHroChvvi8Jn3iUDAgLIbh/iNYtLHN6NB059kdr/f69y69eFHOtSYpkEJ2SSanE5/cTjw6XQQS+vX0cbzZMsl2f1wdMJewVdXzYnmiGvwuWSWBx0APnXfPuBhp4IV4xpopRUCYhnBAUoucZS5daq+GdvdBQrTdfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7dccbd50e3fso26336443a34.2
        for <ntfs3@lists.linux.dev>; Mon, 25 May 2026 19:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779763721; x=1780368521;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUZ90PtB8HkyI2qCAeo2d/QxvhOqJMMwNE6wvVCwiVo=;
        b=DeDTdgkIbLZVak1SX/CeOgXxTQbSlV2OrhdmIdIWsEVnkRW3xxCwfwxr8TVBCkg5ur
         6NN8WsI4nEYCh/BqB2I3TWuuHsAZXHf09h+Yt+/KZbYkbrHvdvHzZVqBdrI4gk78Zl7p
         2zDfUkqflp41LugonachZ+1wSuyEDsEtGg4TQBLE7q5/++b6hhBeS5gTHMZuPitUD/VF
         /SI3VkZ4FGdFRg//a0/sTv8Hx+jPJeRn0TY1sIyHKmv5+OKn7qKaw0aovlKTdcM4lRKD
         sDPtEAEkcqeA7fk7koik+VlrkbRCNOB50wlGrJsMNkKqKD51oiIUkpM2uVnwCNUWSmGb
         SbBg==
X-Forwarded-Encrypted: i=1; AFNElJ/Wug+xKfm9W9At7Kxv/zjx+8SgtYLAEOcLRJYngzsndd472nu/SUZAgli51H8B7MuLmNyFbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YySyBj2AILMwjJiVS6NKVspdnFOpnqmXmEDBzwWYwC9PaqEfXgt
	HIAoQumsQMInq/m2ioMWyPz6vUEXLweM/AXVLXK8a7jvs9m8sfSNKBB4ImKQP0cipeGp7sINmhB
	nbMQw4JIytf8kHzgaAMbvrktd0q16fRDftYQBG9TPfEyk13PCh2+ms/jGoc8=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:152a:b0:696:924c:43cc with SMTP id
 006d021491bc7-69d7ecd6832mr9160881eaf.47.1779763721076; Mon, 25 May 2026
 19:48:41 -0700 (PDT)
Date: Mon, 25 May 2026 19:48:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a150a09.820a0220.e7972.0005.GAE@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in ni_seek_data_or_hole
From: syzbot <syzbot+c2cfe997245202e46f10@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cca95436be15 Merge tag 'phy-fixes-7.1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e36d6a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91978e795dcd971b
dashboard link: https://syzkaller.appspot.com/bug?extid=c2cfe997245202e46f10
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147dad96580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=140c2cec580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fb3ceeccf5bc/disk-cca95436.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/af588c0672f1/vmlinux-cca95436.xz
kernel image: https://storage.googleapis.com/syzbot-assets/beac806b38fd/bzImage-cca95436.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/7ca9c62c48ea/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c2cfe997245202e46f10@syzkaller.appspotmail.com

ntfs3(loop0): Mark volume as dirty due to NTFS errors
ntfs3(loop0): ino=1a, mi_enum_attr
ntfs3(loop0): ino=1a, mi_enum_attr
ntfs3(loop0): Failed to initialize $Extend/$Reparse.
=====================================================
BUG: KMSAN: uninit-value in ni_seek_data_or_hole+0x24f/0x5f0 fs/ntfs3/frecord.c:2862
 ni_seek_data_or_hole+0x24f/0x5f0 fs/ntfs3/frecord.c:2862
 ntfs_llseek+0x22a/0x4a0 fs/ntfs3/file.c:1530
 vfs_llseek fs/read_write.c:391 [inline]
 ksys_lseek fs/read_write.c:404 [inline]
 __do_sys_lseek fs/read_write.c:414 [inline]
 __se_sys_lseek fs/read_write.c:412 [inline]
 __x64_sys_lseek+0x29d/0x460 fs/read_write.c:412
 x64_sys_call+0x3004/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:9
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ni_seek_data_or_hole+0x248/0x5f0 fs/ntfs3/frecord.c:2862
 ntfs_llseek+0x22a/0x4a0 fs/ntfs3/file.c:1530
 vfs_llseek fs/read_write.c:391 [inline]
 ksys_lseek fs/read_write.c:404 [inline]
 __do_sys_lseek fs/read_write.c:414 [inline]
 __se_sys_lseek fs/read_write.c:412 [inline]
 __x64_sys_lseek+0x29d/0x460 fs/read_write.c:412
 x64_sys_call+0x3004/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:9
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable lcn created at:
 ni_seek_data_or_hole+0x72/0x5f0 fs/ntfs3/frecord.c:2851
 ntfs_llseek+0x22a/0x4a0 fs/ntfs3/file.c:1530

CPU: 0 UID: 0 PID: 5901 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
=====================================================


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
