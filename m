Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794070131;
	b=lHFJr71f5+0ZqikZ23HILNVWaptVz/7GThRpwan8IUlN85gEneLyVT5U7rjMwJ+jkg1A
	 9mLHpAdVEDFvmaTED+so+xd4vWO43ki3afk50VGXwh0t6bh4D2QoFCjkxxVC79NCOVKpV
	 Vs0vWpwk1UG/Z0Hk30snPhmhW4RhYNl8+U41cFDWLa4RLb+gOhbj4+cTj+PIREEVw1c4b
	 zT/h2jek91sTUy2ERTQKdPqIgS66i9+BocrmHFkd4T/ZeZUlgclzPpml9kCIsnu//cODL
	 1K/uXq2iNai/SMGoQmMxbZHM1ejtDVy2GxuXCOioL9ez7ohMHzeo40kOWNgxY25GFpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
	b=5BJfooQNJSBmAQZARA1xpWLDvrgVaYlJrCOUOzp1XxFhg8Z+zwaR4kzTCtwUnAxOJJBD
	 h1Xju8bJEehslFYSmlSVKX6KJhS77aunvwAcEf0NN3MzvWBTKTSc8lojPPWnNctteRs7n
	 YH0kMVCFx7WgOI74KqJuTZpmCANvqb36pPuvyv1HtNKKkgwxQieZg7YUVPUKRJOX5QXbz
	 d+Zl63N4FaJWdArEfqA0RZGj7RaqSaHD0Kvjn/G6lYHh2YVsyX7dE3XfGHleEgVgLDi9a
	 FEu33396lQXTPYeSyZeJ4AZsJFNkugm7UCQRfIgZtQ9GSPjl8JYdZMB9eT52fw9vPXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G89fxJTK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F4606A32D
	for <ntfs3@lists.linux.dev>; Sat,  7 Nov 2026 16:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9F4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G89fxJTK
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so907718a12.1
        for <ntfs3@lists.linux.dev>; Sat, 07 Nov 2026 08:48:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794070129; cv=none;
        d=google.com; s=arc-20260327;
        b=P1od1y68beo6ELhQmK9hrvFKYOR4VjvkRgf5+0i/8MWKi6wmAKd9/MywYiYixFIM/c
         ateQwG6FFMZBIrTsr7JoXRZlyX17xkeBa3Gg6AXnhlrs/gMbiBFEt5Duv4TsiBw+QDIb
         xlZcNSV8PPnnI2W9gKN6aCofmLdlXmS6VO26gbKF5tp6mC4jshQR84ifeSWol/OD5v20
         1DBSirzRqnnuIim2E72Lvryrv2pCilFDxsRWhmw3Vsph18hUg1TWlxiuaoapOHkDuvd3
         xsHDisSyWm9jijGnYK8hR2K3lctIliwkDLOZNobdTUNunLbH3rpeWGijqDTLIyTnBd2Z
         hKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        fh=nB9IVTLwGPsqNp9IHhDHfhA1fanbhpIec3jOnCS2uCI=;
        b=UeyImwe/bz2Y3/ftKuaD39k32Hq4oB5RSOUkoF0UnVWsV4Vt0UxILjYd4USHa4qnHg
         X6q3i8vXJYLxclyq0fqT15u7SlPLMc31GNqFmIFAjtQ0X1wqae6muJYushzDkQ4cCW6a
         80f79tj6z7uvCAzC/qV7Uevuq9I4X9f896Ejl9pHJ7znqS63GvzhiZFBvdEV8HS7vo29
         4TN4tgn3sB3wMniLlKM1YWhhjOQ9G1Z9pVrCWYh6sKRctCmDtpxHUyv/wEbied8minKr
         duZvaaJmRu9Sz/M7meic07iqbI/uyLco4vsEAJooevCJb17+FzmJOeF6Vc+zfIotBLt/
         /mtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070129; x=1794674929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        b=G89fxJTK2DrA5ftSa5ECtKK48vkMnvRJeFmeXgo3wqe+CfmmPngz4MrlfFpHjkq//f
         ftFjtjzMdzbruXwCv9P9oigjxALj+J1pC2gxffpD0jpRHje5GhxPF0CjMzTxJa1MG65E
         MeXbQIOzmNPqq8TVdmjd/q5brraB1P+8BIYum1sjGezel/p3xPniWJV9gDxfX63JRFvD
         u5vMm2bBhitwbhLFEyZgY8xKv9pTy3crzbpQW2A85ELZkl09gGogZg0/c+HpvJq2/Rt2
         pkDmmh9AinsQ27CbXkLDVN056FhJJZj8YrE6CdgiJBl9GSfs2Fh6XV7C5kp7GbRbOLjZ
         2lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070129; x=1794674929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        b=A6jq4IXtFx/23Zv44yEjBiWA62Atm4ciYA8qzkOBpLglv265H6j/x+q1JJk5csAPJd
         EFmzHIhYySGZ9Qc2li19n1VeTHo6U0biLlmpzPUnGFbnYlTTurxRkrn3ABp7ICpabQmz
         U9B/KoH5OJ7PtnkDdw+df9InQH4uHgcs0Y9qvvgVrYU+bSfBGiCdT/K/Bx4qyyRo9gul
         92qypfoDM/Sk0s94HKGFwopkGtsetk+2vhAF5ujhPQj22sWFF1zcpsvz5jNHc9WgncWt
         S819P9GvaLPKOaQBLDD73QswnO8PDg0iwbXAiRyVCpw86wa0QFZOZgNTOlecoD7Q98N4
         RNTQ==
X-Forwarded-Encrypted: i=1; AL+hErHJmwCAn5zDxDPJXUBwwixaVJvYf93clU4MyF6NA4Gzqe49b9kYiY9Et1qSXAp25j98S7kgbg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9CiuP62NWos+BClTv9D8RuXeyt6k91+gOxi1qIr+08HEqiv2S3
	ZVxPfDtO7QwjmIOcgCYWnZBnbDC6mTebTE26UHE35YdaBz086d5/Sjq5P7qlJPiqi3jBDdCcXHs
	WrHj1jAEyHWGIIS+GLATszr8gdtW47nQ=
X-Gm-Gg: AYBFou2g4+VfS8F2y9PLqQFgyzncLP56ZFQiJR1jfKV5bhAP+YbTJ7SVX39c1+fImjs
	MlM+PCL7Go5AW7HNaxLasnoYPcSWKPIUCDTjO+yO7zRDXqFNWfufZsbD5x3dvdgpbPoPus/Khgz
	Dn+72gxrto1Nik1GCZe/vIgDDNG7kE3QtsBf7z9ESLgt1ygBbuOKWfAcc/IOzA+opIfSBj8KDsp
	F8gDN433LCkNl3eOD4jo6qcIkdmulT+AC7yJ0QAnsUkMP4aGm3MiAy40mMNkYS8VuSqHPh63RPj
	Q9tGprgjw2K2TS4ZZHmQ3rYYNCxm7ViZ/oXRiSqYFjXCYFN9tjeCLw18tgBrHRs6iiApFXlb8Zq
	qim5PDgdHj7aTCGUbHydf2t7P/Obsr0X/XXY38dzLBRCwxGn8W0QjOOkVeQB/ZhaJjK/voA==
X-Received: by 2002:a05:6402:1ec8:b0:6b4:dcab:bf9f with SMTP id
 4fb4d7f45d1cf-6b6fae71be9mr1620380a12.16.1794070129335; Sat, 07 Nov 2026
 08:48:49 -0800 (PST)
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
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com> <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com>
In-Reply-To: <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 7 Nov 2026 17:48:38 +0100
X-Gm-Features: AclHuK89rvp6wjLvX07JFLvpP57bRUqY-Yxm_O2zzvQ-fpYQDX7x1__0QP5KjTE
Message-ID: <CAOQ4uxgSVc8n1LbL_dcU-DpNN5BB-ap_vGdXEu7+d0Td7PK5Tw@mail.gmail.com>
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
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 5:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wro=
te:
>
> On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> Add provenance time (ptime), indicating the time when a file or
> >> directory was created. This is user-settable via file_setattr() and
> >> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
> >>
> >> The semantics of when to preserve this new timestamp are the same as
> >> mtime, the idea being that there is a correspondence like this:
> >>
> >> ctime <-> btime
> >> mtime <-> ptime
> >>
> >> so every operation (copying, moving, ...) that currently preserves mti=
me
> >> should also preserve ptime.
> >>
> >> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> >> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> >> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() =
to
> >> allow ptime to be used with the file_setattr()/file_getattr() syscalls=
.
> >>
> >> [ This is a re-implementation of the initial patch[1] by Sean Smith
> >>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick =
J.
> >>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
> >>   utimensat() ]
> >>
> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@g=
mail.com
> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
> >>  fs/stat.c                 |  2 ++
> >>  include/linux/fileattr.h  |  5 +++++
> >>  include/linux/stat.h      |  1 +
> >>  include/uapi/linux/fs.h   |  8 +++++++-
> >>  include/uapi/linux/stat.h |  7 ++++++-
> >>  6 files changed, 52 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
> >> index 833e03810b24..c0645cb22bf3 100644
> >> --- a/fs/file_attr.c
> >> +++ b/fs/file_attr.c
> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
> >>  static void fileattr_to_file_attr(const struct file_kattr *fa,
> >>                                   struct file_attr *fattr)
> >>  {
> >> -       __u32 mask =3D FS_XFLAGS_MASK;
> >> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >>
> >>         memset(fattr, 0, sizeof(struct file_attr));
> >>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> >> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct fil=
e_kattr *fa,
> >>         fattr->fa_nextents =3D fa->fsx_nextents;
> >>         fattr->fa_projid =3D fa->fsx_projid;
> >>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> >> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> >> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
> >>  }
> >>
> >>  /**
> >> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
> >>  static int file_attr_to_fileattr(const struct file_attr *fattr,
> >>                                  struct file_kattr *fa)
> >>  {
> >> -       __u64 mask =3D FS_XFLAGS_MASK;
> >> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >
> > That is not the correct way to extend this API.
> > This fixed mask was added as a placeholder for
> > "We intend to add support for more xflags to selective filesystems":
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il=
@gmail.com/
> >
> > Please see this POC patch for filesystems to publish their supported
> > xflags mask:
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il=
@gmail.com/
>
> Quick quesiton, should _mask also be used for user-space -> VFS to advert=
ise
> what it wants to change?
> This would be useful for on/off flags, but for ptime both fa->xflags and
> fa->xflags_mask would have the same meaning of "I want to change ptime,
> look at fa->ptime".
> Should we make _mask the only way to advertise what the user wants to
> change, ignore xflags | PTIME in user-space -> VFS and use it only in FS
> -> VFS -> user-space to say "this fs supports PTIME for this file"
> (which will be always once support is added to an FS, so it would just
> be "this FS supports PTIME")?
>

Sorry I was not able to parse your question.

I think the mask should mean "this FS supports PTIME"
regardless if the user asked to get/set it or not.

Thanks,
Amir.
