Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F283BC4FE
	for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501331; cv=none; b=Lafo9YiAzzZYZ9GYd1nC6X1zMXSnnj1rYqVCI49nF/f7Fu8JL5peXBnEwakjnxe2j6XBMetCiJFvTh0CDjBQVZ9W5/nKXtTwZZ43wTxvODKsKfcshGdprBOt68AaRQS6fufhQ5Lm6bNtPFs2T1XN4hafuXVSOcZEn6iOrko542Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501331; c=relaxed/simple;
	bh=1cnJvM86J6ZtD0hbHWYgXyV/1EjumZkd5A95it/praY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAwy0fjbKfOLPXBQJQa+6TT0FthF6SeptWc6b1uN2VhfGZmc1/DFVO1voBdDw9AJuLoD8q/+xeafxHgD/7F6LK25NGbTYYqkTx6O+UIhN1c1UtZLGj2cWcIPXNSeEQznxtVRjv1SlsihZPwpmHXENWC93I/TgwyreU2qy8KF5ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fwr0ABG0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fwr0ABG0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-653781de668so1818669a12.2
        for <ntfs3@lists.linux.dev>; Thu, 15 Jan 2026 10:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768501328; x=1769106128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7IY8l2+i1WeuEXvkGd5lYKI5+uHV9G4YufUEOTseco=;
        b=Fwr0ABG0J0c/5EHv4up/Mxpy/xyL0JZUv/r8tuNW/2uWz//512dtr+LZH3vIh0IgU+
         erdLJXgzpXPMR2ovx5NmKcGDGFvJ60vXG00Med78BzhABAIitsrP2grF/MM8OH30pnnA
         ryLxCESWJKKx73gSMaZaTkQpXemX4W8PMT8hnFkcKCbS8Q6UkgGnFWc49h8tn2N68ywX
         BVYsyyrIhE2dEM8OxbvMlnAPPFIoER7hMox7tnVNPSEkJSHFsFbtg7O8sC08cIB2AOGL
         BciXeTBYvZyK5i9g8OhFIVYlV2JsS/sfHHO8MLOcvWS2Mxy+McHrs9Ju/j9SezyVJray
         0yxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768501328; x=1769106128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7IY8l2+i1WeuEXvkGd5lYKI5+uHV9G4YufUEOTseco=;
        b=ggUKGCD2OseHP3IIg2BFIUaoF+FCeKSU4gEu/RDQuMwAQDaiWyJucLPu6kYsuwVxcf
         W455o9lbdwcftqd1CEgqdUkgYlE+D2w55AlNXZgWCgKSoVQ076M7KtYaxy9sTxot9kzp
         cJSj53WPklyhnNCFIL32tNZMG0VVnPowpZ/61pCpRB9qCzwg5rFC1V5zV7H1HKbXBR2i
         rEea0wd60bhJ3TioPGz2ynCTz8Lxc5xHDviBqemx4O05tvdISJ4FN72zHTrJhKUlTt9E
         TKiY6zywqhHuLyMnRfWEz42oY1BYUOr+9dnGZcw7LvxvZ3dcX5y/5NDSubvU9M0cVjRZ
         2fJg==
X-Forwarded-Encrypted: i=1; AJvYcCWLysb1BhrzwPaTD72xHTEu9wwm16I7xOyhXjtPPm2dE+poSPwMB03aXzFbCGaRMi8fB7oxxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ38GU9i2ThQwpu4Slkf9Veth9gl58jlv9reNtUZnH6Ct05TQC
	lEVB9Uh/nipLijgnaL3kjBqddXKlXfE53RPJpA0/8x11dr4igjAZ8E+6QRqC1cq2wWR3PdgNt3N
	H26Wcnf8sDeE0Noj9IEn9NABWEYHtmd4=
X-Gm-Gg: AY/fxX7b2ozx8ll+lW4lh/SuVURRRYOCOtiSMSUIOroOK4WBaD3akCD91AcE+UczuZW
	yo3dz2YRCEmTgbOYSHKBSf+BbOD3xOdM7Z8FOSdyLun1iKPVZN0mAVbzHMShdBC+L79ECh5r7A5
	toY4Uyy7VQ37Tne/nOXyqHhMRcmMYEg2s0yCTXiGonN//aulIe/Mbgg6nDUbrPzsTyl0lVXtsaI
	Wp3VIcGdquUTmFg24COuK2ZlmVxHQ6qJGkb0hUSarXybItPXR3RMfpRXsEkcON5xyN4kJreAYoI
	ROyUxqn+MOgm3MKyxvkt73b3qZBztQ==
X-Received: by 2002:a05:6402:2812:b0:64b:3f56:55c9 with SMTP id
 4fb4d7f45d1cf-65452cca336mr319308a12.26.1768501327990; Thu, 15 Jan 2026
 10:22:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-16-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-16-8e80160e3c0c@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 Jan 2026 19:21:56 +0100
X-Gm-Features: AZwV_Qjyapjv6JnFBHXmI5sSMthIqKsr1O8J34VK_oMMrDctP8UVkm6G-xvI8HQ
Message-ID: <CAOQ4uxhnxipJcjznEoa_D2R91NDZRgT_TTouGA4PGJO-7R9spw@mail.gmail.com>
Subject: Re: [PATCH 16/29] ovl: add EXPORT_OP_STABLE_HANDLES flag to export operations
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
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

On Thu, Jan 15, 2026 at 6:49=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> Add the EXPORT_OP_STABLE_HANDLES flag to overlayfs export operations to i=
ndicate
> that this filesystem can be exported via NFS.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/overlayfs/export.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> index 83f80fdb156749e65a4ea0ab708cbff338dacdad..17c92a228120e1803135cc2b4=
fe4180f5e343f88 100644
> --- a/fs/overlayfs/export.c
> +++ b/fs/overlayfs/export.c
> @@ -865,9 +865,11 @@ const struct export_operations ovl_export_operations=
 =3D {
>         .fh_to_parent   =3D ovl_fh_to_parent,
>         .get_name       =3D ovl_get_name,
>         .get_parent     =3D ovl_get_parent,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };
>
>  /* encode_fh() encodes non-decodable file handles with nfs_export=3Doff =
*/
>  const struct export_operations ovl_export_fid_operations =3D {
>         .encode_fh      =3D ovl_encode_fh,
> +       .flags          =3D EXPORT_OP_STABLE_HANDLES,
>  };
>

Actually, see comment above:
/* encode_fh() encodes non-decodable file handles with nfs_export=3Doff */

That's the variant of export_ops when overlayfs cannot be nfs exported
because its encoded file handles can change after copyup+reboot.

Thanks,
Amir.
