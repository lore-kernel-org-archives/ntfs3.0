Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A1284B2F
	for <ntfs3@lists.linux.dev>; Tue,  4 Nov 2025 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762227393; cv=none; b=f1baUXrhJiQ9kNBp9xP4jak1GLzcS4FA3BITuyVLsmsB60NPmVjHVzrwd7Zuk45vthzq9sOJXIPdRlWZgXgzMxtFMnuQ1Jbh4xmgcGMW12u0GSLEgRdqtRda9C7MCiulmsg2HcZwTH7dB5TzotsZx4V9OJSN1sE0RvIt3uL4esY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762227393; c=relaxed/simple;
	bh=iEC44yq+iQANl7AKeaG+v0K3HIif0LN8xGRMtTZ/GOY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HK500V5iJ3vjWEp2T9VhvfoSqcHNDnNvava03P2MlECzMslptxx+UqDyAQGdkrczhfJG1sWs0N3yLhWW82LINF+neb+j39C/5JWUEA7yBjXwjFuAdctz8kcnpPWXp3abxT/99mBDPjTx9UdHTwx+c9nNWwe1TaW+7KAbCfum7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-43300f41682so48083245ab.1
        for <ntfs3@lists.linux.dev>; Mon, 03 Nov 2025 19:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762227390; x=1762832190;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UFcgo3bUUx/B/KchmX4wvNYq0kKsA/zQaasThnmZ2IY=;
        b=ebDapbLnXEt25iCm+DbdSIEDohqBnAhpCSbHJeP4Kp3BJ/ne7ZNvzWup9yWDUfVAFl
         ektpqbkzj9w2KkxiRJxhheSF7G9o6/p4ye4bRtPF6dnKZ0kNptk8WuxmlL+e6uUpLbFy
         /MmlQ/YpEe0MhpqJNQX1C+tWarj4hZW4p1XZqAthunSZ5ypFgfR5/9pnoeVQFSddXHeO
         MHuvUPuKsRIyvBXeFelmmpj0QO5pZuEkHhdTbcyUae1pBwhPqjs1Ep8B7cmzmvFRWFrd
         ET2cZsAkWrqzg6WxNt5IhxiNFag7dFMwxgWBk230yfxDzedfm6WQx48XKeu0qjPHgTsA
         wC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWenmXmXne1FNR+blre5gWg3V/z9z0wR2fwuRPscJzRNmUBxClnCYVv1hUyTZ3MovZ2En3rIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg6x7pEnkfmHhnrFEU+UIWTmp5kKBYK0YnCt6dkJniySEq5Ajx
	+GrtuWCt103i8HeMd5Tu684rGUQWYLKGcOBzZB7RLGRQRBp8GJAlODfL8ofgElSAXkeN5pKGSD8
	w4ExOx+qIGWCIA8NK+1JY6+CmhDhWO3Onlgp9QZJCjyadsMY4ltKQxt3ntkE=
X-Google-Smtp-Source: AGHT+IE1xciySPEHxwZMYsDD5hYo4iT6iysGDEQ1v3xOdG/vUAF6DvNlQh0Uwh7EFMb1PVtctccGzWHfP39cbZTlw2pMUrRPVh/d
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3802:b0:433:3428:413c with SMTP id
 e9e14a558f8ab-433342841afmr56167295ab.0.1762227390521; Mon, 03 Nov 2025
 19:36:30 -0800 (PST)
Date: Mon, 03 Nov 2025 19:36:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <690974be.050a0220.98a6.009b.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in generic_shutdown_super
From: syzbot <syzbot+cac5fae1f16b9bec64d3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    131f3d9446a6 Add linux-next specific files for 20251030
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=125cdf34580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=63d09725c93bcc1c
dashboard link: https://syzkaller.appspot.com/bug?extid=cac5fae1f16b9bec64d3
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4e9ddffcaef3/disk-131f3d94.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/da45f389fd4f/vmlinux-131f3d94.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f5312dd97449/bzImage-131f3d94.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cac5fae1f16b9bec64d3@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: mm/slub.c:6762 at free_large_kmalloc+0x15c/0x1f0 mm/slub.c:6762, CPU#1: syz-executor/5826
Modules linked in:
CPU: 1 UID: 0 PID: 5826 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:free_large_kmalloc+0x15c/0x1f0 mm/slub.c:6762
Code: 44 89 f6 e8 16 d1 fc ff 65 48 8b 05 fe 06 58 10 48 3b 44 24 08 75 57 48 83 c4 10 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc cc 90 <0f> 0b 90 65 48 8b 05 d9 06 58 10 48 3b 44 24 08 75 32 48 89 df 48
RSP: 0018:ffffc9000403fc88 EFLAGS: 00010206
RAX: 00000000ff000000 RBX: ffffea0000389080 RCX: ffffea0000389088
RDX: 0000000000000000 RSI: ffffffff8e2420e0 RDI: ffffea0000389080
RBP: 1ffff1100dd09d43 R08: ffffffff8f7d6777 R09: 1ffffffff1efacee
R10: dffffc0000000000 R11: fffffbfff1efacef R12: 1ffff1100dd09d36
R13: dffffc0000000000 R14: ffff88806e84e9b0 R15: ffff888078913308
FS:  0000555571060500(0000) GS:ffff888125fe5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c3de4e1 CR3: 0000000078b0e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 generic_shutdown_super+0x135/0x2c0 fs/super.c:643
 kill_block_super+0x44/0x90 fs/super.c:1723
 ntfs3_kill_sb+0x44/0x1b0 fs/ntfs3/super.c:1847
 deactivate_locked_super+0xbc/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1317
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xe9/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9b943902f7
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc6a8bafa8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f9b94411d7d RCX: 00007f9b943902f7
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc6a8bb060
RBP: 00007ffc6a8bb060 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc6a8bc0f0
R13: 00007f9b94411d7d R14: 000000000001c88b R15: 00007ffc6a8bc130
 </TASK>


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
