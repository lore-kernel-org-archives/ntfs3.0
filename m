Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4219768FC;
	Tue, 28 Jan 2025 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738044453; cv=none; b=bs2wdKQ7jIzvea8X79tp+a/CHFk5WxPvrQpVSEwwCdz36qyjgFiZL7H1WCrvZ+NWdcMeh4b0AE2lnGuBRkqZUe0HT9M+7AnLUunxThPjcR/pVn68MLvsyVRkzUm/kK7qrrSCmG/vjsHIl37OIcP4l/FedxgSBJRaxd1jB0slVLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738044453; c=relaxed/simple;
	bh=IeYQZc/EEOtPyqfsrKMwPAj14gg80CxV72WoXofifpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOkHNlokG0PTZv7LSRBkrRNScZ2dJ/wgQsYyc8IsDv0MS21pXSKjtMiHVwh5/LHbZlMFTMqY+8yzzCbCAuw9gSOVa4el0/Gp0Tz/nVXi++D44PNiV0VexhCo0dgVcknOc5Uf0Lflfd1lVqHKVajcTbRdpyRsqFIe47UbrA+rdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B9n24qoT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B9n24qoT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IeYQZc/EEOtPyqfsrKMwPAj14gg80CxV72WoXofifpI=; b=B9n24qoTNlThiDtAFh7JKkS8dl
	KJG8dXWYBRNiQ5H5bSW/2e6+Rt7RgZJjLJ9vnKypcZZ0wTJp51S+VUVp3CRPIeCIiZvF6Mhrr3aDe
	tbtIsAK0LbhY+hNp+FOsbmLJUsGvav8ijryJ+WsU/QR69ILlidqUa55Wk1Vh/88Mt1oBvRzpHtM+p
	PQ2gBbLR38ZVTyO5r2Xutk3Qly1PP666oERpL/qhH7upVnyqSsCrSObPRAb1coGdcz1/f4MSPYmij
	4wy1Yk4bgng1PdwKjOlp4N6cvMjuvrnsgysAvtz+HxUtDcNnDEWTa5J3z+BymgmBHxtn8AUohcCV5
	s+rFJ1pg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tcekz-00000004BtE-2hRf;
	Tue, 28 Jan 2025 06:07:29 +0000
Date: Mon, 27 Jan 2025 22:07:29 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
	Kun Hu <huk23@m.fudan.edu.cn>
Subject: Re: [PATCH] fs/ntfs3: Update inode->i_mapping->a_ops on compression
 state change
Message-ID: <Z5h0Ic3igEvI11Cz@infradead.org>
References: <20250123135335.15060-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123135335.15060-1-almaz.alexandrovich@paragon-software.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jan 23, 2025 at 04:53:35PM +0300, Konstantin Komarov wrote:
> Update inode->i_mapping->a_ops when the compression state changes to
> ensure correct address space operations.
> Clear ATTR_FLAG_SPARSED/FILE_ATTRIBUTE_SPARSE_FILE when enabling
> compression to prevent flag conflicts.

How is this synchronized against using the address_space ops?
Most of them can be called without i_rwsem held.
