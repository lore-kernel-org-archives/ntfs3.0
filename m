Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89575205E3B
	for <ntfs3@lists.linux.dev>; Fri, 10 Jan 2025 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736510665; cv=none; b=akxi2R7ew4ZmjctBJNUJ7lABwNeBdAXBW3sb9gK389WhZKxrMhl/OY3bfNXPN0vtQ4Znjw//XkTAZbg3zIeXrfFGsqeuUwQMyHjW48KUC6JbrMY0vEqkEvaNmD8gb4FVxw73rBFqBkT2BySt8Q8qgQpZtbaHWjQvsXPvVl1SGk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736510665; c=relaxed/simple;
	bh=RXaAqc4cHLCh8dM8Ngxs4c5lHbrHr3V78MjJN45Ra3A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TVmH+j27ogqTEAI0DnUVKLRuxoDeOGOYFEz+fqVUK7g3Z2zyLZJz4XSFYlxHiwzrPJdNWIfOp9NJTQS4iUOzECy9e/XyA45wt/2X+3FHLFYcmqdlr0PRW0D408PRXsAWjUxEDDX8GYm3BaM743pTyk0Mlyxp3vN0zzR5jo1h9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3a9d4ea9e0cso15405985ab.0
        for <ntfs3@lists.linux.dev>; Fri, 10 Jan 2025 04:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736510663; x=1737115463;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6wz0qmdvIxkjSJVfJ54pyJIKSQ6F+x6FmJ4dary8/c=;
        b=die9tTKJ+qwCI0vJFnaSEKV+J0LwqRW6gNumHIRBlA8hem8hn4iS2QANimKyTFMSq3
         ZaJYeUsBUS9LUWqTj1uNfFPiGgPL5/dYeBlYwoXiQg2DGgB27E2mBcBDc3o0QG2XlJDa
         4Y+GgxHOgTjL4lBrJmJz3tb3x2nl404OLcafD2nzfhnttVuJgE8rjyQ+AZY3jSgnKNjn
         L0od5nnFQFnbqY7Ze1SJhm+4P5EZmoSfZryw7XnlXzDOBACotLzqDnEW8BeVkxIxMT1X
         MaZ1cHIg8cW7FE/f7KlMfDyXyYnROVi90Nr6MKq3wQI+rYDk94SY2/0PSEyiNnFkqxiJ
         eCtw==
X-Forwarded-Encrypted: i=1; AJvYcCUnJ/q/JrNSXSfmhUatqBCdgZftB9ytteMPPCodv+EeDVXHqq8TyPNlEOh8IPS/y71TN4G5SQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT/YkSDXIO9LYaFMn7V/0hxzGmL7fHYYFndypDWr06F7shNE1a
	tFcrNGS3ETut60ly6GvQNOEQRHQjJpLAEDhWGAsvDdbDoHSeocv+FuHy4lyNWFJ3MoY1nykX+RL
	MjJaFIzk5woAuw+3WbNqAGZv/ysbc0tURoLy30BMqtqE6wlV7FzvDM54=
X-Google-Smtp-Source: AGHT+IFHswhQSElXQ/iu0fk/jlW+bfnJIfW/loMFXxWxe91CitpRf26xPCp+CR+Q3dq9qeyVzPF4xhp94qbpaTK/YIl8ageNq5AM
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:611:0:b0:3ce:5af3:7804 with SMTP id
 e9e14a558f8ab-3ce5af3792amr8154995ab.4.1736510662750; Fri, 10 Jan 2025
 04:04:22 -0800 (PST)
Date: Fri, 10 Jan 2025 04:04:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67810cc6.050a0220.216c54.000a.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in errseq_set (2)
From: syzbot <syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ab75170520d4 Merge tag 'linux-watchdog-6.13-rc6' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=123db9c4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1c541fa8af5c9cc7
dashboard link: https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1694c4b0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4d752d5dc5aa/disk-ab751705.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/146ff38a4872/vmlinux-ab751705.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d68e63897d18/bzImage-ab751705.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/408bb252c479/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/bfab8e9839af/mount_2.gz
mounted in repro #3: https://storage.googleapis.com/syzbot-assets/50491d466be8/mount_4.gz
mounted in repro #4: https://storage.googleapis.com/syzbot-assets/bc4f27d22508/mount_9.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com

------------[ cut here ]------------
err = 556
WARNING: CPU: 0 PID: 8876 at lib/errseq.c:75 errseq_set+0xf8/0x120 lib/errseq.c:74
Modules linked in:
CPU: 0 UID: 0 PID: 8876 Comm: syz.3.725 Not tainted 6.13.0-rc5-syzkaller-00163-gab75170520d4 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:errseq_set+0xf8/0x120 lib/errseq.c:74
Code: 41 5e 41 5f 5d e9 73 d4 2d 07 e8 83 17 dd fc 44 89 e5 eb e7 e8 79 17 dd fc 90 48 c7 c7 80 6e 5f 8c 44 89 fe e8 39 bb 9d fc 90 <0f> 0b 90 90 44 89 e5 eb c8 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c
RSP: 0018:ffffc9000d71f0f0 EFLAGS: 00010246
RAX: 23ddfda9346a3700 RBX: ffff88805aeab7d8 RCX: ffff88803045bc00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 000000000000022c R08: ffffffff81602a82 R09: 1ffff110170c519a
R10: dffffc0000000000 R11: ffffed10170c519b R12: 0000000000000000
R13: 1ffff1100b5d56fb R14: ffff88805aeab908 R15: 000000000000022c
FS:  00007f359c4306c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5ae0e3af98 CR3: 0000000012bb0000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 __filemap_set_wb_err+0x22/0x210 mm/filemap.c:704
 mapping_set_error include/linux/pagemap.h:244 [inline]
 ntfs_resident_writepage+0x12c/0x220 fs/ntfs3/inode.c:883
 write_cache_pages+0xd2/0x230 mm/page-writeback.c:2659
 do_writepages+0x361/0x880 mm/page-writeback.c:2702
 filemap_fdatawrite_wbc mm/filemap.c:397 [inline]
 __filemap_fdatawrite_range mm/filemap.c:430 [inline]
 file_write_and_wait_range+0x2a3/0x3c0 mm/filemap.c:787
 __generic_file_fsync+0x6f/0x1a0 fs/libfs.c:1532
 generic_file_fsync+0x70/0xf0 fs/libfs.c:1573
 generic_write_sync include/linux/fs.h:2904 [inline]
 ntfs_file_write_iter+0x664/0x7a0 fs/ntfs3/file.c:1273
 iter_file_splice_write+0xbfc/0x1510 fs/splice.c:743
 do_splice_from fs/splice.c:941 [inline]
 direct_splice_actor+0x11d/0x220 fs/splice.c:1164
 splice_direct_to_actor+0x588/0xc80 fs/splice.c:1108
 do_splice_direct_actor fs/splice.c:1207 [inline]
 do_splice_direct+0x289/0x3e0 fs/splice.c:1233
 do_sendfile+0x564/0x8a0 fs/read_write.c:1363
 __do_sys_sendfile64 fs/read_write.c:1424 [inline]
 __se_sys_sendfile64+0x17c/0x1e0 fs/read_write.c:1410
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f359b585d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f359c430038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f359b776080 RCX: 00007f359b585d29
RDX: 0000000000000000 RSI: 0000000000000006 RDI: 0000000000000007
RBP: 00007f359b601b08 R08: 0000000000000000 R09: 0000000000000000
R10: 000000007ffff000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f359b776080 R15: 00007ffde2850328
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
