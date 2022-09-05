Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531323AA
	for <ntfs3@lists.linux.dev>; Mon,  5 Sep 2022 05:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=ONUzWbeQWY+A+ipMdURSaJBzKq
	ONpaW4WtmPCUYEm0k7zA4rQ7uaIPJlvEjIHectIQ2U7TorP7uPj7SJl+7ZAwmdgJeaSi82S+vH5ZM
	BNiRZQLM4fnqQXIdh0CYTkWxF3TaXZIsob6xQm5aRh03pB8uLUiElfJslOvpZ5E5ULqBw2SxqTN2h
	x51WPoCfN+Qr96oyRUGpSQQIzPmqciu5wxaGW3Z3UkzTfF5wWC5RaERasHPn2EQu6PxIHE5ameRKw
	CJtKpTiNPEr3C1EP7GFQij1hdVR8U/Uq+SMny9VoBaYRClTSCjnFbnAyhR0k77/M9PfsiOSrwM9UL
	nF8BJf3w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV55y-00BdkD-My; Mon, 05 Sep 2022 05:56:30 +0000
Date: Sun, 4 Sep 2022 22:56:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu,
	akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk,
	rpeterso@redhat.com, agruenba@redhat.com,
	almaz.alexandrovich@paragon-software.com, mark@fasheh.com,
	dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com,
	yukuai3@huawei.com
Subject: Re: [PATCH v2 12/14] fs/buffer: remove ll_rw_block() helper
Message-ID: <YxWPjmoiYuRpAVkT@infradead.org>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-13-yi.zhang@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-13-yi.zhang@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
