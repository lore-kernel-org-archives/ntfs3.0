Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681693750CC
	for <ntfs3@lists.linux.dev>; Mon, 14 Sep 2026 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371327; cv=none; b=ZCBtF7qbohZvGZAy6cZmMNYyqSml0smc8PLPlI+0TcYBac7t1fxNIU3i7hDAtz4gDTQpcM5OVrhcqmHnLu2cd7xK4brXDDrUID7Bk4TvKJetKBgHuyx2BUhUY4utWZZbp5seFhWTr/QQ17mhBha+40uXXWy9VYBgTMiO+Bmd4hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371327; c=relaxed/simple;
	bh=mV+3/n81Aga/oqY6QcZ+Eip4gc2C/Yj1eGuHYXiXacQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oBGX4kMyz81PgvOBj6qxmeF2S2dpNatdSB9AjSPDblAQ/XARiVUa7n5nEEqTVKYn7wFqzHZvEIjEO/QBzHdWhyKdzLdyu2lC8jvvqC1UwK2a1D39TlwMZnS8J+3lMcalTy9Etz/XjxjAcHYOajgw/EM9QzK9G1oLgf6IV8sM428=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Ab/zMEZG; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Ab/zMEZG"
Received: from relayfre-01.paragon-software.com (relayfre-01.paragon-software.com [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id F3B411D26;
	Mon, 14 Sep 2026 07:36:13 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Ab/zMEZG;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id C3BFB219A;
	Mon, 14 Sep 2026 07:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1789371317;
	bh=40glmFPBGbv6F7Q4DBnK2xaPugUuyQlKOmv+6tAN5aY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ab/zMEZGcdgz8RC2zJWYvMwSITcmmAer3Prupvyev3a7PzrDVGjZpaxsPoiPwK+2e
	 L8hFIgvLvUTcS2l6rKZ/DOq89pTb/VDX/3CTu0noj/4mKctw+9mVDfTKCHyGeFOx0O
	 sf3RQFLndwcT1x2+65/wSZ3j68+rF3qXV9k2pGsk=
Received: from [192.168.95.128] (172.30.20.160) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 14 Sep 2026 10:35:16 +0300
Message-ID: <cbefc5b0-59e4-4706-8391-2657acc4541e@paragon-software.com>
Date: Mon, 14 Sep 2026 09:35:14 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/ntfs3: take run_lock when freeing offs_folio in
 ni_decompress_file
To: Weiming Shi <bestswngs@gmail.com>, <ntfs3@lists.linux.dev>
CC: Xiang Mei <xmei5@asu.edu>, <linux-kernel@vger.kernel.org>
References: <20260626102341.1909289-3-bestswngs@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260626102341.1909289-3-bestswngs@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 6/26/26 12:23, Weiming Shi wrote:

> attr_wof_frame_info() allocates, caches and dereferences
> ni->file.offs_folio under down_write(&ni->file.run_lock).
> ni_decompress_file() frees the same folio with folio_put() without
> taking run_lock. When a WOF externally-compressed file is opened for
> write, ni_decompress_file() can drop the last reference while a
> concurrent O_RDONLY reader is dereferencing the folio in
> attr_wof_frame_info(), leading to a use-after-free:
>
>   BUG: KASAN: use-after-free in attr_wof_frame_info (fs/ntfs3/attrib.c:1619)
>   Read of size 4 at addr ffff8880120c9000 by task exploit
>   Call Trace:
>    attr_wof_frame_info (fs/ntfs3/attrib.c:1619)
>    ni_read_frame (fs/ntfs3/frecord.c:2421)
>    ni_read_folio_cmpr (fs/ntfs3/frecord.c:1916)
>    ntfs_read_folio (fs/ntfs3/inode.c:648)
>    read_pages (mm/readahead.c:181)
>    page_cache_ra_unbounded (mm/readahead.c:292)
>    force_page_cache_ra (mm/readahead.c:364)
>    page_cache_sync_ra (mm/readahead.c:573)
>    filemap_get_pages (mm/filemap.c:2688)
>    filemap_read (mm/filemap.c:2806)
>    generic_file_read_iter (mm/filemap.c:2994)
>    ntfs_file_read_iter (fs/ntfs3/file.c:842)
>    vfs_read (fs/read_write.c:574)
>    __x64_sys_pread64 (fs/read_write.c:773)
>
> Take run_lock around the folio_put(), as is done for every other
> access to ni->file.offs_folio.
>
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   fs/ntfs3/frecord.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 2b49bc077558..b11961a1f8d8 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2148,10 +2148,13 @@ int ni_decompress_file(struct ntfs_inode *ni)
>   
>   	/* Clear cached flag. */
>   	ni->ni_flags &= ~NI_FLAG_COMPRESSED_MASK;
> +	/* offs_folio is accessed under run_lock in attr_wof_frame_info(). */
> +	down_write(&ni->file.run_lock);
>   	if (ni->file.offs_folio) {
>   		folio_put(ni->file.offs_folio);
>   		ni->file.offs_folio = NULL;
>   	}
> +	up_write(&ni->file.run_lock);
>   	mapping->a_ops = &ntfs_aops;
>   
>   out:

Hello,

Sorry for the delay.
Your patch is applied, thank you.

Regards,
Konstantin

