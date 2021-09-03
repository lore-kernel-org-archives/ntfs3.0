Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7369C3FC1
	for <ntfs3@lists.linux.dev>; Fri,  3 Sep 2021 14:46:05 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id p15so10008342ljn.3
        for <ntfs3@lists.linux.dev>; Fri, 03 Sep 2021 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iNqobfro7OKzCHlE+ueste6F4lAQYDNz3YZQNe0s7dU=;
        b=FbgW7NwtvajiLnGoaMmhlDH5/uBbf1qmObSH5E/hHzIFvyikRu51F1trXnepspUoJT
         yJb+hOYC81u7xYkr5eNzAZLLA+d4HPbjlfbNNESBDYuh3LfnihT8i/S/Y+eKIKDbhtf5
         g+8hsfPQ4gdjGurrJAWTspoUIPw6hcid2lOjQrmG2GInWQShCaHzXk5au3RUCmm3Vhkn
         nLzPCWHkqPkNZ7ynuGU6wD1Z5/aCfuMQqBCpHZoqVm/nCep7x6pcGU5pO9vjOhn0wqCk
         h109089zTIRx6o9hh4CFKQTfgg+4C8DM2iBnUaa1laUKDZJW/v2ajkSyJyM99n8/AEKs
         znGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iNqobfro7OKzCHlE+ueste6F4lAQYDNz3YZQNe0s7dU=;
        b=S9Lz0jTfGvYmJjULxZ9lUl+V8wfa0oB93kvildWTNZqZndEVp077CGXJBqSnmfqtbg
         s4qyp5Pwvy2E+3gHDnezDQjUirfGXqc418+PPyJX6qNQSIuVPrMBPH/LNfOoL9UYCVTd
         pFknDp1tbZrtQ5VSkHsNuss+9wUeY4RdGNd9qcaXxPFDEboYuTBIrdhnBQSTyw08z15g
         Rag9snbMm8YXAWMd72qxk8Go4zIr66Jx2udWnw4khjo2o2cpD2cfZxka7wpKcCJDV+GS
         yLPcexsYqwtyDng/76IRzH9tUZUgXMuTvRNNxF4OmAUSjnYQz4iJZwPN2T9MPhIPlryU
         HV/w==
X-Gm-Message-State: AOAM530zROd7KJ8a2nUCCCcGC7UgH4ytijBRftoZzDd//TmlXXpsV2P1
	mSqPByu7UAqdgqP8ZKjd+oY=
X-Google-Smtp-Source: ABdhPJy9LfCNoBvM62pq4as9H3XZW5V4z2XdwFa4/LA49+UUyWD8Gc9+AHU04fT21rTFWQ1hQAQ3mA==
X-Received: by 2002:a05:651c:54c:: with SMTP id q12mr3261368ljp.369.1630680363432;
        Fri, 03 Sep 2021 07:46:03 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id f20sm644300ljc.81.2021.09.03.07.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 07:46:02 -0700 (PDT)
Date: Fri, 3 Sep 2021 17:46:01 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Colin King <colin.king@canonical.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] fs/ntfs3: Remove redundant initialization of
 variable err
Message-ID: <20210903144601.jrqsjeaetxm3bcr3@kari-VirtualBox>
References: <20210903132458.14342-1-colin.king@canonical.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903132458.14342-1-colin.king@canonical.com>

On Fri, Sep 03, 2021 at 02:24:58PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read, it
> is being updated later on. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

Please note Konstantin that you should not yet, put this to master. You
can collect these already, but if ntfs3 get merged to 5.15 we will start
start master again later. You could but these in example devel if you
want.

Then we also need branch just for bug fixes. Example this will have to
go to 5.16 because it is not bug fix. Our master is our for-next branch
so this will go there when time comes.

> ---
>  fs/ntfs3/index.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
> index 0daca9adc54c..b1175542d854 100644
> --- a/fs/ntfs3/index.c
> +++ b/fs/ntfs3/index.c
> @@ -1401,7 +1401,7 @@ int indx_find_raw(struct ntfs_index *indx, struct ntfs_inode *ni,
>  static int indx_create_allocate(struct ntfs_index *indx, struct ntfs_inode *ni,
>  				CLST *vbn)
>  {
> -	int err = -ENOMEM;
> +	int err;
>  	struct ntfs_sb_info *sbi = ni->mi.sbi;
>  	struct ATTRIB *bitmap;
>  	struct ATTRIB *alloc;
> -- 
> 2.32.0
> 
