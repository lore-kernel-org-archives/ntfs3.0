Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634E2612D
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 15:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D215BC433C8;
	Wed,  9 Aug 2023 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691594962;
	bh=cFJwIe738mm8LLl2B6Xbs3kFw4rHn692G5TR86ypGJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XD+cZG+1UUrkGTM7zZOfsHjD1Gbto/HRg+3ZkinJGlo/rZXicwWnDqj9KR2VDGoGg
	 /fk5uSVaNjzGJ6mCs1kUKLG4lpEKQIh3NZ7LrUefwNwcnCQaWL4GgVOy9VJZrudz23
	 qWP9pK5IERNei1DDdfZYDlfHZ7/Juia+Gyrdko//TcW5D84pK3GBLJmTU5ghwOgcz+
	 wdtvFRJ3b1QZ3xNMoYc3r9HynXNiMu6vMJ4kIl9OyN6sXxXxL9I1nU8jjiJXhVLqdE
	 EY1mdhSYoPCyWP/yfME20Ln4rFHa5BDbXVr07CbGtmoO3XbuH/sVk3PapGUMroNsx3
	 dG2GRqVEDarrQ==
Date: Wed, 9 Aug 2023 08:29:22 -0700
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
Subject: Re: [PATCH 02/13] xfs: remove a superflous s_fs_info NULL check in
 xfs_fs_put_super
Message-ID: <20230809152922.GQ11352@frogsfrogsfrogs>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-3-hch@lst.de>

On Tue, Aug 08, 2023 at 09:15:49AM -0700, Christoph Hellwig wrote:
> ->put_super is only called when sb->s_root is set, and thus when
> fill_super succeeds.  Thus drop the NULL check that can't happen in
> xfs_fs_put_super.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Ahahaha, here's the /rest/ of the patchset.  I wondered if vger was
busted yesterday.  Carrying on...

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_super.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 0a294659c18972..128f4a2924d49c 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1132,10 +1132,6 @@ xfs_fs_put_super(
>  {
>  	struct xfs_mount	*mp = XFS_M(sb);
>  
> -	/* if ->fill_super failed, we have no mount to tear down */
> -	if (!sb->s_fs_info)
> -		return;
> -
>  	xfs_notice(mp, "Unmounting Filesystem %pU", &mp->m_sb.sb_uuid);
>  	xfs_filestream_unmount(mp);
>  	xfs_unmountfs(mp);
> -- 
> 2.39.2
> 
