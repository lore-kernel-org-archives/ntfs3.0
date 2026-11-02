Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793631257;
	b=r/oO3EfD6uRNwM+7W1MXzEADEyX7XhRisplD+fHoG6K8PvscGvNAsxMD3tnneNbsS+JV
	 aqyYeJZlM4RDWp/3aJrXLBRdfbjXud4B5gStykpqCdKUkPAI4d5FE1A3YIolCNG2AoRsK
	 XiVRBFXXDaENDQ/gSDxZwvan5yK5EqyzKXw8/3VMfFx5Ka1Za9lI0i+Crv7tcQm9SeEkR
	 ECL0OWOXcMQzb4vNSpilvvEdYi3uRVygMa73/GkQW3/Co68wsndlQFVk6Qfy+7s5rPRin
	 7GgA0RPTUBY6Lw6eNIRPT5p358tf/o9QYXGQUMpuB9bzENi9A9KM9Wr44aTNqbRD3nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
	b=zVgRy8fMKjlvjF/TJj8B0atWoQtr89PsiQDCxtOxFy3pdrN8TXiE59+718fy6sWY2+Sp
	 9cX4OSzlNnRCW9AZmLL58+ErdbggoI8DYYmHXyhZG2XXGLZcZ/PWGik/dirpfctDHIys5
	 wBY4FHh3i6tpOeYFblln7ouEBDGSVSddk2Lh0y+sc6e8G04obuB8SfSYZvNVx+FoLhTik
	 fp9L04EkWQJPzsgC7R26K2JJEueP8udb9LBEJc1jMlI9g1UEA1cjejRNh9BqEuBz298YN
	 DeIYQfX9ttNIZpXVnwhIbQ+0F4FOR93qe0bQd61zrT2BQfcrNUw7jGxdSfhHe2uqulg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEPyL5xp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A2607A8A2
	for <ntfs3@lists.linux.dev>; Mon,  2 Nov 2026 14:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E5A2607A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEPyL5xp
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4550d8ab15so366157166b.2
        for <ntfs3@lists.linux.dev>; Mon, 02 Nov 2026 06:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793631255; cv=none;
        d=google.com; s=arc-20260327;
        b=J1VtV7pOmso9PrtX+U4SEBzAilV6avbyDxg4yFZq795b6CAnUi0Kh+K6iQnQmVLp73
         TE3K1Tm7vsZLbOnNDu38W4521MvSVA2+JfSaKo15YIJ7H1/eO3z5/zrjgNNkkmWNeRg5
         u1Aj0KYdt2mwlCAoDd+Fkc05j217pI/IAKSWwrLMEMb8dtQIs4KA+6QlG+WJ5wWXiTJ9
         E34A9djL8BIbM1a8ia7ccjUi64CrYPZ2SiOnw/ygEYhCDFS3O37IyJRdZ7QnDIRvd4yR
         M3BOTctQDOG6fjr+H6q/zAyA5Ca9fJN3GTsgEH70CPB96TpWi2nJsU/juCs3TyVpOIsJ
         suxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        fh=9IJKbq/N5U2rv1iVeiRkzoCRKWRSAv9kGqSiyIFRpQ0=;
        b=NMjTOL5eUaRo0uuUGx/a0eavW+D3xgYXZUvaLcr3uOy9LC6sLOQiH2EhfUKbWYVMCe
         qY/iLW4xyj475kL3bzNwcrT1ou2pci+Wp0SvsA1orzRx7ZayR5ERFB6VQaHgK6/uAXcv
         ZaMOTwxAA9sbVur1wmOeq0r09G3Bt7vjBHRx2t1xM/uLaHmA3Df9+1yLPjpntd/QYIGa
         eFRY8ddaAs7QapqIu0P5oF5ASdf61AYpyD97mySf+svPpA9YFLJB7KdzIE2/YMX9X51R
         dmT0QNUiLwNCiBPFdxjFgDNHmMG+VYHsYTA2hw/v7vjaBdB+jDlyk2KLDcPW82myQEow
         X6Aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631255; x=1794236055; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        b=sEPyL5xpkpDb1+VnPuA4jOO6zJhcaOso7I8Xiry8kSqdzS5h3a/WXwhB7BPxu9y18f
         ETEqer5eARSDrgPLxLRrOyuDBsilduvx3Pv3lLSUpjKqfEdvWr2IBWfz1qkcFGKlzEtD
         uWegKJl2VOZ0umrFC5S/0PXSHyo+Ussg//AX9Q309QOQx2VYpGRVwK4luKs1bmsEVj3+
         Hq1NyJ8AmNbR8OMCmOFD3JnaTyiAmfujg/AhC6azutXS/GiPBs/rfceRp8AhrAQhW8qE
         ssCoF+GCoaSgm3iR9BJScMpULxe9D5OgjiM7Bckkp8hd73pBu11iZmsWKI4O1JtmMCez
         Qxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631255; x=1794236055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        b=w18sc4la73JTHLZS7RGIosbZ4VGpsGmXjtu1UcJcdgqQddHZbl+rRJMF3mnNHZyRTT
         PCwLyMUug4xqwyRqfmryL1ZBXakSt42PNRChhSdW9r4W+QnAKIneXkxAP2UOZkJpAJHm
         03wD5V5B+rWdnu4u8yCxLrArI/cBWYotN5gdGcYgUic5J1W1u60uvSC6C5BW7tVuN64J
         4n5E0WTJBZqN91Oiq2sg0rL7wbjf1ZgPfJY0OX/IXaoyQGvAWvHz671a1Wx1Wm1ilz6x
         a+H0B4iEHOMG8vkFzgxJKdK9cbGHABSwgjrdkuX58rQ8E4SCRh5c+F+rrB7BwhmMwbHJ
         BcTg==
X-Forwarded-Encrypted: i=1; AKwUvBxxHyE1Ww0HQT2Cqyj3ohZGsiSuw0mud2ttgUt3dhCJk3cKqPMWBlZIwL6ZSS63rOvVsOCk9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8v7xc9u0bcEksOLZc1vMcPzHNufs0lui6wy/OJ6ogfIfdgAVhQ
	EHLW6nnfNNRC6EzRwtXIpcZo3j+mHrRiUDcm3z6jkqDv/8cM0uMrk8uZ/oxzMzdJFMyMq4HEeGs
	xGv7DQULX4jksY3zGtr0m52vMKEmTa1I=
X-Gm-Gg: AYBFou17rqvKK1J5fpQKZR4oxnC2cFCH/JN0DiZS2HL/2ezg1BEriXTXZ/vLsMpHGoB
	4jTdQBCum20Ep+k+FrW8dGApMDyxen+1ermZMXsVo7eDNLd2THSCrDv121rT7gEfucIrKpiCO5I
	F8fNY3F6o4Twa5UNdt7oluuaZqUl81SaUyrmF+DyHs2XuGoi/7orqcbOwhY0fgGizGfYSLQDe6A
	9+HOb+Q+1td/2PuIpBOWX/zxrfP+xiwwPbACxA6azOJy7WBPSuTrNllNbYksWzuQayrF3XfPY8L
	fa2cGAJTT2/lNmYcwOyx5qHwMH1YHNvJFxDaRKOiBBcgoJREjkueir8aKTJ20IY+M/lyxdbgWaj
	tM1gTlPT5/67SjsE+p1Qg5kwFP4eb0zzoAJmlfwRsrwcrs9HmsbQD0lfG6dsRMJktEvqTVLJbOx
	ZF0uSDvBwXylNqJZM=
X-Received: by 2002:a17:906:eec8:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c4ca7aac250mr889529566b.27.1793631254792; Mon, 02 Nov 2026
 06:54:14 -0800 (PST)
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Post: <mailto:ntfs3@lists.linux.dev>
List-Help: <mailto:ntfs3+help@lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ntfs3+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com>
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 15:54:03 +0100
X-Gm-Features: AclHuK8MPfC_dz5RbDokIFz7RFGIRe7sv4kFXfjOWYu6Sb9FQLskiRuGBNP5Y1c
Message-ID: <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
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

On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> wro=
te:
>
> This is an initial implementation of a new timestamp to indicate the
> time when a file/directory was initially created.
>
> This patch series takes inspiration from the one by Sean Smith
> <defendthedisabled@gmail.com> [1], but using
> file_setattr()/file_getattr() as suggested by Darrick J. Wong
> <djwong@kernel.org> in [2].
>
> The semantics of this new timestamp should be at least these:
> - it should be the same as btime on a newly created file
> - it's user-settable, so it can be preserved for backups, filesystem
>   conversions, archives and any similar operation
> - it should be preserved every time mtime gets preserved
>
> and the correspondence with the other timestamps is as follows:
>
> ctime <-> btime
> mtime <-> ptime
>
> Examples:
> 1) a .zsh_history file created in 2019, then after a few years the user
>    decides to switch to another filesystem, copying the .zsh_history to
>    the new home, in that case btime would have the timestamp of the copy
>    and ptime would have the 2019 timestamp (just like mtime would have
>    been preserved)
> 2) a symlink created in 2020 from the home directory to a /path going
>    through the same process as the .zsh_history, in this case it would
>    also make sense to sync the ptime to the 2020 timestamp instead of
>    keeping only the btime (so the inode creation time).
>
> The proof-of-concept code (for testing) for stat(1) and cp(1) is
> available at https://github.com/koraynilay/coreutils (master branch)
> (Note: these coreutils code changes are a prototype and won't be
> submitted upstream as-is, but they work as expected in simple stat and
> cp -a/--preserve=3Dptime tests)
>
> Lastly, the name "provenance" and "ptime" are not final, I personally
> don't have a strong opinion on any name, but while testing with stat(1)
> I noticed that "Provenance" is definitely too long for the normal
> output, so another option which would fit well is "Origin time",
> abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
> conflict with btrfs' internal naming and create confusion.

FWIW, I agree that given the existing uses of btime and crtime in the
kernel and various XXXprogs, using 'ptime' for kernel code is probably
the lesser evil.

The question of how to display this in stat and tool is a different questio=
n
that can be left to the userspace developers.

The UAPI headers uses Birth time language and stat displays:

Access: 2026-11-02 15:22:27.067329367 +0100
Modify: 2026-11-02 15:22:27.067329367 +0100
Change: 2026-11-02 15:22:27.067329367 +0100
 Birth: 2026-11-02 15:22:27.067329367 +0100

If the UAPI headers will use consistent language:

+       /* provenance (settable creation) time */

+       __s64 fa_ptime_sec;     /* provenance (settable creation) time
(seconds) */

I  think that the man pages could be unambiguous:

stat(1)
       %w     time of file birth (immutable), human-readable; - if unknown
       %W    time of file birth (immutable), seconds since Epoch; 0 if unkn=
own
       %p     time of file creation (mutable), human-readable; - if unknown
       %P     time of file creation (mutable), seconds since Epoch; 0 if un=
known

statx(2)
       stx_btime
              The file's (immutable) creation timestamp.
       stx_ptime
              The file's (mutable) creation timestamp.

And userspace tools could be displaying ptime as:

Access: 2026-11-02 15:22:27.067329367 +0100
Modify: 2026-11-02 15:22:27.067329367 +0100
Change: 2026-11-02 15:22:27.067329367 +0100
Create: 2026-11-02 15:22:27.067329367 +0100
 Birth: 2026-11-02 15:22:27.067329367 +0100

If they want to, without that being more confusing than Provenance.

>
> v2 changes:
> - fix permission bypass leading to ptime update on immutable and
>   append-only files (found by sashiko[3])
> - normalize ptime timestamp as done in fs/attr.c:notify_change() (found
>   by sashiko[3])
> - fix wording in vfs patch to be like the cover-letter
>
> v3 changes:
> - vfs: reject setting ptime with -EOPNOTSUPP on filesystems that do not
>   support it instead of silently ignoring it (found by sashiko[4])

Please see my review on patch 1/5 on exporting the supported mask
to userspace.

> - vfs: fix not being able to clear immutable and append-only on files
>   with ptime, and allow updating immutable/append-only atomically along
>   with ptime (found by sashiko[4])
> - btrfs: validate on-disk ptime nanoseconds and reset to otime if
>   invalid (found by sashiko[4])
> - btrfs: avoid re-assigning ptime on unrelated chattr calls (found by
>   sashiko[4])
> - add ntfs3 and exfat support as suggested by Amir Goldstein[5], but no
>   vfat, smb, or nfs4 yet as they are a bit more complex

Please explain what makes them more complex.
My concern is that I would like to see that the proposed API fits the exist=
ing
fs and we won't need to change the API again later to support them.

Thanks,
Amir.
