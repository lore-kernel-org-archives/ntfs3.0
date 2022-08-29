Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17220E8
	for <ntfs3@lists.linux.dev>; Mon, 29 Aug 2022 12:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70B2C433D6;
	Mon, 29 Aug 2022 12:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661777061;
	bh=kOWLrtIu1yLx8jO1aARV/k3q2fGR+/lYlIxRhhuuJT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ah1g6Gf6rOdJSfCJ2jLxt4HPiHz+B+SimL52g1WJE+hwiux30PHIeyUghycopLwuP
	 lOHcSioSY5zqxZkO1nGXYPiEeL4uPU95mLUxxZai7wKSNRzSre8GGKYNjR4mNFB7hY
	 hjemL0nHlniirn2OEWRSWYGR5ypkM5Z1Le6C/vO9iOOgqkfIaamf318oSJyu4hyz/4
	 d4yrZl/51RMsJoKxPO+pZY50VeyXNsfPC4Cy3NUe24u9PDHiOu69kRIQGRNQG8HYpA
	 gfBS/Ko+mMm0hW6GGTY8msqQln/X9H7xAT3QaTKoavnQyjqpoSwh5yh4O4VMdegXCz
	 JnjMfcFDVafsw==
Date: Mon, 29 Aug 2022 14:44:16 +0200
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>,
	Seth Forshee <sforshee@digitalocean.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH 1/6] ntfs3: rework xattr handlers and switch to POSIX ACL
 VFS helpers
Message-ID: <20220829124416.6voujkacv5mtljb5@wittgenstein>
References: <20220829123843.1146874-1-brauner@kernel.org>
 <20220829123843.1146874-2-brauner@kernel.org>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220829123843.1146874-2-brauner@kernel.org>

[Sorry, forgot to Cc ntfs3 developers.]

On Mon, Aug 29, 2022 at 02:38:40PM +0200, Christian Brauner wrote:
> The xattr code in ntfs3 is currently a bit confused. For example, it
> defines a POSIX ACL i_op->set_acl() method but instead of relying on the
> generic POSIX ACL VFS helpers it defines its own set of xattr helpers
> with the consequence that i_op->set_acl() is currently dead code.
> 
> Switch ntfs3 to rely on the VFS POSIX ACL xattr handlers. Also remove
> i_op->{g,s}et_acl() methods from symlink inode operations. Symlinks
> don't support xattrs.
> 
> This is a preliminary change for the following patches which move
> handling idmapped mounts directly in posix_acl_xattr_set().
> 
> This survives POSIX ACL xfstests.
> 
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> ---
>  fs/ntfs3/inode.c |   2 -
>  fs/ntfs3/xattr.c | 102 +++--------------------------------------------
>  2 files changed, 6 insertions(+), 98 deletions(-)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 51363d4e8636..26a76ebfe58f 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -1927,8 +1927,6 @@ const struct inode_operations ntfs_link_inode_operations = {
>  	.setattr	= ntfs3_setattr,
>  	.listxattr	= ntfs_listxattr,
>  	.permission	= ntfs_permission,
> -	.get_acl	= ntfs_get_acl,
> -	.set_acl	= ntfs_set_acl,
>  };
>  
>  const struct address_space_operations ntfs_aops = {
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 6ae1f56b7358..7de8718c68a9 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -625,67 +625,6 @@ int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  	return ntfs_set_acl_ex(mnt_userns, inode, acl, type, false);
>  }
>  
> -static int ntfs_xattr_get_acl(struct user_namespace *mnt_userns,
> -			      struct inode *inode, int type, void *buffer,
> -			      size_t size)
> -{
> -	struct posix_acl *acl;
> -	int err;
> -
> -	if (!(inode->i_sb->s_flags & SB_POSIXACL)) {
> -		ntfs_inode_warn(inode, "add mount option \"acl\" to use acl");
> -		return -EOPNOTSUPP;
> -	}
> -
> -	acl = ntfs_get_acl(inode, type, false);
> -	if (IS_ERR(acl))
> -		return PTR_ERR(acl);
> -
> -	if (!acl)
> -		return -ENODATA;
> -
> -	err = posix_acl_to_xattr(&init_user_ns, acl, buffer, size);
> -	posix_acl_release(acl);
> -
> -	return err;
> -}
> -
> -static int ntfs_xattr_set_acl(struct user_namespace *mnt_userns,
> -			      struct inode *inode, int type, const void *value,
> -			      size_t size)
> -{
> -	struct posix_acl *acl;
> -	int err;
> -
> -	if (!(inode->i_sb->s_flags & SB_POSIXACL)) {
> -		ntfs_inode_warn(inode, "add mount option \"acl\" to use acl");
> -		return -EOPNOTSUPP;
> -	}
> -
> -	if (!inode_owner_or_capable(mnt_userns, inode))
> -		return -EPERM;
> -
> -	if (!value) {
> -		acl = NULL;
> -	} else {
> -		acl = posix_acl_from_xattr(&init_user_ns, value, size);
> -		if (IS_ERR(acl))
> -			return PTR_ERR(acl);
> -
> -		if (acl) {
> -			err = posix_acl_valid(&init_user_ns, acl);
> -			if (err)
> -				goto release_and_out;
> -		}
> -	}
> -
> -	err = ntfs_set_acl(mnt_userns, inode, acl, type);
> -
> -release_and_out:
> -	posix_acl_release(acl);
> -	return err;
> -}
> -
>  /*
>   * ntfs_init_acl - Initialize the ACLs of a new inode.
>   *
> @@ -852,23 +791,6 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>  		goto out;
>  	}
>  
> -#ifdef CONFIG_NTFS3_FS_POSIX_ACL
> -	if ((name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1 &&
> -	     !memcmp(name, XATTR_NAME_POSIX_ACL_ACCESS,
> -		     sizeof(XATTR_NAME_POSIX_ACL_ACCESS))) ||
> -	    (name_len == sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1 &&
> -	     !memcmp(name, XATTR_NAME_POSIX_ACL_DEFAULT,
> -		     sizeof(XATTR_NAME_POSIX_ACL_DEFAULT)))) {
> -		/* TODO: init_user_ns? */
> -		err = ntfs_xattr_get_acl(
> -			&init_user_ns, inode,
> -			name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1
> -				? ACL_TYPE_ACCESS
> -				: ACL_TYPE_DEFAULT,
> -			buffer, size);
> -		goto out;
> -	}
> -#endif
>  	/* Deal with NTFS extended attribute. */
>  	err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
>  
> @@ -981,22 +903,6 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>  		goto out;
>  	}
>  
> -#ifdef CONFIG_NTFS3_FS_POSIX_ACL
> -	if ((name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1 &&
> -	     !memcmp(name, XATTR_NAME_POSIX_ACL_ACCESS,
> -		     sizeof(XATTR_NAME_POSIX_ACL_ACCESS))) ||
> -	    (name_len == sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1 &&
> -	     !memcmp(name, XATTR_NAME_POSIX_ACL_DEFAULT,
> -		     sizeof(XATTR_NAME_POSIX_ACL_DEFAULT)))) {
> -		err = ntfs_xattr_set_acl(
> -			mnt_userns, inode,
> -			name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1
> -				? ACL_TYPE_ACCESS
> -				: ACL_TYPE_DEFAULT,
> -			value, size);
> -		goto out;
> -	}
> -#endif
>  	/* Deal with NTFS extended attribute. */
>  	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
>  
> @@ -1086,7 +992,7 @@ static bool ntfs_xattr_user_list(struct dentry *dentry)
>  }
>  
>  // clang-format off
> -static const struct xattr_handler ntfs_xattr_handler = {
> +static const struct xattr_handler ntfs_other_xattr_handler = {
>  	.prefix	= "",
>  	.get	= ntfs_getxattr,
>  	.set	= ntfs_setxattr,
> @@ -1094,7 +1000,11 @@ static const struct xattr_handler ntfs_xattr_handler = {
>  };
>  
>  const struct xattr_handler *ntfs_xattr_handlers[] = {
> -	&ntfs_xattr_handler,
> +#ifdef CONFIG_NTFS3_FS_POSIX_ACL
> +	&posix_acl_access_xattr_handler,
> +	&posix_acl_default_xattr_handler,
> +#endif
> +	&ntfs_other_xattr_handler,
>  	NULL,
>  };
>  // clang-format on
> -- 
> 2.34.1
> 
