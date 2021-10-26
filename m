Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E02CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:49:27 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id o11so936347ljg.10
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MfhT4N6HySGsZVTB+gb4TOj2DaCrmcyBq8zlpYg5bXA=;
        b=JEpTCrYt+keusPenYONbOSOCR4fVa/ESO3wwOdldtW2f2uPNGp7BqdnHKeIVZ/9Ux7
         fXFbdXaettf1aJcMYQlZN90huwDMnryWo54ra72e/tYJgo2sBjRBWQ4Ny/z3JRqGpAQL
         7SAJnrv+f18CN734QLFnerThLQUnuv0d8s/poHcjgUjf1OJ3nXlSai0F7i1epoUxLfGM
         r/s8DAGZu5nrIZYGby85ugycTmLFdpzJ7mjsnJJFlMNSKdtp+rlLB8qLLz8BuZrCMTr5
         RWOxnnFUJ9z08ip0JoaJ0kdbOeda4MUUiOtkURqmjtaGCkDWBxDiPIe6SvPcTjUOgHH8
         Gjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MfhT4N6HySGsZVTB+gb4TOj2DaCrmcyBq8zlpYg5bXA=;
        b=orMhFtgBgsgOtOJojRuh4qidSFaOXaDX5ZYnCToteS3dQmLCv1/vBJI6gLCFtI2mAy
         dc2KPoqS45KzpaxT6+1coXUGeUK95wWX883fZbXmi4N+rOsX4w5OyUG2jcpW+VcC4PLw
         3GbfiIeuPvXzzrR9sJKneSf0FBIK1t4eKLHalg3kMEItM5C11kGpm8+Pirtmiw65zUqL
         8ZGMCWlETbGlOsSkMp7/AgERem3HWhcQL/E0BU2QivCJQc2vu3p9g+T97hjlZ44yqxCk
         GlNtbTBMjT4y0AdtgWq8XbQsbXV2SDgs+8Y51bgYAw+Py4K7tkMQO8VHdkyhPTNR1JWS
         XX4A==
X-Gm-Message-State: AOAM533DEtGVCjoIJgISw5HMQRWK151EFf4mTcqbOGhk6zC3LEglywXd
	6TvFAvA2H0bQkVcJCOytoP4=
X-Google-Smtp-Source: ABdhPJz+5BJBCn2o99B0oW7eF8a8TNfNwh38AroFduk4H8zWLV5Qf54XhuiYK/JJJTnQbXiO4MC/ew==
X-Received: by 2002:a2e:a375:: with SMTP id i21mr27320445ljn.468.1635281366084;
        Tue, 26 Oct 2021 13:49:26 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id z10sm29736lfr.211.2021.10.26.13.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:49:25 -0700 (PDT)
Date: Tue, 26 Oct 2021 23:49:23 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: clarify why $Extend init is being skipped
Message-ID: <20211026204923.fkrrtmkvctw5gbfo@kari-VirtualBox>
References: <20211026203630.125971-1-mrkiko.rs@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026203630.125971-1-mrkiko.rs@gmail.com>

On Tue, Oct 26, 2021 at 10:36:30PM +0200, Enrico Mioso wrote:
> $Extend init may be skipped due to NTFS version lower than 3. Be more clear on this.

Git does not do line wrapping for you. I check couple your other patch
too and you have made same mistake. Many git tool can make this
automatically, but many does not done it by default. This should look
like:

$Extend init may be skipped due to NTFS version lower than 3. Be more
clear on this.

> Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>

After you fix it

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

Thanks a lot for your patch and intrest for ntfs3.

> ---
>  fs/ntfs3/fsntfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index 4de9acb16968..abe74dc9ce31 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -189,7 +189,7 @@ int ntfs_extend_init(struct ntfs_sb_info *sbi)
>  	struct MFT_REF ref;
>  
>  	if (sbi->volume.major_ver < 3) {
> -		ntfs_notice(sb, "Skip $Extend 'cause NTFS version");
> +		ntfs_notice(sb, "Skipping $Extend init due to NTFS version lower than 3");
>  		return 0;
>  	}
>  
> -- 
> 2.33.1

