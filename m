Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F03FC8
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 13:10:06 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id x27so3631146lfu.5
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KHHoXrJ+SWW5a+9TtCJiIXbU7xyrGDf/8+LvAfdLqDE=;
        b=PpJMwvr4XwaYDUeqvg+foTmVL2OPhrRKP7dZuNVVDjKveMWs8caoJjpQeu5cuPwj7R
         G2F/iZWpZtSreegjcTtfB/5Gb8rs15S6J2fPFYdpXhzAMj3813MEbJT5xKwXHSbOzHBi
         6aHSgRHY+dz0eCE2lAi69SfixQ0r3e823BU2wvLfVmxfmZZjn0j/tVUQlGJhgwRZ3aI0
         ZeB249bCY81LdhwDSDkNNQm1Y/0CYP/e4zRJHjsdYg/TBhsZuYIRjayCDD1c8L/UlvtE
         YCff0MJyqgrh4i8F/Z189NiZ0f5tROaSmgcwEF491imA4hDSZcHwxvjnKV2SR4Eb1Ber
         msBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KHHoXrJ+SWW5a+9TtCJiIXbU7xyrGDf/8+LvAfdLqDE=;
        b=NgtNP/0/tSQbt4P7HVhidREomJ5rmjoqokQeOLszY1XAzgwTU9wI7rvFX3wF8TPKug
         TXiObG+ciVZsLqEJyArlbtP6TLLuOLRzfc1Oyhl6O1tO2gOIT5AtEvFy55dy4l4GTPI+
         r7RDhKMO5lqpsm/OYkuINeM371+p0mAKZXsEcKuGl7OITDRHOclkH8d3/hwUqTK3hLMF
         pFYsxOLtFWSFLZTFFf602xDsCF7NEs99I1rTnRUPX2NzteEYasw/3UwP278eKTD1YJ48
         4fG4mw7MAF3PxHPfFS0PA3wsmN6ssV4ya7ZE1ahlLJhDC47r+Vd0EtKq8LKPbn0u3VAK
         FO5A==
X-Gm-Message-State: AOAM530XN00V0RsLK3pE5mHSSZ48hB4Dh2eEtW+1nLFp/Pc48uvy2uk4
	02SgihsDq2MG5gNI4wVfxKk=
X-Google-Smtp-Source: ABdhPJw0fUflj9KJzjYW3MEnAJFaoPREIExujmJjLB0R16NBBZacjdzjI4wTTx3sL6g1P5gG3g2mLw==
X-Received: by 2002:a05:6512:228f:: with SMTP id f15mr2263936lfu.253.1631193004167;
        Thu, 09 Sep 2021 06:10:04 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id w9sm211056ljo.36.2021.09.09.06.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 06:10:03 -0700 (PDT)
Date: Thu, 9 Sep 2021 16:10:02 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/3] fs/ntfs3: Speed up hardlink creation
Message-ID: <20210909131002.sketqhqczh4ahe74@kari-VirtualBox>
References: <db0989dd-c03b-d252-905c-f0ebd0abe27f@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db0989dd-c03b-d252-905c-f0ebd0abe27f@paragon-software.com>

On Thu, Sep 09, 2021 at 01:57:51PM +0300, Konstantin Komarov wrote:
> xfstest 041 was taking some time before failing,
> so this series aims to fix it and speed up.

Please replay patch series against to cover letter.

> 
> Konstantin Komarov (3):
>   fs/ntfs3: Fix insertion of attr in ni_ins_attr_ext
>   fs/ntfs3: Change max hardlinks limit to 4000
>   fs/ntfs3: Add sync flag to ntfs_sb_write_run and al_update
> 
>  fs/ntfs3/attrib.c   | 2 +-
>  fs/ntfs3/attrlist.c | 6 +++---
>  fs/ntfs3/frecord.c  | 6 +++++-
>  fs/ntfs3/fslog.c    | 9 +++++----
>  fs/ntfs3/fsntfs.c   | 8 ++++----
>  fs/ntfs3/inode.c    | 2 +-
>  fs/ntfs3/ntfs.h     | 3 ++-
>  fs/ntfs3/ntfs_fs.h  | 4 ++--
>  fs/ntfs3/xattr.c    | 2 +-
>  9 files changed, 24 insertions(+), 18 deletions(-)
> 
> -- 
> 2.28.0
> 
