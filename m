Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC042CA9
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:37:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id c28so1304546lfv.13
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oI5Ood+ax8/bXSOkMdkot2htI6P0pPz1aqt3AiMoPto=;
        b=NIRqSixj0TpI/WWovPTLYLHD+Mzi+g1nIgYyynsJCRWXR8UCvvASOEuccE2ZIPv3j7
         vlv8CXjMxyc7d+RV8QOhJLU4KpUkf9bB02uzDZnHFfIw9gGe7mUDrLJpnjd+Ec9Gc2Q6
         pC1gN1YixBg7f39+ICn7VqLJpJxsswoqNa4QqvKuhZQvR60tawfldfFyqi4v/lGt8kxw
         oK0Ng+fdlf9er7ko89GgE4tznGVXvs6K5T5ZXJKBv8JOKkIWfBLZ+XVl6YZATHsT6NiG
         oiFCfuETRfYt9+9S7cJx2okol3ADGb4l3pcwdhKM2OvApvPti9qhAVv/V6XcrkUqGczh
         ioew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oI5Ood+ax8/bXSOkMdkot2htI6P0pPz1aqt3AiMoPto=;
        b=Ztv2c2QFcpDvDrzdl4KBN1M0kudZPABnNElfsYbiJ1CRcp2Xmnkt9eci9NZ3yC4eO4
         k+WU1Cl+9UCt/j/XVKyerw17mO1QYFjJQ+YGZwpQwbB0VCNuvyZH+492+VtTJyie0w9B
         HrUJrD88v0INkH+of0q4c2nRuaPP/39ho+CqYHAoxiRbmFNDSVK+MOYoCZkUxRd7Omww
         +nHwnXamtNQpwjh2sZu+5M8Ar0V7iC9YrMxWYrrq9EEyvmePLJQJhpNAwKffrSyrBzVe
         sCahrK6lXz/3gBr2hOqCSO5yf1yP6NxsQAU/sS0CljDPStSgcCs12TFwcLeL8goedTNT
         pVRg==
X-Gm-Message-State: AOAM530YTSTO3aqW7T3UT4PERsjijq80kpNUylHEkC9DxnbKpGXkBqzG
	FCmRyKIe5aXkuUpxUerMW6w=
X-Google-Smtp-Source: ABdhPJxztJyc7jlP4BkFEvWpIBBmKu1N4jUjOCTvgqS0KbFVN01kkiuuyrN4q5VYlqd49BiyioDCJg==
X-Received: by 2002:ac2:5f5c:: with SMTP id 28mr11677274lfz.238.1635280623667;
        Tue, 26 Oct 2021 13:37:03 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id n7sm2021856lft.309.2021.10.26.13.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:37:02 -0700 (PDT)
Date: Tue, 26 Oct 2021 23:37:01 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/4] fs/ntfs3: Restore ntfs_xattr_get_acl and
 ntfs_xattr_set_acl functions
Message-ID: <20211026203701.hqg2ihyuoyc7emr3@kari-VirtualBox>
References: <a57c1c49-4ef3-15ee-d2cd-d77fb4246b3c@paragon-software.com>
 <ada6d126-e5b0-fe9e-2596-34f6550ad7a7@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ada6d126-e5b0-fe9e-2596-34f6550ad7a7@paragon-software.com>

On Tue, Oct 26, 2021 at 07:41:27PM +0300, Konstantin Komarov wrote:
> Apparently we need to maintain these functions with
> ntfs_get_acl_ex and ntfs_set_acl_ex.
> This commit fixes xfstest generic/099

I like how you phrase this in one other patch

Fixes generic/099

but no need to change

> Fixes: 95dd8b2c1ed0 ("fs/ntfs3: Remove unnecessary functions")
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/xattr.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 2143099cffdf..3ccdb8c2ac0b 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -112,7 +112,7 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
>  		return -ENOMEM;
>  
>  	if (!size) {
> -		;
> +		/* EA info persists, but xattr is empty. Looks like EA problem. */
>  	} else if (attr_ea->non_res) {
>  		struct runs_tree run;
>  
> @@ -616,6 +616,67 @@ int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  	return ntfs_set_acl_ex(mnt_userns, inode, acl, type);
>  }
>  
> +static int ntfs_xattr_get_acl(struct user_namespace *mnt_userns,
> +			      struct inode *inode, int type, void *buffer,
> +			      size_t size)
> +{
> +	struct posix_acl *acl;
> +	int err;
> +
> +	if (!(inode->i_sb->s_flags & SB_POSIXACL)) {
> +		ntfs_inode_warn(inode, "add mount option \"acl\" to use acl");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	acl = ntfs_get_acl(inode, type);
> +	if (IS_ERR(acl))
> +		return PTR_ERR(acl);
> +
> +	if (!acl)
> +		return -ENODATA;
> +
> +	err = posix_acl_to_xattr(mnt_userns, acl, buffer, size);
> +	posix_acl_release(acl);
> +
> +	return err;
> +}
> +
> +static int ntfs_xattr_set_acl(struct user_namespace *mnt_userns,
> +			      struct inode *inode, int type, const void *value,
> +			      size_t size)
> +{
> +	struct posix_acl *acl;
> +	int err;
> +
> +	if (!(inode->i_sb->s_flags & SB_POSIXACL)) {
> +		ntfs_inode_warn(inode, "add mount option \"acl\" to use acl");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (!inode_owner_or_capable(mnt_userns, inode))
> +		return -EPERM;
> +
> +	if (!value) {
> +		acl = NULL;
> +	} else {
> +		acl = posix_acl_from_xattr(mnt_userns, value, size);
> +		if (IS_ERR(acl))
> +			return PTR_ERR(acl);
> +
> +		if (acl) {
> +			err = posix_acl_valid(mnt_userns, acl);
> +			if (err)
> +				goto release_and_out;
> +		}
> +	}
> +
> +	err = ntfs_set_acl(mnt_userns, inode, acl, type);
> +
> +release_and_out:
> +	posix_acl_release(acl);
> +	return err;
> +}
> +
>  /*
>   * ntfs_init_acl - Initialize the ACLs of a new inode.
>   *
> @@ -782,6 +843,23 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
>  		goto out;
>  	}
>  
> +#ifdef CONFIG_NTFS3_FS_POSIX_ACL
> +	if ((name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1 &&
> +	     !memcmp(name, XATTR_NAME_POSIX_ACL_ACCESS,
> +		     sizeof(XATTR_NAME_POSIX_ACL_ACCESS))) ||
> +	    (name_len == sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1 &&
> +	     !memcmp(name, XATTR_NAME_POSIX_ACL_DEFAULT,
> +		     sizeof(XATTR_NAME_POSIX_ACL_DEFAULT)))) {
> +		/* TODO: init_user_ns? */
> +		err = ntfs_xattr_get_acl(
> +			&init_user_ns, inode,
> +			name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1
> +				? ACL_TYPE_ACCESS
> +				: ACL_TYPE_DEFAULT,
> +			buffer, size);
> +		goto out;
> +	}
> +#endif
>  	/* Deal with NTFS extended attribute. */
>  	err = ntfs_get_ea(inode, name, name_len, buffer, size, NULL);
>  
> @@ -894,6 +972,22 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>  		goto out;
>  	}
>  
> +#ifdef CONFIG_NTFS3_FS_POSIX_ACL
> +	if ((name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1 &&
> +	     !memcmp(name, XATTR_NAME_POSIX_ACL_ACCESS,
> +		     sizeof(XATTR_NAME_POSIX_ACL_ACCESS))) ||
> +	    (name_len == sizeof(XATTR_NAME_POSIX_ACL_DEFAULT) - 1 &&
> +	     !memcmp(name, XATTR_NAME_POSIX_ACL_DEFAULT,
> +		     sizeof(XATTR_NAME_POSIX_ACL_DEFAULT)))) {
> +		err = ntfs_xattr_set_acl(
> +			mnt_userns, inode,
> +			name_len == sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1
> +				? ACL_TYPE_ACCESS
> +				: ACL_TYPE_DEFAULT,
> +			value, size);
> +		goto out;
> +	}
> +#endif
>  	/* Deal with NTFS extended attribute. */
>  	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
>  
> -- 
> 2.33.0
> 
