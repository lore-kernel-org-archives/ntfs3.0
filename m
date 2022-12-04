Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D6F7C
	for <ntfs3@lists.linux.dev>; Sun,  4 Dec 2022 08:17:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AA39768AFE; Sun,  4 Dec 2022 09:17:07 +0100 (CET)
Date: Sun, 4 Dec 2022 09:17:07 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: remove ->writepage in ntfs3
Message-ID: <20221204081707.GA26937@lst.de>
References: <20221116133452.2196640-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116133452.2196640-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 16, 2022 at 02:34:50PM +0100, Christoph Hellwig wrote:
> Hi Konstantin,
> 
> this small series removes the deprecated ->writepage method from ntfs3.
> I don't have a ntfs test setup so this is untested and should be handled
> with care.

Did you get a chance to look into this?
