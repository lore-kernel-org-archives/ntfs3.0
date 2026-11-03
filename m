Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726518;
	b=3MO+wJ+nVDxhGA5Kc31vA7i9Gi+T3HGETRMQg8VgHe3QISUpdK35kpNww/XkwZad2d8Y
	 SF+Jen7Ne8rgx35WezS2L6euwt7pmExBUC/s9JCIjbzCF08F46pdT2Q6Au+0Zn/vdmV1B
	 k932xe+46YK/I+0O5zRHi8f9vmJeo8xPd8olpOazOYp2dRqefK9XucaiV8H+WzmjNPo1v
	 WyhDkXLSgAfmlv5wO9/mWHz5SeC0GSlm1J1UbEWiYbTtKuPtzIQgbrX86usSGkVfcH7a9
	 GzheEhDtH6KHSBBjW8sQyAcrUcd7XL9Zc5MfarrciODFH6Bt+0FtS6CbXYgJ064Tudw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=AD4L42H0HNVoYlglqMFr39a2BJYBFr7pQM1pceNP/MA=;
	b=CKQ+d72WXom/vWoL6uY+XGdEzpEasWKfNGd4NTrPS+VZUDNDgcE/RX+pbar+TYyeH0KI
	 gkJgTdweU0nd4JfO5E5MdEI9kDhXCgAjhqvhkt4AkwlBX3hS0tj52r33J9e/t5V2mJZbo
	 j+nhIepPnifAO7+JWhkmPTZowXlvVJtnfTtJFx5/FhBEybOLfghN7Ud2klr3UlOX4RrE3
	 PKADaztL9ctk3MK6FjmXBvcECrQGl3Blqeg5tMI7OnSa/BSsNnjHb8HQoMzGWAI/FSXfF
	 N0B/w+d07t49W+UoKxpquk2o4nwXOWZ80+suybv5rpR/82zFWr+6/9+BapV99n2MuiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MBhNH4lb;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A6606A32D
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 17:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58A6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MBhNH4lb
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so45076775e9.2
        for <ntfs3@lists.linux.dev>; Tue, 03 Nov 2026 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726516; x=1794331316; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AD4L42H0HNVoYlglqMFr39a2BJYBFr7pQM1pceNP/MA=;
        b=MBhNH4lbjHVjov9tsn+tt2t2re+N4KTTSAWHXb0AUqfhiV25n27MdDXgj9HwLdnOgf
         pp3+hI9h7YkZ6/x4LFzfp7+DvFe/3FfAWDloKKu/oMfnJbqItkoAqKX51a6hQcBmAj62
         jcEGfyGZr6aFTpOPZHrhlpVRaRd1CVFCkVRwp4mueoAViH8+kzz9h9KB4wwsp+YvCg5O
         fl3Sdli1aHBR9gSm0ZL7RrD/+WudmHEedvxeraoXPOfoxIttmmRlOaRUMcG/kucTQLVo
         ajWOURbn24/F+4nXOA1dMSEoohUc4rZkp7ID5Kb6f8q+3YBz2RuAhqjkbScUL2/13Dk+
         chvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726516; x=1794331316;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AD4L42H0HNVoYlglqMFr39a2BJYBFr7pQM1pceNP/MA=;
        b=fJ9mI3nh+cdVzHYpaWUSgOiORasn1kx+KzWbDvnAlYOfnDcGUmQO3bYW/o9Xrf5nk+
         JWx5R92EvJ2lZmteTpru4i4WDkGFhlz9q8FEgiy/ii7VZmZPOPtNZle++e1KFc7FxI26
         mXODon1Y+4yv/WyA24KFgVqzq152nxKDgJe1LoXiL1sS3RnhUG+a3hKvxYCLlW6XTB0f
         zTm/BYfViLz5UHasNNrXvcKzeruj7vL4UU11xYv8svpGf5oF+r/jOtyv5AM6Ly1MeYgh
         FY63UiTRjab5vj0TAbU43f4R2b5Da4ij+bYvdHzmQXhPb5xuzjA6GGLt4uUrsSUkHJY3
         GJaw==
X-Forwarded-Encrypted: i=1; AKwUvBzEp1ER+iJrJ4ONj67K4wiDtJNwH6f+iAgDMBLJy4OriW8ylH1PzM+E96HtHr5vOkkzPWeq1w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8c96USzTHf9BTsl42aOhcnHH908ebJZ8PahFPyPie0eXW0uFdR
	AV6ZE2ByStRrH5IC4Eh7TGC6DRrmJpwoExTZxBaVxHOwqcLmllAwJYzS
X-Gm-Gg: AYBFou0um5J3z9sY9bpr+YqaUCQ/UMu8JHyzGtdVM5B4w6+o/SVljBc0h0Raxt0Xcs0
	BFBdvIMujJAYImeusVNvwOIlntRhDGmHNxrZMWMjddamRft1y8+WnXENQpi9m/vCue8lfVSnoD/
	pLhEq4qXSZVoIpIzajPUK+GWTRa7FPQidAWXx7NZNu5sWTpp7vrb4I+aC8bXI98sZUxxixHNyy7
	iNhFnU3Y1TQALXciOZNBHM1YT8oApqNfrQ5/SbYkBJUjGbPWOjODF7NAigsLaZg4PsALZzNXvzJ
	caJHt57rN65AcQ9IuZqFL44lkKPeUBbGySw34ggcD4g0fvgtFfcNjzpIexQwGvMArv9ubuODt8r
	TlQiN8txQ8fArvG9ziIJLuxI/F71OuLXg/7Q/U+TT/1TXurIHndF7hvTUucAWCjfg6YK6SXkOcw
	3oIpWQl/FsT6ulaLi8fk3EgnZW805+NDZatNeZ1LIiDKeRQSoO8JOodBJuemSz9jSyLp8Mkrakj
	96aLLVNUyblUF01LQbwMxR/cIaSP1tkIXOi9Rr88qeP21FIBYREHT1xNSB2sdeD8FsQzytUy0Yn
	zhjGouIrX/P+2xZv5s7u54AO
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr345177055e9.2.1793726515970;
        Tue, 03 Nov 2026 09:21:55 -0800 (PST)
Received: from localhost ([151.60.201.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm287061365e9.5.2026.11.03.09.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:21:55 -0800 (PST)
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
 boundary=1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 18:21:53 +0100
Message-Id: <DMLQZCDREHI8.1PLK04U05AP4S@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Chris Mason"
 <mason@kernel.org>, "Jan Kara" <jack@suse.cz>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Chuck Lever" <cel@kernel.org>, "Darrick J . Wong"
 <djwong@kernel.org>, "Sean Smith" <defendthedisabled@gmail.com>, "Andrey
 Albershteyn" <aalbersh@kernel.org>, "Pedro Falcato" <pfalcato@suse.de>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 <linux-btrfs@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v3 0/5] add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
 <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
 <CAOQ4uxiMLDgMXuij99-43UfCqfZN2a=CTet560o_RzU2m_Y4SA@mail.gmail.com>
In-Reply-To: <CAOQ4uxiMLDgMXuij99-43UfCqfZN2a=CTet560o_RzU2m_Y4SA@mail.gmail.com>

--1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 4:12 PM CET, Amir Goldstein wrote:
> On Tue, Nov 3, 2026 at 12:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> On Mon Nov 2, 2026 at 3:54 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
>> >>
>> >> This is an initial implementation of a new timestamp to indicate the
>> >> time when a file/directory was initially created.
>> >>
>> >> This patch series takes inspiration from the one by Sean Smith
>> >> <defendthedisabled@gmail.com> [1], but using
>> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
>> >> <djwong@kernel.org> in [2].
>> >>
>> >> The semantics of this new timestamp should be at least these:
>> >> - it should be the same as btime on a newly created file
>> >> - it's user-settable, so it can be preserved for backups, filesystem
>> >>   conversions, archives and any similar operation
>> >> - it should be preserved every time mtime gets preserved
>> >>
>> >> and the correspondence with the other timestamps is as follows:
>> >>
>> >> ctime <-> btime
>> >> mtime <-> ptime
>> >>
>> >> Examples:
>> >> 1) a .zsh_history file created in 2019, then after a few years the us=
er
>> >>    decides to switch to another filesystem, copying the .zsh_history =
to
>> >>    the new home, in that case btime would have the timestamp of the c=
opy
>> >>    and ptime would have the 2019 timestamp (just like mtime would hav=
e
>> >>    been preserved)
>> >> 2) a symlink created in 2020 from the home directory to a /path going
>> >>    through the same process as the .zsh_history, in this case it woul=
d
>> >>    also make sense to sync the ptime to the 2020 timestamp instead of
>> >>    keeping only the btime (so the inode creation time).
>> >>
>> >> The proof-of-concept code (for testing) for stat(1) and cp(1) is
>> >> available at https://github.com/koraynilay/coreutils (master branch)
>> >> (Note: these coreutils code changes are a prototype and won't be
>> >> submitted upstream as-is, but they work as expected in simple stat an=
d
>> >> cp -a/--preserve=3Dptime tests)
>> >>
>> >> Lastly, the name "provenance" and "ptime" are not final, I personally
>> >> don't have a strong opinion on any name, but while testing with stat(=
1)
>> >> I noticed that "Provenance" is definitely too long for the normal
>> >> output, so another option which would fit well is "Origin time",
>> >> abbreviated as "ntime" (OrigiN time) and not as "otime", as that woul=
d
>> >> conflict with btrfs' internal naming and create confusion.
>> >
>> > FWIW, I agree that given the existing uses of btime and crtime in the
>> > kernel and various XXXprogs, using 'ptime' for kernel code is probably
>> > the lesser evil.
>>
>> What do you think about the origiN time (ntime) (Origin: in stat)?
>> It would also coincidentally be alphabetically (ntime <-> mtime, n -> m)
>> the same as btime <-> ctime (b -> c) ahah.
>>
>
> Honestly I don't know.
> My new idea is don't publish it in statx() at all.

Well I was more talking about the actual variable names in all patches
ahah.

Thanks,
koraynilay

> Thanks,
> Amir.



--1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCauoYMQAKCRA0bnTtJTDo
OI2UAQDfLMxbWJxZCtj5g/a2TQHWFv3yLHmv7IEjclN8pYY5IgD/VFtdYZ3g+FW5
oxEEhXF7xBfTTV5O+6Ag8QIL/lM51wc=
=XiPH
-----END PGP SIGNATURE-----

--1ae0fec9eeabe43856471b243f1ece3413edf7686407593b3575066613d8--
