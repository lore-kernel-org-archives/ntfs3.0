Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156502;
	b=AD9RqdwSHVl4ZqMQMF0XPl13FHro7OqnlB7Ja3/ZxzWHAC/1ApHTxCN9+Ctkithbotd9
	 raPXQ1RSjf+Y8bbD3mRgJAU6z/xMDU1HAKk5f/IKjhM0+k1DnhHuJs5czUOtjC5k6Z7Rg
	 3iY6Ac9dS3/JFmCnQztoMhJNXfkwcNm5TBwIULDg6X6ztlfE25oUmYH30mKYgvA6nnLZw
	 plEyyaZsUjT6u5+Ni/Zvj718xj+XbDvztREIqp2wod8qPhXwWjRv5gh+pE2LdLQLbnnaE
	 vms/poI0PpZ7vNtG6YNqNv9q72csQCdJnUCzKNagSKZFzyxu/3MRf8FOguvlWGAhvsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pfrMR7Rruo2Y1Ch+K4Gps8KgIwbSf58C0a+/ogZCwLA=;
	b=18795WBEdXim+ZmHFlQ692gB2KhucPgd68YTPNiNMnpgBrXP5fCK25Wu0JfzKEvfqmDN
	 MBOhIm3cKOhXtfsyxlcWr1GEnXXdug0Ac1DANC7bRiWqpUvv9GD51esUL9E8HHEONHHhZ
	 lf84f5/k4v4iQQ+MhlZjlVJwH2+2SPXn9uErqsW2K1LRhtPO0/PYgGUMkBPtplIl/0dBu
	 2ath8BW8JB6/bNnNGXU+TlCyV1Kk3OK4cCPMkxBk/18IpnTrZoo4H4j/eE8BhM9sbJoO0
	 dKZbeEhAXrl0SzDpH6aiQaV29lARiWyYtUZqY2v3I6iqXKynQq5MMSTFnFj7ROdFxYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjE3ATIj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64192606A326
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 06:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64192606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjE3ATIj
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so691715a12.2
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 22:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795156500; cv=none;
        d=google.com; s=arc-20260327;
        b=QZVHhPXeWwWTH5Ch1dfCenNJjqtU8lqpw1OBgeNVdcBsgtsk1cQ0t8eFgRnGQiV8lG
         WUfNl3L858+kVBptJjLrgGXD6dIrD3pcobVCzTH5fySNa+6g95bdC3hlwe3KPQSMt4Ct
         6pyGMgupLb38kE0vN1NePTO3WJtJ8hcT4GrHBxrIgEwlKNvbxoAbPwyTEqnPmXEwzosS
         WrnEZQyttrcScE42R6UTGU2wE/q+OPBAYkZUK88kGGny54JJQIavsr/rS1rPBCRmwZeK
         dyzkQKOtYkHw+bhX2Tx49X+liTTaTLj3/dIvp8RAroOYpOGquAQcGKCiYSe53A/cqhk7
         UMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfrMR7Rruo2Y1Ch+K4Gps8KgIwbSf58C0a+/ogZCwLA=;
        fh=tjNmEVSPWqQgccri5jt3KYhOLZOSUzXLaCJxdSI70wQ=;
        b=GobY8WsL8/oTobne2eytEpoPCdoIZYlx/ZLEF/3a2JlXImuZ+EsYaQos1WAxEUhl2J
         CqRELQwVW+xljICZ6gGsYDr4Tq2QfKfMAv4Crzr+CgtPBHDqNTMPiuWgMm2MoJV9I0/k
         pu7/UThVhtW9kFg7IRuEdEqQ7Un0Rgm1MQC6OYQ28tynH+KyWrURHGMK3/1GOHKH3QDq
         RdR8Z6p/luIUqRxwhH9FqLJ3iY3Yjf5DSGiCIcF0GYQY5IZ835MPm7jGCLDzF2yBP3FO
         IAfG0DgbVgG7MNwFjjekbLmNadizmYpEb3j01FxWkr2VY3L/fr42qS3f0CWg99a4aMhA
         aJAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156500; x=1795761300; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pfrMR7Rruo2Y1Ch+K4Gps8KgIwbSf58C0a+/ogZCwLA=;
        b=pjE3ATIjJ8nz8GlsakT/HP7TSwpTNaHDxVY9CUUfPWwWj2/15slipIcl7tpEUGadBE
         ylHxuo/hfn+7Ytak4AZI7pqoxxW1BmYPeeHVkz3CSlKjyHQcqtR3dnv2EapzsxdH1RdJ
         M6TwXKGq7n8T9ueqe7yFa6UjY7zJOZLsdtlfjx6958jWgHrdT6jrUFKJWMg9tX4gsPZI
         1ewsKotmC1XD8sFTfYICQMp3l9+w4iqquwhpYnBhArK9QErVtDsLXEyKTjWiGHvgGesI
         BqSVSxqxisCARLpZykMSytCmVa4f9e1Dt6cb+xFysbUKUQFafLg2eDVuHYyu+S5kI5sP
         PP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156500; x=1795761300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfrMR7Rruo2Y1Ch+K4Gps8KgIwbSf58C0a+/ogZCwLA=;
        b=f5MCBl0uZTiAPCPb1faLu1Ir2YYShibpkwS+nJ6j5Ng1hRmN7VzkCUEsc5zOVgmz3v
         YHdR0c8lAgTRSUFCyUsjlqctkE8N6NlplyFXffIgSNWokQuvhzIGoeqqNwCl+K9+AScX
         d0KzNLWluzXxuaCBHHm3gV8AIxtVfCOulHv8H+SsB26A6ed3uQCNHIE36e30Mk+lOMIP
         3pImvFdyiOy97H/JJcIj/teYGoAm9gC8W2GM9q3tJLqvvOEIRQ8piisGjfVHabNR4VdG
         FI6YegZ0ord1hDtSDx9fgZOozSkz4hPMhIQLUleCT1LRulCSJpScuFfeP6pQKAveH2iz
         h5hw==
X-Forwarded-Encrypted: i=1; AL+hErGAwXPTGUUVrAxwUgujzOxyQLHf4BOymEcoV4VHrKnhqRqZIIhd4pkEj4oghztgPmpp9qn5AA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9+2zUXpvRzGP59erlw2BBR8TDhR1WlUHTHU7SSXD4icVsyXSIc
	g7MviruvYIhS8uncSvX9hkG2E0AK+NXbk4MQoiyy6d8i9noa4CRCPVHErOySLioR2kOf2PMeOmG
	rPbdow++U0r3puV6KLQnZqVN+E46QSWA=
X-Gm-Gg: AZFdTZeRZUBULKeiGQpIViPCM9KELG63pndQP+8tleyl77x7w2pdV72zj3A6V7bAVR/
	CmeF8Ah9KL3D1j1Y8F0UQzKnO0Ptgnkw0bihXSqm2g1pyXdVIajLxRf76RGPc+uCWSByABuPYs7
	Rrx91kJAzdKErI0sAebgJHH54w51zSvSAnBgPw8oCY08dbVGuyhe2aHII8DGUZ2N7IvtS+bNlep
	jdAKCWe2i8+iH5mbYA1cmK1LmotLdnphxkDdYtuzvgy9kx9kdAzd9SvlSlv2PK4FFAOySXyVlg3
	Auh76H8MvgDSHvXm3eVutiaWc1+avcCuS/OvbiyhDWlszAKqlHSdFTHkZrH7LJkKQ2SXEqbVtXo
	BusOeF/BndJb7C5kV5JlnoFIw2xJ4WAUCD0nq/QKSuDkk2utFqNKLYE8F3Xuaa7OA7ZMaTBo=
X-Received: by 2002:a05:6402:280e:b0:6b7:9290:dc59 with SMTP id
 4fb4d7f45d1cf-6ba37ed95d3mr1090284a12.37.1795156499250; Thu, 19 Nov 2026
 22:34:59 -0800 (PST)
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
 <CAOQ4uxg2gpC99ohuvKm-SgPzuffJy1fSvXorbuBnYZ=OFSxT3w@mail.gmail.com> <DMZIZ05H7MMB.1WYNR4X44BPGR@gmail.com>
In-Reply-To: <DMZIZ05H7MMB.1WYNR4X44BPGR@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 07:34:46 +0100
X-Gm-Features: Aa3M54pFpwXClfOUj4X0Ca6dDK3QavsSpzMcSRLuAsiSgUTDoLGicUfCWGHnj0M
Message-ID: <CAOQ4uxg8aVcWyNiFDk8djdn-M3xJcu_7-kRxVq9jjFsbcGp1ew@mail.gmail.com>
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

On Thu, Nov 19, 2026 at 11:02=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Thu Nov 19, 2026 at 7:32 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Implement provenance time (ptime) in cifs, as introduced in a
> >> previous commit ("vfs: add provenance time (ptime)").
> >>
> >> Map it to SMB's CreationTime, making it settable from userspace and
> >> propagating it to the SMB server via FILE_BASIC_INFO.
> >>
> >> Support reading ptime via statx(2) and fileattr_get() from the cached
> >> CreationTime.
> >>
> >> Update cifs_fileattr_set() to check xflags instead of only legacy flag=
s
> >> and add the cifs_set_file_crtime() helper to wrap the RPC call to the
> >> SMB server.
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/smb/client/cifsfs.c |   8 +++
> >>  fs/smb/client/inode.c  |   7 ++-
> >>  fs/smb/client/ioctl.c  | 109 ++++++++++++++++++++++++++++++----------=
-
> >>  3 files changed, 94 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> >> index 8cff7857b450..c2f557e406d3 100644
> >> --- a/fs/smb/client/cifsfs.c
> >> +++ b/fs/smb/client/cifsfs.c
> >> @@ -1307,6 +1307,14 @@ int cifs_fileattr_get(struct dentry *dentry, st=
ruct file_kattr *fa)
> >>         if (READ_ONCE(CIFS_I(inode)->cifsAttrs) & ATTR_COMPRESSED)
> >>                 fa->flags |=3D FS_COMPR_FL;
> >>
> >> +       /* Report provenance time (ptime) to userspace */
> >> +       if (CIFS_I(inode)->createtime) {
> >> +               fa->fsx_xflags |=3D FS_XFLAG_PTIME;
> >> +               fa->fsx_xflags_mask |=3D FS_XFLAG_PTIME;
> >> +               fa->fsx_ptime =3D
> >> +                     cifs_NTtimeToUnix(cpu_to_le64(CIFS_I(inode)->cre=
atetime));
> >> +       }
> >> +
> >>         /*
> >>          * FS_CASEFOLD_FL is defined by UAPI as a folder attribute,
> >>          * and userspace tools (e.g., lsattr) display it only on
> >> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> >> index 2647785ec1e4..f0b20a72b9c2 100644
> >> --- a/fs/smb/client/inode.c
> >> +++ b/fs/smb/client/inode.c
> >> @@ -222,6 +222,7 @@ cifs_fattr_to_inode(struct inode *inode, struct ci=
fs_fattr *fattr,
> >>
> >>         cifs_i->cifsAttrs =3D fattr->cf_cifsattrs;
> >>         cifs_i->reparse_tag =3D fattr->cf_cifstag;
> >> +       cifs_i->createtime =3D fattr->cf_createtime;
> >>
> >>         if (fattr->cf_flags & CIFS_FATTR_NEED_REVAL)
> >>                 cifs_i->time =3D 0;
> >> @@ -2958,7 +2959,8 @@ int cifs_getattr(const struct mnt_idmap *idmap, =
const struct path *path,
> >>          * We need to be sure that all dirty pages are written and the=
 server
> >>          * has actual ctime, mtime and file length.
> >>          */
> >> -       if ((request_mask & (STATX_CTIME | STATX_MTIME | STATX_SIZE | =
STATX_BLOCKS)) &&
> >> +       if ((request_mask & (STATX_CTIME | STATX_MTIME | STATX_PTIME
> >> +                            | STATX_SIZE | STATX_BLOCKS)) &&
> >>             !CIFS_CACHE_READ(CIFS_I(inode)) &&
> >>             inode->i_mapping && inode->i_mapping->nrpages !=3D 0) {
> >>                 rc =3D filemap_fdatawait(inode->i_mapping);
> >> @@ -2992,6 +2994,9 @@ int cifs_getattr(const struct mnt_idmap *idmap, =
const struct path *path,
> >>                 stat->result_mask |=3D STATX_BTIME;
> >>                 stat->btime =3D
> >>                       cifs_NTtimeToUnix(cpu_to_le64(CIFS_I(inode)->cre=
atetime));
> >> +               stat->result_mask |=3D STATX_PTIME;
> >> +               stat->ptime =3D
> >> +                     cifs_NTtimeToUnix(cpu_to_le64(CIFS_I(inode)->cre=
atetime));
> >>         }
> >>
> >>         stat->attributes_mask |=3D (STATX_ATTR_COMPRESSED | STATX_ATTR=
_ENCRYPTED);
> >> diff --git a/fs/smb/client/ioctl.c b/fs/smb/client/ioctl.c
> >> index bb8808289a46..19a9556d39b4 100644
> >> --- a/fs/smb/client/ioctl.c
> >> +++ b/fs/smb/client/ioctl.c
> >> @@ -181,6 +181,41 @@ static int cifs_set_compression(unsigned int xid,=
 struct dentry *dentry,
> >>                                             compression_state);
> >>  }
> >>
> >> +static int cifs_set_file_crtime(unsigned int xid, struct dentry *dent=
ry,
> >> +                               struct cifs_tcon *tcon, u64 crtime)
> >> +{
> >> +       struct inode *inode =3D d_inode(dentry);
> >> +       struct TCP_Server_Info *server =3D tcon->ses->server;
> >> +       FILE_BASIC_INFO info_buf =3D {};
> >> +       const char *full_path;
> >> +       void *page;
> >> +       int rc;
> >> +
> >> +       if (!server->ops->set_file_info)
> >> +               return -EOPNOTSUPP;
> >> +
> >> +       info_buf.CreationTime =3D cpu_to_le64(crtime);
> >> +
> >> +       page =3D alloc_dentry_path();
> >> +       full_path =3D build_path_from_dentry(dentry, page);
> >> +       if (IS_ERR(full_path)) {
> >> +               rc =3D PTR_ERR(full_path);
> >> +               goto out;
> >> +       }
> >> +
> >> +       rc =3D server->ops->set_file_info(inode, full_path, &info_buf,=
 xid);
> >> +       if (rc =3D=3D 0) {
> >> +               CIFS_I(inode)->createtime =3D crtime;
> >> +               CIFS_I(inode)->time =3D 0;
> >> +               inode_set_ctime_current(inode);
> >> +       }
> >> +
> >> +out:
> >> +       free_dentry_path(page);
> >> +       return rc;
> >> +}
> >> +
> >> +#define CIFS_SUPPORTED_XFLAGS (FS_XFLAG_PTIME)
> >>  int cifs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *d=
entry,
> >>                       struct file_kattr *fa)
> >>  {
> >> @@ -193,49 +228,65 @@ int cifs_fileattr_set(const struct mnt_idmap *id=
map, struct dentry *dentry,
> >>         bool enable_compression;
> >>         struct cifs_tcon *tcon;
> >>         unsigned int xid;
> >> -       int rc;
> >> +       int rc =3D 0;
> >>
> >> -       if (!fa->flags_valid)
> >> +       if (fileattr_has_fsx_mask(fa, CIFS_SUPPORTED_XFLAGS))
> >>                 return -EOPNOTSUPP;
> >
> > What is this supposed to check that is not already checked
> > explicitly with fsx_xflags_mask below?
>
> It should work for FS_IOC_FSSETXATTR, where mask is 0... but it's also
> there because when I started writing the various filesystems code I
> hadn't added _mask yet, so I'll need to take a little step back and
> revisit.
>

Yes, I see.
I think the helper may still have value for fs that still parse the
two types of flags.

To reduce the scope of your patch set this may be better.

> >>
> >> -       /*
> >> -        * chattr writes back all flags returned by fileattr_get(). Ac=
cept
> >> -        * FS_CASEFOLD_FL only when it reflects the share's casefold s=
tate.
> >> -        */
> >> -       if (fa->flags & FS_CASEFOLD_FL) {
> >> -               rc =3D cifs_fileattr_get(dentry, &current_fa);
> >> -               if (rc)
> >> -                       return rc;
> >> -               if (current_fa.flags & FS_CASEFOLD_FL)
> >> -                       allowed |=3D FS_CASEFOLD_FL;
> >> -       }
> >> -       if (fa->flags & ~allowed)
> >> +       if (fa->fsx_xflags_mask & ~CIFS_SUPPORTED_XFLAGS)
> >>                 return -EOPNOTSUPP;
> >>
> >> -       enable_compression =3D fa->flags & FS_COMPR_FL;
> >> -       compression_state =3D enable_compression ? COMPRESSION_FORMAT_=
DEFAULT :
> >> -                                                COMPRESSION_FORMAT_NO=
NE;
> >> +       if (fa->flags_valid) {
> >> +               /*
> >> +                * chattr writes back all flags returned by fileattr_g=
et(). Accept
> >> +                * FS_CASEFOLD_FL only when it reflects the share's ca=
sefold state.
> >> +                */
> >> +               if (fa->flags & FS_CASEFOLD_FL) {
> >> +                       rc =3D cifs_fileattr_get(dentry, &current_fa);
> >> +                       if (rc)
> >> +                               return rc;
> >> +                       if (current_fa.flags & FS_CASEFOLD_FL)
> >> +                               allowed |=3D FS_CASEFOLD_FL;
> >> +               }
> >> +               if (fa->flags & ~allowed)
> >> +                       return -EOPNOTSUPP;
> >
> > This whole mess could be sorted out by switching the cifs
> > implementation to the new API
>
> ("new API" you mean _mask right?)
>

Yes and ro_mask, but it probably also means converting all the
read-only CASEFOLD fs to new api, so that FS_XFLAG_CASEFOLD
could be taken out of FS_XFLAG_RDONLY_MASK

> > and implementing a generic vfs
> > helper which does something like the above code to handle the
> > old ioctls.
> > FS_XFLAG_CASEFOLD would then be removed from
> > FS_XFLAG_RDONLY_MASK and set explicitly in xflags_ro_mask
> > by fs which don't allow to set if (e.g. nfs) and added to
> > FS_COMMON_FL/FS_XFLAG_COMMON
> >
> > cifs would advertise FS_XFLAG_CASEFOLD in its ro_mask
> > and then the generic helper would mask it and the new syscall
> > will not allow it.
> >
> >> +       }
> >> [...]
> >> +               cifs_dbg(FYI, "set compress flag rc %d\n", rc);
> >
> > I think that the roadmap should be to slowly define all the old FS_*_FL
> > flags as FS_XFLAGS_* and let the generic helpers deal with the conversi=
on.
>
> > But it is not so hard to convert one filesystem at a time in a way that
> > fa->fsx_valid will have to be true, because, for example, here
> > all the relevant flags would be supported by the new xflags API.
>
> So, something like what fileattr_fill_{x,}flags() do now, but for
> file_attr_to_fileattr()?
>

Yes, something like this (maybe)

 void fileattr_fill_flags(struct file_kattr *fa, u32 flags)
 {
        fa->flags_valid =3D true;
+       fa->fsx_valid =3D !(flags & ~FS_COMMON_FL);
+       fa->fsx_xflags_mask =3D FS_XFLAG_COMMON;
        fa->flags =3D flags;

But in this model FS_XFLAG_COMMON are only the ones that
are mutable from the old ioctl.

We would need to define FS_READONLY_FL to deal with the
group of read-only legacy flags, if some fs needs them and wants
to use the new API.

> > No need to do that now, as part of this patch set which is complicated
> > enough, just need to see the road ahead of us that we have a way
> > forward out of this messy flags_valid/fsx_valid inside filesystem
> > implementations.
>
> I think it's probably better to clean up the API now, before introducing
> new flags (like FS_XFLAG_BTIME/PTIME or the shared extent one in the
> other thread) and as I'll say in that reply (I'll write it in a bit) I
> think it's even better to first split the _mask changes into their own
> RFC PATCH series, then have a separate one for ptime/btime.
>

Agree.

It's even two different changes -
The vfs internal _mask change and the UAPI _mask change.
chattr -p implementation with new API would be the perfect
champion to drive this UAPI change IMO.

> > My understanding is that Miklos introduced those hints to reduce the
> > work needed per filesystem for the initial implementation of the
> > vfs methods.
>
> Ah yeah that would make sense.
>

BTW the trigger for the vfs interface was ovl_copy_fileattr()
so this is a user of the new vfs _mask API that we need to
pay attention to.

Thanks,
Amir.
