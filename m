Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496381FA261
	for <ntfs3@lists.linux.dev>; Tue,  8 Oct 2024 17:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408570; cv=none; b=hsMC1VlC7TDUFFn0oYTpVbtECUsee9cLEzWK1SLQ+0Ovnj/wQ7tmLUYj0LeIdPK2EBvzUbORPDoAs925oHMZMa42GSu91Gx4ZZ4GijmyEOpONa2SzzqrhwzdXmraUROHPKfdUCm39sZ8bdrGeLoVAHr1X8zmQEX7AWt7IwS4+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408570; c=relaxed/simple;
	bh=PjfGjNp0aGMeBH1UTQyMb1qa0iqc53T5fedJ9cyPP7Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aaxPSJsObrdtyujMxDUDXujmslsKMhc6XsAA4Eqxym/d0VK1u/mnrs7n39v628vZ4S0SyTPq2b/Y8cYuqjeiwatDnSTcp9ENgSh9e3lhijsez2IbOsKCNV4EzYI8T4IkOLb8/YG/vSZ/CiiBOxxvz20RdM8US+q+q5bcMQ9jRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a342e872a7so61245605ab.3
        for <ntfs3@lists.linux.dev>; Tue, 08 Oct 2024 10:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728408568; x=1729013368;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VozRzlWnWnb+rzWLqtju9jc3tvwPZFmIAhcK0bx5ZE=;
        b=LxXRf+bnBENzxk1St4RmC88kDvrfFuYUj9OzHhqBH5fKw7ec+juQaAfL7j9z82+tuO
         w5vhVwZq8T/7KqASqVNtKWOboy8L85OCopqoqnFGglpZBCA6jqR43Rr1yOHmTZzr9jNA
         GQdRpnoHGhZNtUoefWzO5D85MWuwRUrIOjcCnVz2XgQFVfpf9LnoGTnxsPzL1up/lBnC
         +TVTSWPSOd56o3SQ3ENsMKozMc1ZqHOfLYA13dZSBqj26BD8aYReBQ9tZwgftg+Yc5Go
         a/mGdirK0uKTAGhwCIgWeg4YuzXFNWU93IkM2NfuLm3jBjFiPWf+60VvV0sa+OXcNWvS
         Zlag==
X-Forwarded-Encrypted: i=1; AJvYcCXbx/n8EACuU0bPRjESdYNL+/Eb3DwkUkuaXLTyFVpw7INXnqPkuqYs9Kl2V8h+sHnynaRO3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhWpKrolztiiU+zPa7b8H9GRSbBNJEIYG2SCUcgBgz23aYk1VW
	6R2xHM1LP3f+hORcmRwRmETiiEeLy2AxC1zNlOAXJcQp2NVljzdE/Y9drDmpWr3OzkLgZM05+L8
	WEoKm3CeGEgWXLhzL7MNVBKhRQxYlShlQK50qU0xl7ZZvkvqv1pvGTsE=
X-Google-Smtp-Source: AGHT+IFaQFT614wWs4e7N1liEAZAiJUAAejFVobZlZBtZKl4OpsltaISeEuEV78oucjgLHSQ+AYWxDUhpWbaEICAvh+bI09wZB5e
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c9:b0:3a2:463f:fd9e with SMTP id
 e9e14a558f8ab-3a37599709amr142221445ab.6.1728408568431; Tue, 08 Oct 2024
 10:29:28 -0700 (PDT)
Date: Tue, 08 Oct 2024 10:29:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67056bf8.050a0220.840ef.0009.GAE@google.com>
Subject: [syzbot] [ntfs3?] kernel BUG in ntfs_extend_initialized_size
From: syzbot <syzbot+39385e8595a092bae44b@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3eddb108abe3 arm64: Subscribe Microsoft Azure Cobalt 100 t..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1021cd27980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d1bd4b6ef6aba4a
dashboard link: https://syzkaller.appspot.com/bug?extid=39385e8595a092bae44b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1633bbd0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15123380580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a5978792dbfc/disk-3eddb108.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/462a5dffd79a/vmlinux-3eddb108.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66cd572e6130/Image-3eddb108.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f2151f3f3ceb/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+39385e8595a092bae44b@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3: loop0: Different NTFS sector size (2048) and media sector size (512).
ntfs3: loop0: Mark volume as dirty due to NTFS errors
------------[ cut here ]------------
kernel BUG at include/linux/highmem.h:275!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 UID: 0 PID: 6413 Comm: syz-executor181 Not tainted 6.12.0-rc1-syzkaller-g3eddb108abe3 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : zero_user_segments include/linux/highmem.h:275 [inline]
pc : folio_zero_range include/linux/highmem.h:647 [inline]
pc : ntfs_extend_initialized_size+0x92c/0x938 fs/ntfs3/file.c:215
lr : zero_user_segments include/linux/highmem.h:275 [inline]
lr : folio_zero_range include/linux/highmem.h:647 [inline]
lr : ntfs_extend_initialized_size+0x92c/0x938 fs/ntfs3/file.c:215
sp : ffff8000a28b76e0
x29: ffff8000a28b7800 x28: 0000000000001000 x27: 1fffffbff86e8b50
x26: fffffdffc3745a80 x25: 0000000000000ff6 x24: 000000000000100a
x23: dfff800000000000 x22: 0000000000001000 x21: 000000000000100a
x20: 000000000000000a x19: fff1000040000000 x18: 1fffe000366cc476
x17: ffff80008f7dd000 x16: ffff80008032d24c x15: 0000000000000001
x14: 1fffe0001b8e9691 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60001b8e9692 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000c2779e40 x7 : ffff8000802c3cec x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001 x3 : ffff800080cc9484
x2 : 0000000000000000 x1 : 000000000000100a x0 : 0000000000001000
Call trace:
 zero_user_segments include/linux/highmem.h:275 [inline]
 folio_zero_range include/linux/highmem.h:647 [inline]
 ntfs_extend_initialized_size+0x92c/0x938 fs/ntfs3/file.c:215
 ntfs_extend+0x37c/0x3f0 fs/ntfs3/file.c:403
 ntfs_file_write_iter+0x320/0x610 fs/ntfs3/file.c:1187
 do_iter_readv_writev+0x490/0x6d4
 vfs_writev+0x410/0xbc8 fs/read_write.c:1064
 do_pwritev fs/read_write.c:1165 [inline]
 __do_sys_pwritev2 fs/read_write.c:1224 [inline]
 __se_sys_pwritev2 fs/read_write.c:1215 [inline]
 __arm64_sys_pwritev2+0x1dc/0x2f0 fs/read_write.c:1215
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
Code: aa1a03e0 97c4f15b d4210000 97b63f4c (d4210000) 
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
