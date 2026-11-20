Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181642;
	b=sy7cacvuVbSQDEaQgN2bcPgMv8UbgqG7d5Ktu6pJ9viiQXUx5WsuYQFc42dagg9aJK0O
	 39rXir2g2jyRxh9UNK1qO4iNSkVa0l75vYnOd8ZfZDuEgNaCJvatDSgJLI+e8s9VwvE7o
	 zWGSbk1AWrZd40NpTv19xSY7yKKlpEilDFo1sPAIyTmGvr/xRh/ptru66XHpk3TCK/F5h
	 zWw2ELoI5VMYfYyiSWkQSlB7dlGtbYaVSbG0mh4kKqNkxoI8nhE1sdSADxai9Ps2yHwJW
	 RoYXQufU5nqfaAQeEXb8TdMqYC6zmr8xlGuKdeiO2vS517+WRTGCpLe29g0Y6iFxTxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To;
	bh=/tgGW37WPbOQT+N8dT1q60bLbw3ltn29ONzKHbalNio=;
	b=EF17+JxAcikcnHBk2Z8b78nxrQf8Fdd01oiWPVVA4Ru14tFFEQryeekaoKmqwxp/+rpU
	 d8DtcbTn21c8StHe/4xhI80GU8uAVRTVQia3zKtwSPNyMTCUs4BxCR62lZ2Q6x8tm3GlH
	 YJhNRDD/w5Npq+LxcRWL4nanZZfjC1/C4K+ntzs6OgkPszS5fsDkOVHijjaKfz2ahWBZ5
	 e4VAPXmzZTEcCrQq4Neg0PsNegfAvMf2TDkJP9yZU5KYBBf+65BZ3c2lZ6NWML7GqURa4
	 UAZw7pq/F8Ui0Xk61jLkhcD70yWIu1kZU1ogsxDvUNP9m2/e11PuSm9SmXUSfgu9UvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6SgGQtH;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E5606A330
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 13:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1E5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6SgGQtH
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso408547f8f.2
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181640; x=1795786440; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/tgGW37WPbOQT+N8dT1q60bLbw3ltn29ONzKHbalNio=;
        b=E6SgGQtHN34MFlZN3YSK/I9JaPuPQ/fspNGf/EPrQvCsZJZwBiz2S5BoTzodShkyB3
         HpHtyrzw33P+binStpZleX+LJMXfcfPGRkwfE/4tMmhPQ7n3KXXJNki3L40JnIR85dFg
         bBBuDPV6IogFarEJXA+ayiZiZI9oEMJM4JR/CAcXGa9ptLGRsQkPvdekk1NacP1Dw/58
         YmlWU0i5Wa0fymjTMbEoTWnJjU7h1gUlpiuG6oC5qe8VuW+hCJZVTV9HOeSFsh4fxaGt
         J3piTcDz0WMHDjL02uwWC++9PSLFTx6uIw+CjFT0ahfuPkE1XTKSg8dh2zr1XmGhWQfe
         XCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181640; x=1795786440;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/tgGW37WPbOQT+N8dT1q60bLbw3ltn29ONzKHbalNio=;
        b=xL6zfRujJFG21SvVhJDBKmrWRGObWeswcby7fxXMUAlmW0KGBI6emSthQOl5M9GH5n
         xbgrk/8UkVEV0e31MZPU8o6NzVgEROwTKUx4RcOiKJJB1o8T8ABfo9LPqdBocpA6h1DJ
         cetLulUOQZjoQ4A/YAzGQg/72RMshwBJWWgxPcIVhpdLjVbS621WPWOHdD5GT0TmthrF
         Xnt3swKQgxYQtvCVRvgEruHObOLLbgxiPPVkPGOPqS63008ZX9gy1pWv/hAuPDqhX2Td
         8cMMrhRZ2FoDSAu4yX+PoObSJoRd9XcrKLd7qpU+ywYjxsKFcq4XVABuGDX5QrMP1FBr
         PmcQ==
X-Forwarded-Encrypted: i=1; AL+hErHEXfzFKsFxeqoi1p6wVRxfWv0N8+58fOaHJUrArTFaY/cnBoT7m1we0z/GNbI49uGpQ2eP1Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8J0gWkLPWafpFpIuJncQfYOC27O5OaW9vy5l96h90N1MQ+J9WG
	pb1t0LheTjPuJzBLmnYYpV0u1SSXIgOu9vtsF3bXLjiAb33Ejd2gY7C1
X-Gm-Gg: AZFdTZfcGdv24L46dA9XIuU8YuA9BzImBkygllLUTe7c61CtRpU4EEy9GZKRi+zbE3h
	SbLA53D5hY8PnN+BiG1YxCZnQqfUTbneWz7z8s8zHU9Mc8PEuDiTHvmsZdOOn66NJELxCLT2lg8
	gG+q2fP8xma+cvJvKF1A5iQVR+OocVFNNluX7vz8HN6YC/BFl/hYSN/Zt/ueKiS4P8XL/u4JZq3
	95Myw2SXMbHmwsWURnnj+HY3gMLm7dCvFTxyFfYTqOe4AidilmpqzjyDOfMOp5KTqGMSCXw7/9R
	wqhjA+HRnhKXEj14ZyiuTTgQFN8ROtfIBf2SkH+ieAf0Zg7UepuPPHQZrgPqsyacUyk0nJrdjtd
	Y6rJTzrdeU97LQtLagIkOOqB0hI25Fzn05m/PBJjA1TxeDTAcjpu2jrkKgdrfTYilVKVbZVPYgZ
	bGeytwbposFTds4ff29V/YVum959zaRWBtVbSECC1EK5GYmvXmNOvlI/f+Xv5Wr4i7ZIHAxvXxm
	yZ8cYyKLFlSvz1lBKXJ2ZPewMFe9kTWYY6tgzn4KRTrrjinhYGJxN2pJtivasnyXUXMNDtW22dI
	mssUwqFY4EGIQa+b2oJkvunFrEyhFAGaaF0fJ1gP9Iqgx5GrnbKFbExlXtg1l+QL7xd6uQ==
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr4807067f8f.29.1795181639710;
        Fri, 20 Nov 2026 05:33:59 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm6332019f8f.24.2026.11.20.05.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:33:58 -0800 (PST)
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
 boundary=d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 14:33:56 +0100
Message-Id: <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via
 FATTR4_TIME_CREATE
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Namjae Jeon"
 <linkinjeon@kernel.org>, "Sungjong Seo" <sj1557.seo@samsung.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Trond Myklebust" <trondmy@kernel.org>, "Anna
 Schumaker" <anna@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff Layton"
 <jlayton@kernel.org>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Paulo Alcantara"
 <pc@manguebit.org>, "Chris Mason" <mason@kernel.org>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Jan Kara" <jack@suse.cz>, "NeilBrown"
 <neil@brown.name>, "Olga Kornievskaia" <okorniev@redhat.com>, "Dai Ngo"
 <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>,
 "Darrick J . Wong" <djwong@kernel.org>, "Sean Smith"
 <defendthedisabled@gmail.com>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 "Pedro Falcato" <pfalcato@suse.de>, =?utf-8?q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>, "Theodore Tso" <tytso@mit.edu>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com>
 <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>

--d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
> On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail.com>=
 wrote:
>>
>> On Thu Nov 19, 2026 at 7:06 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> Implement provenance time (ptime) in the NFS client, as introduced in=
 a
>> >> previous commit ("vfs: add provenance time (ptime)").
>> >> [...]
>> >>         if (do_update) {
>> >> @@ -1061,6 +1061,7 @@ int nfs_getattr(const struct mnt_idmap *idmap, =
const struct path *path,
>> >>         if (S_ISDIR(inode->i_mode))
>> >>                 stat->blksize =3D NFS_SERVER(inode)->dtsize;
>> >>         stat->btime =3D NFS_I(inode)->btime;
>> >> +       stat->ptime =3D NFS_I(inode)->btime;
>> >>
>> >
>> > As an example of what would be needed per the mutable btime proposal,
>> > adding stat->ptime and STATX_PTIME will not be needed...
>> >
>> >>         /* Special handling for STATX_DIOALIGN and STATX_DIO_READ_ALI=
GN
>> >>          * - NFS doesn't have DIO alignment constraints, avoid gettin=
g
>> >> @@ -1092,10 +1093,26 @@ int nfs_fileattr_get(struct dentry *dentry, s=
truct file_kattr *fa)
>> >>         }
>> >>         if (nfs_server_capable(inode, NFS_CAP_CASE_NONPRESERVING))
>> >>                 fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
>> >
>> > This would need:
>> >                   fa->fsx_xflags |=3D FS_XFLAG_CASEFOLD;
>> > +                fa->fsx_xflags_mask |=3D FS_XFLAG_CASEFOLD;
>> > +                fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASEFOLD;
>> > +                /* unlink other fs FS_CASEFOLD_FL is read-only */
>> (oh, s/unlink/unlike/?)
>
> Yeh :)
> It's a comment for you not for the code
>
>>
>> >                   fa->flags |=3D FS_CASEFOLD_FL;
>> With the new API and vfs helpers, this would need to get removed, as vfs
>> would already handle this for legacy ioctls, correct?
>>
>> >         }
>> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
>> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESERVING;
>> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRESERVI=
NG;
>> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn't
>> it *only* be in _ro_mask? (same for CASEFOLD)
>>
>
> Good question. Maybe
> I guess if you want to follow some percent
> FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
> but I think that exporting ro_mask and _mask is going to be easier and
> cleaner than rw_mask but not sure.

Hmm I asked that also because you said in the xfs shared extent thread:

> The advantage being that it makes the interface symmetric.
> User can alway setattr() with the buffer they got from getattr()
> and instead of randomly ignoring flags in set, the fsx_ro_mask
> along with fsx_mask defines the behavior exactly.

But by putting the ro flags in _mask too, a user would have to clean
them out or vfs will reject the call with -EINVAL/something else, since
in that case the vfs would see the user say "I want to change this [ro]
flag".

>> >> +       if (NFS_SERVER(inode)->fattr_valid & NFS_ATTR_FATTR_BTIME) {
>> >> +               fa->fsx_xflags |=3D FS_XFLAG_PTIME;
>> >> +               fa->fsx_xflags_mask |=3D FS_XFLAG_PTIME;
>> >> +               fa->fsx_ptime =3D NFS_I(inode)->btime;
>> >> +       }
>> >
>> > +               fa->fsx_xflags |=3D FS_XFLAG_BTIME;
>> > +               fa->fsx_xflags_mask |=3D FS_XFLAG_BTIME;
>> > +               fa->fsx_btime =3D NFS_I(inode)->btime;
>> >
>> > Fs with immutable btime could either not advertise the BTIME flag
>> > in xflags/xflags_mask or advertise the flag also in xflags_ro_mask.
>>
>> That makes sense.
>>
>> >>         return 0;
>> >>  }
>> >>  EXPORT_SYMBOL_GPL(nfs_fileattr_get);
>> >>
>> >> +int nfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *d=
entry,
>> >> [...]
>> >> +       if (!(server->fattr_valid & NFS_ATTR_FATTR_BTIME))
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >> +       if (fa->flags_valid)
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >> +       if (fileattr_has_fsx_mask(fa, NFS4_SUPPORTED_XFLAGS))
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >> +       if (fa->fsx_xflags_mask & ~NFS4_SUPPORTED_XFLAGS)
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >
>> > These two checks look semantically identical.
>> > I am not sure yet what you intention was with the
>> > fileattr_has_fsx_mask() helper - I know you had reservations about it
>> > but at least in this code, it doesn't look like it is needed at all.
>>
>> Eh, the name is not the best, but they aren't, _mask & check the _mask
>> field, has_fsx_mask checks the xflags field (which is why I added the
>> question of keeping its name as it is or changing it to
>> "fileattr_has_unsupported_fsx").
>> But I'm not even sure we still need this helper, so I may just drop it.
>>
>
> I don't care either way as long as the code reads fine.

Fair.

Thanks,
koraynilay

> Thanks,
> Amir.

--d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawBMRQAKCRA0bnTtJTDo
OAxdAQDZAHDxwrsYEK/NjLvhU9XZYKoNPOA+bHn/PxMRXWrsowEAkLcPoymguHvp
ICHPpc1SRc0TROj5o6iGwNAiGXHeGgo=
=NG+4
-----END PGP SIGNATURE-----

--d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5--
