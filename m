Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5BA2D8DB0
	for <ntfs3@lists.linux.dev>; Tue, 24 Feb 2026 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959002; cv=none; b=XO0Os1auz0e6Hk42pAS6zpfxYlSaD5XAN8q4fLRt1Uc8gsXq4tG+E3CaomR6jBhR3BjxGcTxPtvzwpHzyMtLjB3sbT47GfXLdlOq4t0tW8bULu3eCJBKiI3pKMhV+VZpAhpBhPofLBI0fsvglrKksZDFhRYfl5Gykstdo88jDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959002; c=relaxed/simple;
	bh=DK1Ihs/sSiW8D0rTro7QkkOVlyo0zi6wPf4oMNFWOOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YsrWb9bdbc4iyn/Grr33BHA2V1nEGbBt2zKdhTvZdW9Xyhv9EiPh3mrki0VYezMI3Nl0yz3flLskQ+HYoJcVyj2OxWb7btwUtUXRYbFcQp/d5/lmknexgSwY38++ZFeKiEnXdTLsjqGlPQu9DT1MikBfJNwbYMSgpWPuxGuWxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=fKPoJFvE; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="fKPoJFvE"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id B36AE1D13;
	Tue, 24 Feb 2026 18:48:03 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=fKPoJFvE;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 1739421FB;
	Tue, 24 Feb 2026 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1771958992;
	bh=kkbGRle9sxD4ont0dLbVl78uCP3Afj4fFRNeCldugO0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fKPoJFvEApWJzKTk7MC0DANuG193pL9tvZ0ynBW6Bx7XPT5pmG3PiIVxpZW759rZO
	 C2vh/u0wEbW5VXDjZsCgPwotDUzKY1cqhWTtgAQ+f78Rs1dr4q0ihWHMBC6k0Dvl4B
	 udQjJpzmb9XctKhkt8OX8NVP8tSs/BDwy5K/HowM=
Received: from [192.168.95.128] (172.30.20.212) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 24 Feb 2026 21:49:50 +0300
Message-ID: <c26f5d0f-a1c9-4ea7-b4a2-f13bde367270@paragon-software.com>
Date: Tue, 24 Feb 2026 19:49:49 +0100
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/ntfs3: return folios from ntfs_lock_new_page()
To: Sun Jian <sun.jian.kdev@gmail.com>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <lkp@intel.com>
References: <20260205094934.10500-1-sun.jian.kdev@gmail.com>
 <20260207144552.2322468-1-sun.jian.kdev@gmail.com>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260207144552.2322468-1-sun.jian.kdev@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 2/7/26 15:45, Sun Jian wrote:

> ntfs_lock_new_page() currently returns a struct page * but it primarily
> operates on folios via __filemap_get_folio(). Convert it to return a
> struct folio * and use folio_alloc() + __folio_set_locked() for the
> temporary page used to avoid data corruption during decompression.
>
> When the cached folio is not uptodate, preserve the existing behavior by
> using folio_file_page() and converting the returned page back to a
> folio.
>
> Update ni_readpage_cmpr() and ni_decompress_file() to handle the new
> return type while keeping the existing struct page * array and the
> unlock_page()/put_page() cleanup paths unchanged.
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> v2:
>    - Fix build failure in ni_decompress_file() by switching the local
>      pointer to struct folio * (reported by kernel test robot).
>    - Reported-by: kernel test robot <lkp@intel.com>
>    - Closes: https://lore.kernel.org/oe-kbuild-all/202602072013.jwrURE2e-lkp@intel.com/
>    - Closes: https://lore.kernel.org/oe-kbuild-all/202602071921.nGIiI1J5-lkp@intel.com/
>
>   fs/ntfs3/frecord.c | 43 ++++++++++++++++++++++++-------------------
>   1 file changed, 24 insertions(+), 19 deletions(-)
>
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 641ddaf8d4a0..6169257cf784 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2022,27 +2022,31 @@ int ni_fiemap(struct ntfs_inode *ni, struct fiemap_extent_info *fieinfo,
>   	return err;
>   }
>   
> -static struct page *ntfs_lock_new_page(struct address_space *mapping,
> -		pgoff_t index, gfp_t gfp)
> +static struct folio *ntfs_lock_new_page(struct address_space *mapping,
> +					pgoff_t index, gfp_t gfp)
>   {
>   	struct folio *folio = __filemap_get_folio(mapping, index,
>   			FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
> -	struct page *page;
>   
>   	if (IS_ERR(folio))
> -		return ERR_CAST(folio);
> +		return folio;
>   
> -	if (!folio_test_uptodate(folio))
> -		return folio_file_page(folio, index);
> +	if (!folio_test_uptodate(folio)) {
> +		struct page *page = folio_file_page(folio, index);
> +
> +		if (IS_ERR(page))
> +			return ERR_CAST(page);
> +		return page_folio(page);
> +	}
>   
>   	/* Use a temporary page to avoid data corruption */
>   	folio_unlock(folio);
>   	folio_put(folio);
> -	page = alloc_page(gfp);
> -	if (!page)
> +	folio = folio_alloc(gfp, 0);
> +	if (!folio)
>   		return ERR_PTR(-ENOMEM);
> -	__SetPageLocked(page);
> -	return page;
> +	__folio_set_locked(folio);
> +	return folio;
>   }
>   
>   /*
> @@ -2064,6 +2068,7 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
>   	u32 i, idx, frame_size, pages_per_frame;
>   	gfp_t gfp_mask;
>   	struct page *pg;
> +	struct folio *f;
>   
>   	if (vbo >= i_size_read(&ni->vfs_inode)) {
>   		folio_zero_range(folio, 0, folio_size(folio));
> @@ -2099,12 +2104,12 @@ int ni_readpage_cmpr(struct ntfs_inode *ni, struct folio *folio)
>   		if (i == idx)
>   			continue;
>   
> -		pg = ntfs_lock_new_page(mapping, index, gfp_mask);
> -		if (IS_ERR(pg)) {
> -			err = PTR_ERR(pg);
> +		f = ntfs_lock_new_page(mapping, index, gfp_mask);
> +		if (IS_ERR(f)) {
> +			err = PTR_ERR(f);
>   			goto out1;
>   		}
> -		pages[i] = pg;
> +		pages[i] = &f->page;
>   	}
>   
>   	err = ni_read_frame(ni, frame_vbo, pages, pages_per_frame, 0);
> @@ -2190,18 +2195,18 @@ int ni_decompress_file(struct ntfs_inode *ni)
>   		}
>   
>   		for (i = 0; i < pages_per_frame; i++, index++) {
> -			struct page *pg;
> +			struct folio *f;
>   
> -			pg = ntfs_lock_new_page(mapping, index, gfp_mask);
> -			if (IS_ERR(pg)) {
> +			f = ntfs_lock_new_page(mapping, index, gfp_mask);
> +			if (IS_ERR(f)) {
>   				while (i--) {
>   					unlock_page(pages[i]);
>   					put_page(pages[i]);
>   				}
> -				err = PTR_ERR(pg);
> +				err = PTR_ERR(f);
>   				goto out;
>   			}
> -			pages[i] = pg;
> +			pages[i] = &f->page;
>   		}
>   
>   		err = ni_read_frame(ni, vbo, pages, pages_per_frame, 1);
>
> base-commit: 2687c848e57820651b9f69d30c4710f4219f7dbf

Hello,

Applied, thanks for the patch.

Regards,
Konstantin

