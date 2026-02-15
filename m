Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9826F476
	for <ntfs3@lists.linux.dev>; Sun, 15 Feb 2026 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771188867; cv=none; b=WMSxsegfeorBK3KZc2YZzDLdkhZfLD6zeWr/M0AbEsZMeATNCqE9WB/yDnPG7UbQH4Fv8QWtdJMlv8Qq/bj8Zqo2t3YQw+g60uvWCAt2BLnZvlPPBG3GGIwqXivy18Q/HKf39gwO5drARtWXifXecGRyoCvPbPkrYGTH5I5kSkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771188867; c=relaxed/simple;
	bh=k1mc33nksCGnHc/lY9V9Nj9R18plXBIIh2PdutmP8D4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TUmswItvEmDoPW0aoYV9ecSXGBB3aW+sch+/UEZC20HjyHG40LDZqewvHZVxTv6BG+Z4W7LgTdna/+8yA6hL2bUeFgXeszaxTKT92cPFGSdSRsDC2e4dFHpss2JFIFZ9nh+xRbqyPrscint8a16doxnBiUKNcWjzzrhWfNWnNow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6787fa20d41so21629562eaf.0
        for <ntfs3@lists.linux.dev>; Sun, 15 Feb 2026 12:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771188865; x=1771793665;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xoAMH2t1VyFCyAMddCrHFC23puX+lFYvOkiBBRa8fEs=;
        b=XN4G9XzHtY2vaHn3VirRM4DFOeP53obwqBmO6QK4dVmPtywGU3O6fRP2O2t9NAx2Wq
         pnAcR5waahGXmpLsvIlmZL5UEPXa3o6H/02oFz2sY1FSUhNthl5/Ca28X4Fvzu8enzVK
         bKBET/emxfz/Bo1JGg41Fuh37QniYM8B/2SoIYbWRy5LdrtC02Dk6dPvYe2gEiDxga9G
         t/oiX73M1U4PBfeZfPycPT2Wg6Y+5tC5BnKkBQA9V+jKbg/MPakSw/oQtYyy/A7rV2Aw
         NF/1TIaE5pcaN9sroQM5iubQ38cZXww9UDEwXIWvVJvdVvp+9X/aSIOsvKaI3RMYMHDU
         fpaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrctxr25z0JsYY/C5qSB+bmLVPZLzMCAvzipFPDL5075w2GduT3KMRXzMdyb8CmAbhFIgblQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvvbMLQMeOUWmAiXNaOTS6D0yc92k/M3/v7ER5DxsFGCMd4wXr
	yeqKAxcTO93GHm89GGS9S2gMEzjeDUHmnszQYs2SIIWZ2mId3PRsvUg9t1Pswyr4maBD6E070ys
	kDszaelrbkx33mXCpbTTlEkzUt5QXsp9F4CqNl2uw+EwDHSLrVIT3nzSx8W4=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f00a:b0:65b:257b:a898 with SMTP id
 006d021491bc7-67767294c72mr5285827eaf.29.1771188865489; Sun, 15 Feb 2026
 12:54:25 -0800 (PST)
Date: Sun, 15 Feb 2026 12:54:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69923281.050a0220.340abe.038e.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in ntfs_extend_initialized_size (2)
From: syzbot <syzbot+2bd8e813c7f767aa9bb1@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    635c467cc14e Add linux-next specific files for 20260213
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11d8c722580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f09eec269f9f4746
dashboard link: https://syzkaller.appspot.com/bug?extid=2bd8e813c7f767aa9bb1
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15996c02580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=138f115a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/24870d51cbd0/disk-635c467c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/49283c738806/vmlinux-635c467c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8c5f9d1da977/bzImage-635c467c.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/0f8de5f7f0e7/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2bd8e813c7f767aa9bb1@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
------------[ cut here ]------------
is_compressed(ni)
WARNING: fs/ntfs3/file.c:236 at ntfs_extend_initialized_size+0x1dc/0x210 fs/ntfs3/file.c:236, CPU#0: syz.0.17/5995
Modules linked in:
CPU: 0 UID: 0 PID: 5995 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
RIP: 0010:ntfs_extend_initialized_size+0x1dc/0x210 fs/ntfs3/file.c:236
Code: 0d ff 4c 89 33 31 ed eb 05 e8 20 6b a3 fe 89 e8 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 cb a1 8e 08 cc e8 05 6b a3 fe 90 <0f> 0b 90 e9 31 ff ff ff 89 d1 80 e1 07 80 c1 03 38 c1 0f 8c e1 fe
RSP: 0018:ffffc90003667c30 EFLAGS: 00010293
RAX: ffffffff8322375b RBX: ffff88805c1f1670 RCX: ffff8880300f9e40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000800 R08: ffff88805c1f1737 R09: 1ffff1100b83e2e6
R10: dffffc0000000000 R11: ffffed100b83e2e7 R12: 0000000000000012
R13: 0000000000000fee R14: 1ffff1100b83e2ce R15: 0000000000000000
FS:  000055556ac47500(0000) GS:ffff888125460000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2f963fff CR3: 000000007a426000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ntfs_fallocate+0xf21/0x1220 fs/ntfs3/file.c:670
 vfs_fallocate+0x669/0x7e0 fs/open.c:340
 ksys_fallocate fs/open.c:364 [inline]
 __do_sys_fallocate fs/open.c:369 [inline]
 __se_sys_fallocate fs/open.c:367 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:367
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f248b59bf79
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdfe289018 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f248b815fa0 RCX: 00007f248b59bf79
RDX: 0000000000000fff RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f248b6327e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000009 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f248b815fac R14: 00007f248b815fa0 R15: 00007f248b815fa0
 </TASK>


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
