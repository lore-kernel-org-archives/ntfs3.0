Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29F8261B9C
	for <ntfs3@lists.linux.dev>; Tue, 23 Jun 2026 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782183691; cv=none; b=TJA0NptvkOmbW2EQTeghtI587oY7dYHQAKaFn7VWoVGqitY1YLr0hl2NwzZD4871uyh6bE+vYTVkXz010s/2/n7hwxb/IpGJbssng4qEUJXu7aGmA+N9W3hvRqXRa5TySWY8QLx79doMLHcNRIam8YLVDvvQIAY9IGo4/h3J2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782183691; c=relaxed/simple;
	bh=AtfGsO2YgOoLZ9BbKUlUiPafF+8rZx56OX5K80auQBM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K3RV0XHiAH3BYkNOUdnof08AfogtSm1zjuyj6fPSMEKZ18D16FN9rKqmCg7vlYKqzjc8No+RiXRSy3oia8MKPsGwskUj8TVE3JYsYZIq2OBUumfEGNPYQ3V6/vK7zMABZ8qFuHNC15jhhvdhm9A545jXXdqhxZzZNJZ/p/UhSPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-48e5de5a23cso1503372b6e.0
        for <ntfs3@lists.linux.dev>; Mon, 22 Jun 2026 20:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782183689; x=1782788489;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEV3A/55SmqgO3F+72x5NaSc2BBwlk6KFyIUEu1aVro=;
        b=LPAURwGCYrcsiQGz+B5hvy9m2Ng8sEsTDXUweMwUjIUjQR+sVPWOoYvCT/sqnz4QL0
         Wz3hHJCG3NIu8q2xtc97Rmj2tgxu8m2NBlyjNF1aAMmVh8JxXHqFeddq+7p4TftSEnWf
         jjmF72SbQupBVMf4149kvSunh+UTl0afUKuPZ99g2NFK99EKPgUUPpyRJyAt9tyXFQVT
         TyNndskFXCE+bUeKfRVtg1dZwfEJp9kB9cvfQV1S0oThZT6BoA1Wz1ArTlyYlwl08uLs
         71ZSh9R9B7c6VrSmerpx1u+dd7BoHZaDttMLnZks7QBacuAfXZEhPQ/83pOpHsglz8w+
         ztfg==
X-Forwarded-Encrypted: i=1; AFNElJ+9zGUHlB8ipK48OGfPqHDR/O6/Dj1BdcaSil+AbgmE0EDIt2xAJX8PRvaESAjJNWpKIwyAOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzILE7Kh6TlEHQslAeU5yXHTIgldJj1LAeWmn+/xq2TxaR8HqEU
	l7GBizYwDs9BWDqQrgQEV+pGsaYePuCmhK2rlCVfFsABPBdsxJs2uBW5lDDwdYM/u2CSh+i1x5y
	3oJf5xVqxavKIuk41zk2xmyVkylobp7wKEYs6j16OrH48DiG2lUw3Qqqrzlc=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:444b:b0:46c:e542:cc3e with SMTP id
 5614622812f47-48f2753377amr902862b6e.6.1782183688913; Mon, 22 Jun 2026
 20:01:28 -0700 (PDT)
Date: Mon, 22 Jun 2026 20:01:28 -0700
In-Reply-To: <6a14101f.050a0220.2385e8.0011.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a39f708.ac26f6c2.9a9c4.0004.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in attr_data_get_block_locked (2)
From: syzbot <syzbot+7be6ad5cb228286af3e3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    1dc18801be29 Merge tag 'i2c-7.2-part2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17ecdb7a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=94d9c5c9d8d33570
dashboard link: https://syzkaller.appspot.com/bug?extid=7be6ad5cb228286af3e3
compiler:       Debian clang version 22.1.6 (++20260514074242+fc4aad7b5db3-1~exp1~20260514074407.73), Debian LLD 22.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101cdb7a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17dea7a1580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2b813bcdd826/disk-1dc18801.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/42eb0df4dd35/vmlinux-1dc18801.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5e2abf42fb92/bzImage-1dc18801.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/217841d6611e/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7be6ad5cb228286af3e3@syzkaller.appspotmail.com

WARNING: The mand mount option has been deprecated and
         and is ignored by this kernel. Remove the mand
         option from the mount to silence this warning.
=======================================================
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
ntfs3(loop0): Failed to load $Extend (-22).
ntfs3(loop0): Failed to initialize $Extend.
------------[ cut here ]------------
1
WARNING: fs/ntfs3/attrib.c:1237 at attr_data_get_block_locked+0x1936/0x2610 fs/ntfs3/attrib.c:1237, CPU#1: syz.0.17/5827
Modules linked in:
CPU: 1 UID: 0 PID: 5827 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
RIP: 0010:attr_data_get_block_locked+0x1936/0x2610 fs/ntfs3/attrib.c:1237
Code: b0 b1 a7 fe 89 9c 24 90 00 00 00 41 29 dc 0f 83 cc 00 00 00 e8 ab af a7 fe 41 bf ea ff ff ff e9 7c fa ff ff e8 9b af a7 fe 90 <0f> 0b 90 41 bf ea ff ff ff e9 68 fa ff ff 48 8b 84 24 d8 00 00 00
RSP: 0018:ffffc9000476f9a0 EFLAGS: 00010293
RAX: ffffffff831d47f5 RBX: 00000000ffffffff RCX: ffff888036b38000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000476fbe8 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1f1385f R12: ffff88804c3010e8
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00005555611e4500(0000) GS:ffff888126242000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32863fff CR3: 000000003f434000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 attr_data_get_block+0x250/0x310 fs/ntfs3/attrib.c:982
 ntfs_fallocate+0x1048/0x12d0 fs/ntfs3/file.c:702
 vfs_fallocate+0x663/0x7f0 fs/open.c:338
 ksys_fallocate fs/open.c:362 [inline]
 __do_sys_fallocate fs/open.c:367 [inline]
 __se_sys_fallocate fs/open.c:365 [inline]
 __x64_sys_fallocate+0xbf/0x110 fs/open.c:365
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff0d001ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc29a8c788 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007ff0d0295fa0 RCX: 00007ff0d001ce59
RDX: 0000000000080000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007ff0d00b2e6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ff0d0295fac R14: 00007ff0d0295fa0 R15: 00007ff0d0295fa0
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
