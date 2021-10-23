Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC882C81
	for <ntfs3@lists.linux.dev>; Sat, 23 Oct 2021 09:35:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id t9so914007lfd.1
        for <ntfs3@lists.linux.dev>; Sat, 23 Oct 2021 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6ON3Zyd38dVy3J5eWV++FHn36HNb79c0btCWx3Q2tL8=;
        b=V7ZIyk67Xdk+NSLH4w8wxFqfN1H/d6AsN9xKYkTQq7Ue8h2b9Mj5UV6LJpgl37roWI
         fuNfwKv/fxgtTvHBpHphRq3gyXo55ncvmrxtYDhshcU5fsmsYtIBqhZwrvYvRsoI3JZr
         efzmJyFdkorGP1Aw1Pz2zAtFQBqpSgbF5B/Rney/Dk3wvpR+j8s/nxNKCpkbWcoPOrRc
         hhpjWcPCafbg2PYC7GHvNIjjEzT0DUivZxrAutf4oDkP29B5gAcAQAg2I9WSVaKL2ASq
         dWJHLIH/+xYEjJNzRdLNMo7X8z0rV58EmYrmc9e2bUGbPCz/8FQ2k0riwXuSsEIXrIoX
         Cf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6ON3Zyd38dVy3J5eWV++FHn36HNb79c0btCWx3Q2tL8=;
        b=ju1ydQhuY/bcg+wkA7+sPjeJmP0Jpd5MsJD5hII7F5HtwDWlIzS+5WmTEt3Ox4RhVq
         yBU32q1aQClEggzbBlQVf+kFSnzAGBbdhdMeI5UjIMiS77qttqdXPU1KEtbS/QSup+NL
         g8hVr5F9m73ChvkFBNHoF54AuygVdjSZqAS/zEG5f4FwMUYbT8RTjK7WzQDHIThBaJ+w
         HVtsjtCRnDJ/brTLB5OnrJLnCpOHlbRyvi2zOgdaBWjL0F672LR0HGWGXmJ5FgvBPKnF
         IuWjorPZldOh+OCjaPjMfpzebFats2GSVz7De+UdykS1E9by4lZh+j9q0f2K2scUEfnb
         oM5A==
X-Gm-Message-State: AOAM530BkqJXKUydkvKy+KVD4MNPVs0+Ty1x1c6P1Zq/UYJNsI6vnL7I
	ggECf/ThI0YVvp+IUFDHv/E=
X-Google-Smtp-Source: ABdhPJyfpzOgcdrfjEOiA+SknsMCgYBNpxu821BJTfnr5DT/J3prfLJDZKqoU5JQaHReZAK08YaBrA==
X-Received: by 2002:a05:6512:3048:: with SMTP id b8mr4733255lfb.517.1634981699960;
        Sat, 23 Oct 2021 02:34:59 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id r30sm975137lfp.298.2021.10.23.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 02:34:59 -0700 (PDT)
Date: Sat, 23 Oct 2021 12:34:57 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/4] fs/ntfs3: Restore ntfs_xattr_get_acl and
 ntfs_xattr_set_acl functions
Message-ID: <20211023093457.lelto5esrjvncah2@kari-VirtualBox>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
 <0aad4d9e-983b-6a79-15c1-61743081a1b3@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0aad4d9e-983b-6a79-15c1-61743081a1b3@paragon-software.com>

On Fri, Oct 22, 2021 at 06:55:09PM +0300, Konstantin Komarov wrote:
> Apparently we need to maintain these functions with
> ntfs_get_acl_ex and ntfs_set_acl_ex.
> This commit fixes xfstest generic/099
> Fixes: 95dd8b2c1ed0 ("fs/ntfs3: Remove unnecessary functions")

I get build error with patch 1&2 applied.

fs/ntfs3/xattr.c: In function ‘ntfs_xattr_get_acl’:
fs/ntfs3/xattr.c:631:8: error: too many arguments to function ‘ntfs_get_acl’
  631 |  acl = ntfs_get_acl(inode, type, false);
      |        ^~~~~~~~~~~~
fs/ntfs3/xattr.c:533:19: note: declared here
  533 | struct posix_acl *ntfs_get_acl(struct inode *inode, int type)

> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 2143099cffdf..62605781790b 100644
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
> +	acl = ntfs_get_acl(inode, type, false);
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
> 
