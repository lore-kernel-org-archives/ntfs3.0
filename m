Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022645;
	b=bF4mmyAzy/G0bwb85jOJ4yueYeaC8MFjruaY+BxagnvjpoMOJfKCv4/SPhNJe8jVEajC
	 nEDs00tPNwxKiAKLy08R67nVZkTss3I9Dgem7T3MlNezvfbxrhkhEEaw0UuDeMGN8s5FW
	 zgmbeATIlPnX38K/O7xCjzo5BMN1RawbRtj2ZEAZixFOfndPY0vdElntzqfVqq1ozQMax
	 k54I39Ubimyk1bhmUwpuEPHx7S7oTvAfGq6YMqVsJjxrn8C3l2tTvBQKKIzwAsM5Uqi73
	 lbL3Q6ZwKTW9rvFLDFXaYHwJFDnFuTHeVHg2b/gdrbUuC/7d2Ok7z2msiS5JMx0a2zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=8VmZcMVpc16J1nBk01fE3vMPgjnZWh0+ezLB75Qyp4E=;
	b=dk3vi/b3jjGLuwvQXvgB1Kw92wktr5xB0g4/cXZBaBbKsirTCISuSk0f312F1OhLda0s
	 jhgikW8a8/+/8QYkgKuO8m0+P2Bi0r59OOM3UZv2M/LwcNzVoiTtb2rS8DdWbc5R8Y5Ar
	 eBdVxcghkrwZOsaqJjvEEjr1L4yh14kR96qS5we7E15b9UHkM8sRW6MGL2EtttUJ8fgVj
	 bUXIcU7fkKkf92eYNhCjv3jnuTp261s4YBI5C2JNnG0zLQnZX4MHEu5WJf+BxMaLDfnmT
	 3yw71EoKr7RNTXWjZcK3c4kueZ6W5SlXp8t4eNY7fullaEy1R9b+fCPTEZRkcExXGOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnxcf720;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7C6606A33F
	for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 17:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F7C6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnxcf720
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e46e449e8so851139f8f.3
        for <ntfs3@lists.linux.dev>; Wed, 18 Nov 2026 09:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795022644; x=1795627444; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8VmZcMVpc16J1nBk01fE3vMPgjnZWh0+ezLB75Qyp4E=;
        b=fnxcf720BTaR10KWWGTalwVpG0w2iAbUDd6ixGLFqU+eUiW6P304A+giihGYmdIqy+
         U4LIKJHiZ6WmAEf6zFkd0oMiq7d4g0rAAfs3q6X0SGBXRlLfwKghWGez7KM1+w6+P1uM
         xbbESKhuX0uZj/6pmeC1uQudqMyf5kOl0UJhP//4d7+xLTHhue5rKAoIlIt7WYm03kQN
         arWArpJgW+OPXKup+GfdKOj+a6I9jLsjZx0hk3LcHqLuTaN52rL8Ejc8SgO2y+tDTbeI
         +E5lZdsBenI1d2M7jW1xCyhSdj+YYakkQpOjCsPb/2LETp/nz3s1eUZ8fKypFJGZJB1j
         j7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022644; x=1795627444;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8VmZcMVpc16J1nBk01fE3vMPgjnZWh0+ezLB75Qyp4E=;
        b=D9+tpgUcz0vDc/PGyMe8LbkyteC6p6XiCaqOfQ8my7DDm0aScDazTR4JA1sR2FKXb1
         j2yvBDqPHOlKwPeCnIiLqgITdWtTd19Z/A1wU5Sy+Ocyyr6xrxEZpWhOW3XSrmwYyiix
         CoMzhGeRG6QqW9IY3jGHAXk08JmyFBuOWY/525EqQq/zaf070TVtkNsdzYLJ94skZ7IA
         AZWB3Sb6HqOI/OusawbSvWUYW9duIuZsdGoOUIs+YUVlUR96T4XHAMFd1mfDITtVGIe9
         ta2ZBhUKM5aLUe7JEhWwP3EyyTJlTZKkpshaiY6fMwiPPTbOUhtZQfzrLgeDjuEDifH8
         TpQQ==
X-Forwarded-Encrypted: i=1; AL+hErGLCfqhvtZHOp1jpq4O5ysJV3+oDGQrHH75O1icp09GICQjpICvM4LE2UIEvygs4cupIdHlAA==@lists.linux.dev
X-Gm-Message-State: APuU4Z88rJgjG2Oxv3fdjqRQZnzU+7USa6VZKzX9rtlYiBDIZ8GuD4X/
	K0duphVB+kxvgEkngSAVVZZ5Q7MCjHOKhWKLZB8uqxHAt2Zjvaz16SBJ
X-Gm-Gg: AZFdTZcQMBEXZ5RhlIn9qgWVTfmgi9p2QejmGDJuN9aRNAQJEgoznD1szLr4GBgA/ZZ
	7NrkUPTP3DCxmkYyH2KehM/cbOmZcu+glb2gbtpbjSh6GZPJWZqwnUd7cGJbQ52oCSV8htbemuN
	w+NBxn5zmtWeSY9TKt3Z/cyEUW5kmBN7t5JNgvyIaMcEljUS7B7SBp8Zo6CkLM8ANhzSoUi7Q9C
	JgF4Rn/QnW3eUUvqPmK/WAlRwFVc6Tm1DlAyew2gyj111Z8wJPr4j9J8TGfGRpCbvoZDHH/ATrS
	vBbGsBunfWovn9RBZhqRHLMh7TJ0/+KXV/vns8MuGCb7bn+Suw5Q7Lg81hBVXyFiWdh61SgsQkS
	05/XIHyXMsu1CWCPr0wRa/HtDtctZ3jljgk+tPOtftUSKPN3WRfnrjT/sqExROs+yszvNHE9USx
	ZFZahrcdhkHX8x7kTaR10J77i+EiGBZEN5RKhZ5SxGEWrduuQlvXussDm83dROJA+2qIXNGcWDX
	+r+EI6CBv+1sSzTwu1UNLcQhcAA37JE4GbCY5NRul47Q2Ynmec/jCPCaURGgZLo/OnaO6niHNp9
	n+V4TtD58sk7tCwYw2Ew8XbgBIj0
X-Received: by 2002:a5d:5888:0:b0:48f:f26d:c5c with SMTP id ffacd0b85a97d-4a638058303mr6313854f8f.9.1795022643534;
        Wed, 18 Nov 2026 09:24:03 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:de3b:51f3:e461:c0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b2a1sm5678801f8f.32.2026.11.18.09.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 09:24:02 -0800 (PST)
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
 boundary=bbdccfc2c1d2aebcf158821f40e232b6fbc6627f296287ed966c4171fde4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 18:23:48 +0100
Message-Id: <DMYIEZKEQXY6.EARVA8D4G55W@gmail.com>
Cc: "koraynilay" <koray.fra@gmail.com>, "David Sterba" <dsterba@suse.com>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Trond Myklebust"
 <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>, "Jeff Layton"
 <jlayton@kernel.org>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Paulo Alcantara"
 <pc@manguebit.org>, "Chris Mason" <mason@kernel.org>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Jan Kara" <jack@suse.cz>, "NeilBrown"
 <neil@brown.name>, "Olga Kornievskaia" <okorniev@redhat.com>, "Dai Ngo"
 <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>,
 "Darrick J. Wong" <djwong@kernel.org>, "Sean Smith"
 <defendthedisabled@gmail.com>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 "Pedro Falcato" <pfalcato@suse.de>, =?utf-8?q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via
 FATTR4_TIME_CREATE
From: "koraynilay" <koray.fra@gmail.com>
To: "Chuck Lever" <cel@kernel.org>, "Amir Goldstein" <amir73il@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-8-koray.fra@gmail.com>
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
 <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
 <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com>
 <CAOQ4uxjme9sJ5LGNDnP6rEKZLTJzX_ZdcMohgu2iLULK96GPOA@mail.gmail.com>
 <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>
In-Reply-To: <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>

--bbdccfc2c1d2aebcf158821f40e232b6fbc6627f296287ed966c4171fde4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 18, 2026 at 6:14 PM CET, Chuck Lever wrote:
>
>
> On Wed, Nov 18, 2026, at 11:36 AM, Amir Goldstein wrote:
>> Can't an NFS client be connected to another NFS server
>> implementation which does allow this?
>>
>> I can't wrap my head around the problem.
>
> You already named the problem in a previous email: What happens
> when the NFS server's kernel is upgraded from an NFSD that exposes
> only btime to one that picks either ptime or btime?
>
> Clients will see a file's btime before the server restart, and
> afterwards, they will see a changed TIME_CREATE but the file's
> NFSv4 change attribute will be unchanged.

Not really though, newly created files will have btime =3D=3D ptime, and fo=
r
older files ptime won't be set until someone sets it.
If the underlying filesystem changes it, then it's the same situation as
if someone on the server manually changed a/c/mtime on the underlying
filesystem without informing the NFS server.

Although, I'm not sure if my current code in this patch updates iversion
on ptime change, if that's the case I'll fix it for v5 since it'd be a
bug.

Thanks,
koraynilay

--bbdccfc2c1d2aebcf158821f40e232b6fbc6627f296287ed966c4171fde4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCav3fJAAKCRA0bnTtJTDo
OGpSAP9c3bOzD+a1N5jl1ZhnFHHQAamxFgzhMndzKRwdMl1YGAEA6Y2M7vsijmj3
bnNJpnj8gPwfPO+5AFboA6admpWVWwY=
=xhrE
-----END PGP SIGNATURE-----

--bbdccfc2c1d2aebcf158821f40e232b6fbc6627f296287ed966c4171fde4--
