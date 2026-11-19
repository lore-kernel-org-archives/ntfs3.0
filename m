Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126385;
	b=RyBln9WBNa3vCQ+j4uguK4x/HOAN7YE6J6W7XCrbxG+YpVcdBWanz3lXqLhqUDksDDA6
	 EkPGQGjUTb6pBbxx6IFUupv1DGPrAZLxJcShlG2/fuvXsXYkpPWxNufPC8vpAvGGjM4Nw
	 mfAO/4uKfTUXPX84UFVSaisR1Bj/fin4SMpig28c6SdpwOAsXkSCZcveR9IWG5l12yvOi
	 fKKh5zJchL0zNFPuR4WI1P789gbgaz8w3owDikQMz7nRk4dP2j5HkeLZpvXELaftQpZ8y
	 3O/7obKSUQlUYQ/JWKRc22jr3nLfB//z5zgO3Uio7s+TWRcnmhYhbzEl5shkuiD6YRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=IoYLwm6HerTHe4foGRx/rnGtvlKmmT7FHejTxyvI3lY=;
	b=xHLzjTHcyKtRg3p/230+cwDsgDdM/I5rW1DjP83Cjq8hV5w4t0f197k9ryk84RIz6KAf
	 Q+6JtWQhs7pmZbt9xLtAEtbtqlYUmgc4tKpSGkG8rTr25IKG/qlmIQe/9x3yWgYSdFuZg
	 gZ2Lo8B2dvh2OO/phTuJjaq3URHaNey7kWX7Z3f94Gbl4ENJOBpAzLtzZFGo87e3vfZDH
	 08ul3uj4ucnzex32Rm6ZbMz8EM0sZCdqFuHdiJbA8kSGnosqANk+udQa3HYVLHQFEYnBT
	 pVupxIMIAaa2wyJ5sB/MfxgMCMO3OFy0eWdKmOdssbBfVsKiJtWVnc+BAU6F4lcViPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjZGPI1q;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2728E60A2600
	for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 22:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2728E60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjZGPI1q
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso132512f8f.2
        for <ntfs3@lists.linux.dev>; Thu, 19 Nov 2026 14:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126381; x=1795731181; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IoYLwm6HerTHe4foGRx/rnGtvlKmmT7FHejTxyvI3lY=;
        b=EjZGPI1qnUGk18/j+5aPYgS8kt66UQ0Xf2cr7NNoKBiVL47U8nlM3SqOnAlBM8OsMZ
         Yrgh0OBxzeYLewARQKRSZu57CiVbydT11Pa5vUXv9E/WPl10rW3foBaqI+QIB5NKUAjj
         Rcz1JFKYG5nWU92dScEoLsLbroaCkO0gFqy8MG+YLM0JcRRiNqfeECD34dmt+j4XWwLm
         DpaHHmq8t8nUBprJyJqDjJAEX8L8OQFdPD5YFH3C4UV/qss2PuZDohb8ZzXTtW9mbK2Z
         oc1QuJetQxqGc/th1vkXDcHHHdZ+UHf3oi3KcfEP7XAEAf82x/wjjsQef2cDs+FNHdUN
         cR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126381; x=1795731181;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IoYLwm6HerTHe4foGRx/rnGtvlKmmT7FHejTxyvI3lY=;
        b=JFmaoSeZi0/hL4hHqXENEH3v+dzulLEW4g052Dtu8xOvGzjicr4ZFn0ZMZDKC+pLgM
         Llwh3aPAyXAE9BMz3Z3M789o+lKVKy+ZXbIOtoAfBtVc/5fRDcoBgXQmhwEy/34O2DqX
         hKrJq7JxHolpnljSPl5s4cstw4cOAcychM/oPseoxO4usO6F3Lmrut6bZVVsRMa6dpbF
         p0H8qvvUNyGY9X2Yf1cYDOh4cqVkdIW/lvkXKIFvAuQcQG6anqkNVM1dV7Z0HnnkaVgO
         /Qzr7PGXEROCJSe7aqeETaQKBT6I/h1Yp3zRKTHcDZKnnfbILz4zJckiZ8Cs972mOarX
         6V3w==
X-Forwarded-Encrypted: i=1; AL+hErFSg3/rN6l//qinmZ4iD46mJunMzOJZyT0wFKBppZ/k+rk6SQ4eU3PNoyUXFmP0cUJaGMES8A==@lists.linux.dev
X-Gm-Message-State: APuU4Z89MPfdx+Nj3auQwkIMjw4ObmsC4rxZJfs+Rsyl7iDgyqGXeSR/
	qaEMMQcPmA4Rc2nFXpajU9BhSZlM1o/srBkRTx5Tpbi/OahdmCmlWxsY
X-Gm-Gg: AZFdTZftPm7jBVZXh3Ut7tcIgoTPHJpgMtvEB4r1Rr0LVxERO4NRreisbsbL7qDWeIt
	VcIQeQEjzeHlzr8hWPf8JD11HeZ+zFATTH3hxB3NyNhKMWjJBmu7isBBEurilZCBkBYiU6im4dN
	+m4L2E2X+CBDAXiHVqzjLAIc5/hS1ufOXFDuZNnB50mlJfao8n0jT6Mx0pG0bLrol6QObpYIczr
	baba7+NWq7qHvU4NErfyEPRN22sA5YpZOidOhO/9gOQLP+7L2e8aPIqbt7/TiFFkyGBLIk80D8A
	jWboB4Q/q1MqvV/gXUk7doBxob7t3YqiOUvD122FK+St8Ss5JLVprVXbAsUhKxTUy0xp0HBcF0x
	8lwhV3uPExLtIOV8E+tLmmJULiq88GygRyXXkj6GwiMcgPQvYBusyh7ICLV93otOV8XcTH0DibB
	aifB8Vr2mlOud4d9Ozu1aO1VG8Q5Yve/iiQx5p5X75lxekawa886DcjpbCKj45eFnwQXcAzdEt5
	DSarQSssHNNI4CPjMuBS9OtoWhZHnbgpu3jWJZaEuFF0jBlf4mxsVCNbSfa3BpNaI1Z4NhL8BIx
	rzhVjso6tGPP/v4CgVKH9Qrd9Q==
X-Received: by 2002:a05:6000:4904:b0:4a6:60b2:afed with SMTP id ffacd0b85a97d-4abb3c37a2dmr1397766f8f.11.1795126381480;
        Thu, 19 Nov 2026 14:13:01 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm1875580f8f.58.2026.11.19.14.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:13:00 -0800 (PST)
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
 boundary=7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 19 Nov 2026 23:12:58 +0100
Message-Id: <DMZJ6XR1X3QE.LSJGBL45MSM6@gmail.com>
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
Subject: Re: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-3-koray.fra@gmail.com>
 <CAOQ4uxiRFUqgUMvngvXc1nA7e_HMKSs+aXWVQmAEpcR7yQiQLw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiRFUqgUMvngvXc1nA7e_HMKSs+aXWVQmAEpcR7yQiQLw@mail.gmail.com>

--7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 19, 2026 at 8:36 PM CET, Amir Goldstein wrote:
> On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Add fileattr_has_fsx_mask() as a helper to let filesystems check for
>> unsupported xflags while allowing supported ones. Can be used in the
>> same way as fileattr_has_fsx().
>>
>> Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  include/linux/fileattr.h | 21 ++++++++++++++++++---
>>  1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
>> index 42b92ccdc583..ba7ed3b387d8 100644
>> --- a/include/linux/fileattr.h
>> +++ b/include/linux/fileattr.h
>> @@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa,=
 struct fsxattr __user *ufa
>>  void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
>>  void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
>>
>> +/**
>> + * fileattr_has_fsx_mask - check for extended flags/attributes
>> + * @fa:                                fileattr pointer
>> + * @allowed_xflags_mask:       additional xflags permitted
>> + *
>> + * Return: true if any attributes are present that are not represented =
in
>> + * ->flags or @allowed_xflags_mask.
>> + */
>> +static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
>> +                                        u32 allowed_xflags_mask)
>> +{
>> +       return fa->fsx_valid &&
>> +               ((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_ma=
sk)) ||
>> +                fa->fsx_extsize !=3D 0 || fa->fsx_projid !=3D 0 ||
>> +                fa->fsx_cowextsize !=3D 0);
>> +}
>> +
>
> Every patch in your series did:
>
>        if (fileattr_has_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
>                return -EOPNOTSUPP;
>
>        if (fa->fsx_xflags_mask & ~EXFAT_SUPPORTED_XFLAGS)
>                return -EOPNOTSUPP;
>
> It looks like this helper is not as helpful as it could have been
> and you have raised this question yourself in the cover letter.
>
> Effectively every filesystem that supports fileattr_set() already has
> a defined SUPPORTED mask, so I think it's better to do the negated
> something like:
>
> static inline bool fileattr_supported_fsx_mask(const struct file_kattr *f=
a,
>                                                u32 supported)
> {
>         if (!fa->fsx_valid)
>                 return true;
>         if ((fa->fsx_xflags | fa->fsx_xflags_mask) & ~supported)
>                 return false;
>         if (fa->fsx_extsize &&
>             !(supported & (FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT)))
>                 return false;
>         if (fa->fsx_cowextsize && !(supported & FS_XFLAG_COWEXTSIZE))
>                 return false;
>         if (fa->fsx_projid && !(supported & FS_XFLAG_PROJID))
>                 return false;
>         return true;
> }
>
>
> ...
>
>        if (!fileattr_supported_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
>                return -EOPNOTSUPP;
>
>
>>  /**
>>   * fileattr_has_fsx - check for extended flags/attributes
>>   * @fa:                fileattr pointer
>> @@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 fl=
ags);
>>   */
>>  static inline bool fileattr_has_fsx(const struct file_kattr *fa)
>>  {
>> -       return fa->fsx_valid &&
>> -               ((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize =
!=3D 0 ||
>> -                fa->fsx_projid !=3D 0 || fa->fsx_cowextsize !=3D 0);
>> +       return fileattr_has_fsx_mask(fa, 0);
>
>             return !fileattr_supported_fsx_mask(fa, FS_XFLAG_COMMON);
>
> I hope I got this right.

I think so yeah, though for me it's easier to think about it as
"unsupported" instead of "supported", but the idea should be correct.

Though yeah, this helper may not even be needed, I'll see if it's better
to keep it and write it like you did here, or just remove it altogether
and just do & ~SUPPORTED.

Thanks,
koraynilay

> Thanks,
> Amir.


--7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCav90agAKCRDmj22qf5IG
XPKZAP0VIIYNYcMXcJcBnssVPLsh/PdS/1YfbeS+1fY2/mTfywEAh1K4KuZwkU+c
so3nKRdXgi3OcK+mKOduMSp71HXfUgE=
=ip1X
-----END PGP SIGNATURE-----

--7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081--
