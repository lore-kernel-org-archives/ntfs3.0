Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604F7A
	for <ntfs3@lists.linux.dev>; Wed, 20 Apr 2022 04:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GOczIWAFowir8RwYCuJ+J5GuE0Dip4PeYPsVjWYY/9k=; b=Ou/rDodrUBXSf2UZ7FZvvpTtjt
	YgGhBzj5WEXWh1wgF+XO97fsJtzB9bEqxr8nl/T6ojZskInoMj7B7n1bC2UNYwUONCASotKRBgu2l
	49T3rh9dPEx95cKaizq9NjMWZRJl9UY59DO2RbVzwUBXCuWYKJsygB52kBSZDFPuQNHzs18JwnHKO
	Ez8OCCBeaxRrrdHzhtfVk4txw1WqqG3TJK0Sa7P/4hSPT36mSSyZZnXBvCsJfDLLEq0/vnYomg/XU
	wP2uJrBedgEbUq9ZsHEotJsuwpvZa/VEy/XClDW8kkkDWkslgKkyo1EuSNxHi4MDiv0PgWO3fjOAb
	EkHCLupQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh2Hh-007Lu8-Vn; Wed, 20 Apr 2022 04:49:46 +0000
Date: Tue, 19 Apr 2022 21:49:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Cc: linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-xfs@vger.kernel.org,
	viro@zeniv.linux.org.uk, david@fromorbit.com, djwong@kernel.org,
	brauner@kernel.org, jlayton@kernel.org, ntfs3@lists.linux.dev,
	chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v4 3/8] xfs: only call posix_acl_create under
 CONFIG_XFS_POSIX_ACL
Message-ID: <Yl+Q6a8ruNBkwLhr@infradead.org>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-3-git-send-email-xuyang2018.jy@fujitsu.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1650368834-2420-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

A nitpick in addition to the comments from Christian:  Please wrap
your commit messages after 73 characters.  The very long lines make them
rather unreadable.
