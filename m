Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671213774D
	for <ntfs3@lists.linux.dev>; Sun,  5 Oct 2025 23:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759707091; cv=none; b=iPKWKMVYUiJ4Z+b0iCWaU3gIJw8IPi3th/nNvH1Pxs/dYwhcjhanjllgH43Pv/M1zev4feUsoRauXJ4kvKW+fObfYUWZnM+RRNR0RRuB3zk2E3OMUsDdhC5eUp04cIgJv2T46T5/TERzVPVJYECUDrXfU1Cvpw7q51qZo0dthz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759707091; c=relaxed/simple;
	bh=1+MD3b+BSFBSTHNROUIea4pj/51L2LP31bTva7rkKNg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DgwQvju91M/weqbdZOOoO1WfUc3P8CJZrtyEMFhwxya1ai7mUTQKUJwL/P84kCWSpeDhJd+/BeaVunGZMdnnZ9m8+5HPs3GvVwueUZ1PL6MMx3ePIbHJ1oSfRSTzJfgliTdnbd3APPeKKtWOncVSZrvx6S7pAEwqeSsQn9268us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-4257567fb7cso50023495ab.2
        for <ntfs3@lists.linux.dev>; Sun, 05 Oct 2025 16:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759707089; x=1760311889;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kadEXU9241HUKuxJ303gt6YDJdGsW3GyDnB820qBrVA=;
        b=KkRjSrCuikexQDcJwCCHPp5dikCHNliA0CMUcMldzdGL1ZYU+bA7KjN68sUYExjyyn
         LS71hOh0yZjPFlgkb5BcJeynd4rkwd0BEwmsdYafQQXvE85lwPdxjOiZGavNOWWAAOlu
         5wzXmEhnKqOxVxj49pWLAYRf+FbKm3S10I4PVLVW81Ln8T+LybgXSSGoVKoTCrb5bU8e
         GKkNtDUcz5mLFsoBnOMW/q76ifg4DLyF1cJ9adq+LBxoUJyEhbLiYV8veROF1uxML95d
         KZb0SCrmCl/kT74N2Ggh5TT9l+X6ZTlvv4qwj+6wUxW0UpDdIL+q3sx3NyTUpq4HYdux
         xXnw==
X-Forwarded-Encrypted: i=1; AJvYcCWmyIUp3pNKI7Kjv0rSl4Zkc0mN6ptCXMHRMGwdCcZZWlmLReC6E/fLfP5IOP+IhHZ3MMTaHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPr+4/uOn7wf/QwwTPzN7Co/4qNKRroeJgx1gPBnzXQ63rRWRy
	mHooyBCH7kPHWFjJNhwIL/8RU44V/Jn74EaTqrLO4IVPyfjSFdHzi57TlG7QP1rLOGE3wwJpL/0
	8xWSkCfVCszbse7VMt3qbtw7FNQhtUM32cKRNaPd75Q4FifKZzub0ischpeg=
X-Google-Smtp-Source: AGHT+IGMMXp8ZEJmOc4x82nRVaMkJWpdgmmYE8O7ykyQ7N3XrHm+m4cHh7Yl2qZ78jExpj7M14INf9px3MCFOXh5S15HfIluU2w9
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1846:b0:427:a3b1:316f with SMTP id
 e9e14a558f8ab-42e7ad2f02fmr168931665ab.13.1759707088966; Sun, 05 Oct 2025
 16:31:28 -0700 (PDT)
Date: Sun, 05 Oct 2025 16:31:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68e2ffd0.050a0220.2c17c1.003b.GAE@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in attr_set_size
From: syzbot <syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9b0d551bcc05 Merge tag 'pull-misc' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11da692f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50fb29d81ff5a3df
dashboard link: https://syzkaller.appspot.com/bug?extid=83c9dd5c0dcf6184fdbf
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143915cd980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13dbd334580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/90b0fb888152/disk-9b0d551b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1120c646f284/vmlinux-9b0d551b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/df9bbfa8cbe6/bzImage-9b0d551b.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/0277c876bf11/mount_8.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+83c9dd5c0dcf6184fdbf@syzkaller.appspotmail.com

ntfs3(loop0): Failed to initialize $Extend.
=====================================================
BUG: KMSAN: uninit-value in attr_set_size+0x471b/0x6740 fs/ntfs3/attrib.c:653
 attr_set_size+0x471b/0x6740 fs/ntfs3/attrib.c:653
 ntfs_set_size+0x222/0x330 fs/ntfs3/inode.c:861
 ntfs_extend+0x27c/0xf50 fs/ntfs3/file.c:359
 ntfs_file_write_iter+0x627/0x10d0 fs/ntfs3/file.c:1220
 iter_file_splice_write+0x12b2/0x2170 fs/splice.c:738
 ntfs_file_splice_write+0x21d/0x370 fs/ntfs3/file.c:1347
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x317/0x7d0 fs/splice.c:1161
 splice_direct_to_actor+0x99f/0x1550 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x1e0/0x350 fs/splice.c:1230
 do_sendfile+0x9eb/0x1110 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x1e3/0x280 fs/read_write.c:1417
 __x64_sys_sendfile64+0xbd/0x120 fs/read_write.c:1417
 x64_sys_call+0x36b8/0x3e30 arch/x86/include/generated/asm/syscalls_64.h:41
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 attr_set_size+0x4714/0x6740 fs/ntfs3/attrib.c:655
 ntfs_set_size+0x222/0x330 fs/ntfs3/inode.c:861
 ntfs_extend+0x27c/0xf50 fs/ntfs3/file.c:359
 ntfs_file_write_iter+0x627/0x10d0 fs/ntfs3/file.c:1220
 iter_file_splice_write+0x12b2/0x2170 fs/splice.c:738
 ntfs_file_splice_write+0x21d/0x370 fs/ntfs3/file.c:1347
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x317/0x7d0 fs/splice.c:1161
 splice_direct_to_actor+0x99f/0x1550 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x1e0/0x350 fs/splice.c:1230
 do_sendfile+0x9eb/0x1110 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x1e3/0x280 fs/read_write.c:1417
 __x64_sys_sendfile64+0xbd/0x120 fs/read_write.c:1417
 x64_sys_call+0x36b8/0x3e30 arch/x86/include/generated/asm/syscalls_64.h:41
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ni_create_attr_list+0x1b9b/0x1db0 fs/ntfs3/frecord.c:872
 attr_set_size+0x4174/0x6740 fs/ntfs3/attrib.c:640
 ntfs_set_size+0x222/0x330 fs/ntfs3/inode.c:861
 ntfs_extend+0x27c/0xf50 fs/ntfs3/file.c:359
 ntfs_file_write_iter+0x627/0x10d0 fs/ntfs3/file.c:1220
 iter_file_splice_write+0x12b2/0x2170 fs/splice.c:738
 ntfs_file_splice_write+0x21d/0x370 fs/ntfs3/file.c:1347
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x317/0x7d0 fs/splice.c:1161
 splice_direct_to_actor+0x99f/0x1550 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x1e0/0x350 fs/splice.c:1230
 do_sendfile+0x9eb/0x1110 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x1e3/0x280 fs/read_write.c:1417
 __x64_sys_sendfile64+0xbd/0x120 fs/read_write.c:1417
 x64_sys_call+0x36b8/0x3e30 arch/x86/include/generated/asm/syscalls_64.h:41
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5245 [inline]
 __do_kmalloc_node mm/slub.c:5602 [inline]
 __kmalloc_noprof+0xabb/0x1b40 mm/slub.c:5615
 kmalloc_noprof include/linux/slab.h:961 [inline]
 ni_create_attr_list+0x1ca/0x1db0 fs/ntfs3/frecord.c:770
 attr_set_size+0x4174/0x6740 fs/ntfs3/attrib.c:640
 ntfs_set_size+0x222/0x330 fs/ntfs3/inode.c:861
 ntfs_extend+0x27c/0xf50 fs/ntfs3/file.c:359
 ntfs_file_write_iter+0x627/0x10d0 fs/ntfs3/file.c:1220
 iter_file_splice_write+0x12b2/0x2170 fs/splice.c:738
 ntfs_file_splice_write+0x21d/0x370 fs/ntfs3/file.c:1347
 do_splice_from fs/splice.c:938 [inline]
 direct_splice_actor+0x317/0x7d0 fs/splice.c:1161
 splice_direct_to_actor+0x99f/0x1550 fs/splice.c:1105
 do_splice_direct_actor fs/splice.c:1204 [inline]
 do_splice_direct+0x1e0/0x350 fs/splice.c:1230
 do_sendfile+0x9eb/0x1110 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1431 [inline]
 __se_sys_sendfile64+0x1e3/0x280 fs/read_write.c:1417
 __x64_sys_sendfile64+0xbd/0x120 fs/read_write.c:1417
 x64_sys_call+0x36b8/0x3e30 arch/x86/include/generated/asm/syscalls_64.h:41
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 6199 Comm: syz.0.54 Not tainted syzkaller #0 PREEMPT(none) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
=====================================================


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
