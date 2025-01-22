Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DDA170A15
	for <ntfs3@lists.linux.dev>; Wed, 22 Jan 2025 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737538946; cv=none; b=U+84VzQ4phPHlmkdG5rUN1Jo0l5HpmL7ae9647wczZ6oReiTc6z8DeNWkVAljtKS6CqQrFNWtc2z5Smy76CkM8ooGp+Q/x426gn0lzXbcanWEs7/91kl0cF6Qy1g5A/dTYkzgkut4c88YQWhGi8dnVS6UF1rpwzl2GE7o91oxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737538946; c=relaxed/simple;
	bh=qfokqL8eTWB6UiuX2jP8ceSMkLf3HJ6Obq8g6ImDO4M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OKuNP6SBusqmhBzOiyp4KPo2/DFE9zmfWEAdlyFje+JBu8Uu8758vGbbu8Bc/l9wfRSqPKXZicH66a8ml4Rb/Ke6l6VW8pRbpJTQxjqR03oLXBroxSSrvp+JBvGL/UV5aGU3EPx6j9RzVri+JPh+NPG/UudqnpHlIROpBNmle+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3a9d4ea9e0cso45754105ab.0
        for <ntfs3@lists.linux.dev>; Wed, 22 Jan 2025 01:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538943; x=1738143743;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sr5aLHJc3T8kHmt/jenWtRkhLAj7VLQRwNGGlASUEHw=;
        b=n5a1UqrLHpZcVwVTTKwHuQuHWC2PRsCh81XgcqEUMRbIcKRU25wnwH3dEYvp0jY/vy
         o9y8/OpURV2A8XG4VDbDhktDIqKXmkzCF6XKll9yVA8ep0dUplKX5czVTLyrCBnGCPUq
         gIww6j1eAAJi3dgx1ucAnZ5C+ezly/Ap68NcPuTCkMDov9Gqga30nzWqJOjStus6qcvS
         thHp7OticBqIE9LnquQeqg86BJJ6RhjTue8Gpj9lFA4HZxp9xXR+L0n21OdMg25I/y/M
         1jCpocscJqlQ3qORXdmrbOZPl3epORO+9h26Bi7bL1CDMo6OHQmGwfzkgOmse/aBSMAM
         KGRw==
X-Forwarded-Encrypted: i=1; AJvYcCUJz7k9DrURusJ/xWzManC+9YHAErpn/WiaeQD4woxo681BtD8O1nPjhmuIYWlWwNkw8x3pwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsslhKPtPaw0wwJ8giTUz9wJRwTmSXp2XZAGa3hCEk7dhsyAa/
	6TzyPfpg46xogfpaQwqNOKB0yJ67GSQWHVU+s+tdmjBGHyAgQ/XCYrd7+mnUd/GZ5IbmAl26zbM
	0rHks+MJqCjCKqOMtYpX5NMTn+RBy629QwQ+mdbhLXl+cW0uUIE/3z/c=
X-Google-Smtp-Source: AGHT+IG19lCGRtyIqIyc6ImKeJv8HyCgEA5NFojakTI7u6hhj8HB9sCYToOSPJxCRWtpVfcRSMEaJMvxHD9n8RAeLG0SsOBmpdnF
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:460f:b0:3cf:b496:c60d with SMTP id
 e9e14a558f8ab-3cfb496c95dmr11198645ab.8.1737538943645; Wed, 22 Jan 2025
 01:42:23 -0800 (PST)
Date: Wed, 22 Jan 2025 01:42:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6790bd7f.050a0220.15cac.01f6.GAE@google.com>
Subject: [syzbot] [ntfs3?] kernel BUG in free_pages
From: syzbot <syzbot+877da6eed65fb43d21e8@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ad26fc09dabf Merge tag 'mm-hotfixes-stable-2025-01-16-21-1..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=153c11f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aadf89e2f6db86cc
dashboard link: https://syzkaller.appspot.com/bug?extid=877da6eed65fb43d21e8
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-ad26fc09.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e8c59e9a573f/vmlinux-ad26fc09.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8bfa2df81410/bzImage-ad26fc09.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+877da6eed65fb43d21e8@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at mm/page_alloc.c:4852!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5315 Comm: syz.0.0 Not tainted 6.13.0-rc7-syzkaller-00160-gad26fc09dabf #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:free_pages+0x47/0x50 mm/page_alloc.c:4852
Code: 3f f5 54 ff 48 c1 e8 06 48 83 e0 c0 48 bf 00 00 00 00 00 ea ff ff 48 01 c7 89 ee 5b 5d e9 01 fc ff ff 5b 5d c3 cc cc cc cc 90 <0f> 0b 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d455818 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 0000000000100000
RDX: ffffc9000ef9b000 RSI: 0000000000004b3b RDI: 0000000000004b3c
RBP: 0000000000000002 R08: ffffffff814d521e R09: 1ffffffff2854b31
R10: dffffc0000000000 R11: fffffbfff2854b32 R12: 0000000000000100
R13: 0000000000000246 R14: 00000000a0fc1979 R15: ffff888051d13620
FS:  00007f348123f6c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f348123efe0 CR3: 000000003f5ce000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 stack_depot_save_flags+0x7c6/0x940 lib/stackdepot.c:674
 kasan_save_stack mm/kasan/common.c:48 [inline]
 kasan_save_track+0x51/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4298 [inline]
 __kmalloc_noprof+0x285/0x4c0 mm/slub.c:4310
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kmalloc_array_noprof include/linux/slab.h:946 [inline]
 ntfs_compress_write+0x32c/0x2170 fs/ntfs3/file.c:1003
 ntfs_file_write_iter+0x4c4/0x7a0 fs/ntfs3/file.c:1266
 iter_file_splice_write+0xbfa/0x1510 fs/splice.c:743
 do_splice_from fs/splice.c:941 [inline]
 direct_splice_actor+0x11b/0x220 fs/splice.c:1164
 splice_direct_to_actor+0x586/0xc80 fs/splice.c:1108
 do_splice_direct_actor fs/splice.c:1207 [inline]
 do_splice_direct+0x289/0x3e0 fs/splice.c:1233
 ovl_copy_up_file+0x5ed/0x7e0 fs/overlayfs/copy_up.c:349
 ovl_copy_up_data+0x216/0x290 fs/overlayfs/copy_up.c:654
 ovl_copy_up_workdir fs/overlayfs/copy_up.c:796 [inline]
 ovl_do_copy_up fs/overlayfs/copy_up.c:1001 [inline]
 ovl_copy_up_one fs/overlayfs/copy_up.c:1202 [inline]
 ovl_copy_up_flags+0x1de9/0x4720 fs/overlayfs/copy_up.c:1257
 ovl_open+0x139/0x310 fs/overlayfs/file.c:211
 do_dentry_open+0xbe1/0x1b70 fs/open.c:945
 vfs_open+0x3e/0x330 fs/open.c:1075
 dentry_open+0x61/0xa0 fs/open.c:1098
 ima_calc_file_hash+0x16b/0x1b30 security/integrity/ima/ima_crypto.c:553
 ima_collect_measurement+0x520/0xb10 security/integrity/ima/ima_api.c:293
 process_measurement+0x1351/0x1fb0 security/integrity/ima/ima_main.c:372
 ima_file_check+0xd9/0x120 security/integrity/ima/ima_main.c:572
 security_file_post_open+0xb9/0x280 security/security.c:3121
 do_open fs/namei.c:3830 [inline]
 path_openat+0x2ccd/0x3590 fs/namei.c:3987
 do_filp_open+0x27f/0x4e0 fs/namei.c:4014
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1428
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3480385d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f348123f038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f3480576080 RCX: 00007f3480385d29
RDX: 0000000000000083 RSI: 0000000020000000 RDI: ffffffffffffff9c
RBP: 00007f3480401b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f3480576080 R15: 00007fff678b2b18
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:free_pages+0x47/0x50 mm/page_alloc.c:4852
Code: 3f f5 54 ff 48 c1 e8 06 48 83 e0 c0 48 bf 00 00 00 00 00 ea ff ff 48 01 c7 89 ee 5b 5d e9 01 fc ff ff 5b 5d c3 cc cc cc cc 90 <0f> 0b 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000d455818 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000ffffffff RCX: 0000000000100000
RDX: ffffc9000ef9b000 RSI: 0000000000004b3b RDI: 0000000000004b3c
RBP: 0000000000000002 R08: ffffffff814d521e R09: 1ffffffff2854b31
R10: dffffc0000000000 R11: fffffbfff2854b32 R12: 0000000000000100
R13: 0000000000000246 R14: 00000000a0fc1979 R15: ffff888051d13620
FS:  00007f348123f6c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f348123efe0 CR3: 000000003f5ce000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
