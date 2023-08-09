Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0B1BB33
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 15:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE33C433CD;
	Wed,  9 Aug 2023 15:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691595539;
	bh=S1cxndqPMPZizABWybuviHR9Za3B8qEHUkT/adhUNp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfgzDKekEiX1K1Rnv1dfIlj8rMQ4LyHUDjltohYoYqI2e9Dydbf4hwLagpLhX3jUV
	 /1Oeh23YRteYE99F89J3wy71FL0EAN3qjjB5SrYEnJznkOKUWDNTgfh5JX9Ic4kOH8
	 Y+4Qqk70gd5yvgorthZ2yPjGsetdwf6NYMi3Ao5U3rhqopkFsY65sVppjmvub2epg+
	 nJrQu59+fM4rJn+Z7GEevqj+3V9oYI7XsKaHzvRWY3AFlREqOOc0NYgVS/KnU08go6
	 U20Ufa8JDqGTP9T6AGJVFEUVTj8G7HUJ3NhrYEUBP1psHR113FlO02UOmRTSdky1ZG
	 UcpcPVLwOAn9Q==
Date: Wed, 9 Aug 2023 08:38:59 -0700
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
Subject: Re: [PATCH 03/13] xfs: free the mount in ->kill_sb
Message-ID: <20230809153859.GR11352@frogsfrogsfrogs>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-4-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-4-hch@lst.de>

On Tue, Aug 08, 2023 at 09:15:50AM -0700, Christoph Hellwig wrote:
> As a rule of thumb everything allocated to the fs_context and moved into
> the super_block should be freed by ->kill_sb so that the teardown
> handling doesn't need to be duplicated between the fill_super error
> path and put_super.  Implement a XFS-specific kill_sb method to do that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_super.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 128f4a2924d49c..d2f3ae6ba8938b 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1143,9 +1143,6 @@ xfs_fs_put_super(
>  	xfs_destroy_percpu_counters(mp);
>  	xfs_destroy_mount_workqueues(mp);
>  	xfs_close_devices(mp);
> -
> -	sb->s_fs_info = NULL;
> -	xfs_mount_free(mp);
>  }
>  
>  static long
> @@ -1487,7 +1484,7 @@ xfs_fs_fill_super(
>  
>  	error = xfs_fs_validate_params(mp);
>  	if (error)
> -		goto out_free_names;
> +		return error;
>  
>  	sb_min_blocksize(sb, BBSIZE);
>  	sb->s_xattr = xfs_xattr_handlers;
> @@ -1514,7 +1511,7 @@ xfs_fs_fill_super(
>  
>  	error = xfs_open_devices(mp);
>  	if (error)
> -		goto out_free_names;
> +		return error;
>  
>  	error = xfs_init_mount_workqueues(mp);
>  	if (error)
> @@ -1734,9 +1731,6 @@ xfs_fs_fill_super(
>  	xfs_destroy_mount_workqueues(mp);
>   out_close_devices:
>  	xfs_close_devices(mp);
> - out_free_names:
> -	sb->s_fs_info = NULL;
> -	xfs_mount_free(mp);
>  	return error;
>  
>   out_unmount:
> @@ -1999,12 +1993,20 @@ static int xfs_init_fs_context(
>  	return 0;
>  }
>  
> +static void
> +xfs_kill_sb(
> +	struct super_block		*sb)
> +{
> +	kill_block_super(sb);
> +	xfs_mount_free(XFS_M(sb));
> +}
> +
>  static struct file_system_type xfs_fs_type = {
>  	.owner			= THIS_MODULE,
>  	.name			= "xfs",
>  	.init_fs_context	= xfs_init_fs_context,
>  	.parameters		= xfs_fs_parameters,
> -	.kill_sb		= kill_block_super,
> +	.kill_sb		= xfs_kill_sb,
>  	.fs_flags		= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
>  };
>  MODULE_ALIAS_FS("xfs");
> -- 
> 2.39.2
> 
