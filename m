Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9C3FC7
	for <ntfs3@lists.linux.dev>; Sat, 25 Sep 2021 08:50:17 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id u18so49506719lfd.12
        for <ntfs3@lists.linux.dev>; Sat, 25 Sep 2021 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IQgDYfiWEiQEpbbYGFHiSZcPZ0HKpZyuv+m5Uj0Q7bc=;
        b=ipVH7Z0kEWMasWb9TInu0N7M+mjgjidioW+2I/92X48jDaQTT1d60vyS422ebpUV0W
         NYaaZ7Mv1zhCULo5K/Y5TkdA6sAss7Cn9rXWmH0QiwTPcSr7UwLHS6VcWJZ4vFJQWK8O
         lN34z+grQ8OfPkk7u6nXMEaQZE01DuBQIMcpqfycQhm9uXZ/LgO1GcPRXjGNZjE1gets
         vNmfCnDh8+oay+sZnj15ght2BYX8w21AYyZHZ2toW2aqab75qATFAxpK9xasrTbzWRO8
         Qy+OeTXq5+iw2HwFMasfknevcquL077c1SVi3Fa16jAf24li+N7IstHZClqCLdsJfd3z
         d7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IQgDYfiWEiQEpbbYGFHiSZcPZ0HKpZyuv+m5Uj0Q7bc=;
        b=dZabD0rOnmym4jdyLt6A2Z+9UTJweASE4+HpCY4wzC5kMr+3f7K1gEuHGXLr/XxQOP
         JU/PEpF9fI49yAQBr9ENIz+lwUMPfb67nMBIe4wbMC9WHN/v1ixMv/7RmxA7C2HZ+Fyz
         o+nYKffzy7Lt9iWpwEmhf6WLDnziThjGXicZLnu4z7qQw3oooiW4/kcld6QYoIJKXWum
         RzQCYQjkHrm8PdNUtv6nJZeyzjE0IlGlgeG7JhjZWsApdRFQeN2+PuSfmVdhoq398zdq
         BKZt2DqG9+jTlq3wolh2nJo2NlggU6loqLViqGEb9SeHBPqynFK10lMGrfqMjoIDTqCp
         9Baw==
X-Gm-Message-State: AOAM530HARSr+1uosx8Wt0ySxqrgTIV6DYweRSIeuMATJdXewgM5N9kS
	tXJVzF3F7IJEClyHja0yxYqqxNQCmww=
X-Google-Smtp-Source: ABdhPJx4WPc/B9g65Cit+/OKgWAPcuY4GcG/h/VgSUKQvbLHHI8E/L48kzO3Wg7KZIMu3uxOZEfBRw==
X-Received: by 2002:a2e:4c12:: with SMTP id z18mr15502203lja.364.1632559815829;
        Sat, 25 Sep 2021 01:50:15 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z14sm1092473lji.102.2021.09.25.01.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 01:50:15 -0700 (PDT)
Date: Sat, 25 Sep 2021 11:50:13 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/3] fs/ntfs3: Use available posix_acl_release instead of
 ntfs_posix_acl_release
Message-ID: <20210925085013.e2mz4piogs75aipp@kari-VirtualBox>
References: <eb131ee0-3e89-da58-650c-5b84dd792a49@paragon-software.com>
 <bd40adc5-67c7-0f47-ed6f-da2540202de0@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd40adc5-67c7-0f47-ed6f-da2540202de0@paragon-software.com>

On Fri, Sep 24, 2021 at 07:14:53PM +0300, Konstantin Komarov wrote:
> We don't need to maintain ntfs_posix_acl_release.
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/xattr.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 83bbee277e12..253a07d9aa7b 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -475,12 +475,6 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  }
>  
>  #ifdef CONFIG_NTFS3_FS_POSIX_ACL
> -static inline void ntfs_posix_acl_release(struct posix_acl *acl)
> -{
> -	if (acl && refcount_dec_and_test(&acl->a_refcount))
> -		kfree(acl);
> -}
> -
>  static struct posix_acl *ntfs_get_acl_ex(struct user_namespace *mnt_userns,
>  					 struct inode *inode, int type,
>  					 int locked)
> @@ -641,7 +635,7 @@ static int ntfs_xattr_get_acl(struct user_namespace *mnt_userns,
>  		return -ENODATA;
>  
>  	err = posix_acl_to_xattr(mnt_userns, acl, buffer, size);
> -	ntfs_posix_acl_release(acl);
> +	posix_acl_release(acl);
>  
>  	return err;
>  }
> @@ -678,7 +672,7 @@ static int ntfs_xattr_set_acl(struct user_namespace *mnt_userns,
>  	err = ntfs_set_acl(mnt_userns, inode, acl, type);
>  
>  release_and_out:
> -	ntfs_posix_acl_release(acl);
> +	posix_acl_release(acl);
>  	return err;
>  }
>  
> -- 
> 2.33.0
> 
> 
