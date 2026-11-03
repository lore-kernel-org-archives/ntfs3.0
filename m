Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726874;
	b=H+7JIUgkqSdWjVyFWWB1mCCeZMRmpe7VXhDUpdVmUF+I49weMC7OJ33tv7fBnbvFC/B9
	 ysfi+MJdYhZ/PcnEdp4Yg37RwAkawy53lWj7Xqlh5AefSmiC9M687XGwU7xFYD+y5cgFT
	 pQk5YaeWXOSJMlG6TL6k+9Sdv9kYU/F3uqqdtZnLsVVkDJuzLFjKk3WJ3Yv0nNLHtPZqH
	 gnlZd9jrQ+cj2YvZj3SxiaTPYBKzGxcpudk+65PTK+7AWPUCk06a2eYCVSVj60JlRmJ5l
	 Yj7nRp2FwUxHOs79FdoFX0LaEiub7r6JurX7re4YzwmRbe7GzdFy/1O1SQvv/0Tg0bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=C7J2xwMhxMcLYQn+HgHArsLVIUvcNtC3sZDiMzWGQG0=;
	b=oKMEcF2PAyOocEDwObL6wnde/zXpgF0oFx/OSHqc4yVwP+oTxJqrnecqgtEeZeY4VtzC
	 +dtUIjpdxLrlXZly6bFEIsNYjyeENbJncJggAPGeutQdMHDnnjR4T8jHtuWVPWrh966aD
	 J5gO+75Nxv2Ubam1oirxTcEJERmiqFRTPwUPqZlUzlkKvl7Cml8tTsvXKla5pkleNVPs1
	 Qj0UIRMhvSE+YfCtfwFDwBoyG/KF7fe/TubsYXVxxPZl8efqqN3KNENggjxJdavG0bARg
	 DpLzZTWuVil/CXNBR8Enq43WyFHZ0/Yrqq644ISRuvh5pd1dess8VcBHVpWQbW5M33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMcfU2Hy;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F3606A328
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 17:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD0F3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMcfU2Hy
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e4831c028so3912016f8f.0
        for <ntfs3@lists.linux.dev>; Tue, 03 Nov 2026 09:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726872; x=1794331672; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C7J2xwMhxMcLYQn+HgHArsLVIUvcNtC3sZDiMzWGQG0=;
        b=JMcfU2HyiYd97mrt9qKuKs9c5fKdIdoNeIYUHBpodRRiEA/hbzj4KKhPMEvoQa5BBx
         sDbPIP6BQ3eGX9ncyH8AflEV3XzfGLBYp48Cqa8H2O+I7SutwrwadCzlwv+u9+7gbuqu
         5/ggGKR2IrcayVSJMtQyVAer7AhCsjdi8nUfD97bryCQbXkGKRElxhfMFeoD08D5QBcY
         efBGbAd4Tos3pSTrAaOg+qh0bL7rYP0yNMr6DfqAHAqcS3U9dWyFCHtTLN89UNvVSMBP
         tLUeXY77/9AocNh6go01iqVI5XbPBnrZa4/vpdt4nEFssgo0WZuaLnUbUxoergxHTLBc
         CU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726872; x=1794331672;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C7J2xwMhxMcLYQn+HgHArsLVIUvcNtC3sZDiMzWGQG0=;
        b=MLh5fGNTbaz7+0omui627JRbLzCE0yIETQ9ReggyGWuNtI6PtbtIuHRfuWuH6oGF74
         w+YWkkK/kcgf8pdIwWYT4rjc/my4g7NYBdvpNvR28q42vnz+BwQnGjldDQ4I2pO71//u
         x7T5GTuMdj5xvKDxBXaCnPQi8Hvo7ZrLpHJfnigFTs4xBCmSqonciEG7HqRIZB4vUzWL
         MNZEZpU8Al4a/dFh/Vn/k0I4dHBQifRXUf0cUhZtf+/0N0ZuJUSTqK2d12f3QhjDaS00
         NvFbS5T9m07ecvXdE3lEzxvqeu8+T8AKoeUb23Cmb7V66hjPBHRU6MBPt9zeNglsgoup
         3pdg==
X-Forwarded-Encrypted: i=1; AKwUvByYfqmJvHv1lhC1/eB+/haktJomTvUmlQ+ShAFgfEtousF4rk1E3Q8mqTd8mm+Wfow56kijLw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8tfAwf5VTBpdthual5m8gT0aQ0At52ZUYkSGi03UqWvDHYP5ee
	tjuK8Rx6T+dmFPjfQfAL82fizZiriQAtA6HElhIVoRlPE4MNaGqWEa3T
X-Gm-Gg: AYBFou1Tjh4IMO+9lOD7mbyrINaaDaVZJMjNknXkV5x10/OmZlhxw9HXZNKO2tLvliX
	q4rNShNVIZIZjqhFfE8VuF5o4xCHMpLDkJZNBs/ieQnNyx8qVOnF+tWZMZ5NLhdRgjHFNJPNHQ1
	DitFQCpzZkYZP5K5eyqzumVvAmzV6MgjCJuvzenBH8Kmex4zj7An+uDWgJiK/yESGFJnWA8UVsb
	CUJmuq37yXUtEn0x95xSsz2NKO/IGt8Fy195XHT+PfOCHVlafeMgRvw3dvmHIIjPJy4ODwzk7Q2
	1mKJLJbv3ZS2k66xxVBP55Jy1KpK6WfIyn3cMa5LbhENbMs9C+968szfLpCvkYOfxfXQlu+DDRL
	f59++X8rSLzRfAVHmM54eE7RF7gBitDEyivHtTdr07wZbH+GaeIicu+sOroEerCOF6dtQf29izL
	PB+mZVu9c2Pm3l/rcUiE66jaWTzfnbat3f7hTtwReICBgEGjP+D40pGGf5iTiMP5u1l+pwihfdG
	EzhWxUAGeSezWOGYGdRWU/UdP5DO/5DWiWktRVAZHnbkLndxkQwfl264K83uiWpTkqaabMqn4gu
	/MI5VwingpRefa0PWhY6vzqkadvilrn3ZPd2DGLC767+Cg==
X-Received: by 2002:a05:6000:26c8:b0:48e:10a7:40f with SMTP id ffacd0b85a97d-48e6e302612mr29233891f8f.17.1793726872045;
        Tue, 03 Nov 2026 09:27:52 -0800 (PST)
Received: from localhost ([151.60.201.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm25764477f8f.9.2026.11.03.09.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:27:50 -0800 (PST)
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
 boundary=7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 18:27:48 +0100
Message-Id: <DMLR3VF6HEMW.34XWXBBJLV9A3@gmail.com>
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
 <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
 <CAOQ4uxiTS-QT7y1avNSasJSffkt2uRNkdrb2_GrK7kJ82-MoXw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiTS-QT7y1avNSasJSffkt2uRNkdrb2_GrK7kJ82-MoXw@mail.gmail.com>

--7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 4:14 PM CET, Amir Goldstein wrote:
> On Tue, Nov 3, 2026 at 12:13=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
>> >>
>> >> Add provenance time (ptime), indicating the time when a file or
>> >> directory was created. This is user-settable via file_setattr() and
>> >> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>> >>
>> >> The semantics of when to preserve this new timestamp are the same as
>> >> mtime, the idea being that there is a correspondence like this:
>> >>
>> >> ctime <-> btime
>> >> mtime <-> ptime
>> >>
>> >> so every operation (copying, moving, ...) that currently preserves mt=
ime
>> >> should also preserve ptime.
>> >>
>> >> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
>> >> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
>> >> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr()=
 to
>> >> allow ptime to be used with the file_setattr()/file_getattr() syscall=
s.
>> >>
>> >> [ This is a re-implementation of the initial patch[1] by Sean Smith
>> >>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick=
 J.
>> >>   Wong <djwong@kernel.org> of using file_setattr() instead of updatin=
g
>> >>   utimensat() ]
>> >>
>> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@=
gmail.com
>> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>> >>
>> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> >> ---
>> >>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
>> >>  fs/stat.c                 |  2 ++
>> >>  include/linux/fileattr.h  |  5 +++++
>> >>  include/linux/stat.h      |  1 +
>> >>  include/uapi/linux/fs.h   |  8 +++++++-
>> >>  include/uapi/linux/stat.h |  7 ++++++-
>> >>  6 files changed, 52 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
>> >> index 833e03810b24..c0645cb22bf3 100644
>> >> --- a/fs/file_attr.c
>> >> +++ b/fs/file_attr.c
>> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>> >>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>> >>                                   struct file_attr *fattr)
>> >>  {
>> >> -       __u32 mask =3D FS_XFLAGS_MASK;
>> >> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>> >>
>> >>         memset(fattr, 0, sizeof(struct file_attr));
>> >>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
>> >> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct fi=
le_kattr *fa,
>> >>         fattr->fa_nextents =3D fa->fsx_nextents;
>> >>         fattr->fa_projid =3D fa->fsx_projid;
>> >>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
>> >> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
>> >> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>> >>  }
>> >>
>> >>  /**
>> >> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>> >>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>> >>                                  struct file_kattr *fa)
>> >>  {
>> >> -       __u64 mask =3D FS_XFLAGS_MASK;
>> >> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>> >
>> > That is not the correct way to extend this API.
>> > This fixed mask was added as a placeholder for
>> > "We intend to add support for more xflags to selective filesystems":
>> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73i=
l@gmail.com/
>> >
>> > Please see this POC patch for filesystems to publish their supported
>> > xflags mask:
>> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73i=
l@gmail.com/
>>
>> Thanks, I did not think of adding a dynamic mask like that, I will look
>> into it and implement it for v4.
>>
>> > This will allow callers of file_getattr() to know if the filesystem
>> > supports ptime
>> > without trying to set it and failing.
>>
>> So after adding fsx_xflags_mask to file_kattr, every filesystem would
>> populate fsx_xflags_mask with all the returned (=3D=3D supported) FS_XFL=
AG_*
>> in their own specific .fileattr_get, correct?
>
> Not all filesystems. Just the ones that wish to extend the constant
> legacy FS_XFLAGS_MASK.
> So just the ones that you change to support XFLAGS_PTIME

Ah ok yeah that makes more sense, so like the fileattr_has_fsx_mask()
(that checks if fa has fsx, ignoring the suppored/allowed ones specified
as second arg) that I added, but in the opposite way: "I advertise only
the extra fsx (so only 0 or FS_XFLAG_PTIME rn) that I support".

Thanks,
koraynilay

> Thanks,
> Amir.



--7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCauoZlAAKCRA0bnTtJTDo
OBnVAP9J2oe3Q/z4+CIvNcDvvOtFdyX98jyvuqmiHKySHzb6XAD+N8QVNASksB7a
or/C2uBDgyHnZr93FRknmz2MMzGnvwQ=
=0YAO
-----END PGP SIGNATURE-----

--7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642--
