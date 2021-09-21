Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9183FC5
	for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 21:39:59 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u18so2966243lfd.12
        for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/GQ08mCZ9JBRNvUpdTV21Jt1At5dv3ORktXGx4iID3I=;
        b=N0gJMruNuD1kJbokvqcOpwZLU/22Bl91BvdhgutTzqI8DSeLFO60gjP3NvgBX1Jk1J
         Z9EJbZddRRwDjiIOW0scfiSsLK5gJUq9d2v9plGV0xymgYoEDe2l8faKQe5d8TLfRqhe
         PD83Mh8r7y1ZRcPYJ9e/n4opfUU46hbPZsVtGIcd9QMUaWI3ApFKH6WAJgjasF/Qk18t
         Ut/Ft1j/d/3Z/NdZ8eFKITabS0yPkOEtHGXpCMoOeb3XfUPcig95OdsN8oNFzcwW+gmD
         ng0Zhlk7gZV8VKGbn+oW36oZbAH/DItOJ2yo2jyFXo5IKTB0zSklzcaUs7jX/Vhs8eHb
         SBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/GQ08mCZ9JBRNvUpdTV21Jt1At5dv3ORktXGx4iID3I=;
        b=D4kC0AUXDgIZvohQZf2ZWGWP+q5KXw9rbg9AuEdhvYZJHm+lyElisfPZDtgZm+cbzf
         V4RM5oFuzTLk79Rb/TwUdr0KbUhpMBHrepTq3P3WzDocJIi+MULhWA+6EF0S7TAEADaL
         gghR4D8baOD0icZ5K6t5HCUSafmocXFxFCehZiSQUldTYE1aQD0VxDKg66LF7++785f+
         pIKDvWec9DphZ/TKtRu9MXLfV8omxnCejE2kjd1+CxEfIpQIttkDnT5hzHsp4kf0taCN
         sMccpbeeaNvux3y1stfykkc4Nfed+gro+UYsem3vwiEVYEtbtX6XHtFStU9sjfLKZuOK
         2HRQ==
X-Gm-Message-State: AOAM530unHqfojSL7HclOXMKR74kc2Wu7bu+atOGWdgFt/FHMgq1Fsde
	fu/jnFOSAngNwk08RCG7m1A=
X-Google-Smtp-Source: ABdhPJz3waXH/voz9v0RfeBYPoEPFVNaXKv31j9rViKQj5XCZKbqqesKSppQmnpyFZjzIkbv7JkeCQ==
X-Received: by 2002:a19:f517:: with SMTP id j23mr23795986lfb.371.1632260397403;
        Tue, 21 Sep 2021 14:39:57 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z16sm13452lji.41.2021.09.21.14.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:39:57 -0700 (PDT)
Date: Wed, 22 Sep 2021 00:39:55 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] fs/ntfs3: Remove a useless test in 'indx_find()'
Message-ID: <20210921213955.se7svkfr62xndnlc@kari-VirtualBox>
References: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>

On Sat, Sep 18, 2021 at 09:56:19PM +0200, Christophe JAILLET wrote:
> 'fnd' has been dereferenced several time before, so testing it here is
> pointless.
> Moreover, all callers of 'indx_find()' already have some error handling
> code that makes sure that no NULL 'fnd' is passed.
> 
> So, remove the useless test.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Seems correct, thanks.

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/index.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 4f71a91f07d9..6f81e3a49abf 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1072,9 +1072,7 @@ int indx_find(struct ntfs_index *indx, struct ntfs_inode *ni,
>  	if (!e)
>  		return -EINVAL;
>  
> -	if (fnd)
> -		fnd->root_de = e;
> -
> +	fnd->root_de = e;
>  	err = 0;
>  
>  	for (;;) {
> -- 
> 2.30.2
> 
