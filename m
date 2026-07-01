Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A510281525
	for <ntfs3@lists.linux.dev>; Wed,  1 Jul 2026 23:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948735; cv=pass; b=n170k7xy6sEYOLxuZ4Zn6+/c5IXX5mp7BBV2T9y9XpYNxUE2qWDB6JKYgabi4K493Acmkzw1QZDb4lCBroubAdpJMhvdykJ97c/9N0CEEp3KeK0KJalxNsE6p+Ryl0hHwWZeZFjDXcfUztGW/OkBNTEE/xs1Kgdb5i0U5c0PVwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948735; c=relaxed/simple;
	bh=B2/oSlFs5R6t2oDTm1eJJJBzuJEmWWzsRxIbdDpedRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oq+3sXjFG6a9wNjJ2/ZT6eCT5mb6OAkldYpHV/rbWbfmhX0eF5OpE3Oj/KGyl4zTSVj7oJ6WdRqf/tvCgYJ6AFrizmh39toVSwN/SBH+sLHjphj9TN42x0OaTzxy5X5YMJNe1rwMXj6m6WCar29cTmIx25kI5BVpTm9gNgmH298=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7/5viao; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7/5viao"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c122e938085so61484866b.1
        for <ntfs3@lists.linux.dev>; Wed, 01 Jul 2026 16:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782948733; cv=none;
        d=google.com; s=arc-20260327;
        b=S/QZeIXts01jtCk9nLqH7EMPZMfWNaPmGTSMLnMLGIIVvnxDrEsq487i+6JJWVa/DQ
         ijK9i8AlhoYWL3C44a/1OdEjoqFH6SZwYIji+zkXMZ7BrZ7Day5+PAbjt5mGU8VrDHwG
         AGuQueuVtO9azWDUTA8IpI0USPTLjUMWeJC88qGaOa6531sowUcGZWRXwA6QaGRG8dqH
         qnq3iLMfRJJYp/BWivRzKkNL60/ghYRMESXmRkzDeshRpXtkJp0uQ2XCB8B/3ofm8f+R
         CDkU0GWWSQV1qvedkEGQdCoX8rQPH6CLC4eKx/7UbERLKkhb8GoZWombskzgM4c998bR
         Uo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aEtvomiAJhh+AZYjRz54TpoQYzbI+CDCJW/Z4a3FJPw=;
        fh=7PHZFTbEAjhoTM6a6Q8FmrerRen5uGU2qrZAuDs4wdM=;
        b=DGr7WE0pyf+5xH/LVBb2FyngPtbJJ3LkUpYdscVRAC7CFeZkglfEQaeZk/RDORnwXG
         TGhCNpBz6B7+FN44M/SCem8ORTedtZN1PWxgpq03ONt6qFJmA0DaSqmitoLyTYuMGXqp
         G//kAUg+Jbzk6Y2OggZ4B9jMkTiK6Mk1PT/xNooJOS6xRO1Y2Npchr2yrZj7yDUEfVXH
         TNT9Zb+j+rnRodtm2X+4Gc09pOOiZzwguqc+89SUe1aYAv4cih2fqV3pqC6vD5/MRfCq
         vuH7J/mRXDoWG+ZAbzVDa7o736gn72AbHiA50uEyuu55F4ZtJjSzBXp/C5sUvmEwkS2k
         IsPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782948733; x=1783553533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEtvomiAJhh+AZYjRz54TpoQYzbI+CDCJW/Z4a3FJPw=;
        b=E7/5viaoHTlY0poctasQDPZWzVTBpvcxqBXWwZi5L8pfOGQQ3sJbBbSssatGlYhbBB
         DWiufxmZdS0jUFM+ld+RKy59TV0V1bemChwTIexXHJu2gEvV+PsgJz6luuInyQNoPULn
         1aOWsMYwO5FeQeWsx7ffVU1VdEbKK1z3KjD1Sqg2LaGR++BVGCEkP26aFhg49I71hZaz
         BWXhdeQqXtLXFDi2+0/K4Q7BAvJJgDpcwW5L5OVXk6thVOH9T7gIi0lf9NzaeGo4Fj5v
         xniUJldMl5qV9BvPJ391L22VjTrnyxr7ZtVPJy7b1w/i2IEAnUC/0+qf3+cnyUKZGaGc
         T3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782948733; x=1783553533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aEtvomiAJhh+AZYjRz54TpoQYzbI+CDCJW/Z4a3FJPw=;
        b=XUlKxeliW1R0to79AOFhVr6s/VwFPTLDXhkQDpc7o65+gurYYLNPWlo/F43fcYg0nj
         PnL172ag1UbWvBxiHXyjPs7vVKN8x1o4vMBR4dA5VDySZ2G+bTkIV7KobGVe5dqviiGs
         1ALo0qHUOehjVnEZMXgY1Zat1vAF44FLQSTXjxbQo3XZXeB4nLKIx0t6deekmQGiA6Lx
         KNhcV1XngD1/o/IxUBpt0pWsual4hen4wXKQtd2pINo2f+usENKDAjQmB8+SiuhZwnh7
         0YaojF+XGZH/eRwTbckH2gPQkgegkYikbPzkFE7NopgrgnhO+bZx3ixONyhKeliqF09g
         fW/A==
X-Forwarded-Encrypted: i=1; AFNElJ/ihkaatuWR5aEhoVfZyELb0edIdYWLja+hMa/BP8Of98XUK3mxqV+f9FOssuFRo1zeAwombQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YytfLhiove+p56jYUf4nFd8jyv0RM1Nq+6VOo4RYpUpXk5+0gpC
	/71yClPG3sDYuGm47kaMJVOYv9GWlc3h/dGa8jtHRIS6cK7iNlxKr/01dmhAKY/uPTzEKmPGVmU
	s8ZHO/483Wf+skwXvgXoTuXJfUFBr3Ko=
X-Gm-Gg: AfdE7ck5dSB6sYbcJWa7DgIWb2mYoipwt9OvEHabjmYdDqSN98AokwSHFhvUPcAYBnY
	1oywcw1ZGaKcEe+nN/ljVkHa7kZFcx6E+cVx+b4N11vmyhXaMxeQVPBwKm3Xv1MoSUyu4322EFm
	qjEEZi00lxWXLH9tjI7LmWPOocfi3j3+rzG9QK9xo0g077BxGHuwevytCX1l1ljUWbEkf1Qgwl4
	WEArN4VsE0MAIq+2/G2n8gyLdYydj2XVIyMpLuQoIJtMpLTFku/x5Rdw0Xuk6j7FQovUifN2Q==
X-Received: by 2002:a17:907:8b9b:b0:c05:b9db:68cc with SMTP id
 a640c23a62f3a-c12a9ba9198mr177161866b.0.1782948732444; Wed, 01 Jul 2026
 16:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFTRC0=hdHvug9=JyiZ=XYowdpqp9TAgXbq0YpDOEnzmQUWxzQ@mail.gmail.com>
 <2026070140-segment-schematic-0a38@gregkh>
In-Reply-To: <2026070140-segment-schematic-0a38@gregkh>
From: sdj asj <sdjasjbuaa@gmail.com>
Date: Thu, 2 Jul 2026 07:34:13 +0800
X-Gm-Features: AVVi8Cch7N2hDd21kWVko2dWmYAYAPlToFThimgAcOq9SHnpL0FdK5_1bQ4P5z8
Message-ID: <CAFTRC0npKw0pwHufN1ck8znkmJB90prND+r8_qAyWvkGt3iemg@mail.gmail.com>
Subject: Re: [stable] Please backport ntfs3: reject direct userspace writes to
 reserved $LX* xattrs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, ntfs3@lists.linux.dev, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, 5.15.y and newer are the branches I meant.

ntfs3 was introduced in Linux 5.15, so 5.10.y should not contain the
vulnerable ntfs3 code and does not need this patch.

Thanks for applying it.

Best regards,
Zhen

On Wed, Jul 1, 2026 at 9:36=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Jul 01, 2026 at 08:27:36PM +0800, sdj asj wrote:
> > Hello stable team,
> >
> > Please consider picking up the following upstream commit for supported
> > stable trees where it applies:
> >
> > 5b08dccecf825cbf905f348bc6ccb497507e28e2
> > ntfs3: reject direct userspace writes to reserved $LX* xattrs
> >
> > Reason for stable:
> >
> > This fixes a user-visible security issue in ntfs3. Before this change,
> > the empty-prefix xattr handler allowed an unprivileged file owner on a
> > writable ntfs3 mount to set the reserved $LXUID, $LXGID and $LXMOD
> > extended attributes directly. These attributes are later trusted by
> > ntfs_get_wsl_perm() during inode reload and used to populate i_uid,
> > i_gid and i_mode.
> >
> > As a result, an unprivileged user can create a file that becomes
> > root-owned and SUID after inode reload. The issue is reproducible
> > using normal syscalls only and does not require a malformed filesystem
> > image.
> >
> > The upstream fix prevents non-privileged users from directly writing
> > these reserved $LX* attributes, while keeping internal ntfs3 metadata
> > updates working.
> >
> > The original issue no longer reproduces with the upstream fix applied.
> >
> > Please apply this to supported stable branches that contain the
> > vulnerable ntfs3 code.
>
> What branches are that?  I've applied this to 5.15.y and newer, but it
> didn't apply to 5.10.y.
>
> thanks,
>
> greg k-h
