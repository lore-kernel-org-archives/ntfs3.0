Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCC372
	for <ntfs3@lists.linux.dev>; Wed,  8 Sep 2021 19:11:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FABE610A3;
	Wed,  8 Sep 2021 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631128291;
	bh=z31e8qSY4Nh9Jkp6SWIDwkT4uIWfqkLETf3pT4/bx0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRYCXCHM0R/Y/qqIMdM08fitpL0+40AGIx2weEqYXZRWoFingxS3Ok3mxOH4Jg+tj
	 kBCOZPbK5nDh8R7NUKLPgcxrOxXOlGHtBuUsn/j62NEVl7kUId4RV4+DxvUtd516Qw
	 dENGbf1ieQiLPcTyZlkubolNbI9xcEZuW8kQQGp7lRC61kB3vZ1Fa1mYzl4mGvFhHq
	 ewtq+D2A2q0lg0psHJ0xbAQ0fKeIjXO812zIcYvk1lkgqswOXupq25y1GFpUVVM6IJ
	 rASE28VhKdUwjym+JS/bQ2UKDYnwqOcKIwCA2fIig5dGgOeEfFXEH0hBE4NutpRjix
	 7i7fcgV/gSdsQ==
Received: by pali.im (Postfix)
	id 873CB708; Wed,  8 Sep 2021 21:11:29 +0200 (CEST)
Date: Wed, 8 Sep 2021 21:11:29 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH v4 6/9] fs/ntfs3: Make mount option nohidden more
 universal
Message-ID: <20210908191129.t43r3z275rtpkpbn@pali>
References: <20210907153557.144391-1-kari.argillander@gmail.com>
 <20210907153557.144391-7-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210907153557.144391-7-kari.argillander@gmail.com>
User-Agent: NeoMutt/20180716

On Tuesday 07 September 2021 18:35:54 Kari Argillander wrote:
> If we call Opt_nohidden with just keyword hidden, then we can use
> hidden/nohidden when mounting. We already use this method for almoust
> all other parameters so it is just logical that this will use same
> method.
> 
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  fs/ntfs3/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 420cd1409170..729ead6f2fac 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -242,7 +242,7 @@ static const struct fs_parameter_spec ntfs_fs_parameters[] = {
>  	fsparam_flag_no("discard",		Opt_discard),
>  	fsparam_flag_no("force",		Opt_force),
>  	fsparam_flag_no("sparse",		Opt_sparse),
> -	fsparam_flag("nohidden",		Opt_nohidden),
> +	fsparam_flag_no("hidden",		Opt_nohidden),
>  	fsparam_flag_no("acl",			Opt_acl),
>  	fsparam_flag_no("showmeta",		Opt_showmeta),
>  	fsparam_string("nls",			Opt_nls),
> @@ -331,7 +331,7 @@ static int ntfs_fs_parse_param(struct fs_context *fc,
>  		opts->sparse = result.negated ? 0 : 1;
>  		break;
>  	case Opt_nohidden:
> -		opts->nohidden = 1;
> +		opts->nohidden = result.negated ? 1 : 0;
>  		break;
>  	case Opt_acl:
>  		if (!result.negated)
> -- 
> 2.25.1
> 
