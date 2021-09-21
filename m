Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE703FC5
	for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 21:41:13 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id i4so3261245lfv.4
        for <ntfs3@lists.linux.dev>; Tue, 21 Sep 2021 14:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZUtb7BIX5XGWejYsRp211NK6WbRuQYuJ0FbAcrgDYUQ=;
        b=RArBOm+P6N7devHl97Vz76wgY+677t3peLjp1TDhFjw1JMmHA9YdrX1ZoA75rm4eQx
         GhqEKHezdYVD9esq7SFJ+UgSI2RuhK8eJHB/JINnEm0rzCLCbOE2iU5KL8JPWsmoV0SG
         tXP2y4Nu+5g17tRWPL6+q2wgdFzOR3Dh/vGztN+dTx/Wu5smKWYzvum9vY13oZ03AvC4
         OIhg3UP/CkqjmFvWn5+gHx0vkUxAFZEq03hjdyNrydt11i+af/rq8xDdTGn2r7giKF+2
         5kSJOs09m1rpjGL3jIV5j8SExjKj81h+/nKrKGuJMFcxSISfHFV+w+9sxwF7pd43aHEZ
         Mqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZUtb7BIX5XGWejYsRp211NK6WbRuQYuJ0FbAcrgDYUQ=;
        b=TIo7l8wEpFy4QzCBcaXAyLEKpbdgXD32ZGIAIiOeLyJNkGVEdOKMbweEsPlwrCEb2I
         JVl8DdeBDg/LVI+L1xP2x3EKifnBtJF16bz6NOxQYeADBXS3ncsVffycCUh191edqKaa
         3IkiyE7x8moxTeerbccz34FEJM13ltDM0iQ3riR/27qPHV5BRRtmWLuoesp6hrDyCeqE
         +6DTa6SpBbpNUOglVgHyT20+0oK+gZNQrT7IDc3mo7DBxNahESOzKDGrDULbzMPSlfWM
         w4AwyTFeociSSlSUvHmqGCezs1ZoyxeHJ5vBdsgN9rjKL72/+UREO3GIb97Pg1xUn9pH
         cqWA==
X-Gm-Message-State: AOAM531hvlQtEXjrJo0sCU+xMREwBewDIdxxQlX+msMDM8enOzEqnHxj
	HwRuIjYwLlyYooStl9FzSKs=
X-Google-Smtp-Source: ABdhPJx2QPLy5x0ifdZlTK6Xj/oVSyCM0uw46wy/DAsGiXc2WmVFvtFZf2I43C9vlK+Jvz1djDf42Q==
X-Received: by 2002:a05:6512:48f:: with SMTP id v15mr24543665lfq.690.1632260471910;
        Tue, 21 Sep 2021 14:41:11 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id t13sm15303lff.279.2021.09.21.14.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:41:11 -0700 (PDT)
Date: Wed, 22 Sep 2021 00:41:09 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] fs/ntfs3: Remove a useless shadowing variable
Message-ID: <20210921214109.i4njjbzuspceoe7w@kari-VirtualBox>
References: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
 <6cf8bdec16086835c771d797f83b7c298c3667fc.1631994909.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cf8bdec16086835c771d797f83b7c298c3667fc.1631994909.git.christophe.jaillet@wanadoo.fr>

On Sat, Sep 18, 2021 at 09:56:28PM +0200, Christophe JAILLET wrote:
> There is already a 'u8 mask' defined at the top of the function.
> There is no need to define a new one here.
> 
> Remove the useless and shadowing new 'mask' variable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/bitfunc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/bitfunc.c b/fs/ntfs3/bitfunc.c
> index bf10e2da5c6e..50d838093790 100644
> --- a/fs/ntfs3/bitfunc.c
> +++ b/fs/ntfs3/bitfunc.c
> @@ -119,8 +119,7 @@ bool are_bits_set(const ulong *lmap, size_t bit, size_t nbits)
>  
>  	pos = nbits & 7;
>  	if (pos) {
> -		u8 mask = fill_mask[pos];
> -
> +		mask = fill_mask[pos];
>  		if ((*map & mask) != mask)
>  			return false;
>  	}
> -- 
> 2.30.2
> 
