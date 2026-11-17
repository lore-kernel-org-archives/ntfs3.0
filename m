Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954441;
	b=mB/X6vMagT5JBB9uavTV9BsSYhXNfQVoCrKEeREyQXBZApAtRs3lWVeDnwMuYmGsScSL
	 2+wTZf21NH2saOYgCXHm78Z9xE4MIknr+XxrocsKMj0Mj7Eyu2fWUHZRSdPBjcSsFGIoO
	 /Ej9OUBYqgL0SY/kbEVmfvofriaYoD8FXQm1E2tYTkBgK+qjBdhxwhkA1Nce/7mVUSOfD
	 RO6DF77/PYRZHVfpwhzad6plk96HA3C7H4Tq3iRmiaaRQrFBK2SGE4Rtf8fUeeCEuZbBo
	 aBVfJmVn5+kQm3bLA+nZ7CJsaRaSR54XncT/WwKSe+fx3wesGhMhJ0S5zpN+e+xc08w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
	b=twB87kqxuFsUEZXSm+LStsa5w5AOeyuOK2H/OjlvMx6ET23cour/V4zLXAlfSA6cCe8v
	 ItdF/v0ZdhOg7GFcwM4oAQrFbQWkdLFjJhacJJ4VCEwbOh2NovP5+YLmSWtPTIUMO9Lad
	 OSeYwNA8NVUytNqSjaVZ8hrRndmpjKQ3TMFte4Nv3KqE9PtltpUxea7oTh3eeFnx72UqI
	 6x0VKUgfr5jpJ6dExiYosKpy967yYQ4r9/0sN2+JnJ0xZAeefDAHort1FVCsMDEn0k++X
	 UNXJxo7u1k/7thFxmySqJnsIiNGTSzbdkdB9CN2t1Ome5PqilWAYi4XCddAfsuDTX0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yXm3b6YG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E9606A32F
	for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 22:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7E9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yXm3b6YG
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so741431eec.0
        for <ntfs3@lists.linux.dev>; Tue, 17 Nov 2026 14:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954439; cv=none;
        d=google.com; s=arc-20260327;
        b=Ne3UtTyPRGSq1P9aAyruF6xoO9doUItAayl7LlicT7lCS23xpNXX6S8MU6+dcsNY//
         0wEITXMPj+bTp4APDt8IuMbqN6KMhR3X4i6aVBQUl8bHQf2JX+RwNYjAHc0johjVDUzC
         wfUEaeP0SLy/JPeme0e+ox3pUZ+BfEksfoCKUNm7e2lKX5WEl6myJnV8+amoQIJjFO8L
         gXDbS9Xr5ADqSQclBousKRl9MvcWBliKiEjxqhK+m6iA12SvffXk+GKDGEssftYGfzlE
         FUrZ+TUP1KrkoY3V5aGBcAtjhAttdoi9Cg2tKzbmLrTZgyXIF0+lArhY1cAjTje7mIag
         SQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        fh=Wvs6mYbuNTu7qoCZSUY+KWcVaM/N4Vp79OkFtqW/Pcg=;
        b=OIe0bEjMFKpv/ueBsQ2ehjWlPtWkzA22vd096v9S9iCUYcZc3Kpz3O1Kflk3RzhRwU
         CVaAYtAYVBluWhL8t3wOX8byNLgbAyWatave5d6H9d3wpaZVJdWjMQcGQM6wTi51w8AG
         rCm8yjl6Tm8MrYsFFjL5bHtTbD3mLruJxmVTJh1uixKVCVKHmoxh6S0lQ6DebvWK0Dy7
         ankXoiH0Rix3Mbmk8+8n0LcHxsdy+AXEf6kDrnbj+5iC6CQM5hXsrbo4Qrkqes/xWbp4
         gY/KqHSQUCVgCqZav2+i3gzMh72+JfQ8+azwKkPAvPZWaJybkzhVlddV/XhChpKBQcaH
         NvTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954439; x=1795559239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        b=yXm3b6YG6CsBezQeb7jdul6mjzlcjkAZvsxt3eJ7xNDiff/qedhHhsLhyVYDbh1T9d
         ppNSU5l+cQRBGTw2ePagI2Iws3aeTvqHG/g9Tvk2DLkg97z/ru2go+uVS9bR3BTqqTl+
         ZKFvQ5YfAMEjwBKpwdFGytK5o+1hBKjIqZpM43d0qcnr21VgtgWQGgdtP0PU/reO49gL
         k8NzoHMBjr/rXB6/hQ9HPslI04zWhWh5yl7hztZ4Q6syM9N7dem4rog9nYn5xav1YYZT
         IpmFFd92WMRyyjevzb1uOFxbz/39XD0IA9+QQM2EuFKLKX1EQ6dr++p+qKWCgJVGNzQp
         wGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954439; x=1795559239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc4tF92xQdHPstDc9OOaR7th/jMxJe62KjbX9qJMUYY=;
        b=t3L8ie8CiJnXGJpvitghTCFjwZLrCOCoPYZuCOfYrZq+P5GgWXuoLVIWsrEfJytzBx
         z4W6xwXNhVzpeyuLrGFEDiNyW9vWWWP121u/xuFUs1PthxDMhHlasjm9cDKnYkGY4h62
         CquEiti3oF2j/vn18WypeaGSQX2vU/bJkB+n4boaeV0UULFZDEcyZWS5NtPjp73sBA1h
         5yjVdrxlHs15gT6+3ZsALwd7kW6RWiD30znp9RT0tJTJP+etmLi1HvkpB9n37ZY90GZD
         GJ+JvXJJoSozoxLR5q4WBs6QDdTxybIn3cbn/c8KPIlSV9LfWuNdCNu7nMBS9cP5ipr6
         B8gA==
X-Forwarded-Encrypted: i=1; AL+hErE7UGavl9DqJmATaHKVUclxhRRU8t1eOJeCnYziHqmfEn3G1jTM9iJGDv1tmvwkODI4v7YU3w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/w7VASxx2dVQJ5OffOEk/1gd5IzLci5F0S7RAXctaXVnjLt1dN
	em2P0XeoMsHzzTCNvATWIo0KfuBhSKBs6S6jz75Jesi5Qcf1BuUs+VLMEq8Sueq8ceB0JSbJKSI
	p111vaJfuC/0tuUwQcNqmG4f6CE4gfys=
X-Gm-Gg: AZFdTZeD8lQlpXfqm/Krf/vyohLanT0A/61SW8B7G+XUNe4TsHBoyX5AwCLkV67cOo9
	H9RWPZbITAwrgxzKRvvzmptSmvS33XavJuCsRQJSAq5ad5NXHj3c45tY7oPPZjDvSye8CVYmwQ0
	ENTq5DOjkZTf07FE1KlgK0oxMmT/J+S+KG4QqYKW51nBdy8HfCq/DGiZENvz/35CA1QZE52qyzz
	RdtksUbdoFgdPQhukFostXkL8vJ6GhBbWHTu3zUX1COZ/sdVVllyyKP9z+bUbBRAjm3djm1MKOC
	vLp3W66hh+wT5Ih+Qg/Z3Wr42d+e63DFYSOJGcss4ASAhGn+GeUSrT4jOFPnQ73micJbZzyduFG
	8+M4MmX4EfAoWnmbKNfqQJJYIecY9EmoxYGYXd5eimeUNli5DNLnPgnCUTWVOZBTKc+51zBp7FG
	8KNalmf+nPMVpHueAHsmgr0P72wQICuyJF8b2AgD8=
X-Received: by 2002:a05:7300:7314:b0:375:c5e1:931d with SMTP id
 5a478bee46e88-38280c2e5fbmr1001348eec.25.1794954439224; Tue, 17 Nov 2026
 14:27:19 -0800 (PST)
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
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
 <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info> <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
 <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
In-Reply-To: <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Tue, 17 Nov 2026 23:27:07 +0100
X-Gm-Features: Aa3M54pO67MCZLcmJlYCwS3g7jZlLsxu4gjlyt9JHnihscax6mlfWNEjuiM6Vfo
Message-ID: <CAJ6F8CF5FF6-+Z6tOA7Gz=m_Cvxz-n7G=bqVY5H+fBCV3kbo_Q@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, Nov 17, 2026 at 8:29 PM, Hungyu Lin <dennylin0707@gmail.com> wr=
ote :
>
> On Sat, Nov 14, 2026 at 7:43 AM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.c=
om> wrote:
>
> I sent a fix that makes 'ads' opt-in again:
> https://lore.kernel.org/all/20261115103845.56074-1-dennylin0707@gmail.com=
/
>
> Could you reply with your Tested-by if it works for you?

Hi Hungyu,

Thanks a lot for the quick fix. Your patch doesn't apply as-is to
v7.3.4 (the context line 'opts->ugm =3D 1;' only exists in 7.4), so I
applied the same one-line removal on top of v7.3.4, rebuilt the ntfs3
module with the Arch config and tested on the affected volume:

- mounted without any 'ads' option: 'ads' no longer shows up in the
  mount options, both existing directories with ':' in their name can
  be stat'ed again, and a new directory with ':' in its name can be
  created, stat'ed, renamed and removed;
- mounted with an explicit 'ads' option: ADS mode is enabled and
  shown in the mount options as before.

Tested-by: Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com>

A minor, non-blocking suggestion: Documentation/filesystems/ntfs3.rst
says every option can be negated with a "no" prefix, but 'noads' is
rejected (only 'ads' / 'ads=3D<bool>' are registered). Accepting
'noads', or at least documenting 'ads=3D0', would avoid confusion. Not
a blocker for this fix, though.

Thanks again,
Cl=C3=A9ment
