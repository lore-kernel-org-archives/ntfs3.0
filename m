Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B861519BC
	for <ntfs3@lists.linux.dev>; Fri,  4 Jul 2025 17:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651134; cv=none; b=AiOaYLBs0gYzRiRBTRK0fabh7K93J+w8LTVigKPkSn2AMT1PSwE7G4zalW7iyPrK6YxG/4ehqp/1mPBBUzrO/OJtLJFnrlEY5genvlAcGXG3HVLpPGHs3kSH2YuEeNcX4BGvRG4lDt5RJNrHfTHUODNZak4EIgjxXVdH+Q6/6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651134; c=relaxed/simple;
	bh=Nqm9M4UJIqwudHAuGH7UYCWuSwRLdeHqz5vOhTfsqY0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bYmi4Pll6Zj3Pt654t6emueBhI18tJtN97gKgaViw+D/u7bcnIXnFJdB/9fgfSG/TE8TqOZAhNxDFMMp6HX5u3GepooT1D1DUoe771P8kZ7bc0KKCC/23PkZal+e5Vhue2g+wDKCProro2qU0ygukW03FGLORjztwsr1mWWLs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=ueqHvK0H; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="ueqHvK0H"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-714067ecea3so8528737b3.0
        for <ntfs3@lists.linux.dev>; Fri, 04 Jul 2025 10:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1751651131; x=1752255931; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRRTUBR1HhzbPWZOo6ysCxsvxUXtkw1uTBwQrVosYbE=;
        b=ueqHvK0HxfyRDLZMx2M4a9QckFAz5RhQXVWkctL7tqPnyxztpvasLspOTo4O5Lp8R0
         h13mM65RKmmabdTcapEM5To52pcBfNEiCdnHWXGdVHRRDSIqUZz0AYYf6YZYYvUjYKDW
         mpw1LsgnYI0uPhdWZzzRTQSAtLi5uJVj7WGBP9BB3LbBFx7MdAWDeIySYLP5eYfEt/eA
         wqlyHazdQ6zb/k1mxWhsnr1ZMxAXBNgnE6IPF67mZfRMDU/g84Nr/ijbUfyjZH4XDOen
         UbEaiToDjcFxTV4heWKhZewSOuaSlXd84wMe5rdQ8KQvPiAz4z6AJxSgS8BDkz9aYdqH
         DI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651131; x=1752255931;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRRTUBR1HhzbPWZOo6ysCxsvxUXtkw1uTBwQrVosYbE=;
        b=sKH4HAF8PteQSYqV2Ym68ZQwql8RSSbQscYd7jHYcGhuAOAjHAo9pDorotS5bz4UtU
         LgurDEH6+IT/LaubDgQGDbeFdhQ/p7ahH+2FA+Ab278nTo7L6XCVQVclJ8fGglTm/6iI
         EyZMZ3GLmISDAFm2DUpvFCSrENUA2aniYcEzCFygVaFfycvsWfrhd5xr9bJJVAphOe47
         jIwj3a/nH/nVsGrdMSeKlJ/HjpzOPmsIky29vJ4zedbUJqdvxcEvrTHE9fi1Jb1y9iWm
         Nb4VkWImguE8GM0IhFfaUgjb10VXn4jCCO13yTHwPCogKCcs4SB2K2kWurXXdH3AVxaY
         3IGg==
X-Forwarded-Encrypted: i=1; AJvYcCVwLdrLRqWSYqG8c4AOs3mSRz6R1gfOTvPYSlHrYrceN+3vUuQxzHyLTX6v4QN/cUF27kTb/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZp25Urg5ho7gZ+q8HQDiOvJuPJoU+58vj5K72Oz1llhFu3PK2
	Qe99YCcowAp09O5w9179HBi/DY5ke0LU0Xbd0PkU2tKIps5zdXZyN31jxaimJg0e/pE=
X-Gm-Gg: ASbGncvPhKRUuxudczGXoG3YMuKCqoZv2GYZlYy9Uy4smJ/++z4oSswpD/p/aIOpVxA
	a66Y4H/3OFmcVG3cUIMxo3X+YGHQmF53LqdVExbw/QyBeRPGavVrJDZ83u9S20BtFrRTKkWS282
	qkl9D3CSOpZdlg0GgaM3dCC1OhKe7qTRYnuniDF+Zl9gfCJvViad00fI74PDNYWlBJSmJ6NJOY/
	PggSpqmmSyvbAR6gOQi0i9zkekE5rCodIm9AH1QEyOPDbXjYQMWUiUQzLkkeWs5+nwPlb+D+3kp
	3Ll++gGibc0UtYmSTtlvIm/GwivXG4wwa/Mm8hCWemwO4JxG8gPQ3A8HnH+wLwVpHeYiUwIFe8b
	MJXr7TrDnn3trgpexmiLO5b+ghRDRxt4=
X-Google-Smtp-Source: AGHT+IHavxdRXfQcFPtCri7JPle6nXppaWnSECfYS7k4+PrbVcT/6JmmoNF/J8UBNVnhAzeOW0UVtw==
X-Received: by 2002:a05:690c:3709:b0:70e:29d2:fba1 with SMTP id 00721157ae682-7166b66f4d6mr36192927b3.23.1751651131297;
        Fri, 04 Jul 2025 10:45:31 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:f030:281a:9e2c:722? ([2600:1700:6476:1430:f030:281a:9e2c:722])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e899c48ba54sm754640276.43.2025.07.04.10.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:45:30 -0700 (PDT)
Message-ID: <3c4ac1ab5f7afbbd745f88c595ee1465fc2e9ac6.camel@dubeyko.com>
Subject: Re: [PATCH 3/4] hfsplus: enable uncached buffer io support
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Yangtao Li <frank.li@vivo.com>, axboe@kernel.dk,
 aivazian.tigran@gmail.com, 	viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linkinjeon@kernel.org, 	sj1557.seo@samsung.com,
 yuezhang.mo@sony.com, glaubitz@physik.fu-berlin.de, 	shaggy@kernel.org,
 konishi.ryusuke@gmail.com, 	almaz.alexandrovich@paragon-software.com,
 me@bobcopeland.com, 	willy@infradead.org, josef@toxicpanda.com,
 kovalev@altlinux.org, dave@stgolabs.net, 	mhocko@suse.com,
 chentaotao@didiglobal.com
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org, 
	ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net, 
	bpf@vger.kernel.org
Date: Fri, 04 Jul 2025 10:45:27 -0700
In-Reply-To: <20250626173023.2702554-4-frank.li@vivo.com>
References: <20250626173023.2702554-1-frank.li@vivo.com>
	 <20250626173023.2702554-4-frank.li@vivo.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=mQINBGgaTLYBEADaJc/WqWTeunGetXyyGJ5Za7b23M/ozuDCWCp+yWUa2GqQKH40dxRIR
 zshgOmAue7t9RQJU9lxZ4ZHWbi1Hzz85+0omefEdAKFmxTO6+CYV0g/sapU0wPJws3sC2Pbda9/eJ
 ZcvScAX2n/PlhpTnzJKf3JkHh3nM1ACO3jzSe2/muSQJvqMLG2D71ccekr1RyUh8V+OZdrPtfkDam
 V6GOT6IvyE+d+55fzmo20nJKecvbyvdikWwZvjjCENsG9qOf3TcCJ9DDYwjyYe1To8b+mQM9nHcxp
 jUsUuH074BhISFwt99/htZdSgp4csiGeXr8f9BEotRB6+kjMBHaiJ6B7BIlDmlffyR4f3oR/5hxgy
 dvIxMocqyc03xVyM6tA4ZrshKkwDgZIFEKkx37ec22ZJczNwGywKQW2TGXUTZVbdooiG4tXbRBLxe
 ga/NTZ52ZdEkSxAUGw/l0y0InTtdDIWvfUT+WXtQcEPRBE6HHhoeFehLzWL/o7w5Hog+0hXhNjqte
 fzKpI2fWmYzoIb6ueNmE/8sP9fWXo6Av9m8B5hRvF/hVWfEysr/2LSqN+xjt9NEbg8WNRMLy/Y0MS
 p5fgf9pmGF78waFiBvgZIQNuQnHrM+0BmYOhR0JKoHjt7r5wLyNiKFc8b7xXndyCDYfniO3ljbr0j
 tXWRGxx4to6FwARAQABtCZWaWFjaGVzbGF2IER1YmV5a28gPHNsYXZhQGR1YmV5a28uY29tPokCVw
 QTAQoAQQIbAQUJA8JnAAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBFXDC2tnzsoLQtrbBDlc2cL
 fhEB1BQJoGl5PAhkBAAoJEDlc2cLfhEB17DsP/jy/Dx19MtxWOniPqpQf2s65enkDZuMIQ94jSg7B
 F2qTKIbNR9SmsczjyjC+/J7m7WZRmcqnwFYMOyNfh12aF2WhjT7p5xEAbvfGVYwUpUrg/lcacdT0D
 Yk61GGc5ZB89OAWHLr0FJjI54bd7kn7E/JRQF4dqNsxU8qcPXQ0wLHxTHUPZu/w5Zu/cO+lQ3H0Pj
 pSEGaTAh+tBYGSvQ4YPYBcV8+qjTxzeNwkw4ARza8EjTwWKP2jWAfA/ay4VobRfqNQ2zLoo84qDtN
 Uxe0zPE2wobIXELWkbuW/6hoQFPpMlJWz+mbvVms57NAA1HO8F5c1SLFaJ6dN0AQbxrHi45/cQXla
 9hSEOJjxcEnJG/ZmcomYHFneM9K1p1K6HcGajiY2BFWkVet9vuHygkLWXVYZ0lr1paLFR52S7T+cf
 6dkxOqu1ZiRegvFoyzBUzlLh/elgp3tWUfG2VmJD3lGpB3m5ZhwQ3rFpK8A7cKzgKjwPp61Me0o9z
 HX53THoG+QG+o0nnIKK7M8+coToTSyznYoq9C3eKeM/J97x9+h9tbizaeUQvWzQOgG8myUJ5u5Dr4
 6tv9KXrOJy0iy/dcyreMYV5lwODaFfOeA4Lbnn5vRn9OjuMg1PFhCi3yMI4lA4umXFw0V2/OI5rgW
 BQELhfvW6mxkihkl6KLZX8m1zcHitCpWaWFjaGVzbGF2IER1YmV5a28gPFNsYXZhLkR1YmV5a29Aa
 WJtLmNvbT6JAlQEEwEKAD4WIQRVwwtrZ87KC0La2wQ5XNnC34RAdQUCaBpd7AIbAQUJA8JnAAULCQ
 gHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRA5XNnC34RAdYjFEACiWBEybMt1xjRbEgaZ3UP5i2bSway
 DwYDvgWW5EbRP7JcqOcZ2vkJwrK3gsqC3FKpjOPh7ecE0I4vrabH1Qobe2N8B2Y396z24mGnkTBbb
 16Uz3PC93nFN1BA0wuOjlr1/oOTy5gBY563vybhnXPfSEUcXRd28jI7z8tRyzXh2tL8ZLdv1u4vQ8
 E0O7lVJ55p9yGxbwgb5vXU4T2irqRKLxRvU80rZIXoEM7zLf5r7RaRxgwjTKdu6rYMUOfoyEQQZTD
 4Xg9YE/X8pZzcbYFs4IlscyK6cXU0pjwr2ssjearOLLDJ7ygvfOiOuCZL+6zHRunLwq2JH/RmwuLV
 mWWSbgosZD6c5+wu6DxV15y7zZaR3NFPOR5ErpCFUorKzBO1nA4dwOAbNym9OGkhRgLAyxwpea0V0
 ZlStfp0kfVaSZYo7PXd8Bbtyjali0niBjPpEVZdgtVUpBlPr97jBYZ+L5GF3hd6WJFbEYgj+5Af7C
 UjbX9DHweGQ/tdXWRnJHRzorxzjOS3003ddRnPtQDDN3Z/XzdAZwQAs0RqqXrTeeJrLppFUbAP+HZ
 TyOLVJcAAlVQROoq8PbM3ZKIaOygjj6Yw0emJi1D9OsN2UKjoe4W185vamFWX4Ba41jmCPrYJWAWH
 fAMjjkInIPg7RLGs8FiwxfcpkILP0YbVWHiNAaQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-06-26 at 11:30 -0600, Yangtao Li wrote:
> Now cont_write_begin() support DONTCACHE mode, let's set
> FOP_DONTCACHE
> flag to enable uncached buffer io support for hfsplus.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> =C2=A0fs/hfsplus/inode.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index 26cc150856b9..b790ffe92019 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -372,6 +372,7 @@ static const struct file_operations
> hfsplus_file_operations =3D {
> =C2=A0	.open		=3D hfsplus_file_open,
> =C2=A0	.release	=3D hfsplus_file_release,
> =C2=A0	.unlocked_ioctl =3D hfsplus_ioctl,
> +	.fop_flags	=3D FOP_DONTCACHE,
> =C2=A0};
> =C2=A0
> =C2=A0struct inode *hfsplus_new_inode(struct super_block *sb, struct inod=
e
> *dir,

The same question for HFS+. Because, it is again old and pretty
obsolete file system. :) The main use-case is simply support the
capability to mount HFS+ volume is created under Mac OS X, for example,
and to access the data there. What is the point to support this feature
in HFS+? Currently, around 200 xfstests fails in HFS/HFS+. We even
cannot test any new functionality properly. And guys reports bugs in
existing functionality. We need to be focused on this right now. Sorry,
HFS/HFS+ is not so good ground for implementing new features. :)
We really need to stabilize the existing functionality right now. And
we have a lot of work yet. :)=20

Thanks,
Slava.=20
