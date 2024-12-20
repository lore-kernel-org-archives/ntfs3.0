Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2742594B7
	for <ntfs3@lists.linux.dev>; Fri, 20 Dec 2024 02:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734663089; cv=none; b=Yc1V/scfFUgTweeZB8DElriosxYlFtXtwVuyQ0NFsaaMB9lcwjBzQ8vav4wyeqxc+yiEd/7RXfl3HSkZae6z+EcRWnP/SHbrdRmbelc+NmfFGTVJzCWATeZJm3WdrVAqBnydiYwwuVmbLj3cULf5W7hRMsaO0YvzJGSCDxWLVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734663089; c=relaxed/simple;
	bh=9pvju9qbeVbH/C48KxHjfoXF0wZpHoBf9F9CFYBfgi4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dD5lQUhnyJdcMSZiepScdTxcWfvkEVi7GjU3Wc/iZu4NoPFL23FCDrzukpItxdVyvpvgFTn3vl/75eHt9HEJTBDNZVPHEvX8tjDRYGYdsF2iL1PqXs6OvEjk0GHhv0dT02rkDDHjfzO/FrsIGuPQG7/imD9clkkeNENMM27AB8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a9d303a5ccso26791255ab.3
        for <ntfs3@lists.linux.dev>; Thu, 19 Dec 2024 18:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734663086; x=1735267886;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMB4hoBCxfFyamvRTN+xHdp0B47WGv7hS9xlNDe6em0=;
        b=IQ1FBbK3c8Zq6c3HOCGHSKV50Z2e+N3+Psl3FqkKEqaTY5ONSSku2E9bU3nqHwpggt
         ySEDeAYosUw++A/S9ndzM+Tt1BwZu0I+qmN6S8rMLBcPoT7CrJUiPRMDakWHcUPBtd0V
         aM9fAlJXdrqBHtLBg0faZai1bmWs3vemCkR+nxIJTau4faYbPdvHtyr38o5TmeaJZbhP
         2Cuv+sErFsiTDPCjOALvIn4oiVM4fm9NRh4RLbsJL0cKSeyHb4/+jFgF0CYz+LpefpMD
         qBmeieOD4o+bh2VRbIwrgF0yedtaBMCLAoCDzuIOahgULpNc9j7GEfJUR1zD7Oj7iapi
         /AnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpZxTJUQHK1iPFyRMoeLVRiaKzIw3zyEIQX6L1H0Wj0osahsCxcXOw1OAEaJ8FxGlXbtKcQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsnF85uglOnL/CYMqh3RgcnOXZiB31zJpPkESrQ6Aa5v2ee9J8
	9qF9P8wVQFKaS7SBV1us5pFitTrGXhXfkqkAJgnCzPwWhsTPOHEUCbFJxlKNa8mdOnFOBApD0Yt
	QKhjriC5YqgW2DbAq+D6tDxdi2b3RqOa8vwaZf+1ial6deNpmO9qcaPk=
X-Google-Smtp-Source: AGHT+IHh3zmDJV3Rw9L8SbVOx8XLk7c84N7hlnxJ0ZQa7yidk1eGBSVJGpYx+aurhFwn933nxbKg3CMbsJcRSF0/ZOeosQ8z37vU
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2481:b0:3a7:2204:c83e with SMTP id
 e9e14a558f8ab-3c2d2782867mr17897345ab.10.1734663086387; Thu, 19 Dec 2024
 18:51:26 -0800 (PST)
Date: Thu, 19 Dec 2024 18:51:26 -0800
In-Reply-To: <672dbfef.050a0220.69327.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6764dbae.050a0220.1bfc9e.0003.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in run_unpack_ex
From: syzbot <syzbot+731b27ee9413ba859499@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    baaa2567a712 Merge tag 'mmc-v6.13-rc2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155d9f44580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1234f097ee657d8b
dashboard link: https://syzkaller.appspot.com/bug?extid=731b27ee9413ba859499
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11660fe8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ce62df980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/816d068f9171/disk-baaa2567.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9b40d3a7d8cc/vmlinux-baaa2567.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e9af7e09d18f/bzImage-baaa2567.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/9fd4a2bb86ce/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/87a127155fbe/mount_2.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+731b27ee9413ba859499@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.13.0-rc3-syzkaller-00082-gbaaa2567a712 #0 Not tainted
------------------------------------------------------
syz-executor336/5955 is trying to acquire lock:
ffff8880772ed9d0 (&ni->file.run_lock#2){++++}-{4:4}, at: run_unpack_ex+0x55e/0x9e0 fs/ntfs3/run.c:1119

but task is already holding lock:
ffff88807ffd4270 (&wnd->rw_lock){++++}-{4:4}, at: run_unpack_ex+0x47a/0x9e0 fs/ntfs3/run.c:1100

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&wnd->rw_lock){++++}-{4:4}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       down_write_nested+0xa2/0x220 kernel/locking/rwsem.c:1693
       mark_as_free_ex+0x3e/0x390 fs/ntfs3/fsntfs.c:2484
       run_deallocate_ex+0x244/0x5f0 fs/ntfs3/attrib.c:122
       attr_set_size+0x168d/0x4300 fs/ntfs3/attrib.c:753
       ntfs_truncate fs/ntfs3/file.c:506 [inline]
       ntfs_setattr+0x7a4/0xb80 fs/ntfs3/file.c:824
       notify_change+0xbca/0xe90 fs/attr.c:552
       do_truncate+0x220/0x310 fs/open.c:65
       vfs_truncate+0x2e1/0x3b0 fs/open.c:111
       do_sys_truncate+0xdb/0x190 fs/open.c:134
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&ni->file.run_lock#2){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
       __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5226
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
       down_read+0xb1/0xa40 kernel/locking/rwsem.c:1524
       run_unpack_ex+0x55e/0x9e0 fs/ntfs3/run.c:1119
       ntfs_read_mft fs/ntfs3/inode.c:401 [inline]
       ntfs_iget5+0x1f9a/0x37b0 fs/ntfs3/inode.c:537
       dir_search_u+0x2fe/0x3a0 fs/ntfs3/dir.c:264
       ntfs_lookup+0x106/0x1f0 fs/ntfs3/namei.c:85
       __lookup_slow+0x28c/0x3f0 fs/namei.c:1791
       lookup_slow+0x53/0x70 fs/namei.c:1808
       walk_component+0x2e1/0x410 fs/namei.c:2112
       lookup_last fs/namei.c:2610 [inline]
       path_lookupat+0x16f/0x450 fs/namei.c:2634
       filename_lookup+0x2a3/0x670 fs/namei.c:2663
       user_path_at+0x3a/0x60 fs/namei.c:3070
       do_mount fs/namespace.c:3844 [inline]
       __do_sys_mount fs/namespace.c:4057 [inline]
       __se_sys_mount+0x297/0x3c0 fs/namespace.c:4034
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&wnd->rw_lock);
                               lock(&ni->file.run_lock#2);
                               lock(&wnd->rw_lock);
  rlock(&ni->file.run_lock#2);

 *** DEADLOCK ***

3 locks held by syz-executor336/5955:
 #0: ffff8880703e5bb8 (&type->i_mutex_dir_key#8){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:828 [inline]
 #0: ffff8880703e5bb8 (&type->i_mutex_dir_key#8){++++}-{4:4}, at: lookup_slow+0x45/0x70 fs/namei.c:1807
 #1: ffff8880703e5920 (&ni->ni_lock#3/6){+.+.}-{4:4}, at: ni_lock_dir fs/ntfs3/ntfs_fs.h:1115 [inline]
 #1: ffff8880703e5920 (&ni->ni_lock#3/6){+.+.}-{4:4}, at: ntfs_lookup+0xf9/0x1f0 fs/ntfs3/namei.c:84
 #2: ffff88807ffd4270 (&wnd->rw_lock){++++}-{4:4}, at: run_unpack_ex+0x47a/0x9e0 fs/ntfs3/run.c:1100

stack backtrace:
CPU: 1 UID: 0 PID: 5955 Comm: syz-executor336 Not tainted 6.13.0-rc3-syzkaller-00082-gbaaa2567a712 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/25/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2074
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5226
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5849
 down_read+0xb1/0xa40 kernel/locking/rwsem.c:1524
 run_unpack_ex+0x55e/0x9e0 fs/ntfs3/run.c:1119
 ntfs_read_mft fs/ntfs3/inode.c:401 [inline]
 ntfs_iget5+0x1f9a/0x37b0 fs/ntfs3/inode.c:537
 dir_search_u+0x2fe/0x3a0 fs/ntfs3/dir.c:264
 ntfs_lookup+0x106/0x1f0 fs/ntfs3/namei.c:85
 __lookup_slow+0x28c/0x3f0 fs/namei.c:1791
 lookup_slow+0x53/0x70 fs/namei.c:1808
 walk_component+0x2e1/0x410 fs/namei.c:2112
 lookup_last fs/namei.c:2610 [inline]
 path_lookupat+0x16f/0x450 fs/namei.c:2634
 filename_lookup+0x2a3/0x670 fs/namei.c:2663
 user_path_at+0x3a/0x60 fs/namei.c:3070
 do_mount fs/namespace.c:3844 [inline]
 __do_sys_mount fs/namespace.c:4057 [inline]
 __se_sys_mount+0x297/0x3c0 fs/namespace.c:4034
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7febe4f8bed9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd61a52908 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007febe4f8bed9
RDX: 0000000000000000 RSI: 0000000020000080 RDI: 0000000000000000
RBP: 00007ffd61a5292c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000021 R11: 0000000000000246 R12: 00007ffd61a52980
R13: 00007ffd61a52940 R14: 0000000000014b5d R15: 0000000000000014
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
