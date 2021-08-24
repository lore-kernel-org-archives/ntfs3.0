Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ACA72
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 16:38:56 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id h1so10485205ljl.9
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WcbXWm6oOaII+80v56ACkIrGHjl86sgP+RyMxyJ09A8=;
        b=VgxR+vLNCWaXX9vH/TiuNk1s8Blpj/bHixJKjJU8IGBVkICQ7DLFmkxnyRWOxZ/0uw
         daB4SlrZ4MqsYuoMQpI0of0QMv4MM3OcWX065ZRTbRMTnRPsngLy2R6JpCcMoijeHmP/
         0JslrMM3Yx9RR1/AWzAffIk322NP1mjsmufc1i8I56HpqDrpSZXXxx1rEBF1C8LC3D75
         Zda4qNu88qlU9byf/V5g1l7NeH9wpfbtRuydUbiHRc48uhnh+i8/WXvV6rOrgbp0xFXr
         yGyCK1zFOFfv9CNLimnl9JfCMGVHaQxG22WTaV5/QM6xw736/WAyZ6HL7Vl+PMeMRJRg
         sHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WcbXWm6oOaII+80v56ACkIrGHjl86sgP+RyMxyJ09A8=;
        b=aiZWQKo882tZiXwIJ25MUVD3/GXd3JR5DQm4t+Gbv/mFlSSkgkmaRkI6p+KbwFZuuI
         roLpdWd1nUEVmdL1lUZ6kh8Jg/10CUhpbXcWrDGZLEjtErzK1wql8+NV/4so4S4iMryx
         GpdKkWf191n8v4KtoQ0bl1waNyGLdAFYF5xFt45/tvDBo08HARGRaHdvPJDU9u7WAgV5
         6W6L7lvKu0T9rR3Vz3EOjN6nlQl6RAmIEfr1izaHrjdxZrUSiJaGuQrBX2AUpPq1bvmM
         8cND2YGaXN+JuKYttlHq0snN4ZLvAwqXQ3JyVSfmCAEIQ5W2eqiEIkgosm4PH0BwN1Z7
         tKFg==
X-Gm-Message-State: AOAM5339ZQtgUBrMSOhUzxMOtpr6SsiMBIuLvSHeY6CbfvE/bHE/1TCs
	vF4P8V/NgIops3uMIocgmjU=
X-Google-Smtp-Source: ABdhPJzDvjUxWIex+xrOYK6wlSZ+gkF2dbG3MzCDm/VmX9bJU/GDpgRr9W5Bxm5NUsP2QJiV2bruUQ==
X-Received: by 2002:a05:651c:235:: with SMTP id z21mr31938880ljn.462.1629823133430;
        Tue, 24 Aug 2021 09:38:53 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id o16sm210439lfu.45.2021.08.24.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:38:52 -0700 (PDT)
Date: Tue, 24 Aug 2021 19:38:51 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: fix an error code in ntfs_get_acl_ex()
Message-ID: <20210824163851.hfbjqqpztgk4ngd5@kari-VirtualBox>
References: <20210824114858.GH31143@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824114858.GH31143@kili>

On Tue, Aug 24, 2021 at 02:48:58PM +0300, Dan Carpenter wrote:
> The ntfs_get_ea() function returns negative error codes or on success

Not reletad to this patch but ntfs_get_wsl_perm() seems quite bug
because in there ntfs_get_ea use is not checked at all.

Also ntfs_getxattr() should probably send errno if ntfs_get_ea() is 0.

> it returns the length.  In the original code a zero length return was
> treated as -ENODATA and results in a NULL return.  But it should be
> treated as an invalid length and result in an PTR_ERR(-EINVAL) return.
> 
> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I'm not super familiar with this code.  Please review this one
> extra carefully.  I think it's theoretical because hopefully
> ntfs_get_ea() doesn't ever return invalid lengths.

ntfs_get_ea() will return 0 if no info and this can happend quite
easily in my eyes. 

Here's snippets

ntfs_read_ea()
{
	attr_info =
		ni_find_attr(ni, NULL, &le, ATTR_EA_INFO, NULL, 0, NULL, NULL);
	attr_ea =
		ni_find_attr(ni, attr_info, &le, ATTR_EA, NULL, 0, NULL, NULL);

	if (!attr_ea || !attr_info)
		return 0;	
}

ntfs_get_ea()
{
	len = 0;
	err = ntfs_read_ea(ni, &ea_all, 0, &info);
	if (err)
		goto out;
	if (!info)
		goto out;
out:
	return err ? err : len;
}

> 
>  fs/ntfs3/xattr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 9239c388050e..e8ed38d0c4c9 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -521,7 +521,7 @@ static struct posix_acl *ntfs_get_acl_ex(struct user_namespace *mnt_userns,
>  		ni_unlock(ni);
>  
>  	/* Translate extended attribute to acl */
> -	if (err > 0) {
> +	if (err >= 0) {

So now if err (size) is 0 it will try to get acl. Didn't you just say
that you want to return PTR_ERR(-EINVAL)?

So overall good finding but maybe more work is needed with this one.

>  		acl = posix_acl_from_xattr(mnt_userns, buf, err);
>  		if (!IS_ERR(acl))
>  			set_cached_acl(inode, type, acl);
> -- 
> 2.20.1
> 
> 
