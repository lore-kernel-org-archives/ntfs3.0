Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189C2563
	for <ntfs3@lists.linux.dev>; Thu,  7 Apr 2022 15:27:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AE08468AFE; Thu,  7 Apr 2022 17:26:59 +0200 (CEST)
Date: Thu, 7 Apr 2022 17:26:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
Subject: Re: [PATCH 07/27] btrfs: use bdev_max_active_zones instead of open
 coding it
Message-ID: <20220407152659.GA15200@lst.de>
References: <20220406060516.409838-1-hch@lst.de> <20220406060516.409838-8-hch@lst.de> <20220407152049.GH15609@twin.jikos.cz>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407152049.GH15609@twin.jikos.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 07, 2022 at 05:20:49PM +0200, David Sterba wrote:
> On Wed, Apr 06, 2022 at 08:04:56AM +0200, Christoph Hellwig wrote:
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> As it's a standalone patch I can take it (possibly with other similar
> prep btrfs patches) in current development cycle to relieve the
> inter-tree dependencies.

Unless there's a conflict in other btrfs patches it would probably be
easiest to merge everything through the block tree.
