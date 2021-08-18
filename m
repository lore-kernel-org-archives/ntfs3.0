Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A42F80
	for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 05:23:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 819C267357; Wed, 18 Aug 2021 07:23:40 +0200 (CEST)
Date: Wed, 18 Aug 2021 07:23:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 0/3] fs/ntfs3: Use kernel alloc wrappers and fix
 warnings
Message-ID: <20210818052340.GA9053@lst.de>
References: <20210818010649.412912-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818010649.412912-1-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 18, 2021 at 04:06:46AM +0300, Kari Argillander wrote:
> In ntfs3 driver there is allocation made like this ntfs_malloc().
> Patch 2/3 will converter these to kernel ones like kmalloc(). After I
> did this then checkpatch raise warnings about array allocations so I
> fix these in patch 3/3.
> 
> I also notice when I made patch that there is broken utf8 char so I
> wanted first fix that because it raised some warning in my editor and
> did not want to "break" patch 2/3. So patch 1/3 address that. I did
> try to apply this and it seem to work without issues.

So this mostly looks sensible, but I still haven't actually seen
the codebase this applies to posted anywhere as far as I can tell.
