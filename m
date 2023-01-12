Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF0378
	for <ntfs3@lists.linux.dev>; Thu, 12 Jan 2023 03:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9LInSOvBpIctyPHKBxYQ9qJKJNt5sNFXChqsuGuIhNU=; b=FXTK6o5kdhGJkVozW+5He0DFfB
	JRVOa5vdpFiB3n4pGNqNgwBgBEnZsy85RqlBPvOZ9tBJ7yLSTQ3ahSGZjCEuZtduNuQSzK84NmqYG
	6bCS4ABlYt4vEoQhc2a+Euf86HPvbU91iZxTrlvTqo7il7yLMhdhq8x8dp9Jqd8F6+B4zMnjYSbMX
	EQN9bx6AvG0wdv7Cd6pvLXvcEWpLGyUweEoQYoufTNof0IsN4zaRJjWL7Gr7lXb2DG9sTZJgJ+N9y
	iRC9CqGSfDpGSjjBJRM4jkqbfIMmL2Jy5+Y12vx+rzm/3Uu3kXr5B8Fa9xc9YavJ29JMfV2z06j0X
	PuX6s/RQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pFoV1-001Pgm-25;
	Thu, 12 Jan 2023 03:43:31 +0000
Date: Thu, 12 Jan 2023 03:43:31 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Peng Zhang <zhangpeng362@huawei.com>
Cc: almaz.alexandrovich@paragon-software.com, kari.argillander@gmail.com,
	akpm@linux-foundation.org, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, sunnanyong@huawei.com,
	wangkefeng.wang@huawei.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH -next] fs/ntfs3: Fix potential NULL/IS_ERR bug in
 ntfs_lookup()
Message-ID: <Y7+B40Mnnm7/rY+O@ZenIV>
References: <20230112013248.2464556-1-zhangpeng362@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112013248.2464556-1-zhangpeng362@huawei.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jan 12, 2023 at 01:32:48AM +0000, Peng Zhang wrote:
> From: ZhangPeng <zhangpeng362@huawei.com>
> 
> Dan Carpenter reported a Smatch static checker warning:
> 
> fs/ntfs3/namei.c:96 ntfs_lookup()
> error: potential NULL/IS_ERR bug 'inode'
> It will cause null-ptr-deref when dir_search_u() returns NULL if the
> file is not found.
> Fix this by replacing IS_ERR() with IS_ERR_OR_NULL() to add a check for
> NULL.

That's a bad approach - you are papering over bad calling conventions instead of
fixing them.

IS_ERR_OR_NULL is almost never the right tool.  Occasionally there are valid
cases for function possibly returning pointer/NULL/ERR_PTR(...); this is
almost certainly not one of those.

Incidentally, inodes with NULL ->i_op should never exist.  _Any_ place that
sets ->i_op to NULL is broken, plain and simple.  A new instance of struct
inode has ->i_op pointing to empty method table; it *is* initialized.
