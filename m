Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960345C6FB
	for <ntfs3@lists.linux.dev>; Fri,  2 Oct 2026 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930084; cv=none; b=XlqAav1k9gBxwzdM2UjW6Y4GQuX6foHTE5VRDnJzbFhD+oN9FB+fZgYUw0NpD+gnVqq4mtVZpBmCPvSTQDuECBC8wEhJDT5xi4gF8UPVuR7uSoWzNTXd63Fs4gs5xPTs7RjA1RwB1VU0xFCuqB7I09q1ZrdYBLpGDccIA8uWW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930084; c=relaxed/simple;
	bh=gp6tTt/2AsFlbEcXVh3ymB17Cd6Yx0SW78nb0mvhW0I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=N/xJgR3AxrSVIdo69ticEObZfxw/snPVH9qQmognRu138KIxA/i+G94WByqBxU0vMp1MY6I+XICFFTLv95QF7oA5mgyi5Pm1dPKY1FIG/pwRqcTJN2abUiCWNdzeMYYhYoKUCJOvwpd3KLFjXOnM1Jbtd4DjYm0VCKhTSmZC21M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso11810851b6e.2
        for <ntfs3@lists.linux.dev>; Fri, 02 Oct 2026 01:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930081; x=1791534881;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L55zhFUQ/zR0FXxQ/DUi+hgQ/HbwY1hRO/ys5NezLiE=;
        b=lX7ziWlM39mmVCnlE3e9tv269bJxti7oMVVYA4tNE0HsLms4orsifT+Cwzdzwhtsh2
         JDRtE2cX2q/9efyUtThj74BX9g6FbdLD+fKdolqs1Q3UgF9pLvPEQVAjFJBnxxv0pBJK
         LcB72KesGrL6QZjJ7lL1cxiweAep9KI3se5wvHmmtoNbqvUD2vzvhP7qey143U0Q5Qo9
         Njowt8VSWWBfs5W1WWnXTsMxyONDrwmxzB/unIgG972d5f0O+3KJX8uVP4RNmJxh30/d
         qU9QyULrs1U6LNRzkV4oIppJ6JoIV7A0a5r2gy8DKki/J7q2Z2Uq/iQcMVLJYlEWt50E
         HJhg==
X-Forwarded-Encrypted: i=1; AKwUvBwjQxSb21WHbyT4PwRv0JtbD2wFrBlvceUUr4m4R2z2zF2/suG7ccxy+OCogHlV6NJgPLmjbw==@lists.linux.dev
X-Gm-Message-State: AFuF++mipmEO0MzRPrG3BnYu5cskrQsB8qo2PxgjDwd3NT50QlP30lDL
	7MfIlEKWE57sL/x/5eHXG2gU5JQ8g0TxJaN+HXyGccpZZmFvMj8Sbin7zNm2dTSAFLo+d07ByW2
	Frx03if9S9UnLlt9163JG9+SuTW0vR5CuCPK6wL1Ai/n9klMw1iF+6vcE9iE=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1ed:b0:4e7:8e25:37e5 with SMTP id
 5614622812f47-4f528de2927mr1375772b6e.17.1790930080991; Fri, 02 Oct 2026
 01:34:40 -0700 (PDT)
Date: Fri, 02 Oct 2026 01:34:40 -0700
In-Reply-To: <6abc1c9e.00649fcc.35d151.00e6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abf6ca0.9b478af7.e8d7a.0008.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in truncate_setsize
From: syzbot <syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    ce1e0223d8ad Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=128a2bf5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=0e70362e1726b5a7502e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143da725580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113236c9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4167e1ad25c1/disk-ce1e0223.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a0a74c8dec59/vmlinux-ce1e0223.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f6caa72edd70/bzImage-ce1e0223.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/ce7727430629/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/3c66bb202e74/mount_15.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=166d9b15580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com

------------[ cut here ]------------
ifs_is_fully_uptodate(folio, ifs) != folio_test_uptodate(folio)
WARNING: fs/iomap/buffered-io.c:295 at ifs_free+0x34a/0x410 fs/iomap/buffered-io.c:294, CPU#0: syz.2.150/6677
Modules linked in:
CPU: 0 UID: 0 PID: 6677 Comm: syz.2.150 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:ifs_free+0x34a/0x410 fs/iomap/buffered-io.c:294
Code: 41 5f 5d e9 88 60 c1 ff e8 23 45 61 ff 90 0f 0b 90 e9 d5 fe ff ff e8 15 45 61 ff 90 0f 0b 90 e9 12 ff ff ff e8 07 45 61 ff 90 <0f> 0b 90 eb c7 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 08 fe ff ff
RSP: 0018:ffffc900067676f8 EFLAGS: 00010293
RAX: ffffffff82659269 RBX: 0000000000000008 RCX: ffff88802f4d1f40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000082661001 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff940003198e9 R12: ffff88802b6f6b84
R13: ffff88802b6f6b00 R14: ffffea00018cc740 R15: 0000000000000000
FS:  00007f882fd2c6c0(0000) GS:ffff888125bc3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb4d045cd58 CR3: 00000000349ee000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 folio_invalidate mm/truncate.c:140 [inline]
 truncate_cleanup_folio+0xcb/0x190 mm/truncate.c:160
 truncate_inode_pages_range+0x2c4/0xd80 mm/truncate.c:404
 truncate_inode_pages mm/truncate.c:485 [inline]
 truncate_pagecache mm/truncate.c:798 [inline]
 truncate_setsize+0xcf/0xf0 mm/truncate.c:823
 ntfs_setattr+0x267/0x590 fs/ntfs3/file.c:739
 notify_change+0xbb8/0xec0 fs/attr.c:556
 do_truncate+0x1c2/0x250 fs/open.c:68
 vfs_truncate+0x4b7/0x540 fs/open.c:118
 ksys_truncate+0xf3/0x1c0 fs/open.c:142
 __do_sys_truncate fs/open.c:154 [inline]
 __se_sys_truncate fs/open.c:152 [inline]
 __x64_sys_truncate+0x5b/0x70 fs/open.c:152
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f883070e159
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f882fd2c028 EFLAGS: 00000246 ORIG_RAX: 000000000000004c
RAX: ffffffffffffffda RBX: 00007f8830996180 RCX: 00007f883070e159
RDX: 0000000000000000 RSI: 0000000000008da7 RDI: 0000200000000940
RBP: 00007f88307a506b R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8830996218 R14: 00007f8830996180 R15: 00007ffcdd2b2178
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
