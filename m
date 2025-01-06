Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADF01D90C5
	for <ntfs3@lists.linux.dev>; Mon,  6 Jan 2025 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154104; cv=none; b=FWL7+LsSgBv/EpIgLXimqX7IJDq4naRWQT/YhVXXcds8Sr2vg1hGYK6yZWZ35IkMFaEcy5kHnN12lxdAXJlcJL3XbjH9Lb5CeZRixEeE6EqslIWrQTjtHNy5EvwzmYJAzA7aBqlI04w3IAWQEIqwYUAOTOddDddp9T346kKEsj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154104; c=relaxed/simple;
	bh=e8woTBMf/zpSD+oKnDsGvvOLBtz/6Tq2TX0pF5KpdvI=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=CytoDmCSP2y5piohxVmqnqY/BUX2yNjU7z6x2UyRKfMjwQ7UvSw6O3gw6ECb9U8sfxDqrWM4AkNZfR3gCOflp2vtni6p6tEjn66NSyH28ge3UxVxyB4vYEF1DRGlancuAc0K7wy+dpY7vZablN/5StO0vhRdJjJbjhAU0Azpe0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=OssmNYwl; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="OssmNYwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1736154091;
	bh=1lQfp/sOsm4x/rMjz6EQVABNKAPJoVSv/aBdCESvs/g=;
	h=From:Mime-Version:Subject:Message-Id:Date:To;
	b=OssmNYwlyi6dXnCR/Bepax+0mvghsLSKhtiKpgdo8NKjKkzbusFdGUobYcPHrACbK
	 vmm8SU/qk/8Tp4mrlRBgQZgh6x9rZj/3wiR+j9D4mJj+2h84dcVPR7t/WYKB85jaoq
	 fSlJ17OIXd/EHYKT20Bfli2B17DgDS2ApjHFJH44=
X-QQ-mid: bizesmtp79t1736154089tjyhzbzk
X-QQ-Originating-IP: X6e8NZ97SjPnnw7WO/dvuIESk9bSdejJ7k9wFDOI5u8=
Received: from smtpclient.apple ( [202.120.235.227])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Jan 2025 17:01:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4142976190807284637
From: Kun Hu <huk23@m.fudan.edu.cn>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Bug: Invalid Input Handling in ntfs_get_block_vbo Causes Warning
Message-Id: <468BA2C7-4675-4FB9-822E-BF49E8E8F197@m.fudan.edu.cn>
Date: Mon, 6 Jan 2025 17:01:17 +0800
Cc: ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
To: almaz.alexandrovich@paragon-software.com
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MiPTq5wGoKOmFmW9wYQZSK8xn3E82S/tmJS+lNTvem8QEO2+6y/h8zFm
	yHoKtBJVL5dG0j5LrsKuLyFNyNMm3ja7f0YETwcoSM2SSKu71URgy2M0sa7+vteR9Sj1BcX
	VVompd6SApvIO6s+gJ0jl5KcJJN4ByRJ1zXtIfUd2kA/L1NJkBFlD/LqtWUlYv6WKO++kl2
	VkLCDptQ5+I5G6OtJOyLM2JfqLOiJTMenAW0p3VIawwz1yeUlvu1oOvPCsA3NZh7DQPHSFz
	XVel0Crx1Q5k8it+bpRRrgRiw2SS/PZSkF3K7eedIEWMOYNmmV5EaBPNbuardYtqGhcH+Rj
	BwOjTminfsVKTb6+zJ0iG6iuswlJQo2Zycnh9dveZo0smeYGUICBasuwmneWX1PehDEqodV
	zJzsUxjanDCNOnsqw6y3WWKvyBC/h8rPo6EVP4Q9FzRC0WJ/40KpWJ9wKB+2S8N0Bg633dF
	nOmVykhZjSEQ6lszdotD/nqYlyJDleOA0GEZOIdlHBbjkt8ZqSb97sv65S4OCFEVv61AoIN
	L/bbqlGwhA+qgN7TZIQbiYt6Tcxj1Hka/ivct8qVuKa0rNvNvSMf7rH4hjPiNpYS5eCJZkH
	/8uR+KgAokd4vAIJ8JbVT6NgLtMj/JvQgpr0Q4TUeBgxI8N6/CcBAbRYTbeKGiAZicdlodQ
	c07LhK0Gtgj8pSpX93rR7sMBmC7YvaSW5aH1mCU4V/9326qsZ/pkdgCRUylIdzruUyZfrmG
	6dC0hxiBdWLFD4nBqVG4fXK658jGJ9yiRmRruRkCe2KRmvuaeHLmOVPmTl7Lw8cXrhUxvru
	Mpao+zV8bVgnclPkBdnKO9bNCH4SxMkdvJLBmlgZTZvfRggahunc+mOTdUJ0srvM4/J/uPC
	gL9GBL5+6YW1OzdGKN+2Ete/BUF3RG+kaATpHXs2SFzkugopZRB9UvrIBX3IKeuqu3jM4oH
	DaYK8UduudgcgJJ51FKPw5HUWfny2zdVdTGY=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Hello,

When using our customized fuzzer tool to fuzz the latest Linux kernel, =
the following issue
was triggered.

HEAD commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
git tree: upstream
Console output: =
https://drive.google.com/file/d/12lk8-oiUpEIFaIaEiWLCDySysQhGGzAb/view?usp=
=3Dsharing
Kernel config: =
https://drive.google.com/file/d/1n2sLNg-YcIgZqhhQqyMPTDWM_N1Pqz73/view?usp=
=3Dsharing
C reproducer: =
https://drive.google.com/file/d/12olymggtarPukCm_JXl9ah2dSMWJb831/view?usp=
=3Dsharing
Syzlang reproducer: =
https://drive.google.com/file/d/1gBjsTeUPl9UHiJfxn5KXEQF70GUddhux/view?usp=
=3Dsharing


If you fix this issue, please add the following tag to the commit:
Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin =
<jjtan24@m.fudan.edu.cn>

WARNING: CPU: 1 PID: 38 at fs/ntfs3/inode.c:619 =
ntfs_get_block_vbo+0x346/0xf50 fs/ntfs3/inode.c:619
Modules linked in:
CPU: 1 UID: 0 PID: 38 Comm: kworker/u18:0 Not tainted 6.13.0-rc5 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.13.0-1ubuntu1.1 04/01/2014
Workqueue: writeback wb_workfn (flush-7:0)
RIP: 0010:ntfs_get_block_vbo+0x346/0xf50 fs/ntfs3/inode.c:619
Code: 07 e9 fe 4d 39 ef 72 25 e8 c7 05 e9 fe 44 8b 2c 24 31 ff 44 89 ee =
e8 e9 07 e9 fe 45 85 ed 0f 84 d6 03 00 00 e8 ab 05 e9 fe 90 <0f> 0b 90 =
e8 a2 05 e9 fe 44 0f b6 6c 24 70 31 ff 44 89 ee e8 62 07
RSP: 0018:ffa00000002b7070 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffa00000002b7268 RCX: ffffffff98a09a87
RDX: 0000000000000001 RSI: ff11000001df2340 RDI: 0000000000000002
RBP: ff1100001601f650 R08: 0000000000000000 R09: fff3fc0000056db5
R10: fff3fc0000056db4 R11: ffa00000002b6da7 R12: ff11000010e8c000
R13: 0000000000000001 R14: 000000000000000a R15: 00000000fffffffd
FS:  0000000000000000(0000) GS:ff1100006a280000(0000) =
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6093bdfe00 CR3: 0000000008df6004 CR4: 0000000000771ef0
PKRU: 55555554
Call Trace:
 <TASK>
 __mpage_writepage+0x952/0x1970 fs/mpage.c:543
 write_cache_pages+0xa6/0x120 mm/page-writeback.c:2659
 mpage_writepages+0xc1/0x170 fs/mpage.c:666
 ntfs_writepages+0x122/0x1a0 fs/ntfs3/inode.c:898
 do_writepages+0x19d/0x7d0 mm/page-writeback.c:2702
 __writeback_single_inode+0x135/0x1010 fs/fs-writeback.c:1680
 writeback_sb_inodes+0x5ee/0xf00 fs/fs-writeback.c:1976
 __writeback_inodes_wb+0xbe/0x270 fs/fs-writeback.c:2047
 wb_writeback+0x72f/0xb50 fs/fs-writeback.c:2158
 wb_check_background_flush fs/fs-writeback.c:2228 [inline]
 wb_do_writeback fs/fs-writeback.c:2316 [inline]
 wb_workfn+0x8b8/0xe10 fs/fs-writeback.c:2343
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0x5ee/0x1ba0 kernel/workqueue.c:3310
 worker_thread+0x59f/0xcf0 kernel/workqueue.c:3391
 kthread+0x345/0x450 kernel/kthread.c:389
 ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
irq event stamp: 13825
hardirqs last  enabled at (13847): [<ffffffff9769dc8e>] =
__up_console_sem+0xae/0xc0 kernel/printk/printk.c:344
hardirqs last disabled at (13860): [<ffffffff9769dc73>] =
__up_console_sem+0x93/0xc0 kernel/printk/printk.c:342
softirqs last  enabled at (13842): [<ffffffff9750f554>] =
softirq_handle_end kernel/softirq.c:407 [inline]
softirqs last  enabled at (13842): [<ffffffff9750f554>] =
handle_softirqs+0x544/0x870 kernel/softirq.c:589
softirqs last disabled at (13881): [<ffffffff9751120e>] __do_softirq =
kernel/softirq.c:595 [inline]
softirqs last disabled at (13881): [<ffffffff9751120e>] invoke_softirq =
kernel/softirq.c:435 [inline]
softirqs last disabled at (13881): [<ffffffff9751120e>] __irq_exit_rcu =
kernel/softirq.c:662 [inline]
softirqs last disabled at (13881): [<ffffffff9751120e>] =
irq_exit_rcu+0xee/0x140 kernel/softirq.c:678
---[ end trace 0000000000000000 ]---


---------------
thanks,
Kun Hu=
