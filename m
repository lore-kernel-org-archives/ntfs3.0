Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85E137775
	for <ntfs3@lists.linux.dev>; Mon, 16 Dec 2024 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362661; cv=none; b=bSw9ESN98gUsgaLewp5Gd0vNCrRMJOaFq5+3wfAc4qwyIPrBEXoo7V8/KSnd8NEzPe408imaJKz1eAq6WIJ2Kf+D4rEFm8bHauJdz9o38KQqW+9SGnTQqu51/Wk72ygFmHpQjklLxxFlO1h8xT78qu4XN5VsR8cLXTsHBjf7bKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362661; c=relaxed/simple;
	bh=3MaUvLlIckw4hvekMrRS1tyue4x6jLSHbQ76m6rRsQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8dKBdkz1jikF7AkvzmRZ1E6wPO1hYgW+LtYpSJVkSnOhC/O0Ym2u0X2TLasxo+zUrA66UgiCus02D/kL+3bQvtr0fqTlxf59wQcQFIpkYOp8JnAOgSpyB6G/+DbUqWOBvgpwkIuqjd4JQLlyA3lf66yrWpmf3w9X5pfSsbSRhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cPYhN5lH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cPYhN5lH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nesY+5UoTURBrQzkKhoYi6WC9uSHEA62BPEaYoCokZY=; b=cPYhN5lHUzre6V/5xPtrUROv72
	c+2wUIoJuhHznntrAlaqs6DZnlFJCP1/gsL3zGBxnKBRtlKig3UPfQADoHYTKUald2Pg5zU6zQgGf
	8rhr/bFF2Wq6604gnxSkBqA9b52RgUUQZSW7POxHpLHszluaam9mk+Nbv2H734QyzX9LQaJliE6cO
	uymmgDAkDddOqpVUi0/O7/EK3fGjWxtLTwYV8ZtR1HP1sDkpSvyPwCpLMBmO7U7Lw++hWUQJGJ4Xe
	fwQiEUWtc+JWaNM/vj9R4TZ+PiW5c1MxjHIZ8iqy5uBcuyOtheK/I/55Dj6RHhiqtMl8CXC2RrnVN
	0URf5WeQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCxF-0000000HQw1-2JYR;
	Mon, 16 Dec 2024 15:24:17 +0000
Date: Mon, 16 Dec 2024 15:24:17 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: [PATCH] ntfs3: Remove an access to page->index
Message-ID: <Z2BGIdCHXPLpgruv@casper.infradead.org>
References: <20241128194430.724278-1-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128194430.724278-1-willy@infradead.org>

On Thu, Nov 28, 2024 at 07:44:28PM +0000, Matthew Wilcox (Oracle) wrote:
> Convert the first page passed to ni_write_frame() to a folio and use
> folio_pos() on that instead of open-coding the access to folio->index,
> cast & shift.

Ping?  It's been two weeks, and this is not in linux-next 20241216

> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/ntfs3/frecord.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 8b39d0ce5f28..c57f0686b14b 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2726,9 +2726,10 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
>  {
>  	int err;
>  	struct ntfs_sb_info *sbi = ni->mi.sbi;
> +	struct folio *folio = page_folio(pages[0]);
>  	u8 frame_bits = NTFS_LZNT_CUNIT + sbi->cluster_bits;
>  	u32 frame_size = sbi->cluster_size << NTFS_LZNT_CUNIT;
> -	u64 frame_vbo = (u64)pages[0]->index << PAGE_SHIFT;
> +	u64 frame_vbo = folio_pos(folio);
>  	CLST frame = frame_vbo >> frame_bits;
>  	char *frame_ondisk = NULL;
>  	struct page **pages_disk = NULL;
> -- 
> 2.45.2
> 
