Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE13E0C53
	for <ntfs3@lists.linux.dev>; Mon,  2 Mar 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459821; cv=none; b=Ew1ZEZhj48dh87pKAvtiffqJBCOkKebjyk1DBKYRSp184Ay6RF+SqDCpXlTvlr8uVG7N3pXQONbbJcuTXkgOvHOvnzHtEZETKlgC4F65KNmRKFjy6sl/ls2gv/JcbkwxPUOQEOATJf3wuTpugP+EXfDog/bvA6CUc5JMDdF+EPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459821; c=relaxed/simple;
	bh=jFPBzZGH0uJJ61umkHdrnAIoYPxbUmFcA0n/ZbCJqr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h5tLlOTTP6AaNpTFVf16kns2+dKa3ke4f/9q03W2eolCYpBgmJIUoGDE0pukPQnx+h2ULJlEnJZYMgRz8Rgd/2OFygHUGcoILOYFZyMweL/PWysxpXqkkiZS8Klk5I/ocX9q/JMWN2lgoTRvJ6k1Vr1wz73HXuF7sV6KmPsJIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=vPXeArGw; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="vPXeArGw"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id CE3AD1D29;
	Mon,  2 Mar 2026 13:49:37 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=vPXeArGw;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 100F92123;
	Mon,  2 Mar 2026 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1772459465;
	bh=q1j72u40FaVMUmPnO+k3xvkTL0OzLHCgNVbH65xTVtc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vPXeArGwJthTRz+6vnxQFQfHWLlKkgqysVvnpmaU3UmiAgRA3caUJ3TDzaKmcVrDd
	 dmSnTBTw4ff0CLgfqQqixghIMBey18aKMOogfTq61Sr6qKZzkOo6FJ0tnJ2xZckkiZ
	 LcSG4FjaEbdrymK8dpLW6GBrGgkYS06fTh/xIIlQ=
Received: from [192.168.95.128] (172.30.20.205) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 2 Mar 2026 16:51:03 +0300
Message-ID: <36ef9f6c-2d0f-4469-ac24-59a8aec2607c@paragon-software.com>
Date: Mon, 2 Mar 2026 14:51:02 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: prevent uninitialized lcn caused by zero len
To: Edward Adam Davis <eadavis@qq.com>,
	<syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>,
	<syzkaller-bugs@googlegroups.com>
References: <699ae98b.050a0220.340abe.0d30.GAE@google.com>
 <tencent_24B18DF3926D5DB85DAA195F4FBD0D8E2507@qq.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <tencent_24B18DF3926D5DB85DAA195F4FBD0D8E2507@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 2/23/26 09:01, Edward Adam Davis wrote:

> syzbot reported a uninit-value in ntfs_iomap_begin [1].
>
> Since runs was not touched yet, run_lookup_entry() immediately fails
> and returns false, which makes the value of "*len" 0.
> Simultaneously, the new value and err value are also 0, causing the
> logic in attr_data_get_block_locked() to jump directly to ok, ultimately
> resulting in *lcn being triggered before it is set [1].
>
> In ntfs_iomap_begin(), the check for a 0 value in clen is moved forward
> to before updating lcn to avoid this [1].
>
> [1]
> BUG: KMSAN: uninit-value in ntfs_iomap_begin+0x8c0/0x1460 fs/ntfs3/inode.c:825
>   ntfs_iomap_begin+0x8c0/0x1460 fs/ntfs3/inode.c:825
>   iomap_iter+0x9b7/0x1540 fs/iomap/iter.c:110
>
> Local variable lcn created at:
>   ntfs_iomap_begin+0x15d/0x1460 fs/ntfs3/inode.c:786
>
> Fixes: 10d7c95af043 ("fs/ntfs3: add delayed-allocation (delalloc) support")
> Reported-by: syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7be88937363ac7ab7bb0
> Tested-by: syzbot+7be88937363ac7ab7bb0@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   fs/ntfs3/inode.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 6e65066ebcc1..eac421cf98a8 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -822,6 +822,11 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   		return err;
>   	}
>   
> +	if (!clen) {
> +		/* broken file? */
> +		return -EINVAL;
> +	}
> +
>   	if (lcn == EOF_LCN) {
>   		/* request out of file. */
>   		if (flags & IOMAP_REPORT) {
> @@ -855,11 +860,6 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   		return 0;
>   	}
>   
> -	if (!clen) {
> -		/* broken file? */
> -		return -EINVAL;
> -	}
> -
>   	iomap->bdev = inode->i_sb->s_bdev;
>   	iomap->offset = offset;
>   	iomap->length = ((loff_t)clen << cluster_bits) - off;

Hello,

Your patch is applied. Thanks.

Regards,
Konstantin

