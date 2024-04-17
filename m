Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151617166F;
	Wed, 17 Apr 2024 17:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713375155; cv=none; b=kqioai924Bc/hrbfUwilslRwaOyXIm+AzK7DeQnxzMAURdA0jr4gP4boxHD+5NtZS1PG26py1MeEGeqHrf+O2UzDVXZ2GoGyTEIi7NIAeoRkRlAZvXx8vqH4/b/7qbkW2uctdv9wGq56e6jcMvHukm7tXUlGVjdevvvmLNWePqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713375155; c=relaxed/simple;
	bh=YVXrtR2Et4haB/FkLEFHhKJVvjhdDPHgw8sByiDRsU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRI2SgI0QTKAx6o/+8pGQbdd7kd48KMKWeO2WGGtCjFQQnwu02RyJgH0qi/rRdoKP8xr3Ea2CU4x31Cg3z1L6B8m9QTC9tzJi0dgz2Bn6BYRgXcCpJL00HTRqc6+3UzJsSn05Lump1pEwaiSh5khC1hjbZjjyrglKod8kU18bLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=arD7QnF3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="arD7QnF3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ed52c9aGmouADGESdUxJRHegkOeZbADbxl3BqKiWlTM=; b=arD7QnF3lS2sZ8K3EpqINcR2a8
	4DngImSK6XVLk7OZ+z2sl4oOFfNFW1QpprhGunDQipMVWvOA5kQQ0PirWldL+Ku6mimK8tThlCNZ4
	2cBxdzLVnUiT89d4cAblHMB3X1kq2eho15B2KG1pRFYt1pTk6PUB+FSygW88VlZRV/r6o76jqdAR+
	vw4oCOZOuyvoC5e/9GiEh3PgiWR7NQ8Eqpskil/9lvykCuRQL2ZsHF/MXM8r1US3mR20PQ/SLrzsr
	5Qs8JBSawDZJJRAHSZ5dpvXiW+J5G/mAF9S4NuRZmcOp2uVOSZHIxzUIYiXlW2TsjMnsaFRajBmg7
	TTMLVrtQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx991-00000003OO9-2E1H;
	Wed, 17 Apr 2024 17:32:27 +0000
Date: Wed, 17 Apr 2024 18:32:27 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 08/10] ntfs3: Use a folio to read UpCase
Message-ID: <ZiAHq5cm-UwTZF1h@casper.infradead.org>
References: <20240417170941.797116-1-willy@infradead.org>
 <20240417170941.797116-9-willy@infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417170941.797116-9-willy@infradead.org>

On Wed, Apr 17, 2024 at 06:09:36PM +0100, Matthew Wilcox (Oracle) wrote:
> Add a memcpy_from_folio_le16() which does the byteswapping.
> This is now large folio safe and avoids kmap().

This patch is missing:

@@ -476,6 +476,7 @@ static inline void memcpy_from_folio_le16(u16 *to, struct folio *folio,
        do {
                const __le16 *from = kmap_local_folio(folio, offset);
                size_t chunk = len;
+               int i;

                if (folio_test_highmem(folio) &&
                    chunk > PAGE_SIZE - offset_in_page(offset))

I'll send a new version if needed, but I'll wait for other feedback
first.
