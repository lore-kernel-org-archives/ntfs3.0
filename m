Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176244F546
	for <ntfs3@lists.linux.dev>; Mon, 21 Sep 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988098; cv=none; b=DPbZB4BkbC9KnbVdQqo2uCWZaRs82SHDOaMff2osvdISyY3SUvWfjjCATBFTLVL8fslSuAYkNai0U2ogQhLCHkWo4y8z5kpK4KguHuw9Ms0s32ft+fXrdaoEANRgHj8ZkYCJaImTtawRuAOqPeRlIoxKOgP7uMIl5lK3PnxZ/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988098; c=relaxed/simple;
	bh=dRY8IwZhEs1+Ar2MFnL9hmiJvRkNuXBgW2Vl1zqc0Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EqzDEXABZMxg1DNQQ4ItBDvlNmpPPBdGSXpa5UqUaFeaTeRJCCaYoKSO44kHO3kNgyHqsZttxE+r0RfihwXMb/58ye2Fu5+x78fv5TRtLWxwRXyFgWwpqNdCWlizw9sW5+GEOuFxZYQZ8B2nZ9E2nuOJ03wvtQ0HymqjdzOqQSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=GtI47jYH; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="GtI47jYH"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id A65EE1D09;
	Mon, 21 Sep 2026 10:55:49 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=GtI47jYH;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id D8B2A2135;
	Mon, 21 Sep 2026 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789988094;
	bh=JX1l3MfBxRBzk6AXL19n8+pZOqz1WcNL9sq8WmeEv8I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GtI47jYHTD9hNefZoBDVAWZBcVcnOEE8QWnDN+ROXrFtryK31R+38XjTENXU3TKaY
	 28iZOGBStvl3PgaE271WBL8i1W41bQdH+Uy0+2ldbf8LSXTZliit5QOQ84ZCbfIFRj
	 a/vf8y5gkvGxhXv5U+35TzDE63wWw4Q+PgaYpDkE=
Received: from [192.168.95.128] (172.30.20.147) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 21 Sep 2026 13:54:53 +0300
Message-ID: <ed325510-6c28-4954-9af9-83c327fd7cab@paragon-software.com>
Date: Mon, 21 Sep 2026 12:54:52 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ntfs3] fs/ntfs3: validate EA entry layout against ef->size
 in ntfs_read_ea
To: Xiang Mei <xmei5@asu.edu>, <ntfs3@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, Weiming Shi <bestswngs@gmail.com>
References: <20260703222333.94030-1-xmei5@asu.edu>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260703222333.94030-1-xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 7/4/26 00:23, Xiang Mei wrote:

> In ntfs_read_ea(), the ef->size branch only checks that the declared
> entry size fits the remaining buffer; unlike the zero-size branch it
> never verifies that the entry's own name and value fit inside ef->size.
> A crafted image can thus present an in-bounds ef->size with an arbitrary
> elength, which find_ea()/ntfs_get_ea() later use as the memcpy length,
> reading past the allocation and leaking adjacent heap memory:
>
>    BUG: KASAN: slab-out-of-bounds in ntfs_get_ea (fs/ntfs3/xattr.c:302)
>    Read of size 65535 at addr ffff888010770b0f by task exploit/142
>     ...
>     __asan_memcpy (mm/kasan/shadow.c:105)
>     ntfs_get_ea (fs/ntfs3/xattr.c:302)
>     ntfs_getxattr (fs/ntfs3/xattr.c:848)
>     __vfs_getxattr (fs/xattr.c:446)
>     vfs_getxattr (fs/xattr.c:479)
>     do_getxattr (fs/xattr.c:808)
>     filename_getxattr (fs/xattr.c:837)
>     path_getxattrat (fs/xattr.c:876)
>     do_syscall_64 (arch/x86/entry/syscall_64.c:94)
>    ...
>    The buggy address is located 15 bytes inside of
>     allocated 20-byte region, cache kmalloc-32
>
> Validate the name/value layout in the ef->size branch too, bounding it
> against ef->size, as the zero-size branch validates it against the
> buffer.
>
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
>   fs/ntfs3/xattr.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 04814dd29375..259d7f53b77b 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -155,6 +155,11 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
>   			ea_size = le32_to_cpu(ef->size);
>   			if (ea_size > bytes)
>   				goto out1;
> +			if (bytes < offsetof(struct EA_FULL, name))
> +				goto out1;
> +			if (struct_size(ef, name, 1 + ef->name_len +
> +					le16_to_cpu(ef->elength)) > ea_size)
> +				goto out1;
>   			continue;
>   		}
>   

Hello,

Sorry for the delay.
The patch was applied, thanks.

Regards,
Konstantin

