Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341FC2F29
	for <ntfs3@lists.linux.dev>; Mon, 30 May 2022 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CDcaAuMv5xbKle4t8M30wTDvB6F60t1+L/wbusuMCys=; b=rKWheVX7xdxMLWkVO/3cDrJOBO
	TOJNQ5IHAqlqhVDr8m9txTjNDRm1nXqFy8l30X33/zzSalyCnyEEHkCY0KgiJgO1rQfs7Sc92jWpJ
	ADs5QCAwNthBXeQZZelfyNENRtQjSkQxW9tu9+tWEKd+CHw+7jBXPFEtOu6UgU2x4okOG6LVH+dW9
	loQBAhD1cLuMtshTCBWqc/slh2U1LXwN4aOzHgDbNQ9ygZPWy4Zo1rwSWq8D81MQ5yVwFFP2lfzrv
	v7J5P1++sDEovQddvJpRJzEx8Bew4FpfenUkDshx+Y6QSa14VlGry6dtSrp4xBT19ElcPmxCwrmlY
	booPWqlQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveLp-004SfM-2Y; Mon, 30 May 2022 12:18:25 +0000
Date: Mon, 30 May 2022 13:18:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: manualinux@yahoo.es,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] ntfs3: provide block_invalidate_folio to fix memory leak
Message-ID: <YpS2EX+lHkqaxh0d@casper.infradead.org>
References: <20220524075112.5438df32@yahoo.es>
 <alpine.LRH.2.02.2205240501130.17784@file01.intranet.prod.int.rdu2.redhat.com>
 <20220524113314.71fe17f0@yahoo.es>
 <20220525130538.38fd3d35@yahoo.es>
 <20220527072629.332b078d@yahoo.es>
 <20220527080211.15d631be@yahoo.es>
 <alpine.LRH.2.02.2205271338250.20527@file01.intranet.prod.int.rdu2.redhat.com>
 <20220528061836.22230f86@yahoo.es>
 <20220530131524.7fb5640d@yahoo.es>
 <alpine.LRH.2.02.2205300746310.21817@file01.intranet.prod.int.rdu2.redhat.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LRH.2.02.2205300746310.21817@file01.intranet.prod.int.rdu2.redhat.com>

On Mon, May 30, 2022 at 08:00:12AM -0400, Mikulas Patocka wrote:
> The ntfs3 filesystem lacks the 'invalidate_folio' method and it causes
> memory leak. If you write to the filesystem and then unmount it, the
> cached written data are not freed and they are permanently leaked.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Reported-by: José Luis Lara Carrascal <manualinux@yahoo.es>
> Fixes: 7ba13abbd31e ("fs: Turn block_invalidatepage into block_invalidate_folio")

That commit is innocent here.  Rather, this should be:

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")

Yes, trees before 7ba13abbd31e will need to change the patch to add
invalidate_page instead of invalidate_folio, but that's a normal part
of the process.

> Cc: stable@vger.kernel.org	# v5.18
> 
> ---
>  fs/ntfs3/inode.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux-2.6/fs/ntfs3/inode.c
> ===================================================================
> --- linux-2.6.orig/fs/ntfs3/inode.c	2022-05-16 16:57:24.000000000 +0200
> +++ linux-2.6/fs/ntfs3/inode.c	2022-05-30 13:36:45.000000000 +0200
> @@ -1951,6 +1951,7 @@ const struct address_space_operations nt
>  	.direct_IO	= ntfs_direct_IO,
>  	.bmap		= ntfs_bmap,
>  	.dirty_folio	= block_dirty_folio,
> +	.invalidate_folio = block_invalidate_folio,
>  };
>  
>  const struct address_space_operations ntfs_aops_cmpr = {

