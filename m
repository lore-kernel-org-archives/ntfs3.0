Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6F3E9C19
	for <ntfs3@lists.linux.dev>; Mon, 14 Sep 2026 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371364; cv=none; b=ZPmfht5G0+DaA+sWynxnZ2kRwL7mk/Gt0FhmG2dLpyIzxryHdSTr320sXZff4nXOV66QRPtt0om6CxdIuIBIU+vFp3ns3/CefGwLGBiirv2HVPk7y/fCSLfOf9WJ3xxX109XAK38t3Ke76aNv1V1XKfbUTakBLmdSW8frcU5YWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371364; c=relaxed/simple;
	bh=pjQCrhVybq42xSBdvcqzoyATy6WZYC6GQxRwuERvOqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CUCi6URpSYXTtpcgByPh0xdwMOVPKt/s7tFEmwrxQ+kjB/1MJ//DFSLPMUN8epa6p+Aa5iJL0FFs7lzy/cnE6S6vLnT8129pc0GiVl9BkgyFOjIA0/7q6MsrG0h1MBp3j7hlU6O3KjFkhlQtDQ65gdU3oTTAKVgUf6Sek2MEpk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=SL9pcZo4; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="SL9pcZo4"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id EF4701D26;
	Mon, 14 Sep 2026 07:36:52 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=SL9pcZo4;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id BC77B219A;
	Mon, 14 Sep 2026 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789371356;
	bh=ohNmeMLbsNeT+K/i0QN/ctG4mCkxsqQGKgE3bBts7sQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SL9pcZo4nUC4+TXNwhYN2mvmxlr7THKvorW8cUtD3Z1YEBgvhSbqGhgUjV35cCYIs
	 LOlxqwvHv4nNkWrMAkBwDblzyT+scJbyw7vAsTm9H+Oz7QBV7pc8sQKgqpb6GI3g1b
	 vOvGOmWDyXE+TpKuk6R3NjJMLoAxiSCakGbptt7k=
Received: from [192.168.95.128] (172.30.20.160) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 14 Sep 2026 10:35:55 +0300
Message-ID: <b0d314d2-47a5-496a-a62c-8b90cfa0c413@paragon-software.com>
Date: Mon, 14 Sep 2026 09:35:53 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: update ctime only on successful setxattr
To: Baolin Liu <liubaolin12138@163.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Baolin Liu
	<liubaolin@kylinos.cn>
References: <20260626094914.908224-1-liubaolin12138@163.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260626094914.908224-1-liubaolin12138@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/26/26 11:49, Baolin Liu wrote:

> From: Baolin Liu <liubaolin@kylinos.cn>
>
> ntfs_setxattr() updates ctime and marks the inode dirty even when the
> xattr operation fails.
>
> Do that only on success.
>
> Fixes: 2d44667c306e ("fs/ntfs3: Update i_ctime when xattr is added")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>   fs/ntfs3/xattr.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9eeac0ab2b71..9743a63a152e 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -960,8 +960,10 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>   			  NULL);
>   
>   out:
> -	inode_set_ctime_current(inode);
> -	mark_inode_dirty(inode);
> +	if (!err) {
> +		inode_set_ctime_current(inode);
> +		mark_inode_dirty(inode);
> +	}
>   
>   	return err;
>   }

Hello,

Sorry for the delay.
Your patch is applied, thanks.

Regards,
Konstantin

