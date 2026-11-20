Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190318;
	b=EhCph/UYxBrsZy83KNC/1PmnzzES2HtsJLpd5xYB+MpJaPqNKU0LxkJ1WEIqLC1228oa
	 8E/Enw9rNINUUQI9Oc4RFr5aUnmLncyMwIkMpJDAK3xygNdtEL5dtpfdraUG4H1pfLR+5
	 7Qvte3/EKhuwmxK5nHmfyGLuj4RG5dydb5myIKGHIjseUIvrcxHMSVoPAzBXC2ZoSpKEv
	 U+oAT906M6d3q2CLoO4iBJo6aG7UGFN8w80oSUoxMlhc67sudsC3Hv1/kB4YzHdx19wQV
	 rqAQBgJUO1zl+F3WoV9YN5EGXOpm0y5k0cAC0ZsIMspMLckoXnsci7gkunK0z/ZM7Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
	b=sOFUELUBVvKkCsUwEe00bDD1dnWYkY5Qyu/8OKR7H3+efW0NBn5u6vqpetBdnacgysgu
	 LHqGFPkykDIN4AW3sJ8Jzqh0I30wz458C+C+6PMj+Lm/Ozs6W9QEsFwEEMFNGfLSqBUhk
	 o7tncJKkHAAv/OGKBuj7Yd6MHZD8YL2/T3VZocVAAVH8ICZLLAU6MJqANclqF1UDqqOYg
	 DaaxcEgLM8dJqT+8NjqGOAgM7KVeLCTaCELtckmL9YX/HoQC2YgM4FP7QjQpL0inHt2BC
	 4rTp1ezhzarQhCCkQuNR5jjktROUMInQfdVhuDsbwwVQUiQAvN7WH/eMU61PlQHLsSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAM+q2EJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0605606A330
	for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 15:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0605606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAM+q2EJ
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so1442393a12.0
        for <ntfs3@lists.linux.dev>; Fri, 20 Nov 2026 07:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795190316; cv=none;
        d=google.com; s=arc-20260327;
        b=Fp6KdUzqtrRv+8H1UMXb7thcWwtgHdTbnlSsW7IkruRul7o94eEQ5ZdhtxmgfdQkug
         GjOwT8gg7lEDdBiYShmjj8uvbbbEuObcy+Bu8vozKYtDexyiEcxM3p7VisEpd/7IYQzR
         pk0PGVIkz4qGNassFobQpXZ0BCZzGKKKvxpGgMS89Wz6DYzknCF55WqiH/p5AtLsVfm+
         o5pa62QH4DlaSgdNrI6yacv91cKZi4nM/VVUfIWzQJUeGiGXvUfR/d8feb3cEWeLXo3n
         GxwNIZSHQyIPwHqmjd1buVwzfAujEr9Q9egl0EoGBWjEqzqYGFgqP2vludHd0pY4y8Em
         +5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        fh=tgCvupVO0mc1BMo+KNrAix3CAl0G07IKfNzOE3/s9VI=;
        b=r1LARv6vnuHckxVipoeAZ9dPZj1+1x9DJTy7gxplnJiaQhe9DLn284wz7xoV+CX3Bq
         TOLK33MVuXcbcquqaorhTkqnd+hXlBaWadjHSmTaQ748SqPAx0lZVIRDwKgz/dLAMFST
         VrEGe8oVhmnUrPYUX5mAI661YiEaLv3GXLQMgN/xiEuAnC17NxKeiJjUgF4y09FSAzlb
         /a1scUTzUqrLl7robUqDHypPYdHwQn86QtRoHJQymHl1uvDsyvHxcwxvmw97kFUWAYEj
         IkRBAxs4BE40rrSltUQizdkl1C7E5fSTYpdvFz3CRqN9ChY7h/J3xhIQJFbcgWYqyfG6
         tNzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190316; x=1795795116; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        b=iAM+q2EJQINZ732GicNePXTCx4kJ+UNVLmSvt/lGAS440FW/FGy13a266Cjzcq7JOJ
         iUR1vsg472Y69mWV4nhjvJQISYQyZYii81/3e+9YaDdvFZgvhPmIJ8sbVzbIB7whrHH6
         1Il7oCR8QMSSYWptEB3bB2NQsTUsWkIfJB6tUH93J6tI0LulyRc9HllGnn7PxAwanhbO
         e4Tzd/zLzUMJcI1md7BJV4CoOJ9xkHjSGwOTvKdP5l5PEqesEiy3XNTVyFE3Oyb3TDQ6
         wvpsFCWuPab2esimza97mFTHXWgEO3hU+SqINSytahzwXlqeaTkAZn/UAANrL6uDAS+u
         PBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190316; x=1795795116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        b=yqzMRwl12/1FgbtFkBSOpeJWgfQKQakcO4FMqDV3/m/shLa/7nHEt/siF2xQYX7xbw
         R2NBYxyvJav8HVpRVUuvPCmFA7W982cLNCusOZZHPG7OgY/4bpm1JDmZJPzTAeLiBhK7
         wWE6BiioCMsgirjSI5HlfDI1QF/Lv9z/WblIe1bebaC4TsMxYzJFp6hW5wbV+zMEaRkT
         GNge+4VgC361j6EiAgFw01Ayh+erMCAkRILWClv7X1N6we4Ccoa1tf8CxLOjJNUjcAQg
         KFsX6IjQtufw7mr2/7jzXx/QU2y5HlcaDWFMmZaPq1qDFS8fXqkO5JNHgVsl6LoRDzxF
         rxSQ==
X-Forwarded-Encrypted: i=1; AL+hErGJtRX+OxwGk3cM37CTBJ3nVkZsl5ze5O+3yKyhBVPeZMRx/cyWSwLzaJtEq1vPRsLgh9Zv2g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5o6r565DiPj1F3K9qGtw7oHOP9KqOC5S8n38VmZgbds0eP6cT
	P/NyBEy3juZMCHxVpJn2emYzJBRCdmjm41a19xh//qu6zquwCbuBtmL2I2O9QyVfl5oJU+rHa4L
	gN5WJrHfZzVFrs34R6Ph9gg+5DM0KPuw=
X-Gm-Gg: AZFdTZdf33uN2KL+Aay8gGvOonWV96juMdGWGk93DCOzs/LQFudmuFm4WD/Yuq7tniH
	fTL3+//iVzUdeONiYZem7ybzD9HEiT3wuNRHnw7+gct65taYyvJUO0hT1RMSDHHyv/9avuaYK5R
	iTIsvvolyicUpH3CC0hnSiGTbqhXU+4QQxrKbVWTlhpmq7UIJmP9waJGHPaYCcUR4qH3dwHE2ma
	QR9F3oGCsLeIRUPowXwhxWhI39yT30wrhue39zP3KTTtUM0Fm6uWrnW5pQ/1chkPShfSmNLwwUQ
	aONPakYD4UuVtq2dc6NadEvEg/05HaRA3ucBaOG0RgTCT6XY4Ik7LhkzqIm0Y3SRDQF6d3Py3yJ
	sGRKqZv4+C0kWl+l5NJhlFWDATrLhOPon77DEC/1F8yeSRGgfK5NjIPXLIMVRsPMq3O0IAw==
X-Received: by 2002:a05:6402:52c8:b0:6b8:5aba:6c06 with SMTP id
 4fb4d7f45d1cf-6ba37d652f3mr2090064a12.14.1795190315774; Fri, 20 Nov 2026
 07:58:35 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-4-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-4-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 16:58:24 +0100
X-Gm-Features: Aa3M54pideZA7GJITw5PojgxjktVU6GBxKullq4dSyaJ0XYgg1VLGv1zO6-iMnU
Message-ID: <CAOQ4uxjdEiuJMQxtSL8XrPYHSamtfMh+BM8kS1wj_PVME4JynQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 03/10] ntfs3: make crtime user-settable using ptime
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
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Since NTFS supports user-settable file creation timestamps, map
> provenance time (ptime) to NTFS file creation time (crtime) by using the
> newly introduced ptime API (in commit "vfs: add provenance time
> (ptime)").
>
> To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
> persist to disk in ni_write_inode().
>
> The timestamp is now retrievable by using file_getattr() or statx(), and
> is settable by using file_setattr() with the FS_XFLAG_PTIME flag.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/ntfs3/file.c    | 20 ++++++++++++++++++--
>  fs/ntfs3/frecord.c |  8 +++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)

Please don't change the unmaintained ntfs3 driver.

If you want to include an ntfs patch work on the new fs/ntfs driver.

Thanks,
Amir.
