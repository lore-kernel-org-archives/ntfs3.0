Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FB1191F8C
	for <ntfs3@lists.linux.dev>; Mon, 20 Jan 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360823; cv=none; b=oXhK+fNUee17iW0lVthk8nU+GlR/6C1EuY5vAX3apVVPsOOWRfKzAknCHfSW3PfKVsEeKKeRx2qKgCGO0a5n4y8+Eucn33CxFZ3+6lY0qK5z8BTZOySplais6KNKJ2Ab5TYvAyDGYTWDhfLfWzJHkdE1R3CaIvieCZyUaAOK+SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360823; c=relaxed/simple;
	bh=pH78syBE8mooqnrk6hk+WfcIcj2pS5u8yw8JM5WndTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KX9K6/S7HW01Oo2PO2cvvEYgHrdmRkgj14ryXE3sbdHUNMsws7+dw/4zjnlSZ7NVLHUcF8yFfbvavE9NzCBFlAmuhXBBReFsjAgqEwBaHflOjkg8rspUeKSOkXMQJ0gY/14/zhpeobMOBXLy/RKPv00vUWdEEYjkISJm3G7Ko3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=gASElT5f; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="gASElT5f"
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 2517B402;
	Mon, 20 Jan 2025 08:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1737360221;
	bh=8CheL+XzNZE3yG/laCtFUECkAhz1yf2k0aTFVzSUaro=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gASElT5fZQRgYpV06B17QCsPHOAlOv0IMNXFo/xpYs0Ze/R+KckVZCY6uzF7GmLKG
	 PyHTmqF/qDUFy96Gro6Mdp8m3QpKiKSq54DcFqz86UP36OxQmXCjsh0fhX4c9x5DPb
	 dIbdpNPOPht2N8G++vWsGyBcCoKBVlo2UdoslH+4=
Received: from [192.168.211.71] (192.168.211.71) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 20 Jan 2025 11:04:29 +0300
Message-ID: <7ed250ad-0177-4cfc-98c6-d236c6d6415d@paragon-software.com>
Date: Mon, 20 Jan 2025 11:04:29 +0300
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug: Invalid Input Handling in ntfs_get_block_vbo Causes Warning
To: Kun Hu <huk23@m.fudan.edu.cn>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	"jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
References: <468BA2C7-4675-4FB9-822E-BF49E8E8F197@m.fudan.edu.cn>
 <1FFB9A88-637C-47F3-B007-8BBB9D55EC03@m.fudan.edu.cn>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <1FFB9A88-637C-47F3-B007-8BBB9D55EC03@m.fudan.edu.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 10.01.2025 12:31, Kun Hu wrote:
>> 2025年1月6日 17:01，Kun Hu <huk23@m.fudan.edu.cn> 写道：
>>
>> Hello,
>>
>> When using our customized fuzzer tool to fuzz the latest Linux kernel, the following issue
>> was triggered.
>>
>> HEAD commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
>> git tree: upstream
>> Console output: https://drive.google.com/file/d/12lk8-oiUpEIFaIaEiWLCDySysQhGGzAb/view?usp=sharing
>> Kernel config: https://drive.google.com/file/d/1n2sLNg-YcIgZqhhQqyMPTDWM_N1Pqz73/view?usp=sharing
>> C reproducer: https://drive.google.com/file/d/12olymggtarPukCm_JXl9ah2dSMWJb831/view?usp=sharing
>> Syzlang reproducer: https://drive.google.com/file/d/1gBjsTeUPl9UHiJfxn5KXEQF70GUddhux/view?usp=sharing
>>
>>
>> If you fix this issue, please add the following tag to the commit:
>> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>
>>
>> WARNING: CPU: 1 PID: 38 at fs/ntfs3/inode.c:619 ntfs_get_block_vbo+0x346/0xf50 fs/ntfs3/inode.c:619
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 38 Comm: kworker/u18:0 Not tainted 6.13.0-rc5 #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
>> Workqueue: writeback wb_workfn (flush-7:0)
>> RIP: 0010:ntfs_get_block_vbo+0x346/0xf50 fs/ntfs3/inode.c:619
>> Code: 07 e9 fe 4d 39 ef 72 25 e8 c7 05 e9 fe 44 8b 2c 24 31 ff 44 89 ee e8 e9 07 e9 fe 45 85 ed 0f 84 d6 03 00 00 e8 ab 05 e9 fe 90 <0f> 0b 90 e8 a2 05 e9 fe 44 0f b6 6c 24 70 31 ff 44 89 ee e8 62 07
>> RSP: 0018:ffa00000002b7070 EFLAGS: 00010246
>> RAX: 0000000000000000 RBX: ffa00000002b7268 RCX: ffffffff98a09a87
>> RDX: 0000000000000001 RSI: ff11000001df2340 RDI: 0000000000000002
>> RBP: ff1100001601f650 R08: 0000000000000000 R09: fff3fc0000056db5
>> R10: fff3fc0000056db4 R11: ffa00000002b6da7 R12: ff11000010e8c000
>> R13: 0000000000000001 R14: 000000000000000a R15: 00000000fffffffd
>> FS:  0000000000000000(0000) GS:ff1100006a280000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f6093bdfe00 CR3: 0000000008df6004 CR4: 0000000000771ef0
>> PKRU: 55555554
>> Call Trace:
>> <TASK>
>> __mpage_writepage+0x952/0x1970 fs/mpage.c:543
>> write_cache_pages+0xa6/0x120 mm/page-writeback.c:2659
>> mpage_writepages+0xc1/0x170 fs/mpage.c:666
>> ntfs_writepages+0x122/0x1a0 fs/ntfs3/inode.c:898
>> do_writepages+0x19d/0x7d0 mm/page-writeback.c:2702
>> __writeback_single_inode+0x135/0x1010 fs/fs-writeback.c:1680
>> writeback_sb_inodes+0x5ee/0xf00 fs/fs-writeback.c:1976
>> __writeback_inodes_wb+0xbe/0x270 fs/fs-writeback.c:2047
>> wb_writeback+0x72f/0xb50 fs/fs-writeback.c:2158
>> wb_check_background_flush fs/fs-writeback.c:2228 [inline]
>> wb_do_writeback fs/fs-writeback.c:2316 [inline]
>> wb_workfn+0x8b8/0xe10 fs/fs-writeback.c:2343
>> process_one_work kernel/workqueue.c:3229 [inline]
>> process_scheduled_works+0x5ee/0x1ba0 kernel/workqueue.c:3310
>> worker_thread+0x59f/0xcf0 kernel/workqueue.c:3391
>> kthread+0x345/0x450 kernel/kthread.c:389
>> ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
>> ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>> </TASK>
>> irq event stamp: 13825
>> hardirqs last  enabled at (13847): [<ffffffff9769dc8e>] __up_console_sem+0xae/0xc0 kernel/printk/printk.c:344
>> hardirqs last disabled at (13860): [<ffffffff9769dc73>] __up_console_sem+0x93/0xc0 kernel/printk/printk.c:342
>> softirqs last  enabled at (13842): [<ffffffff9750f554>] softirq_handle_end kernel/softirq.c:407 [inline]
>> softirqs last  enabled at (13842): [<ffffffff9750f554>] handle_softirqs+0x544/0x870 kernel/softirq.c:589
>> softirqs last disabled at (13881): [<ffffffff9751120e>] __do_softirq kernel/softirq.c:595 [inline]
>> softirqs last disabled at (13881): [<ffffffff9751120e>] invoke_softirq kernel/softirq.c:435 [inline]
>> softirqs last disabled at (13881): [<ffffffff9751120e>] __irq_exit_rcu kernel/softirq.c:662 [inline]
>> softirqs last disabled at (13881): [<ffffffff9751120e>] irq_exit_rcu+0xee/0x140 kernel/softirq.c:678
>> ---[ end trace 0000000000000000 ]---
>>
>>
>> ---------------
>> thanks,
>> Kun Hu
> Hi  Konstantin,
>
> I’m not sure if this is sufficient to help locate the bug? If you need additional information, please let me know.
>
> Thanks,
> Kun Hu
Hello Kun Hu,
I was able to reproduce the issue with extended debugging information. I 
will update you on the results here.
Thank you for highlighting the issue.

Regards,
Konstantin
