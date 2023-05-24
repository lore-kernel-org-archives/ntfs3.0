Received: from smtpin2.cs.fsu.edu (smtpin2.cs.fsu.edu [128.186.122.77])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E43322627
	for <ntfs3@lists.linux.dev>; Wed, 24 May 2023 21:55:37 +0000 (UTC)
Received: from mail2.cs.fsu.edu (mail2.cs.fsu.edu [128.186.120.63])
	by smtpin2.cs.fsu.edu (Postfix) with ESMTP id 33A3B1202B0
	for <ntfs3@lists.linux.dev>; Wed, 24 May 2023 17:55:31 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtpin2.cs.fsu.edu 33A3B1202B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.fsu.edu; s=201902;
	t=1684965331; bh=DzPb5Ijcxwnc/CI1iSTA1PptV/EXStHp7nqjG4jYLbw=;
	h=Date:From:To:Subject:From;
	b=LtROL7v27EJ2FwYQKx2usXlZK0iARLlRCNfBahYDXSJhudBgJIxuUa16/hCsuBEem
	 cdJoDdoP6CpwrAp7X3mCJTtu7NAwA7u0IQKgYTfvvabOX+Xny2dWB6X/8xAO7ruQxG
	 bk3yt+9SPvvsY8UBeD+4QOfMJCGDB70WhLvw1ZGtsfZ/NRneYBQB2EjccxpESJKT6F
	 S2Rg6xv+F95NZe76ZWPBRpBBX69NAF+paRbNhAvPX17rr7vcgSTI6lr3usnG6w1pFp
	 Kcv9rE4wYZPgc84ZXxbFE4zPchAChMxEnuIHBQlBoivCOZMZBs5IGH5SfuDwjky5ti
	 AAKoSjmsaBlHvII327UozWJStteTwpOv3BfywakJ6NUxvG/GWeFnGfz/G6zZqJijAK
	 R5dPn7nogKg6vp7KRBdMvpqy9n+h7+YB8cV3LLDkZH0E8p3Ju++RDxwoPSrOxrd/Qg
	 LpBIDnRKFHYD8Cqf7gEIxYEa5XrNmLLTYmqxDhFTbBFGN/jvhWYUwI8TVu0oWzNQA8
	 fGuaBDl7f+muwCX3jS0GRDE6kypSYB5w08AJE+eSBXOIiMWykLoEXTsy46z9+B6ECg
	 t+CNWQnooDTqpmdw2Uu4DT2qsRRkNj7+Y2adUKRCYnN6EJxAiNP61fXEwxLXsZ155a
	 lne70l4QJTXp82bbbloF1abY=
Received: from webmail.cs.fsu.edu (webmail2.cs.fsu.edu [192.168.23.46])
	by mail2.cs.fsu.edu (Postfix) with ESMTPA id 29164480061
	for <ntfs3@lists.linux.dev>; Wed, 24 May 2023 17:55:31 -0400 (EDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 May 2023 16:55:31 -0500
From: Wenqing Liu <liu@cs.fsu.edu>
To: Ntfs3 <ntfs3@lists.linux.dev>
Subject: BUG: kernel NULL pointer dereference in hdr_find_e.isra.0
 fs/ntfs3/index.c:712
Message-ID: <c8c7fac5e51f9777487e2d7096aa9424@cs.fsu.edu>
X-Sender: liu@cs.fsu.edu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (smtpin2.cs.fsu.edu [127.0.0.1]); Wed, 24 May 2023 17:55:31 -0400 (EDT)
X-Greylist: inspected by milter-greylist-4.6.2 (smtpin2.cs.fsu.edu [127.0.0.1]); Wed, 24 May 2023 17:55:31 -0400 (EDT) for IP:'128.186.120.63' DOMAIN:'mail2.cs.fsu.edu' HELO:'mail2.cs.fsu.edu' FROM:'liu@cs.fsu.edu' RCPT:''
X-FSUCS-MailScanner-Information: Please contact the ISP for more information
X-FSUCS-MailScanner-ID: 33A3B1202B0.ADC42
X-FSUCS-MailScanner: Found to be clean
X-FSUCS-MailScanner-MCPCheck: MCP-Clean, MCP-Checker (score=0, required 1)
X-FSUCS-MailScanner-SpamScore: s
X-FSUCS-MailScanner-From: liu@cs.fsu.edu
X-FSUCS-MailScanner-Watermark: 1685570133.41592@Zm8z00WR4s766tcfjnfg0A
X-Spam-Status: No

Hi,

Our fuzzer reported a kernel NULL pointer dereference in 
hdr_find_e.isra.0 linux-6.1.29/fs/ntfs3/index.c:712

The reproducer with kernel config, fs image and strict is at
https://github.com/WenqingLiu0120/bugs/blob/main/tmp12054.zip

[  136.899597] loop6: detected capacity change from 0 to 32768
[  137.246357] BUG: kernel NULL pointer dereference, address: 
0000000000000000
[  137.246407] #PF: supervisor instruction fetch in kernel mode
[  137.246432] #PF: error_code(0x0010) - not-present page
[  137.246454] PGD 0 P4D 0
[  137.246472] Oops: 0010 [#1] PREEMPT SMP KASAN NOPTI
[  137.246496] CPU: 0 PID: 2083 Comm: cp Not tainted 6.1.29 #1
[  137.246522] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
1.15.0-1 04/01/2014
[  137.246555] RIP: 0010:0x0
[ 137.246579] Code: Unable to access opcode bytes at 0xffffffffffffffd6.

Code starting with the faulting instruction
===========================================
[  137.246605] RSP: 0018:ffffc900005e75d8 EFLAGS: 00010246
[  137.246628] RAX: 0000000000000000 RBX: ffff8881218741d8 RCX: 
0000000000000000
[  137.246657] RDX: ffff8881218741e8 RSI: 0000000000000000 RDI: 
ffff88813c2e0000
[  137.246686] RBP: dffffc0000000000 R08: ffff888121f47000 R09: 
ffffc900005e7930
[  137.246715] R10: 0000000000000000 R11: 00000000000000e3 R12: 
0000000000000000
[  137.246744] R13: 0000000000000000 R14: 0000000000000001 R15: 
ffff888121f47000
[  137.246773] FS:  00007f1d37eea800(0000) GS:ffff888293600000(0000) 
knlGS:0000000000000000
[  137.246805] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  137.246829] CR2: ffffffffffffffd6 CR3: 000000011a426001 CR4: 
0000000000370ef0
[  137.246860] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[  137.246889] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[  137.246917] Call Trace:
[  137.246929]  <TASK>
[  137.246940] hdr_find_e.isra.0 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/index.c:712) ntfs3
[  137.246972] ? cmp_sdh 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/index.c:670) ntfs3
[  137.246999] ? ni_find_attr 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/frecord.c:190) ntfs3
[  137.247026] ? kasan_save_stack 
(/home/wq/kernel/linux-6.1.29/mm/kasan/common.c:47)
[  137.247048] ? ni_load_mi 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/frecord.c:190) ntfs3
[  137.247074] ? dir_search_u 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/dir.c:247) ntfs3
[  137.247100] ? ntfs_lookup 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/ntfs_fs.h:1119 
/home/wq/kernel/linux-6.1.29/fs/ntfs3/namei.c:84) ntfs3
[  137.247127] ? __lookup_slow 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:1685)
[  137.247146] ? walk_component 
(/home/wq/kernel/linux-6.1.29/./include/linux/fs.h:771 
/home/wq/kernel/linux-6.1.29/fs/namei.c:1703 
/home/wq/kernel/linux-6.1.29/fs/namei.c:1993)
[  137.247164] ? path_lookupat.isra.0 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:2450 
/home/wq/kernel/linux-6.1.29/fs/namei.c:2474)
[  137.247185] ? filename_lookup 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:2504)
[  137.248036] ? vfs_statx (/home/wq/kernel/linux-6.1.29/fs/stat.c:230)
[  137.248811] ? vfs_fstatat 
(/home/wq/kernel/linux-6.1.29/fs/stat.c:268)
[  137.249579] ? indx_get_root 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/index.c:940) ntfs3
[  137.250341] ? path_lookupat.isra.0 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:2450 
/home/wq/kernel/linux-6.1.29/fs/namei.c:2474)
[  137.251072] ? filename_lookup 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:2504)
[  137.251792] ? vfs_statx (/home/wq/kernel/linux-6.1.29/fs/stat.c:230)
[  137.252500] ? indx_init 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/index.c:933) ntfs3
[  137.253223] ? entry_SYSCALL_64_after_hwframe 
(/home/wq/kernel/linux-6.1.29/arch/x86/entry/entry_64.S:120)
[  137.253947] indx_find 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/index.c:1083) ntfs3
[  137.254655] ? kasan_unpoison 
(/home/wq/kernel/linux-6.1.29/mm/kasan/shadow.c:108 
/home/wq/kernel/linux-6.1.29/mm/kasan/shadow.c:142 
/home/wq/kernel/linux-6.1.29/mm/kasan/shadow.c:115)
[  137.255338] ? indx_find_buffer 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/index.c:1056) ntfs3
[  137.256050] ? __kmem_cache_alloc_node 
(/home/wq/kernel/linux-6.1.29/./arch/x86/include/asm/jump_label.h:55 
/home/wq/kernel/linux-6.1.29/./include/linux/memcontrol.h:1750 
/home/wq/kernel/linux-6.1.29/mm/slab.h:520 
/home/wq/kernel/linux-6.1.29/mm/slab.h:745 
/home/wq/kernel/linux-6.1.29/mm/slub.c:3398 
/home/wq/kernel/linux-6.1.29/mm/slub.c:3437)
[  137.256735] dir_search_u 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/dir.c:254) ntfs3
[  137.257420] ? ntfs_nls_to_utf16 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/dir.c:235) ntfs3
[  137.258099] ? mutex_lock 
(/home/wq/kernel/linux-6.1.29/./arch/x86/include/asm/atomic64_64.h:190 
/home/wq/kernel/linux-6.1.29/./include/linux/atomic/atomic-long.h:443 
/home/wq/kernel/linux-6.1.29/./include/linux/atomic/atomic-instrumented.h:1781 
/home/wq/kernel/linux-6.1.29/kernel/locking/mutex.c:171 
/home/wq/kernel/linux-6.1.29/kernel/locking/mutex.c:285)
[  137.258748] ? __mutex_lock_slowpath 
(/home/wq/kernel/linux-6.1.29/kernel/locking/mutex.c:282)
[  137.259391] ? kmem_cache_alloc 
(/home/wq/kernel/linux-6.1.29/mm/slab.h:738 
/home/wq/kernel/linux-6.1.29/mm/slub.c:3398 
/home/wq/kernel/linux-6.1.29/mm/slub.c:3406 
/home/wq/kernel/linux-6.1.29/mm/slub.c:3413 
/home/wq/kernel/linux-6.1.29/mm/slub.c:3422)
[  137.260044] ntfs_lookup 
(/home/wq/kernel/linux-6.1.29/fs/ntfs3/ntfs_fs.h:1119 
/home/wq/kernel/linux-6.1.29/fs/ntfs3/namei.c:84) ntfs3
[  137.260691] __lookup_slow 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:1685)
[  137.261326] ? lookup_fast 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:1661)
[  137.261952] ? try_to_unlazy 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:781)
[  137.262564] walk_component 
(/home/wq/kernel/linux-6.1.29/./include/linux/fs.h:771 
/home/wq/kernel/linux-6.1.29/fs/namei.c:1703 
/home/wq/kernel/linux-6.1.29/fs/namei.c:1993)
[  137.263162] path_lookupat.isra.0 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:2450 
/home/wq/kernel/linux-6.1.29/fs/namei.c:2474)
[  137.263755] ? kasan_save_stack 
(/home/wq/kernel/linux-6.1.29/mm/kasan/common.c:46)
[  137.264346] filename_lookup 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:2504)
[  137.264922] ? __kasan_slab_free 
(/home/wq/kernel/linux-6.1.29/mm/kasan/common.c:238 
/home/wq/kernel/linux-6.1.29/mm/kasan/common.c:200 
/home/wq/kernel/linux-6.1.29/mm/kasan/common.c:244)
[  137.265493] ? may_linkat 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:2497)
[  137.266056] ? entry_SYSCALL_64_after_hwframe 
(/home/wq/kernel/linux-6.1.29/arch/x86/entry/entry_64.S:120)
[  137.266626] ? lockref_put_return 
(/home/wq/kernel/linux-6.1.29/lib/lockref.c:121 (discriminator 7))
[  137.267198] ? ___slab_alloc 
(/home/wq/kernel/linux-6.1.29/mm/slub.c:3132)
[  137.267757] ? _copy_to_user 
(/home/wq/kernel/linux-6.1.29/./arch/x86/include/asm/uaccess_64.h:46 
/home/wq/kernel/linux-6.1.29/./arch/x86/include/asm/uaccess_64.h:58 
/home/wq/kernel/linux-6.1.29/lib/usercopy.c:41)
[  137.268306] vfs_statx (/home/wq/kernel/linux-6.1.29/fs/stat.c:230)
[  137.268840] ? vfs_getattr 
(/home/wq/kernel/linux-6.1.29/fs/stat.c:219)
[  137.269370] ? getname_flags 
(/home/wq/kernel/linux-6.1.29/fs/namei.c:150 
/home/wq/kernel/linux-6.1.29/fs/namei.c:129)
[  137.269903] vfs_fstatat (/home/wq/kernel/linux-6.1.29/fs/stat.c:268)
[  137.270425] __do_sys_newfstatat 
(/home/wq/kernel/linux-6.1.29/fs/stat.c:438)
[  137.270955] ? __ia32_compat_sys_newlstat 
(/home/wq/kernel/linux-6.1.29/fs/stat.c:433)
[  137.271489] ? fpregs_assert_state_consistent 
(/home/wq/kernel/linux-6.1.29/arch/x86/kernel/fpu/context.h:39 
/home/wq/kernel/linux-6.1.29/arch/x86/kernel/fpu/core.c:769)
[  137.272098] ? exit_to_user_mode_prepare 
(/home/wq/kernel/linux-6.1.29/./arch/x86/include/asm/entry-common.h:57 
/home/wq/kernel/linux-6.1.29/kernel/entry/common.c:206)
[  137.272622] do_syscall_64 
(/home/wq/kernel/linux-6.1.29/arch/x86/entry/common.c:50 
/home/wq/kernel/linux-6.1.29/arch/x86/entry/common.c:80)
[  137.273144] entry_SYSCALL_64_after_hwframe 
(/home/wq/kernel/linux-6.1.29/arch/x86/entry/entry_64.S:120)
[  137.273674] RIP: 0033:0x7f1d380b69bf
[ 137.274201] Code: 00 b8 ff ff ff ff c3 0f 1f 40 00 f3 0f 1e fa 41 89 
f9 45 89 c2 89 f7 48 89 d6 48 89 ca 41 83 f9 01 77 30 b8 06 01 00 00 0f 
05 <48> 3d 00 f0 ff ff 77 09 c3 0f 1f 84 00 00 00 00 00 48 8b 15 99 e4
All code
========
    0:	00 b8 ff ff ff ff    	add    %bh,-0x1(%rax)
    6:	c3                   	retq
    7:	0f 1f 40 00          	nopl   0x0(%rax)
    b:	f3 0f 1e fa          	endbr64
    f:	41 89 f9             	mov    %edi,%r9d
   12:	45 89 c2             	mov    %r8d,%r10d
   15:	89 f7                	mov    %esi,%edi
   17:	48 89 d6             	mov    %rdx,%rsi
   1a:	48 89 ca             	mov    %rcx,%rdx
   1d:	41 83 f9 01          	cmp    $0x1,%r9d
   21:	77 30                	ja     0x53
   23:	b8 06 01 00 00       	mov    $0x106,%eax
   28:	0f 05                	syscall
   2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- 
trapping instruction
   30:	77 09                	ja     0x3b
   32:	c3                   	retq
   33:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   3a:	00
   3b:	48                   	rex.W
   3c:	8b                   	.byte 0x8b
   3d:	15                   	.byte 0x15
   3e:	99                   	cltd
   3f:	e4                   	.byte 0xe4

Code starting with the faulting instruction
===========================================
    0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
    6:	77 09                	ja     0x11
    8:	c3                   	retq
    9:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
   10:	00
   11:	48                   	rex.W
   12:	8b                   	.byte 0x8b
   13:	15                   	.byte 0x15
   14:	99                   	cltd
   15:	e4                   	.byte 0xe4
[  137.275354] RSP: 002b:00007ffcb97626a8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000106
[  137.276001] RAX: ffffffffffffffda RBX: 00007ffcb9762c30 RCX: 
00007f1d380b69bf
[  137.276608] RDX: 00007ffcb9762890 RSI: 000055d193b55d00 RDI: 
00000000ffffff9c
[  137.277219] RBP: 00007ffcb9762a80 R08: 0000000000000000 R09: 
0000000000000001
[  137.277831] R10: 0000000000000000 R11: 0000000000000246 R12: 
00007ffcb9762890
[  137.278448] R13: 00007ffcb9762800 R14: 000055d193b55d00 R15: 
00000000ffffffff
[  137.279068]  </TASK>
[  137.279681] Modules linked in: ntfs3 joydev input_leds serio_raw 
qemu_fw_cfg xfs autofs4 raid10 raid456 async_raid6_recov async_memcpy 
async_pq async_xor async_tx raid1 raid0 multipath linear qxl 
drm_ttm_helper ttm drm_kms_helper hid_generic usbhid hid syscopyarea 
sysfillrect sysimgblt fb_sys_fops drm crct10dif_pclmul crc32_pclmul 
ghash_clmulni_intel psmouse aesni_intel crypto_simd cryptd
[  137.282557] CR2: 0000000000000000
[  137.283282] ---[ end trace 0000000000000000 ]---
[  137.284052] RIP: 0010:0x0
[ 137.284764] Code: Unable to access opcode bytes at 0xffffffffffffffd6.

Code starting with the faulting instruction
===========================================
[  137.285493] RSP: 0018:ffffc900005e75d8 EFLAGS: 00010246
[  137.286224] RAX: 0000000000000000 RBX: ffff8881218741d8 RCX: 
0000000000000000
[  137.286965] RDX: ffff8881218741e8 RSI: 0000000000000000 RDI: 
ffff88813c2e0000
[  137.287711] RBP: dffffc0000000000 R08: ffff888121f47000 R09: 
ffffc900005e7930
[  137.288472] R10: 0000000000000000 R11: 00000000000000e3 R12: 
0000000000000000
[  137.289226] R13: 0000000000000000 R14: 0000000000000001 R15: 
ffff888121f47000
[  137.289978] FS:  00007f1d37eea800(0000) GS:ffff888293600000(0000) 
knlGS:0000000000000000
[  137.290744] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  137.291516] CR2: ffffffffffffffd6 CR3: 000000011a426001 CR4: 
0000000000370ef0
[  137.292310] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[  137.293103] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400

Wenqing Liu
