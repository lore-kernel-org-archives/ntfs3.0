Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1762F21
	for <ntfs3@lists.linux.dev>; Wed,  2 Feb 2022 14:26:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 192B268AFE; Wed,  2 Feb 2022 15:12:21 +0100 (CET)
Date: Wed, 2 Feb 2022 15:12:20 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: remove unnecessary NULL check
Message-ID: <20220202141220.GB24276@lst.de>
References: <20220128140922.GA29766@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128140922.GA29766@kili>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
