Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00672557A
	for <ntfs3@lists.linux.dev>; Sat,  1 Feb 2025 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738421188; cv=none; b=r7jUGwcZmnIk8CosNTGz/LirGJBzexN9XsLEJzi+ANTvT2QTE5phrRMvCfVpPK1DkvNFSB7lXlrjV9Sx/xryh1zWjM8MaQFknyHPyeHcEgDvTVBbvtUyOferHIUxzJtm4zTrxB8NqAiOtBlv5PgLWiDF879HTypG0NnSuvJPP+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738421188; c=relaxed/simple;
	bh=yh+SZ+CMDbNgwAg2Skywd5nfPQ6MI05aYPwZFz/ueYE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V78Z6h8HXJa5YsjO6fPF18YtyIKSJAc4w4ns8MspKEVO0oqsTwk/tcXIH6wj4yj+/gk40cZfMhYkgg+6jiCRICiEgvP3uWUDDwkeQ536Q4XzuJUCjbomKR0c053Zwv0a7yF41OQn+Y1mGaeQ7Gs2iBQ4VOy/v1w1nhoj/HsAcAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3cdd61a97easo19737515ab.2
        for <ntfs3@lists.linux.dev>; Sat, 01 Feb 2025 06:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738421186; x=1739025986;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Shjduspvziqv+4GaySF7HlJXe7dlCwiJPmwU4y391E=;
        b=Rh2M5lCjem5JnQ9bOzaaUCjjIC7whmVvkysWVMUxXktcbDnRhJcb2+HZZWiFmQR89u
         3avZY2GE3yWQefhaDee/B8/qtaMDHCs1igFNBSMSVc9uzjQKfcxJiIHkpoMClfSM9dvW
         uF0JdjpaJzLfZX4lLIYNjGUGXZLJE5RKY5imj/2jEJa+vgnyz7Y2ssghH6q1I9LS8EcS
         oBZekxpGL1k3ZA6RESHHWt4mHzFa4J1iW2WKFDjgv+ZPTSLxBWRKw1hZUsuByGA2kclp
         X7rxUOc6PdMCNUOpGYQK/J+AQvbFMIwpKVp1IYLfjOzFQFBmfacdH0cn0/mtKsG5gX94
         rxqw==
X-Forwarded-Encrypted: i=1; AJvYcCX2zdxtDStAzXFNRlKLYBZrCbNQE8OrOd5S3qhwLoYT62DIxSetaF6dUPJ02ozXglz57LW5MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDhvGDTOWof/rDtdLBIvyKcIb3IgDnat/gHstkRqWuBDDgwsPO
	9p3pTbgV0hVi9OPjol4SxYaaBwaTkqKY5CVASQhzKagNXWm9zVkNsy0uHydeKZGn3Eug6rtL2ln
	5b4rwyEj5lcWp+59H82JdXIgcoGgVGdRpiMBOGH+UUwpoYpRnVU1eIl8=
X-Google-Smtp-Source: AGHT+IG+cJgb31Gw9cA9AqA5aGVYsuT3DR35hCz09mgTk1qkn0POl10JQnqan4mu/xDZIMsC+a7DGRjFE+fkbRdh6/85+GM+jeYb
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20cc:b0:3cf:b5d2:cf33 with SMTP id
 e9e14a558f8ab-3cffe44e21fmr138134635ab.21.1738421185921; Sat, 01 Feb 2025
 06:46:25 -0800 (PST)
Date: Sat, 01 Feb 2025 06:46:25 -0800
In-Reply-To: <000000000000c2d38506201fb72e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679e33c1.050a0220.163cdc.001e.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] kernel panic: stack is corrupted in __schedule (4)
From: syzbot <syzbot+107a9ed6ac26198d4907@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	almaz.alexandrovich@paragon-software.com, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	luto@kernel.org, ntfs3@lists.linux.dev, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=103255f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=107a9ed6ac26198d4907
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1106cd18580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-69e858e0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a53b888c1f3f/vmlinux-69e858e0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6b5e17edafc0/bzImage-69e858e0.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/81bb8169bf34/mount_1.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+107a9ed6ac26198d4907@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (2048) and media sector size (512).
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: __schedule+0x22fc/0x4c90
CPU: 0 UID: 0 PID: 6522 Comm: syz.0.445 Not tainted 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 panic+0x349/0x880 kernel/panic.c:354
 __stack_chk_fail+0x15/0x20 kernel/panic.c:836
 __schedule+0x22fc/0x4c90
 preempt_schedule_common+0x84/0xd0 kernel/sched/core.c:6943
 preempt_schedule+0xe1/0xf0 kernel/sched/core.c:6967
 preempt_schedule_thunk+0x1a/0x30 arch/x86/entry/thunk.S:12
 __raw_spin_unlock include/linux/spinlock_api_smp.h:143 [inline]
 _raw_spin_unlock+0x3e/0x50 kernel/locking/spinlock.c:186
 spin_unlock include/linux/spinlock.h:391 [inline]
 zap_pte_range mm/memory.c:1761 [inline]
 zap_pmd_range mm/memory.c:1823 [inline]
 zap_pud_range mm/memory.c:1852 [inline]
 zap_p4d_range mm/memory.c:1873 [inline]
 unmap_page_range+0x3d52/0x48d0 mm/memory.c:1894
 unmap_vmas+0x3cc/0x5f0 mm/memory.c:1984
 exit_mmap+0x283/0xd40 mm/mmap.c:1284
 __mmput+0x115/0x420 kernel/fork.c:1345
 exit_mm+0x220/0x310 kernel/exit.c:570
 do_exit+0x9ad/0x28e0 kernel/exit.c:925
 do_group_exit+0x207/0x2c0 kernel/exit.c:1087
 get_signal+0x16b2/0x1750 kernel/signal.c:3036
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xce/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fee9e98cda9
Code: Unable to access opcode bytes at 0x7fee9e98cd7f.
RSP: 002b:00007fee9f8750e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: 0000000000000001 RBX: 00007fee9eba5fa8 RCX: 00007fee9e98cda9
RDX: 00000000000f4240 RSI: 0000000000000081 RDI: 00007fee9eba5fac
RBP: 00007fee9eba5fa0 R08: 7fffffffffffffff R09: 0000000000000000
R10: ffffffffffffffff R11: 0000000000000246 R12: 00007fee9eba5fac
R13: 0000000000000000 R14: 00007ffd4ffb6e90 R15: 00007ffd4ffb6f78
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
