Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B3A72
	for <ntfs3@lists.linux.dev>; Sat, 18 Sep 2021 07:01:36 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id m3so40165084lfu.2
        for <ntfs3@lists.linux.dev>; Sat, 18 Sep 2021 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6LFIPcmdFoFj4rklUTz5qGSaqnsNVcI23FWVEmDMQjs=;
        b=IH3+DjVepbtQzCKQi8qz39JqT7+RO5gl11M8W9tm0/UaqEgcI/3SYP43klsk2ZrN3F
         jF42z5ZqZ6EcJfe/92vPdDiK3jpacEvVTrXBRy7tL6aR0GdCy4IzGncLrAKPC7NC6iBE
         je3P9YiDsV20/clMkRNrPr1ZxUiVZ4xctKG3vQ9VrWDU0BwytCWOSR3z0jSJkHSrs3uB
         VFFBjQkrEGsPytda8oPQ9bNl7PYtMgq9uEqCLaQnJtaffctwNLnm06EeA8HIQU01Sc8F
         pz9exm6wfP95xQguZ1luRr8DfYIX1+8tanmtaaGnbT/JzFLBKqYwBq9jBn4NsiOCJZMc
         QYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6LFIPcmdFoFj4rklUTz5qGSaqnsNVcI23FWVEmDMQjs=;
        b=BihPnBvUKGV3U23smy2ARC7bEpH5BcdyYJeZcl10IXXn2Y7r5oF2sVEfpUD5keNWi5
         gmVauk7N7Lp0TnjioakR6FHFGeaEGMlThQc4ZV8xe/C+b2gVvN4kYUfb9WYlxJE0tpAU
         lz+g5HTUsM9wt8dBwHP8ESTKEWT4uFQ/NBBsV7NgPFr+7mQ5IjWE0HaXqEnD5CFu6ttZ
         oS9RwTn/zPvi4wzE1T4CMlzET3krKMZ9sZ5RkhWGFR8PttqnFP7V+tpCfysI0ykr5NC5
         1fQnSyqNozpnycYZowD7Otdb2u3Eqvpvy3Hk3ghpVPFrDhzd3uPiTKWPe5PZRYVd7doY
         QwkQ==
X-Gm-Message-State: AOAM532WGqef0SL8mdlA//sNhCHES8qHiMSBwo4twPjzRYtado0Bqo6M
	dh20yIyXC0Cn9MeMHfsMj2M=
X-Google-Smtp-Source: ABdhPJzRsRve3Ssj4TkmOw3kbZQxgkltubFsNVgc4WheBTwM4gS3oyYAmAsbvQhRWLAQyC7x8Ld+/A==
X-Received: by 2002:a05:6512:553:: with SMTP id h19mr11087093lfl.33.1631948494009;
        Sat, 18 Sep 2021 00:01:34 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id i18sm969297ljj.84.2021.09.18.00.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 00:01:33 -0700 (PDT)
Date: Sat, 18 Sep 2021 10:01:31 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/3] fs/ntfs3: Speed up hardlink creation
Message-ID: <20210918070131.u3e2obnj4vejzfxj@kari-VirtualBox>
References: <a08b0948-80e2-13b4-ea22-d722384e054b@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a08b0948-80e2-13b4-ea22-d722384e054b@paragon-software.com>

On Mon, Sep 13, 2021 at 06:09:42PM +0300, Konstantin Komarov wrote:
> xfstest generic/041 was taking some time before failing,
> so this series aims to fix it and speed up.
> Because of this we raise hardlinks limit to 4000.
> There are no drawbacks or regressions.
> Theoretically we can raise all the way up to ffff,
> but there is no practical use for this.

Hi. Sorry for taking so long. Did not notice that this is actually
another version. Please use v2 in subject. I did ask you to write little
bit more to commit "Change max hardlinks limit to 4000". Now you have
write it here. Cover letter will not be in commit messages. You need to
write this info to commit message also.

> 
> Konstantin Komarov (3):
>   fs/ntfs3: Fix insertion of attr in ni_ins_attr_ext
>   fs/ntfs3: Change max hardlinks limit to 4000
>   fs/ntfs3: Add sync flag to ntfs_sb_write_run and al_update
> 
>  fs/ntfs3/attrib.c   | 2 +-
>  fs/ntfs3/attrlist.c | 6 +++---
>  fs/ntfs3/frecord.c  | 9 ++++++++-
>  fs/ntfs3/fslog.c    | 8 ++++----
>  fs/ntfs3/fsntfs.c   | 8 ++++----
>  fs/ntfs3/inode.c    | 2 +-
>  fs/ntfs3/ntfs.h     | 8 +++++---
>  fs/ntfs3/ntfs_fs.h  | 4 ++--
>  fs/ntfs3/xattr.c    | 2 +-
>  9 files changed, 29 insertions(+), 20 deletions(-)
> 
> -- 
> 2.33.0
> 
