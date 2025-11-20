Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0330F93A
	for <ntfs3@lists.linux.dev>; Thu, 20 Nov 2025 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629480; cv=none; b=NghQD9/+lDb/6dVFAgNmb+hOpbOWVq7nRTHCH+VW4ld5UMFE5GM62WWDU0UHsuPAE0Nur+mbV9/vNTmAmOW/+i7Wit7fd2IjciD5Ucr6YShlikM9KSFA+8eUXdy0T+Ak6WYQzhX6mZKV3Gmzmvbt4Xay5TLE7bL8i27bilabwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629480; c=relaxed/simple;
	bh=Y15oP9gUaR43YHfQGvV0v8OIFZGVA5vYF0REj/eEggc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MGvx7VdBEW96rAO7L54WXGIYKgijjG+Ca8JUU20QyQhV+dI5wlptdYRriSG/w+c84G04AsjtkVjGb9rx5Xg5GDdVHAF2biMNKoG+Rt0hjLasiPNuwAXXqT6ho+tv0F88ZRrdKPwBCUC3nSTSKrow2l3r/zGwQaqWi43I0YZtcN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Qu3mCH7Z; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Qu3mCH7Z"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 094E126;
	Thu, 20 Nov 2025 09:01:10 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Qu3mCH7Z;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 8E2D42471;
	Thu, 20 Nov 2025 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1763629477;
	bh=KVud2a3rNz9g4ETHzhUm/39SdcQwc1nHJrxxyznjWXc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Qu3mCH7Zg7/S/K4aa9SSYbOk2zd+3NdISJa1vElbiPRUPEza0oFFGPT+32ykMf50S
	 2TNdPFM0OfptkPm8lnOMYjcaC14KdVnRyO9FgJ7LsK9qKPPGXb0J5V62Ntl9P4V+Op
	 oA8sItFKjhw046TrNyoDQom0UvUOCWOjF0DTnkq0=
Received: from [192.168.95.128] (172.30.20.202) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 20 Nov 2025 12:04:36 +0300
Message-ID: <f8929047-fd9c-4a34-8c12-2ac93f85c75d@paragon-software.com>
Date: Thu, 20 Nov 2025 10:04:35 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: avoid memcpy size warning
To: Lizhi Xu <lizhi.xu@windriver.com>,
	<syzbot+3a1878433bc1cb97b42a@syzkaller.appspotmail.com>
CC: <linux-kernel@vger.kernel.org>, <ntfs3@lists.linux.dev>,
	<syzkaller-bugs@googlegroups.com>
References: <68e2ff91.050a0220.2c17c1.003a.GAE@google.com>
 <20251009023733.3705264-1-lizhi.xu@windriver.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251009023733.3705264-1-lizhi.xu@windriver.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 10/9/25 04:37, Lizhi Xu wrote:

> There are more entries after the structure, use unsafe_memcpy() to avoid
> this warning.
>
> syzbot reported:
> memcpy: detected field-spanning write (size 3656) of single field "hdr1" at fs/ntfs3/index.c:1927 (size 16)
> Call Trace:
>   indx_insert_entry+0x1a0/0x460 fs/ntfs3/index.c:1996
>   ni_add_name+0x4dd/0x820 fs/ntfs3/frecord.c:2995
>   ni_rename+0x98/0x170 fs/ntfs3/frecord.c:3026
>   ntfs_rename+0xab9/0xf00 fs/ntfs3/namei.c:332
>
> Reported-by: syzbot+3a1878433bc1cb97b42a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3a1878433bc1cb97b42a
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>   fs/ntfs3/index.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 6d1bf890929d..7157cfd70fdc 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1924,7 +1924,8 @@ indx_insert_into_buffer(struct ntfs_index *indx, struct ntfs_inode *ni,
>   		 * Undo critical operations.
>   		 */
>   		indx_mark_free(indx, ni, new_vbn >> indx->idx2vbn_bits);
> -		memcpy(hdr1, hdr1_saved, used1);
> +		unsafe_memcpy(hdr1, hdr1_saved, used1,
> +			      "There are entries after the structure");
>   		indx_write(indx, ni, n1, 0);
>   	}
>   

Thanks for the patch. Applied.

Regards,
Konstantin

