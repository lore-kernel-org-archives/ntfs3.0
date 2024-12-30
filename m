Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11566748A
	for <ntfs3@lists.linux.dev>; Mon, 30 Dec 2024 00:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735519220; cv=none; b=NbelHPhVjHyyHWWlfIh4cSrMrP8pQjNnOg+zLCn1nuVTEWDYuDLJUVx1hdlo3R4CvC5n5Awp5ZNCEj3Z0pmM2Y6Wq27u85/zlHG55nnNXSy3WnL2QlKEX7hrKxKUPGUfYnaO3hcsOTOeShfoF8mbk2f+S+AjPwCOkUy7gF1oBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735519220; c=relaxed/simple;
	bh=Y/LeuiLSwocSS++DSeJxrfXwxybwVkyvkcxHCDRDnYY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QnJe4rFvq/6E0I/v1Bo7YK/CNZ7zkpyqSY8n6ge5bvM/a3tt531BTAmVvuvkUos+1LB5eNssbCjfpIOgJJAC5anc2Pv6yC/9hfnrsgeJOT8U4tS44L+1Nj6+/aAzbKZ0e5Bp2W98B28/A9lOAmtcfwShzgyaftI9baog88ft/jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a815ab079cso179019195ab.0
        for <ntfs3@lists.linux.dev>; Sun, 29 Dec 2024 16:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735519218; x=1736124018;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5OMac1s8dIGkZt8k5003S1w2/J/tZOr8JKmLRCjoF0=;
        b=xFdw3ODg2sL6EmGMU8jyXfa1ekwNeR1QKPzhEQ9Npk9yuzLuYzPJzSJWhO7h1wWd5z
         6ZoCHclFAEsbeR+d1wYoXkehssD1Wj3MCK9hTvERtLeBAd3kzeXggbF3JmU96ayJmv+0
         DOIm0Hz6dMV2HpP0APKFv7ne9jscSzRiSC6/SiP8DCqqa6qGFPjw9RIdOHdi4hgAM+rQ
         LEeBdVCcfOlfRd33exqeDliuJc+1ik4O80JW4WocGx3r+pi66/bwV3TqBhV1aEJD0yfX
         bUuWAe/5CLIC/tcoVv8BAlLg2Egy9f0NUO+anwgyvSyrcIdgJJILrKo5U6aDUr2heWjj
         nT+w==
X-Forwarded-Encrypted: i=1; AJvYcCWePcLc7V9EMYv/akPp6Rru7H/xCU8WeAWxvNinNVjYU50uW/59TobGo8+dUcGANckKBVSWdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRyDWbPPFIfk5KOSM0S3uNjP0ue5WLtjfrtkOVaIvBPj/Dp8/W
	mVYjywtZyfTfbqbh0TI2+ASbsdwG65d/Jzji/YgxW34Q3RPMDAFCGhPkGZ/zgIL6rdL6BncUI5U
	7usJUCzGM0G3TdEmRe2YVahXOLWq7n7wy9CG6N2RfaKyeZ7uoP8dVFfo=
X-Google-Smtp-Source: AGHT+IFGiw+9GitYaN6AMXW8yTNSgOfow5EuVxhFEDryXi6KP2QN/wUhIqQXCxsJcdvXfIvFwCT5c+Rw8cv2Ds+CnviMSZzJHa9i
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3497:b0:3a7:e528:6f1e with SMTP id
 e9e14a558f8ab-3c2d278364bmr273004985ab.11.1735519218199; Sun, 29 Dec 2024
 16:40:18 -0800 (PST)
Date: Sun, 29 Dec 2024 16:40:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6771ebf2.050a0220.226966.00cb.GAE@google.com>
Subject: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in __generic_file_write_iter (2)
From: syzbot <syzbot+5d0bdc98770e6c55a0fd@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    573067a5a685 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11fafcc4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd7202b56d469648
dashboard link: https://syzkaller.appspot.com/bug?extid=5d0bdc98770e6c55a0fd
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10bb8018580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176b1adf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9d3b5c855aa0/disk-573067a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0c06fc1ead83/vmlinux-573067a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3390e59b9e4b/Image-573067a5.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/5063ea88b5e9/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5d0bdc98770e6c55a0fd@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000086000006
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
user pgtable: 4k pages, 48-bit VAs, pgdp=000000011896d000
[0000000000000000] pgd=0800000118b44403, p4d=0800000118b44403, pud=0800000117517403, pmd=0000000000000000
Internal error: Oops: 0000000086000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 UID: 0 PID: 6427 Comm: syz-executor347 Not tainted 6.13.0-rc3-syzkaller-g573067a5a685 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : 0x0
lr : generic_perform_write+0x29c/0x868 mm/filemap.c:4055
sp : ffff80009d4978a0
x29: ffff80009d4979c0 x28: dfff800000000000 x27: ffff80009d497bc8
x26: 0000000000000000 x25: ffff80009d497960 x24: ffff80008ba71c68
x23: 0000000000000000 x22: ffff0000c655dac0 x21: 0000000000001000
x20: 000000000000000c x19: 1ffff00013a92f2c x18: ffff0000e183aa1c
x17: 0004060000000014 x16: ffff800083275834 x15: 0000000000000001
x14: 0000000000000000 x13: 0000000000000001 x12: ffff0000c655dac0
x11: 0000000000ff0100 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff80009d497980 x4 : ffff80009d497960 x3 : 0000000000001000
x2 : 0000000000000000 x1 : ffff0000e183a928 x0 : ffff0000d60b0fc0
Call trace:
 0x0 (P)
 __generic_file_write_iter+0xfc/0x204 mm/filemap.c:4156
 ntfs_file_write_iter+0x54c/0x630 fs/ntfs3/file.c:1267
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0x920/0xcf4 fs/read_write.c:679
 ksys_write+0x15c/0x26c fs/read_write.c:731
 __do_sys_write fs/read_write.c:742 [inline]
 __se_sys_write fs/read_write.c:739 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:739
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: ???????? ???????? ???????? ???????? (????????) 
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
