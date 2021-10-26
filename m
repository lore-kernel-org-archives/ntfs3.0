Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF99D2CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:53:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id u11so1545651lfs.1
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RwMPJu4tWL3GKPzkfgAVoJiZbBPk1ciW2DH4mF34RyA=;
        b=LdPKyo4GEg9xH13oRxk0XCFEQgsWjEvFuOWWbIkkN1QKsQyhP+pxlEhUiaQJdFcEtM
         QhpUQsECf46G72txIqCCsuTq7gIXhrcQacRtVcX3uPBo4Kg01P+QDAgsHfkZbIbbbag1
         Sw4YLKaa7lBj+W7i1x7OuN4secGZokFKyh5wgVV40R3WGJRf1KO4YxwgMOk3/aC8GSbK
         apTiwov2IMK7HDLLDT3jHEvUVymKD7Ceb49q5u8tAGg8lSE+KNEQb4RbJmFz8eXIuFap
         QtjUWOYe2lb4y8ptq8CLA0uKcoJcTW74MxE5Ve2zQkIDsbobH5fZ5lDk3MlF409y4eX5
         JPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RwMPJu4tWL3GKPzkfgAVoJiZbBPk1ciW2DH4mF34RyA=;
        b=G9+2CIhQ6qsj6Z1fI84orBJKUlHWRCaDLq2blXIGBZOp64poikxlBocEs/OzbrjZWo
         YICvRTlxgwHY1sXpsjszFHDPvFqk+CqNoqANIzOpsz+CXC7WYBsx+d11pkUOuc+NiNCj
         ggT2EWHDpVs6bCMwMMwTHw1BbNiFo+gAsbSgwOjX/g+rFSe9CejNdLGdMNd5CJ79jAeF
         QVgbBTTMuJ8HgT1YuxSRZVp8YsSMmZy1L2eyZreeyzG0r6F6g0TgaPHnvFToNGydcPgd
         2Pb5oSn7OQdw2yh8UxCExXgYJZIFDkts7vnBAV6Oz3CkR+NbCrsyrV+8jWQbP4qRUtnd
         +/1w==
X-Gm-Message-State: AOAM531Pla/rrMoI2GzPFtsd9utN05O2YCq+WKXayeUL+IG1HCIrSwcb
	nbFHdSst9xxi2RVzQBhFkoo=
X-Google-Smtp-Source: ABdhPJwM3NvBmeNFj5ZJnOxSK1Dvw3vuH5aPPPZDWsfLP8SIIF9Jb2VpGQvvIZb8MFlFhzBWz6W6Pw==
X-Received: by 2002:a05:6512:150c:: with SMTP id bq12mr25056458lfb.628.1635281628875;
        Tue, 26 Oct 2021 13:53:48 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id y1sm454482lfd.204.2021.10.26.13.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:53:48 -0700 (PDT)
Date: Tue, 26 Oct 2021 23:53:46 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: clarify emitted log message when marking
 volumes as dirty
Message-ID: <20211026205346.25g4snt7o3purff2@kari-VirtualBox>
References: <20211026204922.126100-1-mrkiko.rs@gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026204922.126100-1-mrkiko.rs@gmail.com>

On Tue, Oct 26, 2021 at 10:49:22PM +0200, Enrico Mioso wrote:
> We are actually marking the volume as dirty. Reflect this in the message.

Again this should look like below. Maybe send patch series which contains
both of your patches. Mark it as v2.

We are actually marking the volume as dirty. Reflect this in the
message.

I have not strong opinion about this change so I let Konstantin decide.

> Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>
> ---
>  fs/ntfs3/fsntfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> index abe74dc9ce31..08802d7ca078 100644
> --- a/fs/ntfs3/fsntfs.c
> +++ b/fs/ntfs3/fsntfs.c
> @@ -933,7 +933,7 @@ int ntfs_set_state(struct ntfs_sb_info *sbi, enum NTFS_DIRTY_FLAGS dirty)
>  
>  	switch (dirty) {
>  	case NTFS_DIRTY_ERROR:
> -		ntfs_notice(sbi->sb, "Mark volume as dirty due to NTFS errors");
> +		ntfs_notice(sbi->sb, "Marking volume as dirty due to NTFS errors");
>  		sbi->volume.real_dirty = true;
>  		fallthrough;
>  	case NTFS_DIRTY_DIRTY:
> -- 
> 2.33.1
> 
> 
