Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467064FDE44
	for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899620; cv=none; b=bxtUaeGaaN3EStgIrOlM22whIuwNQsfaBTXpkI/xS83MNLNBc3v/Q12OH96R6QpqzyyNxeHrJCt7Fsp/ltoe/sYjv8F6mlwMok8BPVcS1h/sBgzTjPzTGXm1hpClVuQq8/qX/iOWEGgGCQKFoly71e+teKpCWAZ1YdLZtCt3IgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899620; c=relaxed/simple;
	bh=hZL72XOUPUJc5kL0hCiQyhutYCYGmYfDAEkJs6SJdJE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qRHR6pDq/HLokQ5UfuoEcm60b5lNT8XJabn1Qj7/yWe8uORdt9xBtkB47QzQjNdgk2khDareuy1+2weX4gBUH6Z104/cG7Ts628yQZSnUc50mzcQ4RVf0f1rmUdFOWMqhGWcmdmcEwi7NRKMsOPdSuovU4myMbqEhL8gsRo2IS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-482966c4f4fso6319107fac.1
        for <ntfs3@lists.linux.dev>; Tue, 13 Oct 2026 06:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899618; x=1792504418;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O82mp/mFFeRVeGwjdUjNn3HGa5rUeYT+1hm74Uda2hk=;
        b=RzIrZrEDdJjUKr1bzMcH8EHLuIv22LOnlTmSq4aMnAp0I0UuksLrvCOkGXaAlrNlKy
         2XPEi7iAYgahkmxy3Y7gmy6jCj74ZV6qJDa4Ys0XcLj1TqBcbRg4860fe3Zj+WCzJ5n7
         9b4chV/Qp7GQm52I0hJCHBRA3oqE33+/WmRjoAJ0tAqMCcGBA8v3wrQ7wEpZYvvTawkE
         c5Cms6HQ9yzuKHNK33n543SpZ4bwlxKICNPh3vDzH+kS2NoRr9zL6Xpr7yxzvx9b7TL3
         Yz/TRwd1dbzt6bNlsZ231kvI1Y0buKTZdnlVULvAhc/OuWvSOXetRmo4agnr56E/JfSn
         cI+g==
X-Forwarded-Encrypted: i=1; AKwUvBwBESkvEPkJSxlCF4hImLUUHvGzf9PFv3r6FAIgIMydaYcj+pF6bEQM9yfFehLvh+2qdWzzMQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI6rpJlLYB4fwbCIviqBnrjsdciP7ZWSEgnKkdQk2Xsj5OBDXvw
	vQf2sqPN7T5ld1o9TuSfZ1nD3d2oJ8MkeqAhQJJijO/99EjDGbfGp5ABiTLpeF8/hZYrA8kZxs0
	438Xs+C5o8RBVho2aA3COrX23rRd4x2tVzXE6Y2CGI5j6nxD1aMG5SAQQA30=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:a554:10b0:521:561a:8e90 with SMTP id
 5614622812f47-52156397ac3mr2670451b6e.3.1791899617952; Tue, 13 Oct 2026
 06:53:37 -0700 (PDT)
Date: Tue, 13 Oct 2026 06:53:37 -0700
In-Reply-To: <6a42cfca.9dc7bc9d.3393b4.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace37e1.0e5b5d80.2c029c.06da.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_readdir
From: syzbot <syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, gality369@gmail.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    24a19b953e2a Linux 7.3-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=118a55c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1575d40d580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f68dd1580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/71ab5ff0ed88/disk-24a19b95.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f5849c6ea337/vmlinux-24a19b95.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cf747b187062/bzImage-24a19b95.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/dd39b95ec4ba/mount_0.gz

The issue was bisected to:

commit d62cf685d12e95cc0a4122c43cd9f0eb8bba0b4c
Author: ZhengYuan Huang <gality369@gmail.com>
Date:   Mon Apr 27 07:26:50 2026 +0000

    fs/ntfs3: hold ni_lock across readdir metadata walk

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1376eb49580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10f6eb49580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1776eb49580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com
Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")

ntfs3(loop1): failed to convert "c46c" to cp855
ntfs3(loop1): ino=20, mi_enum_attr
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.1.40/6092 is trying to acquire lock:
ffff88803a8344b8 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:609

but task is already holding lock:
ffff88805ecb73c8 (&ni->ni_lock/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1247 [inline]
ffff88805ecb73c8 (&ni->ni_lock/5){+.+.}-{4:4}, at: ntfs_readdir+0x717/0xf70 fs/ntfs3/dir.c:541

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ni->ni_lock/5){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:561 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:580
       ni_lock fs/ntfs3/ntfs_fs.h:1247 [inline]
       attr_data_get_block+0x1cd/0x2c0 fs/ntfs3/attrib.c:976
       ntfs_file_mmap_prepare+0x5b3/0xa20 fs/ntfs3/file.c:430
       vfs_mmap_prepare include/linux/fs.h:2071 [inline]
       call_mmap_prepare mm/vma.c:2799 [inline]
       __mmap_region mm/vma.c:2888 [inline]
       mmap_region+0xebb/0x25c0 mm/vma.c:2989
       do_mmap+0xe0e/0x1310 mm/mmap.c:573
       vm_mmap_pgoff+0x275/0x4e0 mm/util.c:581
       ksys_mmap_pgoff+0x4a6/0x720 mm/mmap.c:619
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       down_read_killable+0xa4/0x220 kernel/locking/rwsem.c:1599
       mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:609
       get_mmap_lock_carefully mm/mmap_lock.c:450 [inline]
       lock_mm_and_find_vma+0x2d6/0x340 mm/mmap_lock.c:501
       do_user_addr_fault+0x343/0x1340 arch/x86/mm/fault.c:1366
       handle_page_fault arch/x86/mm/fault.c:1483 [inline]
       exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
       stac arch/x86/include/asm/smap.h:-1 [inline]
       filldir+0x29f/0x630 fs/readdir.c:291
       dir_emit include/linux/fs.h:3610 [inline]
       ntfs_dir_emit fs/ntfs3/dir.c:388 [inline]
       ntfs_read_hdr+0x8a7/0xc10 fs/ntfs3/dir.c:429
       ntfs_readdir+0x9ab/0xf70 fs/ntfs3/dir.c:589
       iterate_dir+0x3ea/0x8a0 fs/readdir.c:114
       __do_sys_getdents fs/readdir.c:324 [inline]
       __se_sys_getdents+0xf1/0x270 fs/readdir.c:309
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
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

locks held by syz.1.40/6092: 3, last CPU#0:
 #0: ffff888037c3c328 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x252/0x320 fs/file.c:1259
 #1: ffff88805ecb7690 (&type->i_mutex_dir_key#8){++++}-{4:4}, at: iterate_dir+0x293/0x8a0 fs/readdir.c:106
 #2: ffff88805ecb73c8 (&ni->ni_lock/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1247 [inline]
 #2: ffff88805ecb73c8 (&ni->ni_lock/5){+.+.}-{4:4}, at: ntfs_readdir+0x717/0xf70 fs/ntfs3/dir.c:541

stack backtrace:
CPU: 0 UID: 0 PID: 6092 Comm: syz.1.40 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2087
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 down_read_killable+0xa4/0x220 kernel/locking/rwsem.c:1599
 mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:609
 get_mmap_lock_carefully mm/mmap_lock.c:450 [inline]
 lock_mm_and_find_vma+0x2d6/0x340 mm/mmap_lock.c:501
 do_user_addr_fault+0x343/0x1340 arch/x86/mm/fault.c:1366
 handle_page_fault arch/x86/mm/fault.c:1483 [inline]
 exc_page_fault+0x6a/0xc0 arch/x86/mm/fault.c:1536
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:595
RIP: 0010:filldir+0x29f/0x630 fs/readdir.c:293
Code: df 49 29 ef 48 b8 00 f0 ff ff ff 7f 00 00 49 39 c7 4c 0f 47 f8 bf 07 00 00 00 44 89 f6 e8 09 5b 7e ff 0f 01 cb 48 8b 44 24 20 <49> 89 47 08 48 bd 00 00 00 00 00 fc ff df 48 8b 44 24 40 48 89 03
RSP: 0018:ffffc90004f1fab0 EFLAGS: 00050293
RAX: 00000000000015a0 RBX: 0000200000008578 RCX: ffff888032ec1f40
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000007
RBP: 0000000000000020 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10065d83e9 R12: ffff88803c9f4000
R13: 0000000000000005 R14: 0000000000000005 R15: 0000200000008558
 dir_emit include/linux/fs.h:3610 [inline]
 ntfs_dir_emit fs/ntfs3/dir.c:388 [inline]
 ntfs_read_hdr+0x8a7/0xc10 fs/ntfs3/dir.c:429
 ntfs_readdir+0x9ab/0xf70 fs/ntfs3/dir.c:589
 iterate_dir+0x3ea/0x8a0 fs/readdir.c:114
 __do_sys_getdents fs/readdir.c:324 [inline]
 __se_sys_getdents+0xf1/0x270 fs/readdir.c:309
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f210f74e2d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f210edae028 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007f210f9d5fa0 RCX: 00007f210f74e2d9
RDX: 00000000000000b8 RSI: 0000200000008500 RDI: 0000000000000005
RBP: 00007f210f7e5888 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f210f9d6038 R14: 00007f210f9d5fa0 R15: 00007fff702375e8
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
  1d:	e8 09 5b 7e ff       	call   0xff7e5b2b
  22:	0f 01 cb             	stac
  25:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
* 2a:	49 89 47 08          	mov    %rax,0x8(%r15) <-- trapping instruction
  2e:	48 bd 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbp
  35:	fc ff df
  38:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  3d:	48 89 03             	mov    %rax,(%rbx)


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
