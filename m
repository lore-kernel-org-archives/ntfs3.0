Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9C1ED52
	for <ntfs3@lists.linux.dev>; Tue, 25 Jul 2023 11:45:43 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3144098df56so5089549f8f.2
        for <ntfs3@lists.linux.dev>; Tue, 25 Jul 2023 04:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690285542; x=1690890342;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+jJBBWUbP/jGMf4d/dr7v7vk6i9GDjtDwMWVyp392I=;
        b=IqfOwIDmEWmsMiiiHaQxNKMF8TAXfI2TIksmszH3Zm+R1aO56YU2y1GuoRZiXv6Crs
         Nlz+sBXUQL022WQKLgZOVRjW+LgYE2P+e6mwby+PBG9iUAmTf76I3UmJyBm7i8xJ719F
         J847+haWpJaVimG8NhVOzj5lPRsHX1iVZq9OM9BYIdyKgY8yt4IFGqD4WZe1TNeXlxct
         ey+/kFNmyPcpQR6kqJJ2KYxkSW4GNIYr66PAU2WyEIkHHElZ/3gXXXOYWkUj2NNqh4Jg
         OEU0uYafqbvpblhI/QHDWAaxZVBa9yOqax4mSwDLW18Ehk5yNZ2Psvcw2S3ewfs5EOIo
         /G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690285542; x=1690890342;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+jJBBWUbP/jGMf4d/dr7v7vk6i9GDjtDwMWVyp392I=;
        b=VuxlIG6diAn3f+ihbp11aFRJYhiocOpNuEggCQ1BrFDAVGSP04zVg2tqQKzat1dzUE
         ZyjmVT/fl5k8BDoauFQdh/cw1wJkYJ2/ZqPP7+8ie9eMg+61+8UwT4WV/jwXcYShyJ3i
         AJJf+oQ4FYUqBm76wfsM0e3OnQtwaFhrSnecQLCqdyouXRrZEeNlJuEWCSjB0I2TVQb+
         esWU6kdczGhIg8zkHC9EzrfEIsoDQXza6WrhoFhgsbkWv0NqFqRqwlCyxpYLv8PSC/Uj
         IF/U+jAfR17VMmPxrPLouqppQZCIxYLPwoA75nkJodhh/vow/so4tn5CUII9YUMx70K8
         +/5g==
X-Gm-Message-State: ABy/qLaIKufH77b4CmH5Mmw9VkNXiLmacoix1oQVMVviNglgedGoHXLj
	MX8qcO0nWVn9XRfIG+Dyvl26ER+dnPh9ALWTzuw=
X-Google-Smtp-Source: APBJJlF3MWurcrRWHaRJdZeYdqu3t2P6Uv7lQ4SszmR5svKeydwihs/t96X4/+nN2gvdXtL6VhWY3Q==
X-Received: by 2002:a5d:4982:0:b0:317:70da:abdd with SMTP id r2-20020a5d4982000000b0031770daabddmr198421wrq.59.1690285541895;
        Tue, 25 Jul 2023 04:45:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r15-20020adff70f000000b003143ba62cf4sm15952453wrp.86.2023.07.25.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 04:45:41 -0700 (PDT)
Date: Tue, 25 Jul 2023 14:45:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add attrib operations
Message-ID: <fbbe8988-789f-4837-b3fb-52baa02cebff@moroto.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konstantin Komarov,

The patch be71b5cba2e6: "fs/ntfs3: Add attrib operations" from Aug
13, 2021 (linux-next), leads to the following Smatch static checker
warning:

	fs/ntfs3/xattr.c:393 ntfs_set_ea()
	warn: integer overflows

fs/ntfs3/xattr.c
    301 static noinline int ntfs_set_ea(struct inode *inode, const char *name,
    302                                 size_t name_len, const void *value,
    303                                 size_t val_size, int flags, bool locked,
    304                                 __le16 *ea_size)
    305 {
    306         struct ntfs_inode *ni = ntfs_i(inode);
    307         struct ntfs_sb_info *sbi = ni->mi.sbi;
    308         int err;
    309         struct EA_INFO ea_info;
    310         const struct EA_INFO *info;
    311         struct EA_FULL *new_ea;
    312         struct EA_FULL *ea_all = NULL;
    313         size_t add, new_pack;
    314         u32 off, size, ea_sz;
    315         __le16 size_pack;
    316         struct ATTRIB *attr;
    317         struct ATTR_LIST_ENTRY *le;
    318         struct mft_inode *mi;
    319         struct runs_tree ea_run;
    320         u64 new_sz;
    321         void *p;
    322 
    323         if (!locked)
    324                 ni_lock(ni);
    325 
    326         run_init(&ea_run);
    327 
    328         if (name_len > 255) {
    329                 err = -ENAMETOOLONG;
    330                 goto out;
    331         }
    332 
    333         add = ALIGN(struct_size(ea_all, name, 1 + name_len + val_size), 4);

It's bad to mix struct_size() with any sort of math.  Going into it, can
this overflow "1 + name_len + val_size"?  And then struct_size() returns
ULONG_MAX if there is an overflow.  When you pass that to ALIGN() it
becomes zero.

    334 
    335         err = ntfs_read_ea(ni, &ea_all, add, &info);
    336         if (err)
    337                 goto out;

regards,
dan carpenter
