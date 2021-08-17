Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B491173
	for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 23:44:03 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z2so635703lft.1
        for <ntfs3@lists.linux.dev>; Tue, 17 Aug 2021 16:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3j1SnTSxict+VDmN2SRVNw1Xmv8Hy4JvKVdqBN6uBo0=;
        b=NG/jghkhJpEgwnQnkzgt2yuwB0qhJAlty1tnJa43RXFyyWV/fz5OM0UCdl4jhIoqRi
         pIGlFhUzAJbgBulWMyizhKq9uWBPwO1h7lTLuniEn9E9Q+b022fUbglKje23Px42xSQW
         R86Hc5ReE7lIW+mS4zNadBuPGU7Ruiy/ZRSCjtr7knp7mnAcJRu/Wb7TzUNvdb8d/qpg
         J+TgfI6FZ1+6bKVyaDrcD3bDPozRKcHH6PMMDviqNb8YaMIsC1LebNevAQRylqnfh1Tt
         KyuJK3b2TsUSTtLonzp39heEBRicTvtd41calPboJVvsgSNtfyqSeQolnCsLvPC06gYe
         xL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3j1SnTSxict+VDmN2SRVNw1Xmv8Hy4JvKVdqBN6uBo0=;
        b=ecrU/bxYR5Hl0XlFs2hO5YFRy7yPQ31b+TSKB1+2Q9GTh7nBo+Mc62QCqslRIb0ZqI
         8nMmhGHXZ66UJNyFUOIihJKjTzI8erZ637E6ZvMqPW4h2A7t0ZYFcPrEemjphDMkdaSf
         W2Fnftkds55pa/YpqAdc+pzUL6ieCQv0nctKp1rN3Eyqt3UmmG/CUUZ5nBtKbJ7Ly55/
         HKDe13FuQGCa7PHv4rCJGsXSV07J8IZrnPdP/UKwqdw4dS3rexywo76j/EueIJcyZFtu
         VW8wHPEL/3qFMA5dPJi2nyJwJB8qbbL0o9ZaiVI9Mkqep+L68ZQT6B/lE6Sy/3JHZDyT
         aHbw==
X-Gm-Message-State: AOAM532QzrMngJxPQKb7WkVvTC/VuvWr6oPYTdPeWx5YsMIjSuLO03gV
	PpGu9s1R6xV2W2nHRJkEMos=
X-Google-Smtp-Source: ABdhPJzF9HskUlBrPFo2TedVAHjtnq6nbs2ZCjdrt6HoohJpRNdVNWhzMqfEi4URBvgvu4rEzAPNCg==
X-Received: by 2002:a05:6512:3b3:: with SMTP id v19mr4263954lfp.10.1629243841303;
        Tue, 17 Aug 2021 16:44:01 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z10sm321574lfg.271.2021.08.17.16.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 16:44:00 -0700 (PDT)
Date: Wed, 18 Aug 2021 02:43:59 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fs/ntfs3: Use kcalloc/kmalloc_array over
 kzalloc/kmalloc
Message-ID: <20210817234359.o3cotsqpy2cg67pu@kari-VirtualBox>
References: <20210817193815.307182-1-kari.argillander@gmail.com>
 <20210817193815.307182-4-kari.argillander@gmail.com>
 <ef1d002a0720ace0ed8dd79c2ac3c600@perches.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef1d002a0720ace0ed8dd79c2ac3c600@perches.com>

On Tue, Aug 17, 2021 at 04:12:08PM -0700, Joe Perches wrote:
> On 2021-08-17 12:38, Kari Argillander wrote:
> > Use kcalloc/kmalloc_array over kzalloc/kmalloc when we allocate array.
> > Checkpatch found these after we did not use our own defined allocation
> > wrappers.
> []
> > diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> []
> > @@ -900,7 +900,7 @@ static ssize_t ntfs_compress_write(struct kiocb
> > *iocb, struct iov_iter *from)
> >  		return -EOPNOTSUPP;
> >  	}
> > 
> > -	pages = kmalloc(pages_per_frame * sizeof(struct page *), GFP_NOFS);
> > +	pages = kcalloc(pages_per_frame, sizeof(struct page *), GFP_NOFS);
> 
> This is not an exact transformation.
> This allocates zeroed memory.
> Use kmalloc_array here instead.

Yeah. Thank you so much. I actually use kmalloc_array, but mistakes were
made and this was result. Thank you for reviewing.

