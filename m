Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2786615A7
	for <ntfs3@lists.linux.dev>; Tue, 11 Apr 2023 06:32:53 +0000 (UTC)
Received: by mail-io1-f80.google.com with SMTP id y74-20020a6bc84d000000b00758ac1b67f8so5044325iof.17
        for <ntfs3@lists.linux.dev>; Mon, 10 Apr 2023 23:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681194772; x=1683786772;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KLfp2Sca/plc9W/K+bRTLhncz41y6tt4npd9LXdSnU8=;
        b=VyPnSLKb9MeGBFOLrfHLQjo56Qobx5hI3ZpM8O3s5fsBCCP1p0asrh5KHdB8BBLZ4e
         zuyftIGfldoMhb2ZuX9+YDDh4QftIb0AL0Xctn5KFI6Wfy0fXj7fH3+S8Azy81iXLJsH
         JSUdmu9CGOQ5jFwB909fOL5vnGGpNnaQ8iJ2GJKcXKonkIv3KNOG9eWTL2+gwi/471Ad
         M1VzcK3Ea6fc0GWwikAfokicjNnJ1eFLpbzO2hCzYTsWyPKyc78FJvGY5b+Beam1xekR
         NW4ZUjX0DEYa9i3xEghFm7Wdd24pI7ykBNOh7AvUwH0phEGlUnIx4UVCEla97JO/yV6X
         Vp7w==
X-Gm-Message-State: AAQBX9ehaq6X8lFHqmP5HDcgqbgLiH9o+caP59vkNTofFjWpkp8IVzQV
	Hxf849Z2O3kcmwr89c96BKav9l0fXLVslo5pigrd1AggFjXy
X-Google-Smtp-Source: AKy350and3TpfYqLiQjookPfkoyYCSxz5JizdG/e3H8+A3yfkgXZwMREal3Y7R/k0qISfwz8RoUnxLEYgE4NCL5vd+C1RKl33gHQ
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148c:b0:326:ce2:df9e with SMTP id
 n12-20020a056e02148c00b003260ce2df9emr7251346ilk.4.1681194772231; Mon, 10 Apr
 2023 23:32:52 -0700 (PDT)
Date: Mon, 10 Apr 2023 23:32:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000327db505f909a962@google.com>
Subject: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer
 dereference in indx_find
From: syzbot <syzbot+b3016abcd1c2d60e22a5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    59caa87f9dfb Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11c943edc80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e16f82a1b5110629
dashboard link: https://syzkaller.appspot.com/bug?extid=b3016abcd1c2d60e22a5
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/35da6feb06c7/disk-59caa87f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a664ea578945/vmlinux-59caa87f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/536b5b8d367d/Image-59caa87f.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b3016abcd1c2d60e22a5@syzkaller.appspotmail.com

ntfs3: loop1: failed to convert "0030" to iso8859-6
ntfs3: loop1: failed to convert "0032" to iso8859-6
ntfs3: loop1: failed to convert "0033" to iso8859-6
ntfs3: loop1: failed to convert "076c" to iso8859-6
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000086000006
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000100ada000
[0000000000000000] pgd=0800000117ab3003, p4d=0800000117ab3003, pud=08000001193d2003, pmd=0000000000000000
Internal error: Oops: 0000000086000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 22739 Comm: syz-executor.1 Not tainted 6.3.0-rc4-syzkaller-g59caa87f9dfb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : 0x0
lr : hdr_find_e+0x298/0x4e8 fs/ntfs3/index.c:754
sp : ffff80001f6673e0
x29: ffff80001f6675c0 x28: 000000000000000c x27: 0000000000000000
x26: 0000000000000000 x25: 0000000000000040 x24: 0000000000000000
x23: dfff800000000000 x22: 0000000000000002 x21: 0000000000000030
x20: ffff0000d18a4178 x19: 0000000000000001 x18: ffff80001f667120
x17: ffff800015c7d000 x16: ffff800012273100 x15: ffff800008a74c20
x14: ffff800008a74830 x13: 0000000000000000 x12: 0000000000040000
x11: 0000000000026b1a x10: ffff800024bea000 x9 : 0000000000000003
x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000000000003f
x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000000
x2 : ffff0000d18a4188 x1 : 000000000000000c x0 : ffff80001f6678f0
Call trace:
 0x0
 indx_find+0x2b0/0x9b8 fs/ntfs3/index.c:1141
 indx_insert_entry+0x3d8/0x634 fs/ntfs3/index.c:1914
 ntfs_insert_reparse+0x184/0x2e0 fs/ntfs3/fsntfs.c:2372
 ntfs_create_inode+0x1734/0x2bfc fs/ntfs3/inode.c:1565
 ntfs_symlink+0x5c/0x7c fs/ntfs3/namei.c:192
 vfs_symlink+0x138/0x260 fs/namei.c:4398
 do_symlinkat+0x364/0x6b0 fs/namei.c:4424
 __do_sys_symlinkat fs/namei.c:4440 [inline]
 __se_sys_symlinkat fs/namei.c:4437 [inline]
 __arm64_sys_symlinkat+0xa4/0xbc fs/namei.c:4437
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall+0x98/0x2c0 arch/arm64/kernel/syscall.c:52
 el0_svc_common+0x138/0x258 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x64/0x198 arch/arm64/kernel/syscall.c:193
 el0_svc+0x58/0x168 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591
Code: ???????? ???????? ???????? ???????? (????????) 
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
