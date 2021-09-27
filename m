Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A673E72
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 19:22:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id u8so80959693lff.9
        for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZgV4+891hWawJhJbVPDaZH/PqRpsv7iNX1E3FL6g1Mk=;
        b=U4T/SsW/Zk8Ge2yXTz79d6Y0RJzgN31F5kpFnnTkPZRJ7Bw0yDM4Y45LM0+4BEyaJG
         sIcxbTRDaOBx1e9tSYtNi7ugcq64+kgOVouCxAk3cZUuC+KwI/QtzAUrtoblgPWTzxYo
         oX9k7gY9otnMQfPtceUNR4T/u5c3CGph5kfhinE1QSut5IyI/LVK2gafWAsoTSdw9hiH
         LbkFbsMfHVMMRYfppR92R+6eHGv3Xb5B3sPBbP9yXvl+fD7ap4PQ6VuQ4cUDn110m7qA
         8HCsBeFt8NnTHIkaUTHwnf99ohL2SQVUX3BfrYIJVxI6bvlcoFtkp1jZSI/aZhl8QCPc
         RLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZgV4+891hWawJhJbVPDaZH/PqRpsv7iNX1E3FL6g1Mk=;
        b=i7+OIYy+S3E4Mo6nmXcN6Dq/xCIkvw9F2YzDmZYEkusVZUkZd/SkYmj3AgId2RFmzm
         VieZRdncf7+18M/+tm16/RMq7GYYuQMjwm3w2R0GTMuxF689zIzRylKEkDGL5NWTU6z1
         7x8GAe6BLJ+2fZDmU07HAXQCSsxhV04mu1b1Au5Zp5vnbfYO76MplK4NX4NRd89X4zkw
         08kEjHV+aGwga0RySCUK/HgO9rqCuxKUHgpMWxy6y6YKHfGLJt7wV8tD/YK3hcv8/nZJ
         25iS+CzRzV/hR6iwULCNXTSr1gAh9iajHkxthwBRbeJr4A0gFcAKd8NU8GDslJ+VrTq6
         GEKQ==
X-Gm-Message-State: AOAM533SvJaXpZsr6U3hBIs5A/zthnaEqhbMEjlOvT/UKeddjHWlOrN8
	nacHfkgfsgPgwROGolNeUp0=
X-Google-Smtp-Source: ABdhPJyYtyDEeNvM93yYVWismw61+xj3G7BQNdHuzE41ta7GBYcYegoob9AdNIw3RvPNLQKPxQDGow==
X-Received: by 2002:a05:6512:23a1:: with SMTP id c33mr1449027lfv.518.1632770559351;
        Mon, 27 Sep 2021 12:22:39 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id k14sm2028040ljh.125.2021.09.27.12.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 12:22:38 -0700 (PDT)
Date: Mon, 27 Sep 2021 22:22:36 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	joe@oerches.com
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] fs/ntfs3: Refactoring of ntfs_set_ea
Message-ID: <20210927192236.3s75h74aglrpg3s2@kari-VirtualBox>
References: <a1204ce8-80e6-bf44-e7d1-f1674ff28dcd@paragon-software.com>
 <eeaa59a8-4ca1-9392-69f9-e3179a75de75@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeaa59a8-4ca1-9392-69f9-e3179a75de75@paragon-software.com>

On Mon, Sep 27, 2021 at 06:28:37PM +0300, Konstantin Komarov wrote:
> Make code more readable.
> Don't try to read zero bytes.
> Add warning when size of exteneded attribute exceeds limit.
> Thanks Joe Perches <joe@perches.com> for help.

Usually if someone review and suggest something small do not add this
kind of line to commit message. Also you need permission to add this. It
us same kind of situation when we add suggested-by tag. Linux
documentation stated that it cannot be there if we do not have
permission from other.

Also at least add that person email 'to line'. Sometimes if someone make
huge impact to patch you can ask and add this kind of line. But then
again it might make more sense to add it suggested or even signed off
tag depending in situation.

It can stay if Joe says it is ok.

> 
> Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> ---
>  fs/ntfs3/xattr.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
> index 1ab109723b10..5023d6f7e671 100644
> --- a/fs/ntfs3/xattr.c
> +++ b/fs/ntfs3/xattr.c
> @@ -75,6 +75,7 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
>  			size_t add_bytes, const struct EA_INFO **info)
>  {
>  	int err;
> +	struct ntfs_sb_info *sbi = ni->mi.sbi;
>  	struct ATTR_LIST_ENTRY *le = NULL;
>  	struct ATTRIB *attr_info, *attr_ea;
>  	void *ea_p;
> @@ -99,10 +100,10 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
>  
>  	/* Check Ea limit. */
>  	size = le32_to_cpu((*info)->size);
> -	if (size > ni->mi.sbi->ea_max_size)
> +	if (size > sbi->ea_max_size)
>  		return -EFBIG;
>  
> -	if (attr_size(attr_ea) > ni->mi.sbi->ea_max_size)
> +	if (attr_size(attr_ea) > sbi->ea_max_size)
>  		return -EFBIG;
>  
>  	/* Allocate memory for packed Ea. */
> @@ -110,15 +111,16 @@ static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
>  	if (!ea_p)
>  		return -ENOMEM;
>  
> -	if (attr_ea->non_res) {
> +	if (!size) {
> +		;
> +	} else if (attr_ea->non_res) {
>  		struct runs_tree run;
>  
>  		run_init(&run);
>  
>  		err = attr_load_runs(attr_ea, ni, &run, NULL);
>  		if (!err)
> -			err = ntfs_read_run_nb(ni->mi.sbi, &run, 0, ea_p, size,
> -					       NULL);
> +			err = ntfs_read_run_nb(sbi, &run, 0, ea_p, size, NULL);
>  		run_close(&run);
>  
>  		if (err)
> @@ -366,21 +368,22 @@ static noinline int ntfs_set_ea(struct inode *inode, const char *name,
>  	new_ea->name[name_len] = 0;
>  	memcpy(new_ea->name + name_len + 1, value, val_size);
>  	new_pack = le16_to_cpu(ea_info.size_pack) + packed_ea_size(new_ea);
> -
> -	/* Should fit into 16 bits. */
> -	if (new_pack > 0xffff) {
> -		err = -EFBIG; // -EINVAL?
> -		goto out;
> -	}
>  	ea_info.size_pack = cpu_to_le16(new_pack);
> -
>  	/* New size of ATTR_EA. */
>  	size += add;
> -	if (size > sbi->ea_max_size) {
> +	ea_info.size = cpu_to_le32(size);
> +
> +	/*
> +	 * 1. Check ea_info.size_pack for overflow.
> +	 * 2. New attibute size must fit value from $AttrDef
> +	 */
> +	if (new_pack > 0xffff || size > sbi->ea_max_size) {
> +		ntfs_inode_warn(
> +			inode,
> +			"The size of extended attributes must not exceed 64KiB");
>  		err = -EFBIG; // -EINVAL?
>  		goto out;
>  	}
> -	ea_info.size = cpu_to_le32(size);
>  
>  update_ea:
>  
> -- 
> 2.33.0
> 
> 
