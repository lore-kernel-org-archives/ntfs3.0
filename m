Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D532C81
	for <ntfs3@lists.linux.dev>; Mon, 18 Oct 2021 17:18:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E094C68AFE; Mon, 18 Oct 2021 19:18:43 +0200 (CEST)
Date: Mon, 18 Oct 2021 19:18:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Theodore Ts'o <tytso@mit.edu>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Kees Cook <keescook@chromium.org>,
	Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
	reiserfs-devel@vger.kernel.org
Subject: Re: don't use ->bd_inode to access the block device size v3
Message-ID: <20211018171843.GA3338@lst.de>
References: <20211018101130.1838532-1-hch@lst.de> <4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Oct 18, 2021 at 11:16:08AM -0600, Jens Axboe wrote:
> This looks good to me. Followup question, as it's related - I've got a
> hacky patch that caches the inode size in the bdev:
> 
> https://git.kernel.dk/cgit/linux-block/commit/?h=perf-wip&id=c754951eb7193258c35a574bd1ccccb7c4946ee4
> 
> so we don't have to dip into the inode itself for the fast path. While
> it's obviously not something being proposed for inclusion right now, is
> there a world in which we can make something like that work?

There's just two places that update i_size for block devices:
set_capacity and bdev_set_nr_sectors.  So you just need to update
bd_nr_sectors there and you're done.
