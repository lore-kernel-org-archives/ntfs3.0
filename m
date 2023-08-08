Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CA1B7D1
	for <ntfs3@lists.linux.dev>; Tue,  8 Aug 2023 16:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F79C433C7;
	Tue,  8 Aug 2023 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691513677;
	bh=T813JjphMtewVHJosf6QiGfL5FaDrRFvV4YXC23AuNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOhTJpEDd9+N5roNISEjkAckSG64c7MdII+qi7swOIK6ZCpgjPVd0FSwHQpPFMRy8
	 OX3Uq49lk5fzxMklDpo4HsC8DbuKgkmNxh8ceW+bq/w+ZAwM2g9ve1yOkE/2iuwlY/
	 XCsmAIC1kEATGu5MyR67tWPrs3nQycSLSa1sfiWq7WKnfPTVhaoGvZg+vD/jUQeCEc
	 PoEx8199hbJHTTFndqA4MNGdZqrTWMysjc1EizMdEKMdal6a0MJNRZnCVRTH1yoGt4
	 JBlSlBv3sqGSTOqfvqZhjiicEP2I0DfnOnWQUqAKxHuz+FBLcFiRQwNbc7WGeJ9SQj
	 jiTmjLg/EEwTQ==
Date: Tue, 8 Aug 2023 09:54:36 -0700
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
Subject: Re: [PATCH 01/13] xfs: reformat the xfs_fs_free prototype
Message-ID: <20230808165436.GO11377@frogsfrogsfrogs>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-2-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-2-hch@lst.de>

On Tue, Aug 08, 2023 at 09:15:48AM -0700, Christoph Hellwig wrote:
> The xfs_fs_free prototype formatting is a weird mix of the classic XFS
> style and the Linux style.  Fix it up to be consistent.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> ---
>  fs/xfs/xfs_super.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index bf6e0a261a49e6..0a294659c18972 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1933,7 +1933,8 @@ xfs_fs_reconfigure(
>  	return 0;
>  }
>  
> -static void xfs_fs_free(
> +static void
> +xfs_fs_free(
>  	struct fs_context	*fc)
>  {
>  	struct xfs_mount	*mp = fc->s_fs_info;
> -- 
> 2.39.2
> 
