Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AC52C81
	for <ntfs3@lists.linux.dev>; Sat, 23 Oct 2021 09:56:03 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id br29so393884lfb.7
        for <ntfs3@lists.linux.dev>; Sat, 23 Oct 2021 02:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LXv2Bng4C8uj1DNivI+o5gz96luQJc9s1jkjFvg2HPM=;
        b=FNfLdmxXyGg552hX75/Ju2SLVddrS3u3m2N/LBTcy59HUYPb2JtpHiLmUjAvPlaMxP
         LY3vbPS5xMLnp+Exyqy2PKaInV8DxfpXtAb8neFrZ/GrdFYis0zKrDV2c/bbr2KHJ+Uw
         k18Cpp2YvbBDy37GV73VIgFjEGhKpazb2303L04g7tDXzR84f+PN5+DmDxIBI7rEVbSG
         eVm34SU5GznIsuOJZd+GVJD8bvFdsV2BLg/4HQVNf5z6KPvKR6IcRdyrupj5ZdQjYCtF
         VVLYsr3uIVPtnQ8rVZiHbZANIPbzubXc6c9p4VQ4l1y5rszXTGY82dr6kC9qNydy3md5
         0hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LXv2Bng4C8uj1DNivI+o5gz96luQJc9s1jkjFvg2HPM=;
        b=3w9L+SKcSeeCxP3g5F439/skKEO/sOvztojmyPrJ6C+ew4izD8Nm4HTaQo9OntEa0r
         L7Avx33w8mUaN2Sm86+L/4ysTtHUKSYNfznYDvdBEtqE/J0IrFa4dxmbwObP/arZJv+T
         U5X8IMESexJCcho3r/qBAeRmUyPIhhBsuZ/G/uEka7Yalk01T1TUDvJZd2DuYrvJPmPB
         6fas0nzuoGZBPR5J0mb4BkkHR5HNCfWkZAeVoAbFWo3n/hmwDa5ZxflIWuD7+gaFmEWG
         R6Ql/3yAjCmCw5ndoFanke/05kEMPrgdRD0olGzgIS1nv9o5Ts2njxdCJ1JjQbifENEP
         vmxQ==
X-Gm-Message-State: AOAM530LQzxSLiTmgQyoYXuF2KTx1riDk8hjQiSbSszIK7eXiNh7OZz1
	5t4yAu1vvuNuJLsXS3MU6cE=
X-Google-Smtp-Source: ABdhPJzh395qQXJTPuGWeDEcS/35igOwFxdh/Pf4A1OMsfPxknPxuIH3cuL+1C6rzTvcjEnKVySFiw==
X-Received: by 2002:a05:6512:926:: with SMTP id f6mr4904456lft.495.1634982961249;
        Sat, 23 Oct 2021 02:56:01 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id v62sm980321lfa.23.2021.10.23.02.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 02:56:00 -0700 (PDT)
Date: Sat, 23 Oct 2021 12:55:59 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	hgkamath@hotmail.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/4] fs/ntfs3: Keep preallocated only if option prealloc
 enabled
Message-ID: <20211023095559.ythxb2z2ptdrlr5s@kari-VirtualBox>
References: <09b42386-3e6d-df23-12c2-23c2718f766b@paragon-software.com>
 <aaf41f35-b702-b391-1cff-de4688b3bb65@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaf41f35-b702-b391-1cff-de4688b3bb65@paragon-software.com>

On Fri, Oct 22, 2021 at 06:54:31PM +0300, Konstantin Komarov wrote:
> If size of file was reduced, we still kept allocated blocks.
> This commit makes ntfs3 work as other fs like btrfs.
> https://bugzilla.kernel.org/show_bug.cgi?id=214719

Link: https://bugzilla.kernel.org/show_bug.cgi?id=214719
> Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
> 
> Reported-by: Ganapathi Kamath

Add <hgkamath@hotmail.com>

I also added to loop here. Ganapathi can you test if this patch fix your
problem?

> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 43b1451bff53..3ac0482c6880 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -494,7 +494,7 @@ static int ntfs_truncate(struct inode *inode, loff_t new_size)
>  
>  	down_write(&ni->file.run_lock);
>  	err = attr_set_size(ni, ATTR_DATA, NULL, 0, &ni->file.run, new_size,
> -			    &new_valid, true, NULL);
> +			    &new_valid, ni->mi.sbi->options->prealloc, NULL);
>  	up_write(&ni->file.run_lock);
>  
>  	if (new_valid < ni->i_valid)
> -- 
> 2.33.0
> 
> 
