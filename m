Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C6E13FE6
	for <ntfs3@lists.linux.dev>; Tue,  8 Aug 2023 19:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B706C433C7;
	Tue,  8 Aug 2023 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691522006;
	bh=QDPcxrJ8Ef+vtoMZJz8g4uvudF1uWHklycP6enyXUio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVvTxCKQHffm3XiWOmGe2cvXzIYzwVYpLqmnnw62Y67G5XAEaX5l37yYdQPZGmgcH
	 8yHqOp6kow7HiNv5FboRtBcCdc/nDaIGNmY2vZt361jEq8RvZ26iLXE2yJPyL1LdCc
	 6lsjY/Bt8sWRJzbVS1EXyUkSPAPNDqgzAjRjXnIZ+WGMh0qoUbugnHZSJYR5zsfbEr
	 JKdeRvvMs0ibzCMpt7xtidpxHEzT+HYwwEEwKIfeZSscgGVwtwBeCKyH6Vqjki4Kul
	 mIuzBAveHjowb05zVAFbSPlUxdst0K0G+/CTXQk31ZyUiPYOOVFmDyeMd1t+0/Vv7O
	 AMCYeNtP4z+lQ==
Date: Tue, 8 Aug 2023 12:13:26 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 05/13] xfs: don't call invalidate_bdev in xfs_free_buftarg
Message-ID: <20230808191326.GP11377@frogsfrogsfrogs>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-6-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-6-hch@lst.de>

On Tue, Aug 08, 2023 at 09:15:52AM -0700, Christoph Hellwig wrote:
> XFS never uses the block device mapping, so there is no point in calling
> invalidate_bdev which invalidates said mapping.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This is a revert of commit 032e160305f68 ("xfs: invalidate block device
page cache during unmount").  How do you propose dealing with the block
device mapping being incoherent due to unmount write races so you don't
re-break my test system?

--D

> ---
>  fs/xfs/xfs_buf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index 15d1e5a7c2d340..83b8702030f71d 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -1944,7 +1944,6 @@ xfs_free_buftarg(
>  	list_lru_destroy(&btp->bt_lru);
>  
>  	blkdev_issue_flush(btp->bt_bdev);
> -	invalidate_bdev(btp->bt_bdev);
>  	fs_put_dax(btp->bt_daxdev, btp->bt_mount);
>  
>  	kmem_free(btp);
> -- 
> 2.39.2
> 
