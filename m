Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0D72
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 19:10:10 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id x27so82007906lfu.5
        for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 12:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hT4Wk+APrdQvzvih/T+84yhEzMub35oOLaefJe1GilU=;
        b=WfZQUwu2zUtJcBPPsC7kEBAmyDyRzR+aQoHAwz+Bo2qvtq3M5ggJJNOMk6WtXe0Lqk
         mj7rHrARouHMewhwrZELx4WmUywA7kk10LF4Wcr3fVgl8WglsuZ/xZ8ixmdo0C3YTf7s
         oXQPFL+EFpyAmiZhEe1Cb4ynGKlCZKtxnaaEeF3Lsh+CK3q3rK2LQj/BYbQ8Ph7hl5YE
         aXzLcQXtAjGhbrLkw4IjYyY+xJRM1HevV78N64jjLIpn7wVLGvXdzVRi2933FD0SAPvN
         Hg4rpzzukvqpLSX43vLmLGHUFYBgkA2EtxHPQjSYlsmtNi3arXFcJsKQk5NQEAItBAlw
         RVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hT4Wk+APrdQvzvih/T+84yhEzMub35oOLaefJe1GilU=;
        b=CSYUGvS/gfDbKmfESld5eS6fmU5zpp7V1AYcdY9gZmkGuYAmmLMldFP4xRBnOuqSXB
         QDgsh4F5bD/Hxy2Mqc6PSRgIrxe6Mub2VSvMMqkAjPqsFhH0Sn2PD/rlQj3w/AGriu44
         LAslkawY2vWODunmhBrFB3ocSOOf4av7Z9yS+pwxFIJjehXLa9sYfZx2K9i8F9jjfiff
         6NaU7d9KUqcuo/rZdrTpms3Y4WY7SqgfxURYPM4UkZOOgoM+Uqs8IeU0rNKje86lR5C9
         GevUWwELxDCzTOjrfsUgYcdkfSaxDN+eaee7R5ERZun2uSY1+PCSV1Bp7ORU57HGO8BX
         5kvA==
X-Gm-Message-State: AOAM532gU5l5nNk21NkfUFuIhIXQoT5cChFhU159KQV7nwhT2eUrrUdc
	xJX86SzIMuhCPjyBHXiKo54=
X-Google-Smtp-Source: ABdhPJzTwLdzabyZAvIJw5vnS+khr8+f5Bwfo7lK5za0O9ED5IK3j5rviCtH7RnuMEceBxGpPIo0vQ==
X-Received: by 2002:a05:6512:2241:: with SMTP id i1mr1353170lfu.412.1632769808175;
        Mon, 27 Sep 2021 12:10:08 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id a26sm1680226lfg.193.2021.09.27.12.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 12:10:07 -0700 (PDT)
Date: Mon, 27 Sep 2021 22:10:05 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] fs/ntfs3: Remove locked argument in ntfs_set_ea
Message-ID: <20210927191005.zcebctlxfsqutgkh@kari-VirtualBox>
References: <eb131ee0-3e89-da58-650c-5b84dd792a49@paragon-software.com>
 <b988b38f-ccca-df01-d90d-10f83dd3ad2e@paragon-software.com>
 <20210925084901.mvlxt442jvy2et7u@kari-VirtualBox>
 <816442f2-a79f-68cf-f107-9770a66f3acc@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <816442f2-a79f-68cf-f107-9770a66f3acc@paragon-software.com>

On Mon, Sep 27, 2021 at 06:10:00PM +0300, Konstantin Komarov wrote:
> 
> 
> On 25.09.2021 11:49, Kari Argillander wrote:
> > On Fri, Sep 24, 2021 at 07:15:50PM +0300, Konstantin Komarov wrote:
> >> We always need to lock now, because locks became smaller
> >> (see "Move ni_lock_dir and ni_unlock into ntfs_create_inode").
> > 
> > So basically this actually fixes that commit?
> > 
> > Fixes: d562e901f25d ("fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode")
> > 
> > Or if you do not use fixes atleast use
> > 
> > d562e901f25d ("fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode")
> > 
> > You can add these to your gitconfig
> > 
> > 	[core]
> > 		abbrev = 12
> > 	[pretty]
> > 	        fixes = Fixes: %h (\"%s\")
> > 		fixed = Fixes: %h (\"%s\")
> > 
> > And get this annotation with
> > 	git show --pretty=fixes <sha>
> > 
> > Have some comments below also.
> > 
> >>
> >> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> >> ---
> >>  fs/ntfs3/xattr.c | 28 +++++++++++++---------------
> >>  1 file changed, 13 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> >> index 253a07d9aa7b..1ab109723b10 100644
> >> --- a/fs/ntfs3/xattr.c
> >> +++ b/fs/ntfs3/xattr.c
> >> @@ -257,7 +257,7 @@ static int ntfs_get_ea(struct inode *inode, const char *name, size_t name_len,
> >>  
> >>  static noinline int ntfs_set_ea(struct inode *inode, const char *name,
> >>  				size_t name_len, const void *value,
> >> -				size_t val_size, int flags, int locked)

Maybe we should leave int locked and ...

> >> +				size_t val_size, int flags)
> >>  {
> >>  	struct ntfs_inode *ni = ntfs_i(inode);
> >>  	struct ntfs_sb_info *sbi = ni->mi.sbi;
> >> @@ -276,8 +276,7 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
> >>  	u64 new_sz;
> >>  	void *p;
> >>  
> >> -	if (!locked)
> >> -		ni_lock(ni);
> >> +	ni_lock(ni);
> >>  
> >>  	run_init(&ea_run);
> >>  
> >> @@ -465,8 +464,7 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
> >>  	mark_inode_dirty(&ni->vfs_inode);
> >>  
> >>  out:
> >> -	if (!locked)
> >> -		ni_unlock(ni);
> >> +	ni_unlock(ni);
> >>  
> >>  	run_close(&ea_run);
> >>  	kfree(ea_all);
> >> @@ -537,7 +535,7 @@ struct posix_acl *ntfs_get_acl(struct inode *inode, int type)
> >>  
> >>  static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
> >>  				    struct inode *inode, struct posix_acl *acl,
> >> -				    int type, int locked)
> >> +				    int type)
> >>  {
> >>  	const char *name;
> >>  	size_t size, name_len;
> >> @@ -594,7 +592,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
> >>  		flags = 0;
> >>  	}
> >>  
> >> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags, locked);
> >> +	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
> >>  	if (err == -ENODATA && !size)
> >>  		err = 0; /* Removing non existed xattr. */
> >>  	if (!err)
> >> @@ -612,7 +610,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
> >>  int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
> >>  		 struct posix_acl *acl, int type)
> >>  {
> >> -	return ntfs_set_acl_ex(mnt_userns, inode, acl, type, 0);
> >> +	return ntfs_set_acl_ex(mnt_userns, inode, acl, type);
> >>  }
> >>  
> >>  static int ntfs_xattr_get_acl(struct user_namespace *mnt_userns,
> >> @@ -693,7 +691,7 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
> >>  
> >>  	if (default_acl) {
> >>  		err = ntfs_set_acl_ex(mnt_userns, inode, default_acl,
> >> -				      ACL_TYPE_DEFAULT, 1);
> >> +				      ACL_TYPE_DEFAULT);
> >>  		posix_acl_release(default_acl);
> >>  	} else {
> >>  		inode->i_default_acl = NULL;
> >> @@ -704,7 +702,7 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
> >>  	else {
> >>  		if (!err)
> >>  			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
> >> -					      ACL_TYPE_ACCESS, 1);
> >> +					      ACL_TYPE_ACCESS);
> >>  		posix_acl_release(acl);
> >>  	}
> >>  
> >> @@ -988,7 +986,7 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
> >>  	}
> >>  #endif
> >>  	/* Deal with NTFS extended attribute. */
> >> -	err = ntfs_set_ea(inode, name, name_len, value, size, flags, 0);
> >> +	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
> >>  
> >>  out:
> >>  	return err;
> >> @@ -1006,26 +1004,26 @@ int ntfs_save_wsl_perm(struct inode *inode)
> >>  

do lock here and ...

> >>  	value = cpu_to_le32(i_uid_read(inode));
> >>  	err = ntfs_set_ea(inode, "$LXUID", sizeof("$LXUID") - 1, &value,
> >> -			  sizeof(value), 0, 0);
> >> +			  sizeof(value), 0);
> >>  	if (err)
> >>  		goto out;
> >>  
> >>  	value = cpu_to_le32(i_gid_read(inode));
> >>  	err = ntfs_set_ea(inode, "$LXGID", sizeof("$LXGID") - 1, &value,
> >> -			  sizeof(value), 0, 0);
> >> +			  sizeof(value), 0);
> >>  	if (err)
> >>  		goto out;
> >>  
> >>  	value = cpu_to_le32(inode->i_mode);
> >>  	err = ntfs_set_ea(inode, "$LXMOD", sizeof("$LXMOD") - 1, &value,
> >> -			  sizeof(value), 0, 0);
> >> +			  sizeof(value), 0);
> >>  	if (err)
> >>  		goto out;
> >>  
> >>  	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode)) {
> >>  		value = cpu_to_le32(inode->i_rdev);
> >>  		err = ntfs_set_ea(inode, "$LXDEV", sizeof("$LXDEV") - 1, &value,
> >> -				  sizeof(value), 0, 0);
> >> +				  sizeof(value), 0);

unlock here. Of course unlock also in error path.

> > 
> > Is this really that we can lock/unlock same lock 4 times in a row in a
> > ntfs_set_ea? This does not feel correct. 
> > 
> >   Argillander
> > 
> 
> How it was working before d562e901f25d 
> "fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode":
> 
> ntfs_create (lock mutex) =>
> ntfs_create_inode =>
> ntfs_save_wsl_perm (we are under lock here) =>
> return to ntfs_create and unlock
> 
> How it works with d562e901f25d:
> 
> ntfs_create => 
> ntfs_create_inode (lock in line 1201 file fs/ntfs3/inode.c 
> and unlock in line 1557) => 
> ntfs_save_wsl_perm (we aren't under lock here in line 1605)
> 
> So we need to lock 4 times because there are 4 ntfs_set_ea calls.
> But now there can be done more work between those calls
> in other threads, locks became more granular.

Yeah but locking and locking 4 times when we can do it just ones is
quite waste. Please consider my suggestion above or tell what is wrong
with it. 

  Argillander

> 
> >>  		if (err)
> >>  			goto out;
> >>  	}
> >> -- 
> >> 2.33.0
> >>
> >>
