Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD77B
	for <ntfs3@lists.linux.dev>; Sat, 22 Oct 2022 11:43:44 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id b7-20020a92c567000000b002fb9207838bso5530948ilj.23
        for <ntfs3@lists.linux.dev>; Sat, 22 Oct 2022 04:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzPY5+dygQG7DwfaQGmzfbg3WM+EsIeaCR6GugnyQeo=;
        b=rlLub0RZxvQ62Fh8yrOiTohP6juZ8MIUOY7bMepXFqXgdq6eDCgKUPqIWW1NoyTOM7
         E14KgvRW4e0eDGDfmDYIy5Qd0a75tyLvb8wc6XDWRCWV5C/r5x65HqzHDu10CdtdGNV2
         LuN5Z8Xpf/ehWm3r/vUpaEWT75qDRwT3eb7Obs7Z9IZazxkCqXbaszv1mS8P3y65+OT9
         WK6QHMiDaWlYNnmKlAhzEU4Z09h4sW4QwaUsYNoQY8XtobIoakULwDqvvPGprpS8K/p6
         86GgcQjGZ/YaZHRVUYRTJwR80y/RjkBph3coaaotZy2+iYuG+P90NhCfefPioCRn5YDq
         DU/g==
X-Gm-Message-State: ACrzQf1E5vjlCurAc++CCHR6FSsJeMWUBIhqbiEfj9BaLPBhMj8m56QC
	LA3hRuA5tXSvmZiCLyR0IaAoPam4BlIoWQBQW/c9jB4SiH9s
X-Google-Smtp-Source: AMsMyM6MMYXdpGO/DgS2rt8Ois43Oqy8lkkCzznGw9m9nKwTs9ZEcB/M8qvqUpemsc1QkqQHm8cVWjTcuQoZDOWeNwdDiMxmSDmj
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:134f:b0:6a4:cd04:7842 with SMTP id
 i15-20020a056602134f00b006a4cd047842mr16442958iov.172.1666439023961; Sat, 22
 Oct 2022 04:43:43 -0700 (PDT)
Date: Sat, 22 Oct 2022 04:43:43 -0700
In-Reply-To: <000000000000f61bdf05e79a7c5c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000102c9e05eb9e12c3@google.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in mi_enum_attr
From: syzbot <syzbot+28207acc70bbf3d85b74@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    440b7895c990 Merge tag 'mm-hotfixes-stable-2022-10-20' of ..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12f15216880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=afc317c0f52ce670
dashboard link: https://syzkaller.appspot.com/bug?extid=28207acc70bbf3d85b74
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d6496a880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d32fc2880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/105038975fc9/disk-440b7895.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/edd7302c8fc8/vmlinux-440b7895.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/7e29515d4690/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+28207acc70bbf3d85b74@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3: loop0: Different NTFS' sector size (1024) and media sector size (512)
ntfs3: loop0: Mark volume as dirty due to NTFS errors
==================================================================
BUG: KASAN: use-after-free in mi_enum_attr+0x583/0x6a0 fs/ntfs3/record.c:227
Read of size 4 at addr ffff888177de6993 by task syz-executor131/3605

CPU: 0 PID: 3605 Comm: syz-executor131 Not tainted 6.1.0-rc1-syzkaller-00158-g440b7895c990 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 print_address_description+0x74/0x340 mm/kasan/report.c:284
 print_report+0x107/0x1f0 mm/kasan/report.c:395
 kasan_report+0xcd/0x100 mm/kasan/report.c:495
 mi_enum_attr+0x583/0x6a0 fs/ntfs3/record.c:227
 ni_enum_attr_ex+0x2f6/0x6d0 fs/ntfs3/frecord.c:259
 ntfs_read_mft fs/ntfs3/inode.c:114 [inline]
 ntfs_iget5+0x1d3e/0x36f0 fs/ntfs3/inode.c:501
 ntfs_fill_super+0x3b55/0x42a0 fs/ntfs3/super.c:1195
 get_tree_bdev+0x400/0x620 fs/super.c:1323
 vfs_get_tree+0x88/0x270 fs/super.c:1530
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f43fe5afaca
Code: 48 c7 c2 c0 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 f8 03 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd57724258 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f43fe5afaca
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffd57724270
RBP: 00007ffd57724270 R08: 00007ffd577242b0 R09: 00007ffd577242e0
R10: 0000000000000000 R11: 0000000000000286 R12: 0000000000000004
R13: 00007ffd577242b0 R14: 0000000000000109 R15: 0000000020001ad8
 </TASK>

The buggy address belongs to the physical page:
page:ffffea0005df7980 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x177de6
flags: 0x57ff00000000000(node=1|zone=2|lastcpupid=0x7ff)
raw: 057ff00000000000 ffffea0005df7988 ffffea0005df7988 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner info is not present (never set?)

Memory state around the buggy address:
 ffff888177de6880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888177de6900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff888177de6980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                         ^
 ffff888177de6a00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888177de6a80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================

