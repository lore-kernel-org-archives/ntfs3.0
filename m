Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B902CA4
	for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 20:56:51 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y26so1430621lfa.11
        for <ntfs3@lists.linux.dev>; Tue, 26 Oct 2021 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5vNuOH/CeroE2MNaBllmauca92JlyZ4cKbTOa5BFjlE=;
        b=QXdynWi0ZAKLa4BURuvz9WuUoQpEJaVgrHq0tOP6veBilak04BxMnno5e1d6boYXJ6
         314Y2GCEftxu31hBny8yZnEYMRtb/vWoGL8q85/ZJeJiNOX50aQEPlvRw+9BsjTGmfMf
         JB01BIPA2kJAUyu6j7BlLaPe3YoQicqux15WxPjUq37OsYBU6O4DDkSZjiraDesFh4nv
         AD6pppHEOk+xHgjhkiUYyM4oZ6FeX8uwu7DWp5tQGxU8UJub8KNJbm7HReyyF/lVeN+q
         o7He0SYT+oAmcDOAIeBA9+CcOEcMjioCwjxmFMTTI6Fo5qmNMMvOqRGomguWICA1pc4B
         d9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5vNuOH/CeroE2MNaBllmauca92JlyZ4cKbTOa5BFjlE=;
        b=yGZpFMqVS3yjB0yNoI/QMON9tDj7/uTpM6W747X1eTDYbDg/P3qJ1E4v2etMBnY2na
         TOUa026dUvTK6lPxfohcFMOpNewoV3sBr5eqX8VbC67RL0Hgd3s+GpNqBYLXQhblZhEE
         dQjQAeqFs4scmUTcsbqpdoR78cM2PJvpC4EUZOicKvdkqNe3TGw7BaGIe5vqeARYq+Uk
         gHME2qzSYIMaioUiNxuYvRBhJqv3/mrsccQLI9hlT0vmtRkGOqaXbJ3ZF3Nhw4JWdVQX
         b9d4RCVgCV1R/A4ZZRnZRiNulYWlrFn18WTSNGEk1WdxB4DIkPakSzdMkIB+ZVFBD0NT
         wQjQ==
X-Gm-Message-State: AOAM533KuIzDxItrTYgsBO8JcPez9ODMcnxSwXpYAq/xfZoHOigrYP1d
	qLvULqD/8Mjf2yVwS8+aPpYc/CFyq7k=
X-Google-Smtp-Source: ABdhPJzCu9do5XBGlYyQ+LzQKFCzr12l+z0TEsOefHWPsRt2gfLeRhy/YPEEuIxOY9qFKNsNmwhYrA==
X-Received: by 2002:a05:6512:150c:: with SMTP id bq12mr25068899lfb.628.1635281809706;
        Tue, 26 Oct 2021 13:56:49 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id c24sm922821lfv.226.2021.10.26.13.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:56:49 -0700 (PDT)
Date: Tue, 26 Oct 2021 23:56:47 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: clarify emitted log message when marking
 volumes as dirty
Message-ID: <20211026205647.ahcedbggqf4ydyxh@kari-VirtualBox>
References: <20211026204922.126100-1-mrkiko.rs@gmail.com>
 <20211026205346.25g4snt7o3purff2@kari-VirtualBox>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026205346.25g4snt7o3purff2@kari-VirtualBox>

On Tue, Oct 26, 2021 at 11:53:46PM +0300, Kari Argillander wrote:
> On Tue, Oct 26, 2021 at 10:49:22PM +0200, Enrico Mioso wrote:
> > We are actually marking the volume as dirty. Reflect this in the message.
> 
> Again this should look like below. Maybe send patch series which contains
> both of your patches. Mark it as v2.

And please also cc linux-kernel@vger.kernel.org

And to: should be also 
Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

> 
> We are actually marking the volume as dirty. Reflect this in the
> message.
> 
> I have not strong opinion about this change so I let Konstantin decide.
> 
> > Signed-off-by: Enrico Mioso <mrkiko.rs@gmail.com>
> > ---
> >  fs/ntfs3/fsntfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
> > index abe74dc9ce31..08802d7ca078 100644
> > --- a/fs/ntfs3/fsntfs.c
> > +++ b/fs/ntfs3/fsntfs.c
> > @@ -933,7 +933,7 @@ int ntfs_set_state(struct ntfs_sb_info *sbi, enum NTFS_DIRTY_FLAGS dirty)
> >  
> >  	switch (dirty) {
> >  	case NTFS_DIRTY_ERROR:
> > -		ntfs_notice(sbi->sb, "Mark volume as dirty due to NTFS errors");
> > +		ntfs_notice(sbi->sb, "Marking volume as dirty due to NTFS errors");
> >  		sbi->volume.real_dirty = true;
> >  		fallthrough;
> >  	case NTFS_DIRTY_DIRTY:
> > -- 
> > 2.33.1
> > 
> > 
> 
