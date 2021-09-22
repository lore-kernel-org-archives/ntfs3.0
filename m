Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE9B3FC8
	for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 18:51:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id b20so15941798lfv.3
        for <ntfs3@lists.linux.dev>; Wed, 22 Sep 2021 11:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TVdYbzVz6L9w50OAN8iUpXr44c199Ry+YrB4JvrmzuU=;
        b=XhDztYIsxAa8cjARTwToxeBqNr3RFSJROe439D2C4d1++xECT6ukhhChELX3or3ymO
         awldyLjasKf59wVaHWsThVsQmZfrlKKngJ1aM0do2U0Lkdd4o9L8k3ceYLoYnFxO76qp
         svQIFrp5oRNKLXt0Fj6hqZJYlGOkFbC1tBe+lODs6/nRhu5ub2ZcoLhRlv7NE/9dP154
         PDKiSZokRhXyHUiYyl5sQT7KLMC26NDzgSSJVoMOAnkHFUYJww+j8/SRlhHDCkG6cXLm
         4vewTEIanzwHwJVG13uUdchNSp8JjAlBSW3n/fV69M/dbp580Han4QuMKabQC1nU+L13
         pPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TVdYbzVz6L9w50OAN8iUpXr44c199Ry+YrB4JvrmzuU=;
        b=zWl85XSNsYHsfZAMNd3CKBNahPoTX1/AxZVM9ow7DIduJw9hq1T3JRDDuFStD7XM8B
         LzTmiCz6AQy3uB9mZ4tLxM7GbIe67kWKzzr0VpCfpy9N4Jg548c2vrEYf3k9EI1aKeY3
         6bRzL03n8Iod2/528CT+rYd2KkACHcYc1P2Z/8Sb69UeS41uFYdvP5fTFqy/RB9MTl0v
         3gZnRZi3yxL4P13py0bopXi9fA7GhApD0XVswqPGGynRfPHPwEdCXgtpu5ySJAf+dqYC
         pitRC7fd2M5gf39LwQDC5CfBZATLmQQnkWGb9Yiwc/epwpSqEcDdsoLZm94GzW70vPKM
         52AA==
X-Gm-Message-State: AOAM531z6onFJv4L93hlNCD9HHQwKrmjYaeWaKYOlbNPr6/E73/e4l22
	B5dH3u6UP2/dBtXw+b3akHQ=
X-Google-Smtp-Source: ABdhPJyXuXlABlOCKqBOspLUw2wr+pcY6KLy6RyaUp3HLUSDjtqsTkWsufvlbMKSTJZcGw+uptSFgw==
X-Received: by 2002:ac2:5978:: with SMTP id h24mr461208lfp.426.1632336683335;
        Wed, 22 Sep 2021 11:51:23 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id a16sm239618lfu.274.2021.09.22.11.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 11:51:23 -0700 (PDT)
Date: Wed, 22 Sep 2021 21:51:21 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/5] Refactor locking in inode_operations
Message-ID: <20210922185121.gke6tigiqkfwovis@kari-VirtualBox>
References: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2771ff62-e612-a8ed-4b93-5534c26aef9e@paragon-software.com>

Subject in this message needs fs/ntfs3 minor thing but try to remember
next time.

On Wed, Sep 22, 2021 at 07:15:19PM +0300, Konstantin Komarov wrote:
> Speed up work with dir lock.
> Theoretically in successful cases those locks aren't needed at all.
> But proving the same for error cases is difficult.
> So instead of removing them we just move them.

Maybe add this info also to first patch. 

Overall nice to see now good patch series which has very nice splits. It
was easy to review. Like I say in same message already try to write
little more to commit messages this will make reviewing even more easy
and we start to get nice history which can be used to develepment and
maintain work.

> 
> Konstantin Komarov (5):
>   fs/ntfs3: Move ni_lock_dir and ni_unlock into ntfs_create_inode
>   fs/ntfs3: Refactor ntfs_get_acl_ex for better readability
>   fs/ntfs3: Pass flags to ntfs_set_ea in ntfs_set_acl_ex
>   fs/ntfs3: Change posix_acl_equiv_mode to posix_acl_update_mode
>   fs/ntfs3: Refactoring lock in ntfs_init_acl
> 
>  fs/ntfs3/inode.c | 17 ++++++++--
>  fs/ntfs3/namei.c | 20 -----------
>  fs/ntfs3/xattr.c | 88 +++++++++++++++++-------------------------------
>  3 files changed, 45 insertions(+), 80 deletions(-)
> 
> -- 
> 2.33.0
