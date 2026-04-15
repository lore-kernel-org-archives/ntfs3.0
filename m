Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACFD381AE0
	for <ntfs3@lists.linux.dev>; Wed, 15 Apr 2026 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268296; cv=none; b=mRAbr09Fsvv8DaX83H7D5Jf25RJD5g0n2bFUw2yj7fVFwMo3VJFcacXZJvfVNblPTgChoVWpfLpovF9Mv+7BiGqd21PCkb7sIEI2Abkvg1Ex1jlYHg8aIJCtbmO1WfuRy8k3iJ76xf5uoNCKVWMTeHiMm6w89RiYsI8+bVM6QDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268296; c=relaxed/simple;
	bh=RClhJvdWVfRjO9xNhkCaABf7Wa8Wuo7drdU9JfdMLQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oFUpJuoU39JMzBbKc/OPtWVdrLruLz574mxbHzdWsH0RsXEi0e3i6uwwWpkN/jtVRaEO0VMYqAyqDvDQg5JVdr5XuJeiErE5GhsZPx+JlzVEGPX+gpMkirYWIMULwIlXt9sEJZttnUVUE2N3lJWtNDw7TDiQpfB2wWuuLukFImw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=iZQs+mHg; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="iZQs+mHg"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 6D8E91D3B;
	Wed, 15 Apr 2026 15:51:43 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=iZQs+mHg;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id A9C1A2135;
	Wed, 15 Apr 2026 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1776268292;
	bh=QA9Pp3ShuC5VhgvW90E0jXpSYoM9EKtLsYBR3JlKyHA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iZQs+mHgBiOmdkD2yj2bW8HvftOBMmBVrKHgNnbhb3flNXytaM3aXLCerF7YVlG+f
	 +tMDyxnXLqee+bJcoH8zEe86ZcatLhfw3PTl514Dxhv7WaIf8hgnRoNZ6fCfTa/CkZ
	 swEkE1iBydxKmUm2gdGNEYlI6ZbEtPXEaj+bahtE=
Received: from [192.168.95.128] (172.30.20.171) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 15 Apr 2026 18:51:31 +0300
Message-ID: <9b378fa5-58c8-4d24-8b0a-51526781eb95@paragon-software.com>
Date: Wed, 15 Apr 2026 17:51:30 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: validate rec->used in journal-replay file
 record check
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, stable <stable@kernel.org>
References: <2026040914-overbid-spherical-ac2e@gregkh>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <2026040914-overbid-spherical-ac2e@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 4/9/26 16:37, Greg Kroah-Hartman wrote:

> check_file_record() validates rec->total against the record size but
> never validates rec->used.  The do_action() journal-replay handlers read
> rec->used from disk and use it to compute memmove lengths:
>
>    DeleteAttribute:    memmove(attr, ..., used - asize - roff)
>    CreateAttribute:    memmove(..., attr, used - roff)
>    change_attr_size:   memmove(..., used - PtrOffset(rec, next))
>
> When rec->used is smaller than the offset of a validated attribute, or
> larger than the record size, these subtractions can underflow allowing
> us to copy huge amounts of memory in to a 4kb buffer, generally
> considered a bad idea overall.
>
> This requires a corrupted filesystem, which isn't a threat model the
> kernel really needs to worry about, but checking for such an obvious
> out-of-bounds value is good to keep things robust, especially on journal
> replay
>
> Fix this up by bounding rec->used correctly.
>
> This is much like commit b2bc7c44ed17 ("fs/ntfs3: Fix slab-out-of-bounds
> read in DeleteIndexEntryRoot") which checked different values in this
> same switch statement.
>
> Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
> Cc: stable <stable@kernel.org>
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   fs/ntfs3/fslog.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
> index 272e45276143..037df47fa9f3 100644
> --- a/fs/ntfs3/fslog.c
> +++ b/fs/ntfs3/fslog.c
> @@ -2791,13 +2791,14 @@ static inline bool check_file_record(const struct MFT_REC *rec,
>   	u16 fn = le16_to_cpu(rec->rhdr.fix_num);
>   	u16 ao = le16_to_cpu(rec->attr_off);
>   	u32 rs = sbi->record_size;
> +	u32 used = le32_to_cpu(rec->used);
>   
>   	/* Check the file record header for consistency. */
>   	if (rec->rhdr.sign != NTFS_FILE_SIGNATURE ||
>   	    fo > (SECTOR_SIZE - ((rs >> SECTOR_SHIFT) + 1) * sizeof(short)) ||
>   	    (fn - 1) * SECTOR_SIZE != rs || ao < MFTRECORD_FIXUP_OFFSET_1 ||
>   	    ao > sbi->record_size - SIZEOF_RESIDENT || !is_rec_inuse(rec) ||
> -	    le32_to_cpu(rec->total) != rs) {
> +	    le32_to_cpu(rec->total) != rs || used > rs || used < ao) {
>   		return false;
>   	}
>   
> @@ -2809,6 +2810,15 @@ static inline bool check_file_record(const struct MFT_REC *rec,
>   		return false;
>   	}
>   
> +	/*
> +	 * The do_action() handlers compute memmove lengths as
> +	 * "rec->used - <offset of validated attr>", which underflows when
> +	 * rec->used is smaller than the attribute walk reached.  At this
> +	 * point attr is the ATTR_END marker; rec->used must cover it.
> +	 */
> +	if (used < PtrOffset(rec, attr) + sizeof(attr->type))
> +		return false;
> +
>   	return true;
>   }
>   

Hello,

Thanks for the patch. Applied.

Regards,
Konstantin

