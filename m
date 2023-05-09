Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E54174FE
	for <ntfs3@lists.linux.dev>; Tue,  9 May 2023 19:30:42 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-77106047c7dso1649690241.1
        for <ntfs3@lists.linux.dev>; Tue, 09 May 2023 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683660642; x=1686252642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yDoEr8WUcosWAB75TDES0XOSAOF70d3PYdw53BsU/vk=;
        b=ZsEvVKJUooBL3kBWnwS/yGvHSKL06QhfHH8U9mp8k1NQa6oiAay5POTOjtD2MEkkVs
         CnY0SjzBIiU/I4j4tZ3I0LBw6QO1tMsqnHUOAcyZ4UpLVVocmb7dNXei4KLphxWOZfyN
         0/+wPgLft0o3PZ6+7cNysdw4C1gsZe+uOtpauquOYh8F3ZOkJ5pynm6mmpahCAi5Flx8
         AUFhcDQVyFpT2keS7OPJmXQT1OMFd9KjWj8c3gxRRx5vf44Yu8/a+uQ70AL106SKBDF7
         2b2yluloOXQtUrtfdj/c9MFYTmaD/jfG+r749/E/ik5Ic5bWMCpGxX1znI02jwSPTz/g
         RXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683660642; x=1686252642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDoEr8WUcosWAB75TDES0XOSAOF70d3PYdw53BsU/vk=;
        b=JDrGKLO0yPXRDpPvXtxk67/jzb9D7VgFeU+WrnE6BE1iccxwy1w/ZsHoSmOWt3d6OL
         Q9rqQzzCo1begmN9NbBtsUoyrpKlXiaEvU/MVLRLUc/TTfL644aCQDaeJVZzfO2s94NT
         Qx7AENkbOPO57NyNv2N1m9QXcrVJza5oHIOA3FlauyRtjlVIF87SoBAfmcjmlw+ZO4Wd
         5A8NH7FoPHdL1hvD1a3YjU834nwTXr0Elw9aI9phh7nxO1KSiNkD6NYofvxLhzS+8sKW
         JX2B3AUmJ6H1nis3DnOT6FHl2AJoqsJkaWJnKQY5ekNGw2DRJOOw5dQwwun+GRTS9O59
         2WwQ==
X-Gm-Message-State: AC+VfDwRCQ0FAAq150GjXQS4V5rVuk0Fpvy4KvC1UEgfbU3AdR9OGHeT
	v1qWWbvKhXYNeKXYj/JcG1ImDjtXuMD6ftg+7Lt44w==
X-Google-Smtp-Source: ACHHUZ5fYrN1bZ1MeR0WEVPl0NR6Kbq8GyLkmS3HqomWcgnKMgebrUFYqSL+BI/lDoWX3+QFhnJCEqwg1ULmh/7Lxls=
X-Received: by 2002:a67:fd98:0:b0:430:e0:ac2e with SMTP id k24-20020a67fd98000000b0043000e0ac2emr4792589vsq.15.1683660641705;
 Tue, 09 May 2023 12:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230509030705.399628514@linuxfoundation.org> <20230509080658.GA152864@d6921c044a31>
 <20230509131032.GA8@9ed91d9f7b3c> <2023050913-spearhead-angrily-fc58@gregkh> <20230509145806.GA8@df3c0d7ae0b0>
In-Reply-To: <20230509145806.GA8@df3c0d7ae0b0>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 10 May 2023 01:00:30 +0530
Message-ID: <CA+G9fYuCLSuPchYoSfqnu6y+CUV+Km3TVFr1NhGj0dik-ScEdQ@mail.gmail.com>
Subject: Re: [PATCH 6.3 000/694] 6.3.2-rc2 review
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, 
	ntfs3@lists.linux.dev, almaz.alexandrovich@paragon-software.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 May 2023 at 20:28, Rudi Heitbaum <rudi@heitbaum.com> wrote:
>
> On Tue, May 09, 2023 at 03:56:42PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, May 09, 2023 at 01:10:32PM +0000, Rudi Heitbaum wrote:
> > > On Tue, May 09, 2023 at 08:06:58AM +0000, Rudi Heitbaum wrote:
> > > > On Tue, May 09, 2023 at 05:26:44AM +0200, Greg Kroah-Hartman wrote:
> > > > > This is the start of the stable review cycle for the 6.3.2 release.
> > > > > There are 694 patches in this series, all will be posted as a response
> > > > > to this one.  If anyone has any issues with these being applied, please
> > > > > let me know.
> > > > >
> > > > > Responses should be made by Thu, 11 May 2023 03:05:05 +0000.
> > > > > Anything received after that time might be too late.
> > > >
> > > > Hi Greg,
> > > >
> > > > 6.3.2-rc2 tested.
> > >
> > > Hi Greg,
> > >
> > > Further testing and have seen ntfs3: NULL pointer dereference with ntfs_lookup errors
> > > with 6.3.2-rc2 (I have not seen this error before.) No other errors in the logs.
> >
> > Can you reproduce this without the extern, gpl-violation module loaded?

Please share the steps to reproduce
 test case / Kconfigs / device under test environment / firmware / boot loaders.

- Naresh
