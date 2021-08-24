Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C093FC0
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:17:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 282FE6120A;
	Tue, 24 Aug 2021 11:17:22 +0000 (UTC)
Date: Tue, 24 Aug 2021 13:17:20 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 2/6] fs/ntfs3: Remove unnecesarry remount flag handling
Message-ID: <20210824111720.jzg2cf32ag54dibk@wittgenstein>
References: <20210819002633.689831-1-kari.argillander@gmail.com>
 <20210819002633.689831-3-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210819002633.689831-3-kari.argillander@gmail.com>

On Thu, Aug 19, 2021 at 03:26:29AM +0300, Kari Argillander wrote:
> Remove unnecesarry remount flag handling. This does not do anything for
> this driver. We have already set SB_NODIRATIME when we fill super. Also
> noatime should be set from mount option. Now for some reson we try to
> set it when remounting.
> 
> Lazytime part looks like it is copied from f2fs and there is own mount
> parameter for it. That is why they use it. We do not set lazytime
> anywhere in our code. So basically this just blocks lazytime when
> remounting.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---

Sounds good. Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
