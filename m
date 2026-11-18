Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987856;
	b=dxiLTgdaw0hA6+//dLGWNxGn66RWUekID0H5qjEt/0tWkoG/mNA5a0EsoGPnw7oMxwVL
	 VBjku0fPm1DMAfEwztYiscZZu4xey5knVdsZD53tu2GmwrEUtCIj+FZlq7FmX/R82HpRB
	 GLP/TCfHZDn4rg0GCxZWx7gjY2VYxt4RZysNmaT5t8Zw3tEpYb3nJZfzfuRDXBONYBalp
	 TQKd0oul0qh2jVygfzdUthSKFcBQcMlu5YuGUe5l9juIW9qUWNNbZp617L3td8klSHB+o
	 5ufg3Vf/cw8DmaV38m+mpvdJWBEEJUA5tWhHysdQa9hOw6j0hTHJSjJ2MOtnVC3rs9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
	b=WrxmlxC/4uWNzKcH5H4xQ6+Gz5G9nyr+xugOoO3oAQ3NYpIq42kOv4Ys4Hv/KCMb/KzA
	 A5T8PK3fHch67VMTI6rH3/dgO7bebfjkZBZxlk17QZccAek+QcIQmjxFyo6In/e+91aWT
	 V31yoV+dVfhvPhSW+pc4sjA9ajxfKTvZMVkLDUrTEO9SXrMrgq9AepsoqEsmKM9BjYd8w
	 koOF9lPlRC8gIGKLBHemDYPoBfiTXNCPmTLV2YohDGEOq1mb5ZZSEYYBOUgL9LGR5jd6Z
	 6odRQNd7gdkHU/7HMJl5MnQhfDNCCwueom/yAN2nK0vir0CL9vv2I5Eq/jOXnU8lWRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFp+AUT7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2844606A339
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 07:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2844606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFp+AUT7
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5067a2411bso80385066b.2
        for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 23:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794987854; cv=none;
        d=google.com; s=arc-20260327;
        b=jbMjAKOnXfQpx3sgqtZBHNeo8q+zNLpsr+3IGY/AzKWpG/hX2MWyRa3KCJPhINs2nQ
         dPIXMuq4p3cAZxs9wc1fTlpHD9EFwEH/Jow2dHZb1SPDtt8nDQ+PKq2Wup6V00ck+TiJ
         wf4whGqn13sCPL8GgSi/rVORNOYw7fdGtvXzkD1VE9hHngbh4RnVd/lETDLLsVXIWoSJ
         LPlIMskbW2ah9ji0V+dkBBDoY+HeH8jYTVpJzAAua4xrsqjBJpF3iqLdMlapZhBHF6+o
         6MlWXorzPSSl0Pwc2QCx1q0ZCSGh+DXyKLitVA/cnUNyJAM2KxCwCyoe3E54+W9C1HlH
         Bntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        fh=B+7+VNnfzS3QnMPbJfVPaaG+eiNEiGgjcj6OVZWzCwI=;
        b=ncg0yZgEbJ3H1nOXmN03B0FI/y08rzUwXlfcQO3xW5zShP+swpsfB6OQhXs2D230Ak
         X62MbUr3Bbl/L5T9yrJsd5j59vFAfuRkGyU09Ny4QfNk0+IP5ik4xJD7V242cIUKN+BJ
         2juDuyf1ZopTLyQzmlCRv7kEvRpn+/GDwjk/SzTWDervdgsCpdmdv/eTv0RI++7cnSSv
         x8XPYN2Nmndx/4ryrxnHoxf98LqRHkF+ukALHI0kUlcIMMJocGdHl7uLGHXiX7OdN1Pw
         gP2qZGZ3xoucjGC7FN4Tkc6SBgUz3LEjJuEuGuiQ1BapWV34xuld4c76tDM+iieLWbLo
         gecg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794987854; x=1795592654; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        b=hFp+AUT7vN18dzhtpj1avJHh28veDgRORqZeh4N1Jj6HG1Urqh3+AbeDDGA4y/F6Gh
         ai2SCXyeXWykmIwbg8aeHEOM6bVBtH29XieXzieWpJFN2+qFg7noaVTponbshhbbRLRh
         Gr2yJNTcOV38SREKAGSD6TwLfqQ9i9CwEqV1fQnnJFZRL8q9cXsC29ds/YZWaAaQHtFr
         xDlJDU/feVPLIkM2NuoDPCV/hMFs6ei1iKZWUaRIBK0Ri9TZq4Fmz4hsTbdBVct7lgBA
         PIC2rbbyjoQLyTHD7wbhoLnSjBbNcrCBApEwjQwH75t5COMd7Zuc6BAjbjopyuV1JQD3
         iI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987854; x=1795592654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        b=eDsDFUmW/E+JnNeH5XqT42QRKgwUggoe9JbLe/KfBV1ZMirbUY9TjF8gj5Zor+epoZ
         87+INClwTmKPQLGULu2UXEm1q84JBhBNAMEghRgSpKhNRBTdGBaU1jtQ7JOfvGBq/3WX
         tCkX3KVFF4p1OH8FR8Ij3h8U3lkhv5I2SW6iAPtrwYGjbzuow8qorwmx2ZY8VZmWTXN5
         ZB8FZelcY2vCVr0R/I0aYOyVvMB8CGV6Tf3ivH0aH6/mvx7GsAo/Am9jfONyrzGoYC56
         DdRwjBTXEzbEmnvH4xYYsdRu0RC2HjQtAl3q5TdrBCsp0z3ObzU4nEYBk+wq30zuKWAl
         4/TQ==
X-Forwarded-Encrypted: i=1; AL+hErHCXBR1BKA3uMzoFPS0kbSQKIY6PlIpEs/zryKBvTeQ0ly4bZSzK+sbdRR/SPQjua/09CWDYw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/jwb9pk1S4PERWZjMvty755VCGAiloWXsdCbKiHizInGsTWMHU
	paarEaYlxFxX2EZt07gNmEg5nZ45AHEdO7IpHBglkVtBhYkeW7ngg4bRGxaZMDxX354qzh/SO7q
	tJUUa3NelckOJ+8a+sCX/SooiIP8mc4I=
X-Gm-Gg: AYBFou3Qpx2gkdFfI1Z+Y/6PLlBXP+QVrk8GMbRZRDqlGDJuoL44TobAfay4QFIkzWT
	4gYZVS+9w+aUu2DZ/B7Hpe590upqYXQkWzQAlmmXcKYsj4LvcfrqYJ3FmwUsUfHmGWdEdaAofqH
	dswMSEB0sksKsq4FgCLKXTgZl1qMn4+3vrKtnR18J/ll8T6kOJhkrGYpdo/qkJAmzLgSFIkVNQB
	KsNBN67SJaTOqZLS5QRVRib9bRSxJhgbvyH8mpjoSNqlKnaFssSRguJb4gU4i2deqwU43g4sdro
	L1pmkTIcIpkws2rntsjYZChkQ8fcupZdWRjBapiEYIMq8lwYF0XlMdUP6/vC0fwZ2cXnMM4qYbn
	biBWf3/4Y7aHgOuhaFzyaU1AZMUhEBmxl8QiV8AjU4WbvnvYxliwl2BKPov0YYrTnGhbNiw==
X-Received: by 2002:a17:906:99c5:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c510debbf56mr128472166b.7.1794987854109; Tue, 17 Nov 2026
 23:44:14 -0800 (PST)
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
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
In-Reply-To: <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 08:44:02 +0100
X-Gm-Features: AclHuK95FDUZyIgGYH5oXAgwPF3l-5HxSmk1nBdJ9DPBoS5wbYWUIu9nYKyQ4rA
Message-ID: <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
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

On Tue, Nov 17, 2026 at 11:02=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote=
:
>
>
>
> On Sun, Nov 15, 2026, at 1:03 PM, koraynilay wrote:
> > Implement provenance time (ptime) in NFSD, as introduced in a
> > previous commit ("vfs: add provenance time (ptime)").
> >
> > Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
> > CREATE, OPEN and SETATTR compounds.
> >
> > If the underlying filesystem supports it, use __vfs_fileattr_set_locked=
()
> > to set it, returning -EOPNOTSUPP in case it's not supported (i.e. when
> > __vfs_fileattr_set_locked() returns -ENOIOCTLCMD).
> >
> > When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
> > STATX_BTIME, preferring ptime over btime if available, and advertise
> > FATTR4_TIME_CREATE support if either ptime or btime is available.
> >
> > Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> > Signed-off-by: koraynilay <koray.fra@gmail.com>
>
> > @@ -3646,7 +3649,14 @@ static __be32
> > nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
> >  static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xdr,
> >                                             const struct nfsd4_fattr_ar=
gs *args)
> >  {
> > -     return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
> > +     const struct timespec64 *ts;
> > +
> > +     if (args->stat.result_mask & STATX_PTIME)
> > +             ts =3D &args->stat.ptime;
> > +     else
> > +             ts =3D &args->stat.btime;
> > +
> > +     return nfsd4_encode_nfstime4(xdr, ts);
> >  }
>
> I have trouble with this approach.
>
> We've already established that, for the Linux in-kernel NFS server
> implementation, FATTR4_TIME_CREATE reports a file's birth time and
> does not permit NFS clients to modify that.
>
> After this patch is applied, the server reports the ptime instead
> of the btime on some filesystems but not others.

In other words, for some server filesystems FATTR4_TIME_CREATE is
settable and for others it is not.

Isn't the NFSv4 protocol equipt to deal with this complexity?

>
> Essentially this changes the semantics of existing files that have
> a btime set -- technically that's a regression.

I fail to see in what situation this is a regression. Please explain.

The only oddity I can see is that a kernel downgrade could result
in an NFS client's view of FATTR4_TIME_CREATE going backward
in time to birth time, but I don't think this qualifies as a regression.

Thanks,
Amir.
