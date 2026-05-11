Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FD53A1696
	for <ntfs3@lists.linux.dev>; Mon, 11 May 2026 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485573; cv=none; b=sfFrLYycR4YcPIG+qEvSwvvns5i6HBzfc4bFEh8K4lZMZGi0I0ocQva230VEM5P/roCdP0MnKIH/wbnMCADf9Q7tIjKzSAQltzsXnVGz0IT+KSn6ZQiJ8PRztgb6orPqG4g40qtnizoO/FWYT0YX8qVktMo+wC4Fa7Nmcndj8IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485573; c=relaxed/simple;
	bh=Qi+7EVfG8K0aBJnJx9/PolqsHmenpN18TD13bthhgCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNkusjHaR0tmgAhWY+P/algM3yhuSVjjtNyp5c2PT5ujXgKsWWlBO+2XLmGtbVs25RvX1VqUyoDHN7tamNkxLY+3HTGoqQd717w4HzFYqbAXNuOrcER1Y3zCs8CuR1dUnd9/UxyMVBONDETyDV9PVrYm9pf83BTNjUw5mscIN9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 91D7968BEB; Mon, 11 May 2026 09:45:56 +0200 (CEST)
Date: Mon, 11 May 2026 09:45:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anders Larsen <al@alarsen.net>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	David Sterba <dsterba@suse.com>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Dave Kleikamp <shaggy@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Bob Copeland <me@bobcopeland.com>, linux-fsdevel@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev,
	linux-karma-devel@lists.sourceforge.net
Subject: Re: [PATCH 03/10] qnx4: handle set_blocksize failures
Message-ID: <20260511074556.GA28186@lst.de>
References: <20260511071701.2456211-1-hch@lst.de> <20260511071701.2456211-4-hch@lst.de> <12893675.O9o76ZdvQC@oscar>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12893675.O9o76ZdvQC@oscar>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, May 11, 2026 at 09:42:49AM +0200, Anders Larsen wrote:
> Hi,
> 
> On 2026-05-11 09:16 Christoph Hellwig wrote:
> > qnx4 uses buffer_heads, which don't handle block size > PAGE_SIZE well.
> 
> qnx4fs uses a fixed block size of 512 bytes, so this will never happen.
> 
> > -	sb_set_blocksize(s, QNX4_BLOCK_SIZE);
> > +	if (!sb_set_blocksize(s, QNX4_BLOCK_SIZE))
> > +		return -EINVAL;
> 
> QNX4_BLOCK_SIZE is a constant (512)...

Yes, which means that sb_set_blocksize fails when the device has an LBA
size larger than 512 bytes, and this failure should be handled.

