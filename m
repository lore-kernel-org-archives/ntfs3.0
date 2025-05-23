Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80B22A7E1
	for <ntfs3@lists.linux.dev>; Fri, 23 May 2025 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001504; cv=none; b=Q9ufZbcYwnDxnQjPS8ItEmCAN+J9lS72gUxXb3Uz+vYZpoWKE2edFIiqocvKnGJdIYrtwbpoUsjddETimEOyg5A9cjLtvqXsIu+xm4j2n9QyNP1UQTYo0m0+iwWBU3ul0uBKKrqi2A7gBu1iumwg7dYKiea1NRefORLUPkvQrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001504; c=relaxed/simple;
	bh=xAoiG/U7I6McdtxYVUqGpzn0nGDMMLv3aj9OwDFKm40=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=AezHd3LXgME9KmMY4gDD/yYr4nN4cbJsMlYOyXmYmM/SSg0Wrp9fmIqHZRKM+QVqNsAmkpsccQDEva5iiTvRoOji/DbhkY3u62E8IM9Ncc4qPgj9Xc0suULriYW+mkWLRRLAh7TFluStepRl5KmTRAdMk45jY8vQL7Azo1RoaFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=JHJT6w5h; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="JHJT6w5h"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 19FF31D21;
	Fri, 23 May 2025 11:57:58 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=JHJT6w5h;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id F23CA2095;
	Fri, 23 May 2025 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1748001494;
	bh=+hpZbVz33CApebXOuP1kPfp5LoLvF9fAiy4MFQhcwx8=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=JHJT6w5hD9ET6tqB7sFW5FvT702vDY6DKvmu9cKE+R606ZM4aBCS42y28Fjv/IZFS
	 +qb9s7xmaPl+qJ97mT1lhX841Qiat7DU+WC7INH5OcVPfxsc4zC6ShJU03tfQomfTa
	 WDx3muHBOkelPMdWplvo1bl6QRvlhPPAGfrrO4BU=
Received: from [192.168.95.128] (192.168.211.157) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 23 May 2025 14:58:13 +0300
Message-ID: <2c56b6a9-dfa0-474e-92fe-d6e7c578fe55@paragon-software.com>
Date: Fri, 23 May 2025 13:58:12 +0200
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: Re: [PATCH 2/3] ntfs3: Use folios more in ntfs_compress_write()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: <ntfs3@lists.linux.dev>, <linux-mm@kvack.org>, <viro@zeniv.linux.org.uk>,
	<linux-fsdevel@vger.kernel.org>, <hughd@google.com>,
	<akpm@linux-foundation.org>
References: <20250514170607.3000994-1-willy@infradead.org>
 <20250514170607.3000994-3-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250514170607.3000994-3-willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 5/14/25 19:06, Matthew Wilcox (Oracle) wrote:
> Remove the local 'page' variable and do everything in terms of folios.
> Removes the last user of copy_page_from_iter_atomic() and a hidden
> call to compound_head() in ClearPageDirty().
>
> Signed-off-by: Matthew Wilcox (Oracle)<willy@infradead.org>
> ---
>   fs/ntfs3/file.c | 31 +++++++++++++------------------
>   1 file changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 9b6a3f8d2e7c..bc6062e0668e 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -998,7 +998,8 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   	struct ntfs_inode *ni = ntfs_i(inode);
>   	u64 valid = ni->i_valid;
>   	struct ntfs_sb_info *sbi = ni->mi.sbi;
> -	struct page *page, **pages = NULL;
> +	struct page **pages = NULL;
> +	struct folio *folio;
>   	size_t written = 0;
>   	u8 frame_bits = NTFS_LZNT_CUNIT + sbi->cluster_bits;
>   	u32 frame_size = 1u << frame_bits;
> @@ -1008,7 +1009,6 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   	u64 frame_vbo;
>   	pgoff_t index;
>   	bool frame_uptodate;
> -	struct folio *folio;
>   
>   	if (frame_size < PAGE_SIZE) {
>   		/*
> @@ -1062,8 +1062,7 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   					    pages_per_frame);
>   			if (err) {
>   				for (ip = 0; ip < pages_per_frame; ip++) {
> -					page = pages[ip];
> -					folio = page_folio(page);
> +					folio = page_folio(pages[ip]);
>   					folio_unlock(folio);
>   					folio_put(folio);
>   				}
> @@ -1074,10 +1073,9 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   		ip = off >> PAGE_SHIFT;
>   		off = offset_in_page(valid);
>   		for (; ip < pages_per_frame; ip++, off = 0) {
> -			page = pages[ip];
> -			folio = page_folio(page);
> -			zero_user_segment(page, off, PAGE_SIZE);
> -			flush_dcache_page(page);
> +			folio = page_folio(pages[ip]);
> +			folio_zero_segment(folio, off, PAGE_SIZE);
> +			flush_dcache_folio(folio);
>   			folio_mark_uptodate(folio);
>   		}
>   
> @@ -1086,8 +1084,7 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   		ni_unlock(ni);
>   
>   		for (ip = 0; ip < pages_per_frame; ip++) {
> -			page = pages[ip];
> -			folio = page_folio(page);
> +			folio = page_folio(pages[ip]);
>   			folio_mark_uptodate(folio);
>   			folio_unlock(folio);
>   			folio_put(folio);
> @@ -1131,8 +1128,7 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   				if (err) {
>   					for (ip = 0; ip < pages_per_frame;
>   					     ip++) {
> -						page = pages[ip];
> -						folio = page_folio(page);
> +						folio = page_folio(pages[ip]);
>   						folio_unlock(folio);
>   						folio_put(folio);
>   					}
> @@ -1150,10 +1146,10 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   		for (;;) {
>   			size_t cp, tail = PAGE_SIZE - off;
>   
> -			page = pages[ip];
> -			cp = copy_page_from_iter_atomic(page, off,
> +			folio = page_folio(pages[ip]);
> +			cp = copy_folio_from_iter_atomic(folio, off,
>   							min(tail, bytes), from);
> -			flush_dcache_page(page);
> +			flush_dcache_folio(folio);
>   
>   			copied += cp;
>   			bytes -= cp;
> @@ -1173,9 +1169,8 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
>   		ni_unlock(ni);
>   
>   		for (ip = 0; ip < pages_per_frame; ip++) {
> -			page = pages[ip];
> -			ClearPageDirty(page);
> -			folio = page_folio(page);
> +			folio = page_folio(pages[ip]);
> +			folio_clear_dirty(folio);
>   			folio_mark_uptodate(folio);
>   			folio_unlock(folio);
>   			folio_put(folio);

The changes look fine. Feel free to add them.

