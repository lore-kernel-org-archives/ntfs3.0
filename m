Received: from mail.alarsen.net (mail.alarsen.net [144.76.18.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA093815C7
	for <ntfs3@lists.linux.dev>; Mon, 11 May 2026 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.18.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487621; cv=none; b=hx5xYXLsQz4eEiw7MwF/JQANzcMpL1g+4D7jWPOoyB4Vu2YYeqejBiWAS41bn6ZvqLboXNwwk/gSlrROFXC4xEZvhu/oD3DIhX4tzRTr3dxq5V7zrm0HfRj+w9smBQFSOONPpc5v9NPY2tU41vln1e7IQ+Wd9OTrmqs14EPMVz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487621; c=relaxed/simple;
	bh=tupWpp1Wr/DI+50gRTgVZY8E+35pNiscrazte+ahbsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oukGVCDRVwSd5zs+vRfsjBJ97483lV+Np8z6i2BNlJ6QalCvdgjzY35kEOBSJPyKLm7SbcA4IHoAo5ZbOBhILDSaaU8tTLvbat6YUmiRLm6GSGa0et4j1eII38kFuWimKcKnwP2hJnxaEFX3L28EJotld4lt9IRStVsErnrwzxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alarsen.net; spf=pass smtp.mailfrom=alarsen.net; dkim=pass (2048-bit key) header.d=alarsen.net header.i=@alarsen.net header.b=ZZSN9Lrs; arc=none smtp.client-ip=144.76.18.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alarsen.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alarsen.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alarsen.net header.i=@alarsen.net header.b="ZZSN9Lrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alarsen.net; s=joe;
	t=1778487605; bh=Q5o7BZ/IFYZCK+kK5yddBBzChwDObHCsyIubnxvYSmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZZSN9LrsVT7dohE8ai7eKJGMr5SuA7zH+HHwitlxs3JKuYJs7z2bHWxaN+bqvP81J
	 Dvq85yefYMYDdk+KvAenBO6Wy+EvHUCMM4mCn6gTYGotMWh704lwc01jKn/YO1O1Ob
	 NCkBoGPLcpSok9gU60MkR2V14aafG3leCjZIUKWe4xX7pzcsoxTGtJxEf24pe01bEw
	 1BzdyhwafvSPpu918XXxZuUXj9t6tXzb6UwmGMRz+L1C6QLSnt2OUXfFCGbVomQWCW
	 20YdrofoJObVueZ3kYKRDXaeMjGJJZ59XA18udJNZ6kWoy6fOEUQ5ANwEt9js3q7tT
	 Rk8hOuCEDMe3A==
Received: from oscar.alarsen.net (unknown [IPv6:fd8b:531:bccf:96:13c6:f483:161f:2523])
	by joe.alarsen.net (Postfix) with ESMTPS id CD261180276;
	Mon, 11 May 2026 10:20:05 +0200 (CEST)
Received: from oscar.localnet (localhost [IPv6:::1])
	by oscar.alarsen.net (Postfix) with ESMTP id BC291719;
	Mon, 11 May 2026 10:20:05 +0200 (CEST)
From: Anders Larsen <al@alarsen.net>
To: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Dave Kleikamp <shaggy@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Bob Copeland <me@bobcopeland.com>, linux-fsdevel@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev,
 linux-karma-devel@lists.sourceforge.net
Subject: Re: [PATCH 03/10] qnx4: handle set_blocksize failures
Date: Mon, 11 May 2026 10:20:05 +0200
Message-ID: <5102053.31r3eYUQgx@oscar>
In-Reply-To: <20260511074556.GA28186@lst.de>
References:
 <20260511071701.2456211-1-hch@lst.de> <12893675.O9o76ZdvQC@oscar>
 <20260511074556.GA28186@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On 2026-05-11 09:45 Christoph Hellwig wrote:
> On Mon, May 11, 2026 at 09:42:49AM +0200, Anders Larsen wrote:
> > On 2026-05-11 09:16 Christoph Hellwig wrote:
> > > qnx4 uses buffer_heads, which don't handle block size > PAGE_SIZE well.
> > 
> > qnx4fs uses a fixed block size of 512 bytes, so this will never happen.
> > 
> > > -	sb_set_blocksize(s, QNX4_BLOCK_SIZE);
> > > +	if (!sb_set_blocksize(s, QNX4_BLOCK_SIZE))
> > > +		return -EINVAL;
> > 
> > QNX4_BLOCK_SIZE is a constant (512)...
> 
> Yes, which means that sb_set_blocksize fails when the device has an LBA
> size larger than 512 bytes, and this failure should be handled.

OK, so I misunderstood the issue. In that case:

Acked-by: Anders Larsen <al@alarsen.net>


