Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD73009D5
	for <ntfs3@lists.linux.dev>; Thu, 20 Nov 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629302; cv=none; b=lOEXxKbEVCegs5Y0fxFbmUMhbaKfX1H5Qvn06pxs3/OyOsdlHVO6GwEmZIJGvdFYvyeU398WjwBGMaZLfsaaWLMLOVMjWXIIi4sWSRYBM+XRJbgpnG/PX3TRHP6ZlmDLNt/oZ4nATn7tpnSUbjNVga9yClj88cibxLRQnighZI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629302; c=relaxed/simple;
	bh=1LYiHWn1TS0grgUvOXuravJ9kPdvUo21fKOikCi4Wsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BKyjbZaB30nuVnaAL9BZyx/iagSH8ySxRvk9QYktkDBA0ACF8sgqwOzV2L2nNyOcpFmi+aaqaDS5QvX5KWFCSmrLXmvt5kK4H6BcDKv1WEUbOTZMQwv2SjOYs1eVgoGsawk09/ZFsQ0dWsQCdO3LJO54vUho4GJhgwXO1STVJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Rd7FY/1z; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Rd7FY/1z"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 8003826;
	Thu, 20 Nov 2025 08:58:11 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Rd7FY/1z;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 0164D2471;
	Thu, 20 Nov 2025 09:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763629299;
	bh=jqZLMmPqGDvG5eBWs2KgHooxYhQ57WrWwH4dlA5ZnUY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Rd7FY/1zxFtPI7kikLL8W4IyuleIVKsF1ac4Xelpojl1vcbzitjB7slCLUvYtEDqt
	 g/4/GTBcakZtuBDGoPG0IF84TqoF+9elbSwAVx0JYmq3DwR2AgMOhcXGWytqqgExcu
	 xiCMg2hqd537MtfYpIrIhz7h6pXOdbMwehQ9t+SQ=
Received: from [192.168.95.128] (172.30.20.202) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 20 Nov 2025 12:01:37 +0300
Message-ID: <a43eafd8-2e62-4dbd-9e21-7770f32e5678@paragon-software.com>
Date: Thu, 20 Nov 2025 10:01:36 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs: set dummy blocksize to read boot_block when
 mounting
To: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<syzbot+f4f84b57a01d6b8364ad@syzkaller.appspotmail.com>
References: <20251003153850.55643-1-pedrodemargomes@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251003153850.55643-1-pedrodemargomes@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 10/3/25 17:38, Pedro Demarchi Gomes wrote:

> When mounting, sb->s_blocksize is used to read the boot_block without
> being defined or validated. Set a dummy blocksize before attempting to
> read the boot_block.
>
> The issue can be triggered with the following syz reproducer:
>
>    mkdirat(0xffffffffffffff9c, &(0x7f0000000080)='./file1\x00', 0x0)
>    r4 = openat$nullb(0xffffffffffffff9c, &(0x7f0000000040), 0x121403, 0x0)
>    ioctl$FS_IOC_SETFLAGS(r4, 0x40081271, &(0x7f0000000980)=0x4000)
>    mount(&(0x7f0000000140)=@nullb, &(0x7f0000000040)='./cgroup\x00',
>          &(0x7f0000000000)='ntfs3\x00', 0x2208004, 0x0)
>    syz_clone(0x88200200, 0x0, 0x0, 0x0, 0x0, 0x0)
>
> Here, the ioctl sets the bdev block size to 16384. During mount,
> get_tree_bdev_flags() calls sb_set_blocksize(sb, block_size(bdev)),
> but since block_size(bdev) > PAGE_SIZE, sb_set_blocksize() leaves
> sb->s_blocksize at zero.
>
> Later, ntfs_init_from_boot() attempts to read the boot_block while
> sb->s_blocksize is still zero, which triggers the bug.
>
> Reported-by: syzbot+f4f84b57a01d6b8364ad@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f4f84b57a01d6b8364ad
> Signed-off-by: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
> ---
>   fs/ntfs3/super.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index ddff94c091b8..7648663d70c9 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -933,6 +933,9 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>   
>   	sbi->volume.blocks = dev_size >> PAGE_SHIFT;
>   
> +	// Set dummy blocksize to read boot_block
> +	sb_min_blocksize(sb, PAGE_SIZE);
> +
>   read_boot:
>   	bh = ntfs_bread(sb, boot_block);
>   	if (!bh)

Queued for the next merge window, thanks.

Regards,
Konstantin

