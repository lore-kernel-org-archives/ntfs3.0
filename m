Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795113145;
	b=wCs2axVLtj3hy/beCd0oV8+C12SBdrDJCDsU78BSU3tzI04Uim+h6IWwT4daG94Gw3Tg
	 dwA6h+KzN6cb9TvYcFY43WFTkKLSwuCNkHCAvzxSs/mq1q3JK3t//uDT5mGFYimOy8utF
	 O1bG16TNYUuheVeLrdP82kjvLby32qTZ98xXjSM/6stJnRjI9oPr32chsVfMDwz6O0/9A
	 LhLOIVJef5WYCntcvwBe4IGZZ88aRdX58x8SxGpa2X3DMsg71CoTpEgAMt0jZvMQp4Uhj
	 xM1wKIgahvSJ9nAWvetM6DDgTucF5MvsN6IIIkPFazz4DDdZlIcj9YmQlEc3LxBlimg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=do8AhcFcymjyMXuuyLMWkfZBB+M/goVAPJ9PX2rsTSo=;
	b=StlMpQU3dMzrK7yeA1kuBEfv6Z1t7si8ucrYmI4eMcZEL6wkUTKgEAJVB9dKf8CYLtaJ
	 kMI2gy/U11IkS4FyyBLxLodDAfYozFABR008Lx66v+LDJC9/9KGy7EwVOXQIKY6wtHznj
	 e+sD+AnCiG1mveLhDH1rDjiqasi8jjDGFA7T6XSNVMOpPXzM4yGlq6CLoj5aIIihCpOyo
	 2t9B1HNYbVp/rB2KA/H4RsQpRow/aNpLcpCB9n9AkNql2tMTvM6l/dxSRkCe6GD+X6fPF
	 L6o1BqiGJTfWJdYQcwWUJ3RhAzBD3QG9x0vwl7Jao6sn6pIFzC+qrkEnorUUnPljnsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJvqsikQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599D60A2608
	for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 18:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4599D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJvqsikQ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so110175a12.0
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 10:32:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795113140; cv=none;
        d=google.com; s=arc-20260327;
        b=opGxL3Z05yXwG+Y7OrEpQwopEZ1UmtWCG2TDLOrHpSjQOt+f+oXyaPssZld6r5ZZV1
         /sjsjnMGrU4mST4urfZDI189oco3MQZ+S95gs25rvl7i0Xk0IPYQvLYNR+b2Ivm/Oxs9
         I/Ut00VIjTCKaigb2jxuT3RZoEnOPG5PtJI68lIJu1ZWcG5Kzw9DFjUeaM2BzGjfCHID
         TLLTxTXJFCM6I1I7XhuuFk3EaEyhLa3pK4fCJOdOXMwY7Gmyu8cRYxWjqFBS1uyqZeHw
         kYwsA76bxWKales7nbfOU9M3qKXY6VGRiCnP1Uw3eauf0sNogzTHY7qllyh3EkG3XymZ
         US/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=do8AhcFcymjyMXuuyLMWkfZBB+M/goVAPJ9PX2rsTSo=;
        fh=6+yYzXTA4L3Q9fH9tZrD0h/u4W1E6LEh2/KbeigGyuI=;
        b=lz8DloIkJ6bSUu6wuVWsFteei+cE7koHfexQMFXtXHtt1FqdgEBXNx4zwaNx7FDzsu
         Qr+vMkpVQuZSwuJkxmKmFggq1MiqMuAJyPonVECyh4ZhXWVMiK4kQ3czNrFJD0EkDG+e
         g7M852BBPU2W22djEW5dOdO0Eb66ZT6kKEKGVpfjQbC+jkFP9jpJDoj44UZ+TF858gKm
         Pb2Bansws1njE2zVxAEN6KGiR5MopcaueDQgKWbzphix0tYLVcYXC0KZZdumfzpfMLsx
         tTFUmdwqpmRfcM7ie7GKZATKbCeqTAUgQw8WMmGcgK4eMQmtCadPVq5vmKpGYHUA5hQ4
         jyKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113140; x=1795717940; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=do8AhcFcymjyMXuuyLMWkfZBB+M/goVAPJ9PX2rsTSo=;
        b=CJvqsikQC7UA91RgFZar3c0RDJ/2o4J51d6yxdUIIhP8LIWh4VWO0WF1YM+RyTN2XI
         V8Yz6JCEZKA2Dc6JlbVpyAdpq5RakWL8sFKDpqROgA4Nj2zjxVOaH5WV2p3/NKJzcS3V
         BIYPSwvW2N7/4T4eX1Yr/qoTCPeHAs0R2k4XAxeHEiWuwBlB+IzaNtskojfDqSXdmHE4
         9VNewsXkSfIABWkLQkfTGH0Vfnn2uN7YytkM0ea33eK0CRCiiAvC4RCzQUu3jS8kECMI
         5z7daqOAwkomZv8h6DdSJ+MI4tRzeAtKD8cT6LH+QbHM2pqKTjb3tAy8or8R13Ogj83A
         +mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113140; x=1795717940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=do8AhcFcymjyMXuuyLMWkfZBB+M/goVAPJ9PX2rsTSo=;
        b=Dm9fxDsUuirGF6V2UF+bJ+TY1R5XgvGxGkRmz7nRSNiKiaBQMN930x2RYAuBFeVo+6
         +XgN6Ffi6Vr4stLvLyXM8xF6aJO7w5VCDbenSLon9OsKaPNM2XscD2W4BiFUN4MO62DR
         x3G/Zg2w/G/LK1UGknqB72HxVlH9RnnffKC/yEc9jkyAgSf39LV0MWB6kdKCvhsfgFU8
         19s1o2r2VQ+2q+DLPojTWlbeYhVWmcPRN7aGUTHhbI9qpmcuER6Tw2DPypFmi0LIFjv4
         2awfqQVyYeTphoDP5EQ9kCk+42eILKNZ08Rf+ShvDrckY5p4EAQfv0JjtVya91S2raN3
         t3nA==
X-Forwarded-Encrypted: i=1; AL+hErFFwO5qtrFm9D6Gg7WV1YWkmT60NmSKvLqsl6DtZnipc/k4Nlww2n6KT+9o0XK4v+QJPPGLlQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+QuGV9K9WHY5axLFzILGZFZ7xoEPEMvxhuqahFN47sBn438I9c
	wusXZLO/APFBl8Stv5xupMZnkcdrUwsH6M+ZjyQekzSvVtBMidCaTOePrPd4GKC01qkHwKatIKM
	N8JeWgb3jESWEP3jtZroe1a8kfjU3Ifo=
X-Gm-Gg: AYBFou1v3Th/o9M7LunChxZIZmZ1WALDk8DvJsGPNBZZUJxGhxscyumit8Pn1AVg21b
	VF031wffoLI42askCAxqZTOgL8fDXDYlo7af/Xp7RE8w/xk5+fUZzz5tow3M2SO3S1H0VV8eXSt
	rTgZyjO//xOsHBfbMxFDHr4pYWWXbOVmFuEhBeEWEAZh0jKn9gKbbHU4HXuFYON17PICP6mJAA2
	XcahjuoWlK5M9x4PraUpcLIFb6MONi8n/Jrnz7VtOypiJZDEKNHu0DYaea3W63Vo8jsOm30i+y/
	T4qfutDx8dR05DihIlL1PeNR9YHr+d1L2TzznwmG7ptoLXZNMvtG4ZWqIaWvmLw114L8SmC+sYr
	v03MV4KRUmeYrsj93I1uKOlcUnlxwYAzE4Gn8ecc6G5lVqZCh0jq1vZwY7Qbb+lYhhj6L9A==
X-Received: by 2002:a05:6402:104f:b0:6b4:641:baed with SMTP id
 4fb4d7f45d1cf-6ba37e9568fmr148084a12.30.1795113139463; Thu, 19 Nov 2026
 10:32:19 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-11-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-11-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 19:32:08 +0100
X-Gm-Features: Aa3M54o3FyARyR35RQ4tLjj8adRb1WJj3a2qKLwAAXLtUiEUmkOWywN3Z5RLnkA
Message-ID: <CAOQ4uxg2gpC99ohuvKm-SgPzuffJy1fSvXorbuBnYZ=OFSxT3w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/10] cifs: add provenance time (ptime) and map it
 to SMB's CreationTime
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Implement provenance time (ptime) in cifs, as introduced in a
> previous commit ("vfs: add provenance time (ptime)").
>
> Map it to SMB's CreationTime, making it settable from userspace and
> propagating it to the SMB server via FILE_BASIC_INFO.
>
> Support reading ptime via statx(2) and fileattr_get() from the cached
> CreationTime.
>
> Update cifs_fileattr_set() to check xflags instead of only legacy flags
> and add the cifs_set_file_crtime() helper to wrap the RPC call to the
> SMB server.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/smb/client/cifsfs.c |   8 +++
>  fs/smb/client/inode.c  |   7 ++-
>  fs/smb/client/ioctl.c  | 109 ++++++++++++++++++++++++++++++-----------
>  3 files changed, 94 insertions(+), 30 deletions(-)
>
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index 8cff7857b450..c2f557e406d3 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -1307,6 +1307,14 @@ int cifs_fileattr_get(struct dentry *dentry, struc=
t file_kattr *fa)
>         if (READ_ONCE(CIFS_I(inode)->cifsAttrs) & ATTR_COMPRESSED)
>                 fa->flags |=3D FS_COMPR_FL;
>
> +       /* Report provenance time (ptime) to userspace */
> +       if (CIFS_I(inode)->createtime) {
> +               fa->fsx_xflags |=3D FS_XFLAG_PTIME;
> +               fa->fsx_xflags_mask |=3D FS_XFLAG_PTIME;
> +               fa->fsx_ptime =3D
> +                     cifs_NTtimeToUnix(cpu_to_le64(CIFS_I(inode)->create=
time));
> +       }
> +
>         /*
>          * FS_CASEFOLD_FL is defined by UAPI as a folder attribute,
>          * and userspace tools (e.g., lsattr) display it only on
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 2647785ec1e4..f0b20a72b9c2 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -222,6 +222,7 @@ cifs_fattr_to_inode(struct inode *inode, struct cifs_=
fattr *fattr,
>
>         cifs_i->cifsAttrs =3D fattr->cf_cifsattrs;
>         cifs_i->reparse_tag =3D fattr->cf_cifstag;
> +       cifs_i->createtime =3D fattr->cf_createtime;
>
>         if (fattr->cf_flags & CIFS_FATTR_NEED_REVAL)
>                 cifs_i->time =3D 0;
> @@ -2958,7 +2959,8 @@ int cifs_getattr(const struct mnt_idmap *idmap, con=
st struct path *path,
>          * We need to be sure that all dirty pages are written and the se=
rver
>          * has actual ctime, mtime and file length.
>          */
> -       if ((request_mask & (STATX_CTIME | STATX_MTIME | STATX_SIZE | STA=
TX_BLOCKS)) &&
> +       if ((request_mask & (STATX_CTIME | STATX_MTIME | STATX_PTIME
> +                            | STATX_SIZE | STATX_BLOCKS)) &&
>             !CIFS_CACHE_READ(CIFS_I(inode)) &&
>             inode->i_mapping && inode->i_mapping->nrpages !=3D 0) {
>                 rc =3D filemap_fdatawait(inode->i_mapping);
> @@ -2992,6 +2994,9 @@ int cifs_getattr(const struct mnt_idmap *idmap, con=
st struct path *path,
>                 stat->result_mask |=3D STATX_BTIME;
>                 stat->btime =3D
>                       cifs_NTtimeToUnix(cpu_to_le64(CIFS_I(inode)->create=
time));
> +               stat->result_mask |=3D STATX_PTIME;
> +               stat->ptime =3D
> +                     cifs_NTtimeToUnix(cpu_to_le64(CIFS_I(inode)->create=
time));
>         }
>
>         stat->attributes_mask |=3D (STATX_ATTR_COMPRESSED | STATX_ATTR_EN=
CRYPTED);
> diff --git a/fs/smb/client/ioctl.c b/fs/smb/client/ioctl.c
> index bb8808289a46..19a9556d39b4 100644
> --- a/fs/smb/client/ioctl.c
> +++ b/fs/smb/client/ioctl.c
> @@ -181,6 +181,41 @@ static int cifs_set_compression(unsigned int xid, st=
ruct dentry *dentry,
>                                             compression_state);
>  }
>
> +static int cifs_set_file_crtime(unsigned int xid, struct dentry *dentry,
> +                               struct cifs_tcon *tcon, u64 crtime)
> +{
> +       struct inode *inode =3D d_inode(dentry);
> +       struct TCP_Server_Info *server =3D tcon->ses->server;
> +       FILE_BASIC_INFO info_buf =3D {};
> +       const char *full_path;
> +       void *page;
> +       int rc;
> +
> +       if (!server->ops->set_file_info)
> +               return -EOPNOTSUPP;
> +
> +       info_buf.CreationTime =3D cpu_to_le64(crtime);
> +
> +       page =3D alloc_dentry_path();
> +       full_path =3D build_path_from_dentry(dentry, page);
> +       if (IS_ERR(full_path)) {
> +               rc =3D PTR_ERR(full_path);
> +               goto out;
> +       }
> +
> +       rc =3D server->ops->set_file_info(inode, full_path, &info_buf, xi=
d);
> +       if (rc =3D=3D 0) {
> +               CIFS_I(inode)->createtime =3D crtime;
> +               CIFS_I(inode)->time =3D 0;
> +               inode_set_ctime_current(inode);
> +       }
> +
> +out:
> +       free_dentry_path(page);
> +       return rc;
> +}
> +
> +#define CIFS_SUPPORTED_XFLAGS (FS_XFLAG_PTIME)
>  int cifs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dent=
ry,
>                       struct file_kattr *fa)
>  {
> @@ -193,49 +228,65 @@ int cifs_fileattr_set(const struct mnt_idmap *idmap=
, struct dentry *dentry,
>         bool enable_compression;
>         struct cifs_tcon *tcon;
>         unsigned int xid;
> -       int rc;
> +       int rc =3D 0;
>
> -       if (!fa->flags_valid)
> +       if (fileattr_has_fsx_mask(fa, CIFS_SUPPORTED_XFLAGS))
>                 return -EOPNOTSUPP;

What is this supposed to check that is not already checked
explicitly with fsx_xflags_mask below?

>
> -       /*
> -        * chattr writes back all flags returned by fileattr_get(). Accep=
t
> -        * FS_CASEFOLD_FL only when it reflects the share's casefold stat=
e.
> -        */
> -       if (fa->flags & FS_CASEFOLD_FL) {
> -               rc =3D cifs_fileattr_get(dentry, &current_fa);
> -               if (rc)
> -                       return rc;
> -               if (current_fa.flags & FS_CASEFOLD_FL)
> -                       allowed |=3D FS_CASEFOLD_FL;
> -       }
> -       if (fa->flags & ~allowed)
> +       if (fa->fsx_xflags_mask & ~CIFS_SUPPORTED_XFLAGS)
>                 return -EOPNOTSUPP;
>
> -       enable_compression =3D fa->flags & FS_COMPR_FL;
> -       compression_state =3D enable_compression ? COMPRESSION_FORMAT_DEF=
AULT :
> -                                                COMPRESSION_FORMAT_NONE;
> +       if (fa->flags_valid) {
> +               /*
> +                * chattr writes back all flags returned by fileattr_get(=
). Accept
> +                * FS_CASEFOLD_FL only when it reflects the share's casef=
old state.
> +                */
> +               if (fa->flags & FS_CASEFOLD_FL) {
> +                       rc =3D cifs_fileattr_get(dentry, &current_fa);
> +                       if (rc)
> +                               return rc;
> +                       if (current_fa.flags & FS_CASEFOLD_FL)
> +                               allowed |=3D FS_CASEFOLD_FL;
> +               }
> +               if (fa->flags & ~allowed)
> +                       return -EOPNOTSUPP;

This whole mess could be sorted out by switching the cifs
implementation to the new API and implementing a generic vfs
helper which does something like the above code to handle the
old ioctls.

FS_XFLAG_CASEFOLD would then be removed from
FS_XFLAG_RDONLY_MASK and set explicitly in xflags_ro_mask
by fs which don't allow to set if (e.g. nfs) and added to
FS_COMMON_FL/FS_XFLAG_COMMON

cifs would advertise FS_XFLAG_CASEFOLD in its ro_mask
and then the generic helper would mask it and the new syscall
will not allow it.

> +       }
>
>         tlink =3D cifs_sb_tlink(cifs_sb);
>         if (IS_ERR(tlink))
>                 return PTR_ERR(tlink);
>         tcon =3D tlink_tcon(tlink);
> -
>         xid =3D get_xid();
> -       rc =3D cifs_set_compression(xid, dentry, tcon, NULL, compression_=
state);
> -       free_xid(xid);
> -       cifs_put_tlink(tlink);
>
> -       if (!rc) {
> -               spin_lock(&inode->i_lock);
> -               if (enable_compression)
> -                       CIFS_I(inode)->cifsAttrs |=3D FILE_ATTRIBUTE_COMP=
RESSED;
> -               else
> -                       CIFS_I(inode)->cifsAttrs &=3D ~FILE_ATTRIBUTE_COM=
PRESSED;
> -               spin_unlock(&inode->i_lock);
> +       /* modern xflags */
> +       if (fa->fsx_valid) {
> +               if (fa->fsx_xflags_mask & FS_XFLAG_PTIME) {
> +                       rc =3D cifs_set_file_crtime(xid, dentry, tcon,
> +                                                 cifs_UnixTimeToNT(fa->f=
sx_ptime));
> +                       if (rc)
> +                               goto out;
> +               }
> +       } else if (fa->flags_valid) { /* legacy flags */
> +               enable_compression =3D fa->flags & FS_COMPR_FL;
> +               compression_state =3D enable_compression ? COMPRESSION_FO=
RMAT_DEFAULT :
> +                                                        COMPRESSION_FORM=
AT_NONE;
> +
> +               rc =3D cifs_set_compression(xid, dentry, tcon, NULL, comp=
ression_state);
> +
> +               if (!rc) {
> +                       spin_lock(&inode->i_lock);
> +                       if (enable_compression)
> +                               CIFS_I(inode)->cifsAttrs |=3D FILE_ATTRIB=
UTE_COMPRESSED;
> +                       else
> +                               CIFS_I(inode)->cifsAttrs &=3D ~FILE_ATTRI=
BUTE_COMPRESSED;
> +                       spin_unlock(&inode->i_lock);
> +               }
> +               cifs_dbg(FYI, "set compress flag rc %d\n", rc);

I think that the roadmap should be to slowly define all the old FS_*_FL
flags as FS_XFLAGS_* and let the generic helpers deal with the conversion.

No need to do that now, as part of this patch set which is complicated
enough, just need to see the road ahead of us that we have a way
forward out of this messy flags_valid/fsx_valid inside filesystem
implementations.

My understanding is that Miklos introduced those hints to reduce the
work needed per filesystem for the initial implementation of the
vfs methods.

But it is not so hard to convert one filesystem at a time in a way that
fa->fsx_valid will have to be true, because, for example, here
all the relevant flags would be supported by the new xflags API.

Thanks,
Amir.
