Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C46830DD3A
	for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506465; cv=none; b=DDy56ND64ZvIKnG4fiRexwrAkRKVLMub3QC+E6ecZT1ix5XV6Aoac1Ml7lJEWBkPPSuYxCaSy+GxVUspmnOL5jDxwUyQAZNRIwRXFNg0QJKFjPn8q2tZPKd7mgzumZeLWSMSON+0TKdhD2Q7IHcgcizriotml0G5diBHzuYuf2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506465; c=relaxed/simple;
	bh=1fbOaze7IPYZl8+Bgvhkjjlp1Q2kYcGwrr+7KvvQzAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLCLFUEiKJIsVx39J1pa/L8yMTEwp/dr4U1h/t8VPdxCd8XuL2w2d9BxFD+53XB0mBXM0n3owsg+6GClHLBP8FZ6aHdHbimbqn0jwT7sxelYietuMEFYcS5e8JeypPsPp53FaMpp+d4PWyChHl3MRVbbGxqXzdTL2l3QPOIkjTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgZGi0pT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgZGi0pT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so2051713a12.2
        for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 11:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768506459; x=1769111259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/OO8RKyY0YoEvp6ZTLVXNCVFpOv1g0hFAjXGWT4AHc=;
        b=TgZGi0pThfuS8zElBGw+Ghzr0SfnniVvHqaSIC9kiySg/i9Cn5FrxKs3m58RSQ1CAn
         lg1LaXiKlb9cqNIjIoRCCiia5wBRa6IXh2lQuiecvcLaiNbtJZC+hRsg1j89hUHBpQjR
         NPG0zd4wfhlHjeYjABohb9a31OyVn2aNJAZDoMAef79w1U94S3fHgdH54gC1kC5GbzGb
         bCM44ltTX2fwbFexXLVbtaFbM4eCZG7VCSUsNi83/1ovgvvpgChFi6VIerCfiZNXKakt
         SPMaZWH8TQDscGFQCZzK5DD0SyD6k3OxfuoUljOgU1nt4Bc1XqvHIo/01xWxEqMmFvbj
         4uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768506459; x=1769111259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/OO8RKyY0YoEvp6ZTLVXNCVFpOv1g0hFAjXGWT4AHc=;
        b=vgkV/P9OIWV6gRNzAwrOZd6ABf6p85IhVQ32tD64yGtjht5Ggc38QhZxdmxkCflP6z
         3Jum9QzRNJEHFVoSBEKUkD2zwJpBIH9lTZJVZLEioTt63FUO6UaA4GYurbWuGid0splF
         Rb/V4CH2wDuSI0YF2B7gSDL7WA2cvE1v9WPRSK9va93lq4vNWmsNhXR756qRJ5ng5u8x
         zaizmKa8D5oE/++wynFia0tuHtsZJ6yz1dPUAUrdwBvPEAcXTwxATCbbTU5NrJygRCTe
         oIuXtnaD/m4jn62wJfPvxiPH+DGgdFP69EYvLv4i/H9OeGrsvcaUjQKSmTjC6tpB7NSy
         wZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVCeIeU8OGCi6IPvIwdrFD1dTz9OnAY14E4tiu9rLL+kBS3qVr6jURx5XpNrf88Ec0jUzpvvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdi60pKEURvV9+cxRwU0uShrUeaJ1QYpItdSX0toFN0zAZYH8t
	s9fSn5yKUojJ0A9xqQhP4c3f7hhmsP0gLEsnAbaqxphEfGLt/DDsPP4BrArU8b+cqc1e3CgoFs2
	ymfDizUmvJ1ar1sheQIfa9pE6w2CH+9g=
X-Gm-Gg: AY/fxX5h1q4+WfZ+gq5S5yTsgVcba6+ZBPDOMmaTvu9cHTdhVLVJ0rw8ACOC5T+89B4
	aCXApHET8Whh099DBdAymyO2fdkKKQfk4sqtJDRIhhuYo8UPvxmzaHcSnA+ZRB0S9090CDgc/zI
	bfayGrikSP3yOzXdH2T/HQEp/t9QhRJf5za5BW8fcYkFx/5teCgEQJBIlEWdgSL5i0dye9iOONG
	1JJbFy2jf/yOHHm/8fDV6iDUDttAU2lOTO6EG9FiK09hmvvk2wPRRCvQ26jB15S9F9L2VHmb0C5
	K6+zcObDZTRjTxzAnQHLaOBfXdOaSQ==
X-Received: by 2002:a05:6402:268e:b0:64b:7231:da3d with SMTP id
 4fb4d7f45d1cf-654b955cf01mr167575a12.9.1768506459177; Thu, 15 Jan 2026
 11:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com> <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
In-Reply-To: <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 20:47:27 +0100
X-Gm-Features: AZwV_QhMfL4hQaeUnA-dk4TL1Qjc8lTmxpbV_QcnWyLhkyyZFquuhwL6kPGc4Cw
Message-ID: <CAOQ4uxhtorpd6FVsaGO=NdRD72MxeDyabip84ctQYSNufobS8w@mail.gmail.com>
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

On Thu, Jan 15, 2026 at 8:37=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
> On 1/15/26 2:14 PM, Amir Goldstein wrote:
> > On Thu, Jan 15, 2026 at 7:32=E2=80=AFPM Chuck Lever <cel@kernel.org> wr=
ote:
> >>
> >>
> >>
> >> On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote:
> >>> On Thu, Jan 15, 2026 at 6:48=E2=80=AFPM Jeff Layton <jlayton@kernel.o=
rg> wrote:
> >>>>
> >>>> In recent years, a number of filesystems that can't present stable
> >>>> filehandles have grown struct export_operations. They've mostly done
> >>>> this for local use-cases (enabling open_by_handle_at() and the like)=
.
> >>>> Unfortunately, having export_operations is generally sufficient to m=
ake
> >>>> a filesystem be considered exportable via nfsd, but that requires th=
at
> >>>> the server present stable filehandles.
> >>>
> >>> Where does the term "stable file handles" come from? and what does it=
 mean?
> >>> Why not "persistent handles", which is described in NFS and SMB specs=
?
> >>>
> >>> Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
> >>> by both Christoph and Christian:
> >>>
> >>> https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-1201=
8e93c00c@brauner/
> >>>
> >>> Am I missing anything?
> >>
> >> PERSISTENT generally implies that the file handle is saved on
> >> persistent storage. This is not true of tmpfs.
> >
> > That's one way of interpreting "persistent".
> > Another way is "continuing to exist or occur over a prolonged period."
> > which works well for tmpfs that is mounted for a long time.
>
> I think we can be a lot more precise about the guarantee: The file
> handle does not change for the life of the inode it represents. It
> has nothing to do with whether the file system is mounted.
>
>
> > But I am confused, because I went looking for where Jeff said that
> > you suggested stable file handles and this is what I found that you wro=
te:
> >
> > "tmpfs filehandles align quite well with the traditional definition
> >  of persistent filehandles. tmpfs filehandles live as long as tmpfs fil=
es do,
> >  and that is all that is required to be considered "persistent".
>
> I changed my mind about the name, and I let Jeff know that privately
> when he asked me to look at these patches this morning.
>
>
> >> The use of "stable" means that the file handle is stable for
> >> the life of the file. This /is/ true of tmpfs.
> >
> > I can live with STABLE_HANDLES I don't mind as much,
> > I understand what it means, but the definition above is invented,
> > whereas the term persistent handles is well known and well defined.
>
> Another reason not to adopt the same terminology as NFS is that
> someone might come along and implement NFSv4's VOLATILE file
> handles in Linux, and then say "OK, /now/ can we export cgroupfs?"
> And then Linux will be stuck with overloaded terminology and we'll
> still want to say "NO, NFS doesn't support cgroupfs".
>
> Just a random thought.

Good argument. I'm fine with stable as well :)

Thanks,
Amir.
