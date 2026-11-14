Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794660616;
	b=pt4P266uzgbADrUkBRs8jxSL5PJEhXm0xnFl7I1QP8ZGrawIncaM6vC/TlR4pUe/X5RD
	 JnJBVwsRWZoBCSF8GBoqQcmp1YhGHNvBF6FVC24CNQfLGubW6YFiydZa086QPAAQ/vU/f
	 IrkXTIqsCU8IkIOUM99pwU8VIVfDpOvL48/+bt7Rw6OQS9OZbldlv8TEwBcXGLgfgKade
	 BgkYkcKeobYottpKg8qOUI8+QDwygNjEthC0yKCu6WpCGH6K7T5HbGh9CS85VRKc9QYws
	 DBEbj5vPCA22I0OJ9q8Nhpd3XbVN85rewIxP0TyVoPf7yeBJIhFll3p3yuX+nncaWFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
	b=3qyTAPmuI5eLWFOP1fWT1qgRoB2nVhF3CmgmqrS47mclKrWoGqSk/2Q5WIx/jJjVHmx4
	 /oZCIblLcYVtM5et8whY1ZbOyNT/zlgsuRsK3rm/yW7x0EMRu0Y6xPipSgPXqH7YmdPB1
	 3pDOA04hopEICT6kJNApdXlmGicCPYaWRD4K8Ge+nyIZVUU17x1KHZIKc7DZPaRYJqFGe
	 NIWVjBRFKLsUcXt/V+LRQH1ljtWV7N1Snxk1JAX4wfcI8a8qjp/f1M8geIUDtv1oorYw2
	 oopIalE8UGEY2ddAkoTM9Xt1GYFMkb2EElfgyFaN77SRT2E8BqR3B/GKLc8XgJCzbjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qh7mxLjC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927D606A327
	for <ntfs3@lists.linux.dev>; Sat, 14 Nov 2026 12:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8927D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qh7mxLjC
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37600b0db49so2602693eec.1
        for <ntfs3@lists.linux.dev>; Sat, 14 Nov 2026 04:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794660616; cv=none;
        d=google.com; s=arc-20260327;
        b=JXBdFkjdMVZj71cZc/13v6fbJ/L91e+PJg3DfTOVUeJo27pQFH2MrOwkbePuFZBf5f
         LR0J1CBw+gvoJtghbXmCJiZlC12Ge4ILkJsZCmvLQZCba1IDxdWXLEyoM4mbuv8pHXpK
         lZX8OSf4FsaYNAbyF8gJiQ6RVegz4AbXbuT0k9xGZbpfQwow52B2Oof0Mks+0UkMSQ1Q
         oMsR96/TJk8NHxPOhLFfikmB/0dl8FwSYbo147fnEFfjbv2ct1f30gvMsfGAkr/Gy7DV
         414dHbu1pJBru20Dofgz7wuL7VzEqqoEdYMPij0CAJTQB0Y8+U3QpxAaKfdvqbHeqAXr
         q5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        fh=v5blgkcwKSrcQ/+I/oU6N7ZkmMoFbMFptLTTdM86rfY=;
        b=QEPWJnjI+klUdL330DAptd5OvOYJaICeinml+5L5AHjXfipOwAX4TUX3rIis7izbB6
         JTTIHQe+CiFKmq3z+A4IK3XuPbKXuT0AAV9pTWPD753ciMAY5frUe1OqV0V4FdYZaF3K
         nDr8rkNGFtnEZ63S1O87tt62eGEcfZ65ywCLl7c8+JpYjvGta2g8N2nDOgqT38a12XZX
         +QcHP/MlKh6KnaKWmJv1TnbCaYR1/5zxfUtyAIs0404u/R9rpuWf4gXpJ7mOYlxobPSs
         0fXQLsTAVolkXn56vteE7s3ckVi+vs83nF3NNxTmWTVVXzE5SW3K3WR00kIOr3N/PEzW
         u+Ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660616; x=1795265416; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        b=qh7mxLjCMTyRS4fpeH+57AJ8BpKiFHXGRz8vMG+62IlIgPscQLjcN13cZCCwVVmMzQ
         71k0/9B1k+LlxADb2zmBw6C+whnlZexpOo1ZHKHIofTqBwx7sIPls1vp5uy3nf/vAhBE
         q7l55B4eKakPeOmpR7vgkq+EbB5WLDAzTvzaGR/YSevIyKTdz+BT8yrgexRBmzWcCgUm
         R29qSzAer8Uz4OGqnxgTC8ZA8xT4BsGoyDszo7FWXtZCUK9A3UxchmG6AwRN+o+7VUnp
         yjTQicIDExERHAH8Kvk+QTRBBUGkEL/OhEWtLjMhBwKu1/jEmgg5wGw+RNUTkGTul0vV
         vjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660616; x=1795265416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        b=CZmeuTbe3yn9UY7H4I2fhV/wuTIeOdjHd0+vlR8Q5/pGfrJheQTZ9r1QZY3Bq8aKFh
         EcDjTthS77xTMp2N5kY2oNciYebjFRlWdqYUN/BdghoUnHdHcj2is1Wtp5ikGVullk2G
         /A3tYRog17J9c8i+8fQo5KUoMlQcFBNkipzkyVFlLbtuFq9JRzpVh/LofWwMBP1+Sl1C
         MD3EcxDpws1PVvZF+xu2GL8aS2EU4TFPWer1tFPMZdil0IGiW/kRgQJn1FTJaUHzfIPl
         mxNXxJd8+9RORh0UA1cq07EpjdAerUTZ7SnZBcI4gNrNhh0WGeXQKpuZdxswRpoLn8Lx
         RSsw==
X-Gm-Message-State: APuU4Z9klP8X+3mvLbqVgPkwU25hPmHq9fWZQdiaFQfUKsNi1uX4W4zn
	lslsXvTGUDWv3pETAX/RQQ249bPR1eOfqGIz/zGkwFGwP93p5e76v6jy6P/u+FjFOaLM7Y6NGHN
	Z3AVCeQOpbT9Hb8Oli4Exi9NKlG2LUQM=
X-Gm-Gg: AYBFou00UpAxEdWs2Pndva+58neiuy6HENEEcE0pMJljtN2/aeB0nHsrwQ89ZDkJD1z
	bL6IcHSC8BvhE+kFdp34ECbIZHcwyq81G7S7/sQ6b0SUzOGNrp4+AVJ8WG93oxOGWwWf/gnb1pU
	meXhjCppr1/jTLThZrSKu5eyR/wEwMhWtyneCSDTSFZkYRIF3p3Y9nyB3eSclswbICt7Y8QB0HI
	uQy5IhlcVdvzq9NGfCTPCRisWVz7o8ZaZC+AbgSaEKHTQNC6lF+590YHkkYBAtIaJYR9pjz6KB1
	l5QUx80MPYn1+h4KPwvqHJZ7oRrmXBdoRISgwVjU7lMx84szXDiMIJrhoNPBV7CegWRje6Yrwat
	WGT+nlBlg9eiXYLgr1jz1xv/rFtOD0uHUdMhvY9RNB0fCWCtDrmasKTRpQ2fpJSgQEp69/6aTrj
	9S69EXuQeSpew7DHA3QgUFKmjIZNO8Xk10NR2LpK61
X-Received: by 2002:a05:701b:2608:b0:1ae:d447:6c84 with SMTP id
 a92af1059eb24-1b4f5f6471emr6935062c88.19.1794660614833; Sat, 14 Nov 2026
 04:50:14 -0800 (PST)
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
In-Reply-To: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Sat, 14 Nov 2026 13:50:02 +0100
X-Gm-Features: AclHuK_R76m67a3L3t-pYvKsH2nE90VH0yHZRxCdMvakyYIbxZrTCTjMoJpBnWE
Message-ID: <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hi Konstantin,
>
> Since upgrading from 7.2.11 to 7.3.4, files and directories on an
> ntfs3 volume whose name contains a colon are listed by readdir but can
> no longer be looked up: stat/open/rename/unlink all fail with ENOENT.
> Nothing changed on the volume or in my fstab; the only change is the
> kernel. This is caused by commit be310476e886 ("fs/ntfs3: Add basic
> support for alternative data streams"), merged for v7.3-rc1, which
> enables the new 'ads' mount option by default.
>
> Example (the directory was created on Linux and was perfectly usable
> with 7.2.11):
>
>   $ ls -1b "Game Soundtracks" | grep Reverse
>   Reverse:\ 1999
>   $ ls Rever*
>   ls: cannot access 'Reverse: 1999': No such file or directory
>   $ stat "Reverse: 1999"
>   stat: cannot statx 'Reverse: 1999': No such file or directory
>   $ mv "Reverse: 1999" "Reverse - 1999"
>   mv: cannot stat 'Reverse: 1999': No such file or directory
>
> With 'ads' enabled, ntfs_nls_to_utf16() splits every lookup name at
> the first ':' and treats the rest as a stream name, so "Reverse: 1999"
> is looked up as stream " 1999" of a non-existent file "Reverse". The
> real directory entry is never matched.
>
> Why I think this should be treated as a regression:
>
> 1. Userspace that worked on 7.2 breaks on 7.3 without any
>    configuration change. Names with ':' are legal on NTFS (they exist
>    on volumes written by Linux, by ntfs-3g, by macOS, by WSL, ...),
>    and they are still returned by readdir, so the directory listing
>    and the lookup now disagree with each other. Tools like ls, find,
>    rsync or backup software report errors, and the files cannot even
>    be renamed or deleted to work around it.
>
> 2. There is no obvious way out. The current mount line is:
>
>      /dev/sdb1 on /mnt/HDD_2TB_WD type ntfs3
>      (rw,noatime,uid=3D1000,gid=3D1000,dmask=3D0000,fmask=3D0000,acl,
>       iocharset=3Dutf8,prealloc,ads)
>
>    'ads' is shown although it was never requested. Following
>    Documentation/filesystems/ntfs3.rst ("You can use every mount option
>    with no option"), I tried 'noads', which is rejected, because the
>    parser only registers fsparam_flag("ads") and fsparam_bool("ads").
>    The only way to get the old behaviour back is 'ads=3D0', which I only
>    found by reading the commit message.
>
> 3. Silently enabling a new syntax that changes the meaning of an
>    existing, valid file name is also a data safety concern: with a
>    regular file "a" present, an application asking to create "a:b"
>    now writes into a hidden stream of "a" instead of creating a new
>    file.
>
> Could you please make 'ads' opt-in (default off), or at the very
> least make lookup prefer an existing directory entry whose full name
> contains ':' before interpreting the name as file:stream? It would
> also help to accept 'noads' like the other options and document
> 'ads=3D0' in ntfs3.rst.
>
> Workaround confirmed here: mounting with 'ads=3D0' makes the entries
> accessible again.
>
> Environment:
>   Linux version 7.3.4-arch1-1 (linux@archlinux) (gcc (GCC) 16.2.1
>   20260810, GNU ld (GNU Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Wed,
>   11 Nov 2026 19:02:39 +0000
>   Arch Linux, x86_64
>   Last good: 7.2.11 (Arch)   First bad: 7.3.4 (Arch)
>   The Arch kernel carries no ntfs3 patches. I have not built mainline,
>   but in v7.4-rc2 fs/ntfs3/super.c still sets opts->ads =3D 1 by default
>   and has no "noads" parameter, so the behaviour is unchanged there.
>   The kernel is tainted (OE) by out-of-tree nvidia and tuxedo laptop
>   modules, which are unrelated to the filesystem path involved.
>
> fstab entry:
>   UUID=3D717D6EE943D0AF06 /mnt/HDD_2TB_WD ntfs3 x-systemd.automount,uid=
=3D1000,gid=3D1000,fmask=3D000,dmask=3D000,noatime,exec,rw 0 0
>
> #regzbot introduced: be310476e886
> #regzbot title: ntfs3: names containing ':' inaccessible since ADS suppor=
t is enabled by default
>
> Thanks,
> Cl=C3=A9ment Smagghe
