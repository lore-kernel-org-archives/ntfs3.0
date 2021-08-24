Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0473FC1
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 08:03:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B6D9767373; Tue, 24 Aug 2021 10:03:02 +0200 (CEST)
Date: Tue, 24 Aug 2021 10:03:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v2 3/6] fs/ntfs3: Use new api for mounting
Message-ID: <20210824080302.GC26733@lst.de>
References: <20210819002633.689831-1-kari.argillander@gmail.com> <20210819002633.689831-4-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819002633.689831-4-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

> +	/*
> +	 * TODO: We should probably check some mount options does
> +	 * they all work after remount. Example can we really change
> +	 * nls. Remove this comment when all testing is done or
> +	 * even better xfstest is made for it.
> +	 */

Instead of the TODO I would suggest a prep patch to drop changing of
any options in remount before this one and then only add them back
as needed and tested.

The mechanics of the conversion look good to me.
