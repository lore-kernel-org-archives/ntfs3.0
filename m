Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FAA2F21
	for <ntfs3@lists.linux.dev>; Wed,  2 Feb 2022 22:52:00 +0000 (UTC)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rjp.ie; s=key1;
	t=1643841990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ym57gwtinGAeXQeN5EneRQSMvHaGjfDYtqoatbtUZ6Q=;
	b=IeOO7kP3lOwV0jb5iKO4KJ6r2Pwu0LIccXKuPaDPnh97vXVAk6qEDDhMytoqCnshyDkhFE
	6hhtJ0+KpcFLgVujRQnzW6N72HdX0HpMiR7tHYFF7IwZqyFzN6vcX2eipo/mdrdbm8Spo/
	+ELVVZQDnl3E+d9bfb2JKE6actLIEEU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Feb 2022 15:46:27 -0700
Message-Id: <CHLXCNVSULCF.76JU3S42R5UT@rxps>
Subject: Panic on shutdown in ntfs_put_super
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ronan Pigott" <ronan@rjp.ie>
To: <ntfs3@lists.linux.dev>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: rjp.ie

Dear maintainers,

I have a reproducible panic on shutdown in the ntfs3 module. It happens
when I shutdown while I have an ntfs file system mounted, but does not
happen if I manually umount the partition before poweroff. I recovered
the following stack trace from a picture I took of my screen:

	R13: ffffffffc0775c3d R14: ffff990700042200 R15: 00[...]
	FS:  00007f5eed0f0a40(0000) GS:ffff990a6e50000(0000)
	CS:  0010 DS: 0000 ES: 0000 CR0: 000000000000033
	CR2: 00007f5eeda906cb CR3: 00000001037a6001 CR4: 00[...]
	Call Trace:
	 <TASK>
	 ntfs_put_super+0x2d/0x70 [ntfs3 49778e649db467d967[...]
	 generic_shutdown_super+0x71/0x120
	 kill_block_super+0x21/0x50
	 deactivate_locked_super+0x33/0xa0
	 cleanup_mnt+0x131/0x190
	 task_work_run+0x59/0x90
	 exit_to_user_mode_prepare+0x17e/0x180
	 syscll_exit_to_user_mode+0x23/0x50
	 do_syscall_64+0x69/0x90
	 ? do_user_addr_fault+0x1d7/0x6a0
	 ? exc_page_fault+0x72/0x180
	 entry_SYSCALL_64_after_hwframe+0x44/0xae
	RIP: 0033:0x7f5eedb2161b
	Code: 18 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 90 f[...]
	[...]
	</TASK>

The ellipsized portions are outside the image frame. My kernel version
was 5.16.3-arch1-1, but it has been reproducible as long as I have used
the ntfs3 module.

When built with debug symbols, I get the following (truncated) output
from objdump:

	$ objdump -j.text --disassemble=3Dntfs_put_super -S fs/ntfs3/ntfs3.ko
	Disassembly of section .text:
	static void ntfs_put_super(struct super_block *sb)
	{
	   29c10:	e8 00 00 00 00       	call   29c15 <ntfs_put_super+0x5>
	   29c15:	41 54                	push   %r12
		struct ntfs_sb_info *sbi =3D sb->s_fs_info;

		/* Mark rw ntfs as clear, if possible. */
		ntfs_set_state(sbi, NTFS_DIRTY_CLEAR);
	   29c17:	31 f6                	xor    %esi,%esi
	{
	   29c19:	55                   	push   %rbp
	   29c1a:	53                   	push   %rbx
		struct ntfs_sb_info *sbi =3D sb->s_fs_info;
	   29c1b:	48 8b af 98 03 00 00 	mov    0x398(%rdi),%rbp
	{
	   29c22:	48 89 fb             	mov    %rdi,%rbx
		ntfs_set_state(sbi, NTFS_DIRTY_CLEAR);
	   29c25:	48 89 ef             	mov    %rbp,%rdi
	   29c28:	e8 00 00 00 00       	call   29c2d <ntfs_put_super+0x1d>

		put_mount_options(sbi->options);
	   29c2d:	4c 8b a5 f8 04 00 00 	mov    0x4f8(%rbp),%r12
		kfree(options->nls_name);
	   29c34:	49 8b 3c 24          	mov    (%r12),%rdi
	   29c38:	e8 00 00 00 00       	call   29c3d <ntfs_put_super+0x2d>
		unload_nls(options->nls);
	   29c3d:	49 8b 7c 24 08       	mov    0x8(%r12),%rdi // CRASH HERE
	   [...]

The last line is the ntfs_put_super+0x2d intsruction from the stack trace.

So it appears that options->nls_name does not crash, but options->nls
does? I'm not sure how to investigate further, so I'm mailing this list.

Thanks,
Ronan
