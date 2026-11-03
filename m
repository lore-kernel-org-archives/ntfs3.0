Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718782;
	b=Gxn3x6EuBhTd9zhMaDXl+hM8dbCdNGyPKsXaXOY9nD5BB8G0NB39RCX6T4ytlulyuppX
	 ZecusOxlnl3+TuMToTHR7XH4bLlRGDOcyuKhFsdhg++9OSa1ZN1PtqyBqHLjBx+4WM6W9
	 5KBFmcJbHjMC/Dh5mQCtuV1sMB2vNcso+0bPD7KOVFNbD15ucKjgWw9SQvYpkGb/j5+0Q
	 c+DrWjWjT6nm8kXw/sT93SDs1Xu9Tj3a9o9TfVvWuF+zrloAjQ46/AKXJ/SAlBOBSRLev
	 uqIAS6cBHQfAWu3wDtZYCAzUFEpmmvHto/D9tCEWuWvRwrwhrKVrkIcf3R+gk7tgowQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
	b=g0WZEXEYi7A9yMgsfbTrDCp/SqnCE1LKdRMMWwjF5071wFzGSIqp8d6sZ6uZYaee3heR
	 UIN06ECsNjMpysNG1VbGinJYX3PTWIjtY55BsjI017f4yh7A513/i+rU4f6IVw708Tclp
	 //i59x/uYJnm52S0RItLM+uNbjUNMv2qnbetQrDZS070+xWmWHfzDVDxvuKJSfROgxqgs
	 P+ewtqsz15ESScZD4RLV1H1lX6OD9mhAPFQyfwzwGq47ZgGtn/rcGZ8jth4rZJtniKZjs
	 OZ84QWVoakPWruTLewoyafRff58q2MKdgyWW5gmvsE6VosX5uHR99mN4BCTI+UX1uYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T/l4Ivd7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A682606B26C
	for <ntfs3@lists.linux.dev>; Tue,  3 Nov 2026 15:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A682606B26C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T/l4Ivd7
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso1287920a12.1
        for <ntfs3@lists.linux.dev>; Tue, 03 Nov 2026 07:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718775; cv=none;
        d=google.com; s=arc-20260327;
        b=I1ySk8lpXgGMya8vrnKQgJSifuFA+KJPCoPF9HUn2XgoKGG0dxGuvR8vt5XZborN62
         KMewlZa7/Azxy2CALD3OK5NKofNEZHmboSxMDvFDYmlQ8UYjU0BbChV3x96rGmTz6oNJ
         A/Nlu7cBMckk5yTFff3fLnB1dXBDE2bY4pqYHKB+v9xfAb3XVEZzWzapvJciQVYB5PHC
         5uA4a4Pm2bTUOg7nIvLjqFgzC+pfYuiztZ/QzEn426nsEFUYZt5ID2eayNjboGMJi87E
         GbGoUTSiD+1EtXCdKup6XmeZbRu2JaE4Eac0iX7wj7mZxBMc7j0KInoKujHU6K+9wVIK
         5uQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        fh=k8xQsrM+ez7czVEvTkXt94iYZ0onSg0MWeJ+y+X+4Rg=;
        b=FQYA83oIACs44M5SAJUiy2/XCrmHAZRG2JUZD0lTZ0hLrUlgtHi4ZQHheJjpQBB4/v
         7OrTmchE3n2SlBVvMARPkB6YJAbqcu8HyvEXZq8Tvx92IDcmNHvYGsBn7Ar1wTD9B58D
         nv8of730sMiPbmpmmrTLe9oQByosQaJxk6NB6N/+UGU01UcUmp1+BOn3SXRfIbLja1Eo
         yn1HqazMAZg110l0i/cxHkQYSNo0UHiVy5z2GXEb1l/a32pCkpm4+BoSw2RIP7m8BLA7
         8WrfLibrDL3JgRtkmVJsEzY3AMkxouX3sHvIL/ptfMnZmB3ZSifZESRYSqssu4KsihPd
         sFWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718775; x=1794323575; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        b=T/l4Ivd7S7wh+Bqm/ahmY0ID8RAHMbunJ+xSJZXx/JU6CnrKgmfymMghTXqF9B637d
         sRJwizbhokInVKwBi209+vm20Fi035y1XUZsBJ+HqrR6wjofLAo2A3q9JIVpw1fmM70l
         PPJ+mt7EKH28iz9DpHnKslQ3GJCKAmuBDJwzZKyBZshrGq2jo/ORk/6q0BBhFKiwtQ/E
         5u8IgkziQ0Dn5kFG8h0kiWwWfuWiB55Qo3G8Bbtde2nmgTAND279+x5r4Sg/V4aVDr+y
         +QnTzVU21DIwbMN8Ortt6VMFhOxA1sHI2HMnMZY9UUvWT02UZof4MuvWzGbLGjkpUvtc
         sueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718775; x=1794323575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        b=K8z9P8dos6DjeRyFpfVu0z0LIaU9xK4QkHbd8I+cjWAIo00c3eH3tdKZCOEe59ovCt
         PtaCMKt4QXYmgFpKMyrR/r+UCMvYrGxHPLVW15gB8arTSnBuaggJ+mfu9MIvCTXjw5sS
         nFmwlUytrwU/Kzlqlw0n5EbhIOaZhNHFjEN/sBw4DGFDSWffxqnMCMRW3AMnnGeVyAsQ
         VA2+7OqdE9l2cbq2wuauq9H8PEutVnWKWBiQg3ai+IYO6tjznG+ytSt+naPP7Tt/WwUP
         mrG0cS9mMBrRsc+v+3tn5TXWGr5dOgWjfxLRPz+VTPRiOqd7MvV0dr1qUjoOcus8oXhy
         dFRw==
X-Forwarded-Encrypted: i=1; AKwUvBxhfW2lbMGdm3cPBz6O67VTERmzqMG0i/id1GyaLXm2ZRZOly9oCXAuY8bTocYu3aMUAu5WHA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xveFKrzlnOUargVOVmGrGWKwPuie6zbOYqqrv/RPweDWHj5eE
	4VkMRcr9ay/tFtZU0B92ncR7pbBfbZy8CiA2cPkRQvpOW80NQQOg5doHy0riXIiQINFyNQ0QL2F
	xZDaa6IYycWOvzmm61WUX93UxC9cLsqg=
X-Gm-Gg: AYBFou39oqn5KGQArDJqpvgcdLmvlakntednJznKu3pdKUzsVSiqvkS/S3j8B9hi4tE
	lTq8AAtI7m75axttj78DQvDDpy5OqtXHsdebSeOhzODy+t51kSz1wPlSJByC+uC+0M4guK7DyuF
	BieBfb29j2gPjVEioSiWV844P2MdUO92oZhU73gIX2I6gikdrB4SL+GKVYWUaeVqSreXZglkqab
	a8R4qE4raF7YHXt2VIGrhujsCIvHfhkEUAUlXH4n+pRuhJ6zlj6qhA6c+h+Yov84RKuLTaXnotH
	ZOGS1a9nXmDL9tuysmgjdjYedY38Z7yyyOXSchE/pyw4O2lTxK6UAD9bTLTcm8/06c7nZEB6jvW
	yeU8CyS2QG2EMrmNTWFGGkG4In4dshOmzbymMABT00+E1NLWnD1HFprUDH1kduyPe5+aIXAs=
X-Received: by 2002:aa7:c716:0:b0:6b1:c521:ebda with SMTP id
 4fb4d7f45d1cf-6b4d5ee6c50mr6756533a12.14.1793718774731; Tue, 03 Nov 2026
 07:12:54 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
 <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
In-Reply-To: <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 16:12:42 +0100
X-Gm-Features: AclHuK8QI8V9NvEKNRSnDchTL0FslmV7Uh3t35Xsoq4Akwwc8XamtLwVFdORxbE
Message-ID: <CAOQ4uxiMLDgMXuij99-43UfCqfZN2a=CTet560o_RzU2m_Y4SA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/5] add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 2, 2026 at 3:54 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> This is an initial implementation of a new timestamp to indicate the
> >> time when a file/directory was initially created.
> >>
> >> This patch series takes inspiration from the one by Sean Smith
> >> <defendthedisabled@gmail.com> [1], but using
> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
> >> <djwong@kernel.org> in [2].
> >>
> >> The semantics of this new timestamp should be at least these:
> >> - it should be the same as btime on a newly created file
> >> - it's user-settable, so it can be preserved for backups, filesystem
> >>   conversions, archives and any similar operation
> >> - it should be preserved every time mtime gets preserved
> >>
> >> and the correspondence with the other timestamps is as follows:
> >>
> >> ctime <-> btime
> >> mtime <-> ptime
> >>
> >> Examples:
> >> 1) a .zsh_history file created in 2019, then after a few years the use=
r
> >>    decides to switch to another filesystem, copying the .zsh_history t=
o
> >>    the new home, in that case btime would have the timestamp of the co=
py
> >>    and ptime would have the 2019 timestamp (just like mtime would have
> >>    been preserved)
> >> 2) a symlink created in 2020 from the home directory to a /path going
> >>    through the same process as the .zsh_history, in this case it would
> >>    also make sense to sync the ptime to the 2020 timestamp instead of
> >>    keeping only the btime (so the inode creation time).
> >>
> >> The proof-of-concept code (for testing) for stat(1) and cp(1) is
> >> available at https://github.com/koraynilay/coreutils (master branch)
> >> (Note: these coreutils code changes are a prototype and won't be
> >> submitted upstream as-is, but they work as expected in simple stat and
> >> cp -a/--preserve=3Dptime tests)
> >>
> >> Lastly, the name "provenance" and "ptime" are not final, I personally
> >> don't have a strong opinion on any name, but while testing with stat(1=
)
> >> I noticed that "Provenance" is definitely too long for the normal
> >> output, so another option which would fit well is "Origin time",
> >> abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
> >> conflict with btrfs' internal naming and create confusion.
> >
> > FWIW, I agree that given the existing uses of btime and crtime in the
> > kernel and various XXXprogs, using 'ptime' for kernel code is probably
> > the lesser evil.
>
> What do you think about the origiN time (ntime) (Origin: in stat)?
> It would also coincidentally be alphabetically (ntime <-> mtime, n -> m)
> the same as btime <-> ctime (b -> c) ahah.
>

Honestly I don't know.
My new idea is don't publish it in statx() at all.

Thanks,
Amir.
