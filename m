Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FB663A2
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 07:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68ECC433C8;
	Wed,  9 Aug 2023 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691567720;
	bh=0+0+5RYWZQq4xxQCKgGM0US6Ugvd2dyjwVoA5wrJW9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZN22mju2skgy/wgAtRHQJdlm4siIO8NMVa68yMTF7zXF7jdFMT/uF7QR6a6YSUcQ
	 N0J95P8yshmpYa3f0bzhUFZT/x+GYwTZGPc+nWyG+ulvrzBveCFg0Wv1YdslQkv34h
	 KgcWDSMdZqphHiYdiNUhQVOTYkszXLexSACXwR8/3pvzo+K+WnpexAW1ZOf5ih8dGs
	 YVaSLWyKqLZmOu0ZN5CKKhyff0C7I+fCTc7C3Xz07imcsUI3Sr5PJEwpynw40m8QRS
	 TjVlyf/nffTGIAwET4CgaG2aab/8++pzVW49ySCEG8nQu2fK98hDPLewi57eq6cbsg
	 usP/dtwfD0aQg==
Date: Wed, 9 Aug 2023 09:55:15 +0200
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
Subject: Re: [PATCH 13/13] ntfs3: free the sbi in ->kill_sb
Message-ID: <20230809-serienweise-backpulver-5ca2915ea3cf@brauner>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-14-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-14-hch@lst.de>

On Tue, Aug 08, 2023 at 09:16:00AM -0700, Christoph Hellwig wrote:
> As a rule of thumb everything allocated to the fs_context and moved into
> the super_block should be freed by ->kill_sb so that the teardown
> handling doesn't need to be duplicated between the fill_super error
> path and put_super.  Implement an ntfs3-specific kill_sb method to do
> that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
