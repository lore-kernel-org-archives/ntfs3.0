Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0BF3D891A
	for <ntfs3@lists.linux.dev>; Tue, 26 May 2026 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790148; cv=none; b=knlhWf5A4et6p6GMIMswE1b00j8+2DghCSjcnAsVFE887xzprcLgpeqTr0ZmoKPq7WNcx1G1OAzLe2vIzY/c5gcoLx/QMYqydFB3M+IQeenjj+tSuc7xfesioc8LzUpjXky+0mEANHZCrpGM9/yavdgZ4SYZEmFxGzmddQuRsbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790148; c=relaxed/simple;
	bh=d2vM/ZzrtF3DAlm3hRwK26SlIHeMdOrC/O254vciEgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bP2dnyhcLv7xUI0vNOrVuA8td20ufKiDcVKds7B5mjiiB4n8ACNvieqqxNp/VVouVRQF59unqHRMwmV2hoXzkFheOaRQiTJ4lmeOyVF2iqqZs0t9nOcLhekKO1H+Cni3BzA5NvlUYkrYjBgjWUVNb6am+9aKyqh41RBhz2mWEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=uoYuXPQd; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="uoYuXPQd"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 707351D19;
	Tue, 26 May 2026 10:09:07 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=uoYuXPQd;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id AD29D2139;
	Tue, 26 May 2026 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779790144;
	bh=29a08TxaKb82p55yp0m2RK+BFyPvA6JTDtDuYOb80g0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uoYuXPQdq5OxiFHixxHbSydyBM/uuon2VTIQN8xJutGHurlEmqDboA0r7afZJf7cE
	 Kqu5t7tqHl3ZX0AmICE3VQvqhtsnxtfcWkUK7Y274hkG/4U8OwtlUVdcxLYGUldXk0
	 /O6N2EGlIS1pO/PfuGJIf5+lNPzcvv4eiCwHpqU0=
Received: from [192.168.95.128] (172.30.20.153) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 26 May 2026 13:09:03 +0300
Message-ID: <f40035f4-f8e4-4196-9376-7165095b7522@paragon-software.com>
Date: Tue, 26 May 2026 12:09:02 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] KASAN: slab-use-after-free Read in ntfs_show_options
To: Eulgyu Kim <eulgyukim@snu.ac.kr>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<byoungyoung@snu.ac.kr>, <jjy600901@snu.ac.kr>
References: <20260504123700.32551-1-eulgyukim@snu.ac.kr>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260504123700.32551-1-eulgyukim@snu.ac.kr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/4/26 14:37, Eulgyu Kim wrote:

> Hello,
>
> We encountered a "KASAN: slab-use-after-free Read in ntfs_show_options"
> on kernel version v7.1.0-rc1.
>
> As this issue was identified via fuzzing and we have limited background,
> we find it challenging to identify the exact root cause or propose a correct fix.
> Therefore, please consider the following analysis as a best-effort guess,
> which may still be incomplete or incorrect.
>
> The issue is that ntfs3 replaces sbi->options during reconfigure and
> leaves the old options object in fc->fs_private, where it is freed by
> the subsequent VFS fs_context cleanup path, while concurrent readers
> such as ntfs_show_options() can still hold and dereference the old pointer.
>
> The harmful sequence is:
>
> 1. ntfs_show_options() is called while reading /proc/*/mounts.
>
> 2. It reads the current mount options pointer:
>
>    struct ntfs_mount_options *opts = sbi->options;
>
> 3. Before ntfs_show_options() finishes using opts,
> another thread reconfigures the same NTFS3 mount.
>
> 4. ntfs_fs_reconfigure() installs a new options object by swapping pointers:
>
>    swap(sbi->options, fc->fs_private);
>
> 5. After reconfigure succeeds, the VFS the VFS calls vfs_clean_context()
> to clean up the fs_context.
>
> 6. During that cleanup, ntfs_fs_free() frees fc->fs_private,
> which is now the old sbi->options object.
>
> 7. The first thread resumes inside ntfs_show_options() and
> continues reading fields from opts.
>
> 8. But opts now points to freed memory, so KASAN reports a slab use-after-free.
>
> We have included the following items below:
> - C reproducer (~90 lines)
> - kernel delay patch
> - KASAN crash log
>
> To reliably trigger the race condition bug, we patched the kernel
> to inject a delay at a specific point. Also, our reproducer assumes that
> ntfs image already exists at `/tmp/ntfs.img`.
>
> The kernel config used is the same as the syzbot configuration.
>
> We hope this report helps address the issue. Please let us know
> if any further information is needed.
>
> Thank you.
>
> Best Regards,
> Eulgyu Kim
>
>
>
> kernel delay patch:
> ==================================================================
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 004f59937..dbfac1a44 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -68,6 +68,7 @@
>   #include <linux/proc_fs.h>
>   #include <linux/seq_file.h>
>   #include <linux/statfs.h>
> +#include <linux/delay.h>
>
>   #include "debug.h"
>   #include "ntfs.h"
> @@ -757,6 +758,9 @@ static int ntfs_show_options(struct seq_file *m, struct dentry *root)
>          struct ntfs_mount_options *opts = sbi->options;
>          struct user_namespace *user_ns = seq_user_ns(m);
>
> +       if (!strcmp(current->comm, "slowme"))
> +               mdelay(2000);
> +
>          seq_printf(m, ",uid=%u", from_kuid_munged(user_ns, opts->fs_uid));
>          seq_printf(m, ",gid=%u", from_kgid_munged(user_ns, opts->fs_gid));
>          if (opts->dmask)
> ==================================================================
>
>
>
> C reproducer:
> ==================================================================
> #define _GNU_SOURCE
>
> #include <fcntl.h>
> #include <linux/loop.h>
> #include <pthread.h>
> #include <stdio.h>
> #include <sys/mount.h>
> #include <sys/prctl.h>
> #include <sys/syscall.h>
> #include <unistd.h>
>
> #ifndef __NR_fsconfig
> #define __NR_fsconfig 431
> #endif
> #ifndef __NR_fspick
> #define __NR_fspick 433
> #endif
> #ifndef FSCONFIG_SET_STRING
> #define FSCONFIG_SET_STRING 1
> #endif
> #ifndef FSCONFIG_CMD_RECONFIGURE
> #define FSCONFIG_CMD_RECONFIGURE 7
> #endif
>
> static const char *mntdir = "/tmp/ntfs-repro";
> static const char *imgpath = "/tmp/ntfs.img";
> static char loopdev[64];
>
> static void setup_loop(void)
> {
>          int img, ctl, lfd, nr;
>
>          img = syscall(SYS_openat, AT_FDCWD, imgpath, O_RDWR, 0);
>          ctl = syscall(SYS_openat, AT_FDCWD, "/dev/loop-control", O_RDWR, 0);
>          nr = syscall(SYS_ioctl, ctl, LOOP_CTL_GET_FREE);
>          syscall(SYS_close, ctl);
>
>          snprintf(loopdev, sizeof(loopdev), "/dev/loop%d", nr);
>          lfd = syscall(SYS_openat, AT_FDCWD, loopdev, O_RDWR, 0);
>          syscall(SYS_ioctl, lfd, LOOP_SET_FD, img);
>
>          syscall(SYS_close, img);
>          syscall(SYS_close, lfd);
> }
>
> static void mount_ntfs(void)
> {
>          syscall(SYS_mkdir, mntdir, 0700);
>          setup_loop();
>          syscall(SYS_mount, loopdev, mntdir, "ntfs3", 0, "force,iocharset=utf8");
> }
>
> static void reconfigure_once(void)
> {
>          int fd;
>
>          fd = syscall(__NR_fspick, AT_FDCWD, mntdir, 0);
>          syscall(__NR_fsconfig, fd, FSCONFIG_SET_STRING, "iocharset", "utf8", 0);
>          syscall(__NR_fsconfig, fd, FSCONFIG_CMD_RECONFIGURE, NULL, NULL, 0);
> }
>
> static void *thread_fn(void *arg)
> {
>          char buf[8192];
>          int fd;
>
>          syscall(SYS_prctl, PR_SET_NAME, "slowme", 0, 0, 0);
>          fd = syscall(SYS_openat, AT_FDCWD, "/proc/self/mounts", O_RDONLY, 0);
>          syscall(SYS_read, fd, buf, sizeof(buf));
>          return NULL;
> }
>
> int main(void)
> {
>          pthread_t thread;
>
>          mount_ntfs();
>
>          pthread_create(&thread, NULL, thread_fn, NULL);
>
>          sleep(1);
>          reconfigure_once();
>          return 0;
> }
>
> ==================================================================
>
>
>
> KASAN crash log:
> ==================================================================
> BUG: KASAN: slab-use-after-free in ntfs_show_options+0x637/0x7f0 fs/ntfs3/super.c:761
> Read of size 4 at addr ff110001135f4954 by task main/9519
> CPU: 5 UID: 0 PID: 9519 Comm: main Not tainted 7.1.0-rc1-gf1a5e78a55eb #12 PREEMPT(full)
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>   print_address_description+0x55/0x1e0 mm/kasan/report.c:378
>   print_report+0x64/0x70 mm/kasan/report.c:482
>   kasan_report+0x118/0x150 mm/kasan/report.c:595
>   ntfs_show_options+0x637/0x7f0 fs/ntfs3/super.c:761
>   show_vfsmnt+0x61b/0x760 fs/proc_namespace.c:129
>   seq_read_iter+0x9bb/0xe20 fs/seq_file.c:273
>   new_sync_read fs/read_write.c:493 [inline]
>   vfs_read+0x55a/0xa30 fs/read_write.c:574
>   ksys_read+0x145/0x250 fs/read_write.c:717
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0x16e/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x44b41c
> Code: ec 28 48 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 19 b0 02 00 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 48 89 44 24 08 e8 5f b0 02 00 48
> RSP: 002b:00007f8fca2bb170 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 00007f8fca2bd640 RCX: 000000000044b41c
> RDX: 0000000000002000 RSI: 00007f8fca2bb1c0 RDI: 0000000000000003
> RBP: 00007f8fca2bd1d0 R08: 0000000000000000 R09: 00007ffce134fe1f
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8fca2bd640
> R13: 0000000000000010 R14: 0000000000414ff0 R15: 00007f8fc9abd000
>   </TASK>
> Allocated by task 9518:
>   kasan_save_stack mm/kasan/common.c:57 [inline]
>   kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>   poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
>   __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
>   kasan_kmalloc include/linux/kasan.h:263 [inline]
>   __kmalloc_cache_noprof+0x321/0x670 mm/slub.c:5415
>   kmalloc_noprof include/linux/slab.h:950 [inline]
>   kzalloc_noprof include/linux/slab.h:1188 [inline]
>   ntfs_init_fs_context+0x58/0x590 fs/ntfs3/super.c:1858
>   alloc_fs_context+0x9d6/0xd50 fs/fs_context.c:295
>   __do_sys_fspick fs/fsopen.c:194 [inline]
>   __se_sys_fspick+0x1bd/0x440 fs/fsopen.c:163
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0x16e/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> Freed by task 9518:
>   kasan_save_stack mm/kasan/common.c:57 [inline]
>   kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
>   kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
>   poison_slab_object mm/kasan/common.c:253 [inline]
>   __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
>   kasan_slab_free include/linux/kasan.h:235 [inline]
>   slab_free_hook mm/slub.c:2689 [inline]
>   slab_free mm/slub.c:6246 [inline]
>   kfree+0x1c7/0x650 mm/slub.c:6561
>   vfs_clean_context+0xa9/0x220 fs/fs_context.c:538
>   vfs_cmd_reconfigure fs/fsopen.c:275 [inline]
>   vfs_fsconfig_locked+0x282/0x320 fs/fsopen.c:297
>   __do_sys_fsconfig fs/fsopen.c:463 [inline]
>   __se_sys_fsconfig+0x6bc/0x810 fs/fsopen.c:350
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0x16e/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> The buggy address belongs to the object at ff110001135f4940
>   which belongs to the cache kmalloc-32 of size 32
> The buggy address is located 20 bytes inside of
>   freed 32-byte region [ff110001135f4940, ff110001135f4960)
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xff110001135f4f80 pfn:0x1135f4
> flags: 0x17ff00000000200(workingset|node=0|zone=2|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 017ff00000000200 ff11000100038780 ffd4000004aa8d10 ffd400000419c310
> raw: ff110001135f4f80 0000000800400037 00000000f5000000 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5087, tgid 5087 (udevadm), ts 36737485715, free_ts 36575007430
>   set_page_owner include/linux/page_owner.h:32 [inline]
>   post_alloc_hook+0x23d/0x2a0 mm/page_alloc.c:1858
>   prep_new_page mm/page_alloc.c:1866 [inline]
>   get_page_from_freelist+0x24be/0x2540 mm/page_alloc.c:3946
>   __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5226
>   alloc_slab_page mm/slub.c:3278 [inline]
>   allocate_slab+0x77/0x680 mm/slub.c:3467
>   new_slab mm/slub.c:3525 [inline]
>   refill_objects+0x342/0x3d0 mm/slub.c:7251
>   refill_sheaf mm/slub.c:2816 [inline]
>   __pcs_replace_empty_main+0x323/0x730 mm/slub.c:4651
>   alloc_from_pcs mm/slub.c:4749 [inline]
>   slab_alloc_node mm/slub.c:4883 [inline]
>   __kmalloc_cache_noprof+0x391/0x670 mm/slub.c:5410
>   kmalloc_noprof include/linux/slab.h:950 [inline]
>   slab_free_hook mm/slub.c:2641 [inline]
>   slab_free mm/slub.c:6246 [inline]
>   kmem_cache_free+0x158/0x660 mm/slub.c:6373
>   fput_close_sync+0x113/0x220 fs/file_table.c:615
>   __do_sys_close fs/open.c:1507 [inline]
>   __se_sys_close fs/open.c:1492 [inline]
>   __x64_sys_close+0x7f/0x110 fs/open.c:1492
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0x16e/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> page last free pid 0 tgid 0 stack trace:
>   reset_page_owner include/linux/page_owner.h:25 [inline]
>   __free_pages_prepare mm/page_alloc.c:1402 [inline]
>   __free_frozen_pages+0xbdb/0xd50 mm/page_alloc.c:2943
>   __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
>   tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:291
>   rcu_do_batch kernel/rcu/tree.c:2617 [inline]
>   rcu_core+0x7bd/0x1060 kernel/rcu/tree.c:2869
>   handle_softirqs+0x22b/0x850 kernel/softirq.c:622
>   __do_softirq kernel/softirq.c:656 [inline]
>   invoke_softirq kernel/softirq.c:496 [inline]
>   __irq_exit_rcu+0xcb/0x220 kernel/softirq.c:735
>   irq_exit_rcu+0x9/0x30 kernel/softirq.c:752
>   instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1061 [inline]
>   sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1061
>   asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
> Memory state around the buggy address:
>   ff110001135f4800: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>   ff110001135f4880: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>> ff110001135f4900: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>                                                   ^
>   ff110001135f4980: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>   ff110001135f4a00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
> ==================================================================

Hello,

Thank you for your detailed report. I will look into the issue
and get back with findings.

Regards,
Konstantin

