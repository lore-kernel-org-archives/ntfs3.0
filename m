Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204636;
	b=z8M67HdEYwq3x+IR55DyfpLyEU7DMq2ieBfnXFt974d9cT5FwRltLl7FhtkHbBvQThGg
	 z3kMTsa7M6o1H5POpkZ1WQHlme4shZmpxcvrc+kSBHElqbaNCwk/JQGjstIhFmH6LiI8o
	 vPMoNQrWynXAh7+qx78yrGwIbURweAEeWkEm4hs3uS2dz0UyjdninSEykOr5GkAJz/Ds1
	 Q936aQwJb8eW5iCoKqa2rOMpNTKWUZ8ZCZhmDV2kY5gW+ny4GITypQQ4cQUfUWFzarqM8
	 2uYRONi7V7jm5uCFWVgzxN/GD6k1XAeoFZxWN5kzv4nW+4qzu7ApJzU5FdPa+9uu7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=bepP2SIrLZrZLh3YoUhcI7r4qP8FXfE4vnBTwIQ4Skc=;
	b=oPgo4crwtjBKcbBTrpDf0PuxzsxMc0+YkBE/y9xn7jMsqXH4yoxtSaEdcbq7PBgQqGA9
	 kgUQXvCo5V7DWSftTFjcQBR5BP4ejaf+AIvWyzdSEJyQPbaFZGBL6kZpBEwuNJ+emUEtZ
	 8vgiIMlZqk3wQQ3zGd/R76YH8/i5fp8REenYY1Z1h9icvQpRA3OuD57k7Xc9ZyipE/3e/
	 +vKYr7UTVIDbp334KrhuySI2qwfysMZNmwjc1Ghazgry0t/BNWkC9vIvHu+/sdVPfYS2l
	 xOkliTqmvIvyx+TAhuPdJA2zHQMGtvB24C8gh8B3OCpHdaFA2BzXO6pLrvogom8XWsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6SSbBbt;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB460A2607
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 19:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AB460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6SSbBbt
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11682325e9.2
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 11:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204631; x=1795809431; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bepP2SIrLZrZLh3YoUhcI7r4qP8FXfE4vnBTwIQ4Skc=;
        b=D6SSbBbtpM2o29/6Hn7imujIEx/DVsJ6NY2kGIVpj1nuc9KfX8VYNLaedBOjTo7nbz
         N8b37oBVO9ewg+YGr65v2pE0GQ0xsscKIORxltkLf1w3HGUHzJtoQuIUFZ2PNQ16Ie5c
         CLpgJbYBV/+VLkCxHf6oPClvUGzNt3lNIY7BkLy8ecID1IUiqeH0SGMqyQU1qg9skOSn
         1XW3pxg1Wy1grpqFanmm9gXXyZuhRY9PiYRyBbziHJTU60L9TcS1tSzPKKUW6PwjjzTX
         faZiId7v5D+oye2U055gVcPj7BvVKDpupehTaMCT97/Z+j4FWwx12g2u/qjhG4tD7MDG
         wgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204632; x=1795809432;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bepP2SIrLZrZLh3YoUhcI7r4qP8FXfE4vnBTwIQ4Skc=;
        b=wrik/OaQKQZqOgi/O3upf89lAyHRQK2gYF5nYuXAgPrgMQ28FVbRDr1Rqd3sEe6s+M
         MUuHtJTck6+qhmYGfBgmKg+kijFeTDFNMY0SnmHRrvsGf9FCMy74ev/NJvx2ObhKpL/u
         TNnTd56x1+PcblRwRwZ7qKh4AHjIZl44HKx1tenHabn4cJpQ6cYvsQhzCuXzh32ZG3ij
         hR94dwesCGSdSrB+1Efpxa9vGjhYneraT+T5wyWpkLoX2GsiAyMkqzQB9jlHqNZva0q5
         IAt4WVomrQgevuatFWRUIevfW30SqcSBGJXI4zbL4JkKk674atTbtaetiIj8u/e7hHQ4
         OyuA==
X-Forwarded-Encrypted: i=1; AL+hErF9Rl5IpnU2v2SRNaKr1TjnyKLXW+0lozddErw//DntljfxwavPHflDuc0L/bC+VCiJJDY4Jg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+1cczBeWRwWfV1g4EDzVdBWMOKstT09wS8NGa9gagrsoPsjrmS
	syIG3vR6OBVCrAy4/VXhIjSXoj9Vko6FnMYktcmosVK2OBjGqRXcBnFi
X-Gm-Gg: AYBFou06cuD4D/5IOplZqJbaEA+B7O+Kw23uv26VtooEQ9cvEyWPwqTKRkJWpwR7/Cf
	eJdRUow6VOlUQhCsJBuSnYDZAueuyaRI/PDL8lyzpntDzbPEq/EPhakIa+cKMmQ9zx2bUSOR9N1
	Ykx9NBrbb+JPdQ88rOywn8FdI8AqfoD4ulDBNxs16JjSbwjoWPZbxJ/YOqChBLrZKqH+zEXkfkE
	JI6bTf7NiFsNo1A0mTX0S3LTNy3SLnGOIdDWfqKxoLvUHmFeBm7JCQSWYnTbGKoYYGD9bze3BEM
	MD9r1debWUiC/Q8lEhKzJdzbFqsFJijNIGUfPFwcbbxhv6Hu+z4X7MSVUMc+rYH/HGGKuXvrFmx
	Ob8NK5AGbkPynAUv3oUvvO+qsyYhGd8rXLcv3dCaf/bLew7KAfN16Raq1uuvEq91kM46lVto5NR
	F2gBLFP4E6mrbGx0xmYNDV76x0rDtv5R7rW1+uTdYwsAfBadLMm0qWD1lsYuxcYBzpI8gbGkC4B
	0bwCowrwr7P6QClarXwoCHHakP18XILAYgiI6PIGS91RUSfHBt2b3HlxMfuD/pyU6m/bFeSUdT8
	kHeXROSx00Rqfw3uVCfjrL8sHA==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr93789305e9.3.1795204631450;
        Fri, 20 Nov 2026 11:57:11 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm177401215e9.0.2026.11.20.11.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:57:10 -0800 (PST)
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
 boundary=0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 20:57:05 +0100
Message-Id: <DN0AXFYCMGXO.1O5VDUA6GJCT4@gmail.com>
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
Subject: Re: [RFC PATCH v4 03/10] ntfs3: make crtime user-settable using
 ptime
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-4-koray.fra@gmail.com>
 <CAOQ4uxjdEiuJMQxtSL8XrPYHSamtfMh+BM8kS1wj_PVME4JynQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxjdEiuJMQxtSL8XrPYHSamtfMh+BM8kS1wj_PVME4JynQ@mail.gmail.com>

--0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 20, 2026 at 4:58 PM CET, Amir Goldstein wrote:
> On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Since NTFS supports user-settable file creation timestamps, map
>> provenance time (ptime) to NTFS file creation time (crtime) by using the
>> newly introduced ptime API (in commit "vfs: add provenance time
>> (ptime)").
>>
>> To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
>> persist to disk in ni_write_inode().
>>
>> The timestamp is now retrievable by using file_getattr() or statx(), and
>> is settable by using file_setattr() with the FS_XFLAG_PTIME flag.
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  fs/ntfs3/file.c    | 20 ++++++++++++++++++--
>>  fs/ntfs3/frecord.c |  8 +++++++-
>>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> Please don't change the unmaintained ntfs3 driver.
>
> If you want to include an ntfs patch work on the new fs/ntfs driver.

Huh, I thought ntfs3 was the modern and latest one by Paragon.
But apparently I missed some news[1][2] lol.
I'll use fs/ntfs for the mutable btime patch then.

Thanks,
koraynilay

[1]: https://www.phoronix.com/news/New-NTFS-Driver-Submitted-Linux
[2]: commit 1e9ea7e04472d4e5e12e58c881eaacfb3e49b669

> Thanks,
> Amir.



--0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawCmEQAKCRDmj22qf5IG
XMFuAP4jbqqWLf0rzRDeTfZI93Ntri5exvb2a4tXBADewtwEHQD+MLXXfUDqNxpu
FJSnl3dfZi2d0aWeniR+psgoM+VAKw0=
=6Hcz
-----END PGP SIGNATURE-----

--0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e--
