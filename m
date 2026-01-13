Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500311DF248
	for <ntfs3@lists.linux.dev>; Tue, 13 Jan 2026 01:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267889; cv=none; b=sOaaxwGOuC2tzQ1qCHL9EhP9ljhoccZ6GKVHokXDCmxoypjlrfEquA7D3x3NEQC5/Pu6Ng4ddE1/+td4D7X72IDVRUsg1Ggj5o3fpyUkl/me/rk7d/FTalEyDFZuL0krNvnJ0/5M8IcOpizHPFMcubhAsG8lMNCCJJWmpf/o+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267889; c=relaxed/simple;
	bh=riW4uijjcMisS2f/3pFvPdEKgbi13sFq/B/f2fPHirg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HL2RSpAM9T9qrYD1Od/m1we7lreB+4GSEds6fajWEcvC3T8/PVrXkpWuRufPeuD7t+OoVspd4o3tleyO+lXWb4VYIP2eWhXrRdALbTq2UcqlTDnzh1Vylwpyi+x4+azwpyK+bYuU2DCaTB0E7iC0xJwbRyqfraA0DcAtYPELq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-45a20cdf2acso14808464b6e.1
        for <ntfs3@lists.linux.dev>; Mon, 12 Jan 2026 17:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267886; x=1768872686;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/68AW9PHlPDybFoeudpzj4+h2MlzYJBM0OLhc0ZZZw=;
        b=Y2qrnmGZxiu6hUqZU7XpbctjQ3a1R+8jShIa0s0loS8fTbyEELOjtx6TZkZ3JHdc5B
         Ba3eQuzgJ1FraH+uQWYh499QU60ymNXyqq1I++4QmwZtr2VfInPdiwLR0913LyOdVOQq
         hTofUuowy7BIYfY8ukc175m+TDCHkO61LjqT0kvHhDaxqrmYvmBLugLQvXSUJXyX2CN2
         t4N2+MA07hVlcUYzfn4++iyuO1kSqt7wLyCYHTqXvoMbf5wvN/Ou+5seqJSa9A3vRDB9
         F0utkp306DotDXaMlFSqJwae/ccvjAeQAPx4mYFZmDQHUDynnyMbJR1EnbhsaV3rAon0
         xyLw==
X-Forwarded-Encrypted: i=1; AJvYcCVi+gnxIs8AAAuHfS4YivniD10/aZcLTUH8RiqRDARkeZNzza2QHQhuEHt0N76I4kE3nCjcbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMHjaKPEezlKXUqbDlT0cmTHd+MX3MtKUjkqgZ/4XlkhYXZLaA
	ofPExcKY9gzI+s4WY74CnqjkVDT3k2lG+4ywhZ5VS4YSdnzKEv14IaT7LTJWizirdxFTx5PFXju
	8fFIM80h+cY1G8GKX1rIOLAxVgztxo92Ei27Bw+7QEBGymGdm+z51sTkBYDU=
X-Google-Smtp-Source: AGHT+IH5Txq9/TLBbmVyTXw51nT+n2Usklq5aM+wudM8d3pBJHV275t6YxeJ1ZgOaopmIUmQPsYPlIIoFZ+P8PCe0iJBWeqSSoY9
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:440c:b0:65f:6667:ca54 with SMTP id
 006d021491bc7-65f6667d15amr5856989eaf.55.1768267886058; Mon, 12 Jan 2026
 17:31:26 -0800 (PST)
Date: Mon, 12 Jan 2026 17:31:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6965a06e.050a0220.38aacd.0003.GAE@google.com>
Subject: [syzbot] [ntfs3?] kernel BUG in folio_set_bh (2)
From: syzbot <syzbot+9c4e33e12283d9437c25@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    54e82e93ca93 Merge tag 'core_urgent_for_v6.19_rc4' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15df619a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
dashboard link: https://syzkaller.appspot.com/bug?extid=9c4e33e12283d9437c25
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14eac5fa580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107ad19a580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-54e82e93.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f3befb5f53a4/vmlinux-54e82e93.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92820ca1dbd8/bzImage-54e82e93.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/16357ad8c17b/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9c4e33e12283d9437c25@syzkaller.appspotmail.com

ntfs3: block size(32768) > page size(4096) not supported by filesystem
------------[ cut here ]------------
kernel BUG at fs/buffer.c:1582!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5660 Comm: syz.0.28 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:folio_set_bh+0x1dc/0x1e0 fs/buffer.c:1582
Code: 4c 89 e2 e8 a6 8f 7b 02 e9 42 ff ff ff e8 dc 0f 74 ff 48 89 df 48 c7 c6 80 8a 7a 8b e8 0d 0f db fe 90 0f 0b e8 c5 0f 74 ff 90 <0f> 0b 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
RSP: 0018:ffffc9000365f938 EFLAGS: 00010293
RAX: ffffffff824cf79b RBX: ffffea000161a100 RCX: ffff888042f38000
RDX: 0000000000000000 RSI: 0000000000001000 RDI: 0000000000001000
RBP: dffffc0000000000 R08: ffffea000161a107 R09: 1ffffd40002c3420
R10: dffffc0000000000 R11: fffff940002c3421 R12: 0000000000000000
R13: 0000000000001000 R14: ffff888048834658 R15: 0000000000001000
FS:  00005555565a0500(0000) GS:ffff88808d414000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fad523b5000 CR3: 00000000529ff000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 folio_alloc_buffers+0x3a0/0x640 fs/buffer.c:946
 grow_dev_folio fs/buffer.c:1075 [inline]
 grow_buffers fs/buffer.c:1116 [inline]
 __getblk_slow fs/buffer.c:1134 [inline]
 bdev_getblk+0x2cc/0x6e0 fs/buffer.c:1461
 __bread_gfp+0x89/0x3b0 fs/buffer.c:1515
 sb_bread include/linux/buffer_head.h:346 [inline]
 romfs_blk_read fs/romfs/storage.c:114 [inline]
 romfs_dev_read+0x22b/0x350 fs/romfs/storage.c:229
 romfs_fill_super+0x20e/0x720 fs/romfs/super.c:486
 get_tree_bdev_flags+0x40e/0x4d0 fs/super.c:1691
 vfs_get_tree+0x92/0x2a0 fs/super.c:1751
 fc_mount fs/namespace.c:1199 [inline]
 do_new_mount_fc fs/namespace.c:3636 [inline]
 do_new_mount+0x302/0xa10 fs/namespace.c:3712
 do_mount fs/namespace.c:4035 [inline]
 __do_sys_mount fs/namespace.c:4224 [inline]
 __se_sys_mount+0x313/0x410 fs/namespace.c:4201
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f99b118f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffee29d558 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f99b13e5fa0 RCX: 00007f99b118f7c9
RDX: 0000200000000000 RSI: 00002000000001c0 RDI: 0000200000000140
RBP: 00007f99b1213f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000008000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f99b13e5fa0 R14: 00007f99b13e5fa0 R15: 0000000000000005
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:folio_set_bh+0x1dc/0x1e0 fs/buffer.c:1582
Code: 4c 89 e2 e8 a6 8f 7b 02 e9 42 ff ff ff e8 dc 0f 74 ff 48 89 df 48 c7 c6 80 8a 7a 8b e8 0d 0f db fe 90 0f 0b e8 c5 0f 74 ff 90 <0f> 0b 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
RSP: 0018:ffffc9000365f938 EFLAGS: 00010293
RAX: ffffffff824cf79b RBX: ffffea000161a100 RCX: ffff888042f38000
RDX: 0000000000000000 RSI: 0000000000001000 RDI: 0000000000001000
RBP: dffffc0000000000 R08: ffffea000161a107 R09: 1ffffd40002c3420
R10: dffffc0000000000 R11: fffff940002c3421 R12: 0000000000000000
R13: 0000000000001000 R14: ffff888048834658 R15: 0000000000001000
FS:  00005555565a0500(0000) GS:ffff88808d414000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000c0094f8000 CR3: 00000000529ff000 CR4: 0000000000352ef0


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
