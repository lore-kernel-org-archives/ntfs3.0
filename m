Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917303C8C77
	for <ntfs3@lists.linux.dev>; Fri, 14 Aug 2026 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690579; cv=none; b=m1KvRioBj05wdfwNmPOZFJo2VbHjinEL0++5cyNK07vHi/Gq3hbXhoGbKZPaJobh98CUdzfjTwxrK/994t/hQSJVeuHM75FKGtZfyTI66U3btLY+F9Y31qaVzBSrtKWRstmixpSEMuLyuq2KfRXBSIBAYqDWmq6U6GpdceKbV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690579; c=relaxed/simple;
	bh=x7KP1bX6mYpvE5LSrkt+GHkUGMv8W92ihSP2hTzGENQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IDLmlvVVOtNG1WmyTUT6zIC1+C2z1+3zcVIocGYeiiYE62EVWV6RNkWno5HDK5h2WJgGkRKKw9ZYc5oVFIRJntr/IpfPccb//linHSX13LvRqJZsmbuIf8eieB4KRTblHmz72e/UyFtgtCBpGPmLIEPHX6hI7AXHrdZgRm5EaA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=NiQKvVwU; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="NiQKvVwU"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id E9D2031;
	Fri, 14 Aug 2026 06:56:59 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=NiQKvVwU;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A295E1E0A;
	Fri, 14 Aug 2026 06:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1786690575;
	bh=4vU7ljDqL1k7Do92a2bNgAWkwCjaK7Vz3bBSLH/k6G0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NiQKvVwU86RnlT7UeGCl4n+r0GuGFwjldSmf6W2vh/rLA5WgqA1XPJfBcA/ipn6Ig
	 S4KApigt8VodsQyWqhD+nYvFzvz8jYZG/uOXXRH5HxxSRjItYBm/eQohlVPFCMM9x9
	 38267SNcDeDaVyE69F9wd0qcz+tBrVpdcXZhAxzo=
Received: from [192.168.95.128] (172.30.20.208) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Aug 2026 09:56:14 +0300
Message-ID: <da5a1b3a-0d3e-497a-8ba8-37ecbfd381d3@paragon-software.com>
Date: Fri, 14 Aug 2026 08:56:13 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] fs/ntfs3: reject out-of-range evcn in mi_enum_attr()
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Zhan Xusheng
	<zhanxusheng@xiaomi.com>
References: <71e5333c-bb8a-4886-bfa1-e1b4cb8ea451@paragon-software.com>
 <20260624034430.58214-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260624034430.58214-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/24/26 05:44, Zhan Xusheng wrote:

> In mi_enum_attr(), the start/end VCN validation for non-resident
> attributes is:
>
> 	if (svcn > evcn + 1) goto out;
>
> When evcn is U64_MAX the "evcn + 1" expression wraps to 0 and any svcn
> passes the check. For evcn values close to U64_MAX (but not equal to it)
> the right-hand side is still a meaningless near-wrap upper bound, so a
> malformed on-disk attribute with svcn == 0 and evcn near U64_MAX can pass
> mi_enum_attr() unrejected.
>
> VCN (virtual cluster number) is a cluster index, so any valid evcn is
> bounded by the volume's total cluster count, which ntfs3 holds in
> sbi->used.bitmap.nbits (set up in ntfs_init_from_boot() before any caller
> of mi_enum_attr() runs). Reject evcn values that fall outside this range.
>
> However, an empty non-resident attribute (no allocated clusters) is
> legitimately encoded with svcn == 0 and evcn == -1 (U64_MAX), e.g. via
> attr->nres.evcn = cpu_to_le64((u64)vcn - 1) with vcn == 0. That sentinel
> must keep passing, so exclude evcn == U64_MAX from the range check. The
> existing "svcn > evcn + 1" test still tolerates the sentinel ("0 > 0" is
> false) and continues to require svcn == 0 for it, while the range check
> rejects every other out-of-range evcn and thereby also defuses the
> "evcn + 1" wraparound.
>
> svcn does not need its own bound: once evcn < nbits, "svcn > evcn + 1"
> implies svcn <= nbits.
>
> Fixes: 013ff63b6494 ("fs/ntfs3: Add more attributes checks in mi_enum_attr()")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>   fs/ntfs3/record.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
> index 32bdb034c2a3..d6ca4ac35a45 100644
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
> @@ -310,8 +310,22 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
>   	if (t32 && le16_to_cpu(attr->name_off) + t32 > t16)
>   		goto out;
>   
> -	/* Check start/end vcn. */
> -	if (le64_to_cpu(attr->nres.svcn) > le64_to_cpu(attr->nres.evcn) + 1)
> +	/*
> +	 * Check start/end vcn.  svcn == 0 with evcn == -1 (U64_MAX) is the
> +	 * sentinel for an empty non-resident attribute (no allocated
> +	 * clusters) and must be accepted: "svcn > evcn + 1" tolerates it,
> +	 * since "(u64)-1 + 1" is 0 and "0 > 0" is false.
> +	 *
> +	 * For a non-empty attribute evcn is a cluster index and must lie
> +	 * within the volume (sbi->used.bitmap.nbits, set up in
> +	 * ntfs_init_from_boot() before any caller of mi_enum_attr() runs).
> +	 * Bounding evcn also prevents a malformed value close to U64_MAX
> +	 * from slipping through the near-wrap "evcn + 1" upper bound.
> +	 */
> +	svcn = le64_to_cpu(attr->nres.svcn);
> +	evcn = le64_to_cpu(attr->nres.evcn);
> +	if (svcn > evcn + 1 ||
> +	    (evcn != U64_MAX && evcn >= mi->sbi->used.bitmap.nbits))
>   		goto out;
>   
>   	data_size = le64_to_cpu(attr->nres.data_size);

Hello,

Sorry for the delay.
Your patch was applied, thanks.

Regards,
Konstantin

