Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65872
	for <ntfs3@lists.linux.dev>; Mon, 16 Aug 2021 12:18:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B0EC36736F; Mon, 16 Aug 2021 14:17:52 +0200 (CEST)
Date: Mon, 16 Aug 2021 14:17:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Christoph Hellwig <hch@lst.de>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH 1/4] fs/ntfs3: Use new api for mounting
Message-ID: <20210816121752.GA16815@lst.de>
References: <20210816024703.107251-1-kari.argillander@gmail.com> <20210816024703.107251-2-kari.argillander@gmail.com> <20210816032351.yo7lkfrwsio3qvjw@kari-VirtualBox>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816032351.yo7lkfrwsio3qvjw@kari-VirtualBox>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 16, 2021 at 06:23:51AM +0300, Kari Argillander wrote:
> > Nls loading is changed a little bit because new api not have default
> > optioni for mount parameters. So we need to load nls table before and
> > change that if user specifie someting else.
> > 
> > Also try to use fsparam_flag_no as much as possible. This is just nice
> > little touch and is not mandatory but it should not make any harm. It
> > is just convenient that we can use example acl/noacl mount options.
>  
> I would like that if someone can comment can we do reconfigure so that
> we change mount options? Can we example change iocharset and be ok after
> that? I have look some other fs drivers and in my eyes it seems to be
> quite random if driver should let reconfigure all parameters. Right now
> code is that we can reconfigure every mount parameter but I do not know
> if this is right call.

Reconfiguring non-trivial mount parameters is hard.  In general I'd
recommend to only allow reconfiguring paramters that

 a) have user demand for that
 b) you know what you're actually doing.

Something like the iocharset clearly isn't something that makes sense
to be changed.
