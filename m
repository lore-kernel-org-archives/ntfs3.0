Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB93E0752
	for <ntfs3@lists.linux.dev>; Mon, 25 May 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699745; cv=none; b=tuyWjqLfybp6g8xWlA7hA3gkUZvGPyMGIdq28zEOgHSargb6Y96kJSxvALLScQ3KawzgcnmB83ndT/tE6WvmA8Uh1AbApOg8wKxieSB++pa5p7+7WdTPxDjevDPx3Dau7IHtA5OYG2UNIPDnZI9ztVoIdpeekSF9oo+ZBhFE/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699745; c=relaxed/simple;
	bh=waJpbtuuy7G0ghHTkmCmLI/oKincT720zLLXnw2x8BQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pPbhtaI/kDqkTw6UBO5ofrKsSxnkmxaQMGIx1B6Lr3xLETxU6hams8Gj9I6eN2BMnMBDU1J7HmXuPmHv/zWcyUq4/WWIEsID01WkOEUjStv64i30EbiJJz6xZ+UqifxxWUH+O4mRfeIyUytM8b6qaYChemOWIkTK46l0P7r6BBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-69d6b83becaso5896369eaf.2
        for <ntfs3@lists.linux.dev>; Mon, 25 May 2026 02:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779699743; x=1780304543;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRF27zDyCFPw6ZPNE+LysAfTntSGp6L1qvIgmzw+6yo=;
        b=VQHXlfT7FrzORWs4knQk0iFGOoQ5pWpXcHbG9K9ZhpnjkpdRec1UQPuE/6+bn0D5Mx
         HKNLsMdz23chLFyIXWNZ4WqNRsqgvaDPGrx7aIU1APFQvsZ5gxPQhg7W+obCZg19LFQg
         8PYwn0NSRJKD4ZnG1PvQIXFsSkowzZVITCM6doK/ifW8E2KJ6XvdCqbcxDXudRBsaiW6
         PRtPgLK7d84QZHnmZYyTm790VX2f5154TKJ6sTBH1g8XmrwA4zmpdmY575HN3YMRtTzN
         mGA++XlBdtEaS+FWjdFIoDmxkflPvmX1D3GPE65aRGyoLUUwCbLx7mjALKX0y4NKhOxC
         yKVA==
X-Forwarded-Encrypted: i=1; AFNElJ/vsvdYIJraGuuFXQG7AsuQTbt4vWR3MztNjLGtj/Y+uez8eUvYBe1/6m473wr0N8ED6A/4QA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOVSrNWRfkPchFU4d2oT7OfpQlH+KfyVbQfgyjsMRTDI2Z3c/V
	wyNy1Cr51TthEo2vdwyK3tRfjVtkhptrjo32gQpCdV/BW6BKGuv8zUW+mvyYkguMxI1pZu7b5ol
	kR8GzBtL3pNgr9MmtdOByypL9JxkaI1GMpKuoQwp94wy75fP5f+AHsNoi/vw=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a06:b0:69b:3fff:1407 with SMTP id
 006d021491bc7-69d7ece5ae0mr7712470eaf.54.1779699743175; Mon, 25 May 2026
 02:02:23 -0700 (PDT)
Date: Mon, 25 May 2026 02:02:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a14101f.050a0220.2385e8.0011.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in attr_data_get_block_locked (2)
From: syzbot <syzbot+7be6ad5cb228286af3e3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6a97c4d5262d Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1526c673980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84d8d0173345cb21
dashboard link: https://syzkaller.appspot.com/bug?extid=7be6ad5cb228286af3e3
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-6a97c4d5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/adcb671bf9d3/vmlinux-6a97c4d5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/26cd02552fc3/bzImage-6a97c4d5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7be6ad5cb228286af3e3@syzkaller.appspotmail.com

------------[ cut here ]------------
1
WARNING: fs/ntfs3/attrib.c:1237 at attr_data_get_block_locked+0x194c/0x2590 fs/ntfs3/attrib.c:1237, CPU#0: syz.0.0/5337
Modules linked in:
CPU: 0 UID: 0 PID: 5337 Comm: syz.0.0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:attr_data_get_block_locked+0x194c/0x2590 fs/ntfs3/attrib.c:1237
Code: 44 89 f7 44 89 e6 e8 83 fc a1 fe 45 29 e6 0f 83 c1 00 00 00 e8 b5 fa a1 fe 41 bf ea ff ff ff e9 6b fa ff ff e8 a5 fa a1 fe 90 <0f> 0b 90 41 bf ea ff ff ff e9 57 fa ff ff 48 8b 84 24 c8 00 00 00
RSP: 0018:ffffc9000e4e79a0 EFLAGS: 00010293
RAX: ffffffff8323cacb RBX: 00000000ffffffff RCX: ffff888000fe8000
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 00000000ffffffff
RBP: ffffc9000e4e7be8 R08: 0000000000000000 R09: 1ffff11006b3c840
R10: dffffc0000000000 R11: ffffed1006b3c841 R12: ffff8880479e4fd8
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f56995736c0(0000) GS:ffff88808c87b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000003e796000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 attr_data_get_block+0x250/0x310 fs/ntfs3/attrib.c:982
 ntfs_fallocate+0xfac/0x1220 fs/ntfs3/file.c:674
 vfs_fallocate+0x669/0x7e0 fs/open.c:338
 ksys_fallocate fs/open.c:362 [inline]
 __do_sys_fallocate fs/open.c:367 [inline]
 __se_sys_fallocate fs/open.c:365 [inline]
 __x64_sys_fallocate+0xc0/0x110 fs/open.c:365
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0x560 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f569879ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5699572fe8 EFLAGS: 00000246 ORIG_RAX: 000000000000011d
RAX: ffffffffffffffda RBX: 00007f5698a16090 RCX: 00007f569879ce59
RDX: 0000000000080000 RSI: 0000000000000000 RDI: 0000000000000008
RBP: 00007f5698832d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5698a16128 R14: 00007f5698a16090 R15: 00007fff784160b8
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
