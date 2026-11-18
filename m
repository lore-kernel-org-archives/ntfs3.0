Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013893;
	b=MSJ/tRH04SbeE3rjvHXlW4nfqO5v0FmpycMu6tadXcCvp/08gxRj5GZibO3p+xetgKF+
	 rlV3x0E+lrHcB5lFKwE45+GlqsR66MKBnOYSGkrQXgCzE+vAiK7bhZpvbRyChc0UTzYYy
	 nDJeqPB1dW1G8QP6JNr16dd2jSIo+feYOml1BUqWig/sw0F9SOAe2hR98MqI5MQpDj3Lk
	 z9RUdY7UIV5jpSehjKWHe0G+i7jFhmXpDhK95LTLxrBUUjwpycZhLGdME5aTIWLhtzFdH
	 3ud/butSXJcQPICud9e9QxJNO2sww9lldHC7Og3Q6T3CjMCQD3Sar6AFk6EkoH7eTJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
	b=sCHEML0+amxnVw3pDz23A69neAIlBvaqTH2KDPJIF9cqAT2R6dmAr3kChTHu2IScx4ri
	 89ZmtG1kLtDBKqaod5K3Qcj8JpKT3cYo+2j0l3TbGe8vN2kX6KFof7tR5ptka64qauF+O
	 FGJZkjYxpKMBrFXN0uxwRFZHpkhE5cpZjWrxyNEI2GD6jGFUeRLqVhvVLW+G3As2eHdKd
	 GEZjfAZDCwu6qEk4QFr0mA5GFsRwJqchB1J0ys4uCCiwWNuJyakDNdUnr05F06AvqWxqU
	 xwKoW2YvsoF/9gezwJmD2JhUgc86eg4OFexOicJo4ACb0835AaTp5YXM/ETF7hyna+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oKzJ/Oed";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE7606A333
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EBE7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKzJ/Oed
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so940362f8f.1
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013892; x=1795618692; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
        b=oKzJ/OedaSLp89aDNI25kO8hRkWzwg9SCytFgOMLXYtmXdOISm12FofiWfRQUzksy1
         mbj/KN6uCLBBVpOuqTfxAsZdAxO4ZPjJJBkJhkp5N+/xhGIBUjO+F+XWdOoHMmFlDW0K
         4qu9e3ESizgFy3mZ5/asZw/rqYyUQrdO3pLdqOUk7J2uVraDYV4PHzvBnqqF1WmA9kcG
         6/T6ewvGmxVH9UYBKFBUE3i0YbehCoysv7QROOKK8kg4DwintmPb1eZfq0OXFf5Ym0ks
         UaKMeqWL0BmQDpUQ7ZLCiL0mSEsUnrXfKpvHJ0ZCIXai8zhNK7RFcr/lAuVXYchidvoI
         a9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013892; x=1795618692;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
        b=ahP1okU2Yx2Fe3IoVmkkLJL4pUssyNxObHrJgpjzIAeaFZpg1tdob4gXjJGYsp36cK
         HyEHA8c2V/hFJgbaM29Uw6qULu8NAJBuA2rf8ynGu4Xr4wA2CVkd9/PDEFC5zQbt3bAH
         BNDnGDwaxlUqfQw8lCQZlEtd4ia0r+5CiIdrPzZtB8kUswZziXl1hRIxXDXI6zJYRACf
         29jPQdm4vJA1U96EEDS6jQ7McTGnpdW7GiM5wUYBKLxqW7yhwJZNAdfKzIjpwGsB026K
         vk5pjcMCrN++5KMl+F59YBVOHKP7jLTAC8GoHWSiZ/ITrJ/9f5UD8+p3Ix6/uTfjvRMF
         ePFQ==
X-Forwarded-Encrypted: i=1; AL+hErHP/CoLyQNlebkCu89K9MPesosjlE1g/q2Zo8shzue+PfTyki461hHZ8KlSUo0TKDQrlH9cMg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8nBnM9DLgKdP9nXdYa7Ry08WRPssfa1hnavBEReen3A3mrX3sG
	S7zYjnb9kUjF0SSbmHDeVx8GEdob/KOaYC345+n5hPbXvaXgpfJDdl6X
X-Gm-Gg: AZFdTZfRVx25a9Pt/dq2Ztg5LyU0goxzAVy6YAjrPJpKZUbj3VjPsSxAhb1Ee0XXtUV
	V/u2zr5x9tLRMlXFEyKwXs2N7pVMWwBDj3gNs8mMOksu/gzyUFiIFagfiEujf4LqjVuobvwuGfg
	DfBiVRYUA1+V1QzEGQCM53oUsm8jl4FgLq6YUdwZDWa7mCuLfaMV+jvVeR7nloYdIe9ddbm+apy
	JECTwNcGY/5HpP7Fn3Ko0/8AasIEciURxoahxUNUaKLY40lcB4zXhGSuXCKPyR9ilmbWbsEO3w3
	CcNktV8DwBJPg2CsiNxfbxkU1wT5AT0Jeqraxchqxv1EinHxtMBai87z9f4DHmDsuGCZG9r21Wi
	O/FLBscyegteIDP2yWsGuHRU67HpjbpdFa5kLxst3c4rINTshjdeNFywIcRam2XxNluUqmWcGMP
	CE4cAmPIo6/dWjGZgrFUcAXQxNG3gb77w37d4mN4MzRrUIyZ33izdCJ6qPc5+riIXVL/Qcd4RtU
	jIs9FLxhCuYnYJzZnhj/wjf4u6CaVjkCpGr7+mi+n5cl0jqeKUMtFP/v6xBPwZRtd4xtUsdIhez
	x9XIlUX1twXLHGx939W4+9gW6L8Itkr26nZzxNQ9z/anEoxKFmHI+GMl/104wzZAxg==
X-Received: by 2002:a05:6000:2dc5:b0:4a7:7bec:e159 with SMTP id ffacd0b85a97d-4a84976942fmr1578019f8f.15.1795013891542;
        Wed, 18 Nov 2026 06:58:11 -0800 (PST)
Received: from localhost (mob-176-246-251-118.net.vodafone.it. [176.246.251.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3b3sm5373344f8f.23.2026.11.18.06.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:58:10 -0800 (PST)
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
 boundary=9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 15:58:02 +0100
Message-Id: <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com>
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
 "Pedro Falcato" <pfalcato@suse.de>, "Amir Goldstein" <amir73il@gmail.com>,
 <linux-btrfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-cifs@vger.kernel.org>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261118142613.be3r3s6kobkkxnz4@pali>
In-Reply-To: <20261118142613.be3r3s6kobkkxnz4@pali>

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 18, 2026 at 3:26 PM CET, Pali Roh=C3=A1r wrote:
> Hello,
>
> I have just one issue with the userspace API. It does not allow me to
> figure out what is the source of statx btime field. If it is fs ptime or
> fs btime because this RFC implementation is mixing both fs ptime and
> fs btime into the statx btime field.
>
> I have feeling that this is quite a mess in API and I would like to see
> a clear distinguish between btime and ptime in the API, like there is a
> difference in the fs storage.
>
> If the btime is used for forensic analysis then somehow I would expect
> that the statx would not report / not fill changeable ptime value into
> the statx btime.

Hi, for native linux filesystems it will report ptime as PTIME and btime
as BTIME (also semnatically), for the windows-like ones that only have
ptime (semantically) I think it's reasonable to not expect btime to be
immutable, since they are meant to be used with other OSs who lack btime
semantics.

> It would be really helpful if the statx API on inode can differ between:
>
> 1. btime is present and its value is ..., ptime is not supported
> 2. btime is not supported, ptime is set to value ...
> 3. btime is present and its value is ..., ptime is set to value ...
> 4. both btime and ptime are not supported
>
> This should cover all cases of different filesystems and also allows
> userspace to do proper backup of both ptime and btime fields (if it want
> to do forensic analysis or anything else).

These should already all be covered by STATX_BTIME/PTIME and their
fields in struct statx, the only problems are windows-like filesystems,
which IMO shuold be handled as mentioned above.

Of course, as in the other discussion, I'm open to changing ptime
NTFS/exFAT/... support to remove btime altogether and only use ptime for
their own crtime if that's what wanted (I'm fairly impartial on this
specific issue).

Thanks,
koraynilay

>
> Pali

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCav28+gAKCRA0bnTtJTDo
OLZcAQD9pG1FmR7nRZDk2H08cDMhIho0sN3gDoVZ9UGDLNS9YgD/Z/0Ge9mFK15R
FEjSmx712gDHXRyPIeZ3A/k22EGaOQc=
=3Ms7
-----END PGP SIGNATURE-----

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd--
