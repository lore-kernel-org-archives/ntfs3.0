Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E705CB7
	for <ntfs3@lists.linux.dev>; Wed, 16 Nov 2022 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Q6luM+SmNEKniKa8/GmDPUoIwT2baxJOIJc5WvVRxyI=; b=KMx8CjHYGIQh1huF+Owr2OKfru
	EvXR6wccl8GwfPPvBesaNZgfDMtPkHWMcVafBxewvw5PSR1wrhnaE2YKEoONfchTzebVuDb+6TsVQ
	GV24OrKciQmXyLeccLZILVQwrWacWEdfI+z3CTR4CjEvytBaGGUtwD3T9tznHx8rwpTvB3IBoJT07
	Iil5bKhO2z8i68xG8nreSWD+wHiMEx0PWbVfaE+gUuzgJFbJnA5YJe/uG6hu+k+hbWuYkYLwMEfis
	qvKQEshBbth6FZ5rdQbZ7L970iVweCyVVXCZxWpFMfWY9Jjyt10OytY+BDOo/PT13Gq1RwF80wVoB
	9afXdl9Q==;
Received: from [2001:4bb8:191:2606:427:bb47:a3d:e0b8] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIZ5-003zcZ-Dh; Wed, 16 Nov 2022 13:34:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: remove ->writepage in ntfs3
Date: Wed, 16 Nov 2022 14:34:50 +0100
Message-Id: <20221116133452.2196640-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi Konstantin,

this small series removes the deprecated ->writepage method from ntfs3.
I don't have a ntfs test setup so this is untested and should be handled
with care.

Diffstat:
 inode.c |   33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)
