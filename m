Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125091;
	b=F7szly5CmL4QnvAg9DNydZ4R3KF473ilHUUyJy9uc6DTUgNJg+nFWwSrOA6vHzZRF914
	 4dDh3LsyCZEbrz1MhU3LXgbu3hR546zwNYguw2q/YKmYOA7kWDarqI48816XbGntnNN5v
	 w0v+bT7qIjwDpCNjEA5gDILkwYkwp28Jp0EAZOFLBwS02SB789rDsavj1WwobWikZoaqc
	 /bE49FzXg77sAf47Oj8pWAzoTDJx6wDTmiMMjYwnMaQKypU/WI+acOfy8crdrVIQxNAF9
	 TAyYgHw01ikBNBv/MQSBe9ZSzi+IFEmN0j0ZpudFkt2NVterpcB3Zdo1XcnbrDAURCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Ny3Sl9Bn6sHIvah8OWFokkLcjHbV6BwIAehQvpJWiOM=;
	b=RgOw7Zr5yrPyMxBckcDKbBx3aHIcqKzeJbXaEKvgR7e7EadiunqIrrf8FvVxun4UXHa2
	 UAsQMsNy85YnWbJSL9Z0yWMud5NW47gTWfhELbzhKDThi5I21KjlO4oxcqmg25ljjnjpI
	 +eY9zf6m73Zk/g4Q02gWg60Ygu7yP6oSBvbCMkAxxdhyTk2AjENnGwGTctGxwz0tVktGy
	 NUe5Tb/Gf69hViGLcHrCmDUJEU2YAacA/72Wu6ylrQZUZDl5bcz60PbVwdctfrNMft2Ac
	 Ze8Lvn9rBkflyKPwDMkeKhxG1r0P6TjuUJs8vhSqfwEGKOP7IRY/QuqgY3esHAjCbqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKh8H0Rs;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FF9606A326
	for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 21:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FF9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKh8H0Rs
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b467581b98so2359665e9.0
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 13:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795125089; x=1795729889; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ny3Sl9Bn6sHIvah8OWFokkLcjHbV6BwIAehQvpJWiOM=;
        b=JKh8H0RsZIu297rExACVnaZ3tTgcOS7bhTnYCKZIg5/givMNsianqfDT9M9PyZLPvM
         FJn/8tdFd4AxJCKQ/dTuRy9xfeeY4LdR3EUfM8aPxU3fPKN/GbLhX/n7l3KiZeFPUK54
         ehAAocJsCOzkQ9AvbvZ7+mD6tWgdKRlx1V5eClaxZfhBqXtB8kGlfixLNRX/eDU8+MAK
         6xZOmlSJqszQ7kbKPIWAfb9RWvGHPc/Hv4VKarztKOVNJcCxXTA15GRG9oPKwSQlZ0O6
         5qHrnfMuHaivkiGi7rt7sKS+3OwbKaINb7xjwTv73eNlF4q5qcP3H8srY7Fy6Z0TdZHz
         GhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125089; x=1795729889;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ny3Sl9Bn6sHIvah8OWFokkLcjHbV6BwIAehQvpJWiOM=;
        b=MO8uqMUQ54xIOtowiTu6DCLUxYARBcj1zJj3RSR8EutpVCxPdanLFIkipMvWgMUrD4
         2oMS5WsmpkTBidchF0c7tBxeenQl0k3VVyCdy4Zjop9VmfBJyeKibpAJ8qIIXxRnXtnw
         vEFXyv5xFXoeXvXpJwNmCVJTKP941SJe56gm/DYC5F+W0IIbE5eKQAKhDY7RsQA3RR70
         34Jk2c7W4qzQ8emdI6pHsgwwcUxIJXS5PgvbLO3YYt01zupL3IKnRG75AyRbe/03xQnp
         5Iqv59IpzBZg7bxaNyOpSCjQ4arrDJX59fWbU7IpWuXeIT+mBHvNSOyrS1UTkm7p2lO5
         3qVw==
X-Forwarded-Encrypted: i=1; AL+hErFWaeqNebYu90c9JQw8zPzzKQ58Hp7tY15jLxsfnujENwMN43OV52hDsvTtUGoogeYqV6wSsA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+ER8SiSksrTHUZquTCwhFb3pehvimDhuDvP8R0JM1259V4X5is
	5BFBjQ+g6IOSuJ0UH0fJsUvbkFoy4AAhJ7dSO0sVUBuKuXUadMnpl41F
X-Gm-Gg: AYBFou2o3/+JhvexGck1Smgi7bsG9l7z1y50dcTyB1BO/UP4J1UoXBqhZpSYByYMSSj
	IBv1OUOidMU7iUGVCaqV3U8wdLQsP81DUGl3kxr78lwIdO3dnk1V/ASeUabHytV+Mw8MnLEmFsc
	nVEkPMrnzdMAe+NkbuLjrsK+R5zXw8QZ4CiEZehq3qdON4fPZF87x+tnsSXEiBvFg73mBRhP6vY
	5KvTYLkNIp9GrgZ1QXzRQw8iZftY18JZ2rtLmKm8XWrk6MA1cyj6Sqp++1qwlX4LRCgwotpFg52
	Uxy1WjuD2AYmT+6yA8btpIhyxb65WZsJu3OCCyyYOJYO7mrLolwoE2i5wmp1MNdvieTEFO2KXpc
	B+m5kBjmvXAckHuMbGAGnHROBza6t/cgwgFQ2sO96ZBlJCitzJdpOWydU+R8CdBjQiMEegZhM3A
	SG4judHrdUERwj+oN+Q5+2LHIcDBIEZSHasR9m42cTTqeyk80zkZsNxqSdFa1AfqM05cGrvXZuL
	Gz2ABoO8pLDFHhChYKPd7hmyc4tymIHAo6i0PjSSN20b3ipqsUF3Hh3b6rivyN8q+OSA/vkJQ2z
	uMe+H5Lx4d5oLrs8eKsMylu4CCCqOyV4hlSKMyPxZGdOxfg=
X-Received: by 2002:a05:600c:4f48:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb8893ab9cmr20069015e9.29.1795125089289;
        Thu, 19 Nov 2026 13:51:29 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm24821245e9.10.2026.11.19.13.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:51:28 -0800 (PST)
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
 boundary=305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 19 Nov 2026 22:51:26 +0100
Message-Id: <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com>
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
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-10-koray.fra@gmail.com>
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
In-Reply-To: <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>

--305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
> On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Implement provenance time (ptime) in ksmbd, as introduced in a
>> previous commit ("vfs: add provenance time (ptime)").
>>
>> Map it to SMB's CreationTime, making it settable by SMB clients. When
>> reporting CreationTime to clients, prioritize ptime over da.create_time
>> memorized in the user.DOSATTRIB xattr.
>
> That doesn't sound like the right thing to do.
>
> If the server stored a CreationTime that client had set, you cannot
> override this.

Ah, yes, but how would we handle older files which get a custom
CreationTime both before (in the xattr) and after (in ptime) a kernel
upgrade?

> When the client sets CreationTime, the server can decide if it can and wa=
nts
> (may be a policy decision) to store CreationTime in PTIME and not store
> it in user.DOSATTRIB.

To fix the above problem we should probably keep storing it in both
ptime and the xattr though.

> Fun fact: the user.DOSATTRIB format also has a mask so storing the
> creation time inside it is also optional.

With my current patch series applied, when CreationTime gets set by a
client, ksmbd writes it to ptime and fixes/heals the xattr (=3D removing
the CREATE_TIME flag created by older kernels, see the other fun fact
below).

And another fun fact: until [1] ksmbd ignored the flags and just
read/wrote the attribs every time :) so that can only be honored for
files that have been written to/updated with newer kernels.
(That's why there is the ((flags & CREATE_TIME) || da.create_time > 0)
in my patch, and not just the flag check)

Thanks,
koraynilay

[1]: https://lore.kernel.org/linux-cifs/20261115155308.415734-1-koray.fra@g=
mail.com/

> Thanks,
> Amir.



--305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCav9vXgAKCRDmj22qf5IG
XM7AAPsG6qghsrCfCEnMzpWg6QyG3mDtqVzO2LuI2Jbx+5MdmwEAqDTU6SUvXvP1
4H1OcrcMro3Ek7i+OVcH9ZQ2xF4lngw=
=LZNw
-----END PGP SIGNATURE-----

--305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e--
