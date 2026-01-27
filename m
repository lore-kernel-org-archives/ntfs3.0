Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD088191484
	for <ntfs3@lists.linux.dev>; Tue, 27 Jan 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537610; cv=none; b=XPVD2XzLsNC9r8uX9XlpxTU7OeL7UW2F/IIApXE2P+lcqFnvLOisIf2HVlnYcr29u+GWaXxt3h34HPQE/uc+8KX301jWzTjpG0GbrrvnSCUIhEVq7AEO3ZU/pe5vlbnyYn8+8cxonp2Ez0JJWiCHkROwATDmiaKFdK+Dr2oF7UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537610; c=relaxed/simple;
	bh=Y+4uOXL1hf7jryeCbI3R8q3o3cau88PJ+DWxQ4qya7s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t4UDW2Euo2cTYbtwNOPKKZXAIptvmFho4NXnCkjLOR2RVMn4jocw3EBBOJpSTgkwqB8aJhLFFlGkNW5A8hdexyTYZb2oZo2iFkm0d2RcJjnUwLs1OuDWeFVEoPKisa3hZWcu/QTxmYhabL414rf/XxqJWrWVai9MtFRk5RhoFa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-45c8d5caf62so9267193b6e.3
        for <ntfs3@lists.linux.dev>; Tue, 27 Jan 2026 10:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537607; x=1770142407;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2GpmkdlG30wJRTii74Y3uN7V1Hho4ccCUFFmTro9qw=;
        b=RRfl9tIcglAUUqqA3KYGJfFcZHLFCGHI2WchocLqzU3BkmHCrq3N0EhHfxp3Z6CKUJ
         J8XUT74pn2kkiZ30cb9QCZ/HE7Y8+LGJdwQkrJcFWXvtHFyA0NMMS5nMhedaDZvZ7rOP
         8BHlN6efDwkN24fvvX5r8yzoiHddMOspjCUBBTVJMe+lvNe0vV5/htcmEDW+W0zSDxb6
         zQ4gLtkr3A6TwDpeHYJ0aJFcdi8e+MsD2oZh3qf31MYoL4Ko5cZ608SasSJzpBKlhXX/
         OxEoEj+SXhiUlPB4smNu9vAmf4elV5JVuV4oOsg4HrL2X1rsxwh1YNW2oqTM7qowEeTi
         zk2A==
X-Forwarded-Encrypted: i=1; AJvYcCVKipQVb0vPWuGHmFLP25E48HyGEBtPeiOsVvH0qqPJE6xwSLwPf6X5dCZGaybjj9q7D2IUEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlhnMvuXgXpDP9DE/WM9nc21j1oQM6JJwPOnJuiUbmI4mLSItK
	XHM8mD7qhRFVSKbn+KNXbSlCHRYNcD9JQy4l1BlsbgELZWuDDPOwOHtpk/ljC4jADikRxHU4wfp
	3PmbjLyuAQdSiyACz7qbsA/tvK0eJveRBD4H1YKbNhk3CaWjbAyQYjKe5qYs=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:414:b0:662:f30e:d56d with SMTP id
 006d021491bc7-662f30ed659mr959007eaf.7.1769537606217; Tue, 27 Jan 2026
 10:13:26 -0800 (PST)
Date: Tue, 27 Jan 2026 10:13:26 -0800
In-Reply-To: <6853c671.050a0220.216029.01c8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69790046.050a0220.c9109.0021.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in wnd_add_free_ext (4)
From: syzbot <syzbot+323f07d372f692a127b3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    fcb70a56f4d8 Merge tag 'vfs-6.19-rc8.fixes' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14201fb3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4aae00ac5a9d2645
dashboard link: https://syzkaller.appspot.com/bug?extid=323f07d372f692a127b3
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c76bfa580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1741c98a580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-fcb70a56.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d1800162cc24/vmlinux-fcb70a56.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a90ccad4f274/bzImage-fcb70a56.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/f27c3213c497/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/232aeef0d4ba/mount_5.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=17fd705a580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+323f07d372f692a127b3@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fca63c16128 R14: 00007fca63c16090 R15: 00007ffedc73d3d8
 </TASK>
------------[ cut here ]------------
1
WARNING: fs/ntfs3/bitmap.c:217 at rb_insert_start fs/ntfs3/bitmap.c:217 [inline], CPU#0: syz.0.18/5481
WARNING: fs/ntfs3/bitmap.c:217 at wnd_add_free_ext+0xb92/0xe60 fs/ntfs3/bitmap.c:352, CPU#0: syz.0.18/5481
Modules linked in:
CPU: 0 UID: 0 PID: 5481 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:rb_insert_start fs/ntfs3/bitmap.c:217 [inline]
RIP: 0010:wnd_add_free_ext+0xb92/0xe60 fs/ntfs3/bitmap.c:352
Code: 00 00 00 fc ff df 80 3c 08 00 74 08 4c 89 ff e8 44 8a 14 ff 4d 89 2f 4c 89 ef 48 89 de e8 b6 5e 7a 08 eb 0d e8 3f af aa fe 90 <0f> 0b 90 4c 8b 24 24 48 b8 00 00 00 00 00 fc ff df 48 8b 4c 24 30
RSP: 0018:ffffc90003f677c8 EFLAGS: 00010293
RAX: ffffffff8319d7b1 RBX: ffff88804437a2e0 RCX: ffff888000be8000
RDX: 0000000000000000 RSI: 0000000000000019 RDI: 0000000000000019
RBP: 0000000000000019 R08: ffff888047706c2b R09: 1ffff11008ee0d85
R10: dffffc0000000000 R11: ffffed1008ee0d86 R12: dffffc0000000000
R13: ffff88804a4c96c0 R14: ffff88804a5346c0 R15: 0000000000000019
FS:  00007fca648f46c0(0000) GS:ffff88808ccea000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fca648f3ff8 CR3: 0000000052ad1000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 wnd_set_free+0x4bf/0x5c0 fs/ntfs3/bitmap.c:743
 mark_as_free_ex+0x1c8/0x390 fs/ntfs3/fsntfs.c:2489
 run_unpack+0x7aa/0xc90 fs/ntfs3/run.c:1037
 run_unpack_ex+0xd2/0xb90 fs/ntfs3/run.c:1078
 ni_delete_all+0x363/0x8a0 fs/ntfs3/frecord.c:1562
 ni_clear+0x315/0x530 fs/ntfs3/frecord.c:108
 evict+0x61e/0xb10 fs/inode.c:837
 do_unlinkat+0x354/0x590 fs/namei.c:5452
 __do_sys_unlink fs/namei.c:5483 [inline]
 __se_sys_unlink fs/namei.c:5481 [inline]
 __x64_sys_unlink+0x47/0x50 fs/namei.c:5481
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fca6399aeb9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fca648f4028 EFLAGS: 00000246 ORIG_RAX: 0000000000000057
RAX: ffffffffffffffda RBX: 00007fca63c16090 RCX: 00007fca6399aeb9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000200000000180
RBP: 00007fca648f4090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fca63c16128 R14: 00007fca63c16090 R15: 00007ffedc73d3d8
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
