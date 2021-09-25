Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A024F3FC7
	for <ntfs3@lists.linux.dev>; Sat, 25 Sep 2021 08:49:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u18so49499204lfd.12
        for <ntfs3@lists.linux.dev>; Sat, 25 Sep 2021 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TS6fqehlF97KcAM6ofsV4QD3c4hOu/ggNMphoM7ZdNg=;
        b=KsLSKrdJHPXuZMqnEqD4XsEOTVhAzZU7qRqQgEBBpu48XeVfY/sxUI1MocpKbLU7KM
         aWbYUD/Cg9tFFQmJXrFzr3he13GtmUOqTBgZ69ePZHxWqKX6Qx+5zi6UwOXf7L28QGjN
         i/4t/JfQ3EGejVF8QvbxZAKSW6yyUOxNJv6sWGOiqIwqXUn66Op/tzPkJfN+agOJVVSp
         Dvtzro2pwKdXdCgPbh2+/a9WGkuT+rfTwDCyMODQHku6kJNcoE0NuC2Aoj/ZWpQWr+iV
         XvmiSmT6dbPk3dlBPQ8VHhRxniLgRIeOSU8kPB5sVC53mlYPwV1JQtJ9jn+Ezz/6FHEz
         cY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TS6fqehlF97KcAM6ofsV4QD3c4hOu/ggNMphoM7ZdNg=;
        b=RglfljD77Ah4SKZb1QusnJeLRSIHe9OmW5fHfUpfizMrfVEJ1iziTC+GX5eozhZmhw
         BoayotXI8RfFSqyjzA5DYtm33DJWTRXMsLs1PZJFpdV6rArGVQ9q3dEkKAhTHOyRKC22
         ZmG7WJ4npBfMyMdLRvqs4wplDxshET2Kd27yRFtXGYkJnMAanQ2uarRphxAllrXhzITe
         fcADf3wB6W4yHyBP1D+UqjPxah6xdfMb0iq7O8eHSfAknQCvLWHOccFRyxBWBvCr/hgS
         BTohFE0OcNE53S2YqH4VhlCoSoiImJ3GexfBIi7iIvOeaEnS0vTuocuaFOZvqCwTqidO
         Fjpw==
X-Gm-Message-State: AOAM531uswWkiOf1z3qd5cbT6+6ri14gzCsPiM3ttp7KLAtL9Gwgsxh6
	zYtjVLxabW7UA44LhY36GYw=
X-Google-Smtp-Source: ABdhPJzwK9GOjjEC4tsw7Pn3L2pPQAmOCGiaRnnAUPAVmLaIzXfz25AEwz0jGK0StIVXNdFQbS5csQ==
X-Received: by 2002:a05:651c:4d2:: with SMTP id e18mr15919949lji.432.1632559743565;
        Sat, 25 Sep 2021 01:49:03 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id s4sm784146lfd.103.2021.09.25.01.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 01:49:03 -0700 (PDT)
Date: Sat, 25 Sep 2021 11:49:01 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] fs/ntfs3: Remove locked argument in ntfs_set_ea
Message-ID: <20210925084901.mvlxt442jvy2et7u@kari-VirtualBox>
References: <eb131ee0-3e89-da58-650c-5b84dd792a49@paragon-software.com>
 <b988b38f-ccca-df01-d90d-10f83dd3ad2e@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b988b38f-ccca-df01-d90d-10f83dd3ad2e@paragon-software.com>

On Fri, Sep 24, 2021 at 07:15:50PM +0300, Konstantin Komarov wrote:
> We always need to lock now, because locks became smaller
> (see "Move ni_lock_dir and ni_unlock into ntfs_create_inode").

So basically this actually fixes that commit?

Fixes: d562e901f25d ("fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode")

Or if you do not use fixes atleast use

d562e901f25d ("fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode")

You can add these to your gitconfig

	[core]
		abbrev = 12
	[pretty]
	        fixes = Fixes: %h (\"%s\")
		fixed = Fixes: %h (\"%s\")

And get this annotation with
	git show --pretty=fixes <sha>

Have some comments below also.

> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 253a07d9aa7b..1ab109723b10 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -257,7 +257,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
>  
>  static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  				size_t name_len, const void *value,
> -				size_t val_size, int flags, int locked)
> +				size_t val_size, int flags)
>  {
>  	struct ntfs_inode *ni = ntfs_i(inode);
>  	struct ntfs_sb_info *sbi = ni->mi.sbi;
> @@ -276,8 +276,7 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  	u64 new_sz;
>  	void *p;
>  
> -	if (!locked)
> -		ni_lock(ni);
> +	ni_lock(ni);
>  
>  	run_init(&ea_run);
>  
> @@ -465,8 +464,7 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  	mark_inode_dirty(&ni->vfs_inode);
>  
>  out:
> -	if (!locked)
> -		ni_unlock(ni);
> +	ni_unlock(ni);
>  
>  	run_close(&ea_run);
>  	kfree(ea_all);
> @@ -537,7 +535,7 @@ struct posix_acl *ntfs_get_acl(struct inode *inode, int type)
>  
>  static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  				    struct inode *inode, struct posix_acl *acl,
> -				    int type, int locked)
> +				    int type)
>  {
>  	const char *name;
>  	size_t size, name_len;
> @@ -594,7 +592,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  		flags = 0;
>  	}
>  
> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags, locked);
> +	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
>  	if (err == -ENODATA && !size)
>  		err = 0; /* Removing non existed xattr. */
>  	if (!err)
> @@ -612,7 +610,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  		 struct posix_acl *acl, int type)
>  {
> -	return ntfs_set_acl_ex(mnt_userns, inode, acl, type, 0);
> +	return ntfs_set_acl_ex(mnt_userns, inode, acl, type);
>  }
>  
>  static int ntfs_xattr_get_acl(struct user_namespace *mnt_userns,
> @@ -693,7 +691,7 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  
>  	if (default_acl) {
>  		err = ntfs_set_acl_ex(mnt_userns, inode, default_acl,
> -				      ACL_TYPE_DEFAULT, 1);
> +				      ACL_TYPE_DEFAULT);
>  		posix_acl_release(default_acl);
>  	} else {
>  		inode->i_default_acl = NULL;
> @@ -704,7 +702,7 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  	else {
>  		if (!err)
>  			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
> -					      ACL_TYPE_ACCESS, 1);
> +					      ACL_TYPE_ACCESS);
>  		posix_acl_release(acl);
>  	}
>  
> @@ -988,7 +986,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>  	}
>  #endif
>  	/* Deal with NTFS extended attribute. */
> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
> +	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
>  
>  out:
>  	return err;
> @@ -1006,26 +1004,26 @@ int ntfs_save_wsl_perm(struct inode *inode)
>  
>  	value = cpu_to_le32(i_uid_read(inode));
>  	err = ntfs_set_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value,
> -			  sizeof(value), 0, 0);
> +			  sizeof(value), 0);
>  	if (err)
>  		goto out;
>  
>  	value = cpu_to_le32(i_gid_read(inode));
>  	err = ntfs_set_ea(inode, "$LXGID", sizeof("$LXGID") - 1, &value,
> -			  sizeof(value), 0, 0);
> +			  sizeof(value), 0);
>  	if (err)
>  		goto out;
>  
>  	value = cpu_to_le32(inode->i_mode);
>  	err = ntfs_set_ea(inode, "$LXMOD", sizeof("$LXMOD") - 1, &value,
> -			  sizeof(value), 0, 0);
> +			  sizeof(value), 0);
>  	if (err)
>  		goto out;
>  
>  	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode)) {
>  		value = cpu_to_le32(inode->i_rdev);
>  		err = ntfs_set_ea(inode, "$LXDEV", sizeof("$LXDEV") - 1, &value,
> -				  sizeof(value), 0, 0);
> +				  sizeof(value), 0);

Is this really that we can lock/unlock same lock 4 times in a row in a
ntfs_set_ea? This does not feel correct. 

  Argillander

>  		if (err)
>  			goto out;
>  	}
> -- 
> 2.33.0
> 
> 
