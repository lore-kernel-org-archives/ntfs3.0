Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99311FECB1
	for <ntfs3@lists.linux.dev>; Fri, 10 Jan 2025 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736501526; cv=none; b=j4rt3rUafXrW3x0swlDo09Y6a0XAf6RypfwR6wuEStQH+BmM9DQtLq5UwKLD+ux9coa21gojAbkCDg6tu1t/FUFiBzm6EOHkbAYJ5SRqJzP+eYfF7GMwdyEpwJhWMe38pRLicgtT1uPQE3QV9gG/s4JY4pv9/tjRlg44g1YMerA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736501526; c=relaxed/simple;
	bh=L2OzW5xNT3gJN6P85oYcjmUN2Tx2Jj3/1kRY2ewsOZ0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iDPLEY24xPn6C4k5//N8Gg9I138/lVylwf/BPuAbVv7dXM/nHw94Of9l+SdaCefYe5DtHhXcYEQb4QktvuukFmtQ3Z9QaFFnaKTedLxTmriRD80pvbyyAt+ixTySLYtOjovoC2K8Fgb4cwOhzlqeVqULxWiQ3+tNAvIJtqlHmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=mVW0aq1e; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="mVW0aq1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1736501520;
	bh=g4ptG/VQa5t42ikJkzjem2UNRfVqzKfPPAjQwdiZiSg=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=mVW0aq1eKk5dEoo7O43fOEncX/JsLYvHfLM1GyZ3YX+IMe7jwWWCFTp/X6J1XXvxI
	 YsMvO34WLi3zRPpdlVgKpYxi4oFsQqFjmPtkH38zbXUIaC3NBRS9kBKrE6TOl+Z1a5
	 +NH0tYacQuAIa9w10Ao58oDzbVrLWMOJU/zGDhqY=
X-QQ-mid: bizesmtpip3t1736501519tsc7ae2
X-QQ-Originating-IP: yz7MsT7Qrvsnme8LsEdHc3zv56OmMwQ4nsyGKSR0/YM=
Received: from smtpclient.apple ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Jan 2025 17:31:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15648866478163103929
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: Bug: Invalid Input Handling in ntfs_get_block_vbo Causes Warning
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <468BA2C7-4675-4FB9-822E-BF49E8E8F197@m.fudan.edu.cn>
Date: Fri, 10 Jan 2025 17:31:47 +0800
Cc: ntfs3@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1FFB9A88-637C-47F3-B007-8BBB9D55EC03@m.fudan.edu.cn>
References: <468BA2C7-4675-4FB9-822E-BF49E8E8F197@m.fudan.edu.cn>
To: almaz.alexandrovich@paragon-software.com
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OfLSn26BfcxeDtT3Pv0zCT5OxQDX3dWUnTtN3QjUqcEWGf85yBp59Lv1
	L9rb2Jzf20MLQtUn9krhQpZzxU6VcFT4gUMgK9mk5pK364Qjm8e/pCTz74o4stGfIxxb3vl
	6WkaUJFMuWjH4mdtW3/y92IkkNGXXaee+9Yv+KccdDeBGHXFcgVFKIbvQNhmd0Ja3eeecTK
	9IkIvvCcrCjdE2qPzPNOnNC+hFkg4C41xGv5Ig5XENePQk3ij7UhHRFkPI8dmH1p1dsGA9a
	OIroOUdp1acrOm6nJoApU/aY25W9z2rRs0qhUdQdT9/WdOkDUWAKOnLO9ougz8AwDa6+VxU
	FHEz8HqO4n28+1IW5t+nBcfg6VVtuZbjnkaMfMunU7eV6GJRfBHgvJbDwXEVww+mgvzH1WI
	DrXjd3fVlONFshGeNGj8tkhECRpJAPn4n3xPGuWyciMyYngQfRXKmdsI1Cg6kuAJeGUb6zV
	SLknw3QCxVGO8c+tsv4hn9B1dJK9yMtQflBn28HU8gnB3+fBH7jOwzangMPnSXroyVnM5Ak
	nr47Mj2hyzFfTCr9ryrecPNNCDYGWDa56y8C82PcGHp7f8/+KziIhSyRYwktsZ/d51nxNI6
	X/HD7EC1I+ZA5R+DTVncddwgd49JUctmwBqorUchOlk0k6J0d7jRyaTO5ainTQtxE++F9u6
	p5ksmUatlXw66C4wPOQ1PFsoTQdJjPeq1sMAWsDpDmODFWRdGzNZkd2XsYjgd4dGLF8hEzc
	IdYz5HDc5Ydx5PLhNitkvtuOOwcpAxfdq6vpfMLXO2NB3R+T5e4DJTvjxmg5HBm9GSEivaY
	DwxnnwBrfPlcLxWPgaYV6VOS+avAP/mQSKzqZuLaChkB6LUD2tXGNtbKE8DJ81jaDKXIbRB
	HpFX6KD4jZs6bfwePfGBpkW1MarQdGq7J5MU4uLDSY8kD6VbNvR5axpLnmaozpl2pWgLw8S
	d2CQ4kGnY3hdCbxOqelZ9rQ8QwPHtr01NBiiLNTsneRyUPA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0



> 2025=E5=B9=B41=E6=9C=886=E6=97=A5 17:01=EF=BC=8CKun Hu =
<huk23@m.fudan.edu.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hello,
>=20
> When using our customized fuzzer tool to fuzz the latest Linux kernel, =
the following issue
> was triggered.
>=20
> HEAD commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
> git tree: upstream
> Console output: =
https://drive.google.com/file/d/12lk8-oiUpEIFaIaEiWLCDySysQhGGzAb/view?usp=
=3Dsharing
> Kernel config: =
https://drive.google.com/file/d/1n2sLNg-YcIgZqhhQqyMPTDWM_N1Pqz73/view?usp=
=3Dsharing
> C reproducer: =
https://drive.google.com/file/d/12olymggtarPukCm_JXl9ah2dSMWJb831/view?usp=
=3Dsharing
> Syzlang reproducer: =
https://drive.google.com/file/d/1gBjsTeUPl9UHiJfxn5KXEQF70GUddhux/view?usp=
=3Dsharing
>=20
>=20
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin =
<jjtan24@m.fudan.edu.cn>
>=20
> WARNING: CPU: 1 PID: 38 at fs/ntfs3/inode.c:619 =
ntfs_get_block_vbo+0x346/0xf50 fs/ntfs3/inode.c:619
> Modules linked in:
> CPU: 1 UID: 0 PID: 38 Comm: kworker/u18:0 Not tainted 6.13.0-rc5 #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.13.0-1ubuntu1.1 04/01/2014
> Workqueue: writeback wb_workfn (flush-7:0)
> RIP: 0010:ntfs_get_block_vbo+0x346/0xf50 fs/ntfs3/inode.c:619
> Code: 07 e9 fe 4d 39 ef 72 25 e8 c7 05 e9 fe 44 8b 2c 24 31 ff 44 89 =
ee e8 e9 07 e9 fe 45 85 ed 0f 84 d6 03 00 00 e8 ab 05 e9 fe 90 <0f> 0b =
90 e8 a2 05 e9 fe 44 0f b6 6c 24 70 31 ff 44 89 ee e8 62 07
> RSP: 0018:ffa00000002b7070 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffa00000002b7268 RCX: ffffffff98a09a87
> RDX: 0000000000000001 RSI: ff11000001df2340 RDI: 0000000000000002
> RBP: ff1100001601f650 R08: 0000000000000000 R09: fff3fc0000056db5
> R10: fff3fc0000056db4 R11: ffa00000002b6da7 R12: ff11000010e8c000
> R13: 0000000000000001 R14: 000000000000000a R15: 00000000fffffffd
> FS:  0000000000000000(0000) GS:ff1100006a280000(0000) =
knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f6093bdfe00 CR3: 0000000008df6004 CR4: 0000000000771ef0
> PKRU: 55555554
> Call Trace:
> <TASK>
> __mpage_writepage+0x952/0x1970 fs/mpage.c:543
> write_cache_pages+0xa6/0x120 mm/page-writeback.c:2659
> mpage_writepages+0xc1/0x170 fs/mpage.c:666
> ntfs_writepages+0x122/0x1a0 fs/ntfs3/inode.c:898
> do_writepages+0x19d/0x7d0 mm/page-writeback.c:2702
> __writeback_single_inode+0x135/0x1010 fs/fs-writeback.c:1680
> writeback_sb_inodes+0x5ee/0xf00 fs/fs-writeback.c:1976
> __writeback_inodes_wb+0xbe/0x270 fs/fs-writeback.c:2047
> wb_writeback+0x72f/0xb50 fs/fs-writeback.c:2158
> wb_check_background_flush fs/fs-writeback.c:2228 [inline]
> wb_do_writeback fs/fs-writeback.c:2316 [inline]
> wb_workfn+0x8b8/0xe10 fs/fs-writeback.c:2343
> process_one_work kernel/workqueue.c:3229 [inline]
> process_scheduled_works+0x5ee/0x1ba0 kernel/workqueue.c:3310
> worker_thread+0x59f/0xcf0 kernel/workqueue.c:3391
> kthread+0x345/0x450 kernel/kthread.c:389
> ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
> ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> </TASK>
> irq event stamp: 13825
> hardirqs last  enabled at (13847): [<ffffffff9769dc8e>] =
__up_console_sem+0xae/0xc0 kernel/printk/printk.c:344
> hardirqs last disabled at (13860): [<ffffffff9769dc73>] =
__up_console_sem+0x93/0xc0 kernel/printk/printk.c:342
> softirqs last  enabled at (13842): [<ffffffff9750f554>] =
softirq_handle_end kernel/softirq.c:407 [inline]
> softirqs last  enabled at (13842): [<ffffffff9750f554>] =
handle_softirqs+0x544/0x870 kernel/softirq.c:589
> softirqs last disabled at (13881): [<ffffffff9751120e>] __do_softirq =
kernel/softirq.c:595 [inline]
> softirqs last disabled at (13881): [<ffffffff9751120e>] invoke_softirq =
kernel/softirq.c:435 [inline]
> softirqs last disabled at (13881): [<ffffffff9751120e>] __irq_exit_rcu =
kernel/softirq.c:662 [inline]
> softirqs last disabled at (13881): [<ffffffff9751120e>] =
irq_exit_rcu+0xee/0x140 kernel/softirq.c:678
> ---[ end trace 0000000000000000 ]---
>=20
>=20
> ---------------
> thanks,
> Kun Hu


Hi  Konstantin,

I=E2=80=99m not sure if this is sufficient to help locate the bug? If =
you need additional information, please let me know.

Thanks,
Kun Hu

