Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14F93FC7
	for <ntfs3@lists.linux.dev>; Fri, 24 Sep 2021 10:57:34 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id y28so38406355lfb.0
        for <ntfs3@lists.linux.dev>; Fri, 24 Sep 2021 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s17FqViMBOr8Te4pehncbfRy5I9CQXJfZ+kmZOISVmI=;
        b=h9etuSw1jD93JbwOUW3o4MInJt6oeyweOqViRx2JaKrpBJ36hKeubAJ5Bf8BbdB0ll
         TkTSbI2q65OmpuOOl5HBYOQgASys9d7IK4137Z0fPmsTGyVm+ZDS5XOg+a4YPkYGDLMl
         Auz1ekwhzwcSQPZcLekBTcNgIV0+Ki25HkUw9iLBVf+gpRjKcus/UrIGP5OosXiVPYNK
         hki9i0+Ej9YO7b0072Ntp6VsahNjZgLanQvmvBHlRilrPts2ytBEPCC+WnRgDrQRcgTp
         LsiOMZfkRl17WxmbsgyqGdipsSMhUmx2rhJ5GAN+tghRskWZP9He3d09h6tf8wMPRTH8
         F3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s17FqViMBOr8Te4pehncbfRy5I9CQXJfZ+kmZOISVmI=;
        b=qNY4t984oBhrGvBavK1bDwk8MJH5Hh1xyWq7K0fdN/dKAEokPmBVPfPDYkheYjmjww
         5WVPIzDKMNhHLJokov1xl4i8LfaHndih53G2A15LJMOdPevVQlSfoSQU7m5uSvj4VjuV
         M1NZqjFHijDg7sQ5prUEPyKBKP9TrQ7VPPRb7w8a76edNx2fDh276PhXNmcBHVq/Lj3R
         eNc9ns2o3WFrCqYX/aUH4ZU2D54iwBxS9wqhWs49+LryoUy9/3W474pGOqdczjDpYXDL
         N1bT66mYjO906u9XSY7GUMjlA0PAu5g+McGjv2O6UdRuByppYhAiJNB6u3b4Q6CjOho6
         /V/w==
X-Gm-Message-State: AOAM533MhFnR+MXUX5fslI2PudDsYWyRHtp+zkNieAH48f+0ggEf88tj
	AvzS+qDeEhs3FZrygKl0G/M=
X-Google-Smtp-Source: ABdhPJzenVfwFCRai6X+jcxzqXd58vHhLuJqJKoFAqquzev4tm44s0FiVN8Fd1wDnjDnvrMF4S39dg==
X-Received: by 2002:ac2:5f41:: with SMTP id 1mr9048364lfz.79.1632481052882;
        Fri, 24 Sep 2021 03:57:32 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id w19sm887695ljd.110.2021.09.24.03.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 03:57:32 -0700 (PDT)
Date: Fri, 24 Sep 2021 13:57:30 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] fs/ntfs3: Refactor locking in inode_operations
Message-ID: <20210924105730.2fyzesynznjieddj@kari-VirtualBox>
References: <a740b507-40d5-0712-af7c-9706d0b11706@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a740b507-40d5-0712-af7c-9706d0b11706@paragon-software.com>

On Thu, Sep 23, 2021 at 06:38:39PM +0300, Konstantin Komarov wrote:
> Speed up work with dir lock.
> Theoretically in successful cases those locks aren't needed at all.
> But proving the same for error cases is difficult.
> So instead of removing them we just move them.
> 
> V2:
>   added patch, that fixes logical error in ntfs_create_inode

Whole series

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> 
> Konstantin Komarov (6):
>   fs/ntfs3: Fix logical error in ntfs_create_inode
>   fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode
>   fs/ntfs3: Refactor ntfs_get_acl_ex for better readability
>   fs/ntfs3: Pass flags to ntfs_set_ea in ntfs_set_acl_ex
>   fs/ntfs3: Change posix_acl_equiv_mode to posix_acl_update_mode
>   fs/ntfs3: Refactoring lock in ntfs_init_acl
> 
>  fs/ntfs3/inode.c | 19 ++++++++---
>  fs/ntfs3/namei.c | 20 -----------
>  fs/ntfs3/xattr.c | 88 +++++++++++++++++-------------------------------
>  3 files changed, 46 insertions(+), 81 deletions(-)
> 
> -- 
> 2.33.0
> 
