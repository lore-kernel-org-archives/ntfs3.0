Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837441867
	for <ntfs3@lists.linux.dev>; Fri,  8 Sep 2023 08:12:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CD94068B05; Fri,  8 Sep 2023 10:12:13 +0200 (CEST)
Date: Fri, 8 Sep 2023 10:12:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jan Kara <jack@suse.cz>,
	Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@lst.de>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev
Subject: Re: [PATCH] ntfs3: drop inode references in ntfs_put_super()
Message-ID: <20230908081213.GA8240@lst.de>
References: <20230907-vfs-ntfs3-kill_sb-v1-1-ef4397dd941d@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907-vfs-ntfs3-kill_sb-v1-1-ef4397dd941d@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Sep 07, 2023 at 06:03:40PM +0200, Christian Brauner wrote:
> Recently we moved most cleanup from ntfs_put_super() into
> ntfs3_kill_sb() as part of a bigger cleanup. This accidently also moved
> dropping inode references stashed in ntfs3's sb->s_fs_info from
> @sb->put_super() to @sb->kill_sb(). But generic_shutdown_super()
> verifies that there are no busy inodes past sb->put_super(). Fix this
> and disentangle dropping inode references from freeing @sb->s_fs_info.

Sorry for the delay, I've been travelling.  Wouldn't it make more
sense to just free it in ->kill_sb before calling kill_block_super?

Either way the fix looks good, and as Linus has already applied it
it's probably not worth arguing..

