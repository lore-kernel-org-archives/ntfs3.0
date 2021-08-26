Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D8272
	for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 09:13:08 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id x27so5374738lfu.5
        for <ntfs3@lists.linux.dev>; Thu, 26 Aug 2021 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uAeW0bZoh0iK5l+N3SDVp3ny4xQF84Vt5egfXy8ko2Y=;
        b=Zp3TPcAuAnWtRXZCFhVIN6Jielbpd+NJ36tnaTvptvXXAGkNVFSrpCgdDeMpydiBBH
         3fTrXDla6OU1RtSPAfJG9spsvx/tTBikBfTCHyzqYQakGM8idLK7XRvpMyonyVRfD4J2
         1fHf7geCy5lnc7n/PS2mrqGGPykzZMYqz5zYuxmPvEpcO0bKpdxTvxmXcC4BT6JlIU5W
         GEviprpVcRrNCm1Woz6bGi73IYRwaB7zK2K6vpoYh8ML5fKjauyQ8M4TEZ20e+99jmjM
         CwxMXRVQmssEOtYicl1Gi/rZaPtd9SqyqHtcNMz5SqL6xjLR1/xhjAiSSv0R5tqDn1L9
         J0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uAeW0bZoh0iK5l+N3SDVp3ny4xQF84Vt5egfXy8ko2Y=;
        b=GjTY5OZ2qsGpsUaZLk6RUV3unYCPVMofwR0k5HJYX7f0hONPlP18tNNtkKETwavO/R
         /0LvS1bxDKbMLkecehCfPtQSpT+PYJ9f/kTHYiPHdmpDBIrjQIzYH7JDN0JH6CI0kuxP
         ZKHyaxEl7G6Qn0068dd1QBurVpJ0KlyAaAkfRgx7nFX6uBBVOvQ8l8YRAfyDMvVQvtOb
         jErgg7/ig9IcGR/aE6j3KbldoogqTwK2tYRY0imr8x3W9gDuXvBMi9E2knOp2px7Lx4J
         DMPwhyO2284vhst435YpQeLrPULRenPOrvO7SPHEjG8KqnUicaQH/Sa9KEhNv+CO7eeT
         yxzg==
X-Gm-Message-State: AOAM531VBIj8nUcFbTm7N8c6qYpK9Qr7Jr22uqBUHbHAsoHThYzzxVpY
	679u9AixYsdqys2016TDh/ZhtzNIZh4=
X-Google-Smtp-Source: ABdhPJzaKhiFOUMFDHh7N2HZ/tjhBifOi1uOZjdPE2Zo/CHWIHlnBRGTkSi9ic2ksK1ILLE05mmnJQ==
X-Received: by 2002:a05:6512:1094:: with SMTP id j20mr2003519lfg.197.1629969187056;
        Thu, 26 Aug 2021 02:13:07 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id u10sm259531lfs.181.2021.08.26.02.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:13:06 -0700 (PDT)
Date: Thu, 26 Aug 2021 12:13:05 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH 1/2] fs/ntfs3: Fix pass zero to ERR_PTR() in
 ntfs_get_acl_ex
Message-ID: <20210826091305.2bimmxwmzw4qmtyg@kari-VirtualBox>
References: <20210826083549.1565173-1-kari.argillander@gmail.com>
 <20210826083549.1565173-2-kari.argillander@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826083549.1565173-2-kari.argillander@gmail.com>

On Thu, Aug 26, 2021 at 11:35:48AM +0300, Kari Argillander wrote:
> Fix smatch warning:
> 	fs/ntfs3/xattr.c:529 ntfs_get_acl_ex()
> 	warn: passing zero to 'ERR_PTR'
> 
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---
>  fs/ntfs3/xattr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 98871c895e77..944557d3a769 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -525,8 +525,10 @@ static struct posix_acl *ntfs_get_acl_ex(struct user_namespace *mnt_userns,
>  		acl = posix_acl_from_xattr(mnt_userns, buf, err);
>  		if (!IS_ERR(acl))
>  			set_cached_acl(inode, type, acl);
> +	} else if (!err || err == -ENODATA) {
> +		acl = NULL;
>  	} else {
> -		acl = err == -ENODATA ? NULL : ERR_PTR(err);
> +		acl = ERR_PTR(err);
>  	}
>  
>  	__putname(buf);

I just notice that this is same as Dan already has sended:
https://lore.kernel.org/ntfs3/20210824114858.GH31143@kili/

You can choose if you prefer this or that. Sorry for double patch.

