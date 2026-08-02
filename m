Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294EB2DB7B4
	for <ntfs3@lists.linux.dev>; Sun,  2 Aug 2026 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785641964; cv=none; b=uuSU8jtwJfMngqcASpbDsYwzFwSlxCv30Tp11SmnytA/Se/yej9TuDaRbg10OENe56EwRPKjbjiri3rQ2WuVsv9lyOzrc4vg5P56ziK2oebrZp4t65D0mxKssgQSLPREQ5Aoc4e68RraEhkO7G9+TDh5Ra+pQfPDPn487TfqBhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785641964; c=relaxed/simple;
	bh=9zHmJzBQM3gGAFHaQgNErhWUfW5v/FGc3GS+2znN/38=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jTASmCJSI1RV0egEL7brXhZZpwmc1ERg+iq0QawN3RqsPkEyE5aq3uKo/y97Msb+4EvyOfLPlap6+edtBz1HA7PSERl7IyLKMoVvG/c4UXe9PY9ya9B+8A2NravQQqIFYTqwWModxTPaPnNiuSiK6PfeZKgpkH0+Mpc85o0n/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-495b8120909so3066032b6e.1
        for <ntfs3@lists.linux.dev>; Sat, 01 Aug 2026 20:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785641961; x=1786246761;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z46fqeRjHbMGCNJB3paCDT/xgVK5Ak5f06xPLYbqlaQ=;
        b=PijBq9xW/0DCstXgwUmZyNAxZHCBK3przs4gAF96TdLdjpe4c6QdCWTC76bYj8+XwE
         CXbVf7ypk7rRfJ+rGZU9KMwGewMfZHoU6qpGcgS75WGrJgUb6rH885W7/7ASMBR45UmP
         x04euw/RYEf2ebVopKtBs9t+ggH1mNO8Jk+tRGN+s5evoaWF+He7ivxZ3MyIoAb9aEbp
         s3n33jfb8CDDt3mV70vd/8vw7LKbUttLZ3BL/II5yJs3D+wHpkVS6MSIQarp92xv3kZz
         QP4lmL7Iff7g+czY2JU2Wh/51ZLEGfe2/PpfOi7XopuqAZFhNiciPlTqhSX9uW3S5cHJ
         MrYw==
X-Forwarded-Encrypted: i=1; AHgh+RrJ4uZueosP39XLUXdzGpEwbMumh+egVBRN87dFDGlTkyT8XSNHKiHceW5QsR0wpRO9RlUeQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmO2QM4QYydxovFSAPbwjMwNrGc766phwuGV5osJb1YXTfCn7W
	6wBvfmUWa4d1rNnGpVYHEwy1IXKWD3aos6dws066FHeigiLK6lTNiYE4qF6UE8Q5e4KxwW67yMi
	76sTrtLEiVfRrHiVrHS4uffCDlRgKVRYapq5gPD+MDXzzjFR2s1wcGcDEzjA=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2384:b0:4a4:da68:9434 with SMTP id
 5614622812f47-4af5e329152mr8692275b6e.14.1785641961075; Sat, 01 Aug 2026
 20:39:21 -0700 (PDT)
Date: Sat, 01 Aug 2026 20:39:21 -0700
In-Reply-To: <6a42cfca.9dc7bc9d.3393b4.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6ebbe9.f794c993.27aeb.001b.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_readdir
From: syzbot <syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    02dc699f83d0 Merge tag 'kbuild-fixes-7.2-1' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13141e32580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107a8db9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f25ce3963d3a/disk-02dc699f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/df741cd52af8/vmlinux-02dc699f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4a5eab9ecee0/bzImage-02dc699f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/bb354ea60a0b/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.1.223/6607 is trying to acquire lock:
ffff88803bfcc7b0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:601

but task is already holding lock:
ffff888060abd478 (&ni->ni_lock/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1222 [inline]
ffff888060abd478 (&ni->ni_lock/5){+.+.}-{4:4}, at: ntfs_readdir+0x752/0xec0 fs/ntfs3/dir.c:499

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ni->ni_lock/5){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:559 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:578
       ni_lock fs/ntfs3/ntfs_fs.h:1222 [inline]
       attr_data_get_block+0x1bf/0x2a0 fs/ntfs3/attrib.c:976
       ntfs_file_mmap_prepare+0x5b3/0xa20 fs/ntfs3/file.c:430
       vfs_mmap_prepare include/linux/fs.h:2071 [inline]
       call_mmap_prepare mm/vma.c:2672 [inline]
       __mmap_region mm/vma.c:2758 [inline]
       mmap_region+0xe78/0x2310 mm/vma.c:2860
       do_mmap+0xc1e/0x10b0 mm/mmap.c:560
       vm_mmap_pgoff+0x275/0x4e0 mm/util.c:581
       ksys_mmap_pgoff+0x4a6/0x720 mm/mmap.c:606
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x1520/0x2ce0 kernel/locking/lockdep.c:5237
       lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
       down_read_killable+0xa4/0x220 kernel/locking/rwsem.c:1599
       mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:601
       get_mmap_lock_carefully mm/mmap_lock.c:450 [inline]
       lock_mm_and_find_vma+0x2d6/0x340 mm/mmap_lock.c:501
       do_user_addr_fault+0x341/0x1340 arch/x86/mm/fault.c:1366
       handle_page_fault arch/x86/mm/fault.c:1483 [inline]
       exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
       filldir+0x2bd/0x630 fs/readdir.c:-1
       dir_emit include/linux/fs.h:3587 [inline]
       ntfs_dir_emit fs/ntfs3/dir.c:346 [inline]
       ntfs_read_hdr+0x8a4/0xc10 fs/ntfs3/dir.c:387
       ntfs_readdir+0x9ea/0xec0 fs/ntfs3/dir.c:547
       iterate_dir+0x2f1/0x4e0 fs/readdir.c:110
       __do_sys_getdents fs/readdir.c:319 [inline]
       __se_sys_getdents+0xf1/0x270 fs/readdir.c:304
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ni->ni_lock/5);
                               lock(&mm->mmap_lock);
                               lock(&ni->ni_lock/5);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

3 locks held by syz.1.223/6607:
 #0: ffff888031b34728 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x252/0x320 fs/file.c:1259
 #1: ffff888060abd730 (&type->i_mutex_dir_key#8){++++}-{4:4}, at: iterate_dir+0x215/0x4e0 fs/readdir.c:103
 #2: ffff888060abd478 (&ni->ni_lock/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1222 [inline]
 #2: ffff888060abd478 (&ni->ni_lock/5){+.+.}-{4:4}, at: ntfs_readdir+0x752/0xec0 fs/ntfs3/dir.c:499

stack backtrace:
CPU: 1 UID: 0 PID: 6607 Comm: syz.1.223 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x1520/0x2ce0 kernel/locking/lockdep.c:5237
 lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5868
 down_read_killable+0xa4/0x220 kernel/locking/rwsem.c:1599
 mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:601
 get_mmap_lock_carefully mm/mmap_lock.c:450 [inline]
 lock_mm_and_find_vma+0x2d6/0x340 mm/mmap_lock.c:501
 do_user_addr_fault+0x341/0x1340 arch/x86/mm/fault.c:1366
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
RIP: 0010:filldir+0x2bd/0x630 fs/readdir.c:290
Code: b9 99 82 ff 0f 01 cb 48 8b 44 24 20 49 89 47 08 48 bd 00 00 00 00 00 fc ff df 48 8b 44 24 40 48 89 03 8b 4c 24 04 48 8d 43 10 <66> 89 08 8b 54 24 14 80 e2 0f 89 c9 48 8d 04 0b 48 ff c8 88 10 48
RSP: 0018:ffffc9000553fab0 EFLAGS: 00050293
RAX: 0000200000002000 RBX: 0000200000001ff0 RCX: 0000000000000020
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000007
RBP: dffffc0000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10052c57c1 R12: ffff88805e062000
R13: 0000000000000005 R14: 0000000000000005 R15: 0000200000001fd8
 dir_emit include/linux/fs.h:3587 [inline]
 ntfs_dir_emit fs/ntfs3/dir.c:346 [inline]
 ntfs_read_hdr+0x8a4/0xc10 fs/ntfs3/dir.c:387
 ntfs_readdir+0x9ea/0xec0 fs/ntfs3/dir.c:547
 iterate_dir+0x2f1/0x4e0 fs/readdir.c:110
 __do_sys_getdents fs/readdir.c:319 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:304
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3850c8e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f38502ee028 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f3850f15fa0 RCX: 00007f3850c8e019
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 0000000000000007
RBP: 00007f3850d2500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f3850f16038 R14: 00007f3850f15fa0 R15: 00007ffe64cebd08
 </TASK>
ntfs3(loop1): failed to convert "0080" to macinuit
ntfs3(loop1): failed to convert name for inode 1e.
ntfs3(loop1): ino=1f, mi_enum_attr
----------------
Code disassembly (best guess):
   0:	b9 99 82 ff 0f       	mov    $0xfff8299,%ecx
   5:	01 cb                	add    %ecx,%ebx
   7:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
   c:	49 89 47 08          	mov    %rax,0x8(%r15)
  10:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  17:	fc ff df
  1a:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  1f:	48 89 03             	mov    %rax,(%rbx)
  22:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
  26:	48 8d 43 10          	lea    0x10(%rbx),%rax
* 2a:	66 89 08             	mov    %cx,(%rax) <-- trapping instruction
  2d:	8b 54 24 14          	mov    0x14(%rsp),%edx
  31:	80 e2 0f             	and    $0xf,%dl
  34:	89 c9                	mov    %ecx,%ecx
  36:	48 8d 04 0b          	lea    (%rbx,%rcx,1),%rax
  3a:	48 ff c8             	dec    %rax
  3d:	88 10                	mov    %dl,(%rax)
  3f:	48                   	rex.W


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
