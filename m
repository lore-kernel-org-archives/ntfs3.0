Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C3A3FCB
	for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 18:23:51 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id x27so15570296lfu.5
        for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 11:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wKRwU9c+/pSkhmvdQwO2DPV9Q3SZon6fkbx8oBC8l1g=;
        b=LEoLv+U1//8JcyzFn3DpD/I2BUc/E2ldSsQdrzSYBYjVSdztxjniRdFePUDBUhKJa7
         Gfqycnonsb7pav9/IPFNt+1mg5Op1xL5NgIwaHNHmxLjXd9h3boGhuxQfWNIzul/Ecah
         ztQHhgfEMExp4nV4gym0n+3Sb8HwEt7Q55wlkS5Adj1OQdBLT5hcgStknO+kj0M8e4yt
         aRM/YefMB2V5/BY7mGe74BanUupiPfbI96aRVBx5C4KUSZzB+XEeehZx9MD25V23H+Yw
         FDpzPvAf3w284n8Lz+TPefKyvdKpArTOSMkYaKrEIqPkYIweQsUv96Skhm9zuSmLJMBv
         NEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wKRwU9c+/pSkhmvdQwO2DPV9Q3SZon6fkbx8oBC8l1g=;
        b=GHn5Pae1t9eegMtm6EQnEuxNdg7zeI4dw8NmUS+cASsOQPQrQo8iSeHZ3qe4tc0yrT
         O0hj2HPGxH8VYVtlbROxUGWEKI3zq/eCQS0XetN45ulB34BmBxQ70hc8sqf9BtTpRRvf
         pvx+eeU9aYFjONY1/XXHP8Ck+/yOZPhcyOF2WmHxS8VzJS4t4Ow61Fq8PBPOVsfp/K8C
         o43DNCB9x2cUXh9YiJ6omlaPBGO/3Zrb44m1yGXA5HJ6R/zTKyUaazo20Lzvt+/JbChL
         F50Au6Di3CeeGgTKC2mR2Ni+jdWeZWBzFh3z7Jx2EMY1YoIbmKmMfz+bjOZmBLUsNMdV
         HZCw==
X-Gm-Message-State: AOAM532/VuaQoDxcWuqcndvFFGqiZiHctU6ACansFCr9V+RpXOFSFeSl
	Nn7BrzmRSfZ659UzZUeoWhZjHq6FG5rwWQ==
X-Google-Smtp-Source: ABdhPJw0ar4WYCQsQMIEXySCREhX0gOjWrAnByoMEycfOFe0yVzzH+jeZZFKy7YcxQZOs1PN9uxhkA==
X-Received: by 2002:a05:651c:170c:: with SMTP id be12mr746530ljb.230.1632335029441;
        Wed, 22 Sep 2021 11:23:49 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id w13sm235378lft.94.2021.09.22.11.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 11:23:49 -0700 (PDT)
Date: Wed, 22 Sep 2021 21:23:47 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] fs/ntfs3: Change posix_acl_equiv_mode to
 posix_acl_update_mode
Message-ID: <20210922182347.yp4gxxoljc3vfnuu@kari-VirtualBox>
References: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>
 <18250134-b9a0-c2af-ce7f-9ec01ddfdb9a@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18250134-b9a0-c2af-ce7f-9ec01ddfdb9a@paragon-software.com>

On Wed, Sep 22, 2021 at 07:20:05PM +0300, Konstantin Komarov wrote:
> Right now ntfs3 uses posix_acl_equiv_mode instead of
> posix_acl_update_mode like all other fs.
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/xattr.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 70f2f9eb6b1e..59ec5e61a239 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -559,22 +559,15 @@ static noinline int ntfs_set_acl_ex(struct user_namespace *mnt_userns,
>  		if (acl) {
>  			umode_t mode = inode->i_mode;
>  
> -			err = posix_acl_equiv_mode(acl, &mode);
> -			if (err < 0)
> -				return err;
> +			err = posix_acl_update_mode(mnt_userns, inode, &mode,
> +						    &acl);
> +			if (err)
> +				goto out;
>  
>  			if (inode->i_mode != mode) {
>  				inode->i_mode = mode;
>  				mark_inode_dirty(inode);
>  			}
> -
> -			if (!err) {
> -				/*
> -				 * ACL can be exactly represented in the
> -				 * traditional file mode permission bits.
> -				 */
> -				acl = NULL;
> -			}
>  		}
>  		name = XATTR_NAME_POSIX_ACL_ACCESS;
>  		name_len = sizeof(XATTR_NAME_POSIX_ACL_ACCESS) - 1;
> -- 
> 2.33.0
> 
> 
> 
