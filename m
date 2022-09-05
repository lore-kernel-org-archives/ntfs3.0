Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA5B23AA
	for <ntfs3@lists.linux.dev>; Mon,  5 Sep 2022 05:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=GHg5sVinfTggfGMJ3KSIyuI3Iy
	/YGrJm5c86HHbNO/9EqR5wdO2o8hf2t/UbRUCBJ5Bfab0/1Cg6NI9XJ8Bx2X2FcK3sjEaMnJsyEFZ
	xioV1RR4FEASiyHCUYhbcVQ05U5j3829eVMJI/YWj5yf+Io6HdktHXlECbT31vkidNFxPgNbAozXR
	+g8tszICkibzLudqggdy4KvjP6NatYzxnNEJUbkG2gtYSpgOBpE7o6XlbkhHR/5gP1OEORCoKsUUV
	neUeTCzIGxG4XqvXiCsgjTCsAFvDQrSTWVCxfT4tThAao3H9LOvo4uFIUNopDx8mcEXtDTJk7s7WI
	n+PQDD9g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV55k-00BdEs-DY; Mon, 05 Sep 2022 05:56:16 +0000
Date: Sun, 4 Sep 2022 22:56:16 -0700
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
Subject: Re: [PATCH v2 11/14] ufs: replace ll_rw_block()
Message-ID: <YxWPgAkLglG16ruo@infradead.org>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-12-yi.zhang@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-12-yi.zhang@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
