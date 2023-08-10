Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2CD1E1D2
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 16:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A4FC433C7;
	Thu, 10 Aug 2023 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691683235;
	bh=SnTvWH147pjh8XO7FWLaIusLvdcHI+OhJx0A+kSSEtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ut4ncq1JQ6is1Bvs2Jg6qeHrcQ4nxNxGoQ3485dz9JeLLC2EXCKapiCXlD8c3jGff
	 3vje/wv6u4mn9TroV3lB5LOSMUhuX1tMMlwdBq3fSGXs+LxbMJ0/cTN/fLyr2zWQ3J
	 /Y5mZLT1H5LkIJfiF3xHOyVEallcJpFwooeVnojsnbV+lnbo+aAcpmWrnNyrDGvzuf
	 c8kTIaQXnPkKSfkXSe5gBSyOKmBf+jl3UDYnkRjyrdsvIJITeNd1Tee1rqFt/K3C92
	 tfjAZdonVDOSDAtYVx/w4upcvTDggvSQSOAvAmt/GUmdNF8hUAOq383Qz2INHY8xmj
	 SNjXEPaTdHH+g==
Date: Thu, 10 Aug 2023 09:00:35 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Matthew Wilcox <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 07/13] xfs: document the invalidate_bdev call in
 invalidate_bdev
Message-ID: <20230810160035.GD11352@frogsfrogsfrogs>
References: <20230809220545.1308228-1-hch@lst.de>
 <20230809220545.1308228-8-hch@lst.de>
 <ZNUAp8FJIKU1/sTn@casper.infradead.org>
 <20230810155225.GD28000@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810155225.GD28000@lst.de>

On Thu, Aug 10, 2023 at 05:52:25PM +0200, Christoph Hellwig wrote:
> On Thu, Aug 10, 2023 at 04:22:15PM +0100, Matthew Wilcox wrote:
> > >  		blkdev_issue_flush(mp->m_logdev_targp->bt_bdev);
> > >  		invalidate_bdev(mp->m_logdev_targp->bt_bdev);
> > 
> > While I have no complaints with this as a commit message, it's just too
> > verbose for an inline comment, IMO.  Something pithier and more generic
> > would seem appropriate.  How about:
> > 
> > 	/*
> > 	 * Prevent userspace (eg blkid or xfs_db) from seeing stale data.
> > 	 * XFS is not coherent with the bdev's page cache.
> > 	 */
> 
> Well, this completely misses the point.  The point is that XFS should
> never have to invalidate the page cache because it's not using it,
> but it has to due to weird races.  I tried to condese the message but
> I could not come up with a good one that's not losing information.

Agreed -- it took me a while to set up an arm64 box with just the right
debugging info to figure out why certain fstests were flaky.  I do think
it's useful (despite my other reply to willy) to retain the defect
details for hard-to-reproduce errors, and the only way to do that
without encountering the dead url problem is to dump it in a huge
commit message or a comment.

(Too bad there's no way to have a commit whose code comments reference
the commit id of that commit to say "Hey, you need to read this commit
before you touch this line"...)

--D
