Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BAB2BAF9
	for <ntfs3@lists.linux.dev>; Tue, 18 Feb 2025 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739859342; cv=none; b=qcWK7ubM+VkcMbioPyJB4n6oOLI3kA13QqethH8gCwXsiQSyOIxZO5f6901iLHTS+35qQZKkAkguK1N0BGhOmo6kiQXRwMP7FHi4nfbHLl+D6049DUGq7PjePaDqyI29KsedudClvBU/lqNWL1DfFJCOss0r3/oFPXIGB2UMcto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739859342; c=relaxed/simple;
	bh=fNx5h03me5S+z+NJlNI6lij4WcuTFkFyq7y8Fd2B3C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB0xw7GdZETK2fon0uYBwyiyy9qXJ6GbhMUqhG0sV+8goTduRe8uri0+CoAqI8bZn4ZSsazK+7816hugMYggRHdJ4s67+vctruCgeWXMHXRDPFrYYm/aze7M3kUdoFHTHpBA/HrgO5TH7q5BV3DVSbpHOutZTotkdjivQvw/5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=iTLGCFFr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="iTLGCFFr"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22114b800f7so37915435ad.2
        for <ntfs3@lists.linux.dev>; Mon, 17 Feb 2025 22:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1739859340; x=1740464140; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hmcf5B5KdUSe3Q6Yowv+NxabA9TljnEmIKiC4o0zqD8=;
        b=iTLGCFFrA92v8uVHblb5Jc4jmUFKRaVBqj6pw/CH4hEPrMEdwy0kNqaS6QukxUs1Mf
         676EaluYYg2T/vNcRsyz+xxM9muabuWMWiB5dfk6wLZRdLfPAUuDCyEtH5YYNuSaypDV
         lJVUU/Qekh3aYYbZlSoU9qpVpUlQQJdUgjLe+H2+o8PzkNZzoFumL1TpPyBOgCF4nXzO
         hPsV8OWAIQ7QpNYIwV396/Gl2vK6IddzINtIHH8bpbgAScb5KJ1j+8IGoJOU0wFKFT4s
         D9+T5J1KGMH0WR/ASFRIIYXEM9qXHFRZbFWJjdUKTvkWWS6f0jiwCuZe7+SpFw8+aR+Y
         Q9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739859340; x=1740464140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmcf5B5KdUSe3Q6Yowv+NxabA9TljnEmIKiC4o0zqD8=;
        b=wiguVp+0Oo4DsqzdP7u0SqnYHshkWU0phKtlG+D1KigGfzq9aEKCn/3gXkUXdLO6R0
         UCrnhHle5HnL4fCjZ08cQW5EBr+AXmjZR9QHRwez7T/yLFbH/o0uKo08tem3HE0F/oF1
         fL2VFM8Jw2IE1rL4kYPPgxuJRdPyiiuvsHxqC2aiBNjsO+dvBy0ZOxTqy2zlNEJa580Z
         JV5wXbaRVHV+0ABGMzofSytvkz8LhvMkpDiiCGuSrtJDBvDn04/RmFpwgP1TcBkC2H/t
         IW4J15z7mkdlw3dXkJCQplCqww91Vt1I1DZ7Cic58UQu5mImbPR70vL3DbtUkL7mAQF5
         FViQ==
X-Gm-Message-State: AOJu0YwKWCOqiCegsoiv+HiXnNc3FESz9qQPVMVkBBptfgWavBalzrZT
	TXt3FUtxkdzuXaq7gj/1HxMo7wcJmLqvhU0XOyYNDkAYXhouBl+5w0nKGknBbgA=
X-Gm-Gg: ASbGncsu3wQOzmseiw3k6fP+bBZehGAZGm+CAzziVeZbPuCmZ8wkO/dsqGGhm2RfimK
	ABcPs2ZTWVQoiZcbvLynz7qDISC71paoF5+3KdcUexAXLt85jXsFzePmcsCO/N21e/LNGPqG5+z
	5sGb9NFWC2ZFsp4SgD+4YScyDXT+TChdh3U0MrN14OtQRqZJkXK76WAJXCO0dGSfyuAbPylFd9J
	blADyrAdyMTM36NwfWAk/UtT9hz0qqiUnzZrq2D8jNOlG69/AUJZfuCBy1OuZz4NIz8RFBXqf+x
	P8YV9P+L/ykUYoOouRnTEdVmcnnH29LozYLhGCmiDqcZRIqmmctwXsZ6aQSlKk6nGtg=
X-Google-Smtp-Source: AGHT+IEgl4G26U11CY36YATathuCAnpF80E386MMKenKBlIE6WvmLXyrOHUjBTkfhZHvj9d6jB7Llw==
X-Received: by 2002:a05:6a20:43a9:b0:1ee:6032:b1ed with SMTP id adf61e73a8af0-1ee8cad55a2mr20416483637.17.1739859340119;
        Mon, 17 Feb 2025 22:15:40 -0800 (PST)
Received: from dread.disaster.area (pa49-186-89-135.pa.vic.optusnet.com.au. [49.186.89.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732642d908esm5645953b3a.159.2025.02.17.22.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 22:15:39 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1tkGtL-00000002hNN-3xgZ;
	Tue, 18 Feb 2025 17:15:35 +1100
Date: Tue, 18 Feb 2025 17:15:35 +1100
From: Dave Chinner <david@fromorbit.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Kun Hu <huk23@m.fudan.edu.cn>
Subject: Re: [PATCH v2] fs/ntfs3: Update inode->i_mapping->a_ops on
 compression state
Message-ID: <Z7Qlh9856tVuzrYK@dread.disaster.area>
References: <20250123135335.15060-1-almaz.alexandrovich@paragon-software.com>
 <20250131131831.6289-1-almaz.alexandrovich@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131131831.6289-1-almaz.alexandrovich@paragon-software.com>

On Fri, Jan 31, 2025 at 04:18:31PM +0300, Konstantin Komarov wrote:
> Update inode->i_mapping->a_ops when the compression state changes to
> ensure correct address space operations.
> Clear ATTR_FLAG_SPARSED/FILE_ATTRIBUTE_SPARSE_FILE when enabling
> compression to prevent flag conflicts.
> 
> v2:
> Additionally, ensure that all dirty pages are flushed and concurrent access
> to the page cache is blocked.
> 
> Fixes: 6b39bfaeec44 ("fs/ntfs3: Add support for the compression attribute")
> Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/attrib.c  |  3 ++-
>  fs/ntfs3/file.c    | 22 ++++++++++++++++++++--
>  fs/ntfs3/frecord.c |  6 ++++--
>  3 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index af94e3737470..e946f75eb540 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -2664,8 +2664,9 @@ int attr_set_compress(struct ntfs_inode *ni, bool compr)
>  		attr->nres.run_off = cpu_to_le16(run_off);
>  	}
>  
> -	/* Update data attribute flags. */
> +	/* Update attribute flags. */
>  	if (compr) {
> +		attr->flags &= ~ATTR_FLAG_SPARSED;
>  		attr->flags |= ATTR_FLAG_COMPRESSED;
>  		attr->nres.c_unit = NTFS_LZNT_CUNIT;
>  	} else {
> diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
> index 4d9d84cc3c6f..9b6a3f8d2e7c 100644
> --- a/fs/ntfs3/file.c
> +++ b/fs/ntfs3/file.c
> @@ -101,8 +101,26 @@ int ntfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>  	/* Allowed to change compression for empty files and for directories only. */
>  	if (!is_dedup(ni) && !is_encrypted(ni) &&
>  	    (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode))) {
> -		/* Change compress state. */
> -		int err = ni_set_compress(inode, flags & FS_COMPR_FL);
> +		int err = 0;
> +		struct address_space *mapping = inode->i_mapping;
> +
> +		/* write out all data and wait. */
> +		filemap_invalidate_lock(mapping);
> +		err = filemap_write_and_wait(mapping);
> +
> +		if (err >= 0) {
> +			/* Change compress state. */
> +			bool compr = flags & FS_COMPR_FL;
> +			err = ni_set_compress(inode, compr);
> +
> +			/* For files change a_ops too. */
> +			if (!err)
> +				mapping->a_ops = compr ? &ntfs_aops_cmpr :
> +							 &ntfs_aops;
> +		}
> +
> +		filemap_invalidate_unlock(mapping);

Holding the invalidate lock doesn't make it safe to change aops
methods. We've been down this road before - find some other way to
switch modes internally to the ntfs filesystem, because changing
aops pointers like this is *not safe* and not maintainable.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
