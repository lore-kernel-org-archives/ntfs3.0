Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4347478
	for <ntfs3@lists.linux.dev>; Sun, 22 Feb 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771760014; cv=none; b=O1UIkGJK6unpNX/UIctNWuu2CNxpPtjrYNOx7D09Xkri3GIXkKpiLFX4mzfsgrym9BOOV/cn8rCz9wALanSC/MHvUvmqY+gMfNAaNssQU+77ZezIBUKiz9PxEOSsiO8ssNO1OdvE7R4S7wj1NQ9xTGNGcnUNdt4DgX8rVWNRtJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771760014; c=relaxed/simple;
	bh=nKQqtmGdxJX5nKIF58On0KpBmHuoSv/PRRCuDLAMKiw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Sb9bAWKnWavU9lajsyUKqO/GrlOeDYjDwBs+O1tgddMAAdFmcG4bwoSNhU9NJ2qMCC0Gbq7M08/oSXoBGwb+99twgUaPqqcoToBDK4w234MFHkYLibeeu9l/jhMhF7LLcFETbUNdPHAmkuofaYwxZW7JgE7PKzYWCoDic6sINxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463a018f61bso14913820b6e.3
        for <ntfs3@lists.linux.dev>; Sun, 22 Feb 2026 03:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771760012; x=1772364812;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYoBAW/MPVGCjYQSshvx0sQlu2SigvEiHv5kTHYQJFw=;
        b=IRzeURrPtr1GRfdph9FadBWWpCaFSPpKu3Pr5fw9CDgWPT7s+CtQ0+7W2wk0Jnz0Sg
         sDYNQYSjdwXzeZlFYpujTEAegXa8Fr6AroKwzbarosEXfVo59BB5pH9s6GgMSZjbn5vu
         5bwOyIvrPBVVsgMQuSjK+XozTPJPMOJOtIohS+L6hKFPFeuiocP9cMVbZVI8IOOGrQUn
         mN1mbUMdmprC3a/tlWGHkMlhDq6BfL/2OoBEIug/QwjmAbn/9F3ZVUXN/tYIgZ58e0zt
         r9YC1igL9MBLXal+RsDi+Bt7mhDB5ofOI67SL7UsmBCv3CKsuwEf++JThrGF0lDQ21Dh
         BQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjwUg3jyeTvG2tOXKDHVmEB0uD2maSXRx5JE+blvw3xUgVVf5HGqOTHnrAPHiDtP7UfAdF3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yza707mqaoag7zoKDj2dvDlLjkH4fwT3FKjUiZDDgENUBhGH2SR
	w6Un29B0e3DTVtv3rYrQDhlKYe0vySzWSBl9bNSfmD27JByMeZOjcb0++d+ChO28zz1e6hgz1Os
	XBXa1X9aLzdA3p7jWaoYcUtmx1vrAk0C18pLHQSvrreThERqUWyxHivyojU8=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2290:b0:662:c6f1:9231 with SMTP id
 006d021491bc7-679c424cd4amr3009829eaf.4.1771760011921; Sun, 22 Feb 2026
 03:33:31 -0800 (PST)
Date: Sun, 22 Feb 2026 03:33:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <699ae98b.050a0220.340abe.0d30.GAE@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in ntfs_iomap_begin
From: syzbot <syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d79526b89571 Merge tag 'spi-fix-v7.0-merge-window' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17c90006580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e9e76fdaa4072fa5
dashboard link: https://syzkaller.appspot.com/bug?extid=7be88937363ac7ab7bb0
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1016255a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16197c02580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9632d1edcebe/disk-d79526b8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c9f69df31226/vmlinux-d79526b8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54f77eae730c/bzImage-d79526b8.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/62ad4352d8b0/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (2048) and media sector size (512).
=====================================================
BUG: KMSAN: uninit-value in ntfs_iomap_begin+0x8c0/0x1460 fs/ntfs3/inode.c:825
 ntfs_iomap_begin+0x8c0/0x1460 fs/ntfs3/inode.c:825
 iomap_iter+0x9b7/0x1540 fs/iomap/iter.c:110
 iomap_read_folio+0x262/0x750 fs/iomap/buffered-io.c:587
 ntfs_read_folio+0x74a/0x770 fs/ntfs3/inode.c:697
 filemap_read_folio mm/filemap.c:2496 [inline]
 do_read_cache_folio+0x993/0x1470 mm/filemap.c:4096
 do_read_cache_page mm/filemap.c:4162 [inline]
 read_cache_page+0x63/0x1e0 mm/filemap.c:4171
 read_mapping_page include/linux/pagemap.h:1022 [inline]
 inode_read_data+0xb3/0x6b0 fs/ntfs3/inode.c:1116
 ntfs_fill_super+0x6a24/0x7e50 fs/ntfs3/super.c:1549
 get_tree_bdev_flags+0x6e6/0x920 fs/super.c:1694
 get_tree_bdev+0x38/0x50 fs/super.c:1717
 ntfs_fs_get_tree+0x35/0x40 fs/ntfs3/super.c:1788
 vfs_get_tree+0xb3/0x5d0 fs/super.c:1754
 fc_mount fs/namespace.c:1193 [inline]
 do_new_mount_fc fs/namespace.c:3760 [inline]
 do_new_mount+0x885/0x1dd0 fs/namespace.c:3836
 path_mount+0x7a2/0x20b0 fs/namespace.c:4146
 do_mount fs/namespace.c:4159 [inline]
 __do_sys_mount fs/namespace.c:4348 [inline]
 __se_sys_mount+0x704/0x7f0 fs/namespace.c:4325
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4325
 x64_sys_call+0x39f0/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable lcn created at:
 ntfs_iomap_begin+0x15d/0x1460 fs/ntfs3/inode.c:786
 iomap_iter+0x9b7/0x1540 fs/iomap/iter.c:110

CPU: 1 UID: 0 PID: 6051 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
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
