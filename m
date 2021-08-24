Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D34E3FC0
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 11:16:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61DC2604AC;
	Tue, 24 Aug 2021 11:15:59 +0000 (UTC)
Date: Tue, 24 Aug 2021 13:15:56 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 6/6] fs/ntfs3: Rename mount option no_acl_rules >
 (no)acl_rules
Message-ID: <20210824111556.r5llbahswx2nwece@wittgenstein>
References: <20210819002633.689831-1-kari.argillander@gmail.com>
 <20210819002633.689831-7-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210819002633.689831-7-kari.argillander@gmail.com>

On Thu, Aug 19, 2021 at 03:26:33AM +0300, Kari Argillander wrote:
> Rename mount option no_acl_rules to noacl_rules. This allow us to use
> possibility to mount with options noacl_rules or acl_rules.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---

Looks good. Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
