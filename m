Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E13438A9
	for <ntfs3@lists.linux.dev>; Mon, 29 Jun 2026 20:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763468; cv=none; b=bjp4p2MEiUSutKa8teI73SYSsqkVvqqnh1tOZTWIy1SmNi0ZflpudkM0Gs3lpc313vlw2cy6ugIm58v/y8hZ20ALfmIfOay+yicA+Qng9OvY7JYbq6+ghyDr4ft8aD21j9FrJ5pwC16M6hyLmKq1S4Ul4lILb9NKl4K9HwoKw70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763468; c=relaxed/simple;
	bh=7kQALU8pnoFp5KqQCgKIMD75mgv3mpznqC3hACCnjJE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=slKVBlXB1FnhVEMsPUrBgKr01cLxbF2qc/49XHUOqVlHtpZZhAcdAU42WTBmMOHaTmyV5mrvIW2tMJ7U6wrKaZA51wGinUuW813BP5uWks8aKgd5TvCbox5fToyJCk2hMwUeiBHWukBVLdqCG2+x3BEL6GypypXOm1JMPVs7AbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-49001defc4dso6822592b6e.3
        for <ntfs3@lists.linux.dev>; Mon, 29 Jun 2026 13:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782763466; x=1783368266;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdO0gRqUuQs2uAO0Adp+c7KKgCRh1SghhWYFa/1DMT8=;
        b=UltkCrCvbhfeYHN3DeUbBI9us6ZP8NzgRjdHdRcHXVxTVGkX2bPHVrLS/NUDdE9fQm
         gUHLPJzBMrd8/zZ9mXO7cYwNeJc28JxfTR6jlfdQQ6nCuG3EnwZ6x6IgEULl039n0P58
         jLZQ9a7I/Abdvt1AQ01J+0sJX80+lj2QA4iArWHRuRAPXzCHgRphQVh6oICaTGNgwuC7
         pPOsUg3VflZROi303gUtjRwafRDF6n+zbQdnf+IkZpte4CUZBn164BZRcKhF/e60BhBd
         d4nGRHbOzlk7rZTuEuvk13vv3daemx5W0HWa5yKQ/JRfLZlK17G4ssKJfPDfmXo3qpnn
         41aA==
X-Forwarded-Encrypted: i=1; AFNElJ/DPk54Xq7rfd8CYdKiG0jxTn7G2IM7hKAb2zca9zvclZkdbZgbPtqf49ruoLzTKluYbVjryg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8aEKq4PLRK5OdErSJFH1mqVrod1fzHhntieYICAHBdgr77Ap1
	W44UecynvBHn5Pee5T+M8uqPkwEYi1+Qtp6/N06+tL4hbCjj8r/d0E6DX3NARPZLSpE2VVbvAyE
	B3TB4u9vrLOpFTXmRFc4csxyOrABkEvN4PlxnzSQvHLUNE2enc1Rij2lu/Q8=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23d3:b0:495:e708:7ea with SMTP id
 5614622812f47-495eb004a79mr687548b6e.40.1782763466479; Mon, 29 Jun 2026
 13:04:26 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:04:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a42cfca.9dc7bc9d.3393b4.0008.GAE@google.com>
Subject: [syzbot] [ntfs3?] possible deadlock in ntfs_readdir
From: syzbot <syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8b69c0475871 Merge tag 'input-for-v7.2-rc0-2' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133ab051580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=86ba763b42fa66a
dashboard link: https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f3ea05b4807e/disk-8b69c047.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3ecd9cbe190d/vmlinux-8b69c047.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ddda1b2aab6/bzImage-8b69c047.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.9.5032/28047 is trying to acquire lock:
ffff8880307283b8 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:601

but task is already holding lock:
ffff8880656438f8 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1222 [inline]
ffff8880656438f8 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_readdir+0x749/0xec0 fs/ntfs3/dir.c:499

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ni->ni_lock#3/5){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19d/0x1550 kernel/locking/mutex.c:821
       ni_lock fs/ntfs3/ntfs_fs.h:1222 [inline]
       attr_data_get_block+0x1bf/0x2a0 fs/ntfs3/attrib.c:976
       ntfs_file_mmap_prepare+0x5b0/0xa20 fs/ntfs3/file.c:430
       vfs_mmap_prepare include/linux/fs.h:2071 [inline]
       call_mmap_prepare mm/vma.c:2672 [inline]
       __mmap_region mm/vma.c:2758 [inline]
       mmap_region+0xe5a/0x2310 mm/vma.c:2860
       do_mmap+0xc3b/0x10c0 mm/mmap.c:560
       vm_mmap_pgoff+0x272/0x4e0 mm/util.c:581
       ksys_mmap_pgoff+0x4dc/0x760 mm/mmap.c:606
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x1520/0x2cf0 kernel/locking/lockdep.c:5237
       lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
       down_read_killable+0x50/0x3b0 kernel/locking/rwsem.c:1599
       mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:601
       get_mmap_lock_carefully mm/mmap_lock.c:450 [inline]
       lock_mm_and_find_vma+0x2d6/0x340 mm/mmap_lock.c:501
       do_user_addr_fault+0x341/0x1340 arch/x86/mm/fault.c:1366
       handle_page_fault arch/x86/mm/fault.c:1483 [inline]
       exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
       stac arch/x86/include/asm/smap.h:-1 [inline]
       filldir+0x29f/0x630 fs/readdir.c:286
       dir_emit include/linux/fs.h:3582 [inline]
       ntfs_dir_emit fs/ntfs3/dir.c:346 [inline]
       ntfs_read_hdr+0x8a4/0xc10 fs/ntfs3/dir.c:387
       ntfs_readdir+0x9e1/0xec0 fs/ntfs3/dir.c:547
       iterate_dir+0x2e2/0x4d0 fs/readdir.c:110
       __do_sys_getdents fs/readdir.c:319 [inline]
       __se_sys_getdents+0xf1/0x270 fs/readdir.c:304
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ni->ni_lock#3/5);
                               lock(&mm->mmap_lock);
                               lock(&ni->ni_lock#3/5);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

3 locks held by syz.9.5032/28047:
 #0: ffff88802a10cef0 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x246/0x320 fs/file.c:1259
 #1: ffff888065643b80 (&type->i_mutex_dir_key#10){++++}-{4:4}, at: iterate_dir+0x209/0x4d0 fs/readdir.c:103
 #2: ffff8880656438f8 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1222 [inline]
 #2: ffff8880656438f8 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_readdir+0x749/0xec0 fs/ntfs3/dir.c:499

stack backtrace:
CPU: 0 UID: 0 PID: 28047 Comm: syz.9.5032 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x1520/0x2cf0 kernel/locking/lockdep.c:5237
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 down_read_killable+0x50/0x3b0 kernel/locking/rwsem.c:1599
 mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:601
 get_mmap_lock_carefully mm/mmap_lock.c:450 [inline]
 lock_mm_and_find_vma+0x2d6/0x340 mm/mmap_lock.c:501
 do_user_addr_fault+0x341/0x1340 arch/x86/mm/fault.c:1366
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
RIP: 0010:filldir+0x29f/0x630 fs/readdir.c:288
Code: df 49 29 ef 48 b8 00 f0 ff ff ff 7f 00 00 49 39 c7 4c 0f 47 f8 bf 07 00 00 00 44 89 f6 e8 99 c8 79 ff 0f 01 cb 48 8b 44 24 20 <49> 89 47 08 48 bd 00 00 00 00 00 fc ff df 48 8b 44 24 40 48 89 03
RSP: 0018:ffffc900034bfab0 EFLAGS: 00050293
RAX: 0000000000000928 RBX: 0000200000002028 RCX: 0000000000000000
RDX: ffff888027f55d00 RSI: 0000000000000005 RDI: 0000000000000007
RBP: 0000000000000020 R08: ffff888027f55d07 R09: 1ffff11004feaba0
R10: dffffc0000000000 R11: ffffed1004feaba1 R12: ffff888080480000
R13: 0000000000000005 R14: 0000000000000005 R15: 0000200000002008
 dir_emit include/linux/fs.h:3582 [inline]
 ntfs_dir_emit fs/ntfs3/dir.c:346 [inline]
 ntfs_read_hdr+0x8a4/0xc10 fs/ntfs3/dir.c:387
 ntfs_readdir+0x9e1/0xec0 fs/ntfs3/dir.c:547
 iterate_dir+0x2e2/0x4d0 fs/readdir.c:110
 __do_sys_getdents fs/readdir.c:319 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:304
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f459699ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f45977bf028 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f4596c16090 RCX: 00007f459699ce59
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 0000000000000006
RBP: 00007f4596a32e6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f4596c16128 R14: 00007f4596c16090 R15: 00007ffe2a15dea8
 </TASK>
----------------
Code disassembly (best guess):
   0:	df 49 29             	fisttps 0x29(%rcx)
   3:	ef                   	out    %eax,(%dx)
   4:	48 b8 00 f0 ff ff ff 	movabs $0x7ffffffff000,%rax
   b:	7f 00 00
   e:	49 39 c7             	cmp    %rax,%r15
  11:	4c 0f 47 f8          	cmova  %rax,%r15
  15:	bf 07 00 00 00       	mov    $0x7,%edi
  1a:	44 89 f6             	mov    %r14d,%esi
  1d:	e8 99 c8 79 ff       	call   0xff79c8bb
  22:	0f 01 cb             	stac
  25:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
* 2a:	49 89 47 08          	mov    %rax,0x8(%r15) <-- trapping instruction
  2e:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  35:	fc ff df
  38:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  3d:	48 89 03             	mov    %rax,(%rbx)


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
