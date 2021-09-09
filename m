Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1213FC8
	for <ntfs3@lists.linux.dev>; Thu,  9 Sep 2021 12:57:50 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id r3so2847916ljc.4
        for <ntfs3@lists.linux.dev>; Thu, 09 Sep 2021 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yaXPdkw/Y9GdnRrZu+T/3Q1JexcjWMNdLrpPjZG0BhA=;
        b=D2U7cycoQUakuVjq4AfwqLpDws5gRVABN3oZXOPsGA9tx1klPjt3fuGdthO9PRQyPj
         JjTfsoFHoQytvwYxGWTUr0xt6onfHdJavozJVa55xU2HxhD2l1EFovVSZPWgNY2l+5RK
         9Gufd6PR33/i4kY05o8oqmGhh/U8tmA2vLexbDBom+fOn1oWMvIx21lzAs/qSWeHAkFE
         wnJR2zAOHONpcwfAsHW0phzKMPE3AFd3q7gyS0HDPZIve7L1pZc7fRauGRsNg4il4DN0
         qB3Tf8KNgC6pzQpbMCiUeG8qDrJKrao7RX9AQ47CiuhyVkWYphxLO26DheX0FHpQCo8k
         f0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yaXPdkw/Y9GdnRrZu+T/3Q1JexcjWMNdLrpPjZG0BhA=;
        b=HJQkOLDoAQ+fZ+dVKmOP2xec7dXKPHPP/MLydeyocyCp0awzdADJYoiZd+oCTKyrCc
         /3lyrOj3w5u6zQYI8Z6hYDbbnfhLzV8pj5BMKXK3N1Y0cw2iX+jVLmT1IK7p8KfsKjEb
         oRw0++Z6bFrtFH0k9xe0noGJrleFZY5vzbWGlYChDUFxmmCzMJly5tRUkZMVqfwY7KfW
         wQQMfGdJUaKuWn2fsMFZc42J8Scu9e5RBQ4CUeOqzJnaX3R1tIt2P5JdRWgLYhsOTdt+
         4p4RQn6wUPitYBxuhD9v8tl5g0BVjQCIIiSwiQXaX3rPNPQ+dKNPZoBP6YNesslkkd4M
         sBZw==
X-Gm-Message-State: AOAM532M3CB2YTOW9pWmOWAAxK6GARbAtON3S2oZlohKJ2r/s4CGnFFi
	JCvraLty8JUASB2vcr+QsE0=
X-Google-Smtp-Source: ABdhPJyoUGQQhyESyIlAvzDC1ZfD4wgWWHHcX2FtIYPuk2emCvOQAhNDUW3fyhSwACG6EDOJ10eYYQ==
X-Received: by 2002:a2e:955:: with SMTP id 82mr2107879ljj.274.1631192268253;
        Thu, 09 Sep 2021 05:57:48 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id b12sm185350ljf.62.2021.09.09.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:57:47 -0700 (PDT)
Date: Thu, 9 Sep 2021 15:57:46 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] fs/ntfs3: Change max hardlinks limit to 4000
Message-ID: <20210909125746.3io24xmh377ca4nh@kari-VirtualBox>
References: <89127d37-a38a-d15c-36f1-62f2ac0f4507@paragon-software.com>
 <20210909123034.mlsq57bsjvonwwd2@kari-VirtualBox>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909123034.mlsq57bsjvonwwd2@kari-VirtualBox>

On Thu, Sep 09, 2021 at 03:30:34PM +0300, Kari Argillander wrote:
> On Thu, Sep 09, 2021 at 01:58:04PM +0300, Konstantin Komarov wrote:
> > xfstest 041 works with 3003, so we need to

And it would be good to write generic/041. This way grepping is little
easier.

> > raise limit.
> 
> No need to linebreak.
> 
> > 
> > Signed-off-by: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
> > ---
> >  fs/ntfs3/ntfs.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
> > index 6bb3e595263b..0006481db7fa 100644
> > --- a/fs/ntfs3/ntfs.h
> > +++ b/fs/ntfs3/ntfs.h
> > @@ -21,7 +21,8 @@
> >  #define NTFS_NAME_LEN 255
> >  
> >  /* ntfs.sys used 500 maximum links on-disk struct allows up to 0xffff. */
> > -#define NTFS_LINK_MAX 0x400
> > +/* xfstest 041 creates 3003 hardlinks. */
> 
> It think comment is unnecessary here. If you think this is necassarry
> comment then please but it same comment block as last row.
> 
> > +#define NTFS_LINK_MAX 4000
> 
> What draw backs there is if this is 4000? We really do not care about
> xfstests if we have some reason to not do this. This info can be but
> to commit message.
> 
> >  //#define NTFS_LINK_MAX 0xffff
> 
> We can probably same time get rid of this.
> 
> >  
> >  /*
> > -- 
> > 2.28.0
> > 
> 
