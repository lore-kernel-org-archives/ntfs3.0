Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD172
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 18:56:24 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u18so80314630lfd.12
        for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=55NNLkzh4OV0HaDhGAfkYTMJbrnWOQ8oEUJeJ/f86gw=;
        b=qAqVdxNXLK14ymGl3fh1f9w/ojIt5TaWdSHoV3mWcV/j8nZqm2VpqUarXQT8NfWHVU
         lrui9mpdAGz2aGk9gOEkCwfenG2w6HX8ck+enjShoXKeZ0ZVsXr/q+tpU+i5SxZxc8Hu
         eu/TRAdmTVv3xL7G3XTVCujP87ArhYTYnXfUsqKQp5IV+K/SbWmRT/Eh9JEKMXID58/R
         8PAyrDm1U48hR5lFjhEdkJrPB4QENWmZ/kr+g/iXyVGm97+/XTVTQU5d6KGZACaa0v4g
         XF3fN0kqm5GmgEeW1vBKmDT48yE5oS9Xa+728o6P2FmdQbzK8wzBPNqd5YdM2JsmowGx
         WcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=55NNLkzh4OV0HaDhGAfkYTMJbrnWOQ8oEUJeJ/f86gw=;
        b=dzGW1bMjLMwMbw4qa+fUZgiscBFB2E9buev9HFj1deyzfcGSCswZy+3RIOXl92o8uv
         5UOCdsoaTgm6Mcsg6CZq2NpMt5MNGAwzGheoVa2T4uCjVQUke5iWir10y+tolClxqmZv
         c0y4jCM1X34oAHP8ABLe1ZzxtRdAvkyRLqmpZEAjTmGov5ZwWDuBMxGI/LsmvwqUEh/o
         2QfsogVLe5wHcyDPC/PrAUqb6iQMhINgrX3qV1ijX6siSG2+AZckUfEN0szrsZWj0UzB
         5xCAStukBppowXLI0/6PJAVShreSmLXdVBVlQrezvgdxGBNNyEr1HAvQamtNC6wS3/wt
         R0Aw==
X-Gm-Message-State: AOAM533FVIv+L/4+PZD5rRuHMlyczBfO0O3Bt+rbhbPs+LrTZJTyLhJ8
	w/z6eSjllLPNxI80YPIv44o=
X-Google-Smtp-Source: ABdhPJz20UD8kziRnhnOjCTNqYNd/ZDhoWteKL22IT3u5/CC/UtxU/e85F6Cwyzu1Le3mymQ+1mjmQ==
X-Received: by 2002:a05:651c:178e:: with SMTP id bn14mr1414191ljb.521.1632768983055;
        Mon, 27 Sep 2021 11:56:23 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id 8sm2075331ljf.39.2021.09.27.11.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 11:56:22 -0700 (PDT)
Date: Mon, 27 Sep 2021 21:56:21 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] fs/ntfs3: Reject mount if boot's cluster size <
 media sector size
Message-ID: <20210927185621.2wkznecc4jndja6b@kari-VirtualBox>
References: <16cbff75-f705-37cb-ad3f-43d433352f6b@paragon-software.com>
 <6036b141-56e2-0d08-b9ff-641c3451f45a@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6036b141-56e2-0d08-b9ff-641c3451f45a@paragon-software.com>

On Mon, Sep 27, 2021 at 06:48:00PM +0300, Konstantin Komarov wrote:
> If we continue to work in this case, then we can corrupt fs.
> 

Should have fixes tag.

> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/super.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 7099d9b1f3aa..193f9a98f6ab 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -763,9 +763,14 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
>  	sbi->mft.lbo = mlcn << sbi->cluster_bits;
>  	sbi->mft.lbo2 = mlcn2 << sbi->cluster_bits;
>  
> +	/* Compare boot's cluster and sector. */

Pretty random obvious comment and I do not know what this does in this
patch.

>  	if (sbi->cluster_size < sbi->sector_size)
>  		goto out;
>  
> +	/* Compare boot's cluster and media sector. */
> +	if (sbi->cluster_size < sector_size)
> +		goto out; /* No way to use ntfs_get_block in this case. */

Usually comment should not go after line. If you take chunk from patch
3/3 then this is not issue.

> +
>  	sbi->cluster_mask = sbi->cluster_size - 1;
>  	sbi->cluster_mask_inv = ~(u64)sbi->cluster_mask;
>  	sbi->record_size = record_size = boot->record_size < 0
> -- 
> 2.33.0
> 
> 
> 
