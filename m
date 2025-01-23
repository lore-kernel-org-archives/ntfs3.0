Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAC71C3F00
	for <ntfs3@lists.linux.dev>; Thu, 23 Jan 2025 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663893; cv=none; b=q/XL/Dagl6o1EPMl6UmQWuYVycImtB1j+E6g3gaV8AigcaDQUWnnSsKlPQ/shRq55LQldnHXIvKXTJrTGLnMwQHUA7sXez5f+Wmc4L4Y//jyO9CO8MJMOApzQhsehxIox1XccJCUnl8nu2SI1Lm27eNAwKkBeaDU3muL+7E+zug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663893; c=relaxed/simple;
	bh=kLTU6pzyItby0Xy68IXUlVww8A5hyuVx1r9o6Jn2yyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KImM54eHcw9dDu+aSytAsbosiVq4cOOo/wsebtAS0rJSheguENZO6gTEJ4jpDKuYGMSN/O2sxnMkKnQnMHAcrN0IXMWtLm4CFjSN7WIFajh6Vjhfkn6wYner61B23wDJZFSNpw9WkqapMgdqA8zf4kw7RB4zXytcwDP0XHgzb58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=gQEBlNdr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="gQEBlNdr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so2523039a91.3
        for <ntfs3@lists.linux.dev>; Thu, 23 Jan 2025 12:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1737663890; x=1738268690; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dwxbQH9kgdkSqlPoE+manNQA8Ci31FJ9FZBvSpHLAn4=;
        b=gQEBlNdrgN3+fO8RvMN3lhXyKorjn6pe1lBSXO340wTBKacnsMXzyubwyA2M4Td9T9
         tGiN5/axz5UuEIK8XeTrl0KHbi0e+4y6YIMXu/42OQjVl1Kuz0lYNb1QBDOBzd+QEgig
         1MJqEP10KLUl6IGsN5LtzmRP4+U/B/J492M9XPwc24HacBhQSR1dLaOgJ3MN9CNRRx9L
         vBxnJG97+3h3YcPu4YlKKlY0m6nx1o5b9JNTvMnzdsZjippw0mqeAJIUaPxKZkw1QnKa
         n83bntuS0krY9wIY67++vGCpDVaal3GA26H8s7E9npld/fHAB5qLpON/GnA8dvq+jE1g
         hhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663890; x=1738268690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwxbQH9kgdkSqlPoE+manNQA8Ci31FJ9FZBvSpHLAn4=;
        b=c6uE4EtNo6pRs5y5FCLtk5TnmKcSm8gmLf2Y7g3GSNUU50lKLf5Br8A6zgDl9Xn5Ay
         fG5kxrO/+0ztCcryQPZ2Y5MfCWSVLq0lz2VId8osuRqyvPCwmv7ma03+JipYCCbz5YDb
         voxAonWPPgY/WGyYrUnDGtIJ2hI4301v43j1apPwpYC9kIUtrJ6lZV6XrNB8IUgo6/FT
         rZ7Vumvad4D0z9aKgADcTj5hPpvIPtGjiMKiNq3ij7YYyHwC7Yj5vYabg/ThRvz2jhVE
         DGo7/Y4/mm/fiBHbFNPcLBRqRORldUdQ8KC3f2hQnCYcw+lmjrVty3EXKYI0F4LcY84A
         9y5w==
X-Gm-Message-State: AOJu0Ywfiawg2ZRL8Z/ErJOLT9zjbyjUNoAYPSVlyz+g9e3naym09cD4
	CO/RGX1FCe9A9diAPmhUj3ZS9cHvLHtZMsRr4zGtw92UA0b8SGp0W+A6u5dvqdk=
X-Gm-Gg: ASbGncsk66pBdQt6C1c1OwXCpAjpqFdZsv0thozL/a5eG2DN85iRwf5cKAYlsMWKQXr
	T3sBHE0I5l9XfvLV8GHsKaw91kMeRIwggSrCFtWJOx1zkiZrbMB5a3DleB5Q3PWbc0VYD3q/ikE
	ec8BfaduvGma8IJEgyHqP5+2XCo90IpWziRT5XcWGpiCNSFvyQ9vYSTANClaV2nIvP3LYgRxqyv
	R5jsg3DxnoRgJK/jaitah2PLjoKS95xoMYtAGz+9zDMsYECH3kqe46uVtSAmQUz8VYhzBCWjLDq
	kFMlE1RLHSjg/o7zEpxcb3uVIiMl8qvjJUDEJOQaE9yndCRjtc2hEYO5
X-Google-Smtp-Source: AGHT+IEDWgzC0RvHUKB4IxqckjyA0ZkEijLZzCLsb3DH4LWINRo1G1cTO4KJdVOfn7eQaWHn0DCVVA==
X-Received: by 2002:a17:90b:3a08:b0:2ee:c291:765a with SMTP id 98e67ed59e1d1-2f782c8f352mr40851352a91.8.1737663889811;
        Thu, 23 Jan 2025 12:24:49 -0800 (PST)
Received: from dread.disaster.area (pa49-186-89-135.pa.vic.optusnet.com.au. [49.186.89.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa6acd0sm151904a91.28.2025.01.23.12.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:24:49 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1tb3kr-00000009dTo-2VTC;
	Fri, 24 Jan 2025 07:24:45 +1100
Date: Fri, 24 Jan 2025 07:24:45 +1100
From: Dave Chinner <david@fromorbit.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
	Kun Hu <huk23@m.fudan.edu.cn>
Subject: Re: [PATCH] fs/ntfs3: Update inode->i_mapping->a_ops on compression
 state change
Message-ID: <Z5KljQpaTp9ZlJxj@dread.disaster.area>
References: <20250123135335.15060-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123135335.15060-1-almaz.alexandrovich@paragon-software.com>

On Thu, Jan 23, 2025 at 04:53:35PM +0300, Konstantin Komarov wrote:
> Update inode->i_mapping->a_ops when the compression state changes to
> ensure correct address space operations.
> Clear ATTR_FLAG_SPARSED/FILE_ATTRIBUTE_SPARSE_FILE when enabling
> compression to prevent flag conflicts.
> 
> Fixes: 6b39bfaeec44 ("fs/ntfs3: Add support for the compression attribute")
> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/attrib.c  | 1 +
>  fs/ntfs3/file.c    | 2 ++
>  fs/ntfs3/frecord.c | 6 ++++--
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index af94e3737470..d2410ab6c7bf 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -2666,6 +2666,7 @@ int attr_set_compress(struct ntfs_inode *ni, bool compr)
>  
>  	/* Update data attribute flags. */
>  	if (compr) {
> +		attr->flags &= ATTR_FLAG_SPARSED;
>  		attr->flags |= ATTR_FLAG_COMPRESSED;
>  		attr->nres.c_unit = NTFS_LZNT_CUNIT;
>  	} else {
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 3f96a11804c9..e8f452f47cd5 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -105,6 +105,8 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>  		int err = ni_set_compress(inode, flags & FS_COMPR_FL);
>  		if (err)
>  			return err;
> +		inode->i_mapping->a_ops =
> +			(flags & FS_COMPR_FL) ? &ntfs_aops_cmpr : &ntfs_aops;

It is not safe to change a_ops dynamically like this.

There can be other operations running concurrently using the
existing aops, and some functionality (e.g. the page fault paths)
have dependencies between aops methods and swapping the aops between
those operations can cause all sorts of problem (including crashing
the kernel).

This is the reason why we cannot turn functionality like FSDAX on
and off via fileattr_set() methods setting/clearing inode flags.
The inode has to transition out of cache and be re-instantiated to
change the inode aops methods safely...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
