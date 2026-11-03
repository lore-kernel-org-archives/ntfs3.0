Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718890;
	b=q4WnYWuxJu7SYaDmQ/9DwefISrwl5ADJBiI8Wnzl3+eIz9WUZnSIJOrEds9g3PGEIfwb
	 WTlWzH8QhIIckD0wOYdnXJ5DGtMfGMXDeiLIyHtsePaprDJdgEA7m+HkrN/CS5fQPnBKM
	 bZ36w+7UBqEuFPp85Jx6A41PKyJWxZGeUn7TXukP/KQKk03uobuzr3NCNC6tSYdpqY9uF
	 uJF9DNwK1Siv0pT9Fb1L9SNtF/Prr5g4UGVXA69lOfPwBD1inTxB3zD1rhcspZoD/3ZWj
	 lN9rEiyu84CHCJPYdSF3t4bLO/ZCfGa3oKqIMTqft3NZp6Z0QMY1Xtlfdj7fyWa1yJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
	b=QErep2GBRirxWreSNu3M+u5pBrBeX9g1DG+Q4gZST6utr0JwAdGz7KvKOQZvMB4jH53n
	 chXAfPPJ80LK262fP/2EYbppqC4fk6zCJraHtHT1oJ/5+pvTLezyAGUu1I53guRX8YoGf
	 2AHOeuC6f+pjl2YIr3WA2htkl6gfAh9RrQPs+5y3wveucNNbD2O9tgeo6OShEvFr41qCR
	 aWGUdZnCRMZYCY3Dth8gvadrK8QlwBaB2iTNoEb5iCbsaQUav1dX5VqfdEAi5bzspImms
	 8CQI7Hwr353/TA9sCMk7Pk1ygxBPR5QWs9DdQJdQSsBmZsYGbu4uwKEAqX9YMqOBvsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZrJqXa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A79606EE8E
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 15:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A79606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZrJqXa
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so6198455a12.1
        for <ntfs3@lists.linux.dev>; Tue, 03 Nov 2026 07:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718888; cv=none;
        d=google.com; s=arc-20260327;
        b=F2hHzPPA09AvOLPoS9miXBPP80AgsZ1QIlPIA8783ALFL5xI7FeCywSW8ueHjjjXoK
         NZ+ybBeexVgbUR/SQGmx8FDlal+UBPvE9Rt9k3AyfvVjw64JiXgneBaTbD4y35H9QtD+
         rHPMJ02Rq9QTLac4KrNLwI/r1Bk1GXTDi0mMDE4VLl24+V12igN82pcvZVUmTvk0iTH1
         sNi0QCR8fW4eyoIzZtwptcDlUqmLjr9WryzDy9cKHjzCar8QwNJ5vGTaNkC6x5CDeDlQ
         ztWCzFgR2JfGAuweIrD0UnImf/z4rcUjsEz/+66iowBI9zFTE0OA7Edi4EdNwO/ymuHR
         z8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        fh=dVdfh8pkC7175ySiKG/WGfso55e5HB+1sA1O8Pk72j8=;
        b=C0NeXi+xMGsadr6Jeh2eI83APYU/wpMmMVsuko7uYEfITx7iIBS8ldZFaABjYIpBjM
         sWRWc7Ihulj0RGeseYCBgOGYxCTVFnLvYhIbkUiLXYCB95IuAGpJ9DCQhdvzyQw+O0I/
         hrRdvwIPoiLQk24fxHGOeC2r4x/ceCgH43eSEf9F5ZOJFVUF8plScuu0xvmdb3H5eWkE
         qxLI4RcbfmCwKvy9iwwjidz4ltwK/9tJ1Wb9CsIVP3KrDNOv15OTecRI4ysQLeQNdWIm
         2igEigTJciB7PO3nCnA9Doz6LFWgkw6Xi6xLuP0tuqzZGxaExaJ0pDybXvxeUrFtPxt1
         zieQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718888; x=1794323688; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        b=IPZrJqXaSzfRftkRRy1qNQtVABcx4KDr6aStT+MDK0d//0AwfqFg1LijJ0wjrIL90v
         wH5HGp2uxQh7ZFqeSPGDOYrvsHtyeIF4CZWYYx83wAeMTzwpwnH3bJzZo9LmhLM1xXma
         72GxG//TlNYeExhPOVi0KQpyCBZ230HR+reNGnrA533nyLtkc2k4tyh1giRt2LTWlGpk
         qF0uXO5PcBkGy2IEcwBkhpV1G/1WbMwfs4h5KfugT5+UXuslQuii3vLm5YvwswTWzIoR
         kpjuklAqEczSxKZGGQh2ChVkDQMMBlDzUIHmLg56m6qK44EregjSp4ug+z5z9JrC1v6O
         30Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718888; x=1794323688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        b=mSCbI+LvU1J0p8AI/um1WMXHiR/BCSFTp0X/e8ewpSPlUsScsviLTpKVTCbMeYoyze
         A1f85sOxdHQG0onc7HhFdJ1c3L3pVKQQf9/u3wfFZurdcSbqGcBXRxCpMUuJzGOIQyeO
         7BPaF4FmX/JxHE2G/5t3b3WEKUTkQ5cARM0FviyZIzyn5PxTPHZAj99hIAk0aYUJ4KF/
         rEFema5LsRFN79Kw8jvxsMbfvWNfWX+UqjpLGDw/YFPtodtpDegcPsHamNhjIDwToH+a
         8yv9b68FEF/HAOBsZF3w/n6IY6BOwrUcLOIMrQMOTkVIL24R6WuNo1iaPHcNz4I2VlgH
         RpFA==
X-Forwarded-Encrypted: i=1; AKwUvBz52eTVNo5VdxoDb7drECScAcRczOSpnjwVKZXEbEAAkRy8yWpToWep523i9KV4sodmgSYt3A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kQ1nD0ZnBI15KhvrOxVkG7Iv7uGQxr3umL0eO/IwX5H4tK88U
	SI8cQvwxBljcOZbwa35NBRUWDK9g3qy2Stq5ZBcqcbYVz67PGUQ0cBZ1YAut+UP9pWWOJkKE9aY
	2Q6WIvO1uaKGdT6TYJ/TDQ49WIUIbKCc=
X-Gm-Gg: AYBFou0Rh0tqYCuhxjeiLddWtHppREjH6Qp0/oJyKrsiT8NwNpInnET6eeTsH90gZeW
	/xKo9IpprJrBIhSA8ERheMi0wyBpge5DeQniaV0BfuLcf1MnI6jwg6ZKo2g5wephVv2Vy2oq4Tf
	ofNONPY/QIBi+JSgSjEWQoBTkcy9M8scpj6mDI/XsLP7VWE/+Hzmx3K8rZMFXb/qVUY0Wv5PW2v
	8E4ZJ7PWjMOhIVKLeB0tIw5KU0UJFcHbsQNQ42qV6GQEXXN5tRRXS67xkRCzbU99Oj1Ba//449T
	0l1v6gMOEW0BYgt89OVdpZepLLCjish94yfUiLFNOyXyNTjt7vPjWD1UGDDSomahjQzG/XiBDEJ
	+HI9vRSCAWEUa4E5m9YgSBu0ZsLVzJcjnTVEKoRlvaXZfjQzN4qhkOqkjBH3pVs5i1PrGHzY=
X-Received: by 2002:aa7:d309:0:b0:6b3:f094:8ced with SMTP id
 4fb4d7f45d1cf-6b4d4683a29mr7344511a12.21.1793718887787; Tue, 03 Nov 2026
 07:14:47 -0800 (PST)
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
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com> <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
In-Reply-To: <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 16:14:35 +0100
X-Gm-Features: AclHuK-EjP75rU69csZK2uVzxHspULIwEcPYYUtLw5t3M157ApaMB9lhTx9MQvw
Message-ID: <CAOQ4uxiTS-QT7y1avNSasJSffkt2uRNkdrb2_GrK7kJ82-MoXw@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 12:13=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
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
> Thanks, I did not think of adding a dynamic mask like that, I will look
> into it and implement it for v4.
>
> > This will allow callers of file_getattr() to know if the filesystem
> > supports ptime
> > without trying to set it and failing.
>
> So after adding fsx_xflags_mask to file_kattr, every filesystem would
> populate fsx_xflags_mask with all the returned (=3D=3D supported) FS_XFLA=
G_*
> in their own specific .fileattr_get, correct?

Not all filesystems. Just the ones that wish to extend the constant
legacy FS_XFLAGS_MASK.
So just the ones that you change to support XFLAGS_PTIME

Thanks,
Amir.
