Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D642E2852
	for <ntfs3@lists.linux.dev>; Thu, 28 May 2026 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976999; cv=none; b=L/JeWi6oQXl3bQd1OFmos/ayJNs3Idrdkgv6aiLdp2zH/qnkxIO9oJj53DvodE5S0A+D8lPRP7Dru2jSrtA1B4LU4EwwLUgj8RUhwucRtgkYg2sQJ5sdBe/groMRs1FS6wG0xX/gySzX6TOagRkiPbRtlZC6rj+9hYJLrZAeuK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976999; c=relaxed/simple;
	bh=aLAoOS3eSCbGlFJXm0E02lp+fcweaZUG+J76HCW0jvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Equmr/ob75JRVHbK5nf1cc7Gn1h00uo+Rs5kdbt8cCrf7v2gxxJyTRLqa0AsVwJY0tH3FSIMebWccM0tJ3hzfOZWaKieWD9T9R2leI4XGSiyI6pNOXROWwann5NjCBdliXvL4cp15VjehTKkX3wYeG8DJIoek255JwuiXqjnUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=OeZFBcDg; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="OeZFBcDg"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 3DA7E26;
	Thu, 28 May 2026 14:03:18 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=OeZFBcDg;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id E0C201D44;
	Thu, 28 May 2026 14:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1779976995;
	bh=FbSpeyDe76XdZEgVbC4mDjj5knCEy+ahsGDVLbayXcU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OeZFBcDgH+AkC2S4bW5rK9vY/7/QSL2YAmVD3zzeu8uBTeZe3Msl7h9ouGpQZ9Uqc
	 XhD0L4MnBHPIT1Ee248CyQ+NemGvL0Mclrd78hGpNAL46i5UVBStDOqCr22Gh1jjjJ
	 0LaVNREwvjBCwQEZGBk/I6WyrkLBZB3rgfkP9shk=
Received: from [192.168.95.128] (172.30.20.180) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 28 May 2026 17:03:14 +0300
Message-ID: <71e5333c-bb8a-4886-bfa1-e1b4cb8ea451@paragon-software.com>
Date: Thu, 28 May 2026 16:03:13 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
To: fra-build <zhanxusheng1024@gmail.com>, <david.laight.linux@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhanxusheng@xiaomi.com>
References: <20260427035025.38158-1-zhanxusheng@xiaomi.com>
 <20260515082305.54624-1-fra@build.local>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260515082305.54624-1-fra@build.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/15/26 10:23, fra-build wrote:

> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
>
> In mi_enum_attr(), the start/end VCN validation for non-resident
> attributes is:
>
> 	if (svcn > evcn + 1) goto out;
>
> When evcn is U64_MAX the "evcn + 1" expression wraps to 0 and any
> svcn passes the check.  For evcn values close to U64_MAX (but not
> equal to it) the right-hand side is still a meaningless near-wrap
> upper bound, so a malformed on-disk attribute with svcn == 0 and
> evcn near U64_MAX can pass mi_enum_attr() unrejected.
>
> VCN (virtual cluster number) is a cluster index, so any valid evcn
> is bounded by the volume's total cluster count, which ntfs3 holds
> in sbi->used.bitmap.nbits (set up in ntfs_init_from_boot() before
> any caller of mi_enum_attr() runs).  Reject evcn values that fall
> outside this range; this rejects all out-of-range evcn values,
> not just U64_MAX, and as a side effect prevents the "evcn + 1"
> wraparound entirely.
>
> Fixes: 013ff63b6494 ("fs/ntfs3: Add more attributes checks in mi_enum_attr()")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>   fs/ntfs3/record.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
> index 32bdb034c2a3..4379446bcf96 100644
> --- a/fs/ntfs3/record.c
> +++ b/fs/ntfs3/record.c
> @@ -202,7 +202,7 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
>   	u32 used = le32_to_cpu(rec->used);
>   	u32 t32, off, asize, prev_type;
>   	u16 t16;
> -	u64 data_size, alloc_size, tot_size;
> +	u64 svcn, evcn, data_size, alloc_size, tot_size;
>   
>   	if (!attr) {
>   		u32 total = le32_to_cpu(rec->total);
> @@ -310,8 +310,17 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
>   	if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
>   		goto out;
>   
> -	/* Check start/end vcn. */
> -	if (le64_to_cpu(attr->nres.svcn) > le64_to_cpu(attr->nres.evcn) + 1)
> +	/*
> +	 * Check start/end vcn.  evcn must be a valid cluster index, i.e.
> +	 * less than the volume's total cluster count (sbi->used.bitmap.nbits);
> +	 * rejecting it here also keeps "svcn > evcn + 1" meaningful, since
> +	 * evcn == U64_MAX would wrap "evcn + 1" to 0.  svcn does not need
> +	 * its own bound: once evcn < nbits, "svcn > evcn + 1" implies
> +	 * svcn <= nbits.
> +	 */
> +	svcn = le64_to_cpu(attr->nres.svcn);
> +	evcn = le64_to_cpu(attr->nres.evcn);
> +	if (evcn >= mi->sbi->used.bitmap.nbits || svcn > evcn + 1)
>   		goto out;
>   
>   	data_size = le64_to_cpu(attr->nres.data_size);

Hello,

This patch doesn't apply as-is - during internal testing it caused a
number of failures.

I believe the cause is empty non-resident attributes, which are
legitimately encoded with svcn=0 and evcn=U64_MAX (a -1 sentinel for no
allocated clusters). The new evcn >= sbi->used.bitmap.nbits check rejects
those valid attributes. The U64_MAX wraparound you're guarding against is
real, but it needs to be handled without rejecting the empty-attribute
sentinel.

Not applied yet. Thanks.

Regards,
Konstantin

