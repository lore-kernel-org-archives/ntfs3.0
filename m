Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E9168
	for <ntfs3@lists.linux.dev>; Wed, 25 Aug 2021 06:33:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 90E706736F; Wed, 25 Aug 2021 08:33:15 +0200 (CEST)
Date: Wed, 25 Aug 2021 08:33:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 1/3] fs/ntfs3: Restyle comment block in
 ni_parse_reparse()
Message-ID: <20210825063315.GA28148@lst.de>
References: <20210824183708.1008538-1-kari.argillander@gmail.com> <20210824183708.1008538-2-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824183708.1008538-2-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Aug 24, 2021 at 09:37:06PM +0300, Kari Argillander wrote:
> First of this fix one none utf8 char in this comment block. Maybe
> this happened because error in filesystem ;)
> 
> Also this block was hard to read because long lines so make it max 80
> long. And while we doing this stuff make little better grammer.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
