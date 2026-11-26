Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688019;
	b=12YbTEIoOD9ojVSSkUP5IuCOEaFQ+oWRdG+p+WEsWn6lLW0LEb4broURw244QuhfXqm4
	 aVUOeFYbqz7ZB36alByjVYffwCV6X5qWcE5eUDJXVuJpMRwmGt5MRrA3n2CHo85xOkese
	 TD/sSQas/wBezOHhV1cYxuCYSH40RNjYZ7J8WQupvaWx+azm10TqI/vINd9wbyk88ugNY
	 CZsJ+S8uTDH2fIr9GMX+bIimaMqQwka42dkkuBPfgicUjRrBg1NW5jQpyH8qk0NLDQaar
	 xFAlos0X/RYOggVYXxslHr1LvTNCnGVtXWcStiAsWKAp591rT53DpJ8Kq5eSTfQJ2Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688019;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=eDOw2KMS/cQxr+9kxLatH3BnA+Od/vODQKnNV4wT5DY=;
	b=s6GO5oq5UVWkpFAzZNzalONfqbE2BIX5I23jTQxfe8g8+jJvM9RPGA/JdOC1UzZQ/SuQ
	 cW2xwP8AL8UXtghR/DHmJSa5aNf9qK6iDNk/XknuvNyeXWtU4GqaVxOoslxWAYU8AUpbA
	 mqXGllpS6U8uIOYgav9+dS5ofJKoU+VIK3suO9e/6uUlMsNjK8+uvrmMJ4tPPvakOIqAM
	 Ldd1uh3jONa7XeWFJBLfHEkt4NOTXwv7xa3zTPBSBuyP5IsDmmJhESjBbju9Wm4EB4Oiw
	 aPbzhH193doIjLUamBVQAI7GY2/Ue+0lyKpSbQ9oMo9AyxqV3WE1i2ivPJ/uOCOuVNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C89606A68B
	for <ntfs3@lists.linux.dev>; Thu, 26 Nov 2026 10:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C89606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c734afb8deso6663510b6e.1
        for <ntfs3@lists.linux.dev>; Thu, 26 Nov 2026 02:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688018; x=1796292818;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDOw2KMS/cQxr+9kxLatH3BnA+Od/vODQKnNV4wT5DY=;
        b=NZLNqkxXU+fp2kwSz13SMLdRzYYUqsSGy4nwDQd8wV7WPcncOXMD027avQpIl1oJAn
         RFJoRR1GTrb/TS/CvT6MGvwjSbe2DQR/UBQP0+r0xQWVwMh/DMwhTAwSheHIznMZZRqz
         4Ij0dC9BlOdlaYrGaqzZvRhxFMwQJCEV2hCj2IA/97K1DqOamMt7QaXi5vBS94jYAK60
         4vKPdHijm8TWtYvQBaQJ8zpHFSmzKC1AgqErDpn87iTsoov8fOBwcu2n0XFEuME7gAVO
         aPvL4tHSKX+ysqPG2OhchAguFB59RtMH8qu2Xgni0egrzIWZBuev89NDV0Vfec26dWMG
         /+XQ==
X-Forwarded-Encrypted: i=1; AL+hErFEeu0lxxblYQf4YEdru36+oGUZBkhHvYkIQ/yRLd4vdu+spC9gTis/Az29diPQa2wbjsk3Xw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9x2P0ewimHjWFkfYyRcsYQE2c0nGStOX5VP/j0I103ZEhJ1b6W
	jXVgozM+/30ccy1z2+7F8IFrmzbjgMpk4PzqsS7La7tv8GHCud9HiJ2gSaO1ATBBkZV0YlTouGP
	uE0XrLwVhvg29YQmhEjqbaBpuz/v64Wvn3WoTKGGdiGvw3MUskAufYktJ7qg=
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3189:b0:573:8745:a99c with SMTP id
 5614622812f47-57a0d0ee78amr22521450b6e.62.1795688018231; Thu, 26 Nov 2026
 02:13:38 -0800 (PST)
Date: Thu, 26 Nov 2026 02:13:38 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b080652.1fb41460.314c8.006f.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING: proc registration bug in ntfs_put_super
From: syzbot <syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ebb7a8dc1e74 Merge tag 'soc-fixes-7.4' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13725b09580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbd0fc734eea62ed
dashboard link: https://syzkaller.appspot.com/bug?extid=d7aeb9ab7b1cc022914e
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10946465580000

The issue was bisected by AI to:

commit 7832e123490ac39f85ab5befc2ceee7b25b03acb
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon May 8 09:39:45 2023 +0000

    fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label

reasoning:      https://syzkaller.appspot.com/ai_job?id=2815bb40-6080-44ed-9e96-97f475975445

AI-generated root cause summary:
In fs/ntfs3/super.c, ntfs_create_procdir() calls proc_mkdir() to create
sbi->procdir and then calls proc_create_data() for "volinfo" and "label" without
checking whether those calls return NULL (such as on allocation failure in
__proc_create()). Because sbi->procdir is still assigned unconditionally, later
superblock teardown in ntfs_put_super() -> ntfs_remove_procdir() unconditionally
calls remove_proc_entry() for both "label" and "volinfo". When a missing entry
is passed to remove_proc_entry(), pde_subdir_find() returns NULL and triggers
WARN(1, "name '%s'\n", name) at fs/proc/generic.c:742.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=d7aeb9ab7b1cc022914e

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d7aeb9ab7b1cc022914e@syzkaller.appspotmail.com

The bisection result may be wrong.
If you agree with it, please also add:
Fixes: 7832e123490a ("fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label")

R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000003 R14: 00007fffc71496c0 R15: 00007fffc7149660
 </TASK>
------------[ cut here ]------------
name 'label'
WARNING: fs/proc/generic.c:742 at remove_proc_entry+0x35a/0x690 fs/proc/generic.c:742, CPU#0: syz-executor148/5678
Modules linked in:
CPU: 0 UID: 0 PID: 5678 Comm: syz-executor148 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:remove_proc_entry+0x35f/0x690 fs/proc/generic.c:742
Code: ff e9 14 ff ff ff e8 60 2a 46 ff eb 05 e8 59 2a 46 ff 48 c7 c7 a0 70 33 90 e8 6d f1 8b 09 48 8d 3d 06 a8 41 0f 48 8b 74 24 08 <67> 48 0f b9 3a 48 83 c4 20 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc
RSP: 0018:ffffc90002d4fc68 EFLAGS: 00010286
RAX: 8000000000000000 RBX: ffff888013bd6000 RCX: ffffffff9becba01
RDX: 0000000000000001 RSI: ffffffff8c687660 RDI: ffffffff91c4d1d0
RBP: 0000000000000005 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff520005a9f7c R12: 0000000000000000
R13: ffff888013bb9e9b R14: 0000000000000007 R15: dffffc0000000000
FS:  00005555807b4400(0000) GS:ffff88808a9e9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbebe2a8460 CR3: 0000000042059000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 ntfs_remove_procdir fs/ntfs3/super.c:650 [inline]
 ntfs_put_super+0x7a/0xf0 fs/ntfs3/super.c:771
 generic_shutdown_super+0x140/0x2d0 fs/super.c:723
 kill_block_super+0x44/0xa0 fs/super.c:1852
 ntfs3_kill_sb+0x41/0x60 fs/ntfs3/super.c:1997
 deactivate_locked_super+0xbe/0x110 fs/super.c:558
 cleanup_mnt+0x204/0x2a0 fs/namespace.c:1396
 task_work_run+0x1d9/0x260 kernel/task_work.c:233
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 __exit_to_user_mode_loop kernel/entry/common.c:70 [inline]
 exit_to_user_mode_loop+0x204/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x336/0x540 arch/x86/entry/syscall_64.c:107
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd4fdc78817
Code: bf 41 4d 56 53 b8 9d 00 00 00 0f 05 83 f8 ea 75 a2 c7 05 54 88 08 00 00 00 00 00 eb 96 e8 61 08 00 00 90 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007fffc7149628 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000087 RCX: 00007fd4fdc78817
RDX: 0000000000000002 RSI: 0000000000000001 RDI: 00007fd4fdcd40ad
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000003 R14: 00007fffc71496c0 R15: 00007fffc7149660
 </TASK>
----------------
Code disassembly (best guess):
   0:	ff                   	ljmp   (bad)
   1:	e9 14 ff ff ff       	jmp    0xffffff1a
   6:	e8 60 2a 46 ff       	call   0xff462a6b
   b:	eb 05                	jmp    0x12
   d:	e8 59 2a 46 ff       	call   0xff462a6b
  12:	48 c7 c7 a0 70 33 90 	mov    $0xffffffff903370a0,%rdi
  19:	e8 6d f1 8b 09       	call   0x98bf18b
  1e:	48 8d 3d 06 a8 41 0f 	lea    0xf41a806(%rip),%rdi        # 0xf41a82b
  25:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 20          	add    $0x20,%rsp
  33:	5b                   	pop    %rbx
  34:	41 5c                	pop    %r12
  36:	41 5d                	pop    %r13
  38:	41 5e                	pop    %r14
  3a:	41 5f                	pop    %r15
  3c:	5d                   	pop    %rbp
  3d:	c3                   	ret
  3e:	cc                   	int3
  3f:	cc                   	int3


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#ai-bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
