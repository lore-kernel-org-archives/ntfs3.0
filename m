Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2A7C
	for <ntfs3@lists.linux.dev>; Thu,  7 Jul 2022 04:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AbIgiz4HdWTHJrDcwgiMjNLozJ+fa1Um61VNXrTWXuw=; b=JLXuMSRapJzauQSgyJpNyTpYAj
	FHX1E3ZNecpiiGROvvfEp8SwwbAs3xM7y7Gtww8T317u7YSPOLnT7Om54pv+VxZCzOcBD9Wf617/U
	yOM3KkO/FIEZ72d73h5KUdTJADuM8/wuU5dGtUEIr5/LNK4TbRZbdy1IB+ApOtViLobIewkOar6fx
	R3cwAKogG84EkVmlNXr2awmyI///KOGitJJfgjGOjUVyoRiDbY1Blylwee9XOgx/Ql13EuncLaMeN
	BEww+BEZ9E4q+i0/JKMTPE9dGNbmok0FTBvCd/LTdoUoZvgdVi9X+x9JeWzH7MYTDSb8xYIOZYUSB
	ZG3eBhbw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9JLc-00DW1r-FB; Thu, 07 Jul 2022 04:42:40 +0000
Date: Wed, 6 Jul 2022 21:42:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/2] fs/ntfs3: Refactoring and improving logic in run_pack
Message-ID: <YsZkQAsKC6qxY8gi@infradead.org>
References: <d578fcbe-e1f7-ffc7-2535-52eecb271a01@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d578fcbe-e1f7-ffc7-2535-52eecb271a01@paragon-software.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi Konstantin,

now that you have time to actively work on the ntfs3 driver again, can
you consider looking into converting the I/O path to iomap, as already
request during the merge?  Getting drivers off the old buffer head based
I/O helpers is something we need to address in the coming years, so
any relatively simple and actually maintained file system would be a
good start.

On Wed, Jul 06, 2022 at 08:31:25PM +0300, Konstantin Komarov wrote:
> 2 patches:
> - some comments and making function static;
> - improving speed of run_pack by checking runs in advance
> 
> Konstantin Komarov (2):
>   fs/ntfs3: Added comments to frecord functions
>   fs/ntfs3: Check possible errors in run_pack in advance
> 
>  fs/ntfs3/bitmap.c  |  3 +--
>  fs/ntfs3/frecord.c |  8 ++++----
>  fs/ntfs3/ntfs_fs.h |  1 -
>  fs/ntfs3/run.c     | 41 +++++++++++++++++++++++------------------
>  4 files changed, 28 insertions(+), 25 deletions(-)
> 
> -- 
> 2.37.0
> 
---end quoted text---
