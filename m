Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3D12EBEA
	for <ntfs3@lists.linux.dev>; Mon, 25 Nov 2024 06:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732514782; cv=none; b=tXV9xif/V3DAXj/NCJf2tXvkhonsInkN998NJmANNfKutz7Y3qnGXejgMPE7bo04MRyUxivAA8aaSKO0vDjupru50t9TgeNQzEYCHBzEYka1Y9sTwlACMqjr+mzsECoevfr7lkD/2DrqMkcUO79ZpvFoVTrz71T4LG8f8Q84K0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732514782; c=relaxed/simple;
	bh=dbpMDU+DsDsqDElPnnxlWLacPZr/lK42L0xWidSAtNY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Qa91JmHAAUo8J6NPFdsmLnW5B4TufiHyq6p6BaJ5I+FSRBcJEOIWgigVg4DAPF7IsoUWLWIdHDSEhCQJUCxv8EMF/BeS9CZ6ZbSWzsYOvLEOEoa/EzJRDgcJ6Ze2AtBwhfwE7+jzPi86n9KHZfgMsjO0wpQhLekvrRPmCS/3CkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a7634d8538so35645955ab.0
        for <ntfs3@lists.linux.dev>; Sun, 24 Nov 2024 22:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732514780; x=1733119580;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/0udwzHRAZOx42Ocia3+r90+WJKvYBlSbpi+6hSjDDw=;
        b=Ep5RWedsZ43hq2RaM6ieuKO13BPcDCIaGTir7Tid7qliHi3/kDpbnSzeWMdutJejpD
         z/i6H303Brm58ptop9R7CslcHoaaL0VXK7tvj+LwzjJPqLM7Lf1KSgmrGJyNoU/Zj8JA
         DA+MvVIkL7VwxShadn53lntl6rF4AJ3HDsV7AJ76RYHWTBTHMKWOdjnLYf6FSYIkHVMQ
         Hlg3EFSoGO/L/x+3BJCf+i8TP9D9Y6za3jjkgw0PYRTJdPZSgCYjEB7oWy2nG6WiNLZR
         6AtAWUkEWpV4Z9czze5U/Z7LrSaWrZvK57P6Cakf+MHmerFE59oFE4rdePek4V3iqmK8
         O0TA==
X-Forwarded-Encrypted: i=1; AJvYcCXMVX254qUUp/gzpWUgi0mlqulPDmp/KQJgVoD8aWm8i5zhIMZyaAuN1xkCjsYFbD9RBu+lyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHqpbm2ugMKdkV8BEQ9SEHtAWlNMv8dQfdkPLTKY9SLij7Ov2r
	PQ2YGZYbS9R13JkOY1SWK4L5AwPI6CAHNE0euYeuMwbOALCfurzSY6ySC+BuA/hym+vzAiCZ+KJ
	TqnV8bqXHYDzw0++WQ5RPxpqgV9Ok61bMOSm5A5/Nq63VNz6QVelwYzw=
X-Google-Smtp-Source: AGHT+IGHThF0v1L6mtVYydkAbvpCLhNIRgSMel8vL13Z9H2C+40tqw7/n1+LUokDLA7RirIGGHfc0KrZ2+rRZi2TrLk9O8h+G4Ux
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c83:b0:3a7:7f3f:dfba with SMTP id
 e9e14a558f8ab-3a79afda063mr104576935ab.22.1732514780141; Sun, 24 Nov 2024
 22:06:20 -0800 (PST)
Date: Sun, 24 Nov 2024 22:06:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <674413dc.050a0220.1cc393.0062.GAE@google.com>
Subject: [syzbot] [ntfs3?] BUG: unable to handle kernel paging request in
 evict (2)
From: syzbot <syzbot+34226167ebf8da2171a9@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9f16d5e6f220 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c5a530580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e92fc420ca55fe33
dashboard link: https://syzkaller.appspot.com/bug?extid=34226167ebf8da2171a9
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164fc778580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103725c0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c9f905470542/disk-9f16d5e6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5b4c9cc530ec/vmlinux-9f16d5e6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e0f262e4c35e/bzImage-9f16d5e6.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3621c08f2ff6/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+34226167ebf8da2171a9@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0100000001: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: probably user-memory-access in range [0x0000000800000008-0x000000080000000f]
CPU: 0 UID: 0 PID: 5831 Comm: syz-executor339 Not tainted 6.12.0-syzkaller-09073-g9f16d5e6f220 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:__hlist_del include/linux/list.h:990 [inline]
RIP: 0010:hlist_del_init_rcu include/linux/rculist.h:184 [inline]
RIP: 0010:__remove_inode_hash fs/inode.c:671 [inline]
RIP: 0010:remove_inode_hash include/linux/fs.h:3226 [inline]
RIP: 0010:evict+0x64f/0x9a0 fs/inode.c:804
Code: 4c 89 ff e8 b3 23 e5 ff 4d 89 27 4d 85 e4 74 61 e8 b6 6b 7d ff 49 83 c4 08 4c 89 e0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 e7 e8 83 23 e5 ff 4d 89 3c 24 eb 38 e8 88
RSP: 0018:ffffc90003df7b00 EFLAGS: 00010202
RAX: 0000000100000001 RBX: 1ffff1100ee5d305 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffc90003df7a80
RBP: ffffc90003df7c30 R08: 0000000000000003 R09: fffff520007bef50
R10: dffffc0000000000 R11: fffff520007bef50 R12: 0000000800000008
R13: ffff8880772e9720 R14: ffff8880772e9828 R15: ffffc90000c35860
FS:  0000555577e623c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555577e6b738 CR3: 0000000075cf6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dispose_list fs/inode.c:845 [inline]
 evict_inodes+0x6f6/0x790 fs/inode.c:899
 generic_shutdown_super+0xa0/0x2d0 fs/super.c:627
 kill_block_super+0x44/0x90 fs/super.c:1710
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
 task_work_run+0x24f/0x310 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x13f/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0cfeb244a7
Code: 08 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b0 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007fff0d0cb848 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f0cfeb244a7
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007fff0d0cb900
RBP: 00007fff0d0cb900 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000206 R12: 00007fff0d0cc9c0
R13: 0000555577e63700 R14: 431bde82d7b634db R15: 00007fff0d0cc964
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__hlist_del include/linux/list.h:990 [inline]
RIP: 0010:hlist_del_init_rcu include/linux/rculist.h:184 [inline]
RIP: 0010:__remove_inode_hash fs/inode.c:671 [inline]
RIP: 0010:remove_inode_hash include/linux/fs.h:3226 [inline]
RIP: 0010:evict+0x64f/0x9a0 fs/inode.c:804
Code: 4c 89 ff e8 b3 23 e5 ff 4d 89 27 4d 85 e4 74 61 e8 b6 6b 7d ff 49 83 c4 08 4c 89 e0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 e7 e8 83 23 e5 ff 4d 89 3c 24 eb 38 e8 88
RSP: 0018:ffffc90003df7b00 EFLAGS: 00010202
RAX: 0000000100000001 RBX: 1ffff1100ee5d305 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffc90003df7a80
RBP: ffffc90003df7c30 R08: 0000000000000003 R09: fffff520007bef50
R10: dffffc0000000000 R11: fffff520007bef50 R12: 0000000800000008
R13: ffff8880772e9720 R14: ffff8880772e9828 R15: ffffc90000c35860
FS:  0000555577e623c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555577e6b738 CR3: 0000000075cf6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	4c 89 ff             	mov    %r15,%rdi
   3:	e8 b3 23 e5 ff       	call   0xffe523bb
   8:	4d 89 27             	mov    %r12,(%r15)
   b:	4d 85 e4             	test   %r12,%r12
   e:	74 61                	je     0x71
  10:	e8 b6 6b 7d ff       	call   0xff7d6bcb
  15:	49 83 c4 08          	add    $0x8,%r12
  19:	4c 89 e0             	mov    %r12,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 e7             	mov    %r12,%rdi
  33:	e8 83 23 e5 ff       	call   0xffe523bb
  38:	4d 89 3c 24          	mov    %r15,(%r12)
  3c:	eb 38                	jmp    0x76
  3e:	e8                   	.byte 0xe8
  3f:	88                   	.byte 0x88


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
