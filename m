Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0142DFF9
	for <ntfs3@lists.linux.dev>; Tue, 12 May 2026 06:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566137; cv=none; b=FU1+qFypJTySu7URq8Mcx2V/WlgNC6tbFbmqFGNSY7sWH6dpx4Lcyl6I2JqlJrV+x6LI/I1wOpTj+hTVnLffnzm5MgOnClEUlhx0lJl/16QpMiBNZEk7Q2S9BZ2VdCOjbpCcasrV5lDY8/6l1J8yMzgoCsXodBjTRclZcB/cObw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566137; c=relaxed/simple;
	bh=H7hmDRTTZVGUJ1wNAnKf8iKvjTauE7vnWgqTjjTknE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDozJMGxYjG//dxBXe/Hpe/A1h5hElII0xJ8jyPB0u8Yerj6ZefS8XcuIegib8GDmyhl+TRT4nSypCj7/UcQWnE9LLFQtvIYJCYgrez16Li/kX1xiF82ascREsyc/Wn1rXH4B5gpxGAMPWvrAsEAJ4zFzXKmtaT4WsFLFka6zjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6DE9C6732A; Tue, 12 May 2026 08:08:30 +0200 (CEST)
Date: Tue, 12 May 2026 08:08:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Dave Kleikamp <shaggy@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Bob Copeland <me@bobcopeland.com>, Anders Larsen <al@alarsen.net>,
	linux-fsdevel@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net
Subject: Re: [PATCH 08/10] minix: handle set_blocksize failures
Message-ID: <20260512060830.GB28955@lst.de>
References: <20260511071701.2456211-1-hch@lst.de> <20260511071701.2456211-9-hch@lst.de> <mxb2r7knst7hz2k454w6i7xy62kd6pyj6m2zqsaddkxqpzykxu@zqpqtbnigdp6>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mxb2r7knst7hz2k454w6i7xy62kd6pyj6m2zqsaddkxqpzykxu@zqpqtbnigdp6>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, May 11, 2026 at 06:08:18PM +0200, Jan Kara wrote:
> On Mon 11-05-26 09:16:53, Christoph Hellwig wrote:
> > minix uses buffer_heads, which don't handle block size > PAGE_SIZE well.
> > Without this, mounting we will hit the
> > 
> >         BUG_ON(offset >= folio_size(folio));
> > 
> > in folio_set_bh on the first __bread_gfp call.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/minix/inode.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/minix/inode.c b/fs/minix/inode.c
> > index 9c6bac248907..03a69b13950d 100644
> > --- a/fs/minix/inode.c
> > +++ b/fs/minix/inode.c
> > @@ -292,7 +292,8 @@ static int minix_fill_super(struct super_block *s, struct fs_context *fc)
> >  		sbi->s_namelen = 60;
> >  		sbi->s_version = MINIX_V3;
> >  		sbi->s_mount_state = MINIX_VALID_FS;
> > -		sb_set_blocksize(s, m3s->s_blocksize);
> > +		if (!sb_set_blocksize(s, m3s->s_blocksize))
> > +			goto out;
> 
> This should go to out_release AFAICT. Otherwise we leak the bh.

Yes.  Christian, do you want a resend or incremental patch?

