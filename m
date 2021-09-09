Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9633FC8
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 12:36:32 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id k4so3403499lfj.7
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QwiVhbC5w9i7Idj/dJDuFYurFbOrQGVL6Jy6zXvxSuk=;
        b=q6yLhuEjqVvg/BDMnA1qtYup1DXo46hpFkxKAwS0EnFwqg+dYpLKOhvEsDw/Oh0INC
         GJQC3XLmSb4YBBpnajRmL9gf1hAzYUbgv2x2+MmXiBfYZqtcv29AkPWAxbpgdlIwmUpM
         1ZJnfq1k+SQ9MXWsVxfy9meQ97xFqr+D3/kRgBbUcrnBc6ajIP9PypEydnZvfbzTsNs5
         6blD3uG3RjkVFa91G+s/H+XkfRONSGvd9h7mbwqoIJKsbQ+ZRHLe6zpYVcm2CPRaxFZn
         sJiJE0G4x832iDguljIf+JQ8y9nG0GB68GVRgL6JXjmktqsgtH0Zs1V8m9zk4UcQoQ1Q
         kPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QwiVhbC5w9i7Idj/dJDuFYurFbOrQGVL6Jy6zXvxSuk=;
        b=CMkMjK/ujRM6p1rjuILI6lULyriDjRTO+m1fXTe4T8NIpTP4BwJiTQeQj0LMlw9PKR
         g2nJgMz0U4FPWgq0MSyY+sx9f3gdRHrYPNLr+OTrbfR8YsjRKF9jyEveVLCzF2PQ1s6B
         oJ4Iym57Qm8sdkUGyvKfImCv4tQgM3z50Z9jPtHXCEm4STWfdNK7VoK6JTa8wU/qvPu9
         uDNnBOzIRji1sAW4HJAfRXQtQssH6RI7i+ISWOmnAJl1YtTn8301tZXubUC08Qc2WYo0
         fh8HcHGNTT4iIoJXsHmNQ4NGwUl9Q8f4uNqJ33mApFIuqdzqZk+bJRX8ifMvPM3trwBT
         cl8g==
X-Gm-Message-State: AOAM532ScCmTTdzatoAxrXJ5IdUhHUv7Z2lWR3ep1iVT/Pll+uG1v7i3
	7thbLl99BSrlBemO8v47d5HfM4wWD2s=
X-Google-Smtp-Source: ABdhPJwBgpkPXY0gmbVnYHEDaLXYyNBjkY11EjIpz5A+a5LOMaxlk0pYVyEo++Ob70qAwMwgDMLxXw==
X-Received: by 2002:a19:c107:: with SMTP id r7mr2208817lff.29.1631190990725;
        Thu, 09 Sep 2021 05:36:30 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id q22sm187387lfc.121.2021.09.09.05.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:36:30 -0700 (PDT)
Date: Thu, 9 Sep 2021 15:36:28 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/3] fs/ntfs3: Fix insertion of attr in ni_ins_attr_ext
Message-ID: <20210909123628.m5agndj35sesdurv@kari-VirtualBox>
References: <732a18ee-20ea-3e53-056c-8a4d496e5522@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <732a18ee-20ea-3e53-056c-8a4d496e5522@paragon-software.com>

On Thu, Sep 09, 2021 at 01:57:59PM +0300, Konstantin Komarov wrote:
> Do not try to insert attribute if there is no room in record.
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/frecord.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index 938b12d56ca6..5dd7b7a7c5e0 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -956,6 +956,10 @@ static int ni_ins_attr_ext(struct ntfs_inode *ni, struct ATTR_LIST_ENTRY *le,
>  			continue;
>  		}
>  
> +		/* Do not try to insert this attribute if there is no room in record. */

Multiline comment as this gets very long.

> +		if (le32_to_cpu(mi->mrec->used) + asize > sbi->record_size)
> +			continue;
> +
>  		/* Try to insert attribute into this subrecord. */
>  		attr = ni_ins_new_attr(ni, mi, le, type, name, name_len, asize,
>  				       name_off, svcn, ins_le);
> -- 
> 2.28.0
