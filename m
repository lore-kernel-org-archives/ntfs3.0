Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39A2C9F
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 18:08:23 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id y26so543693lfa.11
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BjjiSjsAp73g3DvM4e31qhxfRCOib7dJHrxo3nfDN8Q=;
        b=Xnnp0iCGRdNgmch3N1nk7p7CZDLwPgTxIVb5Ka7n/T9tgwNcNjPXj9AElmVbTN7vFw
         EBpzXznIsDANAG82QF9yt4Gf5uFO/tCl9pJCM+nuhOQlCIRZFb2H9Hxmaj2q7j+A/AWu
         C3TFRbvQtE28cX6F40dO7IdKO2YFoA8cstRz0ykfhLjt68qjcIB1j6ssZFPi7Scut3U8
         pNZ/3LVPKIn8/SZ2LiaP5V2qQJe+OB+ypNT3MkQxdRaSZMzGe3uFtWEisJ3sW+avQEdD
         5/9NfjF0/oUMHoP8Pvj3ysxp0f8O0rSLjg9TbMoiCxxzeRVvMcQexsuQSfXJ6muhNPex
         kkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BjjiSjsAp73g3DvM4e31qhxfRCOib7dJHrxo3nfDN8Q=;
        b=WeTzqVwYUNPxLljCiBRXXiq+Gj26e6DrRHwQfGvNrpcvxgZtlKhUWwQWazGpH2QlkI
         SqRmLGrK7WlSPPO190NZUHc3Eul9vKkZG/ghhELIy4PkZQ0ybl9mo4jVKxc3FCyHapk/
         B9MagBvZoatYYb+G2U3bTXuX3qfqH4Qr0TNck5DEablHlM7nKzhXvLpRZE/fqIeyOrLl
         iYGGWsVDIHTEdUQsQqErvpqydptVhnBnagtrAeh1B2N83nFZfq55C1RyIKf1mwHArtFR
         1KDdpLOkOQgdvCdR96UGFdsTFdJb3V7Hq7ZU2sUiLXsZT8pQtY3qywH1s/E4tnlnk0g9
         T1yQ==
X-Gm-Message-State: AOAM53292z0ELocZ+MNQ+Rh9mwaouboHqiAswgptmKKD0h+gna8W5Kr7
	eGA8JjzMEw2sfFJ4db6dBrplsBFmAVo=
X-Google-Smtp-Source: ABdhPJzE3ohlvUaf06ODOZjOnsj6PLdMvdy5mQ/mHKk/XrJDyLrUYoRuZeymwW4Tu2KTPVyHBAsjpw==
X-Received: by 2002:a19:fc1a:: with SMTP id a26mr8893955lfi.332.1635271701734;
        Tue, 26 Oct 2021 11:08:21 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id w40sm1268545lfu.48.2021.10.26.11.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:08:21 -0700 (PDT)
Date: Tue, 26 Oct 2021 21:08:19 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH 4/4] fs/ntfs3: Optimize locking in ntfs_save_wsl_perm
Message-ID: <20211026180819.yk6hqcgvtujytyem@kari-VirtualBox>
References: <a57c1c49-4ef3-15ee-d2cd-d77fb4246b3c@paragon-software.com>
 <d8ea9103-27d7-0217-297a-57aac6b0a5dc@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8ea9103-27d7-0217-297a-57aac6b0a5dc@paragon-software.com>

On Tue, Oct 26, 2021 at 07:42:15PM +0300, Konstantin Komarov wrote:
> Right now in ntfs_save_wsl_perm we lock/unlock 4 times.
> This commit fixes this situation.
> We add "locked" argument to ntfs_set_ea.
> 
> Suggested-by: Kari Argillander <kari.argillander@gmail.com>
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Add tag if you fix Joes nit.

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/xattr.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 157b70aecb4f..6d8b1cd7681d 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -259,7 +259,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
>  
>  static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  				size_t name_len, const void *value,
> -				size_t val_size, int flags)
> +				size_t val_size, int flags, bool locked)
>  {
>  	struct ntfs_inode *ni = ntfs_i(inode);
>  	struct ntfs_sb_info *sbi = ni->mi.sbi;
> @@ -278,7 +278,8 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  	u64 new_sz;
>  	void *p;
>  
> -	ni_lock(ni);
> +	if (!locked)
> +		ni_lock(ni);
>  
>  	run_init(&ea_run);
>  
> @@ -467,7 +468,8 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  	mark_inode_dirty(&ni->vfs_inode);
>  
>  out:
> -	ni_unlock(ni);
> +	if (!locked)
> +		ni_unlock(ni);
>  
>  	run_close(&ea_run);
>  	kfree(ea_all);
> @@ -595,7 +597,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  		flags = 0;
>  	}
>  
> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
> +	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
>  	if (err == -ENODATA && !size)
>  		err = 0; /* Removing non existed xattr. */
>  	if (!err)
> @@ -989,7 +991,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>  	}
>  #endif
>  	/* Deal with NTFS extended attribute. */
> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
> +	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);

Did you miss Joes comment or is there another reason why there is still
is (true|0) arguments?

https://lore.kernel.org/ntfs3/adcb168fc78f62583f8d925bcadbbcda9ba7da20.camel@perches.com/

  argillander

>  
>  out:
>  	inode->i_ctime = current_time(inode);
> @@ -1007,35 +1009,37 @@ int ntfs_save_wsl_perm(struct inode *inode)
>  {
>  	int err;
>  	__le32 value;
> +	struct ntfs_inode *ni = ntfs_i(inode);
>  
> -	/* TODO: refactor this, so we don't lock 4 times in ntfs_set_ea */
> +	ni_lock(ni);
>  	value = cpu_to_le32(i_uid_read(inode));
>  	err = ntfs_set_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value,
> -			  sizeof(value), 0);
> +			  sizeof(value), 0, true); /* true == already locked. */
>  	if (err)
>  		goto out;
>  
>  	value = cpu_to_le32(i_gid_read(inode));
>  	err = ntfs_set_ea(inode, "$LXGID", sizeof("$LXGID") - 1, &value,
> -			  sizeof(value), 0);
> +			  sizeof(value), 0, true);
>  	if (err)
>  		goto out;
>  
>  	value = cpu_to_le32(inode->i_mode);
>  	err = ntfs_set_ea(inode, "$LXMOD", sizeof("$LXMOD") - 1, &value,
> -			  sizeof(value), 0);
> +			  sizeof(value), 0, true);
>  	if (err)
>  		goto out;
>  
>  	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode)) {
>  		value = cpu_to_le32(inode->i_rdev);
>  		err = ntfs_set_ea(inode, "$LXDEV", sizeof("$LXDEV") - 1, &value,
> -				  sizeof(value), 0);
> +				  sizeof(value), 0, true);
>  		if (err)
>  			goto out;
>  	}
>  
>  out:
> +	ni_unlock(ni);
>  	/* In case of error should we delete all WSL xattr? */
>  	return err;
>  }
> -- 
> 2.33.0
> 
> 
> 
