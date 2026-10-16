Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A44745C6E0
	for <ntfs3@lists.linux.dev>; Fri, 16 Oct 2026 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162121; cv=none; b=VIBhL36aM2B7p4xZs0RCuDKtyb5OP+Eq33A2Q6SWJ74bg1hr9uTxOdo1PsNFyW04tbm17MqPrDCPhnE9QTsbYxSZRDSpPIBd1aP2KxI0p507pNp2Ov1NNq8GulefQUTjcsEu+Gyb7mVZorFB14rPdqieluFcV6FmrK2XUQP1Ysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162121; c=relaxed/simple;
	bh=zWjxExpRcmXnfH4W0/a3kgCxI30Kz06xgdyZ+mBp8Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=blxFcVOCp8nMUAxjkh71GhMl3Z8rVT2vDPCl88lbW3/xDTdLZ06jPFcJ4lOXqXk49dvyBmhYGnYa8xC+pECL1f9Mir9CpMCSWJSHL5NEpyYrN/nB1gNbhI3gGDOi5e2UPOb4dTM+OOYMxhWfNqvPY9TphcnO9b3u/ahlSrv8DSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=PI//JPS9; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="PI//JPS9"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id C053D1D1B;
	Fri, 16 Oct 2026 14:49:26 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=PI//JPS9;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E62131D4B;
	Fri, 16 Oct 2026 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1792162116;
	bh=pZzLhAcgOU7x0UIdjwGa81ZV1jpNBedjJU1lz6UUG4k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PI//JPS9qdw6k3zCbizg5ceTvuKxV2Ff1Drk7nPRupXgb/iTllBVPm7FyLCQGdrG4
	 OjXKegoyj1GnC4VWeRJJgAoxyI74p6dnrDvvi9ZMC4QSCHfdjpM5m7QRL771wSWnWn
	 EmK2wlBeH+Bm6q8o/fHJIJ7AoFZ7FTjp/YTNtWzw=
Received: from [192.168.95.128] (172.30.20.132) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 16 Oct 2026 17:48:35 +0300
Message-ID: <d3279695-9c86-44c8-870d-dd71393a68ff@paragon-software.com>
Date: Fri, 16 Oct 2026 16:48:32 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ntfs3: release ni_lock before dir_emit in
 ntfs_readdir to fix deadlocks
To: Yun Zhou <yun.zhou@windriver.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260701013049.3141386-1-yun.zhou@windriver.com>
 <20260701013049.3141386-3-yun.zhou@windriver.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260701013049.3141386-3-yun.zhou@windriver.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/1/26 03:30, Yun Zhou wrote:

> ntfs_readdir() holds ni_lock while calling ntfs_read_hdr(), which calls
> dir_emit() to copy directory entries to userspace.  If the user buffer
> triggers a page fault, the fault handler may need mmap_lock or
> mapping->invalidate_lock, creating lock-order inversions with paths
> that acquire those locks before ni_lock (e.g. ntfs_fallocate, mmap).
>
> Fix by releasing ni_lock before calling ntfs_read_hdr():
>
> - For non-root index nodes, indx_read_ra() returns data in a kmalloc'd
>    buffer (node->index) that remains valid after ni_unlock.
>
> - For the root index header, the data lives in the main MFT record
>    whose lifetime is bound to the inode.  i_rwsem shared prevents
>    concurrent directory modifications, so it is safe to access after
>    ni_unlock.
>
> Reported-by: syzbot+7736960b837908f3a81d@syzkaller.appspotmail.com
> Reported-by: syzbot+262a71e9d2faf8747085@syzkaller.appspotmail.com
> Reported-by: syzbot+cfc6e8106bec1c524f7d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=7736960b837908f3a81d
> Closes: https://syzkaller.appspot.com/bug?extid=262a71e9d2faf8747085
> Closes: https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
> Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
>   fs/ntfs3/dir.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
> index 07de564a2c47..65883409689a 100644
> --- a/fs/ntfs3/dir.c
> +++ b/fs/ntfs3/dir.c
> @@ -491,12 +491,22 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>   	if (pos >= sbi->record_size) {
>   		bit = (pos - sbi->record_size) >> index_bits;
>   	} else {
> +		/*
> +		 * Release ni_lock before dir_emit (which may fault into
> +		 * user pages).  root->ihdr lives in the main MFT record
> +		 * whose lifetime is bound to the inode, and i_rwsem shared
> +		 * prevents concurrent directory modifications.
> +		 */
> +		ni_unlock(ni);
> +
>   		/*
>   		 * Add each name from root in 'ctx'.
>   		 */
>   		err = ntfs_read_hdr(sbi, ni, &root->ihdr, 0, pos, name, ctx);
>   		if (err)
> -			goto out_unlock;
> +			goto out;
> +
> +		ni_lock(ni);
>   		bit = 0;
>   	}
>   
> @@ -525,6 +535,12 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>   		if (err)
>   			goto out_unlock;
>   
> +		/*
> +		 * node->index is a kmalloc'd buffer, safe after ni_unlock.
> +		 * Release lock before dir_emit to avoid lock-order issues.
> +		 */
> +		ni_unlock(ni);
> +
>   		/*
>   		 * Add each name from index in 'ctx'.
>   		 */
> @@ -532,7 +548,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
>   				    ((u64)bit << index_bits) + sbi->record_size,
>   				    pos, name, ctx);
>   		if (err)
> -			goto out_unlock;
> +			goto out;
> +
> +		ni_lock(ni);
>   	}
>   
>   out_unlock:

Hello,

The patch was applied, thanks.

Regards,
Konstantin

