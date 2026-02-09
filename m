Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22487346A19
	for <ntfs3@lists.linux.dev>; Mon,  9 Feb 2026 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630281; cv=none; b=aPXdCLwuumdnJXjHk1EzGTel0pz64GW3B2cqCPsBmGUhQi5H+q0ro6iGZ3oMj3SqQ7zJXLjapAg7CmkkjnvthlexQEGGQJ41TK5QIPkc4l0HvjDe3IbaTb7Qgw4ERHSHeEopG1KTwf7aoA8jNoLlXs3F/4a6uBkBGpu4WU0Zh6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630281; c=relaxed/simple;
	bh=DNEWj3rJ9VU9tHv3OLNopBvmi15aTMaMTAPDiDG6bwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NWMCu8KibdPGB1J0DTJwxx2KfGOWBKDRIEKgYKTqGN/gs3QbUiNtNruNKhUwjlNsLbBN4EqQmurrVwOnsq15KtbmC+/SwQhG5Wqos7w/1ZuIN3PbkStPbelp+tN8KTGtCDkc45l4qjz+itBzSfKvnOxxwMVNjvzd7x2vxGlC+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=csWO0NJp; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="csWO0NJp"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B1495C4;
	Mon,  9 Feb 2026 09:42:26 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=csWO0NJp;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A1D8B218D;
	Mon,  9 Feb 2026 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1770630268;
	bh=igTWDQ0tb2FgO6hG3AnuU8JfzFWMQzaYrN27rooAefc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=csWO0NJpKmmeraiintAUQG7juBKX7+Z14wUILe4FmU9zaGtUHr8LQFfxjDVN7jnJ0
	 zCAQFn51GqbyseUdXais7oP2HK7FtsWPnmT39tt4kkLJcHnD1Qk3vLD/LunL5wHNV/
	 gc85qE2zf9wNbc1LH8N96jwj5pjFyFnivHD6l3yU=
Received: from [192.168.95.128] (172.30.20.148) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 9 Feb 2026 12:44:27 +0300
Message-ID: <f9e6330b-087f-4f5f-9067-331b7c7ddd44@paragon-software.com>
Date: Mon, 9 Feb 2026 10:44:26 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: buffer overflow in ntfs3's log_replay()
To: <rtm@csail.mit.edu>
CC: <ntfs3@lists.linux.dev>
References: <42774.1769379272@localhost>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <42774.1769379272@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 1/25/26 23:14, rtm@csail.mit.edu wrote:

> Below is a demo in which a corrupt NTFS image mounted r/w with ntfs3
> causes log_replay() to allocate 112 bytes for ra at line 4029:
>
>          ra = kzalloc(log->restart_size, GFP_NOFS);
>
> but then copies 96 bytes to ra at offset 64 at line 4041:
>
>                  memcpy(ra->clients, Add2Ptr(ra2, t16),
>                         le16_to_cpu(ra2->ra_len) - t16);
>
> log->restart_size is 112, ra2->ra_len is 112, and t16 (really
> ra2->client_off) is 16.
>
> To reproduce:
>
> # uname -a
> Linux ubuntu66 6.19.0-rc6-00447-g4dc00a84391e #39 SMP PREEMPT_DYNAMIC Sun Jan 25 16:32:13 EST 2026 x86_64 x86_64 x86_64 GNU/Linux
> # wget http://www.rtmrtm.org/rtm/ntfs30a.img.gz
> # gunzip ntfs30a.img.gz
> # mount -t ntfs3 -o loop,rw ntfs30a.img /mnt
> [Right Redzone overwritten] 0xffff8881097bd600-0xffff8881097bd607 @offset=5632. First byte 0xff instead of 0xcc
> =============================================================================
> BUG kmalloc-128 (Not tainted): Object corrupt
> -----------------------------------------------------------------------------
> Allocated in 0xffffffffffffffff age=0 cpu=4294967295 pid=1330
> Freed in free_rb_tree_fname+0x42/0x70 age=20073 cpu=1 pid=413
> Slab 0xffffea000425ef00 objects=21 used=15 fp=0xffff8881097bda00 flags=0x200000000000240(workingset|head|node=0|zone=2)
> Object 0xffff8881097bd580 @offset=5504 fp=0xffffffffffffffff
> Redzone  ffff8881097bd500: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  ffff8881097bd510: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  ffff8881097bd520: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  ffff8881097bd530: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  ffff8881097bd540: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  ffff8881097bd550: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  ffff8881097bd560: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Redzone  ffff8881097bd570: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
> Object   ffff8881097bd580: 7f 08 00 e0 ff ff ff ff 01 00 ff ff 00 00 ff ff  ................
> Object   ffff8881097bd590: 43 00 00 00 a0 00 40 00 00 00 00 00 00 00 00 00  C.....@.........
> Object   ffff8881097bd5a0: ff ff ff ff f8 ff f8 ff 42 ad 60 44 ff ff ff ff  ........B.`D....
> Object   ffff8881097bd5b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> Object   ffff8881097bd5c0: 43 00 00 00 70 00 10 00 00 00 00 00 00 00 00 00  C...p...........
> Object   ffff8881097bd5d0: ff ff ff ff f8 ff f8 ff ff ff ff ff ff ff ff ff  ................
> Object   ffff8881097bd5e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> Object   ffff8881097bd5f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> Redzone  ffff8881097bd600: ff ff ff ff ff ff ff ff                          ........
> Padding  ffff8881097bd654: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
> Padding  ffff8881097bd664: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
> Padding  ffff8881097bd674: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a              ZZZZZZZZZZZZ
>
> Robert Morris
> rtm@mit.edu

Hello,

Sorry for the late reply — thank you for the report and the test image.
I’ll reproduce this locally and follow up with what I find.

Regards,
Konstantin

