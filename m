Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DB868
	for <ntfs3@lists.linux.dev>; Fri, 26 Nov 2021 11:36:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id d11so18115477ljg.8
        for <ntfs3@lists.linux.dev>; Fri, 26 Nov 2021 03:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YwchqcLp4vuWkP53NqIQryr+Cx6rF4LvbCWU6gG8vgs=;
        b=Wx4C6KctFZg7aqSyKW+5+/sbQhhBjaUfjiH74wowUy/K6HSWCuCDM7VOY9VqbnmvKA
         UM4eGn95CuRCRfYKXzdLqbHNiNvlWX+kM3hoLmDwsJlpoE5OWoOdY5rApuDlp5HbetZy
         +25hea9st2iqjThXTwqUrO7lXT9SyYVYMPfHBecz7hSsskk04t/+RlaY5R1Xk3kRnWiM
         d00+D8VKXzttb3URv6kH2eAKfN1oHCdv2L8DxGQJfWlOohi9IEGWfVOUxl/oJWv9FaZM
         /uoMbZQBu3QNp0le87EDcovGewCvWN44pvCby93xViSPs2a4SgY30hSjneBeBMCWemFz
         jLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YwchqcLp4vuWkP53NqIQryr+Cx6rF4LvbCWU6gG8vgs=;
        b=yuA5dSkLqB2L8I/btTCMtYtUqcTqhqKjzvsBR5ZRDXvH6LdERXpu5YTEmbN5rSIp3q
         tbQmXJ2mrDPq97aoYDvlip2ihMFrcNoGwWIvok3VbGbvzIA2nmJCyoJBDaQwD7aiEPQi
         Gu2BKkuPhWNfdqkJPCYFPJkkf0mO6PqSpUMsJM085fUB5rjcL6O9vgNANUDS0o8YqJ3k
         Dr5fTYpRXCUNzQlFJ0p893HqguaqfgifdXiwxywTtFu+pV++tdWlZeJpi/BRFQv5GX9O
         X/oyuh6KEkV0jqn7ZAWn81FLCWki4zFI2KV64KUt7dgsuTaAAQ5NP+rtdWw3D5gc92UV
         iR5w==
X-Gm-Message-State: AOAM5322p5I4WiQ4aGfinGigFMJIpqp9FgVclp0tw+BFndZSSZ9HUxEC
	6DFCfA0NR/Fb82Nmk1Dp8C0=
X-Google-Smtp-Source: ABdhPJytBhhNePIUfAl1MAlNnjKZMQsdxRpfRZWlULulpz+FR6PPbXkhKwOOp3vvUBd3DN2P3l00gA==
X-Received: by 2002:a2e:9450:: with SMTP id o16mr29615658ljh.444.1637926577785;
        Fri, 26 Nov 2021 03:36:17 -0800 (PST)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id f14sm552842lfv.180.2021.11.26.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 03:36:17 -0800 (PST)
Date: Fri, 26 Nov 2021 13:36:15 +0200
From: Kari Argillander <kari.argillander@gmail.com>
To: yangerkun <yangerkun@huawei.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <oliver.sang@intel.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
	kernel test robot <lkp@intel.com>, ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [ramfs] 0858d7da8a: canonical_address#:#[##]
Message-ID: <20211126113615.nmegssvcrmjlodku@kari-VirtualBox>
References: <20211125140816.GC3109@xsang-OptiPlex-9020>
 <CAHk-=widXZyzRiEzmYuG-bLVtNsptxt4TqAhy75Tbio-V_9oNQ@mail.gmail.com>
 <68587446-fb74-b411-ba19-dd52395567c9@huawei.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68587446-fb74-b411-ba19-dd52395567c9@huawei.com>

On Fri, Nov 26, 2021 at 09:54:56AM +0800, yangerkun wrote:
> Cc ntfs3:
> 
> Maybe it's a problem like this:
> 
> do_new_mount
>   fs_context_for_mount
>     alloc_fs_context
>       ntfs_init_fs_context
>         sbi = kzalloc(sizeof(struct ntfs_sb_info), GFP_NOFS);
>         fc->s_fs_info = sbi;
>   vfs_get_tree
>     ntfs_fs_get_tree
>       get_tree_bdev
>         blkdev_get_by_path  // return error and sbi->sb will be NULL
>   put_fs_context
>     ntfs_fs_free
>       put_ntfs
>         ntfs_update_mftmirr
>           struct super_block *sb = sbi->sb; // NULL
>           u32 blocksize = sb->s_blocksize; // BOOM
> 
> It's actually a ntfs3 bug which may be introduced by:
> 
> 610f8f5a7baf fs/ntfs3: Use new api for mounting

Yeap. Thank you very much. Will send patch for this in within 24h.

> On 2021/11/26 2:03, Linus Torvalds wrote:
> > On Thu, Nov 25, 2021 at 6:08 AM kernel test robot <oliver.sang@intel.com> wrote:
> > > FYI, we noticed the following commit (built with clang-14):
> > > 
> > > commit: 0858d7da8a09e440fb192a0239d20249a2d16af8 ("ramfs: fix mount source show for ramfs")
> > 
> > Funky. That commit seems to have nothing to do with the oops:
> > 
> > > [  806.257788][  T204] /dev/root: Can't open blockdev
> > > [  806.259101][  T204] general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] SMP KASAN
> > > [  806.263082][  T204] KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
> > 
> > Not a very helpful error message,a nd the KASAN comment makes little sense, but
> > 
> > > [ 806.267540][ T204] RIP: 0010:ntfs_update_mftmirr (kbuild/src/consumer/fs/ntfs3/fsntfs.c:834)
> > 
> > That's
> > 
> >          u32 blocksize = sb->s_blocksize;
> > 
> > and presumably with KASAN you end up getting hat odd 0xdffffc0000000003 thing.
> > 
> > Anyway, looks like sb is NULL, and the code is
> > 
> >    int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
> >    {
> >          int err;
> >          struct super_block *sb = sbi->sb;
> >          u32 blocksize = sb->s_blocksize;
> >          sector_t block1, block2;
> > 
> > although I have no idea how sbi->sb could be NULL.
> > 
> > Konstantin? See
> > 
> >      https://lore.kernel.org/lkml/20211125140816.GC3109@xsang-OptiPlex-9020/
> > 
> > for the full thing.
> > 
> >               Linus
> > .
> > 
