Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191432;
	b=ZGNjvSgw4S9cWB6FqKwnum/UguauRk+/mba1H4e+DL5IeecrBvrz0yEVPTaeXYTLog41
	 15fn45ASNJr87g2k2mKuVEglhXFjOsbeIddySaAh8GcVASb4Tm+OywPxxu9NI41wwu53M
	 rOZZl6XC+vVzVv0nnuyLDTZ8LV6BHSCEHqJ7RklyB5JyhZ0squdVmkRkuzU3h77a/sprV
	 sqknZ1ND4Rws+wrAUFkE5E11aZw4z7MK2S+Zrm+uE8IaKUaLj0HellEdwZAOGgUgcJJyB
	 4ZoQz3/LEV/2XAlPKUG1Aa7qCn8gdRx4FKiH1FEbyfyD31xTd3RUQyaFLC6p7qg7viQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
	b=XALAIXWnT3OW+ZI7rVMCPXtOSBMckNy3RDF/g3zp9MM3jDdPaunApfIHlPYM7Ta0IdsN
	 Jrg+r3JjKM934chCcoT4umgTJl5NJBfaxWJ2QA4nrhBKTf3ajJPkp/cq8JVVZLlUZ2JYT
	 evVx1NvNSp/gDwnQwqbKaEXIOpZugBEmtIES1mqU7lDcgNWhjeixiTRo9/vdMx1K1CR5o
	 gvX3YhlRFhWHFN7GNPmbBdsqfSzJjQzVxQxF499hXuX9jBv2ftP4s7uRS1AyOyeox+R+E
	 aImz02AGh7Yksmt4Qy68kCJ3KEe5Fti2a3n8pTtENu0k15rJDwOI0b5W8EDkF/jlqWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzKK+KWG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228B5606A325
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 16:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228B5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzKK+KWG
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so1360157a12.0
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 08:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191430; cv=none;
        d=google.com; s=arc-20260327;
        b=oE1cJUdlpB+lCbtQ6DpgmDbCeb99uIyvNlHsFLAymAj9MsSS9j2NPqzkDpRIpEkAeL
         ybjZuhDwQySaDx0YPGZ4JaItWF/GKMt7xokNMuMXxBro8ZUZaHVedEuRYYylt6/Fp9UR
         wHIFs4mTnZfpVOMp54XNnKsCuXAaQpu/E15HXVUJk3sRfI0TjCbLrTV+8m5FPBTXdK34
         iIsGECFHN0ttvwk1V30ZsdQJTfJUCsO3fdMUghmCtWGEPUDJsrIlFLs2YC6L0qlsibUE
         XqAPldKGLNsuv+iLaipW0VaU818gsJP1kzDQqtnJhbxXNiEu0EpfrkM+x/aTZbLyDgbv
         aDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
        fh=1mPf3D2dMnzMKCEKZm73kgQ+WKFiHVUeRdzS+LbMuck=;
        b=rH+qjeQ9lGXdCFG2L+l93D6ptCdB06X1fJuk0uk6EMl0HThuUi3m90V8tDqvgP6gUc
         BdK6Oq/VYaBlp7TNmQZTi/LsgyrZVO0G4by8jRD3WdIPqaBpJE4wDnQn8Ptl3UX69G1K
         A9QUmU75By+j7mwXQvacW686R/wrysbBNCVDetZiAt0RIDDG6lTzDJ7ucDBRJ/dNUQZK
         BLigQHcLDJssIb1oxDGYeodCFSH9iCaNqmjlnFHwXS4iPmOPmpYMuDmuLAifpQ8eNInD
         wBJyLW+LAvyVwML1vfLWuM0YVKaGFR0kV6WDqPlIG4vHi0k6DHAjAUZoQEMMDSYuCbBU
         cjxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191430; x=1795796230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
        b=jzKK+KWGNQkZ8yNyFU4vHOpgDAG6myb+ZOSf66iXUce3Yi6Ed2tf2aE71euW+1c5YC
         mK+CnboYrgSQl9kHP+vpZRJw1PEcFjKO88tyFQXB7+kdADCTZsnB0L1jB2EsGlXE1dCE
         /laXqHPoBfDWB/AgJeM+LSC/XHZ6cUAWV693t5Msa62/EYP8qkNR3a6hdLIe9GC9WqMQ
         jXxeatAjw+aGv/M+C8qk9JwjnTUO3uD0zuPjuqQWcsNZueg4ecPC2AtdmqmdPY65o/o6
         WyRCs6Gbc4Ot63yVD4Q+Oq5RyEM5tTJCUZQWuxgWNYrgaPyKNva/Vi2jrzFySRQFKtdd
         s2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191430; x=1795796230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
        b=j6SrTs4FhJdHLZ9WTg3rkzyHMJXUXD/nhU4UyH/iiSUIQVHil4YW+CKlcPOdgpNOIS
         js8Vx9qyTjf1r5j6Op7YM9GBP1N3K82nPrCHkGW0CzdC90j9Fcgo51s8jaZ5u3z3YvPN
         B2OWtcWycr5ElQj1UCslBigeHdGnMmnBvEHudvylo2iwz9DD33Ve96LYPDacoZyFgAA/
         NcyL9S0H1IG1ZPc/o11FXYIKFvHJFglzc0cN0bC/ZfDNiEsY7Ur6Z822/t+ZBvYEJup2
         VUIlLRiNflYfGWfZsmRGHmuBSw+jRn6wQkioc9Rm/lFZuzWWUsc+dyTiz7RmirOyqvyV
         TJeQ==
X-Forwarded-Encrypted: i=1; AL+hErGwcNhcI87R9vmEPs+4+zEIDSn2uTKtMwcOBf3GKw+6fSisvgX8DYtgq8hTrbgoMsVRU+z8RA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Y/wrP5Q8QHwT+2Qy3krIjilrcF+FQH4O/AmAzfgIMhe8DHbws
	Vzfan+PAsmYa8whwYs62EXDAfqEkMjPiaTy0g11PQh1Ede2IbEOYfXoU49zoD3WKJW8R7PsJ3OR
	epiWOLOvH+kvlTbG88Cwwur+14mOqRXQ=
X-Gm-Gg: AZFdTZeAUbZcWxSW1Df7rlHxo9iJNi+Dx9Iw4nyn9l8asdg1LJyEQbw7jv8MEdjwbKE
	QgaP0EWJsNx2FhQS88xHbo3iWugCILKvsb7rvXeoL+vYmHWF2eaeRLZ8mSJozEgGoQsz0FgzNqd
	fgV//iVvHH6KFmvz5H8BgM+mwA9jIbqOMCZgvEsn22uS+db5HpxUSy7lQewopnsQ20Ibvuu36rW
	AQ5WV0WcPuEtDGgdNAM5fRbEQW1VNrgUmzN6aKH+elUPGDmlnBxh2qfjqXA7JyTsHCIwdT6Sy9R
	C6alUkihMgCsHwx+qmjJYVCQro/MZFVzsG6hQDUw1ZzAeveODms+2KknuY94i6wQ5/2CPM2nsF7
	MxArwC0d1T7ml96oVJafq1dcDyE3GMubXqiEKWDMGgqXQGMfxqPAITD1ZBOTYoc6HjRXAfQ==
X-Received: by 2002:a05:6402:3223:b0:6b8:5f08:931b with SMTP id
 4fb4d7f45d1cf-6ba37ea44b2mr2736007a12.26.1795191430236; Fri, 20 Nov 2026
 08:17:10 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com> <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
 <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com> <CAOQ4uxh+d-wNC0aWLEexPFz7zj=TZjLyu61kaEmwBx9_hKn2gg@mail.gmail.com>
 <DN0526U5C1RT.3AQRIHXPB86NS@gmail.com>
In-Reply-To: <DN0526U5C1RT.3AQRIHXPB86NS@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 17:16:57 +0100
X-Gm-Features: Aa3M54o4zCHXyRapvg8jSZ5VVJaxHz4N0ZrJOn4Hcu1m2DItc14K7Jop9PLrcPo
Message-ID: <CAOQ4uxjCN-ekd18R-soD8tkGFnXjK0S1VdSNhq9b3Ev6y8K9jQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
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
	linux-api@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:21=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Fri Nov 20, 2026 at 3:55 PM CET, Amir Goldstein wrote:
> > On Fri, Nov 20, 2026 at 2:34=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
> >> > On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail=
.com> wrote:
> >
> >> >> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING=
;
> >> >> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESER=
VING;
> >> >> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRE=
SERVING;
> >> >> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn'=
t
> >> >> it *only* be in _ro_mask? (same for CASEFOLD)
> >> >>
> >> >
> >> > Good question. Maybe
> >> > I guess if you want to follow some percent
> >> > FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
> >> > but I think that exporting ro_mask and _mask is going to be easier a=
nd
> >> > cleaner than rw_mask but not sure.
> >>
> >> Hmm I asked that also because you said in the xfs shared extent thread=
:
> >>
> >> > The advantage being that it makes the interface symmetric.
> >> > User can alway setattr() with the buffer they got from getattr()
> >> > and instead of randomly ignoring flags in set, the fsx_ro_mask
> >> > along with fsx_mask defines the behavior exactly.
> >>
> >> But by putting the ro flags in _mask too, a user would have to clean
> >> them out or vfs will reject the call with -EINVAL/something else, sinc=
e
> >> in that case the vfs would see the user say "I want to change this [ro=
]
> >> flag".
> >>
> >
> > That's just a matter of interpretation.
> >
> > You could say that if flag FS_XFLAG_CASENONPRESERVING
> > is in ro_mask then its value may not be modified and fs needs to
> > fail the set
>
> Yes, that's what I was thinking.
>
> > if the user given value is not a match to the current
> > kernel's value.
>
> Since this is a new API, I think it's fine to -EINVAL if it's in _mask
> anyway, even if the value is the same, no?
>

The question is only about when a flag is set in _ro_mask
and say that it is not in _rw_mask
what do you do with the value of this flag in _xflags?

You can simply ignore it, mask it out as  copy_fsxattr_to_user()
is doing today and this is probably the right choice.

But you could also take a more conservative approach
like ntfs_fileattr_set() in fs/ntfs/file.c:

        /* chattr passes the unchanged read-only flags back to us too. */
        if (NInoCompressed(ni) || NInoWofCompressed(ni))
                readonly |=3D FS_COMPR_FL;
        if (NInoEncrypted(ni))
                readonly |=3D FS_ENCRYPT_FL;
        if ((fa->flags ^ readonly) & (FS_COMPR_FL | FS_ENCRYPT_FL))
                return -EOPNOTSUPP;

This is stronger, because userspace can express:
set flag X while making sure the flag Y is not set

in this case xflags =3D X, xflags_rw_mask =3D X, xflags_ro_mask =3D Y

It does not have to mean that Y is a readonly attribute
the filesystem itself could set it in rw_mask, but when user
puts it in ro_mask its a verification_mask rather than an ignore_mask

In both interpretations (verify/ignore) the sequence:

    ret =3D get_fileattr(&fa)
    ret =3D set_fileattr(&fa)

should work fine most of the time, but if some rdonly flag
can flip between the two calls (e.g. FS_XFLAG_PREALLOC)
then the set call would fail and this is not the expectation
wrt the existing FS_XFLAG_RDONLY_MASK flags.

Thanks,
Amir.
