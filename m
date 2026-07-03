Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DD818DB2A
	for <ntfs3@lists.linux.dev>; Fri,  3 Jul 2026 00:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037837; cv=pass; b=JQO1f2hrOhufuFZda5Uvvpy88J5waWtCY6mS+PEPAaSdVryYwheolgda6zdIRdsmDBASmpdZuQdvVitTg0HcAzNpYXBK7+Frdcxrubvniz1JLq56sQ8HMw92GbExzELfpfY+uiW+bnbkVxd7VPk28WbazYwNaxwJcE4qvHJ8c/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037837; c=relaxed/simple;
	bh=kRH5ME6cl2uOZNTf4Hz7cjp4HebVSYInnLBFWd3k8/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJpzDru+K6V2Ty2UduxCS4icX/94CQE7PSfQPcuqlaMd4QPCF796LNLYrBcLA8ekovTJJ4pmK4myqhKMUns9dLu2rcC5uqBxvzQqDz0l/R1E85uWe8g6g92DXXa1fWZ00160DB8H6EMZi2LCjvYFx/mL1ChJZNEB9UIZ2dGCAlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBchV30U; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBchV30U"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso12080295e9.1
        for <ntfs3@lists.linux.dev>; Thu, 02 Jul 2026 17:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783037834; cv=none;
        d=google.com; s=arc-20260327;
        b=j4dk6pgymvOH04BiRpaXi0mx4zajyQZzB5tH2RKkOZBMyY+4YIRemWj1oyiZ3bR8zC
         rfOGhxcB9ljsky2fQG9q5inMOY50BelSUzUluMJhSUlBIosG4CwCVLoUGl9YhhSfoFY6
         wsRQidIwjXaRVXBIv+XR5Sfjk43BbiJSnLGLpVX7mlGJbu+1ZYM1TsIM2Um3WE7cPXUX
         8Zo4OKskY3fb24XQldPvKcFIkYHXmWovVDzVLhKMH2SdmQxsryoy3Azr61g2mSYpXytX
         VXjfXEtUskWv0of3T6ok9i45B8NILBZNSRWvahInhBfjtLtEUJ1XwimzgCOhvWt7zrlg
         dnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
        fh=p2Gq7jJ8KU2sG13iubLBI6qz0VeFK60Bj2FR7wM1FeY=;
        b=JzNi2hj4SOCzM98QTHinUY2cFcJGrKy6KHGdP+mCldoSYgptODGT/os998sD1ieRza
         2nM8JDp0oFQHznkEK9H6pRB9941sDCGk8MheGHUuIaN9qPFg0Dq4c3O0LmxdiT5ppUvj
         qfuwkPFGl37DVe9BxGnd2fNnz09q9EwAYZBtikyigKWWYjp5ahGmjNHKB7O+rUAOKM3Y
         Vi0y9iJMMZlh2vJIV5D/XkUnzECcL3pqClOmOuPeMla+cQeVYZG2AiCfRTE0J0/rk16J
         PuBgcIdBdDHFkoMD9RkBIdD19byxNZ9Rv5sP78trNnCkECUlD8OXGR3T+EeYJ7Hq8u69
         Da1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037834; x=1783642634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
        b=tBchV30Uub+P+NkFmtsnfZbLWBXKPtWYqaNFPV3tgiaS3MhvG8cHqkQriOkVS49D8J
         nf4V+ROheyi4afaZ+JaYHs15DqV6tnOKQ25Y/BAk2QIlT6jdiYb1M/B6x2Bva41FJDHp
         U/fy8ES7ElanDgMDDrFEAzXooxqppSUydwMMJrrJAQboJ7UulsH1HhKomSr1Elqd0elF
         y0mweFEjdU6A3z4CwySUiddgdFuwktOLfjNcIszkjBQG6ieTMErMAns+2CA6Woc0YKud
         QAiWb7sFYf5QNNKMRuehB1RmIKNpl/AwjrQvGhuSpX5jcNrmkLy7hxUQ5KuIvVKOlqRs
         ooPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037834; x=1783642634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vU7OEUrLlyve1bXZ6P0sGV5EAt2DQDqFHvcpp7wTUdg=;
        b=SveHA0Z20Bviuu0WFa219l5hHdznBFa7Eh5t/x1AwZEReW2KylRuQJTA0vlfaTPe7H
         S1VG6LHeo8f4nmo1foMmuQtS7tTCqeyDqxWK8OLOsyFCmrreRJAGudp1sw2W00/sZ9uz
         hUVu01Iu1lHoCc1R2VSOEMAUGA0b3iZVuy9GjZERDOwg7LOxJ9q0PYP/tg/vJU75QlGS
         bh0o8ocJ2BsqF6gQUStqBv2hMva3BsqUV0pkABL94WrYdUcqzaKShatBLjmpWPSGuzHK
         mZ4lN9iw2s5rSGf2ZBPVs3X3YtECjZopKWCZPWug7CgwirYd4I72QSWYisoNxipi4vdn
         OBzA==
X-Forwarded-Encrypted: i=1; AFNElJ9cfxmKpS8aJkkYq6fu4eY3RENtiLSvuqeWcoLUi+x3ulMP8mlsDB0oMH6HVs+UKS/1CpTlKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTSfFSa0Lnnes9HAnlB+I5Wf3R5uE3P92IbGSB3AuyNnjthPXf
	0CO4la3qSls+1+sk2ETh/TAyvQhaxvK9PBClvHL0UWGbnNZKBPJUzqaWa44gLKhM2jfI9wquJdU
	BB5ehiPeHrOPjlS6mMYZKi0w7OjqnjJQ=
X-Gm-Gg: AfdE7cnyPUErPkDkeclVJ+1TBafvLdwFcR8pHHy6CuVG/W7Fdmu/myj5IRkHORjflYn
	E0EpMJG9sTxnUgl2ZYkHw18qyyIe3+tnkmnx02wNzPQphDDoC5VFZ120FNQxncX2YGzdbCT8vsk
	5p/5Ds6YiSHcoJkHkEbQidmELd0RiNcsQtAWWny6Xe59iA+6qfsxJqJnwfzHCUhjHsNjQ1wk3DR
	grlwbFBw3UJk9IhWuLxozW4i+g0df5dU3lT2AkcWLqzOGqJPJOxuZyp/ZJ/9ceNpi2iw2on90pP
	kd7CkBwl0iz6inAUeBC1MkT+b3ZJOX+IrqJ7KgwUVhkqlOxki7Jzn9qvR1frowQ=
X-Received: by 2002:a05:600c:46d0:b0:493:bc4a:c6b6 with SMTP id
 5b1f17b1804b1-493c2ba1d3emr113298325e9.38.1783037834179; Thu, 02 Jul 2026
 17:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com> <20260702165841.GM9392@frogsfrogsfrogs>
In-Reply-To: <20260702165841.GM9392@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 2 Jul 2026 17:17:02 -0700
X-Gm-Features: AVVi8CcxJan3XgaMiYmE7l9m1K7rjamtB3vH8NBAZsWn7x4K1BrIcNnVAJIzZPo
Message-ID: <CAJnrk1YW0gKRVvHRC+WeKoV2vrquzaC6UkipZkQ34Z0RAQDjtg@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] iomap: pass iomap_next_fn directly instead of
 struct iomap_ops
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: brauner@kernel.org, hch@lst.de, willy@infradead.org, 
	hsiangkao@linux.alibaba.com, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>, 
	David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Dan Williams <djbw@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>, 
	Chunhai Guo <guochunhai@vivo.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Andreas Gruenbacher <agruenba@redhat.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
	Hyunchul Lee <hyc.lee@gmail.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Carlos Maiolino <cem@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, 
	Johannes Thumshirn <jth@kernel.org>, "open list:BLOCK LAYER" <linux-block@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>, 
	"open list:FILESYSTEM DIRECT ACCESS (DAX)" <nvdimm@lists.linux.dev>, 
	"open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>, 
	"open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>, 
	"open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>, 
	"open list:FUSE FILESYSTEM [CORE]" <fuse-devel@lists.linux.dev>, 
	"open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>, "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 9:58=E2=80=AFAM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 3f0932e46fd6..0aa8abc438c1 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -626,7 +626,7 @@ static int iomap_read_folio_iter(struct iomap_iter =
*iter,
> >       return 0;
> >  }
> >
> > -void iomap_read_folio(const struct iomap_ops *ops,
> > +void iomap_read_folio(iomap_next_fn iomap_next,
>
> If you took my earlier suggestion to rename the typedef to
> iomap_iter_fn, then this parameter ought to be named iter_fn.

Hmm... maybe at that point, it's self-explanatory enough that the arg
could just be called "iter" instead of "iter_fn"?

>
> >               struct iomap_read_folio_ctx *ctx, void *private)
> >  {
> >       struct folio *folio =3D ctx->cur_folio;
> > @@ -650,7 +650,7 @@ void iomap_read_folio(const struct iomap_ops *ops,
> >               fsverity_readahead(ctx->vi, folio->index,
> >                                  folio_nr_pages(folio));
> >
> > -     while ((ret =3D iomap_iter(&iter, ops)) > 0) {
> > +     while ((ret =3D iomap_iter(&iter, iomap_next)) > 0) {
> >               iter.status =3D iomap_read_folio_iter(&iter, ctx,
> >                               &bytes_submitted);
> >               iomap_read_submit(&iter, ctx);
> > @@ -688,22 +688,22 @@ static int iomap_readahead_iter(struct iomap_iter=
 *iter,
> >
> >  /**
> >   * iomap_readahead - Attempt to read pages from a file.
> > - * @ops: The operations vector for the filesystem.
> > + * @iomap_next: The iomap_next callback for the filesystem.
>
> "The iomap iteration function for the filesystem" ?
>
> Using the term "iomap_next" in the definition for iomap_next isn't that
> helpful.

Agreed, I'll replace this with your suggestion.

>
> >       return ret;
> > @@ -824,16 +824,16 @@ xfs_file_dio_write_atomic(
> >       unsigned int            iolock =3D XFS_IOLOCK_SHARED;
> >       ssize_t                 ret, ocount =3D iov_iter_count(from);
> >       unsigned int            dio_flags =3D 0;
> > -     const struct iomap_ops  *dops;
> > +     iomap_next_fn           dops;
> >
> >       /*
> >        * HW offload should be faster, so try that first if it is alread=
y
> >        * known that the write length is not too large.
> >        */
> >       if (ocount > xfs_inode_buftarg(ip)->bt_awu_max)
> > -             dops =3D &xfs_atomic_write_cow_iomap_ops;
> > +             dops =3D xfs_atomic_write_cow_iomap_next;
> >       else
> > -             dops =3D &xfs_direct_write_iomap_ops;
> > +             dops =3D xfs_direct_write_iomap_next;
>
> Probably ought to be called iter_fn, or at least something that isn't
> "dops".

Nice spotting, I'll rename this in the next version.

Thanks,
Joanne
