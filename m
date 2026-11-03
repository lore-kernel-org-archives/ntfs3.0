Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704423;
	b=HpaD1T8yYmgn78Vt38V2lIopBvKwf0Y23qfcQY2GTL6uFBl3lxu5UF9BaRy2z/rL6J+p
	 bR0hMUa3l8uzpaMHCtSbBtKMrRZ+1P2pLz3H4JdUGJrA9neRhQosixHEc95OeK1drzoh/
	 GHzneJlqF+GeXRCViwWjOCIWgtSl+M+0X4iFKsJYbrf93KMWeICved04q3IO/BwpXZUEE
	 vsTUyKazAXgjnDSf7H7LyyNTOx9p+cjvW0CAkpxyBjOUVhfRBR74u+eRd7/tTTpeEU65x
	 9u2R35G68LwpjHOBGXawBnBUvoHK3eizZ+7mo3OyLaGxxfaYQZoXtgu5hm/4JPc/wfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=aApL6RX54q6lZ7c3C3mWoQyOMn5uc2rO6KvHRJ9B9N4=;
	b=MeeHmZn1cikkoJ71DNiFJqlmVLxhY94lQeNc87pw1vL9wzdlODAqUGZ0iNLlUtif6KlE
	 SHQuMNYnH1GqOC0XX2tPXmfJSrdnTd0+xtyDRAdzI8tR3+TBIkoKNm+6GsqxaI5ZTc35q
	 ajrHcPNZ7xT0BALvrX8e88PAaimO/673g8EYZvLYsnvkF6xiTAwrJrrnXmMGMt7rCGu6A
	 qr/EQNNr040dH1hd53bIDtmmiSFpeSWjkCC6gX6aTVwypuD2S9DgLFJBYMNpWKY7+zpmt
	 exz+c4KYAZTy/K8oSJ7Npifobg2BPyCh/vQqOHMXvVtepIX2i5mR25tfSGcQnHq/ZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdRlQ8R9;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9852606A33D
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 11:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9852606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdRlQ8R9
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2418371f8f.2
        for <ntfs3@lists.linux.dev>; Tue, 03 Nov 2026 03:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704421; x=1794309221; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aApL6RX54q6lZ7c3C3mWoQyOMn5uc2rO6KvHRJ9B9N4=;
        b=MdRlQ8R9ad4iO+p7eIiZuxhVfR9qZX0NwE2zWB7OLQfn+1kNXKMfkAs+FWVIeedWf6
         7e8RLQYoASiqSFsokk7PaNUI8pIE48QyH9Ln/YNG5QvRSNCytS2FoGh0cRaanApYmNWJ
         /GrlaM2iuUYD1V3dGxutCdsKX6/UkPxpPH2cTpLjtRvr4xys3xhfhrVf/WIwvW77x4MJ
         z7NNQ6qakqfBBf83errdO41Q6waH+antRYVfVgswP3hayaLku4vuyj+i8jZkV6KuCP8J
         32J1PgnRUTcr6DaS2nXNPR50NBxOSJaxy513+pL0Y6whrdShdgJn74wTcStM8hE1pFuc
         WFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704421; x=1794309221;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aApL6RX54q6lZ7c3C3mWoQyOMn5uc2rO6KvHRJ9B9N4=;
        b=1CaPeJu4q8rxi11iFzRZKcVtmlUPdsGJjmOpeWsPleRlkcBTSetQvs1hI0e/ymZJKE
         WjfW0iQ0LxWS80LUAZiQzuLVR+MlNlD4XIHueO5RV35uXN5VaoykC3ry3xzzy7cyEF28
         jJ9udN0E+6gEjoJOwDRd0jzW4tOr6jsk0OgTrjYs7Lto/JpYEwxejZRb/+pZWHu9Cn2S
         RcCY/6dGxNJsG/IsxbsH3ysHFA32xsPIfbYvch/J8Urj9whiqGJlLC3vGiaH6ajSGK55
         vtbcZG+gUH7y7UPxWbEAfrA0TocZRD3jNDCXK4wF4MpKCGMbzDPu93o8e0Lg7sAEZQS4
         3Grw==
X-Forwarded-Encrypted: i=1; AKwUvBxObPf8cOBaoYYZkvrdj8ITWyouY9M3MkMlyJFAKhvyRpzm1Wm9fjgnOPtBFUi1ZFPCTCxRbw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/qyj1bGrIDU5QsWmJm7zwj8JdBMW7QCa4LLlRxEo2h2oH+TouV
	+TilhVi9abKDjtE6mmwsETEo55pl0phFuZg5gHi9Z6e48kVGsg3PBy7R
X-Gm-Gg: AYBFou1uC58mxbkryBg3g8EfBAZXF1I6PF0HIBvAC1iNfQ6lG+eFSGfAr5fiyyMnIWH
	ZssV5rlKjkGGHIfh7FmRXy96YfZdA2S/MeIlsolLoQeeIHMIE9WmPXtv/7V+64F96isgJLifSgG
	JNS7amTRnuZjr1wbVkM97ySXG16L7Zz9cC3ytIeA8kQWrRBktmWQQhQwGCTKBst9ig9AGTtwvMy
	+Cojq04ViwKS/Ohjk4Lox3fxub9/djL5woPf3Hhu/wlp5kBlyKv+VfRE2k3h62uJbmkdWYt0mBB
	70PztFEi2GdOLnY/qiSWlVt3zYA3ja15TD1M2Uq5ODB9QWRP7wQCrbmVy7zIltUalA8fiNa94rM
	XWMrWYpSB13kLTXM2O9W9QTEpSWnfzFXu3lV5FmD2oLxXM1syF/O9qoVkWnrqagzPwHCZ4CFDFw
	k0kTk4yAeR/c33P5dk9aLnHS68pXsrFtuLNcEiqHiJ//pBIzDn28v4GkkjZbLqtY9QJprwpRfxT
	Q69SnUxxw35rQbcH3o+zDvXkVWPdfQw8CbXedMGWlrB28Ug2LTznMsnVXSYKcdx+CCAXU9pSZ16
	pvg+PHELqIEHL0X1g9uCRBMeVhd5M6uF6xmCwe5mo1ptgMzQ
X-Received: by 2002:a05:6000:4311:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-48e6e2ff167mr26601099f8f.34.1793704420858;
        Tue, 03 Nov 2026 03:13:40 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm25639265f8f.37.2026.11.03.03.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:13:40 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 12:13:37 +0100
Message-Id: <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Chris Mason"
 <mason@kernel.org>, "Jan Kara" <jack@suse.cz>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Chuck Lever" <cel@kernel.org>, "Darrick J . Wong"
 <djwong@kernel.org>, "Sean Smith" <defendthedisabled@gmail.com>, "Andrey
 Albershteyn" <aalbersh@kernel.org>, "Pedro Falcato" <pfalcato@suse.de>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 <linux-btrfs@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <20261101015551.786044-2-koray.fra@gmail.com>
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>

--e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
> On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> w=
rote:
>>
>> Add provenance time (ptime), indicating the time when a file or
>> directory was created. This is user-settable via file_setattr() and
>> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>>
>> The semantics of when to preserve this new timestamp are the same as
>> mtime, the idea being that there is a correspondence like this:
>>
>> ctime <-> btime
>> mtime <-> ptime
>>
>> so every operation (copying, moving, ...) that currently preserves mtime
>> should also preserve ptime.
>>
>> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
>> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
>> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
>> allow ptime to be used with the file_setattr()/file_getattr() syscalls.
>>
>> [ This is a re-implementation of the initial patch[1] by Sean Smith
>>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
>>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
>>   utimensat() ]
>>
>> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gma=
il.com
>> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
>>  fs/stat.c                 |  2 ++
>>  include/linux/fileattr.h  |  5 +++++
>>  include/linux/stat.h      |  1 +
>>  include/uapi/linux/fs.h   |  8 +++++++-
>>  include/uapi/linux/stat.h |  7 ++++++-
>>  6 files changed, 52 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/file_attr.c b/fs/file_attr.c
>> index 833e03810b24..c0645cb22bf3 100644
>> --- a/fs/file_attr.c
>> +++ b/fs/file_attr.c
>> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>>                                   struct file_attr *fattr)
>>  {
>> -       __u32 mask =3D FS_XFLAGS_MASK;
>> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>>
>>         memset(fattr, 0, sizeof(struct file_attr));
>>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
>> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct file_=
kattr *fa,
>>         fattr->fa_nextents =3D fa->fsx_nextents;
>>         fattr->fa_projid =3D fa->fsx_projid;
>>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
>> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
>> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>>  }
>>
>>  /**
>> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>>                                  struct file_kattr *fa)
>>  {
>> -       __u64 mask =3D FS_XFLAGS_MASK;
>> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>
> That is not the correct way to extend this API.
> This fixed mask was added as a placeholder for
> "We intend to add support for more xflags to selective filesystems":
> https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il@g=
mail.com/
>
> Please see this POC patch for filesystems to publish their supported
> xflags mask:
> https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il@g=
mail.com/

Thanks, I did not think of adding a dynamic mask like that, I will look
into it and implement it for v4.

> This will allow callers of file_getattr() to know if the filesystem
> supports ptime
> without trying to set it and failing.

So after adding fsx_xflags_mask to file_kattr, every filesystem would
populate fsx_xflags_mask with all the returned (=3D=3D supported) FS_XFLAG_=
*
in their own specific .fileattr_get, correct?

Best,
koraynilay

> Thanks,
> Amir.

--e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCaunB4QAKCRA0bnTtJTDo
OGlqAP9FN1O36Vljpv9qu+GHoMq4dpgT5l0jYNkHeq3xwaeLZQEAp8imIPg1c77f
Nx6+7PN4i6jMGvOBbnpA+XfhiQmdEgs=
=mk5d
-----END PGP SIGNATURE-----

--e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3--
