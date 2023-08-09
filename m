Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B701AA83
	for <ntfs3@lists.linux.dev>; Wed,  9 Aug 2023 16:26:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1EBE56732D; Wed,  9 Aug 2023 18:26:30 +0200 (CEST)
Date: Wed, 9 Aug 2023 18:26:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-xfs@vger.kernel.org
Subject: Re: [PATCH 03/13] xfs: free the mount in ->kill_sb
Message-ID: <20230809162629.GA2582@lst.de>
References: <20230808161600.1099516-1-hch@lst.de> <20230808161600.1099516-4-hch@lst.de> <20230809-besang-chaoten-642fff8a141a@brauner>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809-besang-chaoten-642fff8a141a@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 09, 2023 at 09:38:13AM +0200, Christian Brauner wrote:
> For filesystems on the new mount api it's always nice if the rules
> can simply be made:
> 
> * prior to sget_fc() succeeding fc->s_fs_info and freed in fs_context_operations->free()
> * after    sget_fc() succeeding fc->s_fs_info transfered to sb->s_fs_info and freed in fs_type->kill_sb()

Yes.  I've been wanting to write this down somewhere, but I can't really
think of a good place.
