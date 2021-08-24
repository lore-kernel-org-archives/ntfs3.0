Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D43FC0
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 10:33:47 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g13so44412563lfj.12
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=toxam9jI47eYcvVp6UVp7uH5UQbd8oMPHPmdoq6nmzc=;
        b=l39wmwFhQpOVjrBMv+bIoaTesnPcrg1OtTkGUoGtG8Hv5/qn0Q6CKIaBnQx+W2Dlml
         J2U2SaS1JEK5DG7OeJeiXMwcUSb9OuUKvOy+KJ+A3TdJcpKMQCUgn1b5Rdn1R+br8eVs
         Fb3bcO9NHx7TkMxSA3IsLSDx5TY2ILhcQWhYepPk19DW88NwtIryYCfjJTSTeCPfcL1/
         j0Wi7EOVtls8HjVFhvzzarXofqwNPcgH4intYLPdwNa93fhUm5jN3BDZbXMvHeeMdvCV
         IIM3CRD4Guhn5SFVLaq2qrSXxSnA9w5XXtLZOpRNQHCZhQHvCfi7DJC/s0HqO9brv6vu
         /qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=toxam9jI47eYcvVp6UVp7uH5UQbd8oMPHPmdoq6nmzc=;
        b=iVD5T0hjU0NXr9VlSpIVN9E6dhEZLiZRuJJ2wphgjTXdzegQ/aVqBfsKlvbTe5PbkQ
         gC1hW479+ithyPk24VPlAhBiOl9x64tNg5Sg1zGhlIt4Wv4xA6tNUDFASMZ7m8lOkXJp
         ptUrn4ghEYBTgm9DgEd8IJyWk47pJGKMMSxiyCDcpvwlt+presk/YEQYPl2A7zjuxDjj
         G2FxO8AhSww0ojXHWR7nhgTKEfCi3EpatFnyuFNDeiV7Vi/76DrChk3Fe4tLaV39FQqL
         5esNX+RJBv16dMEYR6Eo98rH8mQE7EYfEHsSTLcies9XhaRugf3zPWKntB8QXxFqZnnC
         Z77A==
X-Gm-Message-State: AOAM530i32OzDEktNKGEDzjBlQRRDAeJOh7nis4n67C+3cW/a+ykOGnB
	D0CQdMpbtgSFL56vEf30xfU=
X-Google-Smtp-Source: ABdhPJw1+exh+KtSVl9uFiZvc37FyLCLtr1Vu+RMh30d/iejDnBzR/ULfTr7FoCMiuQliwsuGxx5XQ==
X-Received: by 2002:a19:dc47:: with SMTP id f7mr27973617lfj.71.1629801225911;
        Tue, 24 Aug 2021 03:33:45 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id l8sm376126lfh.157.2021.08.24.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 03:33:45 -0700 (PDT)
Date: Tue, 24 Aug 2021 13:33:43 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev
Subject: Re: [bug report] fs/ntfs3: Add initialization of super block
Message-ID: <20210824103343.pwnjzsi4yt4yiuvh@kari-VirtualBox>
References: <20210824075819.GA13628@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824075819.GA13628@kili>

On Tue, Aug 24, 2021 at 10:58:19AM +0300, Dan Carpenter wrote:
> Hello Konstantin Komarov,
> 
> The patch 82cae269cfa9: "fs/ntfs3: Add initialization of super block"
> from Aug 13, 2021, leads to the following
> Smatch static checker warning:
> 
> 	fs/ntfs3/index.c:238 bmp_buf_get()
> 	warn: 'bh' could be an error pointer
> 
> fs/ntfs3/index.c
>     229 	data_size = le64_to_cpu(b->nres.data_size);
>     230 	if (WARN_ON(off >= data_size)) {
>     231 		/* looks like filesystem error */
>     232 		return -EINVAL;
>     233 	}
>     234 
>     235 	valid_size = le64_to_cpu(b->nres.valid_size);
>     236 
>     237 	bh = ntfs_bread_run(sbi, &indx->bitmap_run, off);
> --> 238 	if (!bh)
>     239 		return -EIO;
>     240 
>     241 	if (IS_ERR(bh))
> 
> This is not a bug, but it is wrong style.  When a function returns both
> error pointers and NULL then the NULL return is means the feature is
> disabled.  It's not an error.  Just that the feature is turned off
> deliberately in the Kconfig or whatever.  Don't print an error message,
> just continue with the feature disabled as the admin has requested.
> 
> But here NULL is just an error.  The ntfs_bread_run() should do:

Agreed.

> 
> 	bh = ntfs_bread();
> 	if (!bh)
> 		return ERR_PTR(-EIO);
> 	return bh;

Can also be like below but probably your version is more readable.

return ntfs_bread(sb, lbo >> sb->s_blocksize_bits) ? : ERR_PTR(-EIO);

> 
>     242 		return PTR_ERR(bh);
>     243 
>     244 	bbuf->bh = bh;
>     245 
> 
> regards,
> dan carpenter
