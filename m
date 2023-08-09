Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA1D63A2
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 07:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D08C433C7;
	Wed,  9 Aug 2023 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691567797;
	bh=WQY/j1wRlLAF1gay3G00GCSxD4stoAKq0BiMQO5p9rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPCXNYecxQuiNJQEnEQp8yZaYu6iJySRdexI4jSuar+507/Y46g2iiu+kLfQa45mK
	 T4GS+HU3tCfK0GuK5wsMw7nlsRzIgFgNOvH7tOwAFh/mRziRkxp/YgOUNN5hmE75qH
	 qV5YEAnEboRMAqKP9/HNp84UdqdOaB/k/G/0O87YC4QRd5EC1eDLsmVQ54ib6IqPzM
	 QxmZ5BmRDceLYLky88vlnCKQEKJI7Qgwz/bXxxvRhMYUppadwcV6UCX+gvfme2xjP1
	 m00ieueVSYJxe//aR9ihwdqEA95gko1caNgKGEd3OZ6CiLHREO/XSlmfcPYKLMRqua
	 W+Hj8yMKH6OVg==
Date: Wed, 9 Aug 2023 09:56:31 +0200
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
Subject: Re: [PATCH 11/13] ntfs3: rename put_ntfs ntfs3_free_sbi
Message-ID: <20230809-ausziehen-melken-be7ae49e204f@brauner>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-12-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-12-hch@lst.de>

On Tue, Aug 08, 2023 at 09:15:58AM -0700, Christoph Hellwig wrote:
> put_ntfs is a rather unconventional name for a function that frees the
> sbi and associated resources.  Give it a more descriptive name and drop
> the duplicate name in the top of the function comment.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
