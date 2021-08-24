Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818283FC1
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 07:58:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 62FA567373; Tue, 24 Aug 2021 09:58:32 +0200 (CEST)
Date: Tue, 24 Aug 2021 09:58:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 1/6] fs/ntfs3: Remove unnecesarry mount option
 noatime
Message-ID: <20210824075832.GA26733@lst.de>
References: <20210819002633.689831-1-kari.argillander@gmail.com> <20210819002633.689831-2-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819002633.689831-2-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Aug 19, 2021 at 03:26:28AM +0300, Kari Argillander wrote:
> Remove unnecesarry mount option noatime because this will be handled
> by VFS. Our option parser will never get opt like this.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
