Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EDD315765
	for <ntfs3@lists.linux.dev>; Tue, 19 Aug 2025 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755593878; cv=none; b=l6jFgRLQsjeEs96hx1j5ACGPkTRAXLOVYkE/gKEelX6a3196aozAHYaBnD6N8XRzycknALHUFMfGKwZhpfJ1pnSUYEyp7ny1DgNw/MaXYUHQiMNjP1AXwsOOi7SbwT3MDjnCy7RHNaRvo5/fHT9jFDsCNwAOZguOU6qsouj+CXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755593878; c=relaxed/simple;
	bh=rtBbqK17Bhj1BgB0FxPp9IjnxXNQh4jrV0zRyjJLAkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVKNdh+l2ewF4sxi/u4VpX2KsD7XMk0FvnPZJkKYHaS/uiNkwYfDkfdBnXFEtX25+GjLQsTA9OgOcRWxj6zlo/wVcnGK+Um1+HBzFYgWwI9+jYTfXlJq52HGuyJPSz512euCn99sB71kuCW/EdNZvQOqsJRO0a64xNG0zmJYlAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 12A5467373; Tue, 19 Aug 2025 10:57:52 +0200 (CEST)
Date: Tue, 19 Aug 2025 10:57:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Christoph Hellwig <hch@lst.de>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-bcachefs@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/3] bcachefs: stop using write_cache_pages
Message-ID: <20250819085751.GA4283@lst.de>
References: <20250818061017.1526853-1-hch@lst.de> <20250818061017.1526853-3-hch@lst.de> <3zji6rc56egwqvy2gy63aj2wjfo5pyeuq2iikhgudcttdcif2m@dphqqiozruka>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3zji6rc56egwqvy2gy63aj2wjfo5pyeuq2iikhgudcttdcif2m@dphqqiozruka>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 18, 2025 at 07:17:15AM -0400, Kent Overstreet wrote:
> On Mon, Aug 18, 2025 at 08:10:09AM +0200, Christoph Hellwig wrote:
> > Stop using the obsolete write_cache_pages and use writeback_iter
> > directly.  This basically just open codes write_cache_pages
> > without the indirect call, but there's probably ways to structure
> > the code even nicer as a follow on.
> 
> Wouldn't inlining write_cache_pages() achieve the same thing?

It might eliminate the indirect calls with the right compiler or
options, but not archieve any of the other goals, and leave us
with a helper implementing a pointless callback pattern for 1 user.

> > +
> > +	while ((folio = writeback_iter(mapping, wbc, folio, &error)))
> > +		error = __bch2_writepage(folio, wbc, data);
> > +	return error;
> > +}
> > +
> >  int bch2_writepages(struct address_space *mapping, struct writeback_control *wbc)
> >  {
> >  	struct bch_fs *c = mapping->host->i_sb->s_fs_info;
> > @@ -663,7 +674,7 @@ int bch2_writepages(struct address_space *mapping, struct writeback_control *wbc
> >  	bch2_inode_opts_get(&w->opts, c, &to_bch_ei(mapping->host)->ei_inode);
> >  
> >  	blk_start_plug(&w->plug);
> > -	int ret = write_cache_pages(mapping, wbc, __bch2_writepage, w);
> > +	int ret = bch2_write_cache_pages(mapping, wbc, w);
> >  	if (w->io)
> >  		bch2_writepage_do_io(w);
> >  	blk_finish_plug(&w->plug);
> > -- 
> > 2.47.2
> > 
---end quoted text---
