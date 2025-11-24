Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C32EA473
	for <ntfs3@lists.linux.dev>; Mon, 24 Nov 2025 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971689; cv=none; b=YoWoT1zuc1bFRZtUX1msRNveicCgHW/wJqbc1Ji3tWc1dNBphvVT9t+eWMv5iyEVNJSDj98GzskZO6QM5T/KLeygWLQIeDURCWWlkFzXB+DPuLfmDXxyDAk/yhxJtpnR258j2ro0kBpW5q1h5zeUvez3xAgQ7Ouzlh+R0GfFb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971689; c=relaxed/simple;
	bh=lv+AEbEO5IfBluOI6lN3XPIKGE9a0yctf/Cn6smugBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzqz3J5RLX4sE2wFt4+ojbB+jMa6qXwE2i3h9xlahOlNzuXqDcXQzfGcHyXURhpmPfycKF6NJs6KsQETmbgNsQegLpgcsyk9UibtzwY9dbGLm4lJ2f6p6MrUj5vIEIDNlYKajXMteSvYQbCUfQVsdzTyGNgUtZ7NLXbcbUfaWoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9DXStPR; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9DXStPR"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7633027cb2so714420766b.1
        for <ntfs3@lists.linux.dev>; Mon, 24 Nov 2025 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763971686; x=1764576486; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLf2E3nOZAEZ9lLAngAWJ9piteS0oS4r7Jb/uJKZm84=;
        b=a9DXStPReU5p0aHKxUl5ZBvxThPTS6fvP6fHrPEwKVYPUSmhcs7appcHWUoa1LSIWl
         z7mNQkAnglKbeZwOReKv/HZ9TH5cJDjjHvuKR1nCswJHC6n+KlBp7wp87B87DqVqKO1K
         otHhz2TyNuc8+NZF314g/nlzkwCu0JIo0DLLrCLI/coEMuMMhPASZ3kTjhK58kd/ZMlY
         TIg9qpWKFqE0k94HbzTZhrhqUhdb4+GfUOW2hOY93fE6LQZKBIyIDcG+qA4Ug4RtSWu3
         +tYdsXy0Pz22GZCFceelWsH9B75qj5nTzFK56sOJaPZckUyV5Yz7Okg6DitzUfKxwjrj
         Jm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971686; x=1764576486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLf2E3nOZAEZ9lLAngAWJ9piteS0oS4r7Jb/uJKZm84=;
        b=OfnGeGYjzJvTBK/oX079wRpsanT85n0ONqoRU5hChvVmPkhOU2xlUh/aJVJQAYC4jk
         edCO/AfSr7vGPmlzz4UduUACxp2em51J/HkrQ8kGh9yDevuF4DHfLsyaIhSlsnwWsw7j
         FlRg1tpYc+QdvDkE2hNbhpwiOloxUSVo6GvCMbxZIzfof7mDTq1SBfAOdds0PMYpuVBW
         CWYUXP8utk02C3VwOU1NEqhnlSp6ZvZHKlP3CXksojyr1eJPiagUUQeRplOrbWsYmE/n
         LO+RkJSx6MWnznAlQ0xUhkYkpJMbS/E/CiLrZdtHyI9oaMBW6E9dz1Km3KwbGDVVme2z
         8ZLw==
X-Forwarded-Encrypted: i=1; AJvYcCUdoVagrj1gDHDXdkSsN2RaS+Zv5bcEkmAoP3R6Z/ezvFR5Nc6NDy7vuut1X5CendETGQd9Zw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd+q2lHVOKueNE299dwpxifFaIrhJ9NMvPbj8oHFcSWUhNZg2A
	lHj6wsXvN9Hs/z0UgRMJ9i/Y7I2C55Ddc1elo+iRKjOrALWMyLuQntqUN4auqZEZ
X-Gm-Gg: ASbGnctisXJN3Rl0BPivh+acNXkXykXm1uBD3zyoezK1aDQSxQAfh+pcbtqdGF6CvJv
	XRim4B2G4M5rX5s9Qtyi834l4qzMM5g4e7a1iOj/+j2YT+FaH0R5yxMqBWkjNraiE5xvEOwEFGS
	j8lO3+1kbA0hd3yRlRqYLvcRHmiu7+ghLk89GkeTQEiYGbTZc+Z+OJxxXntoN5WzfyXXh6WbeFe
	eclHDB9nwwF34KzyQb8Jx1OO1mXzd4OLA2xvIswGgiT9RooRVYQLPkR1PzRA4kEMgl6fWdQ7hmZ
	Hf88GTlqdvy5KbryVGLeH9nj5roO6Jn4XXR7R4DrbILbnh7GtVh7xXNkXsDQg0TMCmvHIaZnmIV
	nzgQJLvyHMyQ2pL7rbpbp/39SzoaWwSDg+at50F2iK9DusIEfVUhQReAcFWwJOeRutQ2eczUK09
	m2D4R/o7U0cX0/A9CT6x4UzfyysK3AuhBgI0PDuGnRTk274wud545uqhwp
X-Google-Smtp-Source: AGHT+IFtSDCdQoEJDSme9cNU9H3jXN99Pr9VF8AAs0+V0hbQXcsw7JNTw9He4Bb9bU9ZG0GgB3qehw==
X-Received: by 2002:a17:906:d550:b0:b76:630d:fd27 with SMTP id a640c23a62f3a-b767153a62bmr1142202666b.5.1763971685814;
        Mon, 24 Nov 2025 00:08:05 -0800 (PST)
Received: from f (cst-prg-14-82.cust.vodafone.cz. [46.135.14.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d502cfsm1215050966b.19.2025.11.24.00.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 00:08:05 -0800 (PST)
Date: Mon, 24 Nov 2025 09:08:00 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: syzbot <syzbot+2fefb910d2c20c0698d8@syzkaller.appspotmail.com>
Cc: agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, 
	brauner@kernel.org, dhowells@redhat.com, gfs2@lists.linux.dev, jack@suse.cz, 
	linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Subject: Re: [syzbot] [ntfs3?] INFO: task hung in __start_renaming
Message-ID: <v6f6kfeeur7hhpj74za4larguj2jdhz652cwvmxu5o32ivkuso@cdpkqhx5gt7j>
References: <69238e4d.a70a0220.d98e3.006e.GAE@google.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69238e4d.a70a0220.d98e3.006e.GAE@google.com>

On Sun, Nov 23, 2025 at 02:44:29PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    fe4d0dea039f Add linux-next specific files for 20251119
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=142c0514580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f20a6db7594dcad7
> dashboard link: https://syzkaller.appspot.com/bug?extid=2fefb910d2c20c0698d8
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cd7692580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17615658580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ce4f26d91a01/disk-fe4d0dea.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6c9b53acf521/vmlinux-fe4d0dea.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/64d37d01cd64/bzImage-fe4d0dea.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/a91529a880b1/mount_0.gz
> 
> The issue was bisected to:
> 
> commit 1e3c3784221ac86401aea72e2bae36057062fc9c
> Author: Mateusz Guzik <mjguzik@gmail.com>
> Date:   Fri Oct 10 22:17:36 2025 +0000
> 
>     fs: rework I_NEW handling to operate without fences
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17739742580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=14f39742580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=10f39742580000
> 

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.19.directory.locking
