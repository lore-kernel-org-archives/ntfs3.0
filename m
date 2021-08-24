Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E0729CA
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:18:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 321C86120A;
	Tue, 24 Aug 2021 11:17:58 +0000 (UTC)
Date: Tue, 24 Aug 2021 13:17:55 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 1/6] fs/ntfs3: Remove unnecesarry mount option noatime
Message-ID: <20210824111755.cuoou3cvnxvj4sac@wittgenstein>
References: <20210819002633.689831-1-kari.argillander@gmail.com>
 <20210819002633.689831-2-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210819002633.689831-2-kari.argillander@gmail.com>

On Thu, Aug 19, 2021 at 03:26:28AM +0300, Kari Argillander wrote:
> Remove unnecesarry mount option noatime because this will be handled
> by VFS. Our option parser will never get opt like this.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---

Looks good. Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
