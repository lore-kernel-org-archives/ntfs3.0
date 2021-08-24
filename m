Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7D72
	for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 09:35:19 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id m4so1686373ljq.8
        for <ntfs3@lists.linux.dev>; Tue, 24 Aug 2021 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MmMhw6hROY3UzAV5o6RuiQFgaemmAxgh/96X2CQo2p0=;
        b=OQovTaJzsP9RahK2KO4x5Hefqo54kQDyYVye/WWELIihCRUF580Z6cU4UPvjDfOPJ0
         9IEzi0QV1B0CHtdpRj+zZ5CVEk6OX8+ESC05CVlwG+tUAw35JcSkdVvRjCaUEHtkPATz
         24auOcJvK2ofqgnoSnFR7nnYTS6zZKEomLIFWdGjqqbo25RESH7FacTODqvkN+L0id1u
         DPLxqXnJB8Isk43vpdGwZK3aFVnpKZz5oS5N91vJLKuEUxQOGuHlhTAHooGEJekqehl6
         NCcrq6jj2YX3Oj+WL1n+ZSfRNE6EEXBvRUn0gvDoLkDqudTq2LGjOs9YUhz4GJsTTSXo
         Ee5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MmMhw6hROY3UzAV5o6RuiQFgaemmAxgh/96X2CQo2p0=;
        b=D5rhxK60tENT10f0gjDKVaVZIaRqBJG7uY2MLtGMghxtuYil3l1YPtKqzrdb/PYb4J
         hKdLYCRfH/td1j4mIBQOJWGQuNhlv7Mp7HarUQIGBuXRsafZC0kQcCNzSbrQ5BWUPpiE
         IPEfnSE7toxYZAJJjq0bs76dJ37HFgUl/HAqq6E/pqzq2RjvPyThI9C+kyBV4q6iy82a
         tjoZ3qESNljACR3ZZndj0L8K6YOM3YB2mzIyo3zxGM3PNrTGiDd4Hmn4kikhrHB+IaH4
         CmKdoW1ehWzojJgHnwj8XgcNfFBqiLeXQm2pMOoO6TZAV7ZaeQ51fZdEUFuEihx2+yuR
         rnKA==
X-Gm-Message-State: AOAM533bKPIOWANQfmf544SieCGEzEv9gtpGCnxWwsmdzko5BsAwA+qV
	4xktJh2q0s/4crzEXxagQRk=
X-Google-Smtp-Source: ABdhPJzM2MKLihPUUxfOlMhNkKUV9K/F6645o+RoARAy8xavph6WCiaNYJuJFy1KPlH19Kwo/UDJSg==
X-Received: by 2002:a2e:9852:: with SMTP id e18mr30477309ljj.173.1629797717627;
        Tue, 24 Aug 2021 02:35:17 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id w26sm1704184lfk.223.2021.08.24.02.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 02:35:17 -0700 (PDT)
Date: Tue, 24 Aug 2021 12:35:15 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/3] fs/ntfs3: Potential NULL dereference in
 hdr_find_split()
Message-ID: <20210824093515.f3kvy4extj76gkjn@kari-VirtualBox>
References: <20210824074932.GA13096@kili>
 <20210824075015.GB13096@kili>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824075015.GB13096@kili>

On Tue, Aug 24, 2021 at 10:50:15AM +0300, Dan Carpenter wrote:
> The "e" pointer is dereferenced before it has been checked for NULL.
> Move the dereference after the NULL check to prevent an Oops.
> 
> Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/index.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 07d6dee0a4ba..489e0fffbc75 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -556,11 +556,12 @@ static const struct NTFS_DE *hdr_find_split(const struct INDEX_HDR *hdr)
>  	size_t o;
>  	const struct NTFS_DE *e = hdr_first_de(hdr);
>  	u32 used_2 = le32_to_cpu(hdr->used) >> 1;
> -	u16 esize = le16_to_cpu(e->size);
> +	u16 esize;
>  
>  	if (!e || de_is_last(e))
>  		return NULL;
>  
> +	esize = le16_to_cpu(e->size);
>  	for (o = le32_to_cpu(hdr->de_off) + esize; o < used_2; o += esize) {
>  		const struct NTFS_DE *p = e;

