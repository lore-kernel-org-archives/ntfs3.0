Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E3C3FC8
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 12:30:38 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id l11so3410045lfe.1
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TAl/OZXNRp/QAbUi6FlwGJXU2TI4ZvTh9dSb4AyChuI=;
        b=IHBcF9fW/zT6xas0XbHv0lbF++TAh4rpkz3W5Vvr6PSzbIocMq9GcKAPb5Wj9LMUI8
         v2KO0fNYYWttrO6UD3GtUpiyC0m7tPbHiWkVwuPHQtFyZPR44ns6Rqc2XQoJhKSIgfho
         OBxCO4QGDcN3izAGsNxEK+NMOqTqGoFmqyCeFbEq1IKEIgFyxtwVtyqP+ZqnCcqy9ZrQ
         0F3RKNfLCWKhFy5RrFee/hfsL6j9VXkm5Q1W/6zUsTv8QHYx3VDhtWrdb51mwdKFp+Z5
         5KWQv+6kSTwqpBlXcxRXcUaXvEpUzKOEX2kpbSzgH+mpBcIfDs8lOqZ+PwujhQryvMvq
         tONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TAl/OZXNRp/QAbUi6FlwGJXU2TI4ZvTh9dSb4AyChuI=;
        b=4ZA4+dbjFSykcn9CvJcpN0c6YOlwrgLytBLZmI6aYzvOnGPtrpC0rzt8jLmNZ6J61g
         kYLJMxwNyasUUkhB1xEQAs39pZ03k/73DeVP6mnSoDjGbUTvVfPnCICIl/1dQ5kQhR5T
         zD7zrjVbRdT5L2mnH6xciDpvE2LSKKjy2iPxfn19/ka8AH9tlmaGnHyBsMXHgYWjCVXK
         CC/pdEnMFX+LJpdL6VIlAdqELodO+4yqCG4k6Q/9nwnbwoc1IS9bvyRq/+Fjw4eGE+B1
         yxC4yEhhnAHWzbvUstpHkgQ31kT7WTJ7VzhHNPSQ268P+thxZibtKvDGiJ+SXIg16IkA
         AWBQ==
X-Gm-Message-State: AOAM533TEpbZtoGaVjenlwLKv02VGB638pmqJTzZbPvOcKwhh+KNMJ/B
	CUWtj5wW6H8UOf7xA82IoaA=
X-Google-Smtp-Source: ABdhPJxa3w6Kqrb3uUV9i/wSpTFxJwPM+mc4Mrm3bk5Q5bnmgsRhV5dZAczLADmQxXMOXwIax+LQiw==
X-Received: by 2002:a19:c7cb:: with SMTP id x194mr2190596lff.490.1631190636694;
        Thu, 09 Sep 2021 05:30:36 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id t17sm186042lfq.176.2021.09.09.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:30:36 -0700 (PDT)
Date: Thu, 9 Sep 2021 15:30:34 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] fs/ntfs3: Change max hardlinks limit to 4000
Message-ID: <20210909123034.mlsq57bsjvonwwd2@kari-VirtualBox>
References: <89127d37-a38a-d15c-36f1-62f2ac0f4507@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89127d37-a38a-d15c-36f1-62f2ac0f4507@paragon-software.com>

On Thu, Sep 09, 2021 at 01:58:04PM +0300, Konstantin Komarov wrote:
> xfstest 041 works with 3003, so we need to
> raise limit.

No need to linebreak.

> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/ntfs.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
> index 6bb3e595263b..0006481db7fa 100644
> --- a/fs/ntfs3/ntfs.h
> +++ b/fs/ntfs3/ntfs.h
> @@ -21,7 +21,8 @@
>  #define NTFS_NAME_LEN 255
>  
>  /* ntfs.sys used 500 maximum links on-disk struct allows up to 0xffff. */
> -#define NTFS_LINK_MAX 0x400
> +/* xfstest 041 creates 3003 hardlinks. */

It think comment is unnecessary here. If you think this is necassarry
comment then please but it same comment block as last row.

> +#define NTFS_LINK_MAX 4000

What draw backs there is if this is 4000? We really do not care about
xfstests if we have some reason to not do this. This info can be but
to commit message.

>  //#define NTFS_LINK_MAX 0xffff

We can probably same time get rid of this.

>  
>  /*
> -- 
> 2.28.0
> 
