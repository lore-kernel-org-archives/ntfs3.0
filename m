Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F531117
	for <ntfs3@lists.linux.dev>; Fri, 11 Aug 2023 07:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37178C433C8;
	Fri, 11 Aug 2023 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691738689;
	bh=gn2WfJEZHOWAV3qHLFB1JfBTT0fLyhd0K6l80/kfy3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjRQqe610JNypA9abG8cVu+d/5OVCxyYLkOJDNVwq4SCyCpQtm9gBkPbruSkO4Smx
	 jL+41qMS2dZSV3LhHowNx5iao8vX3ezpobAjclhOgQ3fJUvh8wWLudkw53INkdLhvV
	 /3rY91pCJngQlx+938vTHdz7GYUqkzIqk5Wi6wghczOHLhalUQfqJFGwwIgs/BV/UB
	 /Lh19m3SkW9Z0tRdwphI/rPPtoTgUB2X62itNGwENKMez0Syq7h4jCtqfweoiWdNAY
	 0mZAPHVEFFtjRRNpaUiihyJjYRaBU/UzGW+He5o2Ae11qEDq+2UeTXTapj2ElnSKxU
	 BXIFYLumFrMVg==
Date: Fri, 11 Aug 2023 09:24:44 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 01/13] xfs: reformat the xfs_fs_free prototype
Message-ID: <20230811-leeren-garnelen-6153c9e68cff@brauner>
References: <20230809220545.1308228-1-hch@lst.de>
 <20230809220545.1308228-2-hch@lst.de>
 <20230810-unmerklich-grandios-281ae311e396@brauner>
 <20230810155116.GC28000@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810155116.GC28000@lst.de>

On Thu, Aug 10, 2023 at 05:51:16PM +0200, Christoph Hellwig wrote:
> I think the btrfs hunk (below) in "fs: use the super_block as holder when
> mounting file systems" needs to be dropped, as we dropped the prep patch

Ah yes, thanks!

> that allows to use the sb as a holder for now.  I'll add it to my resend
> of the btrfs conversion.

Dropped.
