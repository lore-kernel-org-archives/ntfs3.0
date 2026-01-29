Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD99F1BBBFC
	for <ntfs3@lists.linux.dev>; Thu, 29 Jan 2026 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769699485; cv=none; b=UzCz4VKWA0yqVhNFlnKJxANGM5s+MJuknV7p4o+qjSBB9jWYDcuE2of9ShiP2+dsttjGXENfRujz07DmPugyUzmLNCnzuPXIp0GAqSkkIfBF6Zhe9oDzfvTV6tpcXbVY9LYZ+6KHW8NPnwP0iNreSkWy4zTg5JVDqo3xUsl5qZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769699485; c=relaxed/simple;
	bh=hneY/jcXo3C8V5cvETpKsQn0a1kwE3O+5fI/sgYd/rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MgBtpr3+nES6XLLYxIOqlkWrmWfV6MD1rbhSpA5xJIhy6i5xpeURpS/JVuNkyM/dbbMimaqfrZE7mSMpPGwqBaqXHsiVmkcJIUaIrJWABeuY16/OhlY8K469Ga/58GeqKDJFOKT8wb53knO+pWVL8PHbj42QNuQhGGUhII+7HD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=B6Pyy6Jl; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="B6Pyy6Jl"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 85EF21D2E;
	Thu, 29 Jan 2026 15:01:02 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=B6Pyy6Jl;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 005052141;
	Thu, 29 Jan 2026 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1769699003;
	bh=SWJ8GZCUd86kWe8Pt9HSXmyI3OpHJ9B7aCDscgSihCY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B6Pyy6JlTYYqKmI18ER3g+vDfjI4tdkA71G4arOemVA7qXz84Mfsu4X4tyqR/N+NO
	 lysNDQ3JlIovGqDOymmKNJyois0OaZI8sm1ZD4GRd+YAjoGTReoFwj9xge4WU4M7aY
	 pW2o5Rnyijtcz5kvmKjNXmZ+5qQm1bQgIOD904aY=
Received: from [192.168.95.128] (172.30.20.187) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 29 Jan 2026 18:03:22 +0300
Message-ID: <3410f3bc-00d9-4ab3-9ca0-5f5c988e244d@paragon-software.com>
Date: Thu, 29 Jan 2026 16:03:20 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: Fix slab-out-of-bounds read in
 DeleteIndexEntryRoot
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	<linux-kernel@vger.kernel.org>
CC: <ntfs3@lists.linux.dev>
References: <20260117165024.32827-1-jiashengjiangcool@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260117165024.32827-1-jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 1/17/26 17:50, Jiasheng Jiang wrote:

> In the 'DeleteIndexEntryRoot' case of the 'do_action' function, the
> entry size ('esize') is retrieved from the log record without adequate
> bounds checking.
>
> Specifically, the code calculates the end of the entry ('e2') using:
>      e2 = Add2Ptr(e1, esize);
>
> It then calculates the size for memmove using 'PtrOffset(e2, ...)',
> which subtracts the end pointer from the buffer limit. If 'esize' is
> maliciously large, 'e2' exceeds the used buffer size. This results in
> a negative offset which, when cast to size_t for memmove, interprets
> as a massive unsigned integer, leading to a heap buffer overflow.
>
> This commit adds a check to ensure that the entry size ('esize') strictly
> fits within the remaining used space of the index header before performing
> memory operations.
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>   fs/ntfs3/fslog.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 38934e6978ec..28bd611f580d 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3429,6 +3429,9 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>   
>   		e1 = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
>   		esize = le16_to_cpu(e1->size);
> +		if (PtrOffset(e1, Add2Ptr(hdr, used)) < esize)
> +			goto dirty_vol;
> +
>   		e2 = Add2Ptr(e1, esize);
>   
>   		memmove(e1, e2, PtrOffset(e2, Add2Ptr(hdr, used)));

Applied to my tree, thanks for the patch.

Regards,
Konstantin

