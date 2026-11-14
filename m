Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794671011;
	b=Jx95B3FMcJ42gbRxiNqblIWy1mD33Dj6t7AmG4P4b+E5vKZx/YX2UH/EcqkC0AUVr92+
	 Kkx4GkM+xZwRStpwncOy8ET8ZB3tvTuJPJg9Vlgo67s5eN6eAxmktoG5o/cOyKrszcwft
	 9r5eNA4W1SzftfWzlCngzRN3qG7XuVkHEjUXpwvM3hxFWz/pm6Tk8Mzcd5JN2gucgHByW
	 7sK43q0X3aFViwLaqblHqaHcVsMFMwL46Is1jbFpVOKs8HBg2+ve4DLroYOsc5b1I75n+
	 5YJbcsNXloNeXbl9a8+DtT+TD9uxIOiby4oIQIjtjcqp+03Xs5n1WMYFVCZi4ikvYnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
	b=n3XHTVxa+ezbJlE152VzfNZ1YK2R7D4i1GzCSXjO7RdRjpyIrjgD1Bbvt22LWddhLNvc
	 +abla2wWgJkmRLKmU5puzNyumOznreWAi7uZgyOnKfpiruqO/phPBvx+bW5EMwJUbDK3E
	 ZB/gNbAtWOGyVPjIStZquQ6xRVBDnDvu0TtPx2b1I0zXMXpd/uqNWLgk2VzQJz0YgHUY7
	 FX6FTfBctGrmmSzua+HeUyZfmXcko9YqR3qEK7+q2nYyo/+HHibUS0XdZwIRLUZNTUB2z
	 GP0hEVfXJ3pv3AoacF+ihRNUxBiFCzv1CVXMz+hSQWRaY3dLOZKfw3+oMDL/Z+aYz4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiAx2V1p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE696606A332
	for <ntfs3@lists.linux.dev>; Sat, 14 Nov 2026 15:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE696606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiAx2V1p
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-372bdb942dbso2102884eec.1
        for <ntfs3@lists.linux.dev>; Sat, 14 Nov 2026 07:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794671010; cv=none;
        d=google.com; s=arc-20260327;
        b=H5fBraSTPFGfX/PNyqCIMVGLXF5OAzwY0obv8omg8PQYwzQJLeYQxUuOlTE/neainn
         0r2aSpHhDXyfhrilUT+SYNtxnQs0fqkq3PNJsNr3BIpju0ErZOcaJ7gEo/8v+4Dyy9vF
         R1KpuUVlZRgJWgq+9jf7q1x9HiEv/1ZPgSJKd2ux0KgHCTJTO+T1he3SB7Zf0gmDhQHX
         uNjbhE+u0ttEqRs57z8NuwcgXYv5b+ZWF/DcYR81UmwnQbkAqEQBMt0lfhOXhn7KA5WA
         KkjP23g6uGmHZPwNsdxouO26RzG/2WzT0Yt+jzwvU4KfPOlvZJrpzMIFdHNOyyb8mQYS
         /EIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        fh=4WAyu3pYMMzDhulrkXwhEJrKqLuGJB14ejf4JaY0qyI=;
        b=R0DdXctMqXprD5orF4Sb5/3AGuscBHzU2rqd9ODIdSi0RyBF13x6aOte4/p5iBl4L+
         0LkHI1e1kQ9fJaHHss5V9LrHzzT5cCoRR/r58xfXVVOrEq0O9Z2Hqp2aK+QQ/nn8XaRe
         6HUJTvh5Y2LgtkAMtVTTbiyHpJzIxt866cp9B099onuBQhwMBLMHvdBfujfECrElcLfI
         hwHzdB8tOn0zyDaphihHQhFW8WWkwbHQn2+WGGuvmBZYf3zRHnrP07E0eiNDQ8YhCAs7
         8t30rayUgkvyb3lwlVOJaW2v0EbEAZCkF7/l/tTuoEsPQ0/PL7QHzrzQUBZ6/OBzIK20
         ep7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794671010; x=1795275810; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        b=SiAx2V1pd2NoisFGfitAycfgkBXrBtYiyafjJE15elb1JGpxoIfkw5zyt0ZkwPMCeY
         0rwjT28CEg6Ew0rK1oA5yh/va+J2y2VFYQ96ys66qnt9Ru2NpGYfs4EHkjTHooxXs9MA
         drE3N1eBiK/bjgyqJ3xc9M39MWRrlvg6nvxx4A8RinyFRiPg52iv3D940EKF9JTnIrVd
         7wXsznBfclYuf79+a6D83gWVMQ8P38maaQ8jBKdi8nEHnqGjyd4aaemO+1aReOn9Bra3
         YvxL7c2ey5/gwlTz5vVHWkEDTIiHQqragMf1OPx7fIjZewe2PL7bpuVddezU465mDTJV
         z3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794671010; x=1795275810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8Am712/UKZMknyahwOgZ7GXCeTB3l6oZgw5VLnohk4=;
        b=z41xRxavCXoedyCdVSqzITgER94G5c7DqlorfolNCg3SyAREYD7hiw5146cwdqrXfK
         X2k6ce9NupjKlxW5Zi6PnlCpTgSCmNGiDStfweitElCeE/mFAlJMHb7Xxpcl+M0gRCgK
         PGTUvgy/z5tDn5TknbzG16sSwcPyD3drYJxL00X/tCLt2qDty1tRX97RM33KESAvVWmr
         prsOi0fPWj/hPsQ1o/1uY3hs7aeCNkn5KF7caHjuzRyCmZKSguR2ZH8TZUiTRK1jAt2y
         QHaTRLjtzyad2g7qGqsl5+EzI0QwVkC/BGfHhmAGugRGGjeWCbQlVQWSfShoP54vZfEP
         QNWg==
X-Forwarded-Encrypted: i=1; AL+hErE/08bmtBjsXcyjTfIBq+gQQ0ZaAHSDkjoXY1eQ0QszBnd7MfI/SAdWr7r58LkLzBKZHJYeJQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+EenYYfzkUGhHvA4IxeksvItaWUFMoe8jfIQHjXfJQp2GfgEPg
	mRG5Rk05JRtWiO9gwAf81UV8kr8H9Pkj7Axs0lsac44WGanfQTE+dsGBSke6zX6WK6RCHhhRAzc
	Ilc3pbbdhZdsZXRqyafQy+tAGPOQD5iY=
X-Gm-Gg: AYBFou0Zn2hK8rEM6aRjzpa1XtlikkZvhFXP/Rjya0Gu/2JaCa/grgvMXIBjONMGeGD
	3VSiPDq3naxobXynDy/tVaGzIE4jUIbyFNuB4jYOn/OBct7dLQqOxsxGNO8P1ORxIdBgURSBf0Q
	5ZGOf8dhXU0oZwHJr10403FrNsUmQIk44EP+g91x0gyMzNLqzEhTA2OPwQpxFBd/lh4CUzVHK+u
	QThJ4nU0wG1+wW+/DXTpB13oVD1Kmy+bQzzyuZSSQNKGrmdp3KiWeMV37ze2lFM6RNl5mZz/960
	xqysRWAl86lLB1GwyhAE/qEVR+CYF2owQZWKsKrMsTMUO8bgG9NmxIgweX4DQakF8OvbCHRXhZC
	wyR8ZpRaFUyhtDXdjHA3bAfPtTjP2jVlDOea13oN1+avRpTNbHiDqhFxLOUU+3v9QRAs259wf72
	uGOyUBZbG4pLjzNoZ1JRHYkTL0dvuHJFNKwUUD0BuuGw==
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id
 5a478bee46e88-37966e3abf5mr6101065eec.10.1794671010025; Sat, 14 Nov 2026
 07:43:30 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com> <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info>
In-Reply-To: <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Sat, 14 Nov 2026 16:43:19 +0100
X-Gm-Features: AclHuK9JZCuhMb1uoaKigZDdQKHU-3gJV6cHqPK13T6gU6gv_wW71frzsK9rTyg
Message-ID: <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	regressions@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hungyu Lin <dennylin0707@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/14/26 14:11, Thorsten Leemhuis wrote:
> Thx for the reports. This sounds a lot like a problem Hungyu Lin is
> trying to fix with these patches:
>
> [PATCH] fs/ntfs3: preserve colons in symlink targets
> https://lore.kernel.org/all/20261029203457.59990-1-dennylin0707@gmail.com=
/
>
> [PATCH] fs/ntfs3: preserve colons in volume labels
> https://lore.kernel.org/all/20261029225856.1173-1-dennylin0707@gmail.com/
>
> Please look into those -- and if your's is a different problem, please
> report back.
>
> Ciao, Thorsten

Thanks, Thorsten. I looked at both patches. They share the same root
cause as my report (ntfs_nls_to_utf16() splitting names at ':' since
be310476e886), but they fix different call sites and do not cover my
case, so I believe this is a separate problem.

- "preserve colons in symlink targets" adds a parse_ads argument to
  ntfs_nls_to_utf16() and passes false only from
  ntfs_create_reparse_buffer(). All other callers explicitly keep
  parse_ads =3D true, in particular ntfs_lookup(), fill_name_de(),
  ntfs_d_hash() and ntfs_d_compare(). The commit message even says
  "Keep parsing enabled for the other callers to preserve their
  existing behavior."

- "preserve colons in volume labels" only changes ntfs_set_label()
  in fsntfs.c.

My problem is in the lookup path: an existing directory entry whose
name contains an interior ':' (e.g. "Reverse: 1999") is returned by
readdir, but ntfs_lookup() converts the name with ADS parsing still
enabled, looks up the stream " 1999" of a non-existent file
"Reverse", and fails with ENOENT. With both patches applied this
path is unchanged, so stat/open/rename/unlink on such entries would
still fail. Only mounting with 'ads=3D0' restores access.

So I think the lookup case needs its own fix, e.g. one of:
  - make 'ads' opt-in (default off), as before 7.3, or
  - in ntfs_lookup() (and the dcache hash/compare helpers), first try
    the full name as a regular directory entry and only fall back to
    the file:stream interpretation if that fails;
plus accepting 'noads' like the other options, since today only
'ads=3D0' works.

I'm happy to test patches.

Thanks,
Cl=C3=A9ment Smagghe
