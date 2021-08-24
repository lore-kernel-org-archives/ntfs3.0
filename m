Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194829CA
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 08:03:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 93E6867373; Tue, 24 Aug 2021 10:03:23 +0200 (CEST)
Date: Tue, 24 Aug 2021 10:03:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 4/6] fs/ntfs3: Make mount option nohidden more
 universal
Message-ID: <20210824080323.GD26733@lst.de>
References: <20210819002633.689831-1-kari.argillander@gmail.com> <20210819002633.689831-5-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819002633.689831-5-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Aug 19, 2021 at 03:26:31AM +0300, Kari Argillander wrote:
> If we call Opt_nohidden with just keyword hidden, then we can use
> hidden/nohidden when mounting. We already use this method for almoust
> all other parameters so it is just logical that this will use same
> method.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
