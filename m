Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2C115CE
	for <ntfs3@lists.linux.dev>; Thu,  6 Jul 2023 10:40:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED57C2019E;
	Thu,  6 Jul 2023 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688640025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AtPqbv/I5XTvRHzRa1le0miyUrAIJk4DE9riJNaL0W4=;
	b=kYlD/4Y11bqPwRxjACIaXhrUB5JS5c0IcjFm+K1U2d7mhFQ4NJX58DF+IjRMGdkMwXlfnt
	kUWpbAZxfhsgQHbYqymse72ZrpUkQijkl8l6oOajA8mixabYyhpNIT5psP6n7kyWXboI/h
	I6QcHlTlrHZk5Ds1ia0uxdnyE1rh9ro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688640025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AtPqbv/I5XTvRHzRa1le0miyUrAIJk4DE9riJNaL0W4=;
	b=FPZWntPHr5F/tAZlUZEaLRKY0UnmVO17+4grDsFTYxmL+8MptQVtk4TuevTPery7QdcufA
	u86dJcECBFjUuaDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF1AC138FC;
	Thu,  6 Jul 2023 10:40:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CtJ1NhmapmTZewAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 06 Jul 2023 10:40:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7DE80A0707; Thu,  6 Jul 2023 12:40:25 +0200 (CEST)
Date: Thu, 6 Jul 2023 12:40:25 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH v2 13/92] ntfs3: convert to simple_rename_timestamp
Message-ID: <20230706104025.gm66visyl3cer7vs@quack3>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-11-jlayton@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705190309.579783-11-jlayton@kernel.org>

On Wed 05-07-23 15:00:38, Jeff Layton wrote:
> A rename potentially involves updating 4 different inode timestamps.
> Convert to the new simple_rename_timestamp helper function.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ntfs3/namei.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
> index 70f8c859e0ad..bfd986699f9e 100644
> --- a/fs/ntfs3/namei.c
> +++ b/fs/ntfs3/namei.c
> @@ -324,14 +324,11 @@ static int ntfs_rename(struct mnt_idmap *idmap, struct inode *dir,
>  		/* Restore after failed rename failed too. */
>  		_ntfs_bad_inode(inode);
>  	} else if (!err) {
> -		inode->i_ctime = dir->i_ctime = dir->i_mtime =
> -			current_time(dir);
> +		simple_rename_timestamp(dir, dentry, new_dir, new_dentry);
>  		mark_inode_dirty(inode);
>  		mark_inode_dirty(dir);
> -		if (dir != new_dir) {
> -			new_dir->i_mtime = new_dir->i_ctime = dir->i_ctime;
> +		if (dir != new_dir)
>  			mark_inode_dirty(new_dir);
> -		}
>  
>  		if (IS_DIRSYNC(dir))
>  			ntfs_sync_inode(dir);
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
