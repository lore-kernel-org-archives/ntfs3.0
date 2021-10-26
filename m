Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE2B72
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 18:40:39 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id p16so847575lfa.2
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 11:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2B7Nuk56PYtXZAcRZA0VYMCuyr74J58C1m8umyHIOaU=;
        b=ZNeeUJBEHOBELTBzEakgjoftW/Sv91UOnDWRS1R8U0bonwBGmn3exCfmJzAPs16VwJ
         H3XmoA2iNbwuXpgzss4J2YzVzXg+ZSH04wZ5Q6T2U6pPpMD+2ALMelSEccXDqIzKc1ee
         JE0nnu2YDRcI6b7Y3v6X/MFy6GUKl2VWwfMhKOQDkM5xh7BUTmbkah+W5aqZNrEKARtA
         d2sX045a1z/WaBbkGNPIrmNooX4xVtoDxkpHue+L+AiDs7bWqJYr1FnK1dB8o+wMXpld
         r0Aw4uZHLOw2+Aqq/K9FYEVpMrpz6HNhV4/BAvCevLpTN7g1GLShmt0uv0Rfv4gWtjj+
         r4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2B7Nuk56PYtXZAcRZA0VYMCuyr74J58C1m8umyHIOaU=;
        b=hvqxzvFlDXfLhnLKrIZvzBog5+A1JUR91rVVVebuCoPViiUhtO08mNgYzMDYHQKKrb
         PjujeerFDUnCBu+bHKyJpzdFi3zjeBcziQzF8pW0ELuktsbprVTHSzR5LwSgqPmHv8Kj
         CXC1brdPMsEpCB4mShDx2OTZafgUTVkB4a1fOWPLEzyaX1no2v521wi5fWV1zO1xfbCb
         LHH8aZtLtdaXH5IwkPu6e1IQ848/8TRSEP2/Ox1zhuh2lT0YtE3vNC9U7zmO2ae25Rv3
         Fnlv7FRFajDAYrzCXMGw2a4mUtzsLvKEGun5NSEuLpme2F38bQ/P86iv87bMo5pD1nrZ
         cGAw==
X-Gm-Message-State: AOAM530NGutOICcNzmK1LwDHAw+1rDUjEzonEE83RpJ5QZdxZ4gLDxCp
	oGY9TFO2ZAvIiAHpVXg8V4T0HuzKs5U=
X-Google-Smtp-Source: ABdhPJwwtAabAKXq8k0TcRyNcUuYLOLsZi/bFhBN5H6Trb/Lr2poDcp2o599QFZ8mkBI4XbNhEJ9tg==
X-Received: by 2002:a05:6512:2386:: with SMTP id c6mr15352362lfv.55.1635273637533;
        Tue, 26 Oct 2021 11:40:37 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id s18sm2012983lfg.27.2021.10.26.11.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:40:37 -0700 (PDT)
Date: Tue, 26 Oct 2021 21:40:35 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/4] fs/ntfs3: In function ntfs_set_acl_ex do not change
 inode->i_mode if called from function ntfs_init_acl
Message-ID: <20211026184035.jkopoeaqukeofmye@kari-VirtualBox>
References: <25b9a1b5-7738-7b36-7ead-c8faa7cacc87@paragon-software.com>
 <67d0c9ca-2531-8a8a-ea0b-270dc921e271@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d0c9ca-2531-8a8a-ea0b-270dc921e271@paragon-software.com>

Maybe little too long subject line.

On Mon, Oct 25, 2021 at 07:58:26PM +0300, Konstantin Komarov wrote:
> ntfs_init_acl sets mode. ntfs_init_acl calls ntfs_set_acl_ex.
> ntfs_set_acl_ex must not change this mode.
> Fixes xfstest generic/444
> Fixes: 83e8f5032e2d ("fs/ntfs3: Add attrib operations")

Where does this commit id come from? Seems wrong to me.

> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 2143099cffdf..97b5f8417d85 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -538,7 +538,7 @@ struct posix_acl *ntfs_get_acl(struct inode *inode, int type)
>  
>  static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  				    struct inode *inode, struct posix_acl *acl,
> -				    int type)
> +				    int type, int init_acl)

Like Joe say. Bool here and use true/false

>  {
>  	const char *name;
>  	size_t size, name_len;
> @@ -551,8 +551,9 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  
>  	switch (type) {
>  	case ACL_TYPE_ACCESS:
> -		if (acl) {
> -			umode_t mode = inode->i_mode;
> +		/* Do not change i_mode if we are in init_acl */
> +		if (acl && !init_acl) {
> +			umode_t mode;
>  
>  			err = posix_acl_update_mode(mnt_userns, inode, &mode,
>  						    &acl);
> @@ -613,7 +614,7 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  int ntfs_set_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  		 struct posix_acl *acl, int type)
>  {
> -	return ntfs_set_acl_ex(mnt_userns, inode, acl, type);
> +	return ntfs_set_acl_ex(mnt_userns, inode, acl, type, 0);
>  }
>  
>  /*
> @@ -633,7 +634,7 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  
>  	if (default_acl) {
>  		err = ntfs_set_acl_ex(mnt_userns, inode, default_acl,
> -				      ACL_TYPE_DEFAULT);
> +				      ACL_TYPE_DEFAULT, 1);
>  		posix_acl_release(default_acl);
>  	} else {
>  		inode->i_default_acl = NULL;
> @@ -644,7 +645,7 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
>  	else {
>  		if (!err)
>  			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
> -					      ACL_TYPE_ACCESS);
> +					      ACL_TYPE_ACCESS, 1);
>  		posix_acl_release(acl);
>  	}
>  
> -- 
> 2.33.0
> 
