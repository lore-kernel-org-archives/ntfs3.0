Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A07A2C80
	for <ntfs3@lists.linux.dev>; Sat, 16 Oct 2021 10:42:13 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id t9so52296996lfd.1
        for <ntfs3@lists.linux.dev>; Sat, 16 Oct 2021 03:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JE2ZEhnUZTL3zV3Jn9NvK7Qo/yNCMgF3TmpQvT7J8Zg=;
        b=T/x9sy7/FO+PHLiFkOYn3cDMPoMa0Vv5EmeswMChUTYXoOPbERNuLBQzKvWguiu61W
         tf4BnfgZDeRMZ072LrHly+MoZ3O5GMk6uG6LJ10e4u/Pr+4nFQ+pdC3y524BDiIruMxG
         1ixN6ZlvPtlxGDhv7Thb00oDFC4uzo3v3jvIqmxivov+J/agUsJrSVjgF09FmXwNkEr6
         nNzj8pdKASz9xpqPfXsnC0iCJuginWVKQcDQPOXBzlLv+PDxllC946aaPOerjBRpHsXk
         JJqRST//jBeeiioEQ4ZbpF8SJEMo7QpXhS5xUtEB8bYq51oN1tvLatAOUKSvholtsu9w
         pPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JE2ZEhnUZTL3zV3Jn9NvK7Qo/yNCMgF3TmpQvT7J8Zg=;
        b=M3Cq/+nqtcTboGuIzUN/BSJlpVK7pnTt4ebNoQi/0hLJ8bHIYt52uRIK+WYg8aiEVR
         vs6Xad8nQMqxjzWnEqg/pgDgxFI1H14bl2PwDI1GBAKvpc4XDx3wVPZktRklOvNT4tLk
         OKfXHBwahxetX9zHnuTQZLdmdEPgKBQO/5J571bzCUdqg4JIoCWyldr5VOMkOIxrcMaV
         Ue+4LW9k8ds+Dvmz0SBs8kixdBXHbi0rbCJNgQp+BvUsbemEo8zhPIFVdT0O0kEXdJjC
         PpRwsfx4xvsB9wXRMnEk/g66oMQzOo2xcdkG80h0K8fW7R+HpF8oE06hDxx5l48rnW7S
         M3IQ==
X-Gm-Message-State: AOAM533VaoU48K6pY9ZmiKvkAJiP29fknQAu5FZwruzN27UpihHyAkj/
	nQzF4fLKvByeoFNZSTZuGM8=
X-Google-Smtp-Source: ABdhPJz1rS1St0yUfy676/Y4tMxC9j5/ojmJ9VJqWqk2IHUPPHCwGEVV6xyYm24k+7r/G+MAwvAAJQ==
X-Received: by 2002:a05:6512:3b21:: with SMTP id f33mr16820364lfv.88.1634380931402;
        Sat, 16 Oct 2021 03:42:11 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i8sm809164lfb.227.2021.10.16.03.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 03:42:10 -0700 (PDT)
Date: Sat, 16 Oct 2021 13:42:09 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs/ntfs3: Remove unnecessary functions
Message-ID: <20211016104209.r6mgz2ote4jcmgcj@kari-VirtualBox>
References: <992eee8f-bed8-4019-a966-1988bd4dd5de@paragon-software.com>
 <2ce78ab6-453d-d7bf-9969-eb47b7347098@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce78ab6-453d-d7bf-9969-eb47b7347098@paragon-software.com>

On Fri, Oct 01, 2021 at 07:02:12PM +0300, Konstantin Komarov wrote:
> We don't need ntfs_xattr_get_acl and ntfs_xattr_set_acl.
> There are ntfs_get_acl_ex and ntfs_set_acl_ex.

I just bisect this commit after tests

"generic/099,generic/105,generic/307,generic/318,generic/319,generic/375,generic/444"

fails for me. Fails happends because mount option acl was not defined.
Before they where skipped, but now fail occurs. Also generic/099 was
passing if acl mount option was defined, but after this patch it also
fail. Every other test fail for me as well, but that is not related to
this patch.

So should we revert or do you make new patch to fix the issue or do you
think we won't have any issue here?

  Argillander

> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 94 ------------------------------------------------
>  1 file changed, 94 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 83bbee277e12..111355692163 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -621,67 +621,6 @@ int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  	return ntfs_set_acl_ex(mnt_userns, inode, acl, type, 0);
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
> -	acl = ntfs_get_acl(inode, type);
> -	if (IS_ERR(acl))
> -		return PTR_ERR(acl);
> -
> -	if (!acl)
> -		return -ENODATA;
> -
> -	err = posix_acl_to_xattr(mnt_userns, acl, buffer, size);
> -	ntfs_posix_acl_release(acl);
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
> -		acl = posix_acl_from_xattr(mnt_userns, value, size);
> -		if (IS_ERR(acl))
> -			return PTR_ERR(acl);
> -
> -		if (acl) {
> -			err = posix_acl_valid(mnt_userns, acl);
> -			if (err)
> -				goto release_and_out;
> -		}
> -	}
> -
> -	err = ntfs_set_acl(mnt_userns, inode, acl, type);
> -
> -release_and_out:
> -	ntfs_posix_acl_release(acl);
> -	return err;
> -}
> -
>  /*
>   * ntfs_init_acl - Initialize the ACLs of a new inode.
>   *
> @@ -848,23 +787,6 @@ static int ntfs_getxattr(const struct xattr_handler *handler, struct dentry *de,
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
> @@ -977,22 +899,6 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
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
> -- 
> 2.33.0
> 
