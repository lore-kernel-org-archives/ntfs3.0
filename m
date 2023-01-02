Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65F97C
	for <ntfs3@lists.linux.dev>; Mon,  2 Jan 2023 10:11:53 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id b13-20020a92c56d000000b0030c4d05f3e4so1692852ilj.6
        for <ntfs3@lists.linux.dev>; Mon, 02 Jan 2023 02:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0Q3CMVQGNevHLuJxk0BGXLo9aQnijjlldmvkiBzlac=;
        b=H9fDODLRXZaUqVsg9iSDgRYW/CpAK+q9adbUFinrjzedzl+FrYZU+0Slcc+ojk9+r7
         15kg1RSjdmTAf5At11MePGSGdOPGXhr5VAK2rztJP8NwIwK+3a+WIXBHohUhhmPbaFBe
         S2bF39u+HwTeKdnwtA7lU8U3rLHnMUSjBV94kOHECdW43LuENPYbfGs2tX1w2FNm8XU9
         efB6mCruFjpJeUimjyAijicsZ+bJBpzav3yqb97BhN7ukuVmkHcEnFRvlk2x24s2JZ1J
         PuaJFCTlZfp0bbZSjZBEKWTuFa0DHhZXuoZrjAY8bVYJvkVX0HM/GHeGSI31J9aw4m0B
         os3g==
X-Gm-Message-State: AFqh2koBRUqrJYuz2nb0OCJt9/djMXRO2sOugzwaJ2LWhalsq+msrjav
	eJ8HCMkEOYrlWqYxvnJc9YsBR5TImR6ncFMc/Gvcb1U40qRV
X-Google-Smtp-Source: AMrXdXt+5hq7XWLTOmr0obtsK6zHC3pqavWlYIEZG9WRS3N1rODU/yZXLF9A2CFwxP+qBYeqlvW4rFOm759vRe1I41ka78v4V6iy
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144:b0:30c:41d:2006 with SMTP id
 j4-20020a056e02014400b0030c041d2006mr1810836ilr.314.1672654312917; Mon, 02
 Jan 2023 02:11:52 -0800 (PST)
Date: Mon, 02 Jan 2023 02:11:52 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000027524405f1452ea8@google.com>
Subject: [syzbot] [ntfs3?] WARNING in ntfs_load_attr_list
From: syzbot <syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=147b73ac480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=89dbb3a789a5b9711793
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a9b338480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c4bcff880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e51299d60a31/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+89dbb3a789a5b9711793@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3: loop0: Different NTFS' sector size (1024) and media sector size (512)
------------[ cut here ]------------
WARNING: CPU: 0 PID: 3074 at mm/page_alloc.c:5534 __alloc_pages+0x150/0x1fc mm/page_alloc.c:5534
Modules linked in:
CPU: 0 PID: 3074 Comm: syz-executor509 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __alloc_pages+0x150/0x1fc mm/page_alloc.c:5534
lr : __alloc_pages_node include/linux/gfp.h:237 [inline]
lr : alloc_pages_node include/linux/gfp.h:260 [inline]
lr : __kmalloc_large_node+0xb4/0x1dc mm/slab_common.c:1096
sp : ffff80000ff138b0
x29: ffff80000ff138f0 x28: 0000000000000001 x27: ffff0000c62ca900
x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
x23: ffff0000ca9316d0 x22: 0000000000000004 x21: 0000000000040c40
x20: 0000000000000000 x19: 0000000000000022 x18: 00000000000000c0
x17: ffff80000dda8198 x16: ffff80000dbe6158 x15: ffff0000c9ae1a40
x14: 0000000000000000 x13: 00000000ffffffff x12: 000000020000000f
x11: 00000000f0000006 x10: 0000000000000040 x9 : 0000000000000001
x8 : ffff80000d95e000 x7 : 0000000000000000 x6 : 000000000000003f
x5 : ffff0000c9bc788c x4 : 0000000000000000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000022 x0 : 0000000000040c40
Call trace:
 __alloc_pages+0x150/0x1fc mm/page_alloc.c:5534
 __alloc_pages_node include/linux/gfp.h:237 [inline]
 alloc_pages_node include/linux/gfp.h:260 [inline]
 __kmalloc_large_node+0xb4/0x1dc mm/slab_common.c:1096
 __do_kmalloc_node mm/slab_common.c:943 [inline]
 __kmalloc+0x104/0x140 mm/slab_common.c:968
 kmalloc include/linux/slab.h:558 [inline]
 ntfs_load_attr_list+0x124/0x1d0 fs/ntfs3/attrlist.c:78
 ntfs_read_mft fs/ntfs3/inode.c:162 [inline]
 ntfs_iget5+0x59c/0x138c fs/ntfs3/inode.c:501
 ntfs_loadlog_and_replay+0x98/0x1ec fs/ntfs3/fsntfs.c:272
 ntfs_fill_super+0xc10/0x14a4 fs/ntfs3/super.c:1018
 get_tree_bdev+0x1e8/0x2a0 fs/super.c:1324
 ntfs_fs_get_tree+0x28/0x38 fs/ntfs3/super.c:1358
 vfs_get_tree+0x40/0x140 fs/super.c:1531
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x890 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
irq event stamp: 23612
hardirqs last  enabled at (23611): [<ffff80000852de54>] ___slab_alloc+0x794/0x91c mm/slub.c:3132
hardirqs last disabled at (23612): [<ffff80000c084084>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:405
softirqs last  enabled at (21864): [<ffff8000080102e4>] _stext+0x2e4/0x37c
softirqs last disabled at (21721): [<ffff800008017c88>] ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:80
---[ end trace 0000000000000000 ]---
ntfs3: loop0: Failed to load $MFT.


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
