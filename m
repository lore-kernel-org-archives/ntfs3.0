Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019816;
	b=sgs/xN0tOECF4/0G5uOtlB3rTSEVsaJYS2eloatxo/HUVbdjo4MCz3+f6zyhGcosvHhw
	 lhqNTuCxoZrk7GlwuqT1RHfuJ62+2/6hrcR3hZcBe+F+pKGkVMMpD1kwRmVKU6Yjf8nFZ
	 qZZO/orc+VVks4UxREEJDxhiXsoRNsr1nE9+MiiwHkjnD8l7OL1gi1QL0x4lXa7sdr/QC
	 snX8VhFXvvAq5SZQP0/NNUWlCvlqOevnXX7CK5ajAVbi6gPct3dljUsVXtSNuSWfORfwk
	 lYP5WU8nBZaV8qy2q/19dmPNkE7SENTsvEMONeB5EL4+uwLDuNfi/9G6G6psJk6lJHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
	b=lOl2LiV0Wgo6z73669NSzz+5s/wbGnbk80l1HF8bXGHGv7Ddm/AKykOn+y7ab/niD4KG
	 li+JvOPPgWrcVd3y6JcsDGHwJlhYFvddEel1SpFLh3oKwdCxMB9VvuM57jv602+w0h2Zj
	 Xe0Mqtm00Eh8qqptqmXJYO5l6pTS0ikaGpY/cg60W8+IPo/6YMpbtnYnHPwQbJYsyTxCd
	 9dLEx2Zyc6Y+NqJxWL4rKBbvcBHaeYiJYJ8so7BbsHtmvgi9PDinQYCFRCrWOhARQmpRt
	 NTmzPhanynIsmi9vOEoWZPgtG8xM5iKNbqx3871aOwg43wIsz4rVIjGhcRFO7u+95nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGIltvWq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E2606A331
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 16:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374E2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGIltvWq
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2097453a12.1
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 08:36:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795019814; cv=none;
        d=google.com; s=arc-20260327;
        b=N31Y2+ymDGKwQh9dZJWdLe9TCbzq5A38IKLJ6iDjK3vsLL8aXa9Ctiyi59Kn0Wszxw
         O4Ow/D53QsYQI5t6hnw3R5IaUZLstuWhOEiTVL5jc81Mg88pMZTC/7o1zCYr19f0sL/e
         EkiVPOLcqEjYpsYY6gh4IIZOT7Tpe1W6msZga2e9DNp7DDXS2SMssTFhGYIILP182J9P
         sijZhuuv3maBDVMRbtqJLj/y3zamNyIZ81dayxDlHcWGYleguRD+1drCwIPpam7u/EO5
         X3BUue57ZeaIJhO8eXKZvw2OKWCaqKlNX40U3OlWrpjI0cuS9luHdoyAA+QVnLfaPSRk
         9Frw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        fh=jgsEJaOu9or+J5KhFOXfcbFT4ft9HFX+O3YLVpHXWIk=;
        b=U05kXzZmRK2/IS/Z/cGNnLNUuvqGcUpJOI478fViHn4TsLoQzYWf1O+HeRQIx01pqs
         O/GZKGHjMCbprO6z36LowDXxDSRf40U7uJ52WODvrU0kg2RLQ+mttl/98kp0ZCBI6EdZ
         /1FJmKf7QDReM7aNY3CTB1+yjIvUEvhE5rJZd19r3vq2eKRG7gLup0m/RvX0p190EFYl
         MKB+jFDYWoFuKj5COZQIcdyMi3CpRJ3SIk8uV7yrRXuDK9UJlu249PBud8p1MXYKVCax
         OPfdoSB1b3QYrWW1p+5bb+rcB8r/xqujGJ7s8Ie16DjkR1ZyG8VsiDi4wXaZfJIJYlhA
         gS5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795019814; x=1795624614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        b=EGIltvWqCmxYgFhyPzsPFdRCXAmOaROmzetW+p9/cX/3lgCsww5zpjEcwMlGSVq/IQ
         t3LeeXJTu+CYv3R5KMLrUgCvpvrvCdU2EfT2ZLq0bkoexomIYOjuwaSS2PW9jfv1NUnM
         ZbUq6xMEgRJ6SV18ulr7u+NY8dqc7i/OuUo4oZdjM3FuEPrsWkVt3iWoK8twJVCDrA+4
         +vhEk7Irg77D0kFEt3mSlMlGQP4QyphQLPNGAH+6HSghFRERmrRdFYroGZcKCp1gsfRp
         fUiXAsBkngsQ87KQOtFlOEEZtQBPWw47T36eTvK3UmnxejGsBQeYPp+kzg0GcmAkrueJ
         /g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019814; x=1795624614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        b=lkRkAFJqN3nSbFah/hblfSDJ9S4sfI6YU3WRk6ZmuwxcNcbvBtNKLe7MScWCAvBUC1
         fhW37saegswFpy9faWcKlfERkY6QheY1xsvi3OzcmlC+hJR+bh8TdtSFdM7DLKe0YETR
         3Ibg6jNKrIFsVYrEM1WC37QIsRLcWScJ7koEjykQgVhFdgM/MkGOxHfoxs95uBdkUh7+
         4Iuief2C+lB2ig627UUkd78rS/IcG5jBJJQrT3vjlREdqsA9XRX8sQrXvFMdDNOUL/iA
         KtHItM+7bFMRb3SJuri8FpxRi5fC7DMr35THg9prRDa3PsMChWZ5bigLD8wk24C4zsvf
         zW2A==
X-Forwarded-Encrypted: i=1; AL+hErHj2iFDLD2Z4thTa9qMpvaJxJp3RyX8L0O5+5KAwDuunppLPdPamwff28ILMOw+SV3o9/4u4w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/MzeWX4sMSMNx5WZsBwEOYQK5RfKQtoyJv7C8QRFd1Lbj/e5GO
	yv3c3RchlczPQNHtBiu9eOZ9DQpPI7th4GLK21ven0eBMmrslGrhqf9tz0miaRQBxxx5E4BPy48
	rbyqBMZ0w/n8elSPh7RV/djrWSDrDLbY=
X-Gm-Gg: AYBFou06ajnbB2+MqScg+L4BbKeYle5TAM+h0gkiQJsLEqt4H29CGA3x6np1IBY9nvZ
	odG4Pz2w05DATOIwBhtWmhW/KJTgx9dGdf73ofasYs3PYKB2JYibtJFFLxYNaSkq20JDMW7INVu
	jqPhTs1ge2GgTzRpFVO0IEjqAYO0S7Rr74KOqoLoYKF5/WHbKeaN5EnT8allzzcFjk5OQCHbTKw
	XZ/WeiaXhj5BkDo8S+gfdyJ9xv0qHSFWYK7q3D9ZXd96VdRnW3buyrLTGWZHSOrKd6S094GmvY6
	BqkXhwH0OWcRKwd5HK1GLIUy578ZDXhJI5ax7u/cIhVGmVA8OmQrF9rn193r/nRtd9moQ+wnv6L
	Qv0jzs4GZElzAfj3x7FejwnPB53A9rFIjuiVWodeOlSRrgm8or0EsETkaCo7WYKf7PuZXUw==
X-Received: by 2002:a05:6402:c711:20b0:6b7:b12e:1638 with SMTP id
 4fb4d7f45d1cf-6b887effc26mr1999145a12.37.1795019814317; Wed, 18 Nov 2026
 08:36:54 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-8-koray.fra@gmail.com>
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com> <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
 <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com>
In-Reply-To: <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 17:36:41 +0100
X-Gm-Features: AclHuK_Wot5qcfi8_9CAebWCtd31KyKZ5gW_T2w6JAANm_7TsCfaaSyfxQBsTLM
Message-ID: <CAOQ4uxjme9sJ5LGNDnP6rEKZLTJzX_ZdcMohgu2iLULK96GPOA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
To: Chuck Lever <cel@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Wed, Nov 18, 2026, at 2:44 AM, Amir Goldstein wrote:
> > On Tue, Nov 17, 2026 at 11:02=E2=80=AFPM Chuck Lever <cel@kernel.org> w=
rote:
> >>
> >>
> >>
> >> On Sun, Nov 15, 2026, at 1:03 PM, koraynilay wrote:
> >> > Implement provenance time (ptime) in NFSD, as introduced in a
> >> > previous commit ("vfs: add provenance time (ptime)").
> >> >
> >> > Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
> >> > CREATE, OPEN and SETATTR compounds.
> >> >
> >> > If the underlying filesystem supports it, use __vfs_fileattr_set_loc=
ked()
> >> > to set it, returning -EOPNOTSUPP in case it's not supported (i.e. wh=
en
> >> > __vfs_fileattr_set_locked() returns -ENOIOCTLCMD).
> >> >
> >> > When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
> >> > STATX_BTIME, preferring ptime over btime if available, and advertise
> >> > FATTR4_TIME_CREATE support if either ptime or btime is available.
> >> >
> >> > Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> >> > Signed-off-by: koraynilay <koray.fra@gmail.com>
> >>
> >> > @@ -3646,7 +3649,14 @@ static __be32
> >> > nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
> >> >  static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xd=
r,
> >> >                                             const struct nfsd4_fattr=
_args *args)
> >> >  {
> >> > -     return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
> >> > +     const struct timespec64 *ts;
> >> > +
> >> > +     if (args->stat.result_mask & STATX_PTIME)
> >> > +             ts =3D &args->stat.ptime;
> >> > +     else
> >> > +             ts =3D &args->stat.btime;
> >> > +
> >> > +     return nfsd4_encode_nfstime4(xdr, ts);
> >> >  }
> >>
> >> I have trouble with this approach.
> >>
> >> We've already established that, for the Linux in-kernel NFS server
> >> implementation, FATTR4_TIME_CREATE reports a file's birth time and
> >> does not permit NFS clients to modify that.
> >>
> >> After this patch is applied, the server reports the ptime instead
> >> of the btime on some filesystems but not others.
> >
> > In other words, for some server filesystems FATTR4_TIME_CREATE is
> > settable and for others it is not.
> >
> > Isn't the NFSv4 protocol equipt to deal with this complexity?
>
> Not a question of whether NFSv4 _can_ do it. It's whether it _should_
> and whether opaquely choosing a settable vs. an immutable timestamp
> on the server is the right design.
>
>
> >> Essentially this changes the semantics of existing files that have
> >> a btime set -- technically that's a regression.
> >
> > I fail to see in what situation this is a regression. Please explain.
>
> Any consumer that depends on btime being read-only is now screwed.
>

Who is the consumer in this context?
An NFS client?

Can't an NFS client be connected to another NFS server
implementation which does allow this?

I can't wrap my head around the problem.

Thanks,
Amir.
