Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEF43FCB
	for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 18:12:52 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b15so14843055lfe.7
        for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=okAjIGLjrgqxq64pmQoOBCNH489YYnDxMve8Hgv5WkA=;
        b=crHPOrCuizBy5akbvOdzBt9y0DIz1mKFtYHHZtqliBi7SijmyDEdlWEVduxJFgAmud
         3gjsHwjXTxPsEk/1VMDHXeya1qTAxfKL0PLhbb+kf9vZsur0nucFmTn0+4pV/iNOzkpI
         TEK7T5UB8uydOeSV3QRAiiB08tCV3B62CLsUc90VRlla7wTSTTAdBloseobfZRCdIiRS
         IEV7pZ3DyafTmVYuF9PDE7iGrnn92853zGfWgABy9NmeaWQwU/h147kw6ELB522cud8b
         IAfJ5XKIX54O2PIDk7eEcKooMN9KQKPLTtxyTdC/AeI4ZvDaA3B7v+12sgoYPUUu3r8Q
         W7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=okAjIGLjrgqxq64pmQoOBCNH489YYnDxMve8Hgv5WkA=;
        b=Men8jtgvvl6W9vVMuM2sGR0ZX4mXiG0+wpiwSc9wjfbbcq/eVHUO7YceKaDR5veXvw
         kBQdJMKLRGIg/BjkAnrdV+yQ8LperT9whaY+StxkkFPRpksG15rNosJZL9W4NUZWqztB
         lVaJweAtOb0sQOFZwGL8dz8lQEs1naDSceOq258xQK9pUtza6GsE3ubhV5JHYZRt7qvC
         OPWabZcmPMhiXZiBvT5JsUd+nDOuMHq/3Cts2DqmJlX3RXhwJaxG8iWul50oS5StCzXD
         qSwEu1BTQ8xdsQELJ1tx9EZ3RXFbu8ccDxSDC46OLQ4pqztNTMKkCBvQZsMDmn7xrBZi
         OTKA==
X-Gm-Message-State: AOAM530bDYZS9QuOuYn2ZmYqeZF3T60khehtD5kzAfZTV6TioAgbLEU3
	Nj44sKAl+KldjDLkOZxt+GIXMrNCr/GBPg==
X-Google-Smtp-Source: ABdhPJyYPhjMRfAArfiWxEVEbH5e9MyX7K4drThW40rxD+7J/n8TTqB43BQlbu/mcXiniBg9gMM09g==
X-Received: by 2002:a2e:4c09:: with SMTP id z9mr699303lja.390.1632334366688;
        Wed, 22 Sep 2021 11:12:46 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id b22sm233682lfi.67.2021.09.22.11.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 11:12:46 -0700 (PDT)
Date: Wed, 22 Sep 2021 21:12:44 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/5] fs/ntfs3: Move ni_lock_dir and ni_unlock into
 ntfs_create_inode
Message-ID: <20210922181244.tjxij5gi6xft4wwh@kari-VirtualBox>
References: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>
 <a269be2f-4ab6-b1c6-790c-9d3052bf22cc@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a269be2f-4ab6-b1c6-790c-9d3052bf22cc@paragon-software.com>

On Wed, Sep 22, 2021 at 07:17:13PM +0300, Konstantin Komarov wrote:
> Now ntfs3 locks mutex for smaller time.

Really like this change. It was my todo list also. Thanks. Still some
comments below.

> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/inode.c | 17 ++++++++++++++---
>  fs/ntfs3/namei.c | 20 --------------------
>  2 files changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index d583b71bec50..6fc99eebd1c1 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -1198,9 +1198,13 @@ struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
>  	struct REPARSE_DATA_BUFFER *rp = NULL;
>  	bool rp_inserted = false;
>  
> +	ni_lock_dir(dir_ni);
> +
>  	dir_root = indx_get_root(&dir_ni->dir, dir_ni, NULL, NULL);
> -	if (!dir_root)
> -		return ERR_PTR(-EINVAL);
> +	if (!dir_root) {
> +		err = -EINVAL;
> +		goto out1;
> +	}
>  
>  	if (S_ISDIR(mode)) {
>  		/* Use parent's directory attributes. */
> @@ -1549,6 +1553,9 @@ struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
>  	if (err)
>  		goto out6;
>  
> +	/* Unlock parent directory before ntfs_init_acl. */
> +	ni_unlock(dir_ni);

There is err path which can go to err6 (line 1585). Then we get double
unlock situation.

> +
>  	inode->i_generation = le16_to_cpu(rec->seq);
>  
>  	dir->i_mtime = dir->i_ctime = inode->i_atime;
> @@ -1605,8 +1612,10 @@ struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
>  out7:
>  
>  	/* Undo 'indx_insert_entry'. */
> +	ni_lock_dir(dir_ni);
>  	indx_delete_entry(&dir_ni->dir, dir_ni, new_de + 1,
>  			  le16_to_cpu(new_de->key_size), sbi);
> +	/* ni_unlock(dir_ni); will be called later. */
>  out6:
>  	if (rp_inserted)
>  		ntfs_remove_reparse(sbi, IO_REPARSE_TAG_SYMLINK, &new_de->ref);
> @@ -1630,8 +1639,10 @@ struct inode *ntfs_create_inode(struct user_namespace *mnt_userns,
>  	kfree(rp);
>  
>  out1:
> -	if (err)
> +	if (err) {
> +		ni_unlock(dir_ni);

This will be double unlock if we exit with err path out6.

  Argillander

>  		return ERR_PTR(err);
> +	}
>  
>  	unlock_new_inode(inode);
>  
> diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
> index 1c475da4e19d..bc741213ad84 100644
> --- a/fs/ntfs3/namei.c
> +++ b/fs/ntfs3/namei.c
> @@ -95,16 +95,11 @@ static struct dentry *ntfs_lookup(struct inode *dir, struct dentry *dentry,
>  static int ntfs_create(struct user_namespace *mnt_userns, struct inode *dir,
>  		       struct dentry *dentry, umode_t mode, bool excl)
>  {
> -	struct ntfs_inode *ni = ntfs_i(dir);
>  	struct inode *inode;
>  
> -	ni_lock_dir(ni);
> -
>  	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFREG | mode,
>  				  0, NULL, 0, NULL);
>  
> -	ni_unlock(ni);
> -
>  	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
>  }
>  
> @@ -116,16 +111,11 @@ static int ntfs_create(struct user_namespace *mnt_userns, struct inode *dir,
>  static int ntfs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
>  		      struct dentry *dentry, umode_t mode, dev_t rdev)
>  {
> -	struct ntfs_inode *ni = ntfs_i(dir);
>  	struct inode *inode;
>  
> -	ni_lock_dir(ni);
> -
>  	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, mode, rdev,
>  				  NULL, 0, NULL);
>  
> -	ni_unlock(ni);
> -
>  	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
>  }
>  
> @@ -196,15 +186,10 @@ static int ntfs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
>  {
>  	u32 size = strlen(symname);
>  	struct inode *inode;
> -	struct ntfs_inode *ni = ntfs_i(dir);
> -
> -	ni_lock_dir(ni);
>  
>  	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFLNK | 0777,
>  				  0, symname, size, NULL);
>  
> -	ni_unlock(ni);
> -
>  	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
>  }
>  
> @@ -215,15 +200,10 @@ static int ntfs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>  		      struct dentry *dentry, umode_t mode)
>  {
>  	struct inode *inode;
> -	struct ntfs_inode *ni = ntfs_i(dir);
> -
> -	ni_lock_dir(ni);
>  
>  	inode = ntfs_create_inode(mnt_userns, dir, dentry, NULL, S_IFDIR | mode,
>  				  0, NULL, 0, NULL);
>  
> -	ni_unlock(ni);
> -
>  	return IS_ERR(inode) ? PTR_ERR(inode) : 0;
>  }
>  
> -- 
> 2.33.0
> 
> 
