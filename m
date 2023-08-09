Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DCF1B7D4
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 07:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81A2C433C7;
	Wed,  9 Aug 2023 07:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691566098;
	bh=9QTZ0PtmxByaIyvlMoxXgLmgqcW9x0ANh8QtQ48L7PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m5utP/plwwL5bDCafpCSeDReNmHjPgMzjdiFGApn3SX1nBi82MHw2HpABjFimRGR5
	 UZlZ+n8bpOppKio+IhsZl14xFLnaEly0AYVQlUHpUNJVvmyWT0Jg1vWISq6Sy0HN88
	 G9T4OpcPM4hyC30FGMT2PJAX+4vsdH632IKa4rqkQ6+4cCsLjyPPPsx68KUTACl4sz
	 9UruJth12z0VW3Wq0OHS1tl8nzOWjCBEw19DPa1C/zPoKSPY+u5hYDgeDHWHNrt2/X
	 db+LBPPMPH8QXGLKastumucL/Eb+e7PdoSR6+bpj9CNW9kdFl53ugiXaXIlVjoXmr5
	 A9NRyZRc6Sm8Q==
Date: Wed, 9 Aug 2023 09:28:13 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 02/13] xfs: remove a superflous s_fs_info NULL check in
 xfs_fs_put_super
Message-ID: <20230809-kickboxen-hohlraum-efb1991a7bc1@brauner>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-3-hch@lst.de>

On Tue, Aug 08, 2023 at 09:15:49AM -0700, Christoph Hellwig wrote:
> ->put_super is only called when sb->s_root is set, and thus when
> fill_super succeeds.  Thus drop the NULL check that can't happen in
> xfs_fs_put_super.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
