Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4B3EC826
	for <ntfs3@lists.linux.dev>; Fri,  4 Sep 2026 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513151; cv=none; b=ixDdT848EzHCaq20e6cTwkyRwxLbcnlSRSZTT2nq4npEhlEwT7pj2bqKeyz0w2xHCXTcV3G/r608L5VLEvnZ68a1Zh14Ziy/aZ1mNOG03P5+3CovJwkIZURvRZZCEGBSon/Hq+1qivSbM70A9PtJ8N+S6N5lCHh2ruuq+zlUWcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513151; c=relaxed/simple;
	bh=F1zepebgNPnfi3e3NPKagzy1JV/VWdxKlaar6/23C6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KppFvM4AEXbx0Gp+Yt1C0t/ZaRo1z54ZDOQpkTCcbzf3W5L8Z7XT98f1SPIdyVaJxussBf5+L6+vSpd+94QRGaNZRGZZV5T8Ge3eMyHzm+OK8hHxRPyKSF5zMEWB/qnp67dnpV9z+BeRc9Kyt1Mp7FNXx/f9cDnOW+O2vr0LQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vvoi/ArV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vvoi/ArV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843f205a5bso493025f8f.1
        for <ntfs3@lists.linux.dev>; Fri, 04 Sep 2026 02:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513148; x=1789117948; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LyM2dDVsIs4gNBkgpufM53paS3aQIrobm71GlbtzGBc=;
        b=Vvoi/ArV8zuFjAHkA8CncCa7pPSHLzn4wwQRwqFwSM+Z1CA+wpOD1zSRlzxxMNIJcu
         agYIHs3V7kkg3tjxEhbXKOHbLVsionwOzfS/ABwcr21ezHNndxObD3IY1ZihYc9R/rad
         v/zgnKS3qPuFd8HTDKBVgx3TwN1UOwUVSMNQS9tRIqVc/cR+5VucIQO5Ikqe5EKebWSL
         DsSLwRIp9sy4G/x+KfvoefnpnCgtcRNi3zesR8cNWuCw+B2Gb1HGQA1+GlqmUlfsNCBn
         ge7Wnvx5zWEOzSTP5wKGIDozWfbkfQHsneYKcUMm76a3I0JR7N9KoDZOW5WpCNgYbofQ
         NNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513148; x=1789117948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyM2dDVsIs4gNBkgpufM53paS3aQIrobm71GlbtzGBc=;
        b=q630OlrapmKOWC5NzDh8bqxHW8WsnTsC7wG43bXX2qBm5cHkgpUVTv0Ax9ZvJ8Huvq
         qS0z21RbKX2WABfv4pIiwDsxaO7FwzCG790xVrKM6K5sWz1AnaHEqlaScboU8IFjP8zO
         SMmkAE8N/fEpEKO30dknlNgaHFxWQN8SbAxoXGloh5/V1YLLzfhKJGds47uK36Wsd+Cb
         qoxvLkxxZ9mORoegzbGh1uboetCmkRgYjOCI4hDKMK9QLUlZXcTIrshuHH7pYtFNp5i3
         QaUmzxEd/U6Zf4WBSpRZna7VOZ1XrpyRw1382tGa0H/EdhnrRYL9KMfDGYh4d0ukqk1K
         /5+A==
X-Forwarded-Encrypted: i=1; AKwUvBx7Ui7pxxKaBZYXxCS+sNwYQBf1NE/WjsrLu1GvvHC56rF0gnhUMymn1wRrVKTLoe2pUbWJMQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lhmrHKDO9j8mvCCnlxdhPPLpzFjR1+xGuxtMDFPZItoz2UX+I3
	mtmWmLXBg0U8/L+DeQuQk6pwyk9uzewwR1ILpeZv15SOhIftyJGB8QDC
X-Gm-Gg: AYBFou0zvSI0UBF3azvwovey+GtyHL2qF9wudsSYJ3eKVMsicw4A/xRJM2hb825Ij17
	UJJGeaa8PY1FMZT7JrxTqYcJKnOhPyFodY5xv4atJFHdwyuWDuj7VBH6z1jI2QUNks76JVf/C6B
	E7MY8UL1GvK2n7v7zBukmGVQ2MxTMTsBXDeepA2+ZaXHPhue/iLNBsIUfY7mDX1FsCJnYm63lwq
	BopvUqchTnOg7TMiTA+54U5zaqKnSGapLfk1A+eP0Tf32KuItWkGEwmLA+shvPYuNTZHuJe2f3v
	dY+FIW7JsQdbRvV/tPbS9U49ED4j8wC0a4LBcsvR/MuqFSd4/p7hZkgbQkGNizWYEtbrrFYRis8
	h5vGpceEyEIo8wMuavVLRWPlnlS6j6m48aOWQwxfah46mMl4z/Xa9RwsOnZ0jEdHo0foOnBUE68
	kv3IlDlMfvSQzJGURy+PTIx0TPFH4bHW16wqOQ0TLhHEpCebBuTazD9cho+9HJLa7mhdFiUsXJ4
	YLVwCCc+3Mvb1OaoiTA/zk=
X-Received: by 2002:a05:6000:490e:b0:485:8a46:b3bc with SMTP id ffacd0b85a97d-4858a46b4b8mr3125770f8f.36.1788513148015;
        Fri, 04 Sep 2026 02:12:28 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm5239412f8f.10.2026.09.04.02.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:12:27 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 2B821BE2DE0; Fri, 04 Sep 2026 11:12:26 +0200 (CEST)
Date: Fri, 4 Sep 2026 11:12:26 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: vova tokarev <vladimirelitokarev@gmail.com>
Cc: almaz.alexandrovich@paragon-software.com, security@kernel.org,
	ntfs3@lists.linux.dev
Subject: Re: Fwd: InjectionBunny: NTFS3 SUID injection leading to local
 privilege escalation
Message-ID: <apqLejWrecEZkyhw@eldamar.lan>
References: <CAGBKPgMqBMsBH4mm2fwggA8rJZ3R15nPxuEh0emOeVpX2kgHPA@mail.gmail.com>
 <CAGBKPgPiXyKWtjgYSACnugmG1XPs=mPg-Zu-xQziUZ1k921+qA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ntfs3@lists.linux.dev
List-Id: <ntfs3.lists.linux.dev>
List-Subscribe: <mailto:ntfs3+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ntfs3+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGBKPgPiXyKWtjgYSACnugmG1XPs=mPg-Zu-xQziUZ1k921+qA@mail.gmail.com>

Hi Vladimir,

On Fri, Aug 07, 2026 at 01:39:35PM +0300, vova tokarev wrote:
> Hi,
> 
> It's been almost two months since I reported this, and I haven't heard
> back. I recently learned I should reach out to the subsystem maintainer
> directly, so forwarding this to you.
> 
> I noticed that CVE-2026-63833 (commit f8d420949b33) was assigned and
> merged for a related issue -- blocking setxattr() writes to $LX*
> names. However, this only fixes one of the two attack vectors I
> reported. The primary vector in my original report remains open:
> 
> A pre-crafted NTFS image (e.g. USB drive) with $LXUID=0, $LXGID=0,
> $LXMOD=0104755 already in the MFT produces a setuid-root binary the
> moment the volume is mounted. No setxattr() is involved -- the EAs
> are on disk. The -EPERM check doesn't help.
> 
> The root cause is still at fs/ntfs3/xattr.c:1022:
> 
>     inode->i_mode = le32_to_cpu(value[2]);
> 
> This loads S_ISUID/S_ISGID directly from untrusted on-disk data.
> Desktop automounters (udisks) mount NTFS with suid by default, so
> plugging in a crafted USB gives any local user euid=0.
> 
> Suggested one-line fix:
> 
> -   inode->i_mode = le32_to_cpu(value[2]);
> +   inode->i_mode = le32_to_cpu(value[2]) & ~(S_ISUID | S_ISGID);
> 
> I have a full PoC and working demo (included in my original report
> below). Would love to hear your thoughts.

AFAICS, this did not got a patch yet. Would you mind submitting a
patch to Konstantin? I'm adding Konstantin Komarov explicitly to this
thread.

Konstantin, context from
https://lore.kernel.org/ntfs3/CAGBKPgPiXyKWtjgYSACnugmG1XPs=mPg-Zu-xQziUZ1k921+qA@mail.gmail.com/
.

Regards,
Salvatore
