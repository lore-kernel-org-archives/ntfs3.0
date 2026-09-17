Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C0241379E
	for <ntfs3@lists.linux.dev>; Thu, 17 Sep 2026 05:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624408; cv=none; b=B4GtZfMkzlIPCvjtekacSjO8pZJTfZlEgBKPO3hPPvR2OZ2tSZn3UzRMA28cBRCe+MW8qBOHuG5TaFfN6ZvSlg/chEV8eEaHMhQFGN76BMq3EQSf1/jxW/nbKsrNiqQB8Ya9KZ2SMYTbrgsc47jOHV42+5j43lG8dMoxnaQvtjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624408; c=relaxed/simple;
	bh=g064DLOiSbUyNirEC4UGhO820EHW3erHwE4YH1EorzQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=szYEkVBDBHoZA+eoufePXL75jnaEkJHWaKYDxiT4wXd+3YaSZcza/iYynCj7BDEqcyO/UeVxREZYpjrOabmcXjvDvrkedPLpsdxwAc0Axjwjow9dQaCRJd0yNkJfskeIWdyWmQBWUr8vjeXb7uFmGe3WjTY09RwoPiPRSv8zGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-4b3759b7ff0so204845b6e.1
        for <ntfs3@lists.linux.dev>; Wed, 16 Sep 2026 22:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624405; x=1790229205;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q760ABFe/6JnVselIsou2NZjVaSmzIBt+agD6QxVZzc=;
        b=SGQSZI30+ULioJu9aqMY/GaMgA5I+lF+1NhJ/1Iyy28m2FXDRz9mBGXmXHO66LXxas
         NQHd78vc2/A+8tHaz3Qbfm1VpRGisVdEn2CBh1KH2q27TbGcABz0+9jWRh/ENq9iF58O
         mb676GOY0UvUanR34AjHjHcbrWX5oQIHkDmhXnEqIT4ucyPBLRfocMwGfms0mfJF+aLp
         hSHL9DKKtazNY2HwNhLedYTt4b4MUbSMNpTmWvPqBV91visx8HVJlWlSqDvQ5geTzcav
         SJ7byiOwW7xZoG9U2k65Ko4a1uRsy32zPiU3pM/lmKk8LBPv+QhRtp6BSUhcrkjIJSC0
         8+0Q==
X-Forwarded-Encrypted: i=1; AKwUvByeBDQm2+LSEQObvpstGcvsaF+zMi9+qIUXLItRUXMC6/YMft7Couezil4i00XBrLUg1/OOYg==@lists.linux.dev
X-Gm-Message-State: AFuF++klyRnY1ydY/kZz+fw+JFnsaFrvB7vGlrTyd6b665YdifxwYOv4
	2Kt/L6vih1zRZZDtxmIlUjhuJ8Rvt3grMHrESVKAg+laZLkAw5IzecVg+GhQtRNXzZWZTSzM85E
	LCFjtVWX5wJa9H8jSZ2sz25Oq0e9xc1fwBb52fVzs/ZoGTmPKNkYHb7whcj0=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f0f:b0:4a4:ed9a:e7ac with SMTP id
 5614622812f47-4ca499ce7f8mr6573069b6e.1.1789624405564; Wed, 16 Sep 2026
 22:53:25 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:53:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    238650ef6c7c Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12baebf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=3db654d91b471c4d7a7d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144f93f9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16baebf9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/41924f079a65/disk-238650ef.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/09d46c75ec43/vmlinux-238650ef.xz
kernel image: https://storage.googleapis.com/syzbot-assets/061e8caeb39c/bzImage-238650ef.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/881a3ca6c010/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com

------------[ cut here ]------------
ifs_is_fully_uptodate(folio, ifs) != folio_test_uptodate(folio)
WARNING: fs/iomap/buffered-io.c:295 at ifs_free+0x34a/0x410 fs/iomap/buffered-io.c:294, CPU#1: syz-executor196/5626
Modules linked in:
CPU: 1 UID: 0 PID: 5626 Comm: syz-executor196 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:ifs_free+0x34a/0x410 fs/iomap/buffered-io.c:294
Code: 41 5f 5d e9 b8 66 c1 ff e8 83 47 61 ff 90 0f 0b 90 e9 d5 fe ff ff e8 75 47 61 ff 90 0f 0b 90 e9 12 ff ff ff e8 67 47 61 ff 90 <0f> 0b 90 eb c7 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 08 fe ff ff
RSP: 0018:ffffc90004a3f5d8 EFLAGS: 00010293
RAX: ffffffff826553d9 RBX: 0000000000000008 RCX: ffff888038a19f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 000000008265d201 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff9400023c4e1 R12: ffff888028521084
R13: ffff888028521000 R14: ffffea00011e2700 R15: 0000000000000000
FS:  0000555586e47400(0000) GS:ffff888125ccb000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0595ca6000 CR3: 000000001bbb4000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 folio_invalidate mm/truncate.c:140 [inline]
 truncate_cleanup_folio+0xcb/0x190 mm/truncate.c:160
 truncate_inode_pages_range+0x2c4/0xd80 mm/truncate.c:404
 ntfs_evict_inode+0x19/0x40 fs/ntfs3/inode.c:2012
 evict+0x624/0xb50 fs/inode.c:822
 dispose_list fs/inode.c:864 [inline]
 evict_inodes+0x7e3/0x870 fs/inode.c:918
 generic_shutdown_super+0xaa/0x2d0 fs/super.c:741
 kill_block_super+0x44/0xa0 fs/super.c:1904
 ntfs3_kill_sb+0x44/0x1c0 fs/ntfs3/super.c:1940
 deactivate_locked_super+0xbc/0x110 fs/super.c:589
 cleanup_mnt+0x3d3/0x460 fs/namespace.c:1317
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 ptrace_notify+0x27c/0x2b0 kernel/signal.c:2536
 ptrace_report_syscall include/linux/ptrace.h:416 [inline]
 ptrace_report_syscall_exit+0x2d/0x50 include/linux/ptrace.h:477
 arch_ptrace_report_syscall_exit include/linux/entry-common.h:240 [inline]
 syscall_exit_work include/linux/entry-common.h:273 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:304 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:341 [inline]
 do_syscall_64+0x4a0/0x520 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6e5f33cec7
Code: bf 41 4d 56 53 b8 9d 00 00 00 0f 05 83 f8 ea 75 a2 c7 05 08 6c 0c 00 00 00 00 00 eb 96 e8 91 05 00 00 90 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 d0 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffdde381518 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 000000000001a4fc RCX: 00007f6e5f33cec7
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffdde3815d0
RBP: 00007ffdde3815d0 R08: 00007ffdde3825d0 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000206 R12: 00007ffdde382680
R13: 0000555586e48760 R14: 431bde82d7b634db R15: 00007ffdde382624
 </TASK>


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
