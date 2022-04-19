Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD97A
	for <ntfs3@lists.linux.dev>; Tue, 19 Apr 2022 14:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58788C385A5;
	Tue, 19 Apr 2022 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650376946;
	bh=sqRutsWahsHt6cigK4f/6dAwTpOvdRR3j3VJDDTTT3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPiHCRBR9A9r8gkTiMDE9GS5JlTwXlsgUBFVeqIOEtI8jBZ4oIBvIBp/JbFgzZ2aa
	 TlozkkqcyWXZ3jr15aantTnmLnT/WnbUP3V6VhJjkKefqI3AuT8RBBfJsDxzpRZnYR
	 F11TJty84zVoGOS+vQQEp56xcNl17IycDPLg6aMR6oQh2XDzK0gIURJcZyGfMVb273
	 1NROG81D5OFReoDGTY6ABBkYJtIAqnIultYyRlVzv9lLohlWVylJjsBLVlflUS/vjI
	 SULfyiwUp5/LyXYTuyKu5h2h9g/strGps6Re0o4JRL9Y+65GmKeUeBHRYBT9dhCnLS
	 O+NSdOZ2t5XMg==
Date: Tue, 19 Apr 2022 16:02:20 +0200
From: Christian Brauner <brauner@kernel.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Cc: linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-xfs@vger.kernel.org,
	viro@zeniv.linux.org.uk, david@fromorbit.com, djwong@kernel.org,
	jlayton@kernel.org, ntfs3@lists.linux.dev, chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v4 5/8] f2fs: Remove useless NULL assign value for acl
 and default_acl
Message-ID: <20220419140220.bfziilnj47vdgsef@wittgenstein>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-5-git-send-email-xuyang2018.jy@fujitsu.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1650368834-2420-5-git-send-email-xuyang2018.jy@fujitsu.com>

On Tue, Apr 19, 2022 at 07:47:11PM +0800, Yang Xu wrote:
> Like other use ${fs}_init_acl and posix_acl_create filesystem, we don't
> need to assign NULL for acl and default_acl pointer because f2fs_acl_create
> will do this job. So remove it.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  fs/f2fs/acl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
> index eaa240b21f07..9ae2d2fec58b 100644
> --- a/fs/f2fs/acl.c
> +++ b/fs/f2fs/acl.c
> @@ -412,7 +412,7 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
>  int f2fs_init_acl(struct inode *inode, struct inode *dir, struct page *ipage,
>  							struct page *dpage)
>  {
> -	struct posix_acl *default_acl = NULL, *acl = NULL;
> +	struct posix_acl *default_acl, *acl;

Hm, patches like this have nothing to do with the theme of this patch
series. They can go as completely independent patches to the relevant
fses. Imho, they don't belong with this series at all.
