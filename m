Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9591423AA
	for <ntfs3@lists.linux.dev>; Mon,  5 Sep 2022 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=Dx4iopb1PtT6m9CrW137HPiOVS
	crbUQf8yqcmt/1PtFRcr7I7wBcbpU4xWI8B9Thko4B7k/yPL//28+WWNnbi0qIwkb9+x0dYyTtqor
	EHmRCvlz92e/+6uAP4NSaexbWcHB/0IR/bf9+V0JhrrXQp4QjA0xwfqLmn+E5RyL+YodpfAbPbcC8
	kTn9m/ETUH7+V+7eBtg+grnEUJUdiXBE8tsv9N8kTFp9Zub6fL9bS+dG49pWi+CIWrRpes6NFNqmh
	5wtYcti13qP22WJT1wuqXSFeCpeZ63F9caOcrn2b2uc7mJiLb+Cs7LQT5DcdF5OWFQN/ds2YChhX1
	Xr3AhUYg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV52h-00BYHs-Jr; Mon, 05 Sep 2022 05:53:07 +0000
Date: Sun, 4 Sep 2022 22:53:07 -0700
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
Subject: Re: [PATCH v2 03/14] fs/buffer: replace ll_rw_block()
Message-ID: <YxWOw+Vt0K6qO3jF@infradead.org>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-4-yi.zhang@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-4-yi.zhang@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
