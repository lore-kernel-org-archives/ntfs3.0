Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E772FAF
	for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 19:11:52 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z24so278808lfu.13
        for <ntfs3@lists.linux.dev>; Tue, 28 Sep 2021 12:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PVzXGdplLjQJVdKCGryHH4oZ1fNenSGYn+YBI2SMp48=;
        b=Xa74LXYddB+j0W1UF8TL83u2BaxuaVBFtyCtuOT72FWtlL2eGluovKMUqqkrvlnKte
         UwIY2SENbCWvvlAhT8VQbGos0pw+QvBdioHUvcXWBgxApceKTkR4toriTpQvNtbTKSot
         mOSJz+FiKpyZAN5e3LMS5kT08Lk2uUPiRlnGGwCRnczxV7DanszbkYyShTxT9ICJl9mY
         xsSpxITpfVVcbHGpoTF4K/l6XJNKGnmAlTqUcBUXzOkXi+xvb0vWWbXidR3fwhK58epk
         +SyIHXwfwEWTJPWqkYBJl4Of0vwfVRMRG1IDxTcoq+BjLEF9eLhmv0G9cPNtGJbwSarx
         4nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PVzXGdplLjQJVdKCGryHH4oZ1fNenSGYn+YBI2SMp48=;
        b=cmC0rOqZUf2F6je2Mhyazh1ACTFD/0XXdlyJrBKS487CNFbsQUQsP2HVI1RMP7oKws
         2Bm++vWhdydwc4iWIGTjZSS3dgg1mTL+tWoXZfcGlGbJ1fDisph+knkadkzyNdNtrFuB
         1vBK/EXUXziwMQsxbnljn8oA0MDUoIvWf0cdeXNFynXzKgiM98hnnOmzfxk5TtEmB4jn
         ipshqAVrxtwNEhqwGEepMPlDKXWTpI+BM1U4s1N86eCscpihE6v70vYWvquy0Nn58vrT
         8Kp2vJbjYqLER9qLKPkL/GRo8R/RJaOq7pmv2IhQegszSc3Qg1grPBt69mm5oKINt2PJ
         MfsA==
X-Gm-Message-State: AOAM531GvFmbJ74kWAOtiTzMP5+8Hr552O7St+GdkoK2zildI1qhUdP4
	ut0Dtn2nr5p2sAI6gVsdD+Kz1I3fr2Q=
X-Google-Smtp-Source: ABdhPJwDFQS1IINAAfXexqZJV2c9P9nGjQqJhHLP4tS5PsHXJaaFDOqWe2sdFNRexX6ASWDqTfXj5g==
X-Received: by 2002:a2e:140e:: with SMTP id u14mr1648273ljd.26.1632856310691;
        Tue, 28 Sep 2021 12:11:50 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id f9sm2002012lfc.189.2021.09.28.12.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 12:11:50 -0700 (PDT)
Date: Tue, 28 Sep 2021 22:11:48 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Message-ID: <20210928191148.dazawymnmd6rjutg@kari-VirtualBox>
References: <20210928183300.12946-1-mark@harmstone.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928183300.12946-1-mark@harmstone.com>

On Tue, Sep 28, 2021 at 07:33:00PM +0100, Mark Harmstone wrote:
> I'm not quite sure what was intended by the logic in ntfs_cmp_names_cpu,
> but it was broken when comparing case-insensitively. If the strings
> matched but differ in case, diff1 would be non-zero, meaning that the
> function would always return a non-zero value.

Original idea can be found in here [1]. So recap. If we need first check
lower case and then upcase we can actually do this in just one time. We
first find first mismatch. Then we in that point on try to find if we
find another mismatch when upcasing. This way only one compare round is
needed in worst case.

I will look this patch more closly soon.

[1]: https://lore.kernel.org/all/20210103231755.bcmyalz3maq4ama2@kari-VirtualBox/

> 
> Signed-off-by: Mark Harmstone <mark@harmstone.com>
> ---
>  fs/ntfs3/upcase.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ntfs3/upcase.c b/fs/ntfs3/upcase.c
> index b5e8256fd710..dd28c2133a4c 100644
> --- a/fs/ntfs3/upcase.c
> +++ b/fs/ntfs3/upcase.c
> @@ -74,31 +74,29 @@ int ntfs_cmp_names_cpu(const struct cpu_str *uni1, const struct le_str *uni2,
>  	size_t l1 = uni1->len;
>  	size_t l2 = uni2->len;
>  	size_t len = min(l1, l2);
> -	int diff1 = 0;
> -	int diff2;
> +	int diff;
>  
>  	if (!bothcase && upcase)
>  		goto case_insentive;
>  
>  	for (; len; s1++, s2++, len--) {
> -		diff1 = *s1 - le16_to_cpu(*s2);
> -		if (diff1) {
> +		diff = *s1 - le16_to_cpu(*s2);
> +		if (diff) {
>  			if (bothcase && upcase)
>  				goto case_insentive;
>  
> -			return diff1;
> +			return diff;
>  		}
>  	}
>  	return l1 - l2;
>  
>  case_insentive:
>  	for (; len; s1++, s2++, len--) {
> -		diff2 = upcase_unicode_char(upcase, *s1) -
> +		diff = upcase_unicode_char(upcase, *s1) -
>  			upcase_unicode_char(upcase, le16_to_cpu(*s2));
> -		if (diff2)
> -			return diff2;
> +		if (diff)
> +			return diff;
>  	}
>  
> -	diff2 = l1 - l2;
> -	return diff2 ? diff2 : diff1;
> +	return l1 - l2;
>  }
> -- 
> 2.31.1
> 
> 
