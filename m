Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766A3FC2
	for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 23:26:48 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id k5so27639131lfu.4
        for <ntfs3@lists.linux.dev>; Sun, 29 Aug 2021 16:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GU9nsMFQJFE6OFRxd34e/iYKywm5M9delJ3nFAw+Cp8=;
        b=VwbXEatuGgc+B6rsiA8CmaK92X9mjT9uO56EUU47xH0/F3mY2lmPxohsofjBPlVSgl
         vE1dGGL4adB8gWGXMS0bb4b+oVvT7UpK5JXaq+ZDWjIDOU31mY7EwByyX233QN/2ea0d
         IGRGolewegq3LJmnG3fHGnBSPoZrO8jSZjEaMLFqR/+M3g3+8jwQBBQuclJhT4BkoI0/
         Q8HWzorTmuWnPqeOTZPLiva9tvjhwFztn3FJBI7VfyXLh1NOduX4bzbznUjug7uIQWEI
         umVzo0sPP/2Gb+F/igz9YFR7U2xp0CbzUPSkfxRJhU4Xr/vseCIXeX2EQlvNAsyDPsQo
         sLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GU9nsMFQJFE6OFRxd34e/iYKywm5M9delJ3nFAw+Cp8=;
        b=gG5DisgT2AJpxwOxnTP2pvSOqqvo3Pb4a1kMWf3gSHMqDvC49wsXgJOMehubHvM2Q6
         OarKbJw02y4pXbXnq9htGTYbxp9FU2898K4xm5B7dFZaEUQQ3YoFzLAoRgNf+nj37I1X
         1CECSHXPadnuVZ2flZ98lFE4rP6UQ86ptJl9oMbHLwI9ofH2W8VUcIvwNsk343Ai+KLz
         BLnFDtDmxDlr7SQkf4C4VirPujCTsm6SDy7yNd+2Z6ej0ehvwT0sNqq+BttBaeUP96Yu
         TVdRgehf/Ry97RUEGmfX4Y4nN766SRv10q27quhqBjdDLqtOVWwjXCNcpPTcow2Q3LVh
         BgNA==
X-Gm-Message-State: AOAM532qXUzMa5wOREAG9WwppBNyG0c68fGEEXTZ5tZ1MzRVKLh+WUzE
	kn4noi6sWfXXmhmdW3dB/ty6oqfWpWQk9g==
X-Google-Smtp-Source: ABdhPJwFe7So9XHs5gU7un+ZSrWiq/5MRx6l5zEmte47KAPS0ObFghEOtxN60bKvpeqdpTbM2gpeUg==
X-Received: by 2002:a05:6512:3e04:: with SMTP id i4mr12259775lfv.163.1630279607033;
        Sun, 29 Aug 2021 16:26:47 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id z3sm220684lfd.38.2021.08.29.16.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 16:26:46 -0700 (PDT)
Date: Mon, 30 Aug 2021 02:26:44 +0300
From: Kari Argillander <kari.argillander@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Ntfs3 git repo in github should not back merge
Message-ID: <20210829232644.s2w3ggkyl2usmo55@kari-VirtualBox>
References: <20210825192746.ryi2vzn5gz4myxri@kari-VirtualBox>
 <20210830082308.649f2026@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830082308.649f2026@canb.auug.org.au>

On Mon, Aug 30, 2021 at 08:23:08AM +1000, Stephen Rothwell wrote:
> Hi Konstantin,
> 
> On Wed, 25 Aug 2021 22:27:46 +0300 Kari Argillander <kari.argillander@gmail.com> wrote:
> >
> > I notice that you have made back-merge in ntfs3 git repo in github.
> > This should not be done without good reason and there is none in this
> > case. If there is reason you should also write good merge commit for it.
> 
> This is correct, but in this case with an initial submission, Linus is
> likely to be a bit easier on you.  Just explain that you realise that
> you probably should not have done the back merge.  Also, if you are
> going to merge another branch you should not use the github web
> interface to do it.  It does not allow you to produce a useful commit
> message for the merge commit.  Linus has expressed this recently about
> another tree that is maintained on github (unfortunately in a private
> message, so it is not archived anywhere).
> 
> > Here is link which you can read about back-merges. If you have any
> > questions you can always ask.
> > 
> > 01.org/linuxgraphics/gfx-docs/drm/maintainer/rebasing-and-merging.html#merging-from-sibling-or-upstream-trees
> 
> Also available in the kernel tree at Documentation/maintainer/...
> 
> > You could also go check some other trees how they do it. Usually there
> > is next/master/main/for-next which will be repo which will contain stuff
> > for next-merge window. This is usually based on rc1, rc2, rc3 depending
> > when you put first patches to next merge window. As you based your
> > branch top of the rc5.
> 
> Again with an initial submission this should not be a problem.  And, in
> any case, varies among maintainer quite a bit.  But -rc1/2 is usually a
> good place to start your next round of development.
> 
> > Because your master branch is  for next you could have rebased your
> > branch top of the rc7 if you want to but that is kinda pointless. You
> > could always fix little mistakes in next branch with rebase, but you
> > should propably info this action to ntfs3 mailing list.
> 
> Do *not* rebase a published branch except in exceptional circumstances.
> All branches included in linux-next should be considered published.

I have a guestion also then. Right now situation is that there is
examaple missing Reviewed-by tags from commits. What should we do about
thouse? Or what to do if someone forget signed-off?

You also said earlier that rebasing is ok in this message:
https://lore.kernel.org/ntfs3/20210816063225.22d992ff@canb.auug.org.au/

I understand that rebasing should be avoided at almoust all cost, but
what are the screw ups that has to be fixed with it?

Thank you for answering and clarifying things.

> 
> > The idea is that this repo has very clean history always when it get
> > merged to Linus tree. Also developers who work with ntfs3 can see
> > everything in one eye.
> > 
> > Example take a look Ext4 dev (for-next) branch
> > https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git/log/?h=dev
> > You see that this is based on rc2. Theodore will create pull-request
> > based on this when he creates pull-request. Very clean history and no
> > back-merges.
> 
> Also no rebasing (that I can remember).
> 
> -- 
> Cheers,
> Stephen Rothwell


