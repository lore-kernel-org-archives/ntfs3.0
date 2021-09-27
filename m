Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E6672
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 18:40:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z24so82472550lfu.13
        for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 11:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pdr5O+ncPIf9G/2QSda1ETX+uwxMJUuxX92fOEy4vzw=;
        b=DFqRWuh/WI82L2FmoCvszLqKef36S6o7+A8JQPZ2WMKppSliKsG/GH/qgXZX50DdyZ
         8bui0C2oTOAdOQw6CnvLCbY8gWXSHGyLyl49unOe7bm2aLsLwKW3th2rtT9JkdbWQCsT
         kqDq1IwX7Gp6bcEu3f5TIcTTTBn937KTGfeU8gJANo02MqFi37lLGS/lX4PbMyeBNqLq
         RpiojMnHsp6Dk+1O9J1kft7w02rGDeRFfSLRY9k9f5tQ1ZjJtpHXA/IcX8TNYwrm7NKM
         xXgKn1uJkSj1hR727iFIHLf7IFyO9t09lTeL/X5Awxhzyh059KtRyzwndsyOoW/ArFHc
         3c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pdr5O+ncPIf9G/2QSda1ETX+uwxMJUuxX92fOEy4vzw=;
        b=fnqas4rPWiKLPlbVrM1UHJQnRIzK5WpkwSVi8ZeHqaKjXEAWfAwM2sJCfASqW89YKP
         rM8MtP2in4CGwK0YbFhKtZ/QD7jy6YDT6R+XewQq7bT4PZX9ZC7EwXK8G0WAg1Klxnff
         YwQKFGgaHKZG1ISB9t5RxRA7l7u+6YQjc0WEM4hVi58yhbJGxefYt9kBJY1O7SgZ4WpM
         fSNuZ0vqDG0FjryDzoEAx6Rdco8vWD5sAH2IGQ27xVLZlF0XXrJSlROhSA71wR4aNqVd
         eNC9vtzz4jsvigmu5bD1kZL/tV6r8Dm39o0PI1UwIGf1fZP4kOV0YMPO2S0TTfOfA0ez
         fEGg==
X-Gm-Message-State: AOAM530Q2dpWGX2Tr3flLIkxBRGatkyyzbZdNybLK9PibHVQ7YMdi6YM
	qTQRA8svJcTrnybZN2cSGE+H+FgUt78=
X-Google-Smtp-Source: ABdhPJzYFkq1H+2xH0kzZSyFuHyPhJ+vpWU9lbI/8TpLYsEf+HVRRRl1hUVv9fQqNQlHC8/DaywkfA==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr1440263ljg.158.1632768027968;
        Mon, 27 Sep 2021 11:40:27 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id b2sm942155lff.289.2021.09.27.11.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 11:40:27 -0700 (PDT)
Date: Mon, 27 Sep 2021 21:40:24 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/3] fs/ntfs3: Fix memory leak if fill_super failed
Message-ID: <20210927184024.m6jarhnrdrhlwnop@kari-VirtualBox>
References: <16cbff75-f705-37cb-ad3f-43d433352f6b@paragon-software.com>
 <f34b8f25-96c7-16d6-1e1c-6bb6c5342edd@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34b8f25-96c7-16d6-1e1c-6bb6c5342edd@paragon-software.com>

On Mon, Sep 27, 2021 at 06:47:14PM +0300, Konstantin Komarov wrote:
> Restore fc->s_fs_info to free memory allocated in ntfs_init_fs_context.
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/super.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
> index 800897777eb0..7099d9b1f3aa 100644
> --- a/fs/ntfs3/super.c
> +++ b/fs/ntfs3/super.c
> @@ -1308,6 +1308,9 @@ int ntfs_discard(struct ntfs_sb_info *sbi, CLST lcn, CLST len)
>  	if (err == -EOPNOTSUPP)
>  		sbi->flags |= NTFS_FLAGS_NODISCARD;
>  
> +	/* Restore fc->s_fs_info to free memory allocated in ntfs_init_fs_context. */
> +	fc->s_fs_info = sbi;

Won't build and I do not understand what this does in ntfs_discard.

> +
>  	return err;
>  }
>  
> -- 
> 2.33.0
> 
> 
