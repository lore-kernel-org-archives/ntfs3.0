Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010320;
	b=e9qrCFu/HJ7kfrQfnBM6JlyOOxYjrWZkuMZ1zGQbT0/F6rbdFP5fsKl7ZlNwMLC3TRWr
	 0nn11Ow0sNHXFEmMyc7+hWpaWEZFVcc6xzAGDRXhzVRT/MSQLC7MuXBm8+yTj3J+O5f+n
	 /+Ii0qKPsrnJ+O0CIQadtUHoNCF1Ga1EW3w3YTfA2Fu4tkBz4TfVUB0L/qznb4JBcNiB6
	 YAa5tC3intyRfhFa36/g8oZlaOT9hUitkKdwP9IKCjaWpMFdXl91tZqZ+/exQyJQkQ+D9
	 Z8z9Y3ismoPNq3qLjhWiM0y7dYYtrafq8BRXrZJyjFgU8Cax++PEPFmubwx+AoapRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=B2jYOWmzwjsgVi7kT5RL3gJi2lgucpYf3eGU3pQCN3Q=;
	b=fRsBb3pB5D9C27HXa0QgNd9gUaNxKRu03zG78O/9JPy6KEgApQzceGn4RsYdmd77e4GH
	 i+NFRGTXAFOIAY/uPKrudA9QXGiOVCHzNa+oqM/mfw8A1curfTzEaGc60bq5a5g2a4/rq
	 JCnQ9Frghkx8lzevB/dpbfAn6h1GuZCsGNKblVseBaq2gwCkAMjiI9k08gXSfGL5afTox
	 PQ/79/8PWIjVKat/81+KrJEEnAo5h0ufH6V1khzMiG8yvuPmmG/maA7qg91QsFRNbu6JK
	 BzjEGwYreClrwjbV9+GHB+NzUf7V/t0RP7ydmBegAb46lfFWyssyLqavamu+xhaLhpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsdX4ChF;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F4606A320
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 13:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsdX4ChF
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so13946215e9.1
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 05:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010319; x=1795615119; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B2jYOWmzwjsgVi7kT5RL3gJi2lgucpYf3eGU3pQCN3Q=;
        b=YsdX4ChFViiHPP73XCSL3BVbstVus3It67RhGaSkKrNOIn2p+5HKCjRsEQ+5ZBw8Vf
         mLyS/dGR/0c/ulRwGtG1pg3+sbTtTPEN/zCe0Y3Ml2XyiSxZK42V6hLpuLcOl43a3Mgi
         /xzg5VLwIZ3kzP7R5cN1pKUZ4stJPapvxfWRxZJBK+/iyIn9DKBmDhakdHQD/UTSV/fh
         hZvr4up1DCmxxoGiJV+hbaf/Kn1lZuEg7KXqwiB9/ZKBrzkHLvnKL+WJpJYXaz+RWXkw
         Uz2ChnMtIu2SsBVuiwb+28MMTelp3EJay7tx1491eJxx0vlvbal5GcdojVXkAnbKU4al
         Z0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010319; x=1795615119;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B2jYOWmzwjsgVi7kT5RL3gJi2lgucpYf3eGU3pQCN3Q=;
        b=RH9p1FeH68aV0HoE5DPscHOAOyWrngfx2rogOiDKqCrYdqy/Ax9vDVgCv7jaagdfZ+
         Q64cUyOJuJLJh6nsuHoxE4SuLHUR/ux0PO0gM9bBmNZyudL3se9ThAttDfP/ZY9BWzUR
         ophoyFTr5reRNXSren9TWaujwEUTPoMqDYRvtl1C04zRjedz99Z1eZGUjaeAW2Iuq0St
         HfaOv0Hy5tRWPV348beoqj+Cv/olnK5ZUcmWOynFX73+qRbfxINyife2kkZjubtSKGW2
         NIbcSI5EwgrGoGug4grshA/7w3PsmJwgZonoAp6kHWyoFzV+OrNcDjcUJiOEnm+oc6pm
         CoSA==
X-Forwarded-Encrypted: i=1; AL+hErGsGzp5zA63wqGnEkgMsZ1hE5f0BgHg7ftExM301GgKmFgT/EPUPWkTik1Q5NWioelHEtaWdA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/KHXB86AsTP6B7saTUT1mNGpyMvq0XdnrM6X8r8RYRQhU4RzdZ
	w7kmj8bCQ/Kv4XmIf3A+mp9LjanxAxy3LzrKWLTEga1KYibpkdJRY6HP
X-Gm-Gg: AYBFou0nqbP6jIOGHfxQ8twZ8FI9knxYtFnJhETZR3Lhuo/P6jt6HrIq3AHj/1Rypvz
	15U8x7lVj6k2L365RXdKevEMnpR7NLl1Zh6ActmhIRuvuHVhJuEoXLJ4MSasOJRvbztCeFQTPRP
	3zEzdeQjHgDkit/SGml6W5A1lfYNl6xIABr1arG1thx7vOfQ4AlPDg+XsTtS2GrlkRu2itqNWcj
	2H7ZN/BBQU2zkHyGefBVmtKnGVtsVpIOvVrnbJD13QBMOc4jEs4K4uqtIDGOcc+QdB3gNMI21yx
	9bwChqcOeP6ZebKMeEFWkdjkK01JVHOAUdW1UHrF3sbcWxD9BWYg1/CvyGDohnZe6v1a47WRXbp
	xuUQs5ZQBiDcE9eonhoux+qfUnRhX0eqzZq15DxMDwQnBltoDKRF2lQhbU2m0d+kjepe3HaPl3n
	s7lMGfzEpc5eKmTxiJ3TGJTmCZ39VV7q7OejKqYJd7NZIjnrlPv412aCksTV+1Ap4PO4W/9yTQh
	N9l1vaGjmAM0EVmxh6tfBUi4tF3AYAntS4TW0eK3pDI/Y0EnwrRUsMinPMQNRwsKVb+7z9nYEmf
	5e/Bvu9VNta5I0KPZabrDno4fwr1iBb8CO0lv5VzaUflPFFv+ZJLDg6rOfXl8fJQYHM=
X-Received: by 2002:a05:600c:34d6:b0:4ba:6d8:df8f with SMTP id 5b1f17b1804b1-4bb7da15196mr50793675e9.15.1795010318319;
        Wed, 18 Nov 2026 05:58:38 -0800 (PST)
Received: from localhost (mob-176-246-251-118.net.vodafone.it. [176.246.251.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm69860375e9.7.2026.11.18.05.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 05:58:36 -0800 (PST)
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
 boundary=0a24e72f90483e267e41af1f0c3186edfa555d565805a074438203cf0c8d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 14:58:28 +0100
Message-Id: <DMYE1RQIZMXD.2TCNYLFYQ45UY@gmail.com>
Cc: "Jeff Layton" <jlayton@kernel.org>, "David Sterba" <dsterba@suse.com>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Trond Myklebust"
 <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>, "Chuck Lever"
 <cel@kernel.org>, "Konstantin Komarov"
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
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <fc53ec55d315a4b96ec1e6f250ad3763f2189755.camel@kernel.org>
 <DMXXOPD9UDNP.2YP9ROMHFLM9E@gmail.com>
 <CAOQ4uxjcvAKTaGXO0=BpbtgoEPmN7GKieVbX1ZpZR38H1Z3j9g@mail.gmail.com>
 <DMY8FEXBRS0L.2X0W5NIFG56C7@gmail.com>
 <CAOQ4uxhTBm5bQ9eYdeRCr0MJjugLdBU7X_Y26ADWhG6HSEgKMg@mail.gmail.com>
In-Reply-To: <CAOQ4uxhTBm5bQ9eYdeRCr0MJjugLdBU7X_Y26ADWhG6HSEgKMg@mail.gmail.com>

--0a24e72f90483e267e41af1f0c3186edfa555d565805a074438203cf0c8d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 18, 2026 at 2:39 PM CET, Amir Goldstein wrote:
> On Wed, Nov 18, 2026 at 10:34=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
>>
>> On Wed Nov 18, 2026 at 9:14 AM CET, Amir Goldstein wrote:
>> > On Wed, Nov 18, 2026 at 2:09=E2=80=AFAM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> Hello and thanks for replying,
>> >>
>> >> On Wed Nov 18, 2026 at 12:53 AM CET, Jeff Layton wrote:
>> >> > On Sun, 2026-11-15 at 19:03 +0100, koraynilay wrote:
>> >> >> This is an initial implementation of a new timestamp to indicate t=
he
>> >> >> time when a file/directory was initially created.
>> >> >>
>> >> >> This patch series takes inspiration from the one by Sean Smith
>> >> >> <defendthedisabled@gmail.com> [1], but using
>> >> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
>> >> >> <djwong@kernel.org> in [2].
>> >> >>
>> >> >> The semantics of this new timestamp should be at least these:
>> >> >> - it should be the same as btime on a newly created file
>> >> >> - it's user-settable, so it can be preserved for backups, filesyst=
em
>> >> >>   conversions, archives and any similar operation
>> >> >> - it should be preserved every time mtime gets preserved
>> >> >>
>> >> >> and the correspondence with the other timestamps is as follows:
>> >> >>
>> >> >> ctime <-> btime
>> >> >> mtime <-> ptime
>> >> >>
>> >> >
>> >> > I'm not sure how to interpret the correspondence above.
>> >>
>> >>   |-----\_-----------------|-----------|
>> >>   |       \_      change/  |   birth/  |
>> >>   |         \_ modification|  creation |
>> >>   |           \------------|-----------|
>> >>   | inode time |   ctime   |   btime   |
>> >>   |------------|-----------|-----------|
>> >>   | file time  |   mtime   |   ptime   |
>> >>   |------------|-----------|-----------|
>> >>
>> >> ("file" as in "the concept of this file", I'd say "file content" but
>> >> that would be incorrect for symlinks)
>> >>
>> >> so ctime is "inode change time", btime is "inode birth/creation time"=
,
>> >> while mtime is "file content change/modification time" and ptime woul=
d
>> >> be "file content creation time" (same as Window's or MacOS's creation
>> >> time).
>> >>
>> >> Does this make more sense?
>> >>
>> >> >
>> >> >> Examples:
>> >> >> 1) a .zsh_history file created in 2019, then after a few years the=
 user
>> >> >>    decides to switch to another filesystem, copying the .zsh_histo=
ry to
>> >> >>    the new home, in that case btime would have the timestamp of th=
e copy
>> >> >>    and ptime would have the 2019 timestamp (just like mtime would =
have
>> >> >>    been preserved)
>> >> >> 2) a symlink created in 2020 from the home directory to a /path go=
ing
>> >> >>    through the same process as the .zsh_history, in this case it w=
ould
>> >> >>    also make sense to sync the ptime to the 2020 timestamp instead=
 of
>> >> >>    keeping only the btime (so the inode creation time).
>> >> >>
>> >> >> The proof-of-concept code (for testing) for stat(1) and cp(1) is
>> >> >> available at https://github.com/koraynilay/coreutils (master branc=
h)
>> >> >> (Note: these coreutils code changes are a prototype and won't be
>> >> >> submitted upstream as-is, but they work as expected in simple stat=
 and
>> >> >> cp -a/--preserve=3Dptime tests)
>> >> >>
>> >> >> Lastly, the name "provenance" and "ptime" are not final, I persona=
lly
>> >> >> don't have a strong opinion on any name, but while testing with st=
at(1)
>> >> >> I noticed that "Provenance" is definitely too long for the normal
>> >> >> output, so another option which would fit well is "Origin time",
>> >> >> abbreviated as "ntime" (OrigiN time) and not as "otime", as that w=
ould
>> >> >> conflict with btrfs' internal naming and create confusion.
>> >> >>
>> >> >> v2 changes:
>> >> >> - fix permission bypass leading to ptime update on immutable and
>> >> >>   append-only files (found by sashiko[3])
>> >> >> - normalize ptime timestamp as done in fs/attr.c:notify_change() (=
found
>> >> >>   by sashiko[3])
>> >> >> - fix wording in vfs patch to be like the cover-letter
>> >> >>
>> >> >> v3 changes:
>> >> >> - vfs: reject setting ptime with -EOPNOTSUPP on filesystems that d=
o not
>> >> >>   support it instead of silently ignoring it (found by sashiko[4])
>> >> >> - vfs: fix not being able to clear immutable and append-only on fi=
les
>> >> >>   with ptime, and allow updating immutable/append-only atomically =
along
>> >> >>   with ptime (found by sashiko[4])
>> >> >> - btrfs: validate on-disk ptime nanoseconds and reset to otime if
>> >> >>   invalid (found by sashiko[4])
>> >> >> - btrfs: avoid re-assigning ptime on unrelated chattr calls (found=
 by
>> >> >>   sashiko[4])
>> >> >> - add ntfs3 and exfat support as suggested by Amir Goldstein[5], b=
ut no
>> >> >>   vfat, smb, or nfs4 yet as they are a bit more complex
>> >> >> - move the introduction of fileattr_has_fsx_mask() from the btrfs =
patch
>> >> >>   to a standalone patch in the series
>> >> >> - btrfs: add fileattr_[gs]et to symlink and special file operation=
s
>> >> >>
>> >> >> v4 changes:
>> >> >> - vfs: implement fsx_xflags_mask as suggested by Amir Goldstein[6]=
;
>> >> >> - add SMB (ksmbd/cifs) and nfs (nfsd/nfs) support as requested in
>> >> >>   previous threads;
>> >> >>
>> >> >> Note:
>> >> >> to apply this patch 2 previous patches[7][8] from the ksmbd/cifs
>> >> >> subsystem are needed.
>> >> >>
>> >> >> New Question:
>> >> >> should I rename fileattr_has_fsx_mask() to something like
>> >> >> fileattr_has_unsupported_fsx() and keep its code as-is, or should =
I add
>> >> >> the fsx_xflags_mask & ~allowed check in it and keep the name as-is=
? (or
>> >> >> both?)
>> >> >>
>> >> >> Thanks.
>> >> >>
>> >> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabl=
ed@gmail.com
>> >> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>> >> >> [3]: https://sashiko.dev/#/patchset/20261027220532.736352-1-koray.=
fra%40gmail.com
>> >> >> [4]: https://sashiko.dev/#/patchset/20261028134728.294127-1-koray.=
fra%40gmail.com
>> >> >> [5]: https://lore.kernel.org/CAOQ4uxiuy0VwZj+3M-zRqQ49WTpHZpiaQ+6M=
Z8z8WdLjyQM_zA@mail.gmail.com/
>> >> >> [6]: https://lore.kernel.org/CAOQ4uxjtuTDT63vJdYaq+RHQEQFLTksp66e4=
6OMN99WhJz3SbA@mail.gmail.com/
>> >> >> [7]: https://lore.kernel.org/linux-cifs/20261112111637.184045-2-ko=
ray.fra@gmail.com/
>> >> >> [8]: https://lore.kernel.org/linux-cifs/20261115155308.415734-1-ko=
ray.fra@gmail.com/
>> >> >>
>> >> >>
>> >> >> koraynilay (10):
>> >> >>   vfs: add provenance time (ptime)
>> >> >>   vfs: add fileattr_has_fsx_mask()
>> >> >>   ntfs3: make crtime user-settable using ptime
>> >> >>   exfat: make crtime user-settable using ptime
>> >> >>   btrfs: add provenance time (ptime)
>> >> >>   vfs: add __vfs_fileattr_set_locked() for inode_lock()'d callers
>> >> >>   nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
>> >> >>   nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
>> >> >>   ksmbd: add provenance time (ptime) and map it to CreationTime
>> >> >>   cifs: add provenance time (ptime) and map it to SMB's CreationTi=
me
>> >> >>
>> >> >>  fs/btrfs/btrfs_inode.h          |   4 +
>> >> >>  fs/btrfs/delayed-inode.c        |   6 ++
>> >> >>  fs/btrfs/inode.c                |  29 +++++-
>> >> >>  fs/btrfs/ioctl.c                |  24 ++++-
>> >> >>  fs/btrfs/print-tree.c           |   1 +
>> >> >>  fs/btrfs/tree-log.c             |   3 +
>> >> >>  fs/exfat/exfat_fs.h             |   2 +
>> >> >>  fs/exfat/file.c                 |  42 ++++++++-
>> >> >>  fs/exfat/namei.c                |   1 +
>> >> >>  fs/file_attr.c                  | 156 ++++++++++++++++++++++++++-=
-----
>> >> >>  fs/nfs/inode.c                  |  27 +++++-
>> >> >>  fs/nfs/internal.h               |   2 +
>> >> >>  fs/nfs/nfs4proc.c               |  56 +++++++++++-
>> >> >>  fs/nfs/nfs4xdr.c                |  19 ++--
>> >> >>  fs/nfs/symlink.c                |   1 +
>> >> >>  fs/nfsd/nfs4proc.c              |   9 ++
>> >> >>  fs/nfsd/nfs4xdr.c               |  40 +++++---
>> >> >>  fs/nfsd/vfs.c                   |  17 ++++
>> >> >>  fs/nfsd/vfs.h                   |   4 +-
>> >> >>  fs/nfsd/xdr4.h                  |   3 +
>> >> >>  fs/ntfs3/file.c                 |  20 +++-
>> >> >>  fs/ntfs3/frecord.c              |   8 +-
>> >> >>  fs/smb/client/cifsfs.c          |   8 ++
>> >> >>  fs/smb/client/inode.c           |   7 +-
>> >> >>  fs/smb/client/ioctl.c           | 109 ++++++++++++++++------
>> >> >>  fs/smb/server/smb2pdu.c         |  37 +++++---
>> >> >>  fs/smb/server/vfs.c             |  43 ++++++++-
>> >> >>  fs/smb/server/vfs.h             |   1 +
>> >> >>  fs/stat.c                       |   2 +
>> >> >>  include/linux/fileattr.h        |  29 +++++-
>> >> >>  include/linux/nfs_xdr.h         |   3 +
>> >> >>  include/linux/stat.h            |   1 +
>> >> >>  include/uapi/linux/btrfs_tree.h |   3 +-
>> >> >>  include/uapi/linux/fs.h         |   9 +-
>> >> >>  include/uapi/linux/stat.h       |   7 +-
>> >> >>  35 files changed, 614 insertions(+), 119 deletions(-)
>> >> >>
>> >> >>
>> >> >> base-commit: 3bc1fb9c3b20cd478c83496ab16addecb401770d
>> >> >> prerequisite-patch-id: 049ae0eba275b5be35a238833107e0b251a55aa2
>> >> >> prerequisite-patch-id: 614f0bc9411391403d4e9702bafeb31b0ec04ec1
>> >> >> prerequisite-patch-id: ddf636b9d33d82ea206ce265d817371350bf8858
>> >> >
>> >> > I think this is going to be very hard to do properly, because the
>> >> > kernel can't really manage this on its own. Something in userland i=
s
>> >> > going to have to set this value if you want to update it to somethi=
ng
>> >> > other than the original inode instantiation time (aka btime).
>> >> >
>> >> > It really sounds like what you want is the ability to make the btim=
e
>> >> > settable. Personally I think the decision to forbid that was wrong-
>> >> > headed and that it should have been settable from userland from the
>> >> > beginning. Maybe we should just revisit that decision.
>> >>
>> >
>> > Frankly, I don't think this decision was made at all.
>> >
>> > There are only 2 types of filesystems in Linux today:
>> > 1. btime is constant (xfs, etx4, btrfs,...)
>> > 2. crtime is settable in principle but not via a standardized Linux
>> > API (ntfs, cifs, ...)
>> >
>> > AFAIK, btrfs in this series is the only filesystem which is going to
>> > have two deviated copies of btime and ptime.
>> > For all the rest, the deviation is artificial in statx.
>>
>> Well, my objective with this series would be having ptime just as
>> supported as a/c/m/btime, especially from userspace in the 90% of
>> setups,
>>
>
> This is not a realistic objective for the mid term IMO.

Yes, that would indeed be a long-term objective.
But thinking about it, it does make more sense to have a patch series
for an intial implementation and then future patches for the single
filesystems.

> Even if you did go through all the cruciating steps on adding on-disk
> ptime support for ext4/xfs/... old formatted filesystems may or may
> not be allowed to set the new inode field (per maintainer's decision)
> and the stable kernels will take a long time to get those changes,
> so userspace tools will not be able to assume support for ptime exists
> for a long while.
>
> Maybe 90% support is a realistic objective, depending on the
> time windows you set for this objective to manifest...

For 90+% support (like btime has) I have like 1/2 years in mind, but I
haven't thought about it too much.

> IMO the more realistic goal is to allow rsync/etc between the
> fs that already support ptime, for example between two smb mounts
> or within the same smb mount.

Fair.

>> > So the questions to ask are:
>> > 1. Do btrfs developers prefer to store a new settable ptime or
>> >     making otime/btime settable with this new API?
>> > 2. Will any other fs in the future want to store settable ptime along
>> >     side the legacy immutable btime?
>> >
>> > My take on these question is:
>> > - Personally I would love to see ptime support in xfs in the future an=
d would
>> >   willing to contribute to this work, because I have hard evidence fro=
m the
>> >   performance benefits that it brings to smb server workloads
>> > - Judging by past experience with i_version bump interpretation on xfs=
,
>> >   I find it hard to believe that xfs developer would agree to making t=
he
>> >   legacy btime settable
>>
>> so I guess for v5 or v6 I'll also draft a patch for at least ext4 and
>> xfs.
>
> I strongly advise you against this.
>
> That's a great way to block your own patch set indefinitely.
>
> Implementing ptime for ext4/xfs requires working with each of the
> maintainers not only on kernel but also on the userspace progs
> and has backward compat implications, which makes testing
> ever so much harder.
>
> You start with defining an API and implement it for the
> filesystems that already have storage for ptime.

Fair, that makes sense.

> You could include a new fs that didn't have storage for
> ptime (btrfs) if you are on the same page with the btrfs maintainers
> and have the userspace tools patches lined up for review as well.

Btrfs is where I would like it the most as that's the one I need it on,
so hopefully I can get it merged there.

> Otherwise, you will just be blocking your own patch set
> creating dependencies with other user space tools.

I do plan on personally adding support for ptime on at least the most
used userspace tools (+ the ones I use), and I was thinking 1/2 years
also considering this.

Thanks,
koraynilay

> Thanks,
> Amir.

--0a24e72f90483e267e41af1f0c3186edfa555d565805a074438203cf0c8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCav2vBAAKCRA0bnTtJTDo
OJMDAQDy4H/yOrMiNcWLu0cY8UiFnFC2yTCrRUx9CDjGAex/XwD/UtBGCMYtQdTT
gfVthJJlnCLhdT6McRQ6WQjXw8xHiQA=
=6eAZ
-----END PGP SIGNATURE-----

--0a24e72f90483e267e41af1f0c3186edfa555d565805a074438203cf0c8d--
