Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648D3D4127
	for <ntfs3@lists.linux.dev>; Fri, 22 May 2026 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457862; cv=none; b=c/zBHJIcGsL4qtfrsTZXZvkqnH7DYfqu64ddNPFno4R8Uv1xLQ3Z6o6HI8/8oB8QW4HMy4eGyNwr31N6Mz4czHiuynRLJp5a7twHk+2hmPyXI48tf3oE0tRXIDDLNVB/bqMBAR2uFsZ48fsI7xb0RaO81KNPh8KWAAuhzhpiS8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457862; c=relaxed/simple;
	bh=PlRuU8u8bHTnptif2bZpA2rW4SwBQ597unWHpGjQHEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S+wabvdYhEwt3BegM74GzeMAQ3jkZfqk8yCjyIU1/x1/qdFTy59pDyhO2bjl4uE4a229sM594kwxiXPuJOZTtr4vuvPNCQWCPAxGFUAbLzsbWNobDoiTZZVum4d4LNx1U5gJOcBrs9w31H/+59+n0zaSFDahea8qABo6J/QJcco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=nk/BvEPx; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="nk/BvEPx"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B605C1D3E;
	Fri, 22 May 2026 13:51:01 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=nk/BvEPx;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 21FD22203;
	Fri, 22 May 2026 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779457854;
	bh=V7eTMocB/EJucs5glx068x+vg66gfhYOXhK2w/egizE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nk/BvEPxExNhnTh4uv69Q3fN+uGWDm5xFLEDHwi1pfH+qlrHVDy3kq431CNL9we86
	 RGF2qWgZbKSWXUz6KMqR4JesygdZFJy6ni0cVygK1wIpJJeA9zMvH4PDEB/md0B6yS
	 Wn8Mjxcv6mnjGO+Mrx742INjtt5e6RcHxspCpNDo=
Received: from [192.168.95.128] (172.30.20.156) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 22 May 2026 16:50:52 +0300
Message-ID: <fe49c8dd-85ce-4675-be1d-4cc79a0f200e@paragon-software.com>
Date: Fri, 22 May 2026 15:50:51 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: hold ni_lock across readdir metadata walk
To: ZhengYuan Huang <gality369@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<baijiaju1990@gmail.com>, <r33s3n6@gmail.com>, <zzzccc427@gmail.com>
References: <20260427072650.300732-1-gality369@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260427072650.300732-1-gality369@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/27/26 09:26, ZhengYuan Huang wrote:

> [You don't often get email from gality369@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [BUG]
> KASAN reports a slab-use-after-free during getdents(2):
>
> BUG: KASAN: slab-use-after-free in ntfs_read_mft fs/ntfs3/inode.c:79 [inline]
> BUG: KASAN: slab-use-after-free in ntfs_iget5+0x59b/0x3450 fs/ntfs3/inode.c:541
> Read of size 2 at addr ffff88800b7a5a4e by task syz.0.1061/2354
>
> Call Trace:
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0xbe/0x130 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:378 [inline]
>   print_report+0xd1/0x650 mm/kasan/report.c:482
>   kasan_report+0xfb/0x140 mm/kasan/report.c:595
>   __asan_report_load2_noabort+0x14/0x30 mm/kasan/report_generic.c:379
>   ntfs_read_mft fs/ntfs3/inode.c:79 [inline]
>   ntfs_iget5+0x59b/0x3450 fs/ntfs3/inode.c:541
>   ntfs_dir_emit fs/ntfs3/dir.c:337 [inline]
>   ntfs_read_hdr+0x714/0x930 fs/ntfs3/dir.c:385
>   ntfs_readdir+0xaad/0x1010 fs/ntfs3/dir.c:458
>   iterate_dir+0x276/0x9e0 fs/readdir.c:108
>   __do_sys_getdents fs/readdir.c:326 [inline]
>   __se_sys_getdents fs/readdir.c:312 [inline]
>   __x64_sys_getdents+0x143/0x290 fs/readdir.c:312
>   ...
>
> Allocated by task 2160:
>   kasan_save_stack+0x39/0x70 mm/kasan/common.c:56
>   kasan_save_track+0x14/0x40 mm/kasan/common.c:77
>   kasan_save_alloc_info+0x37/0x60 mm/kasan/generic.c:573
>   poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
>   __kasan_kmalloc+0xc3/0xd0 mm/kasan/common.c:417
>   kasan_kmalloc include/linux/kasan.h:262 [inline]
>   __do_kmalloc_node mm/slub.c:5650 [inline]
>   __kmalloc_noprof+0x2bd/0x900 mm/slub.c:5662
>   kmalloc_noprof include/linux/slab.h:961 [inline]
>   mi_init+0x9d/0x110 fs/ntfs3/record.c:105
>   mi_format_new+0x6b/0x500 fs/ntfs3/record.c:422
>   ni_add_subrecord+0x129/0x540 fs/ntfs3/frecord.c:321
>   ntfs_look_free_mft+0x238/0xd90 fs/ntfs3/fsntfs.c:715
>   ni_create_attr_list+0x8e6/0x1690 fs/ntfs3/frecord.c:826
>   ni_ins_attr_ext+0x5ec/0x9d0 fs/ntfs3/frecord.c:924
>   ni_insert_attr+0x2bf/0x830 fs/ntfs3/frecord.c:1091
>   ni_insert_resident+0xec/0x3d0 fs/ntfs3/frecord.c:1475
>   ni_add_name+0x4b2/0x8a0 fs/ntfs3/frecord.c:2987
>   ni_rename+0xa6/0x160 fs/ntfs3/frecord.c:3026
>   ntfs_rename+0xa19/0xe00 fs/ntfs3/namei.c:332
>   vfs_rename+0xd42/0x1d50 fs/namei.c:5216
>   do_renameat2+0x715/0xb60 fs/namei.c:5364
>   __do_sys_rename fs/namei.c:5411 [inline]
>   __se_sys_rename fs/namei.c:5409 [inline]
>   __x64_sys_rename+0x83/0xb0 fs/namei.c:5409
>   x64_sys_call+0x8c4/0x26a0 arch/x86/include/generated/asm/syscalls_64.h:83
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0x93/0xf80 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Freed by task 85:
>   kasan_save_stack+0x39/0x70 mm/kasan/common.c:56
>   kasan_save_track+0x14/0x40 mm/kasan/common.c:77
>   __kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:587
>   kasan_save_free_info mm/kasan/kasan.h:406 [inline]
>   poison_slab_object mm/kasan/common.c:252 [inline]
>   __kasan_slab_free+0x6f/0xa0 mm/kasan/common.c:284
>   kasan_slab_free include/linux/kasan.h:234 [inline]
>   slab_free_hook mm/slub.c:2543 [inline]
>   slab_free mm/slub.c:6642 [inline]
>   kfree+0x2bf/0x6b0 mm/slub.c:6849
>   mi_clear fs/ntfs3/ntfs_fs.h:1107 [inline]
>   mi_put+0x10e/0x1a0 fs/ntfs3/record.c:97
>   ni_write_inode+0x479/0x2a00 fs/ntfs3/frecord.c:3320
>   ntfs3_write_inode+0x51/0x70 fs/ntfs3/inode.c:1042
>   write_inode fs/fs-writeback.c:1564 [inline]
>   __writeback_single_inode+0x8c9/0xc30 fs/fs-writeback.c:1784
>   writeback_sb_inodes+0x5e6/0xf60 fs/fs-writeback.c:2015
>   __writeback_inodes_wb+0x10c/0x2d0 fs/fs-writeback.c:2086
>   wb_writeback+0x63f/0x900 fs/fs-writeback.c:2197
>   wb_check_old_data_flush fs/fs-writeback.c:2301 [inline]
>   wb_do_writeback fs/fs-writeback.c:2354 [inline]
>   wb_workfn+0x8cc/0xd60 fs/fs-writeback.c:2382
>   process_one_work+0x8e0/0x1980 kernel/workqueue.c:3263
>   process_scheduled_works kernel/workqueue.c:3346 [inline]
>   worker_thread+0x683/0xf80 kernel/workqueue.c:3427
>   kthread+0x3f0/0x850 kernel/kthread.c:463
>   ret_from_fork+0x50f/0x610 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> The faulting address sits 590 bytes inside a freed kmalloc-1k object
> allocated by ni_add_subrecord() and freed from ni_write_inode()
> writeback.
>
> [CAUSE]
> ntfs_readdir() loads all subrecords once, but then drops ni_lock()
> before it starts walking the directory metadata through ntfs_read_hdr().
> That leaves the current NTFS_DE pointer backed by parent-directory
> subrecord memory that concurrent writeback is still allowed to compact
> and free.
>
> The later ntfs_dir_emit() -> ntfs_iget5() call exposes the stale e->ref,
> but the lifetime bug starts earlier: readdir is still consuming
> parent-directory metadata after releasing the lock that protects it.
>
> [FIX]
> Keep ni_lock() held from the point where ntfs_readdir() starts
> consuming the directory metadata until the walk over root/index entries
> is finished.
>
> This closes the parent-directory lifetime hole directly and keeps the
> existing readdir d_type behaviour unchanged.
>
> Signed-off-by: ZhengYuan Huang <gality369@gmail.com>
> ---
>   fs/ntfs3/dir.c | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
> index d99ab086ef6f..a052ba9250e7 100644
> --- a/fs/ntfs3/dir.c
> +++ b/fs/ntfs3/dir.c
> @@ -489,10 +489,17 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>                          goto out;
>          }
>
> +       /*
> +        * Keep directory metadata stable for the whole walk. Loading subrecords
> +        * once is not enough if concurrent writeback can still compact ATTR_LIST
> +        * entries and free the record that ntfs_read_hdr() is currently walking.
> +        */
> +       ni_lock(ni);
> +
>          root = indx_get_root(&ni->dir, ni, NULL, NULL);
>          if (!root) {
>                  err = -EINVAL;
> -               goto out;
> +               goto out_unlock;
>          }
>
>          if (pos >= sbi->record_size) {
> @@ -503,7 +510,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>                   */
>                  err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
>                  if (err)
> -                       goto out;
> +                       goto out_unlock;
>                  bit = 0;
>          }
>
> @@ -514,7 +521,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>                  /* Get the next used index. */
>                  err = indx_used_bit(&ni->dir, ni, &bit);
>                  if (err)
> -                       goto out;
> +                       goto out_unlock;
>
>                  if (bit == MINUS_ONE_T) {
>                          /* no more used indexes. end of dir. */
> @@ -524,13 +531,13 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>                  if (bit >= max_bit) {
>                          /* Corrupted directory. */
>                          err = -EINVAL;
> -                       goto out;
> +                       goto out_unlock;
>                  }
>
>                  err = indx_read_ra(&ni->dir, ni, bit << ni->dir.idx2vbn_bits,
>                                     &node, &file->f_ra);
>                  if (err)
> -                       goto out;
> +                       goto out_unlock;
>
>                  /*
>                   * Add each name from index in 'ctx'.
> @@ -539,9 +546,12 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>                                      ((u64)bit << index_bits) + sbi->record_size,
>                                      pos, name, ctx);
>                  if (err)
> -                       goto out;
> +                       goto out_unlock;
>          }
>
> +out_unlock:
> +       ni_unlock(ni);
> +
>   out:
>          kfree(name);
>          put_indx_node(node);
> --
> 2.49.0

Hello,

Sorry for the delay.
Your patch was applied, thank you.

Regards,
Konstantin

