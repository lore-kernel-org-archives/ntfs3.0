Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85820311963
	for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768505518; cv=none; b=KyJ5ZzHHn2jf42K1tyakPUDlqYzk9tFYwLrIdF6eAO5MVjnEzolPYm7UTP2am2SVxYGzwdEekrzklpYmJt/gSENB0u1WskEdlSsBSyMOS+NQfOOMVYdOi4g4723waoiEZJPE9KYm5LNXZUyEKTgEzyVEDymQczpdbAoI15mUFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768505518; c=relaxed/simple;
	bh=tqmyKUNA9h+Z6aJY257mLy9/4rE73XX9k8TNa9s5T1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wz9CgdaS6QruZBil0iRe9GO9ACnUickuzbv0FjMbTsYGxw6zLOGK01PPk2dMut/8MzF0R2nhLXsK8DpCjxGp/BVXooAQS5mnYdxOETkpgZFg0Gxhlnr0eUVGiycT4VpxrpWgaHwzTwPuWVHZTd4lNe21kQJGyEFPnXJCKg4Srhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SA4gOpz1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SA4gOpz1"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so2029979a12.2
        for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 11:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768505512; x=1769110312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
        b=SA4gOpz1DRwIsL9MzIf6Y95xvwuUrZwsh0aayN6O39rKJuSBbzm5DTnsdQ3ghms8Y3
         sago70fRKbtjTl150pJk9Q2ADBz8r+x1FsJCQ4Ns+u571R96m+I74C5XBlQaCUL9Yp0v
         m8Gxm2OLJw5GKZ7sFdmHUy+kAs2Pl/zXiPZUhQONnb1K8Yfr9ThuS5q5HSoFcx9Uop8Z
         Xd61fB2qUjl/3LfgCAVqmuxfUcLdVZUqFS/IFe3Hs4//jlCjwO05o0oppOOwH4IcNShB
         9c1MHd3qPC9ebzb83XXOTVYeDsXl6OU1e3I/VuylQAUb97HkUUQQUPHK5iTqQKVJi/56
         MpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505512; x=1769110312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
        b=iPuuMXQxHlW63Bkogzc3zMAd4Ls9pAZ6uoosu7pKC4bTGDe3LCcWorKIoGzEyRI6a5
         TiIadseXNF9QzzUAvghNFeftOkIngiuc4p39RYXycs7/Vul8iDo945ko+goFwaLehaiz
         zoCTZsjdqVEdprBaA5moZA964sKxa5Kv2kITCxn8tF/NxLRNuqZe1zfHsKORtY77uQ5v
         aku+l3yxfh/tA5NPfJbtd+EH2XVt0ypH8hrXQSNurJXCmeMVmOuAhvvrG7h+51HTIanK
         R6IdFWj2x+Yii3ckW3+7d8EIvJ0hTAKeNHwqlm8fRGIl/cwexOKApjn0BMvq0I1ZBXxp
         ivMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvcZmrOEqhVtB0rKJbMcxXkz0DEvaKXBS++OEMhe1FJKeVzQ8lVk7SlDw2H9HvNdFQnciipQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbGuDd2FXvNrRzpzMGzhkuHTVDmrVbvsgBgLldCWyiOLBh10OW
	Z21AIyNKcB41rjN6OlBIyHkvZmAYHzo/vdlNnHDOYkCMEbLfNS194wue7igeczoiCAgc9/jHlms
	9g95IDqCV4VHnb4JAWV3+R82LHX7IBYw=
X-Gm-Gg: AY/fxX4dotz5rV31jkw5ZNWQ/BFZh+QQ5khLVXVWfeWSJMI1SFc9KMexVIJCoPZmQcQ
	WHcSXY0guJESMIPbz2DoDmN2j6KFKPrbvqyLp1xKRhI1cDvTBuqgDaKkdpoukRUxfbfGHgjeaGw
	VbpvyIUmaWtWW0xcK4+xNoLuxPyhIfROHEJb21Xt5hctY/nNZcPG7Imb9lvIVhYZReUpmCwPieW
	g27bNyKmzd7F3+09XQPozMo++8d2iw5jEFf3bviU0Sg8KVZIXZmI6GhrFtAsramse1Piol2e5xD
	t+1oFUux9Ynr8ejmXpstXzMFuGl6Cw==
X-Received: by 2002:a17:907:3c87:b0:b87:442:e9b6 with SMTP id
 a640c23a62f3a-b879690c54amr11543766b.17.1768505511676; Thu, 15 Jan 2026
 11:31:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com> <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:31:40 +0100
X-Gm-Features: AZwV_QhvHAFd_rX2K5lnQvHY5zGWrCY2L2ECA3-jgjFMNT8gFVUBrqM9bcPeRhY
Message-ID: <CAOQ4uxhnSPoqwws7XW4JU=jjgZJoFgCjcWwbfPaprDCZq=wnKQ@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Chuck Lever <cel@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Chuck Lever <chuck.lever@oracle.com>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Theodore Tso <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Carlos Maiolino <cem@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
	Andreas Gruenbacher <agruenba@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org, 
	devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 8:14=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Jan 15, 2026 at 7:32=E2=80=AFPM Chuck Lever <cel@kernel.org> wrot=
e:
> >
> >
> >
> > On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote:
> > > On Thu, Jan 15, 2026 at 6:48=E2=80=AFPM Jeff Layton <jlayton@kernel.o=
rg> wrote:
> > >>
> > >> In recent years, a number of filesystems that can't present stable
> > >> filehandles have grown struct export_operations. They've mostly done
> > >> this for local use-cases (enabling open_by_handle_at() and the like)=
.
> > >> Unfortunately, having export_operations is generally sufficient to m=
ake
> > >> a filesystem be considered exportable via nfsd, but that requires th=
at
> > >> the server present stable filehandles.
> > >
> > > Where does the term "stable file handles" come from? and what does it=
 mean?
> > > Why not "persistent handles", which is described in NFS and SMB specs=
?
> > >
> > > Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
> > > by both Christoph and Christian:
> > >
> > > https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-1201=
8e93c00c@brauner/
> > >
> > > Am I missing anything?
> >
> > PERSISTENT generally implies that the file handle is saved on
> > persistent storage. This is not true of tmpfs.
>
> That's one way of interpreting "persistent".
> Another way is "continuing to exist or occur over a prolonged period."
> which works well for tmpfs that is mounted for a long time.
>
> But I am confused, because I went looking for where Jeff said that
> you suggested stable file handles and this is what I found that you wrote=
:
>
> "tmpfs filehandles align quite well with the traditional definition
>  of persistent filehandles. tmpfs filehandles live as long as tmpfs files=
 do,
>  and that is all that is required to be considered "persistent".
>
> >
> > The use of "stable" means that the file handle is stable for
> > the life of the file. This /is/ true of tmpfs.
>
> I can live with STABLE_HANDLES I don't mind as much,
> I understand what it means, but the definition above is invented,
> whereas the term persistent handles is well known and well defined.
>

And also forgot to mention - STABLE HANDLES is very lexicographically
close to STALE HANDLES :-/

Thanks,
Amir.
