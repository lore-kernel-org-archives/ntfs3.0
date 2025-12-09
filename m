Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD63A219A86
	for <ntfs3@lists.linux.dev>; Tue,  9 Dec 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287390; cv=none; b=LBEi1amgIKtLKFpI+zWShbws1dU6wAqLGiy+mc6WzZjcIEADkhZOWFNz0vAYdZ2X5zWI9bNiFKzj10RAOj3PeOoUmtJgCZTWLeoZVXYVpU7sNbpdRA0CKfRx7Fud75nAbvxggWkFime50IHxA5AbWgLZrF9YFSBDK8HCp956XqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287390; c=relaxed/simple;
	bh=qVarLALKtE361AXiFTDbqQdvpzOuT6ATWZEaexT5d7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DbtfALllwnvWRl2ETLsGkmJLm9K4sCancBmDUzh5Tt9F/gja5ijYilVn5n72MROPSanHqrsEBu6Tt8T+uTKvvharSQzUHSKItF4pBxwBRTyaSanIMWsodSm+y6p8YuQYxoKKqfuMccZwDq7dZSkqQVKvuSP4MgIYT8XMm/HqZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=pzzba2TR; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="pzzba2TR"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id F06E81D42;
	Tue,  9 Dec 2025 13:32:46 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=pzzba2TR;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id EC8852416;
	Tue,  9 Dec 2025 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1765287379;
	bh=+O73i+bCFw4Mv+OPee7n7G19xy4Km6MIHZ62jG4QOXA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pzzba2TRi1v8QiLCQ9SleSr9Zk8GW955eIdG9luvPmqAoRCKWRKG/3PZkN+SLTT0k
	 7uVnj6Ycc1Y8cnXEJbM0vXoaYQwaon6iZ+8qSsAehGaHngq03KCpzFvGNYlnRQAzDY
	 7z2muMa+ax+BEZl7BV8n0UEZaL/4V8/VxMGn73yE=
Received: from [192.168.95.128] (172.30.20.141) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 9 Dec 2025 16:36:19 +0300
Message-ID: <ee6e02b3-9384-44f7-ab69-826be883d21c@paragon-software.com>
Date: Tue, 9 Dec 2025 14:36:17 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: ntfs3: check return value of indx_find to avoid
 infinite loop
To: Jaehun Gou <p22gone@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Seunghun Han
	<kkamagui@gmail.com>, Jihoon Kwon <kjh010315@gmail.com>
References: <20251202105959.1885454-1-p22gone@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251202105959.1885454-1-p22gone@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 12/2/25 11:59, Jaehun Gou wrote:

> We found an infinite loop bug in the ntfs3 file system that can lead to a
> Denial-of-Service (DoS) condition.
>
> A malformed dentry in the ntfs3 filesystem can cause the kernel to hang
> during the lookup operations. By setting the HAS_SUB_NODE flag in an
> INDEX_ENTRY within a directory's INDEX_ALLOCATION block and manipulating the
> VCN pointer, an attacker can cause the indx_find() function to repeatedly
> read the same block, allocating 4 KB of memory each time. The kernel lacks
> VCN loop detection and depth limits, causing memory exhaustion and an OOM
> crash.
>
> This patch adds a return value check for fnd_push() to prevent a memory
> exhaustion vulnerability caused by infinite loops. When the index exceeds the
> size of the fnd->nodes array, fnd_push() returns -EINVAL. The indx_find()
> function checks this return value and stops processing, preventing further
> memory allocation.
>
> Co-developed-by: Seunghun Han <kkamagui@gmail.com>
> Signed-off-by: Seunghun Han <kkamagui@gmail.com>
> Co-developed-by: Jihoon Kwon <kjh010315@gmail.com>
> Signed-off-by: Jihoon Kwon <kjh010315@gmail.com>
> Signed-off-by: Jaehun Gou <p22gone@gmail.com>
> ---
>   fs/ntfs3/index.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 6d1bf890929d..050b3709e020 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1190,7 +1190,12 @@ int indx_find(struct ntfs_index *indx, struct ntfs_inode *ni,
>   			return -EINVAL;
>   		}
>   
> -		fnd_push(fnd, node, e);
> +		err = fnd_push(fnd, node, e);
> +
> +		if (err) {
> +			put_indx_node(node);
> +			return err;
> +		}
>   	}
>   
>   	*entry = e;

Your patch has been applied. Thanks.

Regards,
Konstantin

