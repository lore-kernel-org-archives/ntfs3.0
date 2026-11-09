Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794234915;
	b=GS4tDERmcqwqbuoyhPEWchJX19pGVo/d/psdkciW5BfMAoCf5LB701/czAKteGwHaLHg
	 PWq17s592UQkz6EhdyfBnhT8bpWyuyRaDk83IsAotdw/3427bqBSdXvQPY3argx/crAva
	 /6ttPGV91stD9TFCELIFcOKhisjwDH0MZtoED2U5INOhjz96ypdUyDxcGmpcLDOzUB2CC
	 OZiKDQwks3bOX5KNawXTrjdtUzj8VMTkCho/VI7KUwILa/xept87QXw7YG2wKF4pi9sRY
	 3nF/7eqnQvxqW27OTHtbYa6OdsDLzpIgs3GNVPCttAJvqq9da8+2VTARhoAT6yVejxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0DP2yyIupbH6DsaD6N2BQPQTWSxBg8RNCtcYu23tXoo=;
	b=fz51oulcNBMtcL3GUpkS/3pU4F4BuQ7sKTupHT92uNp37csVyfTnYjGBfOEQLamM6y95
	 InAkl8klN62KOemrn2+LE6Kin6LEOCzBv/xp25z9nMM9/GlWt0tB/sU8dz1jh74dMO4Hm
	 OvvTqu0otanT0GEvdiXK1y4yG8WKHp+LHIJ8fJP2GkTTATjSWLEIn60mZYCXgO2rvNuqa
	 O+sY5eAbMTnTNJZELEhYKiaG3vbVGI0wqJnFfc3H+ZxM6AljbtD2YGrP6lZyUS+QAwoOL
	 R48QzEc7iccF+JTydbLD+d0KtFo2U/rpQW/h26iHkR6Q41fOxtWc3BgTlT2+ish8hLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bD5vWIo/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00504606A32A
	for <ntfs3@lists.linux.dev>; Mon,  9 Nov 2026 14:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00504606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bD5vWIo/
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso1065076a12.1
        for <ntfs3@lists.linux.dev>; Mon, 09 Nov 2026 06:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794234913; cv=none;
        d=google.com; s=arc-20260327;
        b=hGrBIrem/Egxg4BJuDlD17qJrAsGCZ0D+h1J15xtDCLLdAUHprkSnx6uqwye5YtKhU
         fJSJpfiCLf9ty/6mDnVpnAb/XjrRmGbgMrN5ZxRdgxOQtXwBeRCQvSqbt/hlYl/kJEke
         8MGRN0x/oBg9HY6DQWGYvV5rvvuYzPRlcmF/2YmYTUHMSnBNulxJGN6WQYkEsDwZppdA
         AXXpnCAa5LmF75ECa7OFrHDSWkAF23eCV3oqHapPurgD+KOh+2UbhBTOuOQPx1W97T3k
         lI6gokrfHRHG/zi1zum5K2C9ttqkBHeykl7vHANjErx1Kmec9UxfwUuZSfO19ng/Snkp
         fAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0DP2yyIupbH6DsaD6N2BQPQTWSxBg8RNCtcYu23tXoo=;
        fh=AupfFa2EJtYoZ4wWjBg9U3RLzlUYF9KdHU3hJtyxYHI=;
        b=aKttnfYYVLBcUEu75Q3kPUugsR1pJZKl9stA7db1pb96ExweLmVCoLTDgaJTZrKy7w
         5Tv3tKBND/KogKRwZB/9RyZOuEpamaumayGasgg/ws9LG8suGELYTWMo+gWilZdFqd4l
         horK4q9R/CE5XAtDX1HlOuvDdsT1EtzSIESIrs9s98ysJp2J2CEmViYTon/Y6ZXXFayy
         jIvA80qh7NXEZVZIbUaXkv5iWWA9c1KtwHsw0DpHa+q55f9rycEOL2ysojYurImjT6XO
         cp11sKcJ0elaJQkDM/wBlo4DjJ0kkQbeBJaCzQ6Zeg+v6lqBwAAKX4H1Gu+uc9x+SdoT
         Qbjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794234913; x=1794839713; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0DP2yyIupbH6DsaD6N2BQPQTWSxBg8RNCtcYu23tXoo=;
        b=bD5vWIo/WWwrbwtcMZfE0tjeLOXYISqkJQ9lagOYS69QttyBTyAAt9vpGncmA510pN
         5kl2Tcr/95KE0P1I+HHDAhitv6oh+fKmfSNfZcQAiAwGdVY1kFaiY05hqD9Anf0KgKpt
         MQPV0CW7/c2ZIVAZKd2g4//h97TdoO2W+ctBJM11OM3FnmiKS8vkKt8t/RPlbTD7eZ7x
         WBc6DdG5yZu2g7uofkYckN0sMniOHyQCBZdabwWLBkqsUvx9U0S+eBIJE02g+TiyBFE5
         06FJOE4Oc2eU5rGWNTnjYMU9oO/iOnREkj8pMoPfJolxsoeMwpGyxNzd3v+ZvEhfumJy
         7gtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234913; x=1794839713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DP2yyIupbH6DsaD6N2BQPQTWSxBg8RNCtcYu23tXoo=;
        b=R4PAnvFB1U7g26PZMJjDcZgAUCKZHIUJK/7GVHcuBkILelKlh20hdK7oVqiDAfXKyw
         cyvY0vnrRnTYoqW9ZO6JwMY7gef5WYuZnojnbrxYmUiv9eBEV6if/kPobyuMmKZW43eR
         wVBtRek5JZ+hqwy/2QfHId0N3e3zE00sJbJLtvZnLnB6PHDH8Dr4F7bS/VvNRnE6qmkO
         QkNB5JbHqSjS05bhU8vT/KpHrkf1JrNIY8wDUscxO13BmgKiwTmMywdqh3n1Fxe6jM/I
         sOXZqsIRpi0sn64X8bhiTXskpcNh5nO26mAbjIvI1ARrJoqebpt/IbL+WTelQZBKx4xN
         9MtQ==
X-Forwarded-Encrypted: i=1; AL+hErHRm4x9Hoc6BB29fcAhfh5SdB7urv996Ym5OkcCR0DnLpxHD2Ul5EPTFboMiT6vAqeuM5QdUA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/uFby7g90dfJ6aiM+BulFApHmQutfZaYUZkPHyGfNz7r30U/s2
	GX3EyMg6kZ4b27hVGEs7LnbAINKiCpZ7tro1UrEiQ9/8dp+MmMprDGR5liSNs4CO7J0BaX/rOn9
	mDnWrbQg+m3ynOyYRbiX23meGzWpYxHU=
X-Gm-Gg: AYBFou0ZPIirYGx3OP8tdFEYSl29RBjFUiSPDx5oHxiicjefSyiYYaaUik+yLAuACbb
	WGYMOm2NSfZmAHVYnCHcAcnrldoHwJX2CvrfYTB3eaWbMy4yRJy0lO1LZ2nQG811dWqVZSWffX3
	GaOpPUPTDoiW19lUKVXPhh5q4FiKna6+ybMpsSHD498MlVVExtKvDer9DyhDUKePtBid5V+lwxA
	OoEXqOchsAC8XsrrNoG3tdVa0C+NyFUx9FYv9n5R4knqfSxHiXIAwvs4mL7jYMmJRwnLdsGaphD
	0MelC0jQ2L4YDld6mULUljxiR+zcofMbBJJjYdHD6gpYFMdpTr+3wKS75GwHaMJP+a3Da5XGv8r
	xWMJgSF74unzqscfddO3sUkQWskfUnrUD3/itNT59FSoi3QzC6wUQF+cnk33Al+Ume5KqqR3Tgu
	EriPLz3tCHzxR9uqY=
X-Received: by 2002:a05:6402:241d:b0:6b5:4f5c:cb2 with SMTP id
 4fb4d7f45d1cf-6b722464790mr2827746a12.34.1794234913074; Mon, 09 Nov 2026
 06:35:13 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-2-koray.fra@gmail.com>
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
 <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com> <CAOQ4uxgSVc8n1LbL_dcU-DpNN5BB-ap_vGdXEu7+d0Td7PK5Tw@mail.gmail.com>
 <DMP582BGB7DV.2U0SJLJL7A87K@gmail.com>
In-Reply-To: <DMP582BGB7DV.2U0SJLJL7A87K@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 9 Nov 2026 15:35:01 +0100
X-Gm-Features: AclHuK-FL8zlFzv2gx7YoWgAsxkxAy656VIACQ9wLKYKc-RbZwxWRFIcIAczMqI
Message-ID: <CAOQ4uxj82K4z+2OiY5W1g7NyWAFOFjqqWnZSS3prytW36j1LgA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-api@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 6:09=E2=80=AFPM koraynilay <koray.fra@gmail.com> wro=
te:
>
> On Sat Nov 7, 2026 at 5:48 PM CET, Amir Goldstein wrote:
> > On Sat, Nov 7, 2026 at 5:04=E2=80=AFPM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
> >> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.c=
om> wrote:
> >> >>
> >> >> Add provenance time (ptime), indicating the time when a file or
> >> >> directory was created. This is user-settable via file_setattr() and
> >> >> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
> >> >>
> >> >> The semantics of when to preserve this new timestamp are the same a=
s
> >> >> mtime, the idea being that there is a correspondence like this:
> >> >>
> >> >> ctime <-> btime
> >> >> mtime <-> ptime
> >> >>
> >> >> so every operation (copying, moving, ...) that currently preserves =
mtime
> >> >> should also preserve ptime.
> >> >>
> >> >> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepti=
ng
> >> >> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> >> >> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr=
() to
> >> >> allow ptime to be used with the file_setattr()/file_getattr() sysca=
lls.
> >> >>
> >> >> [ This is a re-implementation of the initial patch[1] by Sean Smith
> >> >>   <defendthedisabled@gmail.com>, following the advice[2] from Darri=
ck J.
> >> >>   Wong <djwong@kernel.org> of using file_setattr() instead of updat=
ing
> >> >>   utimensat() ]
> >> >>
> >> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisable=
d@gmail.com
> >> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
> >> >>
> >> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> >> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> >> ---
> >> >>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
> >> >>  fs/stat.c                 |  2 ++
> >> >>  include/linux/fileattr.h  |  5 +++++
> >> >>  include/linux/stat.h      |  1 +
> >> >>  include/uapi/linux/fs.h   |  8 +++++++-
> >> >>  include/uapi/linux/stat.h |  7 ++++++-
> >> >>  6 files changed, 52 insertions(+), 4 deletions(-)
> >> >>
> >> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
> >> >> index 833e03810b24..c0645cb22bf3 100644
> >> >> --- a/fs/file_attr.c
> >> >> +++ b/fs/file_attr.c
> >> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
> >> >>  static void fileattr_to_file_attr(const struct file_kattr *fa,
> >> >>                                   struct file_attr *fattr)
> >> >>  {
> >> >> -       __u32 mask =3D FS_XFLAGS_MASK;
> >> >> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >> >>
> >> >>         memset(fattr, 0, sizeof(struct file_attr));
> >> >>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> >> >> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct =
file_kattr *fa,
> >> >>         fattr->fa_nextents =3D fa->fsx_nextents;
> >> >>         fattr->fa_projid =3D fa->fsx_projid;
> >> >>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> >> >> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> >> >> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
> >> >>  }
> >> >>
> >> >>  /**
> >> >> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
> >> >>  static int file_attr_to_fileattr(const struct file_attr *fattr,
> >> >>                                  struct file_kattr *fa)
> >> >>  {
> >> >> -       __u64 mask =3D FS_XFLAGS_MASK;
> >> >> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >> >
> >> > That is not the correct way to extend this API.
> >> > This fixed mask was added as a placeholder for
> >> > "We intend to add support for more xflags to selective filesystems":
> >> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir7=
3il@gmail.com/
> >> >
> >> > Please see this POC patch for filesystems to publish their supported
> >> > xflags mask:
> >> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir7=
3il@gmail.com/
> >>

Re-reading and answering your original questions:

> >> Quick question, should _mask also be used for user-space -> VFS to adv=
ertise
> >> what it wants to change?

Yes absolutely.

> >> This would be useful for on/off flags,

Exactly.

All the Windows filesystems that want ptime, would most likely want the sup=
port
on/off HIDDEN/SYSTEM/ARCHIVE flags as well.

> >> but for ptime both fa->xflags and
> >> fa->xflags_mask would have the same meaning of "I want to change ptime=
,
> >> look at fa->ptime".

There needs to be no FS_XLAG_PTIME in fa->xflags,
just as there is no FS_XFLAG_PROJID in fa->xflags today.

However, since btrfs does not support setting projid, when we introduce
fa->xflags_mask, it would be elegant IMO to introduce the (new) flag
FS_XFLAG_PROJID which would be valid in fa->xflags_mask.

To be clear, currently upstream chattr (e2fsprogs) can set projid via
FS_IOC_FSSETXATTR ioctl (no xflags_mask) and upstream
xfs_io -c chattr (xfsprogs) can set projid via  file_setattr() syscall
(no xflags_mask).

But if either utils were to be modified to support setting ptime, then it
would need to use file_setattr() syscall and set both FS_XLAG_PTIME
and FS_XFLAG_PROJID in  xflags_mask when it wants to set a non-zero
value to those fields.

Specifically, the invocation of chattr -p <projid>, will no longer need to =
do
FS_IOC_FSGETXATTR to read all the unrelated flags for setting the projid.

> >> Should we make _mask the only way to advertise what the user wants to
> >> change,

Yes, unless _mask is zero, which then means set all the legacy values
which are frozen in the constant FS_XFLAGS_MASK.

> >> ignore xflags | PTIME in user-space -> VFS and use it only in FS
> >> -> VFS -> user-space to say "this fs supports PTIME for this file"

Close, but not exactly.

For GET, semantics are clear and follow statx precedents:
xflags_mask always means "supported" (like stx_attributes_mask).

For boolean flags, xflags is the value
For integer fields, an xflags bit means "value provided" (like stx_mask).

For SET, when xflags_mask!=3D0, a flag of 1 means "I want to set this value=
".

For boolean flags, if the flag's bit in xflags_mask is 0, the flag is
left untouched
(e.g. a chattr -p that only sets the project ID doesn't touch IMMUTABLE).

For integer fields, the meaning of xflags_mask 1 and xflags 0 would be
"I want to unset the value" which is not the same as "I want to set the val=
ue
to 0", because as you wrote, 0 is a valid value for ptime.

The question of whether a specific field can be unset or not is up for the
filesystem to decide, not the VFS.

For example, XFS already unset the value of cowextsize when flag
FS_XFLAG_COWEXTSIZE is 0, although the same could be done
with a 0 value to fa_cowextsize.

VFS does enforce that xflags & ~xflags_mask is EINVAL.

> >> (which will be always once support is added to an FS, so it would just
> >> be "this FS supports PTIME")?

It does not have to be an FS-wide property. some fs could have ptime
(or another attribute) support only on some files types.

> >>
> >
> > Sorry I was not able to parse your question.
> >
> > I think the mask should mean "this FS supports PTIME"
> > regardless if the user asked to get/set it or not.
>
> Yeah sorry, I'm just a bit confused because of all the similar names and
> concepts.

Me too... I needed to re-read all the threads from Feb 2025...

>
> (assuming btrfs supports ptime and ext4 doesn't)
>
> * filesystem -> VFS -> user-space, while in fileattr_to_file_attr():
>
>   for btrfs, for all files[1]:
>         fa->fa_xflags & FS_XFLAG_PTIME =3D=3D 1
>         fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1

Yes.

>
>   for ext4, for all files:
>         fa->fa_xflags & FS_XFLAG_PTIME =3D=3D 0
>         fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 0

Yes.

>
> * user-space -> VFS -> filesystem, while in file_attr_to_fileattr():
>
>         fattr->fa_xflags & FS_XFLAG_PTIME =3D=3D ignored

This is debatable. IMO it should be 1 for value, 0 to unset existing value,
similar to removexattr() if you want to look at it this way.

>         fattr->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1 if user wants to =
set it, otherwise 0

Yes. but now the user has to set any legacy field it wants to set in
fa_xflags_mask as well, because fa_xflags_mask is no longer zero.
so we need to introduce flag constants for legacy fields that do not
have xflags. I think that is only FS_XFLAG_PROJID.

>
> Would this be correct?
>
> Or would it be better to set FS_XFLAG_PTIME only in fa_xflags_mask, and
> never touch fa_xflags with it, which would make the above become:
>
>
> * filesystem -> VFS -> user-space, while in fileattr_to_file_attr():
>
>   for btrfs, for all files[1]:
>         fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1
>
>   for ext4, for all files:
>         fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 0
>
>   (and always fa->fa_xflags & FS_XFLAG_PTIME =3D=3D 0)
>
> * user-space -> VFS -> filesystem, while in file_attr_to_fileattr():
>
>         (fattr->fa_xflags & FS_XFLAG_PTIME =3D=3D ignored)
>         fattr->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1 if user wants to =
set it, otherwise 0
>

I prefer the former.

> This would mean that fa_xflags_mask is used like stx_mask both by the fs
> (to let the user know what it supports (a.k.a. what it's returning)) and
> by the user (to let the fs know what it's trying to set),

This is actually like stx_attributes_mask not stx_mask.

> and fa_xflags
> is used only for ON/OFF flags (like immutable).

Yes, on/off for flag values (like stx_attributes), but "value exists"
for field values (like stx_mask).

>
> Let me know if it's clearer.
>

Same.

Thanks,
Amir.
