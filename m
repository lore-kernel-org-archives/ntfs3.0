Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9E2CA7
	for <ntfs3@lists.linux.dev>; Thu, 20 Jan 2022 08:40:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E093568AA6; Thu, 20 Jan 2022 09:34:07 +0100 (CET)
Date: Thu, 20 Jan 2022 09:34:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [PATCH 14/19] block: pass a block_device and opf to
 blk_next_bio
Message-ID: <20220120083407.GA5321@lst.de>
References: <20220118071952.1243143-1-hch@lst.de> <20220118071952.1243143-15-hch@lst.de> <245eaa0a-0796-0227-4abf-d1b78953557e@nvidia.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <245eaa0a-0796-0227-4abf-d1b78953557e@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jan 18, 2022 at 10:11:06PM +0000, Chaitanya Kulkarni wrote:
> On 1/17/22 11:19 PM, Christoph Hellwig wrote:
> > All callers need to set the block_device and operation, so lift that into
> > the common code.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> 
> I sent out the exact patch for this one, anyways looks good.
> 
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

I'll switch attribution to you.
