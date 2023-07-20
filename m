Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E119BA0
	for <ntfs3@lists.linux.dev>; Thu, 20 Jul 2023 17:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE7FC433C9;
	Thu, 20 Jul 2023 17:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689875753;
	bh=8ExOoz90a98hu/tVFV7YMCWDB9bUKvorprZfF6xc8eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLYqVKOc5qXZwtl+6KDbhLtEleHUYHCv36ksWkOS0D0HrwtaiL/Th/70gwjBlZjya
	 QPCRZsnDJ2DR57sY+Nb68/uo4oR2A33ol8vCgxvfX91pUh29Pr6xlZ/2W8jcB9w1j/
	 EoFWjv1w5lg/muYENBtdYyKOKdUSrBkuECBNv1H0=
Date: Thu, 20 Jul 2023 19:55:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: almaz.alexandrovich@paragon-software.com, stable@vger.kernel.org,
	ntfs3@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	van fantasy <g1042620637@gmail.com>
Subject: Re: [PATCH 1/1] fs/ntfs3: Check fields while reading
Message-ID: <2023072022-yahoo-pushy-2b86@gregkh>
References: <20230717125013.1246975-1-lee@kernel.org>
 <2023071733-basically-snub-5570@gregkh>
 <20230717174020.GE1082701@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717174020.GE1082701@google.com>

On Mon, Jul 17, 2023 at 06:40:20PM +0100, Lee Jones wrote:
> On Mon, 17 Jul 2023, Greg KH wrote:
> 
> > On Mon, Jul 17, 2023 at 01:50:13PM +0100, Lee Jones wrote:
> > > commit 0e8235d28f3a0e9eda9f02ff67ee566d5f42b66b upstream.
> > > 
> > > Added new functions index_hdr_check and index_buf_check.
> > > Now we check all stuff for correctness while reading from disk.
> > > Also fixed bug with stale nfs data.
> > > 
> > > Reported-by: van fantasy <g1042620637@gmail.com>
> > > Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> > > Fixes: 82cae269cfa95 ("fs/ntfs3: Add initialization of super block")
> > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > ---
> > 
> > What stable tree(s) is this for?
> 
> I thought you had tooling that used the Fixes: tag for this?

Yes, but that tells me how far back to take a patch, but not what a
hand-crafted backport should be applied to :)

Now queued up, thanks.

greg k-h
