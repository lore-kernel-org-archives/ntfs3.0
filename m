Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E01972
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 12:18:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id EA9DB68AFE; Mon, 16 Aug 2021 14:18:18 +0200 (CEST)
Date: Mon, 16 Aug 2021 14:18:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 2/4] fs/ntfs3: Remove unnecesarry mount option
 noatime
Message-ID: <20210816121818.GB16815@lst.de>
References: <20210816024703.107251-1-kari.argillander@gmail.com> <20210816024703.107251-3-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816024703.107251-3-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 16, 2021 at 05:47:01AM +0300, Kari Argillander wrote:
> Remove unnecesarry mount option noatime because this will be handled
> by VFS. Our function ntfs_parse_param will never get opt like
> this.

Looks good, but I'd move this to the front of your series.
