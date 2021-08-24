Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA029CA
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 08:04:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AFA4967373; Tue, 24 Aug 2021 10:04:54 +0200 (CEST)
Date: Tue, 24 Aug 2021 10:04:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 3/3] fs/ntfs3: Use kcalloc/kmalloc_array over
 kzalloc/kmalloc
Message-ID: <20210824080454.GG26733@lst.de>
References: <20210818010649.412912-1-kari.argillander@gmail.com> <20210818010649.412912-4-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818010649.412912-4-kari.argillander@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
