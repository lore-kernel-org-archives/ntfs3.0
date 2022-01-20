Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8382CA7
	for <ntfs3@lists.linux.dev>; Thu, 20 Jan 2022 08:37:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D6EFC68B05; Thu, 20 Jan 2022 09:37:46 +0100 (CET)
Date: Thu, 20 Jan 2022 09:37:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jinpu Wang <jinpu.wang@ionos.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	xen-devel@lists.xenproject.org, drbd-dev@lists.linbit.com
Subject: Re: [PATCH 10/19] rnbd-srv: simplify bio mapping in process_rdma
Message-ID: <20220120083746.GA5622@lst.de>
References: <20220118071952.1243143-1-hch@lst.de> <20220118071952.1243143-11-hch@lst.de> <CAMGffEmFZB1PPE09bfxQjKw-tJhdprEkF-OWrVF4Kjsf1OwQ_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMGffEmFZB1PPE09bfxQjKw-tJhdprEkF-OWrVF4Kjsf1OwQ_g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 19, 2022 at 01:20:54AM +0100, Jinpu Wang wrote:
> this changes lead to IO error all the time, because bio_add_page return len.
> We need  if (bio_add_page(bio, virt_to_page(data), datalen,
>                      offset_in_page(data)) < datalen)

Does this version look good to you?

http://git.infradead.org/users/hch/block.git/commitdiff/62adb08e765b889dd8db4227cad33a710e36d631
