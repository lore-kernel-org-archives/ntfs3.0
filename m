Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A799D3FCB
	for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 17:48:00 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id y28so14996854lfb.0
        for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G9y8WEbtY6QF6b57YEwGzQEUKD9V6Jk3RH25jdHrWA8=;
        b=ggWl8gcJTzUpXp3eY8NqlJVCF7ShGCpHCNZbGbp85TgSMwj/mnxhcTzu6neTRUCK3P
         1Iuem+0ehT4+ne3pUWaabQZ2f+E6Q+yiTvZc2kUnyh8NkygS/6HTuN3RGb1SxmIHl+XO
         NSP67FnHAsAI8/gXIWbWvLd5SkR37lBIBssMzz1LgsQId2VKDarFcKuug5Q36l96se1j
         KTErk6wFZi1hYXBL2bKUxRPqXHvH8kI9lvlaH9rfpODd5Nl3NLyD6nqSt58yIzCYyow3
         l1fHia7Z3jRtX7nAERN/PzKjKSc/jMP31n7ZHNAnOYalvPl3eQSQ6v2QGZdK5btz7uIo
         ohhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G9y8WEbtY6QF6b57YEwGzQEUKD9V6Jk3RH25jdHrWA8=;
        b=ixjmEEewXtFyF07NagyBqmvRTvJFMOmsgUWjahNPqA1VfKnJnQ8I8iuQ3br/T2d0Wx
         wmDszqiFNoGTEShSYm99EWVfn92kwHNfH0Mr3D6G6o1Qpq/msz65wcXHJ3hDMZpn//Cv
         Bh/EmeIy5UF+mITqy3JFU5YhHbWWpYjDKwgoUnNPOy1x/1UNMBeGe9jwvJycgGGq7jyq
         bgtboYHeGOTPBt0+xutKTaHpC9w4cfmYi+8jy1QR04M0tITITQuEyp669+FT63rTLDmj
         eNkV4YUMCwR8QpMIR6qdVO4VK65Tt4XxXonQ94piR5bpG374BwHVoxZNG8CDU/+03xAS
         mjrg==
X-Gm-Message-State: AOAM533Q2HlZl7PYm+WnM26uWqIC+fqDKFMF9CemB86M1bKagrDwMjO+
	JUJZWtwH9zg/ip4hIocdAvo=
X-Google-Smtp-Source: ABdhPJxLK1CR/TgTp0A+dm819in8n44WpkccKCLelGAjOyHWB4aQIjh70pJqKUZawLll4Y+6l8PcRQ==
X-Received: by 2002:ac2:4e04:: with SMTP id e4mr249999lfr.262.1632332878397;
        Wed, 22 Sep 2021 10:47:58 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id v11sm229171lfi.56.2021.09.22.10.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:47:57 -0700 (PDT)
Date: Wed, 22 Sep 2021 20:47:56 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/5] fs/ntfs3: Refactor ntfs_get_acl_ex for better
 readability
Message-ID: <20210922174756.cgj66om2qro4ms3j@kari-VirtualBox>
References: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>
 <994cb658-d2f8-a797-e947-35ac0a203ea2@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <994cb658-d2f8-a797-e947-35ac0a203ea2@paragon-software.com>

On Wed, Sep 22, 2021 at 07:18:18PM +0300, Konstantin Komarov wrote:

There should almoust always still be commit message. Even "small"
change. You have now see that people send you patch which change
just one line, but it can still contain many lines commit message.

> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 5c7c5c7a5ec1..3795943efc8e 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -518,12 +518,15 @@ static struct posix_acl *ntfs_get_acl_ex(struct user_namespace *mnt_userns,
>  	/* Translate extended attribute to acl. */
>  	if (err >= 0) {

If err was ENODATA ...

>  		acl = posix_acl_from_xattr(mnt_userns, buf, err);
> -		if (!IS_ERR(acl))
> -			set_cached_acl(inode, type, acl);
> +	} else if (err == -ENODATA) {
> +		acl = NULL;
>  	} else {
> -		acl = err == -ENODATA ? NULL : ERR_PTR(err);

Before we get this and we did not call set_cached_acl().

> +		acl = ERR_PTR(err);
>  	}
>  
> +	if (!IS_ERR(acl))

But now we call it with new logic. If this is correct then you change
behavier little bit. I let you talk before I look more into this.

> +		set_cached_acl(inode, type, acl);
> +
>  	__putname(buf);
>  
>  	return acl;
> -- 
> 2.33.0
> 
> 
