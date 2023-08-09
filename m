Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E26124
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 07:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E09C433C9;
	Wed,  9 Aug 2023 07:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691566698;
	bh=/vk/CU1Gmo1hDzO1N776jRJsg42Jf+F322iPzlE/xpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNDPr5NE2BfdCP6gX4c6UBRNiveKPc6Xc2F07QqqLyCwho5fTTTnPTWfWAGeELiVJ
	 ZmZSOLnhOjHdA3E3D3CELry2nF56voTfALoVAViVuo0CsPIOmtG5DjDsyZXUuqmTG3
	 S/AkdEP5XHl6ATcWraR8ni/elBaVGdXNcOMxwvIEwv/fic3cLkmeOX8dyv+HfVvyzW
	 cLaAl6U+Y8+aYXDA+ahimmj1z2FR42JHknJ6UjI6ddQFrkRzij6I/Nu7ZNBCh+jf8k
	 7qUyw2vVesviLlPfK51DjxugtgV6528OOJX5Rkb7zQRqpE5GKa2uPxsD4ntAJ5FRX8
	 8yMYhiaZ849Aw==
Date: Wed, 9 Aug 2023 09:38:13 +0200
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
Subject: Re: [PATCH 03/13] xfs: free the mount in ->kill_sb
Message-ID: <20230809-besang-chaoten-642fff8a141a@brauner>
References: <20230808161600.1099516-1-hch@lst.de>
 <20230808161600.1099516-4-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808161600.1099516-4-hch@lst.de>

On Tue, Aug 08, 2023 at 09:15:50AM -0700, Christoph Hellwig wrote:
> As a rule of thumb everything allocated to the fs_context and moved into
> the super_block should be freed by ->kill_sb so that the teardown
> handling doesn't need to be duplicated between the fill_super error
> path and put_super.  Implement a XFS-specific kill_sb method to do that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>

For filesystems on the new mount api it's always nice if the rules
can simply be made:

* prior to sget_fc() succeeding fc->s_fs_info and freed in fs_context_operations->free()
* after    sget_fc() succeeding fc->s_fs_info transfered to sb->s_fs_info and freed in fs_type->kill_sb()
