Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C24B2CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:41:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id y26so1352637lfa.11
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i9xK3m0+QaW1ytl/BRy95Ub0ZBDl1hcy1DWr+j4fMbg=;
        b=naRBgU4BXY0RqB9ZsH6oaD+wUpURcaVHycpwSBYJdhst+iNIydG72/38udPfb8eVHh
         eczs4BYVblPZN0mz9UtHWcOfjEPLcju2JndfOhe2wQyOHjfN+sczAelDaZyFg2QTbIij
         9NgsUHmpJwqUeb8SuSPlvdtyvveJzwocNvqJE5D6uZC/1ShW7rpEaS2dhd6zCC0euTaj
         xn5kEKFMimMrmvyR2UZuqc0o6FRbVWv2cVzqXnbgvFzVMbTGfYEDkaWHX8ribejUmtQg
         P8jea0T68omrrtxbL23VRNmFkuGZ4QGxG8uzSilZ6DawZEcVxmE9Dcd4YVpt9Q0lnJTU
         mvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i9xK3m0+QaW1ytl/BRy95Ub0ZBDl1hcy1DWr+j4fMbg=;
        b=ES17v6qvTIL+pThq6cjq7rOcrJOgxEKEZQi4ET26T0ALSrrqkskS9o1QaSUG5d9wRq
         3WqlAyG92xEN2Kqg1KMWaX5Mkdcfqe1582NE8OJabV3a4s8AnoCjoxYxbvM8+grIjYCX
         0n8IXKBb2vj7tMkjKarJ7ePfsGERV1YhPBkXKruMF0g8dAr/Jr7R8JDM4nGFIvDTm4tA
         V6fcPnnCOxhTimVgwVdyqf7lxrHVxd9KYTPM5BrlzrfixKevOlPUuwdZ3CoTQ64NDg77
         EjMDXjGSyqLpkS01DHYwU/koy+SUX8Hva7rBUPqEPE/NMoK2AnKOmWiBBCgRshLxGyzz
         e2fw==
X-Gm-Message-State: AOAM531EzQKU8BuLbMF4cQZQw4Dk4DHgvljh/I6T7rTL0N+3t793MY+p
	kLRCo6yj486CFo2Noqx4okY=
X-Google-Smtp-Source: ABdhPJzRYMJPy+zP3RzrrChtN8taT1UDuV/pxPlgKTKbxOCRk4Vd2KUCYi/6DbDzbENatMTmkpjZ1A==
X-Received: by 2002:a05:6512:31c9:: with SMTP id j9mr5231661lfe.217.1635280894522;
        Tue, 26 Oct 2021 13:41:34 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id bt20sm2036909lfb.47.2021.10.26.13.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:41:33 -0700 (PDT)
Date: Tue, 26 Oct 2021 23:41:32 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/4] fs/ntfs3: Update i_ctime when xattr is added
Message-ID: <20211026204132.kyez7uu4qhv7q2wl@kari-VirtualBox>
References: <a57c1c49-4ef3-15ee-d2cd-d77fb4246b3c@paragon-software.com>
 <d5482090-67d1-3a54-c351-b756b757a647@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5482090-67d1-3a54-c351-b756b757a647@paragon-software.com>

On Tue, Oct 26, 2021 at 07:41:50PM +0300, Konstantin Komarov wrote:
> Ctime wasn't updated after setfacl command.
> This commit fixes xfstest generic/307

When I run xfstest I get

generic/307		[20:37:41][   21.436315] run fstests generic/307 at 2021-10-26 20:37:41
[   23.362544]  vdc:
[failed, exit status 1] [20:37:45]- output mismatch (see /results/ntfs3/results-default/generic/307.out.bad)
    --- tests/generic/307.out	2021-08-03 00:08:10.000000000 +0000
    +++ /results/ntfs3/results-default/generic/307.out.bad	2021-10-26 20:37:45.172171949 +0000
    @@ -1,2 +1,4 @@
     QA output created by 307
     Silence is golden
    +setfacl: symbol lookup error: setfacl: undefined symbol: walk_tree
    +error: ctime not updated after setfacl
    ...
    (Run 'diff -u /root/xfstests/tests/generic/307.out /results/ntfs3/results-default/generic/307.out.bad'  to see the entire diff)

any ideas you get different result?

> Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 3ccdb8c2ac0b..157b70aecb4f 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -992,6 +992,9 @@ static noinline int ntfs_setxattr(const struct xattr_handler *handler,
>  	err = ntfs_set_ea(inode, name, name_len, value, size, flags);
>  
>  out:
> +	inode->i_ctime = current_time(inode);
> +	mark_inode_dirty(inode);
> +
>  	return err;
>  }
>  
> -- 
> 2.33.0
> 
> 
