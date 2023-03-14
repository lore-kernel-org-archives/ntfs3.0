Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0838F69
	for <ntfs3@lists.linux.dev>; Tue, 14 Mar 2023 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=H1QGXFGueBuHBkdVnY1gVNgWxdg/uqRKaISs/k4X5k8=; b=S7EeSUpGaZlBdHu4WUHAIdr25V
	ixFY7YsdAbe5O4aABq5JSzhjm6AQQEt3eXVPOFTCWjSNtDCgQFZErMmKupnpF9Y/4skbRxraN6HkX
	TqmDE1TcO5R6zBSPSKRc5doATbZgmLE4SGmmnROLttR98UmmdtbKjQjHzeTUwv1E1p/bjEoFFy+iH
	nyqmOOJUi5ry9SunSrF7pQBYspmk5uLVQJF6SmWk5LWJAeaLgy3Zr7wr5xxwd+hQMMwpvWD+yVxuy
	/CaVhXopsc+90LrYwApR0yOX/0l4LaCriYpzBh1LHFmzupT2UryDjtJai0v3ndjSU6zPsYceoZ+bh
	bp/MSRHg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pc5zT-00CzPv-OB; Tue, 14 Mar 2023 14:51:03 +0000
Date: Tue, 14 Mar 2023 14:51:03 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org, linux-afs@lists.infradead.org,
	ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, devel@lists.orangefs.org,
	reiserfs-devel@vger.kernel.org,
	Evgeniy Dushistov <dushistov@mail.ru>
Subject: RFC: Filesystem metadata in HIGHMEM
Message-ID: <ZBCJ11qT8AWGA9y8@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TLDR: I think we should rip out support for fs metadata in highmem

We want to support filesystems on devices with LBA size > PAGE_SIZE.
That's subtly different and slightly harder than fsblk size > PAGE_SIZE.
We can use large folios to read the blocks into, but reading/writing
the data in those folios is harder if it's in highmem.  The kmap family
of functions can only map a single page at a time (and changing that
is hard).  We could vmap, but that's slow and can't be used from atomic
context.  Working a single page at a time can be tricky (eg consider an
ext2 directory entry that spans a page boundary).

Many filesystems do not support having their metadata in highmem.
ext4 doesn't.  xfs doesn't.  f2fs doesn't.  afs, ceph, ext2, hfs,
minix, nfs, nilfs2, ntfs, ntfs3, ocfs2, orangefs, qnx6, reiserfs, sysv
and ufs do.

Originally, ext2 directories in the page cache were done by Al Viro
in 2001.  At that time, the important use-case was machines with tens of
gigabytes of highmem and ~800MB of lowmem.  Since then, the x86 systems
have gone to 64-bit and the only real uses for highmem are cheap systems
with ~8GB of memory total and 2-4GB of lowmem.  These systems really
don't need to keep directories in highmem; using highmem for file &
anon memory is enough to keep the system in balance.

So let's just rip out the ability to keep directories (and other fs
metadata) in highmem.  Many filesystems already don't support this,
and it makes supporting LBA size > PAGE_SIZE hard.

I'll turn this into an LSFMM topic if we don't reach resolution on the
mailing list, but I'm optimistic that everybody will just agree with
me ;-)
