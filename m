Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401B31DFE8
	for <ntfs3@lists.linux.dev>; Tue,  9 Apr 2024 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712702546; cv=none; b=IEjslSm+sObGcmTEtez5WFPRwo0FuoJwBAC2ml4msV7cM2ubzmoeQ247+JuXzlWFQCIuZHYvrTEg/8RQf6LWNqKiXfOnVQtORlZQ1oa5iS5v4Xv2jM8EytlojC7iIjcIN6PcNh63qMGRvabz9/30gNws+IzyUekYiYbb4gy9f7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712702546; c=relaxed/simple;
	bh=8E5bmm5Ldq3U91oDOHc/udctTNJo36vV/qKNkwvUzZ4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UO/Jd3wiMI6tH8UQ0JBeku85pkvzy0yp3Kf8BP4dws3/3eHxW18jQmljbzsVnP97HEQbG/kKEokndJfLNHw9YVGL+N/4laKOiV4DlXDaNN6jhjhKYrz8EMJKyGlvBe13doeg7An+sckBtFnV/5logcbbAuC2Yv8ebakpRfHgLoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7d5db4db531so345273739f.2
        for <ntfs3@lists.linux.dev>; Tue, 09 Apr 2024 15:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712702544; x=1713307344;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbR/ywQXcXQ0J/6NWBwaaa7Su1KBjSGiK0MxQ+x6Vww=;
        b=ex3gT+J0/O0uu6zAltwLfbrSqdLyKfXWwGM1uawavrffQB4YgadDDNLCAKZHsYuHcK
         TI17APWvudWHKBXG4W2HPEgsTGSIomkISpTFNKEcS7TB9OuFoORr0lyaJwM7VDu76lV3
         Th9PP9gS/78SxFbmMrSQrlRoga/bM2x/EguxQ9v3xrdQxG3sg1CSRNjYJKcVfh5HcWky
         hsFJdepz3PfzigFReuc/nLS1GoPo2RQlvS6uvqB/tMPsyxkjv3mEp7EWwz5r+LvGAXkh
         vzq+abtNqNB6N7EiJKxupApxizPBy7e56QPGWHWM/kFmSdfskVj2YHA+ciG3KhtwNkyt
         Z20Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt9dxmDGbKR7n7HUHnGN/jGhAWrD7wOapeQvsRgXx+OVQWtyZ4XwNEFMZl8FfxfmecU38kBM8HbABpajCR7Ch6AxiOG6A=
X-Gm-Message-State: AOJu0YxmGRfbBAHswuuh+0bdCFJcyjs9h8r29jiq+wlhH4C2KW0qMKdp
	4fFJqntRCZ4rMq/7WoMB2HITgdFbpjTnL+OHd9mHurD1900Ai8zoq6I58W6Ob1ESn+HGTJ8tJ4C
	8Prf5lfKtRY5aFSPuLvA8pQYUk8t3WcrpBhAdMVIrKnjiERzFu/GoPxQ=
X-Google-Smtp-Source: AGHT+IGpu2AtcRiOJn/rn9Yfk8HvsmyICSMz3tDbQhnHy36ixmFFckR1nl/fH9vUh6Veu1i4aDo7qWwiiTftRZ+2tLf+2ZotLjsj
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4104:b0:482:b15b:df59 with SMTP id
 ay4-20020a056638410400b00482b15bdf59mr24897jab.2.1712702544521; Tue, 09 Apr
 2024 15:42:24 -0700 (PDT)
Date: Tue, 09 Apr 2024 15:42:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5bc980615b1a25c@google.com>
Subject: [syzbot] [ntfs3?] WARNING in do_open_execat (2)
From: syzbot <syzbot+fe18c63ce101f2b358bb@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, brauner@kernel.org, 
	ebiederm@xmission.com, jack@suse.cz, keescook@chromium.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    707081b61156 Merge branch 'for-next/core', remote-tracking..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=106d6d15180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=caeac3f3565b057a
dashboard link: https://syzkaller.appspot.com/bug?extid=fe18c63ce101f2b358bb
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=156040bd180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149d2ead180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6cad68bf7532/disk-707081b6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1a27e5400778/vmlinux-707081b6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/67dfc53755d0/Image-707081b6.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e198b7a8a7f2/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fe18c63ce101f2b358bb@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs: volume version 3.1.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6164 at fs/exec.c:940 do_open_execat+0x2bc/0x3bc
Modules linked in:
CPU: 0 PID: 6164 Comm: syz-executor379 Not tainted 6.8.0-rc7-syzkaller-g707081b61156 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : do_open_execat+0x2bc/0x3bc
lr : do_open_execat+0x2b8/0x3bc fs/exec.c:939
sp : ffff8000977a7b60
x29: ffff8000977a7bd0 x28: 0000000000000000 x27: ffff0000d609da2c
x26: 00000000ffffff9c x25: dfff800000000000 x24: ffff700012ef4f6c
x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000000
x20: fffffffffffffff3 x19: ffff0000d5ba0000 x18: ffff8000977a7100
x17: 000000000000c791 x16: ffff80008aca6dc0 x15: 0000000000000002
x14: 1ffff00012ef4f34 x13: 0000000000000000 x12: 0000000000000000
x11: ffff700012ef4f36 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000d609da00 x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000010
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000008000
Call trace:
 do_open_execat+0x2bc/0x3bc
 alloc_bprm+0x44/0x934 fs/exec.c:1541
 do_execveat_common+0x158/0x814 fs/exec.c:1935
 do_execveat fs/exec.c:2069 [inline]
 __do_sys_execveat fs/exec.c:2143 [inline]
 __se_sys_execveat fs/exec.c:2137 [inline]
 __arm64_sys_execveat+0xd0/0xec fs/exec.c:2137
 __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:133
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:152
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
irq event stamp: 24796
hardirqs last  enabled at (24795): [<ffff80008ae5ce28>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (24795): [<ffff80008ae5ce28>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
hardirqs last disabled at (24796): [<ffff80008ad66988>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:470
softirqs last  enabled at (24766): [<ffff80008002189c>] softirq_handle_end kernel/softirq.c:399 [inline]
softirqs last  enabled at (24766): [<ffff80008002189c>] __do_softirq+0xac8/0xce4 kernel/softirq.c:582
softirqs last disabled at (24737): [<ffff80008002ab48>] ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
---[ end trace 0000000000000000 ]---


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
