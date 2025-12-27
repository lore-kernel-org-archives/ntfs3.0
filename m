Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858AD3A1E96
	for <ntfs3@lists.linux.dev>; Sat, 27 Dec 2025 03:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766806461; cv=none; b=WqxsoaRrsdqm3323l59xI+DTwZyLcmiWHYL2d6PZxxMusozlSNUBH/GZSecPw8bWNo9zHEesOp3TVSZkI/NCrJpkp+LCQr4USRk3tlSTv5cXydq+LJmrI0lyQF1mmzik88cf7dB8s5i9clbkxzkwo4+uHuuTzxP/lQMVT7vA/AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766806461; c=relaxed/simple;
	bh=yS1XO0ktvgamxz6xVgKqIX3mF1EzPglW5S+uVYezhog=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LKW9iN2FTdxF/qFl1hhFI5EeovJvnwrm7FpddyH+nKhxrEZOA2OjXE7WBD7MfFHfgtm4DfIj/454RHjrH0u3Noi+pAB0xF1zXC26k74oldzwQHzfVG5AwaDoo1NE64DtmNvTuHxlDZ7zgcc3gYBkHaPxXk0EgyLEspqjnHcn5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-65eccb3f95cso3571355eaf.3
        for <ntfs3@lists.linux.dev>; Fri, 26 Dec 2025 19:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766806458; x=1767411258;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXjJynxzVrJ0xFWSKzvFKjTIk0dif7jHu+MGBn/EcBc=;
        b=odbKQcdQrTS1K6I0npnjg+dJEzPWq+w6ZY44gbDCa84ys1cvUXz7aq1YaMO0j9u/Cp
         qPsQ/fMcNKlqsWJyJx65d8WMs1fC+7UIg3hWMQiyuIw4XCYnhhJcDt36Pkbt4OXGo5a1
         sSOgqXZitNAI1+TeYiNMN+0k5EgRlOzikybX+Ke47KwFDYYS6+Z9XxuQRoLfIusI4pRd
         YwyUk8Slp8A3/K6snoxMeX/hw6Mg0h95EdEIOfInAVznCVHdZdg86TKLDDF0aWoUQtMk
         Z8gsacgs2eJXszU1Vc5BV5+AENXlfM0EeqKRRDuhUubfN/Y4IhPjTBeRevpsiip7IruT
         F+mA==
X-Forwarded-Encrypted: i=1; AJvYcCUmkeuMd3oANZq43deW/qm/hO2wAkc0YpVsdx9V9rbZapX7A4F4QzUfIemGUdfFpJGKhh5gtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOJPRdCardJuFKQtthbxi70L0Zt0XA4coxyzlN+ZL+ljRXMaqg
	BBcDsPwIXopWYpqpyc/7KCyrYMGqgL7r0uPMB47gn7epGfWQsVXH7pjT9SPwmpYRRO78cjeU2Rn
	Spi7NNKmGSyIaiRDzYwza45j9ZWkYO9ZAVk4e4/MhBEjhzlnCnSMRLd4FfiQ=
X-Google-Smtp-Source: AGHT+IGYAYobGGQbdSKc4vKPzyAju3JKHcwK1wuiHzbG8eudV29xmoifEiwEAbynKZN/ClEa1ab44stmW0gxAH+hzVP9A06QsHsD
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:e015:b0:65d:95d:2de1 with SMTP id
 006d021491bc7-65eb8a84344mr3591712eaf.4.1766806458434; Fri, 26 Dec 2025
 19:34:18 -0800 (PST)
Date: Fri, 26 Dec 2025 19:34:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <694f53ba.050a0220.35954c.0083.GAE@google.com>
Subject: [syzbot] [ntfs3?] INFO: task hung in ntfs_file_write_iter (2)
From: syzbot <syzbot+bcf9e1868c1a0c7e04f1@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b927546677c8 Merge tag 'dma-mapping-6.19-2025-12-22' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16994f1a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1f2b6fe1fdf1a00b
dashboard link: https://syzkaller.appspot.com/bug?extid=bcf9e1868c1a0c7e04f1
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17bd4bb4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17aa2758580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ddac8d425533/disk-b9275466.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6d9161401879/vmlinux-b9275466.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dc4982f21fd4/bzImage-b9275466.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e241eeb32570/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bcf9e1868c1a0c7e04f1@syzkaller.appspotmail.com

INFO: task syz.4.21:6056 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.21        state:D stack:28192 pid:6056  tgid:6054  ppid:5933   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x145f/0x5070 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7241
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1dfe/0x25e0 kernel/locking/rtmutex.c:1760
 rt_mutex_slowlock+0xb5/0x160 kernel/locking/rtmutex.c:1800
 __rt_mutex_lock kernel/locking/rtmutex.c:1815 [inline]
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:1027 [inline]
 ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
 iter_file_splice_write+0x977/0x10b0 fs/splice.c:738
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x104/0x160 fs/splice.c:1161
 splice_direct_to_actor+0x5b3/0xcd0 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x187/0x270 fs/splice.c:1230
 do_sendfile+0x4ec/0x7f0 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x13e/0x190 fs/read_write.c:1417
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe4601df749
RSP: 002b:00007fe45f825038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fe460436090 RCX: 00007fe4601df749
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000005
RBP: 00007fe460263f91 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000e3aa6ea R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe460436128 R14: 00007fe460436090 R15: 00007ffea40a5818
 </TASK>
INFO: task syz.3.22:6068 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.22        state:D stack:28272 pid:6068  tgid:6063  ppid:5928   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x145f/0x5070 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7241
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1dfe/0x25e0 kernel/locking/rtmutex.c:1760
 rt_mutex_slowlock+0xb5/0x160 kernel/locking/rtmutex.c:1800
 __rt_mutex_lock kernel/locking/rtmutex.c:1815 [inline]
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:1027 [inline]
 ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
 iter_file_splice_write+0x977/0x10b0 fs/splice.c:738
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x104/0x160 fs/splice.c:1161
 splice_direct_to_actor+0x5b3/0xcd0 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x187/0x270 fs/splice.c:1230
 do_sendfile+0x4ec/0x7f0 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x13e/0x190 fs/read_write.c:1417
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f40c396f749
RSP: 002b:00007f40c2fb5038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f40c3bc6090 RCX: 00007f40c396f749
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000005
RBP: 00007f40c39f3f91 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000e3aa6ea R11: 0000000000000246 R12: 0000000000000000
R13: 00007f40c3bc6128 R14: 00007f40c3bc6090 R15: 00007ffda4f56388
 </TASK>
INFO: task syz.0.17:6070 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.17        state:D stack:28184 pid:6070  tgid:6065  ppid:5919   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x145f/0x5070 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7241
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1dfe/0x25e0 kernel/locking/rtmutex.c:1760
 rt_mutex_slowlock+0xb5/0x160 kernel/locking/rtmutex.c:1800
 __rt_mutex_lock kernel/locking/rtmutex.c:1815 [inline]
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:1027 [inline]
 ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
 iter_file_splice_write+0x977/0x10b0 fs/splice.c:738
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x104/0x160 fs/splice.c:1161
 splice_direct_to_actor+0x5b3/0xcd0 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x187/0x270 fs/splice.c:1230
 do_sendfile+0x4ec/0x7f0 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x13e/0x190 fs/read_write.c:1417
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7fd2c2f749
RSP: 002b:00007f7fd227d038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f7fd2e86090 RCX: 00007f7fd2c2f749
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000005
RBP: 00007f7fd2cb3f91 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000e3aa6ea R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7fd2e86128 R14: 00007f7fd2e86090 R15: 00007ffd6f145638
 </TASK>
INFO: task syz.2.19:6078 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.19        state:D stack:28280 pid:6078  tgid:6074  ppid:5927   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x145f/0x5070 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7241
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1dfe/0x25e0 kernel/locking/rtmutex.c:1760
 rt_mutex_slowlock+0xb5/0x160 kernel/locking/rtmutex.c:1800
 __rt_mutex_lock kernel/locking/rtmutex.c:1815 [inline]
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:1027 [inline]
 ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
 iter_file_splice_write+0x977/0x10b0 fs/splice.c:738
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x104/0x160 fs/splice.c:1161
 splice_direct_to_actor+0x5b3/0xcd0 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x187/0x270 fs/splice.c:1230
 do_sendfile+0x4ec/0x7f0 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x13e/0x190 fs/read_write.c:1417
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f60fc19f749
RSP: 002b:00007f60fb7ed038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f60fc3f6090 RCX: 00007f60fc19f749
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000005
RBP: 00007f60fc223f91 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000e3aa6ea R11: 0000000000000246 R12: 0000000000000000
R13: 00007f60fc3f6128 R14: 00007f60fc3f6090 R15: 00007ffc89a23998
 </TASK>
INFO: task syz.1.18:6079 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.18        state:D stack:28280 pid:6079  tgid:6076  ppid:5922   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5256 [inline]
 __schedule+0x145f/0x5070 kernel/sched/core.c:6863
 __schedule_loop kernel/sched/core.c:6945 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7241
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1dfe/0x25e0 kernel/locking/rtmutex.c:1760
 rt_mutex_slowlock+0xb5/0x160 kernel/locking/rtmutex.c:1800
 __rt_mutex_lock kernel/locking/rtmutex.c:1815 [inline]
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:1027 [inline]
 ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
 iter_file_splice_write+0x977/0x10b0 fs/splice.c:738
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x104/0x160 fs/splice.c:1161
 splice_direct_to_actor+0x5b3/0xcd0 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x187/0x270 fs/splice.c:1230
 do_sendfile+0x4ec/0x7f0 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x13e/0x190 fs/read_write.c:1417
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4110ddf749
RSP: 002b:00007f411042d038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f4111036090 RCX: 00007f4110ddf749
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000005
RBP: 00007f4110e63f91 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000e3aa6ea R11: 0000000000000246 R12: 0000000000000000
R13: 00007f4111036128 R14: 00007f4111036090 R15: 00007ffcb4327368
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/38:
 #0: ffffffff8d5ae940 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8d5ae940 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff8d5ae940 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
7 locks held by kworker/u8:6/145:
2 locks held by getty/5564:
 #0: ffff888034c550a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc90003e7e2e0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x44f/0x1460 drivers/tty/n_tty.c:2211
2 locks held by syz.4.21/6055:
2 locks held by syz.4.21/6056:
 #0: ffff8880381d4480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff888048a85838 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff888048a85838 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
3 locks held by syz.3.22/6064:
2 locks held by syz.3.22/6068:
 #0: ffff88805974c480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff88802fe62268 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff88802fe62268 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
2 locks held by syz.0.17/6066:
2 locks held by syz.0.17/6070:
 #0: ffff88802790c480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff88802fe62a18 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff88802fe62a18 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
2 locks held by syz.2.19/6075:
2 locks held by syz.2.19/6078:
 #0: ffff88802936a480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff88802fe631c8 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff88802fe631c8 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
3 locks held by syz.1.18/6077:
2 locks held by syz.1.18/6079:
 #0: ffff888035474480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff88805f4e2268 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff88805f4e2268 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
2 locks held by syz.5.23/6218:
2 locks held by syz.5.23/6219:
 #0: ffff888039138480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff88802fe66f48 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff88802fe66f48 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
3 locks held by syz.9.27/6222:
2 locks held by syz.9.27/6226:
 #0: ffff888032e5a480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff888048b2d838 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff888048b2d838 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
3 locks held by syz.6.24/6224:
2 locks held by syz.6.24/6228:
 #0: ffff888034baa480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff888048cf9308 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff888048cf9308 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
3 locks held by syz.7.25/6230:
2 locks held by syz.7.25/6236:
 #0: ffff88806043c480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff888048a2e798 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff888048a2e798 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
2 locks held by syz.8.28/6241:
2 locks held by syz.8.28/6242:
 #0: ffff8880281b6480 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x160 fs/splice.c:1160
 #1: ffff888021fed088 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:1027 [inline]
 #1: ffff888021fed088 (&sb->s_type->i_mutex_key#23){+.+.}-{4:4}, at: ntfs_file_write_iter+0xe6/0x870 fs/ntfs3/file.c:1284
6 locks held by kworker/u8:35/6424:
2 locks held by kworker/u8:38/6618:
4 locks held by syz.2.151/6656:
1 lock held by syz.4.153/6655:
5 locks held by syz.3.154/6657:
2 locks held by syz.1.152/6658:

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 38 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:346 [inline]
 watchdog+0xf95/0xfe0 kernel/hung_task.c:515
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 17 Comm: pr/legacy Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:io_serial_in+0x77/0xc0 drivers/tty/serial/8250/8250_port.c:400
Code: e8 9e f3 b5 fc 44 89 f9 d3 e3 49 83 ee 80 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 ef 29 18 fd 41 03 1e 89 da ec <0f> b6 c0 5b 41 5c 41 5e 41 5f e9 1a 99 cb 05 cc 44 89 f9 80 e1 07
RSP: 0018:ffffc90000167950 EFLAGS: 00000202
RAX: 1ffffffff31f3500 RBX: 00000000000003fd RCX: 0000000000000000
RDX: 00000000000003fd RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffff98f9aff0 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffffff8509b600 R12: dffffc0000000000
R13: 0000000000000000 R14: ffffffff98f9ad60 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888126cef000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff6327c5e00 CR3: 0000000028116000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 serial_in drivers/tty/serial/8250/8250.h:128 [inline]
 serial_lsr_in drivers/tty/serial/8250/8250.h:150 [inline]
 wait_for_lsr+0x1aa/0x2f0 drivers/tty/serial/8250/8250_port.c:1961
 fifo_wait_for_lsr drivers/tty/serial/8250/8250_port.c:3234 [inline]
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3257 [inline]
 serial8250_console_write+0x11bd/0x1b40 drivers/tty/serial/8250/8250_port.c:3342
 console_emit_next_record kernel/printk/printk.c:3109 [inline]
 console_flush_one_record+0x685/0xb80 kernel/printk/printk.c:3215
 legacy_kthread_func+0x16f/0x210 kernel/printk/printk.c:3674
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
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
