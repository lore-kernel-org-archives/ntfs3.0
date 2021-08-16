Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC20372
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 12:27:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C3DE96736F; Mon, 16 Aug 2021 14:27:21 +0200 (CEST)
Date: Mon, 16 Aug 2021 14:27:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: your mail
Message-ID: <20210816122721.GA17355@lst.de>
References: <20210816024703.107251-1-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816024703.107251-1-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 16, 2021 at 05:46:59AM +0300, Kari Argillander wrote:
> I would like really like to get fsparam_flag_no also for no_acs_rules
> but then we have to make new name for it. Other possibility is to
> modify mount api so it mount option can be no/no_. I think that would
> maybe be good change. 

I don't think adding another no_ alias is a good idea.  I'd suggest
to just rename the existing flag before the ntfs3 driver ever hits
mainline.
