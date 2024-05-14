Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6B17F375
	for <ntfs3@lists.linux.dev>; Tue, 14 May 2024 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715703583; cv=none; b=kICv8hY9YnWxoCzUHnhKK5LpzDXrM2roSQ9BExpkRXmNDA5gtDpKy9aBSvx0ePEKSnkdTXX0zbLudMswvyUmAHvF1fkf/8Hoq+f1/60AJBvH3jrpzaPVbiaiOO6mhRVkvkgH2EiYhngxSlpB1Lu5keYpuIIFso1n5h1CGtEWylU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715703583; c=relaxed/simple;
	bh=+ByZcCnWf44fc+o7/2OuFFDEhl+hQdbp8vf3ww8oL0w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ENRDkDwnalC8nITrmtQmACQV/IH61e4dNa77zf5nKntFYFnCTY2apbQYzsZsJ7uJbLcpJvUc27tHtC8V8hYJfIy/37DmPCtCuFkvIqfy8XCCUpqy7MH/Y8qWdoBxYVHTY7P72v+ADC7RoRx8oVKOr4iYXzrYHETpRHp/cC4/9D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-7ddf0219685so736126939f.3
        for <ntfs3@lists.linux.dev>; Tue, 14 May 2024 09:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715703580; x=1716308380;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADKpUwPv38gh9DoDzpa2cLgvFE+ua1Pou5uj6pXFteU=;
        b=KbONcxqIhvFZYdD2QXUjGJcmHeaNkciU4Hfe7cpP+2ZLLSPqBXgjggJCkdZmR9RNfB
         ncQaKliJCZFMIilvZc+CHIlmZ5xCxwT/5zqQEtXXX+hbMLMIgcpyEy+QPaG98cdYGJZ/
         8i4Bk7SlVVA3XPgmkxCAsCLxOSgK2NqghLu1Agfjg3JwkjUcs/2Hr1xOWPCJiRiRAVLE
         UuyZxTlFZWQurpSHjLYfbWoVsUiR6t62G2MUWG8arHNGZjzYKfLc4Bz7co2zQbRUt40u
         tr7MsLOfAdF4T/b/POmgnav6/zTGvu9XoHpAAn8ZxyK2cpBQZm499s0u/A2r+4eGDnes
         4YWw==
X-Forwarded-Encrypted: i=1; AJvYcCVQKusAcnbeYl4RVUYlu5w1PX+pFg9Irv8Zn5flEDqy5XZzMa1zoGQidd54iqeYN70nnTkvouvYjpRYw+y8xPBi4n5MHxA=
X-Gm-Message-State: AOJu0YxWTXzL7WKLYRR7IU0DP1SK2epFD1bwkuecUmZ2nTYWgov/6/yg
	WdqiKiX9x4ReLwt3j3LyPFWq3tOXfH+1MOkWAi2WCsRLjwRKGGyJGaH2TlxskxucwObU5b0zFwK
	2bfm2zs5JQOGClSJ45bCRYdNqj0Gs18gZttDHNcnMk17rKhlcWpLuhPs=
X-Google-Smtp-Source: AGHT+IF7IuSg4JHHBlLC1BzD0nSErtMxpgz+gfvbW6aB8JzPG4hjusDPW4HIDtmg7y8X4ZIsJ5yCZi8LA+r9BlL17mMeI0AGT7Vy
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1351:b0:7cc:2522:f5fd with SMTP id
 ca18e2360f4ac-7e1b51a9835mr87941539f.1.1715703580705; Tue, 14 May 2024
 09:19:40 -0700 (PDT)
Date: Tue, 14 May 2024 09:19:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000077d29606186c5e99@google.com>
Subject: [syzbot] [ntfs3?] UBSAN: array-index-out-of-bounds in decompress_lznt
From: syzbot <syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f4345f05c0df Merge tag 'block-6.9-20240510' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15035598980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d7ea7de0cb32587
dashboard link: https://syzkaller.appspot.com/bug?extid=39b2fb0f2638669008ec
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16375db8980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ef17a8980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eab3aead3b47/disk-f4345f05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/64d327c02024/vmlinux-f4345f05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0191e269a6fd/bzImage-f4345f05.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/293e623536d7/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/165c0c1a16ff/mount_1.gz

The issue was bisected to:

commit d68968440b1a75dee05cfac7f368f1aa139e1911
Author: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Date:   Mon Jan 29 07:30:09 2024 +0000

    fs/ntfs3: Update inode->i_size after success write into compressed file

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13472020980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10c72020980000
console output: https://syzkaller.appspot.com/x/log.txt?x=17472020980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+39b2fb0f2638669008ec@syzkaller.appspotmail.com
Fixes: d68968440b1a ("fs/ntfs3: Update inode->i_size after success write into compressed file")

------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/ntfs3/lznt.c:240:16
index 9 is out of range for type 'const size_t[9]' (aka 'const unsigned long[9]')
CPU: 1 PID: 5072 Comm: syz-executor335 Not tainted 6.9.0-rc7-syzkaller-00136-gf4345f05c0df #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
 decompress_chunk fs/ntfs3/lznt.c:240 [inline]
 decompress_lznt+0x229/0xd50 fs/ntfs3/lznt.c:387
 ni_read_frame+0x1633/0x1c50 fs/ntfs3/frecord.c:2684
 ni_readpage_cmpr+0x38b/0xa60 fs/ntfs3/frecord.c:2143
 ntfs_read_folio+0x19e/0x210 fs/ntfs3/inode.c:725
 filemap_read_folio+0x1a0/0x790 mm/filemap.c:2331
 filemap_update_page mm/filemap.c:2415 [inline]
 filemap_get_pages+0x15a9/0x2090 mm/filemap.c:2529
 filemap_read+0x457/0xfa0 mm/filemap.c:2601
 __kernel_read+0x5c8/0xab0 fs/read_write.c:434
 integrity_kernel_read+0xb0/0x100 security/integrity/iint.c:28
 ima_calc_file_hash_tfm security/integrity/ima/ima_crypto.c:485 [inline]
 ima_calc_file_shash security/integrity/ima/ima_crypto.c:516 [inline]
 ima_calc_file_hash+0xadb/0x1b30 security/integrity/ima/ima_crypto.c:573
 ima_collect_measurement+0x535/0xa90 security/integrity/ima/ima_api.c:291
 process_measurement+0x13ac/0x1f60 security/integrity/ima/ima_main.c:359
 ima_file_check+0xf2/0x170 security/integrity/ima/ima_main.c:559
 security_file_post_open+0x6d/0xa0 security/security.c:2981
 do_open fs/namei.c:3644 [inline]
 path_openat+0x28b7/0x3240 fs/namei.c:3799
 do_filp_open+0x235/0x490 fs/namei.c:3826
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1406
 do_sys_open fs/open.c:1421 [inline]
 __do_sys_open fs/open.c:1429 [inline]
 __se_sys_open fs/open.c:1425 [inline]
 __x64_sys_open+0x225/0x270 fs/open.c:1425
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbd0c2059b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffa3c72cd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007fffa3c72ea8 RCX: 00007fbd0c2059b9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000020000180
RBP: 00007fbd0c298610 R08: 00007fffa3c72ea8 R09: 00007fffa3c72ea8
R10: 00007fffa3c72ea8 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fffa3c72e98 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
---[ end trace ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
