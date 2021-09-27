Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F42FB2
	for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 19:02:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u18so80385260lfd.12
        for <ntfs3@lists.linux.dev>; Mon, 27 Sep 2021 12:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fBTq8I3NOShXYZBIuCwUw+73ao/llMiq2AxwPqrbQhY=;
        b=pjpp5vcDsDI298raVY03G6GDYJBncvUCFByP86SuHvrYdg9eH2B63WI1ZX1R/f2Y5C
         NUaMUsL6X6qZk0SP5X/D/JtssWBHOsyDfVmfkDRcI2yBhSSuNcW7qZ1a+2cYS+nvQnlq
         qHeDtjDmoaaScQ/FxkB4bqi3Da/ZB9eXYWNQg8drPHTkN9CMAoXeZ0IL8Bw/aSVPM5M5
         GD25a8RfvMn6+40l6anpjonJrdxpnrm92lR7dG2qolq+GRGO/i+8eQwGbeQHiRPYZTqC
         bSjJXxYnxRNqPTNESGGqd2Vk/+tueRssR0u5BG4RrNlTNxQ0uhELcu6tgO9sPlkPgEsy
         8PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fBTq8I3NOShXYZBIuCwUw+73ao/llMiq2AxwPqrbQhY=;
        b=5TMamL21Z2Mp1tOp86L00iXIRPlgn8WJdobersC0EmltwpLdTd9N8qOoSo0r0TS2Bi
         r5nbP767gSDVFq7WFrs+7dmc9SHmdXlxyNedjiFCcLokVkz4dH4zp6HQb1GjU9/Tr86b
         5RoGvwnBE0lK6s4vIOZAlm5MGuL7kVzcT9m5lKR2DqV2JDAbu84ywG0KJXorqHtG6D+Y
         er16OA1aDrdEj2uweLJjwHGkUFHaS1UctndnwWpk67MaxHKGtdZBh3Uktykx52lUSaoD
         z0d4Sy0hPD+5y5GgeGCQT9Izy4/ncdFx80goRyauxqAVAlDkVOFbD0hBlXdYWpWDRODa
         LUFw==
X-Gm-Message-State: AOAM533NtzTMPnnmfAzTPoHCsbdi7EzMHXnhzyfh5vXPAkffJrqZi5qy
	SovD9yYcdG/oxKT7hK2Wbzc=
X-Google-Smtp-Source: ABdhPJy+08o2NUFQfzYv39MmXVMfw1zN44e4CFgofkaIxMfN94bv0N/Oez8mqNT+cmuFqYnW0DG6aQ==
X-Received: by 2002:a05:6512:3989:: with SMTP id j9mr1307909lfu.213.1632769323684;
        Mon, 27 Sep 2021 12:02:03 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id v8sm1593466lfe.6.2021.09.27.12.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 12:02:03 -0700 (PDT)
Date: Mon, 27 Sep 2021 22:02:01 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] fs/ntfs3: Refactoring of xattr.c
Message-ID: <20210927190201.yhlipxcitremds3e@kari-VirtualBox>
References: <a1204ce8-80e6-bf44-e7d1-f1674ff28dcd@paragon-software.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1204ce8-80e6-bf44-e7d1-f1674ff28dcd@paragon-software.com>

On Mon, Sep 27, 2021 at 06:26:26PM +0300, Konstantin Komarov wrote:
> Removed function, that already have been in kernel.
> Changed locking policy to fix some potential bugs.
> Changed code for readability.
> 
> V2:
>   fixed typo.

In the future please tell more closly. Now reviewr has to check
everything again. It is also good thing to write if someone suggest it.
Then that person can see right away that you change what he/she
suggested.

Also usually when someone comment something to previes series version
then you take all commenters to cc list. Usually reviewer will might
wanna give reviewed-by tag after you change what suggested.

> 
> Konstantin Komarov (3):
>   fs/ntfs3: Use available posix_acl_release instead of
>     ntfs_posix_acl_release
>   fs/ntfs3: Remove locked argument in ntfs_set_ea
>   fs/ntfs3: Refactoring of ntfs_set_ea
> 
>  fs/ntfs3/xattr.c | 69 ++++++++++++++++++++++--------------------------
>  1 file changed, 32 insertions(+), 37 deletions(-)
> 
> -- 
> 2.33.0
> 
