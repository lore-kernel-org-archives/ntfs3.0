Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188083;
	b=2MemCCVLIFyP8l2oCY0rEBbAldrddGNcSlrM6YyJ9Kr4Qqm90B1lwu6RXKQ1c26GcjpH
	 VLcS/Tj6aToOeGGu/4UTf/rtF7XOfixeQMXA9uuUx+kLAJUet9SW6CfopzLI+gq1PpqXo
	 7AUkOcAgbg9YyaLiwK22wn+/fv0mH+KmBSQH0pyR/+6hDPLyaBxJSOzUsujIpNjncpB5X
	 YFabw4Bdf6QNCHqmbRhR7Vxn+VTlMiJw3YUPXDpulnpW9ZsJYt9h6yy1FjxR0P/GnAamV
	 VnlA6/E/ZDAOlToW9kckegIilwVWcxwfqHW1bgtIy1wO9m9vyEsT1WZpBm6/Jk3BQKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=EOuNUplOgjccByi+i7DuzKPwQryobm9GZBpfnMCMmUY=;
	b=VblEJtjtOye9urVg0IUHjwtqNBjPqq1Wi0Iw7LwR3kk9uToTM0dxxi2MdprLDPdI8kDh
	 8NWBxIcQXsivKviSqyZR3KAFvOZCc3Aogs3aCdYxiNJAz5mZjbHpAHPrfpPBIHM1giKmu
	 jLjEYF481A+TAM3q/ZFlSocfQwZ5YfVrwpflnDi03YScn3GwpXydRwalo84KaKXDcLJSZ
	 D9HY0BNi0gQRNT27wQda2+opFuy70WEq91/fn6rQsGAeYJ1GE/qD9gKrbDU9gX4aY7yTi
	 V6TSYLcYMtwMTexZ67BYuQCFjWdq6OmTrB4ySyZP4QzAnz9RaTzMX4inYYUj5wOVG7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uldsNows;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A62606A326
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 15:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A62606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uldsNows
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d427836e9so163537566b.1
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 07:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188081; x=1795792881; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EOuNUplOgjccByi+i7DuzKPwQryobm9GZBpfnMCMmUY=;
        b=uldsNowsB+uqcvr1LLQLFPxVIKh9CuTutKLB2CW3OtP6ICIV/eGLhAdtz4PpN7OQ5O
         4EILBfjl99znp0gfQnvu9pOBSvZaogXIWGwC1/Ig6IJsHvaNYBAlgJyiXtOiP0axADJr
         cHZKqStcjM3tyUgI8nnF9P4/vO7p7xDbrk7ZP4YFSBTw21DROgeM1UHWdGJVMdxeSIxS
         V5DsbnYA6NsdczsZzL36M1lorYVLehCuP6rzX5NsGnJ8yX2HhbZ0EILy0nCji4KBi3kZ
         MDBmxXWtiHA/CiUKGnLBcNlvQl31xGKA8tHsvzgz7Wtk2G1R5C9xFSbeVi3tYBYAHiVx
         J1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188081; x=1795792881;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EOuNUplOgjccByi+i7DuzKPwQryobm9GZBpfnMCMmUY=;
        b=zyQDH/zUv+0hMeM/eOQSiri9m4/gStbhahLEHFDgQJqmc+ChQZDe1ulPnwRr3UP/BJ
         o+8GIKU33oUlhAsTnq8wZ56snE1xfQpKsal4EOPavh6PQMLZJ/PpvAhmWIjuulfDdadc
         o95tDrAbuiRIkxs9UrbZlU8v2Q8h164TUbBWulrlV92tjxVPFPKi8O4k6UughitLSQLA
         MqknrXNdM9J72gr0h4O44wqhkeuBMgVOmL1+V4m9zze3/0oSU3GOKTsGaCalCJJhXn0i
         +Chp+KMtPHdJP4KntCIrl9tIz6nctg4bM/7WJEBqPLJnyuaTF+SVzthWk1WLQUF7Xxst
         Ie0g==
X-Forwarded-Encrypted: i=1; AL+hErGQJYoe1qwe/IFoSxbSAaPh9QzH/phUe00gCe3SRY2dTAMfQ8+BGoAnZEkOmQSuOwIC9szuHg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8/D/jMUcnWd40RwZKKnJw3t6yLkA2NmQXfWvbXakD8RwG99wh1
	qYnFKUM+3tZ9Xy/EQPn/dSldtrQUO81+GwJciATqv1IoJ2F+zPrwtOeS
X-Gm-Gg: AZFdTZc9GgtdmgWfXoU7kp84j0GM6NpBscxqXxFHuoGMvMdeT+Zx6GH6svBN8JKVHPx
	ORV6qdfc6qA8JVJFkCA/ylRa/wOtcUoSZEiM/zB3Sw3gxGTvcNLycGSaQNWK5zgKMh/rULVgeik
	DeaOwpYyYIMhKhMPTVRaQQg6HiMpWjiAR00wfk0TShBmAMLnEkS+1pWXio1bhHn4BAaphAUwkLw
	TWufriVmHotpzJ2IdbeHInrDH7zN3wgSjdsCk4Mr001sf+bTyTgOeR/aIsdgTIedvvmouSGA8rs
	J5Z+CD18h7cEs6+t/59UI6+BRSW6eucpWDnmo/uMwFRUrDPZYg0u3jjk4uAafEItfgob/VLMG92
	Ye2Po3zPelbVy38oIVOOeluejeUkKCa1jz8uwS8UFan9XnjnALCgjT0yJQhiBNplIeoJX+A1IUS
	OQj41K1L5EKnNLPfICffcqswtsPTbKAa9xIosubHNJ2wMptEyoFz0epA6hvSbta9H5kDM9XNyjN
	Ig803d3+Tm2csuJ0mIiO3cDbKBLab9IGSMrm5UwgnjpCgJJSVbfEXIRpGl7YvM9V1I8QC1oRwrd
	eHJ8+IqKvuup/sdBYiY/gapoclnJ242yxfhXopCMCGFvbCQb
X-Received: by 2002:a17:907:9903:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c513ac754cbmr269557266b.40.1795188080773;
        Fri, 20 Nov 2026 07:21:20 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm7100009f8f.55.2026.11.20.07.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 07:21:19 -0800 (PST)
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
 boundary=f7e29ba536d1e92db179b4c7b2dcf417c13b9e676632060f29334f2a5d8b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 16:21:11 +0100
Message-Id: <DN0526U5C1RT.3AQRIHXPB86NS@gmail.com>
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
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via
 FATTR4_TIME_CREATE
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com>
 <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
 <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
 <CAOQ4uxh+d-wNC0aWLEexPFz7zj=TZjLyu61kaEmwBx9_hKn2gg@mail.gmail.com>
In-Reply-To: <CAOQ4uxh+d-wNC0aWLEexPFz7zj=TZjLyu61kaEmwBx9_hKn2gg@mail.gmail.com>

--f7e29ba536d1e92db179b4c7b2dcf417c13b9e676632060f29334f2a5d8b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 20, 2026 at 3:55 PM CET, Amir Goldstein wrote:
> On Fri, Nov 20, 2026 at 2:34=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
>> > On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail.c=
om> wrote:
>
>> >> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
>> >> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESERVI=
NG;
>> >> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRESE=
RVING;
>> >> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn't
>> >> it *only* be in _ro_mask? (same for CASEFOLD)
>> >>
>> >
>> > Good question. Maybe
>> > I guess if you want to follow some percent
>> > FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
>> > but I think that exporting ro_mask and _mask is going to be easier and
>> > cleaner than rw_mask but not sure.
>>
>> Hmm I asked that also because you said in the xfs shared extent thread:
>>
>> > The advantage being that it makes the interface symmetric.
>> > User can alway setattr() with the buffer they got from getattr()
>> > and instead of randomly ignoring flags in set, the fsx_ro_mask
>> > along with fsx_mask defines the behavior exactly.
>>
>> But by putting the ro flags in _mask too, a user would have to clean
>> them out or vfs will reject the call with -EINVAL/something else, since
>> in that case the vfs would see the user say "I want to change this [ro]
>> flag".
>>
>
> That's just a matter of interpretation.
>
> You could say that if flag FS_XFLAG_CASENONPRESERVING
> is in ro_mask then its value may not be modified and fs needs to
> fail the set

Yes, that's what I was thinking.

> if the user given value is not a match to the current
> kernel's value.

Since this is a new API, I think it's fine to -EINVAL if it's in _mask
anyway, even if the value is the same, no?

> Could be used for an "atomic flag set" operation, but I think
> this is taking this too far.
>
> I am fine with xflags_ro_mask and xflags_rw_mask I guess this
> is the less ambiguous option.

Yeah I think this is the better approach here, I'll work using that.

Thanks,
koraynilay

> Thanks,
> Amir.



--f7e29ba536d1e92db179b4c7b2dcf417c13b9e676632060f29334f2a5d8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawBlZwAKCRA0bnTtJTDo
ODe1AQCh/kbA9HU+8r+s0ju3A1YAvNO0gdrrV7t8u43sPfGVSwD5AdqpmBpPOV/5
L+Tc9hTqkeeZYhiO4l4Sy3W9VwznRwk=
=IwFj
-----END PGP SIGNATURE-----

--f7e29ba536d1e92db179b4c7b2dcf417c13b9e676632060f29334f2a5d8b--
