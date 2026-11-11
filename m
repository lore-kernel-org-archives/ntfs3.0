Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.157.23.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386799;
	b=hfn0NdV/B/IttSdrGe+EKwISQ+I/GeC2T+jxoBggakcgUEme8OkTpEK83IPrMMTaYg1J
	 5AgGrMGrArytwMNmJtzRoP3z0K5J28ArGHMMgzvSErC8cd3AnBBwcCdf/8oa4NVipD/8c
	 818GERhV+e28+BP8V0iNRRDp0kJYE3T+oObQlRUQeri1knOLor2DfoyepiId5XnNBpVwI
	 NRdTjh9eTEuLeKCeRNtm9U9nAzFsXYvfha44CSVjZzv7HpIkx+OpD4kT3mYCxCKW2DjNZ
	 ajGasoCzBZ1/V+WOkeGAveyC0B22qlP/ZYA7w3ByUVwV4FMwNETJ+5psnQNiCHxoGlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386799;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=9P1O4WQgnVQDl+a4kZrp5MX4deKhKwsEC4dzzWtFl6E=;
	b=Tk4ezKfXiky5f3kp3fOv2ofzuBnzTXXUepHNnhrpel4gCDneRNFFoRXfS5CwoeYPI4yh
	 8wWj5E65Dgh+crYfq1ljUuT1MJPf9mrHFhNdWSH2WqzBHYx41EF4pDq1dSAzGRhHm5D6o
	 iZ93+mDuA4M+TZB1SLvlcMlhJTcwssLX5YcnlNzpNtqSqu8ANGuBHB0XzGqrLCmKwW7nw
	 8o881WJnmzmMC1y30ZgPc8WS7DOqyN1+dgWMXqGxaAZRfADLJ2NUeUzQx4q+F4v381a8S
	 OwRl8EqF649h8WE4o3kGGnkHmTQaqfeK+3kmm+j/n43ljXwNTN7QS5sZPL1Cc3uIYOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paragon-software.com;
	spf=pass smtp.mailfrom=paragon-software.com;
	dkim=pass header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=bD7N8s5w;
	arc=none smtp.remote-ip=35.157.23.187
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F5606A31C
	for <ntfs3@lists.linux.dev>; Wed, 11 Nov 2026 08:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E5F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.a=rsa-sha256 header.s=mail header.b=bD7N8s5w
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 09F241D28;
	Wed, 11 Nov 2026 08:47:16 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=bD7N8s5w;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3581F2389;
	Wed, 11 Nov 2026 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1794386791;
	bh=9P1O4WQgnVQDl+a4kZrp5MX4deKhKwsEC4dzzWtFl6E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bD7N8s5whNgWjE+CyrjIwhmdqcvcL8b+4/ntRoRwjS7Zwwe1mJOyhklrawSy736nl
	 +wUaaz4GKKvvsoYRBYNOIiJr80kfVL0CmUux/oXIWXNrboOfWHmRU2kHTRa1gR6dNb
	 2OPPia8okK+1ylbSVzD/UkodIOfiRlsA6EdccROQ=
Received: from [192.168.95.128] (172.30.20.190) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 11 Nov 2026 11:46:29 +0300
Message-ID: <8b98d6c9-2277-43e8-94e3-a00b9de7e2bb@paragon-software.com>
Date: Wed, 11 Nov 2026 09:46:28 +0100
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ntfs3: fix buffer overflow in CreateAttribute
 validation
To: Hongling Zeng <zenghongling@kylinos.cn>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhongling0719@126.com>, <stable@vger.kernel.org>
References: <20260813094129.1366996-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260813094129.1366996-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 8/13/26 11:41, Hongling Zeng wrote:

> In the CreateAttribute action, the validation checks whether dlen
> fits within the available MFT record space, but the actual memcpy
> uses asize (the attribute size from the log record) as the copy length.
>
> A malicious NTFS journal record can set a small dlen to pass the
> validation while setting a large asize that exceeds the MFT record
> buffer size, causing a buffer overflow when memcpy copies asize bytes
> into the destination buffer.
>
> The validation must use the same size that is later passed to memcpy().
>
> Fix this by using asize in the bounds check instead of dlen, since
> asize is the actual length used by memcpy. The source buffer boundary
> is already validated by the existing check:
>        Add2Ptr(attr2, asize) > Add2Ptr(lrh, rec_len)
>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Change in v2:
>   Also fix the lower bound check to use asize instead of dlen. A malicious
>   log record with dlen >= 24 (passing dlen < SIZE_OF_RESIDENT check) but
>   asize < 24 could allocate insufficient memory and trigger OOB accesses
>   in subsequent operations.
> ---
>   fs/ntfs3/fslog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 3440212ecb12..e15f7621863e 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -3285,10 +3285,10 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
>   		asize = le32_to_cpu(attr2->size);
>   		used = le32_to_cpu(rec->used);
>   
> -		if (!check_if_attr(rec, lrh) || dlen < SIZEOF_RESIDENT ||
> +		if (!check_if_attr(rec, lrh) || asize < SIZEOF_RESIDENT ||
>   		    !IS_ALIGNED(asize, 8) ||
>   		    Add2Ptr(attr2, asize) > Add2Ptr(lrh, rec_len) ||
> -		    dlen > record_size - used) {
> +		    asize > record_size - used) {
>   			goto dirty_vol;
>   		}
>   

Hello,

Sorry for the delay.
Your patch was applied, thanks.

Regards,
Konstantin

