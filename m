Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC79143723
	for <ntfs3@lists.linux.dev>; Sun, 10 Nov 2024 05:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731217104; cv=none; b=Shv6UrovpwvXAYpBaK/PfosRBefgHNZRpMpMZQnx38EVZ/ZYFNX0GdbYj+4zDuFPwgOdp/DY/hiFBPZkHkjBueL58PkOmgn0J1Cpuisp8p2u0QU+GzSdbLqrWn2Sp2ftQO1VCFCAxYgXkMBqdc2+AkH57MIOc4xVuGnwCiDoPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731217104; c=relaxed/simple;
	bh=Iwog/SfpYIZ60BrBQWvB4WDqoF4CiUk6Bgw+Yrqc/Ms=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=byw/sk0TaY+aQNu0Xd+xlllk2EFGXhIGlAffRZX2gjLktoHN7/vOe0Q9odxNooEX24VAH4F16hVanMoxn8w5CwwjBGdCF7q2TEGcGZapuSbee2l9EucdrrNVJS3f4fJFKPm/Ep5PYtuHzrceWrPFMABy48wLVsFhLZJ1bEJ+emg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83ac0354401so435138539f.3
        for <ntfs3@lists.linux.dev>; Sat, 09 Nov 2024 21:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731217102; x=1731821902;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lmvVSZmVhW/bVRs+taXZzHsPGtRjZzb2r5dYuk17DCI=;
        b=TxrMhbdjWg1TGHF+GoVQn9FiA8R852Z2PMpgouwyBiLANu/fDYFh2pKNq1M5SaNelq
         IQh88o8AYf/9gq48Qc42wvUyf6cQVRj7TXgNj85qhCB+4/LWq1h+CNkSD+vN50tQiv8W
         0DckRlJFof3PAlluIU3UfSl3I3yQyvcKCXD5V8N0UjFnQtFWCceMaMcKoQDR+93aS6om
         7Z+NeDIrM1QFKYnc/Gc85ZptqdWhqvNEzjE1M5k4+HA5PTGDSjsQvINvNfGQfBrLUntE
         51kwlz13y4Z+QKX4+OXdRx8DweO+uRUHnbGLf4DcSijcfJJhqIzGDsMTgr9R5axOb2Vl
         xbKw==
X-Forwarded-Encrypted: i=1; AJvYcCUTCqEdVfQ/XDQ7FGzjjyiT4TrVQQ+JI64ROtawcwQs6GqEBfJvuEBYi3E6sfOfBQZcn6mcGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmMGPJbko6bINHKrYqO5J9YadxFfDLQRn2ttsRitZ0o79yAgeH
	j/IRGFLGnR7ET3OfH/Hg6E/x5TaiUyMy6OIG76DnaVT9VOm12eS3CHTYPPps3/dW0ovuHARoB1d
	Ei3rCkLQ73B4+28+0X3skR27FjEV924g7V5DeAPQXw3j0l/c8WpogZCk=
X-Google-Smtp-Source: AGHT+IHAIvN7x/2FXRelYyzM2X/z2BP2bWzoc0PSJKUsjn9l7ukKWScsfsuuqVubmAT2IFMg8dgBv73Wf0a1keNsBGke+9TzXbRT
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1685:b0:3a0:98b2:8f3b with SMTP id
 e9e14a558f8ab-3a6f19ebd22mr100043095ab.7.1731217102244; Sat, 09 Nov 2024
 21:38:22 -0800 (PST)
Date: Sat, 09 Nov 2024 21:38:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673046ce.050a0220.320e73.031d.GAE@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in ntfs_read_hdr
From: syzbot <syzbot+6b97c7810fd3600a03e0@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    da4373fbcf00 Merge tag 'thermal-6.12-rc7' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16c5e0c0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4580d62ee1893a5
dashboard link: https://syzkaller.appspot.com/bug?extid=6b97c7810fd3600a03e0
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/204d5ed3c12b/disk-da4373fb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b51aa0c6ab3a/vmlinux-da4373fb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/197213720e0c/bzImage-da4373fb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6b97c7810fd3600a03e0@syzkaller.appspotmail.com

ntfs3(loop4): Different NTFS sector size (2048) and media sector size (512).
=====================================================
BUG: KMSAN: uninit-value in ntfs_dir_emit fs/ntfs3/dir.c:333 [inline]
BUG: KMSAN: uninit-value in ntfs_read_hdr+0xfba/0x1290 fs/ntfs3/dir.c:383
 ntfs_dir_emit fs/ntfs3/dir.c:333 [inline]
 ntfs_read_hdr+0xfba/0x1290 fs/ntfs3/dir.c:383
 ntfs_readdir+0xf48/0x1a10 fs/ntfs3/dir.c:494
 iterate_dir+0x5b3/0x9e0 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:407 [inline]
 __se_sys_getdents64+0x16e/0x550 fs/readdir.c:392
 __x64_sys_getdents64+0x96/0xe0 fs/readdir.c:392
 x64_sys_call+0x3430/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:218
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_read_run_nb+0x786/0x1070 fs/ntfs3/fsntfs.c:1252
 ntfs_read_bh+0x64/0xde0 fs/ntfs3/fsntfs.c:1313
 indx_read+0x44e/0x17b0 fs/ntfs3/index.c:1067
 ntfs_readdir+0xe07/0x1a10 fs/ntfs3/dir.c:489
 iterate_dir+0x5b3/0x9e0 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:407 [inline]
 __se_sys_getdents64+0x16e/0x550 fs/readdir.c:392
 __x64_sys_getdents64+0x96/0xe0 fs/readdir.c:392
 x64_sys_call+0x3430/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:218
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_write_bh+0x652/0xdb0 fs/ntfs3/fsntfs.c:1450
 indx_write fs/ntfs3/index.c:1027 [inline]
 indx_insert_into_buffer+0xd8f/0x2010 fs/ntfs3/index.c:1811
 indx_insert_entry+0xa3c/0xee0 fs/ntfs3/index.c:1988
 ni_add_name+0xe5d/0x10d0 fs/ntfs3/frecord.c:3120
 ntfs_link_inode+0x265/0x310 fs/ntfs3/inode.c:1735
 ntfs_link+0x21d/0x500 fs/ntfs3/namei.c:146
 vfs_link+0x94c/0xb70 fs/namei.c:4739
 do_linkat+0x4f5/0xfd0 fs/namei.c:4809
 __do_sys_linkat fs/namei.c:4837 [inline]
 __se_sys_linkat fs/namei.c:4834 [inline]
 __x64_sys_linkat+0x186/0x230 fs/namei.c:4834
 x64_sys_call+0x37e1/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:266
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 hdr_insert_de fs/ntfs3/index.c:838 [inline]
 indx_insert_into_buffer+0xcdf/0x2010 fs/ntfs3/index.c:1807
 indx_insert_entry+0xa3c/0xee0 fs/ntfs3/index.c:1988
 ni_add_name+0xe5d/0x10d0 fs/ntfs3/frecord.c:3120
 ntfs_link_inode+0x265/0x310 fs/ntfs3/inode.c:1735
 ntfs_link+0x21d/0x500 fs/ntfs3/namei.c:146
 vfs_link+0x94c/0xb70 fs/namei.c:4739
 do_linkat+0x4f5/0xfd0 fs/namei.c:4809
 __do_sys_linkat fs/namei.c:4837 [inline]
 __se_sys_linkat fs/namei.c:4834 [inline]
 __x64_sys_linkat+0x186/0x230 fs/namei.c:4834
 x64_sys_call+0x37e1/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:266
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4091 [inline]
 slab_alloc_node mm/slub.c:4134 [inline]
 kmem_cache_alloc_noprof+0x637/0xb20 mm/slub.c:4141
 ntfs_link_inode+0x8f/0x310 fs/ntfs3/inode.c:1723
 ntfs_link+0x21d/0x500 fs/ntfs3/namei.c:146
 vfs_link+0x94c/0xb70 fs/namei.c:4739
 do_linkat+0x4f5/0xfd0 fs/namei.c:4809
 __do_sys_linkat fs/namei.c:4837 [inline]
 __se_sys_linkat fs/namei.c:4834 [inline]
 __x64_sys_linkat+0x186/0x230 fs/namei.c:4834
 x64_sys_call+0x37e1/0x3ba0 arch/x86/include/generated/asm/syscalls_64.h:266
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 10448 Comm: syz.4.1589 Not tainted 6.12.0-rc6-syzkaller-00272-gda4373fbcf00 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
=====================================================


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
