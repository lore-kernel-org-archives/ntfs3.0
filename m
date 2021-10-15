Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20942C80
	for <ntfs3@lists.linux.dev>; Fri, 15 Oct 2021 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KanmlaFBwV6DRdQ41vIsGhe17Tn0ouHRuztKUsQZtZ0=; b=Sp0mzcOz6fCy6w+SFxvFJT113O
	5glduGFb7LrPQcGlbPxTVXMdHUuiHlqKZMAdoOUuvr7VmdXF1ZROQXYx/SURx8NNGczFxd78OKEWX
	g1EVnRcaMy66kxGA0Ycz2sVxG+Jq6Xakmu96RSvhrCic177Aboi4kmhdgF1+i/MmTps4PefQxR1U9
	R0lWGSxbM9vlrOVzh3s4+nOS+3Fdq1Tv3nAaot4M9Z7iIxha6Lnwv+o1M6OB/txkN3fli+COyWBGO
	MCf3+V04TrhkegQ0Jg+SGb+t7IWveuPWDgrPUju8wVNJF/jSdrYZ56qZJb0uP40KoBw/AcVk6NLsV
	0KeMg3+w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNMh-0092n0-E6; Fri, 15 Oct 2021 13:35:28 +0000
Date: Fri, 15 Oct 2021 14:35:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
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
Subject: Re: [PATCH 02/30] block: add a bdev_nr_bytes helper
Message-ID: <YWmDk8YQKVPRGBfR@casper.infradead.org>
References: <20211015132643.1621913-1-hch@lst.de>
 <20211015132643.1621913-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-3-hch@lst.de>

On Fri, Oct 15, 2021 at 03:26:15PM +0200, Christoph Hellwig wrote:
> +static inline sector_t bdev_nr_bytes(struct block_device *bdev)
> +{
> +	return i_size_read(bdev->bd_inode);

Uh.  loff_t, surely?
