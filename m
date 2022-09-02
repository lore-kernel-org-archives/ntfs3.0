Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A13EA0
	for <ntfs3@lists.linux.dev>; Fri,  2 Sep 2022 00:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GX5ACSnHUYsKqlVKsOWkZfXxafThifKnGC34uwcAjqA=; b=DbYmmMXXFvXNfgDpO9j4482+k4
	Nz/X9ykWbPXR+tXPE74oUAJ0OHbE9QtvPBH0RB+KhOhadNfv/9vrgLGMZ9+wcWqW7VAXVhOOV75o3
	Lyp0DTiKeqdG5X5L/wcgq6AV2KQXb4YXndw/JP/Aa8QfHL/MY5TYTY5oBTXvdipUZI4bUozQSc62V
	G79pth6KqCUyuRd1yAmlYDzOefDPBD5+eWrkNtYFbHAmu/C5JyvgY4VkVrl2IKWqdL9t6r60x7975
	QXEarjETVKU4mXg3H7dYxd785+hlc7hbFdkioaIy61Ow0kOmryox7Ch1xu45qKOEIBiD7GapJh6M8
	S1/0C80A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.95 #2 (Red Hat Linux))
	id 1oTuZu-00BA5L-Bu;
	Fri, 02 Sep 2022 00:30:34 +0000
Date: Fri, 2 Sep 2022 01:30:34 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu,
	akpm@linux-foundation.org, axboe@kernel.dk, rpeterso@redhat.com,
	agruenba@redhat.com, almaz.alexandrovich@paragon-software.com,
	mark@fasheh.com, dushistov@mail.ru, hch@infradead.org,
	chengzhihao1@huawei.com, yukuai3@huawei.com
Subject: Re: [PATCH v2 13/14] ext2: replace bh_submit_read() helper with
 bh_read_locked()
Message-ID: <YxFOqimAyJNxuPM9@ZenIV>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-14-yi.zhang@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-14-yi.zhang@huawei.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Sep 01, 2022 at 09:35:04PM +0800, Zhang Yi wrote:
> bh_submit_read() and the uptodate check logic in bh_uptodate_or_lock()
> has been integrated in bh_read() helper, so switch to use it directly.

s/bh_read_locked/bh_read/ in the summary?
