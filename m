Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E281362F
	for <ntfs3@lists.linux.dev>; Wed, 10 May 2023 06:04:02 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f315735514so232078005e9.1
        for <ntfs3@lists.linux.dev>; Tue, 09 May 2023 23:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683698641; x=1686290641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oecgp8nrUapY5VDDBn1FtQ7eMDTOYYPN30xj2/5/y0=;
        b=ez5Kz6O1239EmhJNClUoGJ7ChPWyqlc8/eXlTWQLRD3HOXJcIyrFWtV0datPQlxVQm
         UJpeCXouokEdJez4c2EQDoF7xlPhP+E84tT8cWxlgtg8Zp60m2ortDnLcxcVxn5tQque
         RTOWeIC7joo5yw1yYt1d90M+jnwl5dqM7UZGCElfSJuKu4kIkryqNLyHDBttKfCN6j/S
         Jtl/DdNQzPmVX2EULyLIRjepRluSYgCWwb7qz1L5IgHnLcRnctBE/2BI9s5ujc9dN8aS
         H4QeyHVbPGOCiovzGc4fmxU932AQY6M2jg6+ZcEjLRpYD/TUFSAgAlTJVTWvwLaJSoGS
         RU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683698641; x=1686290641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oecgp8nrUapY5VDDBn1FtQ7eMDTOYYPN30xj2/5/y0=;
        b=g+oWafsmd70iFrvL83bYmtvAXhKOT1GLPJqejXDA9dL1oG0CAMiXE3XdfNV2zzRCxE
         LDmoUc4Baumq25zmp+l+O6LcxOr2t1gbWcfIrgbk5Bk4YYlARdv6vVXAT9XCF/H21T4u
         u7RrSGM/KmpWtv5FizrYmyJifd9NrN5ncm7Yn7GaeSdkWfJb720CkjcrN918/oIKjpTZ
         Ww8Fres7Ibc0f1sI/vxo9JBJ7ikCM9VHcjWOgMQh7nBKGwCMWBfrTevBu0U/jqHHcprn
         3Tc1jMR4fJ1CVuyGVYRCIhbpAwHaj9OaTzG8p42bZJ++9K+W3Y0sfRQja+/DWLKSNI6Q
         7YBA==
X-Gm-Message-State: AC+VfDwUaVxsNIWTmSA+qUmgkZJZZlcGmdSXvAWsUTebtK1dkwlisCC3
	dhSN/kirRg8oyBllN5Ck6yM16A==
X-Google-Smtp-Source: ACHHUZ5ztgvrQRHv3nog9OIbX/n5hxhWrwNBQJ1GsEGJS/0g0QPFuv1NLYlZULOmVs8j5jv93yBW4Q==
X-Received: by 2002:a05:600c:1d04:b0:3f4:2254:8573 with SMTP id l4-20020a05600c1d0400b003f422548573mr7847970wms.16.1683698641070;
        Tue, 09 May 2023 23:04:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x16-20020a05600c21d000b003f318be9442sm21894254wmj.40.2023.05.09.23.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 23:03:59 -0700 (PDT)
Date: Wed, 10 May 2023 09:03:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev
Subject: [bug report] fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and
 /proc/fs/ntfs3/<dev>/label
Message-ID: <b01e2e73-6c85-460b-b9c7-fdaad3812d4c@kili.mountain>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Konstantin Komarov,

The patch 1f60ec888102: "fs/ntfs3: Add support
/proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label" from May
8, 2023, leads to the following Smatch static checker warning:

	fs/ntfs3/super.c:1554 ntfs_fill_super()
	warn: proc file '"label"' is world writable

fs/ntfs3/super.c
    1547 #ifdef CONFIG_PROC_FS
    1548         /* Create /proc/fs/ntfs3/.. */
    1549         if (proc_info_root) {
    1550                 struct proc_dir_entry *e = proc_mkdir(sb->s_id, proc_info_root);
    1551                 if (e) {
    1552                         proc_create_data("volinfo", S_IFREG | S_IRUGO, e,
    1553                                          &ntfs3_volinfo_fops, sb);
--> 1554                         proc_create_data("label", S_IFREG | S_IRUGO | S_IWUGO,
                                                                               ^^^^^^^
Are labels supposed to be world writable?

    1555                                          e, &ntfs3_label_fops, sb);
    1556                         sbi->procdir = e;
    1557                 }
    1558         }

regards,
dan carpenter
