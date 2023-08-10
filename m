Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7789200BC
	for <ntfs3@lists.linux.dev>; Thu, 10 Aug 2023 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4iv34Jlicm8ERgfuCQchf9NtIb+1wg4jn8mgeganSkw=; b=L1hTwuI4ffaX5rq3QUEQgoGoAL
	VM5KB4wwIPdD8Rt1W9cQ1FnjL+t9oScY/BajS3zzog2OmtRBaJZ5KHeWsv0SC0tLjAC0PxnRhuPNV
	+xQQJ9VBhEFys1RRSGJQjW96zphO5Tev3/izIfyJCrc3lEQJTZmgmo4mMvYFQY6KZu8FX4PZapK80
	B0A1FTNJuGFzm4bzTJBtYpH1rBpU1+5gh/UOUi+mQxxqs+Yh06Tnl7FRLx9G4/ANSGfMzTmdUtLfi
	s/p3/XuKAPy8PPAsIb3ZS9VqzlHxzZnvaNAXwjmOhg5GRxTTcq+ntVHvkey9beUb6xFK9SMPn86Vl
	DBkk71oQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qU7UN-00DEwa-NA; Thu, 10 Aug 2023 15:22:15 +0000
Date: Thu, 10 Aug 2023 16:22:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 07/13] xfs: document the invalidate_bdev call in
 invalidate_bdev
Message-ID: <ZNUAp8FJIKU1/sTn@casper.infradead.org>
References: <20230809220545.1308228-1-hch@lst.de>
 <20230809220545.1308228-8-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809220545.1308228-8-hch@lst.de>

On Wed, Aug 09, 2023 at 03:05:39PM -0700, Christoph Hellwig wrote:
> +	/*
> +	 * Udev is triggered whenever anyone closes a block device or unmounts
> +	 * a file systemm on a block device.
> +	 * The default udev rules invoke blkid to read the fs super and create
> +	 * symlinks to the bdev under /dev/disk.  For this, it uses buffered
> +	 * reads through the page cache.
> +	 *
> +	 * xfs_db also uses buffered reads to examine metadata.  There is no
> +	 * coordination between xfs_db and udev, which means that they can run
> +	 * concurrently.  Note there is no coordination between the kernel and
> +	 * blkid either.
> +	 *
> +	 * On a system with 64k pages, the page cache can cache the superblock
> +	 * and the root inode (and hence the root directory) with the same 64k
> +	 * page.  If udev spawns blkid after the mkfs and the system is busy
> +	 * enough that it is still running when xfs_db starts up, they'll both
> +	 * read from the same page in the pagecache.
> +	 *
> +	 * The unmount writes updated inode metadata to disk directly.  The XFS
> +	 * buffer cache does not use the bdev pagecache, nor does it invalidate
> +	 * the pagecache on umount.  If the above scenario occurs, the pagecache
> +	 * no longer reflects what's on disk, xfs_db reads the stale metadata,
> +	 * and fails to find /a.  Most of the time this succeeds because closing
> +	 * a bdev invalidates the page cache, but when processes race, everyone
> +	 * loses.
> +	 */
>  	if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp) {
>  		blkdev_issue_flush(mp->m_logdev_targp->bt_bdev);
>  		invalidate_bdev(mp->m_logdev_targp->bt_bdev);

While I have no complaints with this as a commit message, it's just too
verbose for an inline comment, IMO.  Something pithier and more generic
would seem appropriate.  How about:

	/*
	 * Prevent userspace (eg blkid or xfs_db) from seeing stale data.
	 * XFS is not coherent with the bdev's page cache.
	 */
