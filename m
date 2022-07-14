Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737517C2
	for <ntfs3@lists.linux.dev>; Thu, 14 Jul 2022 04:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qV7WvqM3l1Qusr3KhngZJMatPE6l9LI2CEqxLIbX1mE=; b=0+42dBNeAU34+ipbmLsz0Iqxzp
	DOVgVeZxxlVrnld13iDfJGSaN6eL5gqla21qRpsvyFuUNwlapclu+iAbpULh6veeSGa6PpcENRuyS
	wuDEpqYINzkAoYwTs2QhK9w1QZcley2aFiK0A6UyRyqjRzajxQpo7jYRhkij6g95l6svub9CRs+0U
	W/L/JJAvrbsT8qpOuqh0TGfdJMDD7YUkNV3ciL4EP7HJ/Mj9Ar49BSqVR1fQHFxE+BdgwgloKfAPI
	0PUhKeE3YVc/KqRtU8PLwqVmL3ycZR7yNOHLcDx0ZJkCTpQjNoppcSDwI56N02wZixNtbzKe/QK4t
	0d714kZg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBqOd-00AbGq-D6; Thu, 14 Jul 2022 04:24:15 +0000
Date: Wed, 13 Jul 2022 21:24:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Christoph Hellwig <hch@infradead.org>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/2] fs/ntfs3: Refactoring and improving logic in run_pack
Message-ID: <Ys+abx3Au0p9pXmR@infradead.org>
References: <d578fcbe-e1f7-ffc7-2535-52eecb271a01@paragon-software.com>
 <YsZkQAsKC6qxY8gi@infradead.org>
 <c8b65567-6a4d-2e61-b2a0-3a757ae9b36c@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b65567-6a4d-2e61-b2a0-3a757ae9b36c@paragon-software.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jul 13, 2022 at 07:41:58PM +0300, Konstantin Komarov wrote:
> I will look into converting the I/O path to iomap.
> Thank you for reminding about it.

If you have any questions or need help feel free to contact me.
