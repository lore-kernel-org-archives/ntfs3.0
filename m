Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A71A2F80
	for <ntfs3@lists.linux.dev>; Wed, 18 Aug 2021 05:33:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AED7067357; Wed, 18 Aug 2021 07:33:00 +0200 (CEST)
Date: Wed, 18 Aug 2021 07:33:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 1/3] fs/ntfs3: Fix one none utf8 char in source file
Message-ID: <20210818053300.GA9165@lst.de>
References: <20210818010649.412912-1-kari.argillander@gmail.com> <20210818010649.412912-2-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818010649.412912-2-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Aug 18, 2021 at 04:06:47AM +0300, Kari Argillander wrote:
> In one source file there is for some reason non utf8 char. But hey this
> is fs development so this kind of thing might happen.

Pleaese also refomat these comments while you're at it.  While going
over 80 characters is ok in exceptions for readability that is per
definition never the case for a block comment.
