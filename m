Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB318AE4
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 16:17:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A3F316732D; Wed,  9 Aug 2023 18:17:45 +0200 (CEST)
Date: Wed, 9 Aug 2023 18:17:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 06/13] xfs: close the RT and log block devices in
 xfs_free_buftarg
Message-ID: <20230809161745.GB2346@lst.de>
References: <20230808161600.1099516-1-hch@lst.de> <20230808161600.1099516-7-hch@lst.de> <20230809154532.GT11352@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809154532.GT11352@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 09, 2023 at 08:45:32AM -0700, Darrick J. Wong wrote:
> >  	blkdev_issue_flush(btp->bt_bdev);
> >  	fs_put_dax(btp->bt_daxdev, btp->bt_mount);
> > +	/* the main block device is closed by kill_block_super */
> > +	if (bdev != btp->bt_mount->m_super->s_bdev)
> > +		blkdev_put(bdev, btp->bt_mount->m_super);
> 
> Hmm... I feel like this would be cleaner if the data dev buftarg could
> get its own refcount separate from super_block.s_bdev, but I looked
> through the code and couldn't identify a simple way to do that. Soo...

blkdev_put doesn't really drop a refcount, it closes the device.
It just happens to be misnamed, but Jan is looking into a series that
will as a side effect end up with a better name for this functionality.

