Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6CC27C162
	for <ntfs3@lists.linux.dev>; Mon, 29 Jun 2026 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760885; cv=none; b=aKyoQ0zwO3FRqMgXs2tufpvxPPmzO3V81uC6m+KfMBUxFTLtUmJYONX3WG3iMYDMGBMNHDjl6j7GFU4rtETTQZB60Cd8ZCcl6QnfBy4Zhly5srZ+ad7zqud7oDvQ/XqIT12+tIO+8bOJRBA2uMXE1R5ZoL/5exMNgSaFuaIolZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760885; c=relaxed/simple;
	bh=gObv1+N10UMNgGi0NRamTqbMClY79Ij7pPUvdET8ZYY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=g0/NDsJw0J8G7IFQpE2UoGY2yAuuIppoolgGhGL+yPMIlFqHfrDFTAoO+S7P1obxE0y5Wnb/OesEoIcwOOYCvPIBWRTMSyLap5tqMO0zv28QqX4uBF3UD/c/zdTI6dhU0UU3mx6p8Hh+5X3codg3mtbN8gcMtHixeUW6d4znwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-495b8b30310so2816191b6e.1
        for <ntfs3@lists.linux.dev>; Mon, 29 Jun 2026 12:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760883; x=1783365683;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6uN0DIJFEuCALiAXA/zS9OCPf9DsfpNlURZ91tEzM0=;
        b=RwgLynvIWFtnArFyxCEJrGW3GA4nrte8twugIjXDCppuU5MPiUXQGXP1ubJF+ogNJz
         QBQ8RtgVo0fHgozzpFNfhcLr5FBqNoxQ4rp2jgKwkGOXd/8dyQonZYeRP0oKpw47f0lj
         U+fRjlzOAqxp1e+baZYWrOg13R6EvwGqSI2i/opL3nJH2A4gahAhC6hNrgbOhP6TYPFF
         s9NKvhwVEWPCg44hpm5kgopybBGb+k8BZd5l5Jl3X7Pe/hU7e5CoPJU8+QmCiJ7FCpSB
         OYc1LvddMpf8EnVQvu6TyK9Rl8r2tm2+WDW6f9CprB6Az5AX73kDBhoVZZPPyq7sfNJb
         V5hA==
X-Forwarded-Encrypted: i=1; AFNElJ8eEriRD0TqzJwk44M2lELYL29LWEN8QptSLWGw/2YM+XubEqsUhUmP5Kpbcjng361a8IjxXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzvoCmVTYuu+Z/Qs/QNVRxu5Pt5396wLkFThHKP1DfQpOiR9PK
	BscVi7aeOtrO67mF2NvZWnTOBEdby+PcBC7OpKFh0NDob/qgvKKLKrZYR5MkMz+P6Mxp/5Wf97O
	fhj3AWOqwA1xBEep132P/x/w9NvgFAD7BuXxbHrSOWdNJbHrYAyBu/9xQVX4=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1c0f:b0:495:d79d:329b with SMTP id
 5614622812f47-495eb1463d6mr546637b6e.40.1782760883640; Mon, 29 Jun 2026
 12:21:23 -0700 (PDT)
Date: Mon, 29 Jun 2026 12:21:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a42c5b3.9dc7bc9d.3393b4.0007.GAE@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in ntfs_iomap_begin (2)
From: syzbot <syzbot+4b4ec878e25fafefa70f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    962528fef902 Merge tag 'gpio-fixes-for-v7.2-rc1' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17b6af41580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f9f817cd15d2732a
dashboard link: https://syzkaller.appspot.com/bug?extid=4b4ec878e25fafefa70f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7d3cfc78dc93/disk-962528fe.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/17f3cac25390/vmlinux-962528fe.xz
kernel image: https://storage.googleapis.com/syzbot-assets/80baf6bfce4e/bzImage-962528fe.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4b4ec878e25fafefa70f@syzkaller.appspotmail.com

loop1: detected capacity change from 0 to 4096
=====================================================
BUG: KMSAN: uninit-value in ntfs_iomap_begin+0x8a3/0x1550 fs/ntfs3/inode.c:781
 ntfs_iomap_begin+0x8a3/0x1550 fs/ntfs3/inode.c:781
 iomap_iter+0x9d9/0x14f0 fs/iomap/iter.c:110
 iomap_read_folio+0x67c/0xb20 fs/iomap/buffered-io.c:645
 ntfs_read_folio+0x74f/0x770 fs/ntfs3/inode.c:652
 filemap_read_folio mm/filemap.c:2510 [inline]
 do_read_cache_folio+0x96d/0x13d0 mm/filemap.c:4140
 do_read_cache_page mm/filemap.c:4206 [inline]
 read_cache_page+0x63/0x1e0 mm/filemap.c:4215
 read_mapping_page include/linux/pagemap.h:1009 [inline]
 inode_read_data+0xbb/0x560 fs/ntfs3/inode.c:1058
 ntfs_fill_super+0x720c/0x8820 fs/ntfs3/super.c:1582
 get_tree_bdev_flags+0x6ef/0x930 fs/super.c:1634
 get_tree_bdev+0x38/0x50 fs/super.c:1657
 ntfs_fs_get_tree+0x35/0x40 fs/ntfs3/super.c:1819
 vfs_get_tree+0xae/0x5d0 fs/super.c:1694
 fc_mount fs/namespace.c:1198 [inline]
 do_new_mount_fc fs/namespace.c:3765 [inline]
 do_new_mount+0x885/0x1dc0 fs/namespace.c:3841
 path_mount+0x7a2/0x20a0 fs/namespace.c:4161
 do_mount fs/namespace.c:4174 [inline]
 __do_sys_mount fs/namespace.c:4390 [inline]
 __se_sys_mount+0x704/0x7f0 fs/namespace.c:4367
 __x64_sys_mount+0xed/0x180 fs/namespace.c:4367
 x64_sys_call+0x39f0/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15d/0x3c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable lcn created at:
 ntfs_iomap_begin+0x157/0x1550 fs/ntfs3/inode.c:742
 iomap_iter+0x9d9/0x14f0 fs/iomap/iter.c:110

CPU: 0 UID: 0 PID: 5852 Comm: syz.1.9 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
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
