Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947703FCB
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 18:32:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id t10so95492785lfd.8
        for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 11:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G+CYfrIO1JCw1yxm6yg+/r1TsCdRkQWZWs7PCERtxoE=;
        b=NxxHSHEqx5cBCRtezWHHqmqIDBczPEzUFzqarhaQ7yDb9PcQXiK3pjqbgZII8wI/34
         fu006zFbJs1bfrRhChbg38ch4nSptHGRQobJ7gpR3Nf8MKdUBm1Ls0EP5J68I3jttFS5
         g88KyyqBWTs1fvTdgHOOXCnoNVWjIFgHBG40x5K+EwgOdMJNCuAdlpaiwrPskn0V9oov
         GOgA9aVyAT1ib22TcHjIYzqneT3hYbq7RHM/VwKHxckBoVIPr9vgJkbYAi84J2QQaFke
         XZpyBnr4fj9cuCcUhybTWojOBFxy+wJgkozCH+5Y/whW4hOvB2FXQiHvcbJH4pV1fEQg
         z3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G+CYfrIO1JCw1yxm6yg+/r1TsCdRkQWZWs7PCERtxoE=;
        b=MTwWdhCfey4bnp30NJkffG6y/6pAuwYINRQE8Ncso8hxkMg2kRON64ai2MtY+b5Smq
         mgnpGRgOlH+tZhSPmGyhi9ay/pt3TehWhkMSEE/cl32afN0RjeSkP+XLqMBPfl2BOhxp
         59vLNZiSzUnn10jpqEHdo89KKrfOp65KhirlLghn6fZIFHh1cNYUv69cUicrlHM+xxbU
         zHt8+UyRFOeKxPnl5U045xc0wfLzjEeL0C/ErjJnoy95xBlAUcdnEOK6bZ3mEKILHIPb
         tOZbSfOovUA+BzLyJmFxa7ju+iqAul+BZq4KGxhEsIdgHigWOJTwlaKPyYgoMOuuuqoH
         SkAQ==
X-Gm-Message-State: AOAM5336lXW/Zz0BpYjqkxkCcRhi6h4Z3jqsi6KjcVACpFtBIIDDqrij
	HZ10LLlieXwAk4UDqtb4Ln0=
X-Google-Smtp-Source: ABdhPJxI/hl8PMmYNQUW8K1GZjpDc+8DxBV5fxrptnA97ex+/ZC+hX89FNRKJ5SIB8Ui7ljOdI/FxQ==
X-Received: by 2002:a05:651c:988:: with SMTP id b8mr1385441ljq.187.1632853954646;
        Tue, 28 Sep 2021 11:32:34 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id t12sm1988158lfc.55.2021.09.28.11.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:32:34 -0700 (PDT)
Date: Tue, 28 Sep 2021 21:32:32 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Forbid FALLOC_FL_PUNCH_HOLE for normal files
Message-ID: <20210928183232.qi63jh2feknm3e7t@kari-VirtualBox>
References: <fad6f129-c53f-d751-be43-c403b1031449@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fad6f129-c53f-d751-be43-c403b1031449@paragon-software.com>

On Tue, Sep 28, 2021 at 08:25:58PM +0300, Konstantin Komarov wrote:
> FALLOC_FL_PUNCH_HOLE isn't allowed with normal files.

But is this absolute or just for now it can't? In my mind this can be
done, but you are expert here. Please write about it here. This will
help who ever will implement this in future. Example why ntfs_zero_range
did not punch a hole for normal file. You did actually implement that
function for this purpose right?

> Fixes xfstest generic/016 021 022

Lot of grepping is done with these so use full format generic/xxx with
each of these.

Also this affects also to these, but I did not look if there is other
problems than punching.

  generic/012
  generic/177
  generic/255
  generic/316


Add fixes tag here.
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

> ---
>  fs/ntfs3/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 5fb3508e5422..02ca665baa5f 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -587,8 +587,8 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
>  		truncate_pagecache(inode, vbo_down);
>  
>  		if (!is_sparsed(ni) && !is_compressed(ni)) {
> -			/* Normal file. */
> -			err = ntfs_zero_range(inode, vbo, end);
> +			/* Normal file, can't make hole. */

If this is just for now plese write example
			/* TODO: Can't make hole to normal files yet. */

> +			err = -EOPNOTSUPP;
>  			goto out;
>  		}
>  
> -- 
> 2.33.0
> 
