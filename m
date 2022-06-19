Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95837B
	for <ntfs3@lists.linux.dev>; Sun, 19 Jun 2022 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MxPhQC0Fi/1DMOZlvyotEXGMygrfYcYmw9BH/R1+BPA=; b=QxUVrca29bq4c4uLb+7FFVLG2P
	Wmb/5slT/qsVwGVkMPjkMDNMBEuUHLJWSjs5RmO+hqGaA7EIBqCDB6SEuHb2JEExze92T9tDpajFP
	N5NTd9C0ZN3PMXSUtOC4c6RnqZ2538DT+n+Q3egZDdZEJqQmQpaAyDjnqpZKVZy71Gy87pc3x3Ksi
	LsXw1WvDfjTKhr9e9mILVsy2C6LT7Wg54NqRURIhsU4nz9G4gWG2Iv8AcVocwPPabuxciOTaWSYEa
	coHrqTqoEeEJ6/yOAiayxV8QFPzMaMe5G8TyuCfLO9Xsn+MirVbHJfuUBARLa+C+HMSszkQd13xDS
	1XKZW8sw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2x7u-004S1a-9R; Sun, 19 Jun 2022 15:46:14 +0000
Date: Sun, 19 Jun 2022 16:46:14 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jan Kara <jack@suse.com>, Dave Kleikamp <shaggy@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	ntfs3@lists.linux.dev
Subject: Re: remove the nobh helpers v2
Message-ID: <Yq9ExtTRAx1fqORt@casper.infradead.org>
References: <20220613053715.2394147-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613053715.2394147-1-hch@lst.de>

On Mon, Jun 13, 2022 at 07:37:09AM +0200, Christoph Hellwig wrote:
> this series (against the pagecache for-next branch) removes the nobh
> helpers which are a variant of the "normal" buffer head helpers with
> special tradeoffs for machines with a lot of highmem, and thus rather
> obsolete.  They pass xfstests, or in case of jfs at least get as far
> as the baseline.

Thanks, applied & pushed out to the for-next branch.
