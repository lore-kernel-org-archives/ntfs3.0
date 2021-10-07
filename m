Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3082C88
	for <ntfs3@lists.linux.dev>; Thu,  7 Oct 2021 20:12:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id y26so30115805lfa.11
        for <ntfs3@lists.linux.dev>; Thu, 07 Oct 2021 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9yAQihKDOKXiZD3zsmAICRmtON9zofEbOkdwNEloMOQ=;
        b=hWppx8/HCFnAWD3J+ZEvzn+SAbHgIGEdbC4cUOz7qg1juyuDIzUJmJvRjxMxr6yG3r
         NWWIq0tN8sXKKFuhaTgrsb1f0s1eE4aZDBEYt+98Kovudk15kAOhfawgbYXCtfsnI5m0
         KurrOPYsrf+vFSis/tbF5D0Z7aOYhBAlGFSod+6IqAgqY+mL0L2FSS/HphBnTYSQSuuC
         BJdWo+EvGvD4p6JQDuUyi3D/WP5Wux3m6WmzssySLsJ7fLpZSWTMvpsR0sCPDeKquCtZ
         pSAuxr1WcC+CQt/jMbGIM2DbasqVqcglK0TqV50dlbKc/x2pmaVPub60sV7uwRTRZsHz
         zziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9yAQihKDOKXiZD3zsmAICRmtON9zofEbOkdwNEloMOQ=;
        b=yWfaTuHD/SSrA17VZ1MW3J1V4lq9v2aBDQoKTbEEmVSPuzIWOyD0dSUEtCpQAmEXza
         qbP4i/czwm6rq9HdfPrTFGOMFwiwed99Vb+B+XN5LLSeI5GPvKqx3fVzH81+bnLACaza
         1w4ifCeDnzrNENnLUm1qMYQl5zS4J0P+M2g3Dd9l7g57lItYzNbY0TE4UQvID9sl7VNo
         fN620AhmanDCKqAUqNpYoR59DqKv3oW0mwJyt/TFENVUdyicZ4Ihp6OFO8Oi3hnAB12K
         t4DkS4pigkMNSq+0ORg0NONr3F98Tb46l2NpQ1pwkuvSwM2prBDBzV811ocrh1hU3Kun
         XrLQ==
X-Gm-Message-State: AOAM530Rgke5fj8L/Bz9ZbLGIuazq79YM5Pkv3PodoPUvr5gfYBp18Ni
	hUyKyFEVUkbUc71pdGSc6NlhB5wzfAs=
X-Google-Smtp-Source: ABdhPJxdZZ/drCCbzxIBO1kYOHU787KfkI63dA3QXNqWv2AOm0w0rSdYtI4ON9q3DUy0y1uci8iiBQ==
X-Received: by 2002:ac2:5c0f:: with SMTP id r15mr6245358lfp.564.1633637553839;
        Thu, 07 Oct 2021 13:12:33 -0700 (PDT)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id r3sm29417lfc.169.2021.10.07.13.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 13:12:33 -0700 (PDT)
Date: Thu, 7 Oct 2021 23:12:31 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Subject: Re: [PATCH] fs/ntfs3: Fix logic in ntfs_cmp_names_cpu
Message-ID: <20211007201231.ald2tfljtuidcimz@kari-VirtualBox>
References: <20210928183300.12946-1-mark@harmstone.com>
 <20210928220718.fk2g7itrgmyxooql@kari-VirtualBox>
 <261705dd-64b2-32e0-e8d6-3be9fa202f0b@harmstone.com>
 <95b14c81-05e8-63ac-5f1e-7dc0c66cdcd5@harmstone.com>
 <7590c4b0-7e44-ebed-9029-38fb59880c7b@paragon-software.com>
 <057f9a4f-a836-a0f9-02a1-c77519163375@harmstone.com>
 <14130f55-f61f-fb39-c653-02b4dd39bc6b@paragon-software.com>
 <1068834b-5c16-84e4-2692-938dd4e91121@harmstone.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1068834b-5c16-84e4-2692-938dd4e91121@harmstone.com>

On Thu, Oct 07, 2021 at 07:26:26PM +0100, Mark Harmstone wrote:
> On 7/10/21 15:33, Konstantin Komarov wrote:
> 
> > This is optimized way of this algorithm ( from comment to ntfs_cmp_names ):
> >   * Straight way to compare names:
> >   * - Case insensitive
> >   * - If name equals and 'upcase' then
> >   * - Case sensitive
> 
> You have your first and third bullet points the wrong way round there. Am I
> right then that the current case-insensitivity stuff is purely to determine
> where the name goes in the $I30 B-tree?
> 
> > I think, that ntfs3 need to be case sensitive.
> > And listed things, that I think support my opinion.
> > That's why I've mentioned that ntfs.sys is case sensitive.
> > That's why I've mentioned FILE_FLAG_POSIX_SEMANTICS and
> > FileCaseSensitiveInformation.
> > I don't think, that copying win32 api behavior is good,
> > when Microsoft makes steps to make ntfs work in posix way.

I agree that Microsoft is making step towards POSIX.

> I'm surprised that what I wrote is controversial... NTFS is a case-insensitive
> filesystem, that allows specific directories to override this with a flag. You
> might wish it were otherwise, but the NTFS specification is defined by what
> Microsoft's driver does.

NTFS is case-sensitive filesystem which Windows treats with tricks like
case-insentive.

> Your driver lets me create a file called foo.txt and one called FOO.TXT in a
> normal directory, and when I double-click on one in Windows the wrong file gets
> opened. That's 100% a bug.

I disagree. NTFS point of view no bug at all. I agree that it maybe
Windows point view might be a bug. I agree that it might be good thing
to add mount option flag to control this behavier. Maybe nicest thing
would be that if we save other file which match case sensitive we just
raise flag for this folder and atleast never Windows will be able handle
those correctly. What do you think about this Konstantin?

> It's worth pointing out that the Linux vfat driver handles case-sensitivity on
> Microsoft's other filesystem correctly.
