Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9A812E1E0
	for <ntfs3@lists.linux.dev>; Wed, 27 Nov 2024 19:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732735895; cv=none; b=BzuFlpiqc57TG2uIY+HUjZ179M4smpO/27gHw+RBLa2w+VqJMk8W/VFc265ppRi4xnsNfyoHFxJMBMtfUzu/ETT3zc3SVfiJ63EaA5V5S4nEnikOcCSF/6IBRownsqW52jMgRIqyi9OBz5DQR2xTwC9Oya8fasCd6Phdml6fTO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732735895; c=relaxed/simple;
	bh=ZRWv/qJXWX0N+LmlrTPTdZNF7tI8MhRL5ijfHMRhmuI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RS4uD31CD3qD3JWR2AYuX2UQTzphBs8uFf0DvnREQZkKyYm+SNSBuSfgri0zdnifxWYqD8pn+xhU49T0Lc5WpeqcpC5DHgjGTMr20d9oDAsh4qh25KSJbxgX0iPa+6nwZUGnvgA9Hzl9gHu5YERlTtfwdjoxH9+Cwu6mkO1DV10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a7bdd00353so769605ab.1
        for <ntfs3@lists.linux.dev>; Wed, 27 Nov 2024 11:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732735892; x=1733340692;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nhvv+26YcoilaAxS4XzL863FzPGOjY6ajDUbRofaE8U=;
        b=bQxTK6llR4wfctwPmfIAOITeu7aki279SJ3hK3CkUROVkJjUAPFYZPIc56FhfD8tcA
         8RflI870P63G93csX6Bocx9IBsOQ/TliC2IX82XSBKInllVX93u3Sz5lTmsFl5PYzNiM
         1R053kXj7ajYokex0GSxnq4TguXCxzoRqYxBPI8O3wut6qjzb+w8JoUUhLTEBJAz+PVC
         jxCRbYyfXqExr2kHiaJQVPUQA4S+eAe3STaGbtsZ2GUSplFVyhiMV3TaUAXMkPh79bwt
         xrJMQqb2VocAnkzF1nkUURktIfYWY/r30C0UfQxAv8svz8qzxxbsjfudZtZPdzErUZDb
         Tj3g==
X-Forwarded-Encrypted: i=1; AJvYcCXX1LO8yjiNBKj62YyrpsloAYBPZIfSwZWZYxMNULgY589m7ThBiCWzzFYMjmh4TbCh4KGyGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTIyYg+K6A0a6pmQTfnKupgvoiw2j7w0E8WQvOA//kJnFU9zhm
	rUbSt7sjQ0T/QvwjVE/cJ0oEKksuOv0nLKdEl+R9plH5m/u+T02TbUQheXSGXt6ubMXqCPNMLRP
	+EZAHR0XLk9v/v+KSG1jgucyY/JD0rTL+pgF745xiWR6A38VONbwXNpU=
X-Google-Smtp-Source: AGHT+IGY8P0kD9Kmo8vCaJ0MVKVivQfixo468bFvt0QCfbxcippbtBDZm5OvuigToBSx0ngtAUJfslLcqQ6yvMLlfBYqp54CCWfp
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144a:b0:3a7:6f1c:a084 with SMTP id
 e9e14a558f8ab-3a7c55e2adfmr49463305ab.23.1732735892640; Wed, 27 Nov 2024
 11:31:32 -0800 (PST)
Date: Wed, 27 Nov 2024 11:31:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67477394.050a0220.21d33d.0026.GAE@google.com>
Subject: [syzbot] [ntfs3?] kernel panic: stack is corrupted in ntfs_printk
From: syzbot <syzbot+41821903c04037f57f20@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9f16d5e6f220 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=110e19c0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5073f0bff19a2470
dashboard link: https://syzkaller.appspot.com/bug?extid=41821903c04037f57f20
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130e19c0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1064f6e8580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-9f16d5e6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0b34c9010f21/vmlinux-9f16d5e6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fa5635896077/bzImage-9f16d5e6.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/d7a3b96e4e1b/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+41821903c04037f57f20@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Inode r=a is not in use!
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: ntfs_printk+0x415/0x420
CPU: 0 UID: 0 PID: 5379 Comm: syz-executor218 Not tainted 6.12.0-syzkaller-09073-g9f16d5e6f220 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 panic+0x349/0x880 kernel/panic.c:354
 __stack_chk_fail+0x15/0x20 kernel/panic.c:836
 ntfs_printk+0x415/0x420
 ntfs_read_mft fs/ntfs3/inode.c:86 [inline]
 ntfs_iget5+0x57c/0x37b0 fs/ntfs3/inode.c:537
 ntfs_fill_super+0x3e8e/0x4730 fs/ntfs3/super.c:1477
 get_tree_bdev_flags+0x48c/0x5c0 fs/super.c:1636
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3507
 do_mount fs/namespace.c:3847 [inline]
 __do_sys_mount fs/namespace.c:4057 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4034
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3c5f178d6a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 7e 09 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffedbe7c538 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffedbe7c540 RCX: 00007f3c5f178d6a
RDX: 0000000020000280 RSI: 0000000020000300 RDI: 00007ffedbe7c540
RBP: 0000000000000004 R08: 00007ffedbe7c580 R09: 000000000001f746
R10: 0000000000200001 R11: 0000000000000286 R12: 00007ffedbe7c580
R13: 0000000000000003 R14: 0000000000200000 R15: 00007ffedbe7c7d0
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


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
