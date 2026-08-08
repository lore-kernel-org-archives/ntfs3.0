Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1493A254B
	for <ntfs3@lists.linux.dev>; Sat,  8 Aug 2026 20:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786219774; cv=none; b=i+oTna1YKBRrjgx4R5NRDA3fC0BjaPIzjnqy+H+4Oiw0O5PJHG+Hr18CizRjNJRP3l3kaS7Gdf92f34JDZnNaNfeRpSOi6xzX39RUEzIaZhHjkS2fN7rdgp+rT8WumjdoEwdTIlQuTDBewziDKCLsVxAQPnti1svfAsQPFvZ8Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786219774; c=relaxed/simple;
	bh=lkhj2oP/pTeFK5rVfv2KYrcKKiEIi19Itvb/+q9WXFw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZK+FZEIh4scGVAZ99mzUQZ9+LodHIqwYmr7SO7sLvc/jebBwDhuC5L8EAflJnqXtf7JjWDgUeZRJce/+VfHyixFYtP7ptj0H22bjnk9+5iqCpf9BAN8HuOXCIKebItT9zL2c8AcvrDYsKv/5+1839wSdaA6liS8qBPJ7W+dInSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4ab8b4887d4so452791b6e.1
        for <ntfs3@lists.linux.dev>; Sat, 08 Aug 2026 13:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786219772; x=1786824572;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJcJVmnsJEN3y6VIkxkg0kqvdT3DmKUnaXDFVwRrtXU=;
        b=qE4Oy/4jOrh6Xx1usG/+CP5/1xF+9gi7WsTY1F09PPkcfUG7FqIA6/Li+8fqbfMutZ
         ZVABKa1Fh7rK9obnHkh6kGFRZhTDpYur6ujEtM4Z3Q8VIzBYBcz+pHMLsWrMCCHAWyi/
         v2ORmLVBt+M7AdKFs+kqZCER6sfrqN3Bqc59cqRo+0p0l+G8Jl2M4O3vxAbFdW7IeeJT
         ByqT4U6TFEROOabTz87kOaMAM/Ns7/Eq+sYO+hhRkta0wNcrh1AiPGcOXKzKyHRy4oGl
         SzMl677ARjZCttc9HmGNfo+K2lvzG/nDiA3OerRP85hN3rtefcx73MTe3TjaAyJRHCUR
         +EIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcwcIcA5pVJG6/h3+IAeezYQdoi2MeqRNoJs5oiV4Q0P/Vl5ODVoi3rBeLBvlgwFKPILyAzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWH94sd0+D8tHvTx8mtf0L+uGLokW00gnnXIOvI2Xy4oLop8Gj
	+LRIwC9+YrYeOuDkLTMk5QUuPe809QYVBmGL9xOmsflx0pUj81wFQjoySTfaj/kfDfJBLoz1hAF
	9c9N5otfauy+C51yYXBhWdyeML321vbwGHn0WiZJ078XOTP3RnYbO4Ay8AKQ=
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:514a:b0:49b:33c8:4b75 with SMTP id
 5614622812f47-4b1ab7a68ebmr5334264b6e.5.1786219771938; Sat, 08 Aug 2026
 13:09:31 -0700 (PDT)
Date: Sat, 08 Aug 2026 13:09:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a778cfb.9c11d2ce.289b96.00b8.GAE@google.com>
Subject: [syzbot] [ntfs3?] general protection fault in al_destroy
From: syzbot <syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6b8c8af514d7 Add linux-next specific files for 20260807
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13210149580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d343b54cc50df0f
dashboard link: https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1284c2c6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/71ff4edcb608/disk-6b8c8af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1f5fa331d8f2/vmlinux-6b8c8af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f993558ec63b/bzImage-6b8c8af5.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f8133373f34e/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+04cf7b83f6dd2c3a54c8@syzkaller.appspotmail.com

         option from the mount to silence this warning.
=======================================================
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000042: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000210-0x0000000000000217]
CPU: 1 UID: 0 PID: 5838 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:run_close fs/ntfs3/ntfs_fs.h:1034 [inline]
RIP: 0010:al_destroy+0x49/0xc0 fs/ntfs3/attrlist.c:33
Code: 02 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 58 8d 08 ff 48 8b 1b 4c 8d b3 10 02 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 38 8d 08 ff 48 8b bb 10 02 00 00
RSP: 0018:ffffc9000348f960 EFLAGS: 00010206
RAX: 0000000000000042 RBX: 0000000000000000 RCX: ffff88802ac23e80
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88805a8d7810
RBP: 0000000000000001 R08: ffffffff9058fb7f R09: 1ffffffff20b1f6f
R10: dffffc0000000000 R11: fffffbfff20b1f70 R12: ffff88805a8d7a60
R13: dffffc0000000000 R14: 0000000000000210 R15: dffffc0000000000
FS:  000055555d771500(0000) GS:ffff88812500c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6813d4c000 CR3: 000000007270e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ni_clear+0x5d/0x630 fs/ntfs3/frecord.c:110
 evict+0x624/0xb50 fs/inode.c:822
 ntfs_new_inode+0x8c/0x120 fs/ntfs3/fsntfs.c:1719
 ntfs_create_inode+0x6e7/0x3420 fs/ntfs3/inode.c:1520
 ntfs_mkdir+0x37/0x50 fs/ntfs3/namei.c:234
 vfs_mkdir+0x40c/0x620 fs/namei.c:5410
 filename_mkdirat+0x285/0x510 fs/namei.c:5443
 __do_sys_mkdirat fs/namei.c:5464 [inline]
 __se_sys_mkdirat+0x35/0x150 fs/namei.c:5461
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x510 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f057a79cf47
Code: 00 66 90 48 89 f2 b9 00 01 00 00 48 89 fe bf 9c ff ff ff e9 db f7 ff ff 66 2e 0f 1f 84 00 00 00 00 00 90 b8 02 01 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff0d960bd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000102
RAX: ffffffffffffffda RBX: 00007fff0d960c60 RCX: 00007f057a79cf47
RDX: 00000000000001ff RSI: 00002000000000c0 RDI: 00000000ffffff9c
RBP: 00002000000002c0 R08: 00002000000007c0 R09: 0000000000000000
R10: 00002000000002c0 R11: 0000000000000246 R12: 00002000000000c0
R13: 00007fff0d960c20 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:run_close fs/ntfs3/ntfs_fs.h:1034 [inline]
RIP: 0010:al_destroy+0x49/0xc0 fs/ntfs3/attrlist.c:33
Code: 02 00 00 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 58 8d 08 ff 48 8b 1b 4c 8d b3 10 02 00 00 4c 89 f0 48 c1 e8 03 <42> 80 3c 38 00 74 08 4c 89 f7 e8 38 8d 08 ff 48 8b bb 10 02 00 00
RSP: 0018:ffffc9000348f960 EFLAGS: 00010206
RAX: 0000000000000042 RBX: 0000000000000000 RCX: ffff88802ac23e80
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88805a8d7810
RBP: 0000000000000001 R08: ffffffff9058fb7f R09: 1ffffffff20b1f6f
R10: dffffc0000000000 R11: fffffbfff20b1f70 R12: ffff88805a8d7a60
R13: dffffc0000000000 R14: 0000000000000210 R15: dffffc0000000000
FS:  000055555d771500(0000) GS:ffff88812500c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6813d4c000 CR3: 000000007270e000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	02 00                	add    (%rax),%al
   2:	00 48 89             	add    %cl,-0x77(%rax)
   5:	d8 48 c1             	fmuls  -0x3f(%rax)
   8:	e8 03 42 80 3c       	call   0x3c804210
   d:	38 00                	cmp    %al,(%rax)
   f:	74 08                	je     0x19
  11:	48 89 df             	mov    %rbx,%rdi
  14:	e8 58 8d 08 ff       	call   0xff088d71
  19:	48 8b 1b             	mov    (%rbx),%rbx
  1c:	4c 8d b3 10 02 00 00 	lea    0x210(%rbx),%r14
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 f7             	mov    %r14,%rdi
  34:	e8 38 8d 08 ff       	call   0xff088d71
  39:	48 8b bb 10 02 00 00 	mov    0x210(%rbx),%rdi


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
